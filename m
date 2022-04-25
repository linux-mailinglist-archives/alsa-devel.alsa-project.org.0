Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0466350E7B6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 20:02:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960871820;
	Mon, 25 Apr 2022 20:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960871820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650909750;
	bh=oFAjj9piLDtulBkISktM1QoKjUc4yteh2tkdRBI++Ko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oAcIDhuFk2tpN5uoFJQT86yjHgwdKuDvdOq9r0jT7a0vPGpIdRPK/pMXKYZsiFp0A
	 HzDutjyQGw58ATIfvJOI2LZTaN1671Wj9eh6zsZsmdJVtpJs6TBR+eL5DHeMWu3xvY
	 SZvKDiYMJKmxvG8fx0oLpf3R3Mzo0JZM0FnJVp40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D372AF800CB;
	Mon, 25 Apr 2022 20:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45184F800CB; Mon, 25 Apr 2022 20:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D7DF800CB
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 20:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D7DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g5VL4GaP"
Received: by mail-il1-x135.google.com with SMTP id b5so9895713ile.0
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sZcFYyGibNV6LU/xDH8iv9QsdsOvZbAWtAYGyU5lX8k=;
 b=g5VL4GaPpqCu1bUujjfjCLSSPKVfueckk5918P/hNoybQ9kwNlUInZ/TqQRGrCyK23
 duzCF6FQr+/t2EvrVCqOePgUZPNGo2R1QbeNk5MfgXm8R7v7dz9aAgMTF7usnKm+KwqL
 FTE/PEwnR8iadhnqyc5Q/tQ6mVTiS81MITHepEGgf+D+1Y66sY6WoKr6gTiCy2W8zX9+
 igvB23T7EJWv7hjbySWxlJc+Vc666Cz9J6U57B8IR2OrWrkROqe76Q2YL7g/mFXqcgBB
 NuL3vL0TyrR0kFXYdSZRVqIkhW6UihhnMqSGszULgdpZzYgXlgCs4mkQsMSNnje6M+XA
 RI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sZcFYyGibNV6LU/xDH8iv9QsdsOvZbAWtAYGyU5lX8k=;
 b=knVNd0U4oCQLfu/UwSrQyTx3UnfaBZ6pbrm3pRWbt444HS/nXjgxpOBoJ+Xwrm/JwA
 jGGweRbPR9FgHrfIF1/p76rfV7jFi1PgSvxw9qTCY5WJIskAWIRvgU6CH1QEmpLWZ1eb
 dvvRhWMR5hp8YH38z1BzxUbWoZ05JmHbpHNddlJI5k5oMG36iHVPXE2m+LrAS5zVCnuE
 4VO0ewFW7COOHdyZAh2pmmAO4Bm2LLFtDPXOmf4h7fMNF5KjR5Oo8Ltg0HTd8Cd9c/3n
 FR8gzuOtbqxIckBFvbbChXG09bYZBSV6GJlI8Hi0gngiuJUAxWjEel2DT4XryXp0vfJS
 2xSg==
X-Gm-Message-State: AOAM530smAexmNbyCgn2s+M0dYaPJfiRfYEopp7xPcDRSgfhC+nguLQW
 45Klxqw353SCFXnhefVpwOQ=
X-Google-Smtp-Source: ABdhPJyjiWXXER7yQBZ7nHuhtWutnCBeFyue4lVZJ4vTbJ7w3f52kn+A09zcVkUY9nTAz3UW6w2TQQ==
X-Received: by 2002:a05:6e02:19c9:b0:2cc:5542:c7d8 with SMTP id
 r9-20020a056e0219c900b002cc5542c7d8mr7492360ill.309.1650909683678; 
 Mon, 25 Apr 2022 11:01:23 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 a1-20020a923301000000b002cae7560bfesm6447379ilf.62.2022.04.25.11.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 11:01:23 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v3 0/2] Add generic serial MIDI driver using serial bus API 
Date: Mon, 25 Apr 2022 13:01:13 -0500
Message-Id: <20220425180115.757247-1-kaehndan@gmail.com>
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
 sound/drivers/serial-generic.c                | 316 ++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
 create mode 100644 sound/drivers/serial-generic.c


base-commit: af2d861d4cd2a4da5137f795ee3509e6f944a25b
-- 
2.33.0

