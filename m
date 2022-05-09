Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B2520093
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 17:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B635718B4;
	Mon,  9 May 2022 16:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B635718B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652108447;
	bh=WMaIrBbx8kkLgbDRbabF45hRXIuo7xhWwUqf0RX8+rE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KBiaL8wDU9bGV9cGHiOeFBe2d1v2IquUoaX5bTHmq6Xqy4wbOE2A01l35fVubKFcZ
	 8TWx2FjteLzV59Zg8LF2lQqEbFQvHmpwa0nT3Plr6/JaZ2HfjfAgI/U+34g9/Ko4g0
	 aW6H9x/AAJoMVJT5iwhlnuwp0NC/8gBxx9Hk+i/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B7BF80237;
	Mon,  9 May 2022 16:59:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A3BF802E3; Mon,  9 May 2022 16:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE274F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE274F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dabwonrx"
Received: by mail-io1-xd36.google.com with SMTP id h85so15574763iof.12
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBWK8wEtyr3Z+BKeKhTzRy0e8y5LPeZaKSAOhM39sxY=;
 b=dabwonrxBvREcvRmh8BKjyxddQgAgZ315FC7yvcivNt2pI9Im7qk0GE9KVz+g+WDI2
 W9ogHxk50GBdSiADYTabQAKJX6n43XsDExJC6eaPdhV3fl+exZsAKteiLLAE0iAb9XWC
 l5TdA8H1G5K1XcQSTk+9xVPhM/IBkBZ2TtIuClLkeq/aWaqY+dIpPXvQ8zsKGJZipt4a
 M6fe6gY4TO2BUt4UMQsKHNr0gkVemrO07dDl1VcTDZsQFk2miX12Sqi6o+zW+QTXaLP8
 mOXPWyL/tNDR9MGHmOBZwh2I/FpSRo4R2/BTQ6mKX4GB1RIzKmn7Rss5NDVMNsqTJg7h
 hBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZBWK8wEtyr3Z+BKeKhTzRy0e8y5LPeZaKSAOhM39sxY=;
 b=FZVli6o45VkTv7qJ12IpXm1un8ZDb5bUdGhtLJboKdQjLIj16qDVktIxYMRHgGRI54
 qSN1mffDrKSsDHKeQAVpPmk6h8KWWUvUXlibjwVoT+vAZ1fd5cIkzEucXVgvsCSB+cZO
 svnsBgp7t3NiZkzkQeVoYaBHneWaX/uB3F15tR8KmqpiM7uKhEhPT7GztxFneZrjIEpy
 ftiIgsU4mzFnbIhhkSfkLTe4HTc7MeDWbDcoPtFX3Bmn/PI/2bBel6VZPh0HPiSl9r5t
 PdV3uZMUUE4SGNjFtDqTVRKUeK1TWOhE+uaSIzXCLXv2PFClsBah8KE45Gk8C7l00PP0
 J+Fw==
X-Gm-Message-State: AOAM531MksmEstid2BLBd0vHv+6e1YPcbE68DL3pfGoscn+CqYMTkngo
 87kw4M1boVlE/J7KwhJqSmw=
X-Google-Smtp-Source: ABdhPJxMA3QH7S6K4X/siM5hUPpJ1ohmB1mimy04z0Pxe/zc+KqEKDH9Fe83DZ1DWUwR302jkE11xQ==
X-Received: by 2002:a6b:ca44:0:b0:657:b54a:5c53 with SMTP id
 a65-20020a6bca44000000b00657b54a5c53mr6545149iog.108.1652108381502; 
 Mon, 09 May 2022 07:59:41 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 p18-20020a02b892000000b0032b3a7817c1sm3664414jam.133.2022.05.09.07.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:59:41 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v7 0/2] Add generic serial MIDI driver using serial bus API
Date: Mon,  9 May 2022 09:59:31 -0500
Message-Id: <20220509145933.1161526-1-kaehndan@gmail.com>
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

Changes in v7:
- Separate examples in dt-binding to remove need to specify unit name
    (fixing dt_binding_check error)

Changes in v6:    
- Change compatible "serialmidi" -> serial-midi" 
- Default current-speed to 38400 (closest baud to MIDI standard speed) 
- Appropriately stop reading or writing MIDI if input or output
    _trigger() is called with a parameter of zero, respectively 
- Zero out corresponding triggered state on close to ensure input and
    output closing results in the serial port being closed 
- Fix order of operations in _probe() 
- Remove "DEBUG" literal from debug messages
- Remove unused dt-parsing patch checking for existence of node
- Whitespace / tabbing fixes / improvements

Changes in v5:
- Reword description in dt-binding for clarity
- Change 'speed' dt property to standard 'current-speed'
- Move MIDI output loop onto workqueue (since this could loop quite a while,
    if ALSA provides a continuous stream of bytes)
- Add tx_state bit flags to snd_serial_generic struct
- Safegard critical section in tx_work with atomic bit ops on tx_state
- Switch operations on filemode to use atomic bit ops

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

 .../bindings/sound/serial-midi.yaml           |  51 +++
 sound/drivers/Kconfig                         |  18 +
 sound/drivers/Makefile                        |   2 +
 sound/drivers/serial-generic.c                | 374 ++++++++++++++++++
 4 files changed, 445 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serial-midi.yaml
 create mode 100644 sound/drivers/serial-generic.c


base-commit: c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
-- 
2.33.0

