### Create a country Entity

## this clas must be a normal class

For example:

Must not be a Model bacause this can be generate a dependency from Data to UI layers

```
class Entity{
const Entity();
final String name;
}


class MyModel extends Entity{


  fromJson():
  toJson()
}


example:
Future<Entity>
```
