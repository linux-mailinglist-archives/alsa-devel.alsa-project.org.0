Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C45C990B4
	for <lists+alsa-devel@lfdr.de>; Mon, 01 Dec 2025 21:35:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53F016021E;
	Mon,  1 Dec 2025 21:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53F016021E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764621335;
	bh=TjY0npyJIukg700X5khpETrrylTmN1P30yW0rmZPg9E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IlqPRmbijiyzLW5I8042C8O0SrlXh9dYqTEG4ShLlQw94EsK/6tGkspb3nbJ8WkIe
	 fGO/GcdLSYIYnCwfIW6kI6kNynqIH8cNf5KBy8Eibuj/hjc9CcawNmpVH7sYvNR17B
	 s7052Rhklul5oXiVii7fzkP4CWExakK6WHFSiAMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4BB6F805F1; Mon,  1 Dec 2025 21:34:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66CEEF805F0;
	Mon,  1 Dec 2025 21:34:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D704F8049C; Mon,  1 Dec 2025 21:34:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E2EF800F3
	for <alsa-devel@alsa-project.org>; Mon,  1 Dec 2025 21:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5E2EF800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187d31acaeb65c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/42@alsa-project.org>
References: <alsa-project/alsa-tools/pr/42@alsa-project.org>
Subject: hdspmixer: fix null pointer dereference in HDSPMixerWindow:handler_cb
Date: Mon,  1 Dec 2025 21:34:08 +0100 (CET)
Message-ID-Hash: ZXYRV4LEME3EIUQMJ3LF3J4ACKICPMDV
X-Message-ID-Hash: ZXYRV4LEME3EIUQMJ3LF3J4ACKICPMDV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXYRV4LEME3EIUQMJ3LF3J4ACKICPMDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #42 was edited from cheldt:

Fixes following error:

```
Program received signal SIGSEGV, Segmentation fault.
handler_cb () at /home/snaut/dev/alsa-tools/hdspmixer/src/HDSPMixerWindow.cxx:278
278             if (fl_win->label()) {
(gdb) bt
#0  handler_cb () at /home/kenoby/dev/alsa-tools/hdspmixer/src/HDSPMixerWindow.cxx:278
#1  0x00007ffff7c5c791 in send_handlers () at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl.cxx:935
#2  Fl::handle_ () at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl.cxx:1620
#3  Fl::handle_ () at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl.cxx:1384
#4  0x00007ffff6dfb2ee in ffi_call_unix64 () at ../src/x86/unix64.S:104
#5  0x00007ffff6df79f8 in ffi_call_int () at ../src/x86/ffi64.c:676
#6  0x00007ffff6dfa6ce in ffi_call () at ../src/x86/ffi64.c:713
#7  0x00007ffff732d47a in wl_closure_invoke () at ../wayland-1.24.0/src/connection.c:1241
#8  0x00007ffff732e2e9 in dispatch_event () at ../wayland-1.24.0/src/wayland-client.c:1707
#9  0x00007ffff732e6bb in dispatch_queue () at ../wayland-1.24.0/src/wayland-client.c:1853
#10 wl_display_dispatch_queue_pending () at ../wayland-1.24.0/src/wayland-client.c:2190
#11 0x00007ffff7332776 in wl_display_dispatch_queue_timeout () at ../wayland-1.24.0/src/wayland-client.c:2096
#12 0x00007ffff7332860 in wl_display_dispatch_queue () at ../wayland-1.24.0/src/wayland-client.c:2163
#13 0x00007ffff7d017b2 in sync_done () at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1389
#14 0x00007ffff6dfb2ee in ffi_call_unix64 () at ../src/x86/unix64.S:104
#15 0x00007ffff6df79f8 in ffi_call_int () at ../src/x86/ffi64.c:676
#16 0x00007ffff6dfa6ce in ffi_call () at ../src/x86/ffi64.c:713
#17 0x00007ffff732d47a in wl_closure_invoke () at ../wayland-1.24.0/src/connection.c:1241
#18 0x00007ffff732e2e9 in dispatch_event () at ../wayland-1.24.0/src/wayland-client.c:1707
#19 0x00007ffff732e6bb in dispatch_queue () at ../wayland-1.24.0/src/wayland-client.c:1853
#20 wl_display_dispatch_queue_pending () at ../wayland-1.24.0/src/wayland-client.c:2190
#21 0x00007ffff7332776 in wl_display_dispatch_queue_timeout () at ../wayland-1.24.0/src/wayland-client.c:2096
#22 0x00007ffff7332860 in wl_display_dispatch_queue () at ../wayland-1.24.0/src/wayland-client.c:2163
#23 0x00007ffff7d03561 in Fl_Wayland_Screen_Driver::open_display_platform () at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1426
#24 Fl_Wayland_Screen_Driver::open_display_platform () at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1406
#25 0x00007ffff7ca6da7 in Fl_Screen_Driver::open_display () at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl_Screen_Driver.cxx:605
#26 Fl_Screen_Driver::open_display () at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl_Screen_Driver.cxx:600
#27 0x00007ffff7d03d14 in Fl_Wayland_Screen_Driver::get_system_colors () at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1708
#28 0x00007ffff7cec929 in Fl_Window::show () at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl_arg.cxx:290
#29 0x000055555557b8aa in Fl_Double_Window::show () at /usr/include/FL/Fl_Double_Window.H:36
#30 main () at /home/kenoby/dev/alsa-tools/hdspmixer/src/hdspmixer.cxx:120
```


Related [Issue](https://github.com/alsa-project/alsa-tools/issues/43)

Request URL   : https://github.com/alsa-project/alsa-tools/pull/42
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-tools
