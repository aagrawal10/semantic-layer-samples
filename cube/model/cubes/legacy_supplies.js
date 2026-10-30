// A legacy JavaScript data model. SuperAgent does not execute JS models.
cube(`supplies`, {
  sql_table: `public.supplies`,
  measures: { count: { type: `count` } },
});
