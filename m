Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8266450B936
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A9317F5;
	Fri, 22 Apr 2022 15:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A9317F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635647;
	bh=lCiWPMaDezP5ie64gGAdDFgP4aUK/bnxH/Cihxjm0j4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lRSCQOLPPhp0cX7rrlIMAALExvjGaO8Jjf6Fqfnh2t27+PwpC32C+O9a2pcgw9x56
	 mX2C9CwJ0K40Nbx23azJbTAidbpU2Z8f6RyB0WYAZR4kfzpf5iOhCg6WijXsO4VJQM
	 J0eLJYQHJBl/Ha3kWUjC0Xq0VQm72cez+Z+i030g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 204ACF804FD;
	Fri, 22 Apr 2022 15:32:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9012DF80116; Wed, 20 Apr 2022 21:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A761F80116
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 21:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A761F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p/2M81gm"
Received: by mail-il1-x134.google.com with SMTP id b5so1707062ile.0
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5AjxI0G1gBGMYopoaiK/5dXT49fJw45rF40i5u4bhg=;
 b=p/2M81gmVmpvDYAtzwatNur49/NieFajzFYaaeTfzb+9UHgFjjVcazFa5g3ORcw+gw
 K1sH2ROALzlWMzxL2HWYlj1S4KsDn3ue4TDOt2OzCw1nIJ5oag7U8KvzzPwSzAAIDn62
 J0woW4+gfMjkhtMGFFC9OLWEdF4DDlcUiTCwZnrmX6xZoTYMAZ4tIBeu+b16PyxfrhEd
 qh9dCWBVxSUTnVz57EJXup6KxPM6+dZSbwBAd18mFY0YyKAuCuMfX8cvMiUZ96vZTJZ5
 vfV8YZGNh5q622Hgxl3Iw73HOah9OEGBoQ+MoFYHOcJIh8YrQSPGm4S4CXxEEVETAXpc
 wcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p5AjxI0G1gBGMYopoaiK/5dXT49fJw45rF40i5u4bhg=;
 b=mjPOCGR+ZKFNofGT8RvDuohW8TmsTYu9G5Uf9n6a0lC62pJ4ZYs8JACV4HSCAgrlsg
 kfY87vg26gf7dJBBkuv3CZIauykqktrcSfMIHbGReNs9VZACSjMpNMGkPNQqFtWMJNSc
 K6UiI4lzvjOMhgQdvGt+bwyoZJXtU+oBgdwA+CvpnIZPVDM43c+ecDOSN8z6txZ4LeLi
 UAkbcg24PxJjIgDlb9uIb8pwZd6YTSVKU3dcMLj90D19LfCeYNhO8sxKa3TSluuzT2AB
 Wb1iV49X7ARp5azRuQ9Gr2wlBZfGKEFf8Px31hcwpRVZb7Fr1Vn+trNd8QzdMjnEmlnX
 ssjw==
X-Gm-Message-State: AOAM531Q+BsG6LU/KKvUnglreZoEWXGKlVzdGI4L/gYKXsLtK5UAmi61
 UkDu+MD+44OrIA8i5OCr/r4=
X-Google-Smtp-Source: ABdhPJxbq1hSXk7/0hqoHGrYkVe5aPqV/ueWxsculml7LwUebiebpAoYfgb3Zv2D4dTDln4ZxAk2MA==
X-Received: by 2002:a05:6e02:1566:b0:2cc:e08c:f347 with SMTP id
 k6-20020a056e02156600b002cce08cf347mr1799715ilu.47.1650484068881; 
 Wed, 20 Apr 2022 12:47:48 -0700 (PDT)
Received: from fedora.. (cpe-65-29-252-111.wi.res.rr.com. [65.29.252.111])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a056e02011200b002cbe6ce18e5sm10680977ilm.40.2022.04.20.12.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:47:48 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH 0/2] Add generic serial MIDI driver using serial bus API
Date: Wed, 20 Apr 2022 14:47:45 -0500
Message-Id: <20220420194747.490542-1-kaehndan@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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
3.125 kBaud. Supports DeviceTree configuration.

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
configure a serial port to 3.125 kBaud using the serial bus API (please 
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

-- 
2.32.0

