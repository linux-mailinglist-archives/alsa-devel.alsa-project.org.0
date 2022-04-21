Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DAF50B945
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:56:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7792A183E;
	Fri, 22 Apr 2022 15:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7792A183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635807;
	bh=NfMLO5avF7UGnejD25L+sFcxyvxpN4LJp+dUjXos1/8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oK4TkaD4jILx/zTtTRW3eToos48XGUJm2I5X9YcJISSN6Do1guQ0lNlGg942JCoDl
	 KdUoqfaVxN3ml1CnwZOAi3d5TXAOXpusVyfsTRuVi1+tmJZuJIfm0B72OZiuWqZ/rR
	 koIVOvDJZTQH9GdOev7ZklimlL3g1T0uhX70InEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA29AF80C74;
	Fri, 22 Apr 2022 15:32:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C985CF80538; Thu, 21 Apr 2022 19:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 435B8F80535
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 435B8F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k6HeTms2"
Received: by mail-io1-xd36.google.com with SMTP id 79so6034832iou.7
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dFaEdZoe1wdoUVW+z6nHPkpQBV+8JNugJSZ2D48minQ=;
 b=k6HeTms2a6kfXWvb+JzALpYu/HfeggC22EQ+3zvuytvCzz5P0F/LcZhQllEn222g2x
 yX9e3ZoUNknBBvvuRyELRzJRLE62tIBfvfYTtdxz4boT5hPP7V+ikr4HPd+zTboD3RX7
 bjVWzLFu/rJqHjIVugvdfwHSDA3IoXpW3ySi7r4v27evbSQ0NzFJdAvJ2x6NBbqnCzev
 9CNFpds1NAtpr4/1y9nZiUiqNPbIfo4VFrO8cGZfSHd1DuLOQbj5GYiEiYIteGP5VTOy
 m7PZZttg9aNwvft/Y1QzILu9D0XVHwpw+X7alVSGZQTx8/ifSv/N2/GJbMvHnfGHMahJ
 M5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dFaEdZoe1wdoUVW+z6nHPkpQBV+8JNugJSZ2D48minQ=;
 b=72ZSdf7KZ3xavoh7bSR6Yv7jwMV9awfAyRK1DjKhRaOjz2cs+u0koRzlDgMAaBtJWn
 OWfPNvE4Wysj9jd5hO53PNkT0bQwQPRGDITKamCHeTTbTUh7t29fwTgvUrhDphHy6+2C
 x6XAkK86Uu1rwZQQ+PHl0TQ4JVriXTW6KoDQx9xBDTiLFm2VmylZInqNx6kfyOAp6Qhl
 EMfmi9R9Jvz2wW2mQPGQBcVuXTAQfKzj5WI2SY691KxWpIKa3SSCrwqawfJdTEx46MxQ
 rbaNcq4jB86/ahYO+94zAZG0+gaE318NFDdM5BAffl9UoHcnkPo8vaKaVUrNYl6CRAWz
 +b7g==
X-Gm-Message-State: AOAM5315tiwN/uAi3SmNzGOfOMJDEgIPp8j5VJMAMkxHoQHS6qPUkbSD
 wwFecQALsP3oYswHEXAtUxw=
X-Google-Smtp-Source: ABdhPJzTvKmjDxo0qnZeP/smB4eUcjRy+dNtisZlZPmuj5nN11Sb3YC2st1G8S+A3tk56m1QX5DRqA==
X-Received: by 2002:a05:6638:ec3:b0:328:7d44:1df4 with SMTP id
 q3-20020a0566380ec300b003287d441df4mr354353jas.173.1650561920006; 
 Thu, 21 Apr 2022 10:25:20 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 o16-20020a92c690000000b002cbf7f76878sm10806260ilg.6.2022.04.21.10.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:25:19 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v2 0/2] Add generic serial MIDI driver using serial bus API
Date: Thu, 21 Apr 2022 12:24:25 -0500
Message-Id: <20220421172427.703231-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, Daniel Kaehn <kaehndan@gmail.com>
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

Changes in v2:
- Fix 'snd_serial_generic_write_wakeup' missing static keyword as 
  reported by the kernel test robot
- Correct 3.125 kBaud -> 31.25 kBaud and 3.84 kBaud -> 38.4 kBaud
  in documentation for MIDI
Reported-by: kernel test robot <lkp@intel.com>

Background as included in the initial cover letter:


Generic serial MIDI driver adding support for using serial devices
compatible with the serial bus as raw MIDI devices, allowing using
additional serial devices not compatible with the existing
serial-u16550 driver. Supports only setting standard serial baudrates on
the underlying serial device; however, the underlying serial device can
be configured so that a requested 38.4 kBaud is actually the standard MIDI
31.25 kBaud. Supports DeviceTree configuration.

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
 sound/drivers/Kconfig                         |  17 +
 sound/drivers/Makefile                        |   2 +
 sound/drivers/serial-generic.c                | 344 ++++++++++++++++++
 4 files changed, 404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
 create mode 100644 sound/drivers/serial-generic.c


base-commit: b253435746d9a4a701b5f09211b9c14d3370d0da
-- 
2.35.1

