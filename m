Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED304892BCB
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Mar 2024 16:20:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03DD12C5E;
	Sat, 30 Mar 2024 16:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03DD12C5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711812003;
	bh=GEyuCqFtlWe/bpbVadhF0Ali14UQ/4SHZX0YC0ZWbp8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BeP5orj5WUWfmHMUzytOrYu5kPStgMbmOn7tAMXVcKOfeEcYTLgaTabJEtUQgVyJI
	 of+Xs0AsFzTyo14z6Nvhxk1iL+cuc9gFnoNjJhGf5Q9ek/t6JLJtOoyFLUA+33DvzG
	 KV9lBFqWS2QqoGSg/dEcZwPYlfoYWnq38f2M6PfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30A99F80587; Sat, 30 Mar 2024 16:19:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DAB9F80587;
	Sat, 30 Mar 2024 16:19:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 979E6F8025F; Sat, 30 Mar 2024 16:19:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C87AF801EB
	for <alsa-devel@alsa-project.org>; Sat, 30 Mar 2024 16:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C87AF801EB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1711811951752117395-webhooks-bot@alsa-project.org>
References: <1711811951752117395-webhooks-bot@alsa-project.org>
Subject: Segmentation fault on Python 3.12
Message-Id: <20240330151923.979E6F8025F@alsa1.perex.cz>
Date: Sat, 30 Mar 2024 16:19:23 +0100 (CET)
Message-ID-Hash: TNFQOUKGWLX72YAF37VBZVCNNFSQZTP2
X-Message-ID-Hash: TNFQOUKGWLX72YAF37VBZVCNNFSQZTP2
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNFQOUKGWLX72YAF37VBZVCNNFSQZTP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-python issue #9 was opened from FrancescoCeruti:

When using Python 3.12, I'm getting a segmentation fault, by simply importing the `alsasq` module (`from pyalsa import alsaseq`)

Not sure if this it's the same as #8, here's the backtrace:

