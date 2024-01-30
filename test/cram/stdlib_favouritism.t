  $ mkdir docs
Generating odocls for base with odig. This might give an error on some
dependencies so we do not display error (one was encountered with yojson)
  $ odig odoc --cache-dir=docs ocaml 2> /dev/null
  Updating documentation, this may take some time...

  $ export ODOCLS=$(find ./docs/odoc/ocaml/ -name '*.odocl' | sort)
  $ echo $ODOCLS | tr ' ' '\n'
  ./docs/odoc/ocaml/arith_status.odocl
  ./docs/odoc/ocaml/big_int.odocl
  ./docs/odoc/ocaml/bigarray.odocl
  ./docs/odoc/ocaml/camlinternalAtomic.odocl
  ./docs/odoc/ocaml/camlinternalFormat.odocl
  ./docs/odoc/ocaml/camlinternalFormatBasics.odocl
  ./docs/odoc/ocaml/camlinternalLazy.odocl
  ./docs/odoc/ocaml/camlinternalMod.odocl
  ./docs/odoc/ocaml/camlinternalOO.odocl
  ./docs/odoc/ocaml/compiler-libs/CSE.odocl
  ./docs/odoc/ocaml/compiler-libs/CSEgen.odocl
  ./docs/odoc/ocaml/compiler-libs/afl_instrument.odocl
  ./docs/odoc/ocaml/compiler-libs/alias_analysis.odocl
  ./docs/odoc/ocaml/compiler-libs/allocated_const.odocl
  ./docs/odoc/ocaml/compiler-libs/annot.odocl
  ./docs/odoc/ocaml/compiler-libs/arch.odocl
  ./docs/odoc/ocaml/compiler-libs/arg_helper.odocl
  ./docs/odoc/ocaml/compiler-libs/asmgen.odocl
  ./docs/odoc/ocaml/compiler-libs/asmlibrarian.odocl
  ./docs/odoc/ocaml/compiler-libs/asmlink.odocl
  ./docs/odoc/ocaml/compiler-libs/asmpackager.odocl
  ./docs/odoc/ocaml/compiler-libs/ast_helper.odocl
  ./docs/odoc/ocaml/compiler-libs/ast_invariants.odocl
  ./docs/odoc/ocaml/compiler-libs/ast_iterator.odocl
  ./docs/odoc/ocaml/compiler-libs/ast_mapper.odocl
  ./docs/odoc/ocaml/compiler-libs/asttypes.odocl
  ./docs/odoc/ocaml/compiler-libs/attr_helper.odocl
  ./docs/odoc/ocaml/compiler-libs/augment_specialised_args.odocl
  ./docs/odoc/ocaml/compiler-libs/backend_intf.odocl
  ./docs/odoc/ocaml/compiler-libs/backend_var.odocl
  ./docs/odoc/ocaml/compiler-libs/binutils.odocl
  ./docs/odoc/ocaml/compiler-libs/branch_relaxation.odocl
  ./docs/odoc/ocaml/compiler-libs/branch_relaxation_intf.odocl
  ./docs/odoc/ocaml/compiler-libs/btype.odocl
  ./docs/odoc/ocaml/compiler-libs/build_export_info.odocl
  ./docs/odoc/ocaml/compiler-libs/build_path_prefix_map.odocl
  ./docs/odoc/ocaml/compiler-libs/builtin_attributes.odocl
  ./docs/odoc/ocaml/compiler-libs/bytegen.odocl
  ./docs/odoc/ocaml/compiler-libs/bytelibrarian.odocl
  ./docs/odoc/ocaml/compiler-libs/bytelink.odocl
  ./docs/odoc/ocaml/compiler-libs/bytepackager.odocl
  ./docs/odoc/ocaml/compiler-libs/bytesections.odocl
  ./docs/odoc/ocaml/compiler-libs/camlinternalMenhirLib.odocl
  ./docs/odoc/ocaml/compiler-libs/ccomp.odocl
  ./docs/odoc/ocaml/compiler-libs/clambda.odocl
  ./docs/odoc/ocaml/compiler-libs/clambda_primitives.odocl
  ./docs/odoc/ocaml/compiler-libs/clflags.odocl
  ./docs/odoc/ocaml/compiler-libs/closure.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_conversion.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_conversion_aux.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_element.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_id.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_middle_end.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_offsets.odocl
  ./docs/odoc/ocaml/compiler-libs/closure_origin.odocl
  ./docs/odoc/ocaml/compiler-libs/cmi_format.odocl
  ./docs/odoc/ocaml/compiler-libs/cmm.odocl
  ./docs/odoc/ocaml/compiler-libs/cmm_helpers.odocl
  ./docs/odoc/ocaml/compiler-libs/cmm_invariants.odocl
  ./docs/odoc/ocaml/compiler-libs/cmmgen.odocl
  ./docs/odoc/ocaml/compiler-libs/cmmgen_state.odocl
  ./docs/odoc/ocaml/compiler-libs/cmo_format.odocl
  ./docs/odoc/ocaml/compiler-libs/cmt2annot.odocl
  ./docs/odoc/ocaml/compiler-libs/cmt_format.odocl
  ./docs/odoc/ocaml/compiler-libs/cmx_format.odocl
  ./docs/odoc/ocaml/compiler-libs/cmxs_format.odocl
  ./docs/odoc/ocaml/compiler-libs/coloring.odocl
  ./docs/odoc/ocaml/compiler-libs/comballoc.odocl
  ./docs/odoc/ocaml/compiler-libs/compenv.odocl
  ./docs/odoc/ocaml/compiler-libs/compilation_unit.odocl
  ./docs/odoc/ocaml/compiler-libs/compile.odocl
  ./docs/odoc/ocaml/compiler-libs/compile_common.odocl
  ./docs/odoc/ocaml/compiler-libs/compilenv.odocl
  ./docs/odoc/ocaml/compiler-libs/compmisc.odocl
  ./docs/odoc/ocaml/compiler-libs/config.odocl
  ./docs/odoc/ocaml/compiler-libs/consistbl.odocl
  ./docs/odoc/ocaml/compiler-libs/convert_primitives.odocl
  ./docs/odoc/ocaml/compiler-libs/ctype.odocl
  ./docs/odoc/ocaml/compiler-libs/dataflow.odocl
  ./docs/odoc/ocaml/compiler-libs/datarepr.odocl
  ./docs/odoc/ocaml/compiler-libs/deadcode.odocl
  ./docs/odoc/ocaml/compiler-libs/debuginfo.odocl
  ./docs/odoc/ocaml/compiler-libs/depend.odocl
  ./docs/odoc/ocaml/compiler-libs/diffing.odocl
  ./docs/odoc/ocaml/compiler-libs/diffing_with_keys.odocl
  ./docs/odoc/ocaml/compiler-libs/dll.odocl
  ./docs/odoc/ocaml/compiler-libs/docstrings.odocl
  ./docs/odoc/ocaml/compiler-libs/domainstate.odocl
  ./docs/odoc/ocaml/compiler-libs/effect_analysis.odocl
  ./docs/odoc/ocaml/compiler-libs/emit.odocl
  ./docs/odoc/ocaml/compiler-libs/emitaux.odocl
  ./docs/odoc/ocaml/compiler-libs/emitcode.odocl
  ./docs/odoc/ocaml/compiler-libs/emitenv.odocl
  ./docs/odoc/ocaml/compiler-libs/env.odocl
  ./docs/odoc/ocaml/compiler-libs/envaux.odocl
  ./docs/odoc/ocaml/compiler-libs/errors.odocl
  ./docs/odoc/ocaml/compiler-libs/errortrace.odocl
  ./docs/odoc/ocaml/compiler-libs/export_id.odocl
  ./docs/odoc/ocaml/compiler-libs/export_info.odocl
  ./docs/odoc/ocaml/compiler-libs/export_info_for_pack.odocl
  ./docs/odoc/ocaml/compiler-libs/expunge.odocl
  ./docs/odoc/ocaml/compiler-libs/extract_projections.odocl
  ./docs/odoc/ocaml/compiler-libs/find_recursive_functions.odocl
  ./docs/odoc/ocaml/compiler-libs/flambda.odocl
  ./docs/odoc/ocaml/compiler-libs/flambda_invariants.odocl
  ./docs/odoc/ocaml/compiler-libs/flambda_iterators.odocl
  ./docs/odoc/ocaml/compiler-libs/flambda_middle_end.odocl
  ./docs/odoc/ocaml/compiler-libs/flambda_to_clambda.odocl
  ./docs/odoc/ocaml/compiler-libs/flambda_utils.odocl
  ./docs/odoc/ocaml/compiler-libs/freshening.odocl
  ./docs/odoc/ocaml/compiler-libs/genprintval.odocl
  ./docs/odoc/ocaml/compiler-libs/id_types.odocl
  ./docs/odoc/ocaml/compiler-libs/ident.odocl
  ./docs/odoc/ocaml/compiler-libs/identifiable.odocl
  ./docs/odoc/ocaml/compiler-libs/import_approx.odocl
  ./docs/odoc/ocaml/compiler-libs/includeclass.odocl
  ./docs/odoc/ocaml/compiler-libs/includecore.odocl
  ./docs/odoc/ocaml/compiler-libs/includemod.odocl
  ./docs/odoc/ocaml/compiler-libs/includemod_errorprinter.odocl
  ./docs/odoc/ocaml/compiler-libs/inconstant_idents.odocl
  ./docs/odoc/ocaml/compiler-libs/initialize_symbol_to_let_symbol.odocl
  ./docs/odoc/ocaml/compiler-libs/inline_and_simplify.odocl
  ./docs/odoc/ocaml/compiler-libs/inline_and_simplify_aux.odocl
  ./docs/odoc/ocaml/compiler-libs/inlining_cost.odocl
  ./docs/odoc/ocaml/compiler-libs/inlining_decision.odocl
  ./docs/odoc/ocaml/compiler-libs/inlining_decision_intf.odocl
  ./docs/odoc/ocaml/compiler-libs/inlining_stats.odocl
  ./docs/odoc/ocaml/compiler-libs/inlining_stats_types.odocl
  ./docs/odoc/ocaml/compiler-libs/inlining_transforms.odocl
  ./docs/odoc/ocaml/compiler-libs/instruct.odocl
  ./docs/odoc/ocaml/compiler-libs/int_replace_polymorphic_compare.odocl
  ./docs/odoc/ocaml/compiler-libs/interf.odocl
  ./docs/odoc/ocaml/compiler-libs/internal_variable_names.odocl
  ./docs/odoc/ocaml/compiler-libs/interval.odocl
  ./docs/odoc/ocaml/compiler-libs/invariant_params.odocl
  ./docs/odoc/ocaml/compiler-libs/lambda.odocl
  ./docs/odoc/ocaml/compiler-libs/lazy_backtrack.odocl
  ./docs/odoc/ocaml/compiler-libs/lexer.odocl
  ./docs/odoc/ocaml/compiler-libs/lift_code.odocl
  ./docs/odoc/ocaml/compiler-libs/lift_constants.odocl
  ./docs/odoc/ocaml/compiler-libs/lift_let_to_initialize_symbol.odocl
  ./docs/odoc/ocaml/compiler-libs/linear.odocl
  ./docs/odoc/ocaml/compiler-libs/linear_format.odocl
  ./docs/odoc/ocaml/compiler-libs/linearize.odocl
  ./docs/odoc/ocaml/compiler-libs/linkage_name.odocl
  ./docs/odoc/ocaml/compiler-libs/linscan.odocl
  ./docs/odoc/ocaml/compiler-libs/liveness.odocl
  ./docs/odoc/ocaml/compiler-libs/load_path.odocl
  ./docs/odoc/ocaml/compiler-libs/local_store.odocl
  ./docs/odoc/ocaml/compiler-libs/location.odocl
  ./docs/odoc/ocaml/compiler-libs/longident.odocl
  ./docs/odoc/ocaml/compiler-libs/mach.odocl
  ./docs/odoc/ocaml/compiler-libs/main.odocl
  ./docs/odoc/ocaml/compiler-libs/main_args.odocl
  ./docs/odoc/ocaml/compiler-libs/maindriver.odocl
  ./docs/odoc/ocaml/compiler-libs/makedepend.odocl
  ./docs/odoc/ocaml/compiler-libs/matching.odocl
  ./docs/odoc/ocaml/compiler-libs/meta.odocl
  ./docs/odoc/ocaml/compiler-libs/misc.odocl
  ./docs/odoc/ocaml/compiler-libs/mtype.odocl
  ./docs/odoc/ocaml/compiler-libs/mutable_variable.odocl
  ./docs/odoc/ocaml/compiler-libs/numbers.odocl
  ./docs/odoc/ocaml/compiler-libs/opcodes.odocl
  ./docs/odoc/ocaml/compiler-libs/oprint.odocl
  ./docs/odoc/ocaml/compiler-libs/optcompile.odocl
  ./docs/odoc/ocaml/compiler-libs/opterrors.odocl
  ./docs/odoc/ocaml/compiler-libs/optmain.odocl
  ./docs/odoc/ocaml/compiler-libs/optmaindriver.odocl
  ./docs/odoc/ocaml/compiler-libs/outcometree.odocl
  ./docs/odoc/ocaml/compiler-libs/parameter.odocl
  ./docs/odoc/ocaml/compiler-libs/parmatch.odocl
  ./docs/odoc/ocaml/compiler-libs/parse.odocl
  ./docs/odoc/ocaml/compiler-libs/parser.odocl
  ./docs/odoc/ocaml/compiler-libs/parsetree.odocl
  ./docs/odoc/ocaml/compiler-libs/pass_wrapper.odocl
  ./docs/odoc/ocaml/compiler-libs/path.odocl
  ./docs/odoc/ocaml/compiler-libs/patterns.odocl
  ./docs/odoc/ocaml/compiler-libs/persistent_env.odocl
  ./docs/odoc/ocaml/compiler-libs/polling.odocl
  ./docs/odoc/ocaml/compiler-libs/pparse.odocl
  ./docs/odoc/ocaml/compiler-libs/pprintast.odocl
  ./docs/odoc/ocaml/compiler-libs/predef.odocl
  ./docs/odoc/ocaml/compiler-libs/primitive.odocl
  ./docs/odoc/ocaml/compiler-libs/printast.odocl
  ./docs/odoc/ocaml/compiler-libs/printclambda.odocl
  ./docs/odoc/ocaml/compiler-libs/printclambda_primitives.odocl
  ./docs/odoc/ocaml/compiler-libs/printcmm.odocl
  ./docs/odoc/ocaml/compiler-libs/printinstr.odocl
  ./docs/odoc/ocaml/compiler-libs/printlambda.odocl
  ./docs/odoc/ocaml/compiler-libs/printlinear.odocl
  ./docs/odoc/ocaml/compiler-libs/printmach.odocl
  ./docs/odoc/ocaml/compiler-libs/printpat.odocl
  ./docs/odoc/ocaml/compiler-libs/printtyp.odocl
  ./docs/odoc/ocaml/compiler-libs/printtyped.odocl
  ./docs/odoc/ocaml/compiler-libs/proc.odocl
  ./docs/odoc/ocaml/compiler-libs/profile.odocl
  ./docs/odoc/ocaml/compiler-libs/projection.odocl
  ./docs/odoc/ocaml/compiler-libs/rec_check.odocl
  ./docs/odoc/ocaml/compiler-libs/ref_to_variables.odocl
  ./docs/odoc/ocaml/compiler-libs/reg.odocl
  ./docs/odoc/ocaml/compiler-libs/reload.odocl
  ./docs/odoc/ocaml/compiler-libs/reloadgen.odocl
  ./docs/odoc/ocaml/compiler-libs/remove_free_vars_equal_to_args.odocl
  ./docs/odoc/ocaml/compiler-libs/remove_unused_arguments.odocl
  ./docs/odoc/ocaml/compiler-libs/remove_unused_closure_vars.odocl
  ./docs/odoc/ocaml/compiler-libs/remove_unused_program_constructs.odocl
  ./docs/odoc/ocaml/compiler-libs/runtimedef.odocl
  ./docs/odoc/ocaml/compiler-libs/schedgen.odocl
  ./docs/odoc/ocaml/compiler-libs/scheduling.odocl
  ./docs/odoc/ocaml/compiler-libs/selectgen.odocl
  ./docs/odoc/ocaml/compiler-libs/selection.odocl
  ./docs/odoc/ocaml/compiler-libs/semantics_of_primitives.odocl
  ./docs/odoc/ocaml/compiler-libs/set_of_closures_id.odocl
  ./docs/odoc/ocaml/compiler-libs/set_of_closures_origin.odocl
  ./docs/odoc/ocaml/compiler-libs/shape.odocl
  ./docs/odoc/ocaml/compiler-libs/share_constants.odocl
  ./docs/odoc/ocaml/compiler-libs/signature_group.odocl
  ./docs/odoc/ocaml/compiler-libs/simple_value_approx.odocl
  ./docs/odoc/ocaml/compiler-libs/simplif.odocl
  ./docs/odoc/ocaml/compiler-libs/simplify_boxed_integer_ops.odocl
  ./docs/odoc/ocaml/compiler-libs/simplify_boxed_integer_ops_intf.odocl
  ./docs/odoc/ocaml/compiler-libs/simplify_common.odocl
  ./docs/odoc/ocaml/compiler-libs/simplify_primitives.odocl
  ./docs/odoc/ocaml/compiler-libs/spill.odocl
  ./docs/odoc/ocaml/compiler-libs/split.odocl
  ./docs/odoc/ocaml/compiler-libs/static_exception.odocl
  ./docs/odoc/ocaml/compiler-libs/strmatch.odocl
  ./docs/odoc/ocaml/compiler-libs/strongly_connected_components.odocl
  ./docs/odoc/ocaml/compiler-libs/stypes.odocl
  ./docs/odoc/ocaml/compiler-libs/subst.odocl
  ./docs/odoc/ocaml/compiler-libs/switch.odocl
  ./docs/odoc/ocaml/compiler-libs/symbol.odocl
  ./docs/odoc/ocaml/compiler-libs/symtable.odocl
  ./docs/odoc/ocaml/compiler-libs/syntaxerr.odocl
  ./docs/odoc/ocaml/compiler-libs/tag.odocl
  ./docs/odoc/ocaml/compiler-libs/targetint.odocl
  ./docs/odoc/ocaml/compiler-libs/tast_iterator.odocl
  ./docs/odoc/ocaml/compiler-libs/tast_mapper.odocl
  ./docs/odoc/ocaml/compiler-libs/terminfo.odocl
  ./docs/odoc/ocaml/compiler-libs/tmc.odocl
  ./docs/odoc/ocaml/compiler-libs/topcommon.odocl
  ./docs/odoc/ocaml/compiler-libs/topdirs.odocl
  ./docs/odoc/ocaml/compiler-libs/topeval.odocl
  ./docs/odoc/ocaml/compiler-libs/tophooks.odocl
  ./docs/odoc/ocaml/compiler-libs/toploop.odocl
  ./docs/odoc/ocaml/compiler-libs/topmain.odocl
  ./docs/odoc/ocaml/compiler-libs/topstart.odocl
  ./docs/odoc/ocaml/compiler-libs/trace.odocl
  ./docs/odoc/ocaml/compiler-libs/translattribute.odocl
  ./docs/odoc/ocaml/compiler-libs/translclass.odocl
  ./docs/odoc/ocaml/compiler-libs/translcore.odocl
  ./docs/odoc/ocaml/compiler-libs/translmod.odocl
  ./docs/odoc/ocaml/compiler-libs/translobj.odocl
  ./docs/odoc/ocaml/compiler-libs/translprim.odocl
  ./docs/odoc/ocaml/compiler-libs/traverse_for_exported_symbols.odocl
  ./docs/odoc/ocaml/compiler-libs/type_immediacy.odocl
  ./docs/odoc/ocaml/compiler-libs/typeclass.odocl
  ./docs/odoc/ocaml/compiler-libs/typecore.odocl
  ./docs/odoc/ocaml/compiler-libs/typedecl.odocl
  ./docs/odoc/ocaml/compiler-libs/typedecl_immediacy.odocl
  ./docs/odoc/ocaml/compiler-libs/typedecl_properties.odocl
  ./docs/odoc/ocaml/compiler-libs/typedecl_separability.odocl
  ./docs/odoc/ocaml/compiler-libs/typedecl_unboxed.odocl
  ./docs/odoc/ocaml/compiler-libs/typedecl_variance.odocl
  ./docs/odoc/ocaml/compiler-libs/typedtree.odocl
  ./docs/odoc/ocaml/compiler-libs/typemod.odocl
  ./docs/odoc/ocaml/compiler-libs/typeopt.odocl
  ./docs/odoc/ocaml/compiler-libs/types.odocl
  ./docs/odoc/ocaml/compiler-libs/typetexp.odocl
  ./docs/odoc/ocaml/compiler-libs/un_anf.odocl
  ./docs/odoc/ocaml/compiler-libs/unbox_closures.odocl
  ./docs/odoc/ocaml/compiler-libs/unbox_free_vars_of_closures.odocl
  ./docs/odoc/ocaml/compiler-libs/unbox_specialised_args.odocl
  ./docs/odoc/ocaml/compiler-libs/untypeast.odocl
  ./docs/odoc/ocaml/compiler-libs/var_within_closure.odocl
  ./docs/odoc/ocaml/compiler-libs/variable.odocl
  ./docs/odoc/ocaml/compiler-libs/warnings.odocl
  ./docs/odoc/ocaml/compiler-libs/x86_ast.odocl
  ./docs/odoc/ocaml/compiler-libs/x86_dsl.odocl
  ./docs/odoc/ocaml/compiler-libs/x86_gas.odocl
  ./docs/odoc/ocaml/compiler-libs/x86_masm.odocl
  ./docs/odoc/ocaml/compiler-libs/x86_proc.odocl
  ./docs/odoc/ocaml/dynlink.odocl
  ./docs/odoc/ocaml/nat.odocl
  ./docs/odoc/ocaml/num.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_analyse.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_args.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_ast.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_class.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_comments.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_comments_global.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_config.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_control.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_cross.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_dag2html.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_dep.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_dot.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_env.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_exception.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_extension.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_gen.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_global.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_html.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_info.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_inherit.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_latex.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_latex_style.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_lexer.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_man.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_merge.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_messages.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_misc.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_module.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_name.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_ocamlhtml.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_parameter.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_parser.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_print.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_scan.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_search.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_see_lexer.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_sig.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_str.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_test.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_texi.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_text.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_text_lexer.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_text_parser.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_to_text.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_type.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_types.odocl
  ./docs/odoc/ocaml/ocamldoc/odoc_value.odocl
  ./docs/odoc/ocaml/page-index.odocl
  ./docs/odoc/ocaml/profiling.odocl
  ./docs/odoc/ocaml/ratio.odocl
  ./docs/odoc/ocaml/std_exit.odocl
  ./docs/odoc/ocaml/stdlib.odocl
  ./docs/odoc/ocaml/stdlib__Arg.odocl
  ./docs/odoc/ocaml/stdlib__Array.odocl
  ./docs/odoc/ocaml/stdlib__ArrayLabels.odocl
  ./docs/odoc/ocaml/stdlib__Atomic.odocl
  ./docs/odoc/ocaml/stdlib__Bigarray.odocl
  ./docs/odoc/ocaml/stdlib__Bool.odocl
  ./docs/odoc/ocaml/stdlib__Buffer.odocl
  ./docs/odoc/ocaml/stdlib__Bytes.odocl
  ./docs/odoc/ocaml/stdlib__BytesLabels.odocl
  ./docs/odoc/ocaml/stdlib__Callback.odocl
  ./docs/odoc/ocaml/stdlib__Char.odocl
  ./docs/odoc/ocaml/stdlib__Complex.odocl
  ./docs/odoc/ocaml/stdlib__Digest.odocl
  ./docs/odoc/ocaml/stdlib__Either.odocl
  ./docs/odoc/ocaml/stdlib__Ephemeron.odocl
  ./docs/odoc/ocaml/stdlib__Filename.odocl
  ./docs/odoc/ocaml/stdlib__Float.odocl
  ./docs/odoc/ocaml/stdlib__Format.odocl
  ./docs/odoc/ocaml/stdlib__Fun.odocl
  ./docs/odoc/ocaml/stdlib__Gc.odocl
  ./docs/odoc/ocaml/stdlib__Genlex.odocl
  ./docs/odoc/ocaml/stdlib__Hashtbl.odocl
  ./docs/odoc/ocaml/stdlib__In_channel.odocl
  ./docs/odoc/ocaml/stdlib__Int.odocl
  ./docs/odoc/ocaml/stdlib__Int32.odocl
  ./docs/odoc/ocaml/stdlib__Int64.odocl
  ./docs/odoc/ocaml/stdlib__Lazy.odocl
  ./docs/odoc/ocaml/stdlib__Lexing.odocl
  ./docs/odoc/ocaml/stdlib__List.odocl
  ./docs/odoc/ocaml/stdlib__ListLabels.odocl
  ./docs/odoc/ocaml/stdlib__Map.odocl
  ./docs/odoc/ocaml/stdlib__Marshal.odocl
  ./docs/odoc/ocaml/stdlib__MoreLabels.odocl
  ./docs/odoc/ocaml/stdlib__Nativeint.odocl
  ./docs/odoc/ocaml/stdlib__Obj.odocl
  ./docs/odoc/ocaml/stdlib__Oo.odocl
  ./docs/odoc/ocaml/stdlib__Option.odocl
  ./docs/odoc/ocaml/stdlib__Out_channel.odocl
  ./docs/odoc/ocaml/stdlib__Parsing.odocl
  ./docs/odoc/ocaml/stdlib__Pervasives.odocl
  ./docs/odoc/ocaml/stdlib__Printexc.odocl
  ./docs/odoc/ocaml/stdlib__Printf.odocl
  ./docs/odoc/ocaml/stdlib__Queue.odocl
  ./docs/odoc/ocaml/stdlib__Random.odocl
  ./docs/odoc/ocaml/stdlib__Result.odocl
  ./docs/odoc/ocaml/stdlib__Scanf.odocl
  ./docs/odoc/ocaml/stdlib__Seq.odocl
  ./docs/odoc/ocaml/stdlib__Set.odocl
  ./docs/odoc/ocaml/stdlib__Stack.odocl
  ./docs/odoc/ocaml/stdlib__StdLabels.odocl
  ./docs/odoc/ocaml/stdlib__Stream.odocl
  ./docs/odoc/ocaml/stdlib__String.odocl
  ./docs/odoc/ocaml/stdlib__StringLabels.odocl
  ./docs/odoc/ocaml/stdlib__Sys.odocl
  ./docs/odoc/ocaml/stdlib__Uchar.odocl
  ./docs/odoc/ocaml/stdlib__Unit.odocl
  ./docs/odoc/ocaml/stdlib__Weak.odocl
  ./docs/odoc/ocaml/str.odocl
  ./docs/odoc/ocaml/threads/condition.odocl
  ./docs/odoc/ocaml/threads/event.odocl
  ./docs/odoc/ocaml/threads/mutex.odocl
  ./docs/odoc/ocaml/threads/semaphore.odocl
  ./docs/odoc/ocaml/threads/thread.odocl
  ./docs/odoc/ocaml/threads/threadUnix.odocl
  ./docs/odoc/ocaml/topdirs.odocl
  ./docs/odoc/ocaml/unix.odocl
  ./docs/odoc/ocaml/unixLabels.odocl


  $ export SHERLODOC_DB=db.bin
  $ export SHERLODOC_FORMAT=marshal
  $ sherlodoc index $(find ./docs/odoc/ocaml/ -name "*.odocl") > /dev/null
  $ sherlodoc search --print-cost "list"
  56 mod Stdlib.List
  58 cons Stdlib.List.t.[] : 'a t
  60 val Stdlib.List.hd : 'a list -> 'a
  64 val Stdlib.Stream.of_list : 'a list -> 'a t
  65 val Stdlib.List.tl : 'a list -> 'a list
  65 val Stdlib.List.length : 'a list -> int
  66 val Stdlib.List.rev : 'a list -> 'a list
  67 val Stdlib.Array.of_list : 'a list -> 'a array
  67 val Stdlib.Array.to_list : 'a array -> 'a list
  68 val Stdlib.List.nth : 'a list -> int -> 'a
  69 val Stdlib.List.mem : 'a -> 'a list -> bool
  69 val Stdlib.Option.to_list : 'a option -> 'a list
  70 val Stdlib.List.memq : 'a -> 'a list -> bool
  70 val Stdlib.List.of_seq : 'a Seq.t -> 'a list
  70 val Stdlib.List.to_seq : 'a list -> 'a Seq.t
  71 mod Stdlib.StdLabels.List
  73 val Stdlib.List.cons : 'a -> 'a list -> 'a list
  74 cons Stdlib.List.t.:: : 'a * 'a list -> 'a t
  74 val Stdlib.List.concat : 'a list list -> 'a list
  77 mod Stdlib.ListLabels
  79 cons Stdlib.ListLabels.t.[] : 'a t
  81 val Stdlib.ListLabels.hd : 'a list -> 'a
  86 val Stdlib.ListLabels.tl : 'a list -> 'a list
  86 val Stdlib.ListLabels.length : 'a list -> int
  87 val Stdlib.ListLabels.rev : 'a list -> 'a list
  $ sherlodoc search --print-cost "lexer"
  90 mod Lexer
  95 mod Odoc_lexer
  98 val Stdlib.Genlex.make_lexer : string list -> char Stream.t -> token Stream.t
  99 mod Odoc_see_lexer
  100 mod Odoc_text_lexer
  109 exn Lexer.Error : error * Location.t -> exn
  114 cons Lexer.error.Unterminated_string : error
  118 cons Lexer.error.Empty_character_literal : error
  120 cons Lexer.error.Invalid_literal : string -> error
  120 cons Lexer.error.Illegal_character : char -> error
  121 cons Lexer.error.Keyword_as_label : string -> error
  129 cons Lexer.error.Unterminated_comment : Location.t -> error
  135 cons Lexer.error.Illegal_escape : string * string option -> error
  138 cons Lexer.error.Invalid_directive : string * string option -> error
  138 cons Lexer.error.Reserved_sequence : string * string option -> error
  141 mod CamlinternalMenhirLib.LexerUtil
  152 cons Lexer.error.Unterminated_string_in_comment : Location.t * Location.t -> error
  195 val Lexer.init : unit -> unit
  195 val Odoc_lexer.blank : string
  200 val Lexer.in_string : unit -> bool
  200 val Odoc_text_lexer.blank : string
  201 val Lexer.in_comment : unit -> bool
  201 val Lexer.print_warnings : bool ref
  202 val Odoc_lexer.line_number : int ref
  204 val Lexer.handle_docstrings : bool ref
  $ sherlodoc index --favour-stdlib=false $(find ./docs/odoc/ocaml/ -name "*.odocl") > /dev/null
  $ sherlodoc search --print-cost "list"
  106 mod Stdlib.List
  106 val Reg.Set.of_list : elt list -> t
  107 val Path.Set.of_list : elt list -> t
  108 cons Stdlib.List.t.[] : 'a t
  109 mod Parameter.List
  110 val Stdlib.List.hd : 'a list -> 'a
  113 type 'a Misc.Stdlib.List.t = 'a list
  114 val Unix.listen : file_descr -> int -> unit
  127 mod Stdlib.ListLabels
  129 cons Stdlib.ListLabels.t.[] : 'a t
  346 mod Stdlib
  347 mod Diffing
  354 val Longident.parse : string -> t
  354 cons Unix.error.E2BIG : error
  355 val Lambda.max_arity : unit -> int
  357 mod Diffing_with_keys
  358 val Dynlink.loadfile : string -> unit
  359 val Load_path.get : unit -> Dir.t list
  359 type Odoc_info.text = text_element list
  359 val Unix.getgroups : unit -> int array
  360 type 'a Stdlib.Seq.t = unit -> 'a node
  360 cons UnixLabels.error.E2BIG : error
  361 val Load_path.init : string list -> unit
  361 val Thread.wait_signal : int list -> int
  362 val Reg.Set.elements : t -> elt list
  $ sherlodoc search --print-cost "lexer"
  90 mod Lexer
  95 mod Odoc_lexer
  99 mod Odoc_see_lexer
  100 mod Odoc_text_lexer
  109 exn Lexer.Error : error * Location.t -> exn
  114 cons Lexer.error.Unterminated_string : error
  118 cons Lexer.error.Empty_character_literal : error
  120 cons Lexer.error.Invalid_literal : string -> error
  120 cons Lexer.error.Illegal_character : char -> error
  121 cons Lexer.error.Keyword_as_label : string -> error
  129 cons Lexer.error.Unterminated_comment : Location.t -> error
  135 cons Lexer.error.Illegal_escape : string * string option -> error
  138 cons Lexer.error.Invalid_directive : string * string option -> error
  138 cons Lexer.error.Reserved_sequence : string * string option -> error
  141 mod CamlinternalMenhirLib.LexerUtil
  148 val Stdlib.Genlex.make_lexer : string list -> char Stream.t -> token Stream.t
  152 cons Lexer.error.Unterminated_string_in_comment : Location.t * Location.t -> error
  195 val Lexer.init : unit -> unit
  195 val Odoc_lexer.blank : string
  200 val Lexer.in_string : unit -> bool
  200 val Odoc_text_lexer.blank : string
  201 val Lexer.in_comment : unit -> bool
  201 val Lexer.print_warnings : bool ref
  202 val Odoc_lexer.line_number : int ref
  204 val Lexer.handle_docstrings : bool ref
