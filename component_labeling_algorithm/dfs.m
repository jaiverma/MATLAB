function img = dfs(I,i,j,colour)

stack = java.util.Stack();
[rows, cols] = size(I);

stack.push([i j]);

while ~stack.isEmpty
    v = stack.pop;
    x = v(1);
    y = v(2);
    if I(x,y) == 255
        I(x,y) = colour;
    
        if x+1 <= rows
            stack.push([x+1 y]);
        end
        if y+1 <= cols
            stack.push([x y+1]);
        end
        if x-1 >= 1
            stack.push([x-1 y]);
        end
        if y-1 >= 1
           stack.push([x y-1]);
        end
    end
end
img = I;