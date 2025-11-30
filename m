Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251EC952D2
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Nov 2025 18:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E21601FD;
	Sun, 30 Nov 2025 18:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E21601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764523097;
	bh=+lHKVIzn2tfaV2NgBWf7VB/cHGtpn8Avl7Dfkld1UxI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uMl/A7uRcrq2C6AsXXvrji7goTFchAN7BdDI85QXUGReDPqqi/2TuXyHIo1CH+JU7
	 +byCi50TiK09S0dDpiKdyty6lO2A3mZkAweIZ0RPEHQBPMCvlvzCgeuB7T9u37gbq5
	 C3xKqmtyl/ON0XN8oCKlYuA5wNN3zoWuMiJKCUYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9AABF805C9; Sun, 30 Nov 2025 18:17:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BA5BF804FF;
	Sun, 30 Nov 2025 18:17:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECC2BF8049C; Sun, 30 Nov 2025 18:15:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C68F8012B
	for <alsa-devel@alsa-project.org>; Sun, 30 Nov 2025 18:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C68F8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187cd84468f31e00-webhooks-bot@alsa-project.org>
In-Reply-To: <187cd84467719900-webhooks-bot@alsa-project.org>
References: <187cd84467719900-webhooks-bot@alsa-project.org>
Subject: HDSPmixer coredumps on Arch Linux
Date: Sun, 30 Nov 2025 18:15:51 +0100 (CET)
Message-ID-Hash: Y5DYZ76BK6PQQ2EWHPUH5Z5OLVIJKNS5
X-Message-ID-Hash: Y5DYZ76BK6PQQ2EWHPUH5Z5OLVIJKNS5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5DYZ76BK6PQQ2EWHPUH5Z5OLVIJKNS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #43 was opened from rubin55:

