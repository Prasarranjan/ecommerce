package entity;

public class type {
        private int typeId;
        private String typeName;

        // Constructor
        public type(int typeId, String typeName) {
            this.typeId = typeId;
            this.typeName = typeName;
        }

        // Getter for typeId
        public int getTypeId() {
            return typeId;
        }

        // Setter for typeId
        public void setTypeId(int typeId) {
            this.typeId = typeId;
        }

        // Getter for typeName
        public String getTypeName() {
            return typeName;
        }

        // Setter for typeName
        public void setTypeName(String typeName) {
            this.typeName = typeName;
        }

        // Optional: Override toString for easy display
        @Override
        public String toString() {
            return "Type [typeId=" + typeId + ", typeName=" + typeName + "]";
        }
    }


