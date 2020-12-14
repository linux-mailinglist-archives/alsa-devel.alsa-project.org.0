Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED22D97FA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 13:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054EF1778;
	Mon, 14 Dec 2020 13:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054EF1778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607949027;
	bh=za4N7fVAxzSQLr4gCY+kpcVNuhBh7nMxGyUv+kREouc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gGXskKv9q78ugpzyOjN14r0sOTHvXFoswc/O1TUYwpw8LTLhbx7NXGGU06VRh3Xbh
	 0Rf7ChWUAWmS881ZhXyZfmbRSPX/YAJyA6umAdbNjQsRJSd0nmjLjjixi/M1CrZCzu
	 AqhPEU4HtheQDNieu8ZJfoeWdlFSzv1dt1BFd4/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A5FF80240;
	Mon, 14 Dec 2020 13:28:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2949EF801F7; Mon, 14 Dec 2020 13:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61467F800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 13:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61467F800ED
Received: by mail-ot1-f53.google.com with SMTP id h18so15460601otq.12
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 04:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9eJJKts3ZxyJfmyiVfg/RTHlgGIwYkqgT7tNyJxM1bA=;
 b=CMO2524tIQw+kkIJiVW8XIo+apqPXty1JuD6zR29YGyGd4QTJb0PvHnRtTMSt5V32/
 WvRyC+9ki/4ig83CvPCHX5OHLR36w+uI5k9F9xz9NnBVxdIegr2X4tZfge7sBCLqbyAe
 CpDKjbRzEjboX3xaWROAKFwXmvSjbU41cudmwowxt0sCjFLmAhZALunKPC08RCXwKU5Z
 v9Xa1zmhgzes3lTGPzk00tdBajepjCXzC27pCEszqd+6Gbqa7vQlvE3B+aFR0q3W7Yfg
 WbRL5D290vME0khCXu9dtdOHAJgaMXe7oI37Ye4q0FbDpgbmikMxWCkhi1a8wdwIfC/c
 LjrQ==
X-Gm-Message-State: AOAM531ffH4VwK/EXhq4ksGJtvtB31bxACJa/fPchQYg/Fu1/T5jzODx
 ddDfHQ72jmLYJDLMvluymSH6GK0yTM/GOfYJLts=
X-Google-Smtp-Source: ABdhPJwvGZq3VU/rTtCCIe2jNP89KnFfvYrzHh0CBPDcftkuDfTW+TwzsjalusV+GD3yyZJUtlLY1W5LRzbgFk25e0g=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr19357283oth.250.1607948917259; 
 Mon, 14 Dec 2020 04:28:37 -0800 (PST)
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Dec 2020 13:16:25 +0100
Message-ID: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
Subject: rsnd: clk-multiplier already disabled warning on Ebisu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

While booting Ebisu-4D, I saw the below warnings (once).

    rcar_sound ec500000.sound: can't use clk 1

rsnd_adg_clk_control() failed to enable CLKB, but continues.

    ------------[ cut here ]------------
    clk-multiplier already disabled
    WARNING: CPU: 1 PID: 52 at drivers/clk/clk.c:952 clk_core_disable+0x30/0x9c
    Modules linked in:
    CPU: 1 PID: 52 Comm: kworker/1:2 Not tainted
5.10.0-rc7-rcar3-initrd-00582-gadecf297acf4-dirty #183
    Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
    Workqueue: events deferred_probe_work_func
    pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
    pc : clk_core_disable+0x30/0x9c
    lr : clk_core_disable+0x30/0x9c
    sp : ffffffc010f939f0
    x29: ffffffc010f939f0 x28: 0000000000000000
    x27: ffffff800949eb00 x26: ffffff80093c40f8
    x25: 0000000000000001 x24: ffffffc010805fea
    x23: 0000000000000000 x22: ffffff80082b8810
    x21: ffffff80093c4080 x20: ffffff8009368b00
    x19: ffffff8009368b00 x18: 0000000000000000
    x17: 000000004ef774c4 x16: 0000000000000014
    x15: ffffffffffffffff x14: ffffffc010b8e8b0
    x13: fffffffffff9fd47 x12: 0720072007200720
    x11: fffffffffffc0000 x10: ffffffc010b8e8d8
    x9 : 0720072007200720 x8 : 2079646165726c61
    x7 : 0000000000000004 x6 : 00000000ffffe6ad
    x5 : ffffffc010f93718 x4 : 0000000000000000
    x3 : 0000000000000000 x2 : 00000000ffffffff
    x1 : 0000000000000000 x0 : 0000000000000000
    Call trace:
     clk_core_disable+0x30/0x9c
     clk_core_disable_lock+0x24/0x3c
     clk_disable+0x20/0x30
     rsnd_adg_clk_control+0xa0/0xd4
     rsnd_adg_remove+0x58/0x6c
     rsnd_probe+0x134/0x3cc

Something else fails (-EPROBE_DEFER?), and thus rsnd_adg_remove() is
called.  The latter disables all clocks, including the one that failed to
enable before, leading to the warning.

     platform_drv_probe+0x54/0xa4
     really_probe+0x234/0x340
     driver_probe_device+0xa0/0xb0
     __device_attach_driver+0x9c/0xa8
     bus_for_each_drv+0x9c/0xc4
     __device_attach+0xd4/0x140
     device_initial_probe+0x14/0x20
     bus_probe_device+0x30/0x94
     deferred_probe_work_func+0x9c/0xb0
     process_one_work+0x180/0x1f0
     process_scheduled_works+0x44/0x48
     worker_thread+0x1ec/0x270
     kthread+0xdc/0xec
     ret_from_fork+0x10/0x30
    ---[ end trace 8d8c2a1b7537ca36 ]---
    ------------[ cut here ]------------
    clk-multiplier already unprepared
    WARNING: CPU: 1 PID: 52 at drivers/clk/clk.c:810
clk_core_unprepare+0x30/0xd0
    [...]
    ---[ end trace 8d8c2a1b7537ca37 ]---

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
