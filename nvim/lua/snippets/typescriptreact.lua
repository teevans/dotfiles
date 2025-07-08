local ls = require("luasnip")
local s = ls.snippet
-- local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

return {
  s("rfc", fmt([[
    import React from 'react';

    interface [ComponentName]Props {

    }

    const [ComponentName] = ({}: [ComponentName]Props) => {{
      return (
        <div>
          [Content]
        </div>
      );
    }};

    export default [ComponentName];
  ]], {
    ComponentName = i(1, "ComponentName"),
    Content = i(2, "Content"),
  }, {
      delimiters = "[]",
      repeat_duplicates = true
  })),
  s("rfp", fmt([[
    import React from 'react';
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';

    interface [ComponentName]Props {

    }

    const [ComponentName] = ({}: [ComponentName]Props) => {{
      return (
        <AuthenticatedLayout breadcrumbs={}>
          <div className="container mx-auto p-10">
            <div className="mb-6 flex justify-between">
              [Content]
            </div>
          </div>
        </AuthenticatedLayout>
      );
    }};

    export default [ComponentName];
  ]], {
    ComponentName = i(1, "ComponentName"),
    Content = i(2, "Content"),
  }, {
      delimiters = "[]",
      repeat_duplicates = true
  })),
}
