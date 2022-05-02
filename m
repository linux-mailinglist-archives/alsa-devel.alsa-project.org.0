Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632051722C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 17:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F641CF;
	Mon,  2 May 2022 17:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F641CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651503921;
	bh=NKX1XzCzqt49PeAMFiIctA4k40VD3N1uKJNO7iDLvI0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BVsKUMq4gG+B4HwBGqJ9cGIopXqrzgs1mDy+6wIxivdw2YX9u/SaA2znxKfaCUGgu
	 O547RpCTlKrA8RtwwKUZmuvTyvGB+G1vsdaFybymSVNP2r/Z6EitKLnqIB7yjXC15L
	 AJBnED/Ne4R3AuTsMnd5RunAdmeqh3DMEtlCcjxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C047FF8027C;
	Mon,  2 May 2022 17:04:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABCACF80254; Mon,  2 May 2022 17:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8EE0F800E9
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 17:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EE0F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YUkiI9/Y"
Received: by mail-il1-x12a.google.com with SMTP id h11so3430934ila.5
 for <alsa-devel@alsa-project.org>; Mon, 02 May 2022 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DRcfeOPp8YPUhkivVL67L3rsGG8Qlwpxxwx2I3ORs4s=;
 b=YUkiI9/YHujZOvLgkORYBnIieJ9ftfzbSyXCxJVs3LnOU0DFLlg4e0CjhPY6EoO6Tb
 HFiauyu3xqL2y4uWYT7dDSu7mbDcIRYtrtKJygaTHXURNlnObPBvt50lqM+VnLbDYzMi
 jrpcqaHwhy/IszKcrzITML2knpjrBIqwqPOChr9E7pC8Koii7HCGac9rALLx3hlDyKcI
 6g4i1xB8W17D5Q/KZ1lzvf40GheD+CZFjti6ffSTZIh3kTc+NL/9280XN3PpROdeZ3Ue
 80L+G2FizOjBR0PqErH9Owc+qmXTTXr4kfrNsttgE04sfNST7P7OlkYPDypJGI/XYVBy
 /Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DRcfeOPp8YPUhkivVL67L3rsGG8Qlwpxxwx2I3ORs4s=;
 b=0lf5zuTFFQZkM5WLp6amuIP9Fk2YLTzCXy7O/9DyBVTQghc7aRSqZk1+CArrgp/5p2
 jWUF70DS3ijyStZMsHii9h1p7bgz9YlXpGFyQN211ObyALFAqZqWYVZSPMIAzWFoysSA
 BOdVxc3FC5UAG6wfcCjXmBi9T2J5yduZ/GxNxD2UY7AzGouBOAIvwdT+sTit72N/zazu
 lx8qwU+R0oPzSPyRrmkpErmhZsdKUIjwdh61CQZBjEQp1CGEaMBpNkHn2FK1o9ZzXAu5
 r8l0+xdC9d/4L2IKlStwkc0sfSrUN2HCJi6sqPvnELpYK69LsYfFUQYM90gFHVp34yps
 hnhg==
X-Gm-Message-State: AOAM532pOLjeSdQdpCbEEJ94hgF3BkyVs3iVvj757A6EJSN4aJoeinaJ
 1F2ji7fJZU+cGeUvyq3/cLo=
X-Google-Smtp-Source: ABdhPJzfiNToI21FVYln99c0cWAnyLlhjZFUA0gNs3Yr00ClpWyklpqJvRqtT51jbHe3dhJTn4TkWw==
X-Received: by 2002:a05:6e02:184f:b0:2cf:2026:a80d with SMTP id
 b15-20020a056e02184f00b002cf2026a80dmr1145473ilv.261.1651503856418; 
 Mon, 02 May 2022 08:04:16 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 s12-20020a92c5cc000000b002cde6e352basm2718218ilt.4.2022.05.02.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:04:16 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v5 0/2] Add generic serial MIDI driver using serial bus API
Date: Mon,  2 May 2022 10:04:02 -0500
Message-Id: <20220502150404.20295-1-kaehndan@gmail.com>
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

Changes in v5:
- Reword and add to description in dt-binding
- Change 'speed' dt property to 'current-speed'
- Move MIDI output loop onto workqueue (since this could loop quite a while,
    if ALSA provides a continuous stream of bytes)
- Add tx_state bit flags to snd_serial_generic struct
- Safegard critical section in tx_work with atomic bit ops on tx_state
- Switch operations on `filemode` to use atomic bit ops

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

 .../devicetree/bindings/sound/serialmidi.yaml |  46 +++
 sound/drivers/Kconfig                         |  18 +
 sound/drivers/Makefile                        |   2 +
 sound/drivers/serial-generic.c                | 377 ++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
 create mode 100644 sound/drivers/serial-generic.c


base-commit: 3e71713c9e75c34fc03f55ea86b381856ca952ee
-- 
2.33.0