This is recent, I suspect after fltk upgrade to 1.4.x november the 25th. Here is the bt:
```
HDSPMixer 1.11 - Copyright (C) 2003 Thomas Charbonnel <thomas@undata.org>
This program comes with ABSOLUTELY NO WARRANTY
HDSPMixer is free software, see the file COPYING for details

Looking for RME cards:
Card 0: HDA Intel PCH at 0x4802120000 irq 201
Card 1: RME AIO Pro S/N 24093311 at 0x82500000 irq 16
RME AIO found!
Card 2: Logi 4K Stream Edition at usb-0000:00:14.0-5, super speed
Card 3: HDA NVidia at 0x82080000 irq 17
1 RME cards card found.
Initializing default presets

Program received signal SIGSEGV, Segmentation fault.
Downloading 47.21 K source file /usr/src/debug/alsa-tools/alsa-tools-1.2.14/hdspmixer/src/HDSPMixerWindow.cxx
handler_cb (event=24) at /usr/src/debug/alsa-tools/alsa-tools-1.2.14/hdspmixer/src/HDSPMixerWindow.cxx:278
278		if (fl_win->label()) {
(gdb) bt
#0  handler_cb (event=24) at /usr/src/debug/alsa-tools/alsa-tools-1.2.14/hdspmixer/src/HDSPMixerWindow.cxx:278
#1  0x00007ffff7c69009 in send_handlers (e=24) at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl.cxx:935
#2  Fl::handle_ (e=<optimized out>, window=<optimized out>) at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl.cxx:1620
#3  Fl::handle_ (e=<optimized out>, window=<optimized out>) at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl.cxx:1384
#4  0x00007ffff6b9cac6 in ffi_call_unix64 () at ../src/x86/unix64.S:104
#5  0x00007ffff6b9976b in ffi_call_int
    (cif=cif@entry=0x7fffffffc9e0, fn=fn@entry=0x7ffff7cfcd40 <output_done(void*, wl_output*)>, rvalue=<optimized out>,
    rvalue@entry=0x0, avalue=avalue@entry=0x7fffffffcab0, closure=closure@entry=0x0) at ../src/x86/ffi64.c:676
#6  0x00007ffff6b9c06e in ffi_call
    (cif=cif@entry=0x7fffffffc9e0, fn=0x7ffff7cfcd40 <output_done(void*, wl_output*)>, rvalue=rvalue@entry=0x0, avalue=avalue@entry=0x7fffffffcab0) at ../src/x86/ffi64.c:713
#7  0x00007ffff763c48d in wl_closure_invoke (closure=closure@entry=0x55555596e0f0, target=<optimized out>,
    target@entry=0x555555971060, opcode=opcode@entry=2, data=<optimized out>, flags=1) at ../wayland-1.24.0/src/connection.c:1241
#8  0x00007ffff763d2e9 in dispatch_event (display=display@entry=0x5555555a9b70, queue=queue@entry=0x5555555a9c68)
    at ../wayland-1.24.0/src/wayland-client.c:1707
#9  0x00007ffff763d6f3 in dispatch_queue (display=0x5555555a9b70, queue=0x5555555a9c68)
    at ../wayland-1.24.0/src/wayland-client.c:1853
#10 wl_display_dispatch_queue_pending (display=display@entry=0x5555555a9b70, queue=queue@entry=0x5555555a9c68)
    at ../wayland-1.24.0/src/wayland-client.c:2190
#11 0x00007ffff7640f34 in wl_display_dispatch_queue_timeout
    (display=0x5555555a9b70, queue=0x5555555a9c68, timeout=timeout@entry=0x0) at ../wayland-1.24.0/src/wayland-client.c:2096
#12 0x00007ffff7641010 in wl_display_dispatch_queue (display=<optimized out>, queue=<optimized out>)
    at ../wayland-1.24.0/src/wayland-client.c:2163
#13 0x00007ffff7cf9aba in sync_done (data=<optimized out>, cb=<optimized out>, time=<optimized out>)
    at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1389
#14 0x00007ffff6b9cac6 in ffi_call_unix64 () at ../src/x86/unix64.S:104
#15 0x00007ffff6b9976b in ffi_call_int
    (cif=cif@entry=0x7fffffffced0, fn=fn@entry=0x7ffff7cf9a60 <sync_done(void*, wl_callback*, uint32_t)>, rvalue=<optimized out>,
    rvalue@entry=0x0, avalue=avalue@entry=0x7fffffffcfa0, closure=closure@entry=0x0) at ../src/x86/ffi64.c:676
#16 0x00007ffff6b9c06e in ffi_call
    (cif=cif@entry=0x7fffffffced0, fn=0x7ffff7cf9a60 <sync_done(void*, wl_callback*, uint32_t)>, rvalue=rvalue@entry=0x0, avalue=avalue@entry=0x7fffffffcfa0) at ../src/x86/ffi64.c:713
#17 0x00007ffff763c48d in wl_closure_invoke (closure=closure@entry=0x555555970da0, target=<optimized out>,
    target@entry=0x55555596e1d0, opcode=opcode@entry=0, data=<optimized out>, flags=1) at ../wayland-1.24.0/src/connection.c:1241
#18 0x00007ffff763d2e9 in dispatch_event (display=display@entry=0x5555555a9b70, queue=queue@entry=0x5555555a9c68)
    at ../wayland-1.24.0/src/wayland-client.c:1707
#19 0x00007ffff763d6f3 in dispatch_queue (display=0x5555555a9b70, queue=0x5555555a9c68)
    at ../wayland-1.24.0/src/wayland-client.c:1853
#20 wl_display_dispatch_queue_pending (display=display@entry=0x5555555a9b70, queue=queue@entry=0x5555555a9c68)
    at ../wayland-1.24.0/src/wayland-client.c:2190
#21 0x00007ffff7640f34 in wl_display_dispatch_queue_timeout
    (display=0x5555555a9b70, queue=0x5555555a9c68, timeout=timeout@entry=0x0) at ../wayland-1.24.0/src/wayland-client.c:2096
--Type <RET> for more, q to quit, c to continue without paging--
#22 0x00007ffff7641010 in wl_display_dispatch_queue (display=<optimized out>, queue=<optimized out>)
    at ../wayland-1.24.0/src/wayland-client.c:2163
#23 0x00007ffff7cfa169 in Fl_Wayland_Screen_Driver::open_display_platform (this=<optimized out>)
    at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1426
#24 Fl_Wayland_Screen_Driver::open_display_platform (this=<optimized out>)
    at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1406
#25 0x00007ffff7cacafa in Fl_Screen_Driver::open_display (this=0x55555596df60)
    at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl_Screen_Driver.cxx:605
#26 Fl_Screen_Driver::open_display (this=0x55555596df60) at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl_Screen_Driver.cxx:600
#27 0x00007ffff7cfd942 in Fl_Wayland_Screen_Driver::get_system_colors (this=<optimized out>)
    at /usr/src/debug/fltk/fltk-release-1.4.4/src/drivers/Wayland/Fl_Wayland_Screen_Driver.cxx:1708
#28 0x00007ffff7ce301e in Fl_Window::show (this=0x5555555c75a0, argc=1, argv=0x7fffffffd558)
    at /usr/src/debug/fltk/fltk-release-1.4.4/src/Fl_arg.cxx:290
#29 0x000055555555aa17 in Fl_Double_Window::show (this=<optimized out>, a=1, b=0x7fffffffd558)
    at /usr/include/FL/Fl_Double_Window.H:36
#30 main (argc=1, argv=0x7fffffffd558) at /usr/src/debug/alsa-tools/alsa-tools-1.2.14/hdspmixer/src/hdspmixer.cxx:120
```

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/43
Repository URL: https://github.com/alsa-project/alsa-tools
