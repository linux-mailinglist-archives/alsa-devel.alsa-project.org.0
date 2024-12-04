Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83C9E3A9B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2024 13:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9519514E7;
	Wed,  4 Dec 2024 13:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9519514E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733317125;
	bh=8nhqQdof9oQTnNHWuHPZTaEUZL3V9muSFBRzYdfQM/M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LIIq2TGynBCIFfvoBJAmlPobZrGPp8aeIaQb1OU8K67m2lKW4S9ynV2v/yLROWg4Z
	 w6SGmV5m1D2AafhB6ss9PMVoWLBzP33Lo+GSmMXSUZGgajJHynkuKeXfJpEgZ4NxzD
	 OQx4KQlmH5iB8XZVHq0r0KM++Sgv/uctB2PprOEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0DA0F80116; Wed,  4 Dec 2024 13:58:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B18F801C0;
	Wed,  4 Dec 2024 13:58:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABDFDF80272; Wed,  4 Dec 2024 13:58:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E22E6F80116
	for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2024 13:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E22E6F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733317083331521511-webhooks-bot@alsa-project.org>
References: <1733317083331521511-webhooks-bot@alsa-project.org>
Subject: pulseaudio bails out on 1.2.13 (SIGSEGV), with MOTU Ultralite mk5
Message-Id: <20241204125805.ABDFDF80272@alsa1.perex.cz>
Date: Wed,  4 Dec 2024 13:58:05 +0100 (CET)
Message-ID-Hash: ZSBN54FKSQAHEVT2ECSCSVHKEQ5ZOCKG
X-Message-ID-Hash: ZSBN54FKSQAHEVT2ECSCSVHKEQ5ZOCKG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSBN54FKSQAHEVT2ECSCSVHKEQ5ZOCKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #483 was opened from karolyi:

Hey,

I have this sound card and with the latest update (1.2.13), pulseaudio started to SIGSEGV and I have no sound.

Upon going to the pulseaudio IRC channel and talking to the devs, we've managed to point out that it's the UCM configuration that makes pulseaudio crash. Reverting to 1.2.12 made the crash cease.

It seems that the newly added configuration for the Ultralite makes pulseaudio crash. According to the below gdb traces, it seems the configuration drives pulseaudio into an infinite loop.

Beginning of the trace:
```
Debuginfod has been enabled.
To make this setting permanent, add 'set debuginfod enabled on' to .gdbinit.
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7ae98df in _int_malloc (av=av@entry=0x7ffff7c2dac0 <main_arena>, bytes=bytes@entry=2080) at malloc.c:4059
4059      size_t tc_idx = csize2tidx (nb);

Thread 1 (Thread 0x7ffff73298c0 (LWP 40542) "pulseaudio"):
#0  0x00007ffff7ae98df in _int_malloc (av=av@entry=0x7ffff7c2dac0 <main_arena>, bytes=bytes@entry=2080) at malloc.c:4059
#1  0x00007ffff7aec069 in __libc_calloc (n=<optimized out>, elem_size=<optimized out>) at malloc.c:3754
#2  0x00007ffff7e5e366 in pa_xmalloc0 (size=2080) at ../src/pulse/xmalloc.c:74
#3  0x00007ffff7e7d3d4 in pa_idxset_new (hash_func=0x7ffff7e7d371 <pa_idxset_trivial_hash_func>, compare_func=0x7ffff7e7d37f <pa_idxset_trivial_compare_func>) at ../src/pulsecore/idxset.c:86
#4  0x00007ffff7e7f5a9 in pa_idxset_copy (s=0x5555556f5890, copy_func=0x0) at ../src/pulsecore/idxset.c:623
#5  0x00007ffff6b93ff0 in iterate_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1399
#6  0x00007ffff6b94108 in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1412
#7  0x00007ffff6b9418a in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1422
#8  0x00007ffff6b9418a in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1422
```

Inbetween there's just a lot of recursive calls. End of the trace:

