Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95250E955
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 21:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF981817;
	Mon, 25 Apr 2022 21:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF981817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650914256;
	bh=ZrxApqOb0Tv/rc6pCzD6ZmCES1t4dQpoPJa0p2npixs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hEUZqJRI8/VRCt+OboVSC7gm1qH+FxqkuCkV83Q0PR0CjoJPROVqgaEqthLWU3+JF
	 ORLhHYjhbtwIZiUMIF8tyg5PlI5KJK2xkfQHhKYtH9wfbNZJU/Re9Xp+wTKsHmuK0S
	 UyrtT7PdzBCI1VE6xE9frvDLzfbETDDrjHcyxZxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F507F8014B;
	Mon, 25 Apr 2022 21:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C879F8016A; Mon, 25 Apr 2022 21:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5447F800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 21:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5447F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bzG3eZUl"
Received: by mail-il1-x130.google.com with SMTP id d3so9988615ilr.10
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=79En++Vr1sBSFe95ZCwf7O++Q0VkaYApBB88Isyd460=;
 b=bzG3eZUlAl0ggoOzuuLI5O1WhDZS9GQJIaFV+7UtNOc1o1feP84SPW4ERFgXkv4Ro5
 6csM937vKr0j+oqPsbd2/0mWPwHuO12L5x4s/HUAVf9J0RdWR/zuqfwaJnt0SIfMQbup
 54RpeG6bXZFjOMuMbCt5BvYJOnW72UpNFiwOW2jSMCXHMTAsMsCQ/fjitGFPqq1TNSDN
 ez2ePnzRAvQl6wpERPaN8A/0irDpz5aCrlGfqLtdXeXsf8FJeG9HLdnyvsuD2bZUcBJj
 +Ci1otaIuU9AwvgUvjO8+x0YkHXeCTugK15hVml1zqHppha012lY8mirasG4D892yQXk
 EQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=79En++Vr1sBSFe95ZCwf7O++Q0VkaYApBB88Isyd460=;
 b=ig26v9IJgMupyXbhS7qqKxh2vBPAXeizVxjSUFVyOse4GcDc+PB5xlrDQPPIUhvMs2
 XUx1pIU40iuuMsMJtP8ZJwDT9yjwY25BAcQO4uHnqSaVb5YA9jKNoP5IyGKx4/OAS+zh
 nXIfNj4dukEDWTeZiFs9PNlUkFS+vC78HtSUdyVzqkWlQyKLOG9v+v4J9180UhqBmBQi
 AZO4Emo2xGVk3NOYCJzgkzftBimM5f256AjwryYB9Pe4jGCg0EaplOwOO9JbhzoXKPSm
 CGG1Nep/Vs21NFQsF3mFoZc2u0NY6Gt/00H5f8xke65jTzBoo3XN8gChVW1lllEPwECS
 18ng==
X-Gm-Message-State: AOAM532XVyzndulpjTO3hGfLxJII5l6FHwQTYMnx+oV+SIsxoQBMnZTe
 LFXDhJ4TrneSRRuNMI0sIPE=
X-Google-Smtp-Source: ABdhPJwAjDo4Y58LSzhwSJX4OrL4YeclpJC1tFCkJC7k94r0WLOgi/9zgr5Et8wZVl0oSYsymhx36g==
X-Received: by 2002:a92:cccb:0:b0:2c2:7641:ed49 with SMTP id
 u11-20020a92cccb000000b002c27641ed49mr7662663ilq.271.1650914191606; 
 Mon, 25 Apr 2022 12:16:31 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 m14-20020a92c52e000000b002cd804f045dsm5322842ili.1.2022.04.25.12.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 12:16:31 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v4 0/2] Add generic serial MIDI driver using serial bus API
Date: Mon, 25 Apr 2022 14:16:01 -0500
Message-Id: <20220425191602.770932-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Kaehn <kaehndan@gmail.com>
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

Generic serial MIDI driver adding support for using serial devices
compatible with the serial bus as raw MIDI devices, allowing using
additional serial devices not compatible with the existing
serial-u16550 driver. Supports only setting standard serial baudrates on
the underlying serial device; however, the underlying serial device can
be configured so that a requested 38.4 kBaud is actually the standard MIDI
31.25 kBaud. Supports DeviceTree configuration.

Changes in v4:
- Fix regressed typo - Correct 3.84 kBaud -> 38.4 kBaud in DT & Kconfig
  (sorry about spam - noticed after sending v3 and didn't want to let
  the error sit around for too long)

Changes in v3:
- Replace use of snd_printk() with dev_* alternatives
- Removed unnecessary initialization of err variables
- Replaced instances of `== SERIAL_MODE_NOT_OPENED` with zero check
- Loop on output_write to completely fill output buffer if data available
- Depend on CONFIG_OF in Kconfig
- Replace use of devm_kzalloc() with extra_size allocation in snd_devm_card_new()
- Use module_serdev_device_driver() instead of module_init() and module_exit(0)

Changes in v2:
- Fix 'snd_serial_generic_write_wakeup' missing static keyword 
- Correct 3.125 kBaud > 31.25 kBaud in documentation for MIDI         


The need for this driver arose from a project using a Raspberry Pi4 which
needed to receive and send raw MIDI with low latency. The pl011 UART
used is not compatible with the existing serial MIDI driver made for
u16550-style devices. Using a userspace program such as ttymidi to feed
input from the TTY device to a virtual ALSA MIDI device was functional,
but not ideal.

I am not sure if a MIDI driver needing the mentioned 'hack' to clock
38.4 kBaud down to the standard MIDI baud is permissible in the mainline
kernel, but am submitting nevertheless in case it is useful. To my knowledge,
it doesn't seem that there would be any way for this driver to manually
configure a serial port to 31.25 kBaud using the serial bus API (please 
correct me f I'm wrong). In my use case, I am actually configuring one port
to run at 115.2 kBaud for faster communication with a custom onboard MIDI controller.

Daniel Kaehn (2):
  dt-bindings: sound: Add generic serial MIDI device
  Add generic serial MIDI driver using serial bus API

 .../devicetree/bindings/sound/serialmidi.yaml |  41 +++
 sound/drivers/Kconfig                         |  18 +
 sound/drivers/Makefile                        |   2 +
 sound/drivers/serial-generic.c                | 319 ++++++++++++++++++
 4 files changed, 380 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
 create mode 100644 sound/drivers/serial-generic.c


base-commit: d615b5416f8a1afeb82d13b238f8152c572d59c0
-- 
2.33.0

