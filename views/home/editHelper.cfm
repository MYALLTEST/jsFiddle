﻿<cfoutput>
<!--- Custom Javascript --->
<script type="text/javascript">
    /*
     * Update Fiddle
     */
    function updateFiddle( btn ) {
        var inputs = $( btn ).parent().prev().find( 'input' );
        prepareFiddle( inputs );
    } 
    
    /*
     * Common method to prepare fiddles for updating
     * @inputs - collection of inputs
     */
    function prepareFiddle( inputs ) {
        var vals = [],
            iframe = '';
        inputs.each(function() {
             if( this.type=='checkbox' ) {
                vals.push( this.checked ? true : false );
            }
            else {
                // add values to array
                vals.push( this.value );  
            }
        })
        if( vals[0]=='' ) {
            alert( 'Please enter a URL!' );
            return false;
        }
        sendEditorText( vals );
    }
    
    /**
     * Main method for sending data back to CKEditor to update an existing element
     * @param {Array} vals Array of values to update selected element with
     */
    function sendEditorText( vals ){
        var editor = $("###rc.editorName#").ckeditorGet(),
            element = editor.getSelection().getStartElement();
        // update element attributes and text
        element.setAttribute( 'src', vals[ 0 ] );
        element.setAttribute( 'height', vals[ 2 ] );
        element.setAttribute( 'width', vals[ 3 ] );
        element.setAttribute( 'result', vals[ 4 ] );
        element.setAttribute( 'js', vals[ 5 ] );
        element.setAttribute( 'resources', vals[ 6 ] );
        element.setAttribute( 'css', vals[ 7 ] );
        element.setAttribute( 'html', vals[ 8 ] );
        element.setText( vals[ 1 ] );
        // close modal window
    	closeRemoteModal();
    }
</script>
</cfoutput>