```
#130916 0x00007ffff6b9418a in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1422
#130917 0x00007ffff6b9418a in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1422
#130918 0x00007ffff6b9418a in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1422
#130919 0x00007ffff6b9418a in iterate_maximal_device_subsets (devices=0x5555556f5060, state=0x7fffffffca38) at ../src/modules/alsa/alsa-ucm.c:1422
#130920 0x00007ffff6b96635 in ucm_create_verb_profiles (ucm=0x55555567bc60, ps=0x5555556ca560, verb=0x5555556c8970, verb_name=0x5555556c6d60 "HiFi", verb_desc=0x5555556a3120 "Default") at ../src/modules/alsa/alsa-ucm.c:2042
#130921 0x00007ffff6b973bf in pa_alsa_ucm_add_profile_set (ucm=0x55555567bc60, default_channel_map=0x555555570de0) at ../src/modules/alsa/alsa-ucm.c:2305
#130922 0x00007ffff6c6bb43 in module_alsa_card_LTX_pa__init (m=0x55555566d9d0) at ../src/modules/alsa/module-alsa-card.c:966
#130923 0x00007ffff7f26919 in pa_module_load (module=0x7fffffffccf0, c=0x555555570d20, name=0x7ffff6c7747d "module-alsa-card", argument=0x555555587f10 "device_id=\"2\" name=\"usb-MOTU_UltraLite-mk5_UL5LFF34E6-00\" card_name=\"alsa_card.usb-MOTU_UltraLite-mk5_UL5LFF34E6-00\" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=y"...) at ../src/pulsecore/module.c:208
#130924 0x00007ffff6c74260 in verify_access (u=0x55555566ae40, d=0x55555566e430) at ../src/modules/module-udev-detect.c:342
#130925 0x00007ffff6c7488f in card_changed (u=0x55555566ae40, dev=0x55555568ae50) at ../src/modules/module-udev-detect.c:437
#130926 0x00007ffff6c74c6f in process_device (u=0x55555566ae40, dev=0x55555568ae50) at ../src/modules/module-udev-detect.c:479
#130927 0x00007ffff6c74cf8 in process_path (u=0x55555566ae40, path=0x5555556879b0 "/sys/devices/pci0000:00/0000:00:01.2/0000:02:00.0/0000:03:08.0/0000:07:00.1/usb1/1-1/1-1.1/1-1.1:1.0/sound/card2") at ../src/modules/module-udev-detect.c:496
#130928 0x00007ffff6c75ed0 in module_udev_detect_LTX_pa__init (m=0x555555666220) at ../src/modules/module-udev-detect.c:812
#130929 0x00007ffff7f26919 in pa_module_load (module=0x7fffffffcf28, c=0x555555570d20, name=0x555555668c20 "module-udev-detect", argument=0x0) at ../src/pulsecore/module.c:208
#130930 0x00007ffff7f073ba in pa_cli_command_load (c=0x555555570d20, t=0x555555668c40, buf=0x5555555717b0, fail=0x55555556f6b5) at ../src/pulsecore/cli-command.c:440
#130931 0x00007ffff7f0fac4 in pa_cli_command_execute_line_stateful (c=0x555555570d20, s=0x7fffffffd100 "load-module module-udev-detect", buf=0x5555555717b0, fail=0x55555556f6b5, ifstate=0x7fffffffd0f8) at ../src/pulsecore/cli-command.c:2207
#130932 0x00007ffff7f0fda2 in pa_cli_command_execute_file_stream (c=0x555555570d20, f=0x55555556fce0, buf=0x5555555717b0, fail=0x55555556f6b5) at ../src/pulsecore/cli-command.c:2247
#130933 0x00007ffff7f10031 in pa_cli_command_execute_file (c=0x555555570d20, fn=0x555555570c70 "/home/karolyi/Work/opensource/pulseaudio/build/src/daemon/default.pa", buf=0x5555555717b0, fail=0x55555556f6b5) at ../src/pulsecore/cli-command.c:2278
#130934 0x00007ffff7f0f7d8 in pa_cli_command_execute_line_stateful (c=0x555555570d20, s=0x555555570560 ".include /home/karolyi/Work/opensource/pulseaudio/build/src/daemon/default.pa", buf=0x5555555717b0, fail=0x55555556f6b5, ifstate=0x7fffffffdb1c) at ../src/pulsecore/cli-command.c:2170
#130935 0x00007ffff7f10239 in pa_cli_command_execute (c=0x555555570d20, s=0x555555577bc0 ".include /home/karolyi/Work/opensource/pulseaudio/build/src/daemon/default.pa\n", buf=0x5555555717b0, fail=0x55555556f6b5) at ../src/pulsecore/cli-command.c:2304
#130936 0x0000555555564162 in main (argc=7, argv=0x7fffffffde98) at ../src/daemon/main.c:1267
Continuing.

Program terminated with signal SIGSEGV, Segmentation fault.
The program no longer exists.
```

Requested debug output from the pulseaudio project: https://termbin.com/n04r

Please investigate.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/483
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