```
(gdb) bt
#0  __memset_avx512_unaligned_erms () at ../sysdeps/x86_64/multiarch/memset-vec-unaligned-erms.S:216
#1  0x00007ffff79e6122 in _PyType_AllocNoTrack (nitems=1, type=0x7ffff7f571c0 <ConstantType>) at Objects/typeobject.c:1708
#2  PyType_GenericAlloc (type=0x7ffff7f571c0 <ConstantType>, nitems=1) at Objects/typeobject.c:1722
#3  0x00007ffff79b0a0e in long_subtype_new (obase=<optimized out>, x=<optimized out>, type=0x7ffff7f571c0 <ConstantType>) at Objects/longobject.c:5616
#4  long_new_impl (obase=<optimized out>, x=<optimized out>, type=0x7ffff7f571c0 <ConstantType>) at Objects/longobject.c:5555
#5  long_new (type=0x7ffff7f571c0 <ConstantType>, args=<optimized out>, kwargs=<optimized out>) at Objects/clinic/longobject.c.h:65
#6  0x00007ffff7f49963 in Constant_create (name=name@entry=0x7ffff7f4e47c "SEQ_OPEN_INPUT", value=value@entry=2) at pyalsa/alsaseq.c:387
#7  0x00007ffff7f4abce in PyInit_alsaseq () at pyalsa/alsaseq.c:3337
#8  0x00007ffff7ac1ed1 in _PyImport_LoadDynamicModuleWithSpec (spec=spec@entry=0x7ffff71fe840, fp=fp@entry=0x0) at ./Python/importdl.c:169
#9  0x00007ffff7abee8a in _imp_create_dynamic_impl (module=<optimized out>, file=0x0, spec=0x7ffff71fe840) at Python/import.c:3775
#10 _imp_create_dynamic (module=<optimized out>, args=<optimized out>, nargs=<optimized out>) at Python/clinic/import.c.h:506
#11 0x00007ffff79cac88 in cfunction_vectorcall_FASTCALL (func=0x7ffff71972e0, args=0x7ffff71fe6c8, nargsf=<optimized out>, kwnames=0x0) at Objects/methodobject.c:422
#12 0x00007ffff790c8bf in _PyEval_EvalFrameDefault (tstate=<optimized out>, frame=<optimized out>, throwflag=<optimized out>) at Python/bytecodes.c:3254
#13 0x00007ffff7972487 in _PyObject_VectorcallTstate (kwnames=0x0, nargsf=2, args=0x7fffffffbae0, callable=0x7ffff71a4040, tstate=0x7ffff7ec3988 <_PyRuntime+459656>) at ./Include/internal/pycore_call.h:92
#14 object_vacall (tstate=tstate@entry=0x7ffff7ec3988 <_PyRuntime+459656>, base=base@entry=0x0, callable=0x7ffff71a4040, vargs=vargs@entry=0x7fffffffbb70) at Objects/call.c:850
#15 0x00007ffff79726e7 in PyObject_CallMethodObjArgs (obj=0x0, name=0x7ffff7e5c0b8 <_PyRuntime+35512>) at Objects/call.c:911
#16 0x00007ffff7ac076b in import_find_and_load (abs_name=0x7ffff7028eb0, tstate=0x7ffff7ec3988 <_PyRuntime+459656>) at Python/import.c:2779
#17 PyImport_ImportModuleLevelObject (name=name@entry=0x7ffff7028eb0, globals=globals@entry=0x0, locals=locals@entry=0x0, fromlist=fromlist@entry=0x0, level=0) at Python/import.c:2862
#18 0x00007ffff7a82496 in builtin___import___impl (level=<optimized out>, fromlist=0x0, locals=0x0, globals=0x0, name=0x7ffff7028eb0, module=<optimized out>) at Python/bltinmodule.c:275
#19 builtin___import__ (module=<optimized out>, args=<optimized out>, nargs=<optimized out>, kwnames=<optimized out>) at Python/clinic/bltinmodule.c.h:107
#20 0x00007ffff79ca9fd in cfunction_vectorcall_FASTCALL_KEYWORDS (func=0x7ffff71959e0, args=0x7ffff719ad28, nargsf=<optimized out>, kwnames=0x0) at Objects/methodobject.c:438
#21 0x00007ffff790c8bf in _PyEval_EvalFrameDefault (tstate=<optimized out>, frame=<optimized out>, throwflag=<optimized out>) at Python/bytecodes.c:3254
#22 0x00007ffff7972487 in _PyObject_VectorcallTstate (kwnames=0x0, nargsf=3, args=0x7fffffffbf60, callable=0x7ffff71a4180, tstate=0x7ffff7ec3988 <_PyRuntime+459656>) at ./Include/internal/pycore_call.h:92
#23 object_vacall (tstate=tstate@entry=0x7ffff7ec3988 <_PyRuntime+459656>, base=base@entry=0x0, callable=0x7ffff71a4180, vargs=vargs@entry=0x7fffffffbff0) at Objects/call.c:850
#24 0x00007ffff79726e7 in PyObject_CallMethodObjArgs (obj=0x0, name=name@entry=0x7ffff7e5c190 <_PyRuntime+35728>) at Objects/call.c:911
#25 0x00007ffff7ac0326 in PyImport_ImportModuleLevelObject (name=name@entry=0x7ffff71fd7d0, globals=<optimized out>, locals=locals@entry=0x7ffff71f9880, fromlist=fromlist@entry=0x7ffff71fc2e0, level=0) at Python/import.c:2931
#26 0x00007ffff791562e in import_name (level=0x7ffff7e542c8 <_PyRuntime+3272>, fromlist=0x7ffff71fc2e0, name=0x7ffff71fd7d0, frame=<optimized out>, tstate=0x7ffff71959e0) at Python/ceval.c:2482
#27 _PyEval_EvalFrameDefault (tstate=tstate@entry=0x7ffff7ec3988 <_PyRuntime+459656>, frame=<optimized out>, frame@entry=0x7ffff7f9b020, throwflag=throwflag@entry=0) at Python/bytecodes.c:2135
#28 0x00007ffff7a89247 in _PyEval_EvalFrame (throwflag=0, frame=0x7ffff7f9b020, tstate=0x7ffff7ec3988 <_PyRuntime+459656>) at ./Include/internal/pycore_ceval.h:89
#29 _PyEval_Vector (args=0x0, argcount=0, kwnames=0x0, locals=0x7ffff71f9880, func=0x7ffff71da160, tstate=0x7ffff7ec3988 <_PyRuntime+459656>) at Python/ceval.c:1683
#30 PyEval_EvalCode (co=co@entry=0x7ffff70183f0, globals=globals@entry=0x7ffff71f9880, locals=locals@entry=0x7ffff71f9880) at Python/ceval.c:578
#31 0x00007ffff7ae3506 in run_eval_code_obj (tstate=tstate@entry=0x7ffff7ec3988 <_PyRuntime+459656>, co=co@entry=0x7ffff70183f0, globals=globals@entry=0x7ffff71f9880, locals=locals@entry=0x7ffff71f9880) at Python/pythonrun.c:1722
#32 0x00007ffff7ae3619 in run_mod (mod=<optimized out>, filename=filename@entry=0x7ffff712f450, globals=globals@entry=0x7ffff71f9880, locals=locals@entry=0x7ffff71f9880, flags=flags@entry=0x7fffffffc520, arena=arena@entry=0x7ffff711be30) at Python/pythonrun.c:1743
#33 0x00007ffff7ae650c in pyrun_file (flags=0x7fffffffc520, closeit=1, locals=0x7ffff71f9880, globals=0x7ffff71f9880, start=257, filename=0x7ffff712f450, fp=0x55555555a590) at Python/pythonrun.c:1643
#34 _PyRun_SimpleFileObject (fp=fp@entry=0x55555555a590, filename=filename@entry=0x7ffff712f450, closeit=closeit@entry=1, flags=flags@entry=0x7fffffffc520) at Python/pythonrun.c:433
#35 0x00007ffff7ae6afc in _PyRun_AnyFileObject (fp=0x55555555a590, filename=filename@entry=0x7ffff712f450, closeit=closeit@entry=1, flags=flags@entry=0x7fffffffc520) at Python/pythonrun.c:78
#36 0x00007ffff7b0d72c in pymain_run_file_obj (skip_source_first_line=0, filename=0x7ffff712f450, program_name=0x7ffff7148880) at Modules/main.c:360
#37 pymain_run_file (config=0x7ffff7e66568 <_PyRuntime+77672>) at Modules/main.c:379
#38 pymain_run_python (exitcode=exitcode@entry=0x7fffffffc634) at Modules/main.c:629
#39 0x00007ffff7b0db66 in Py_RunMain () at Modules/main.c:709
#40 0x00007ffff7b0dd1a in pymain_main (args=0x7fffffffc660) at Modules/main.c:739
#41 Py_BytesMain (argc=<optimized out>, argv=<optimized out>) at Modules/main.c:763
#42 0x00007ffff7557cd0 in __libc_start_call_main (main=main@entry=0x555555555040 <main>, argc=argc@entry=2, argv=argv@entry=0x7fffffffc7e8) at ../sysdeps/nptl/libc_start_call_main.h:58
#43 0x00007ffff7557d8a in __libc_start_main_impl (main=0x555555555040 <main>, argc=2, argv=0x7fffffffc7e8, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, stack_end=0x7fffffffc7d8) at ../csu/libc-start.c:360
#44 0x0000555555555075 in _start ()
```

Issue URL     : https://github.com/alsa-project/alsa-python/issues/9
Repository URL: https://github.com/alsa-project/alsa-python
