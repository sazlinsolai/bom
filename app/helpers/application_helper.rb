# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def get_tree_data(tree, parent_id)
ret = "<div class='outer_tree_element' >"
tree.each do |node|
if node.parent_id == parent_id
#node.style = (@ancestors and @ancestors.include?(node.id))? 'display:inline' : 'display:none'
display_expanded = (@ancestors and @ancestors.include?(node.id))? 'inline' : 'none'
display_collapsed = (@ancestors and @ancestors.include?(node.id))? 'none' : 'inline'
ret += "<div class='inner_tree_element' id='#{node.id}_tree_div'>"
if node.children
ret += "<img id='#{node.id.to_s}expanded' src='/images/expanded.gif' onclick='javascript: return toggleMyTree(\"#{node.id}\"); ' style='display:#{display_expanded}; cursor:pointer;' /> "
#ret += "<img style='display:#{display_collapsed}; cursor:pointer;' id='#{node.id.to_s}collapsed' src='/images/collapsed.gif' onclick='javascript: return toggleMyTree(\"#{node.id.to_s}\"); ' /> "
end

ret += "<span id='#{node.id}_tree_item' class='inner_tree_element'>"
ret += yield node
ret += "</span>"
ret += "<span id='#{node.id}children' style='#{node.style}' >"
ret += get_tree_data(node.children, node.id){|n| yield n}
ret += "</span>"
ret += "</div>"
end
end
ret += "</div>"
return ret
end 
end

#custom tree view helper
def display_tree_recursive(tree, parent_id)
  ret = ""
tree.each do |node|
  if node.parent_id == parent_id
  ret += "<tr class='outer_tree_element'>"

  
  if node.children
    ret += "<td class='inner_tree_element'>"
  end
  
  ret += yield node
  ret += display_tree_recursive(node.children, node.id) { |n| yield n } unless node.children.size == 0
  ret += "</td>"
  end
  
end
  ret += "</tr>"

end

