Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFF51F2F5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 05:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631241884;
	Mon,  9 May 2022 05:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631241884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652066992;
	bh=vh8Kq8/UcbQVnqC0qzMkPj56RQjqxfeuwmWcGZWtFF4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NfWqkxHxV9yZ5V/Uak2ar2PtqQ2sYuxJRcwJ0HKzbrDZpFin4zOB5H6A1QzuoF4YC
	 Dar37b0hVwP74YWfckmlEvVQ+1KPmPremAvBpuMZucMC/E7bZPc/KDA0oQWIsj0zlt
	 /QnC0WY3hurrO3fY8COHH9VccXpNsvicUoyFKTU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E10B1F8047B;
	Mon,  9 May 2022 05:28:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B81AF80269; Mon,  9 May 2022 05:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4F19F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 05:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F19F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WXSJrZmZ"
Received: by mail-il1-x133.google.com with SMTP id n6so6575534ili.7
 for <alsa-devel@alsa-project.org>; Sun, 08 May 2022 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AuxSzBelxHq8d0UNsOmfShJlviRHkdA9CleYqkx3TbA=;
 b=WXSJrZmZdI4eGxvJtEvSuchP80ja1RBntawFS6uGAGMjTcIbjTMIgIoeyw2mcN8LRi
 a4yuAnTuQQ/ausLIuhqNb9en3aqYZXS9sGnOsGTcQ0WuLTsMdeg8wmpKuIXpkMObiVNM
 anCwEaPPBSVo51CWWTyAFXw7T79jgu4naJWxMJcnoZ4Svxn1qy3qpefl/YHZdmSWNGqx
 aTjOKVrCdBCXwKlLjFDPQHGczed8X0czKtLvvJcEGRPpJ+J4bF/JZ/zxGm5H6YpUY78T
 H0Ab5vf8vL2Q0woEf4QT7iY6XyY1g1+LB1dUAGN18tS+W6xZaQi4r20Mx3LKSPbJF5jq
 EyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AuxSzBelxHq8d0UNsOmfShJlviRHkdA9CleYqkx3TbA=;
 b=MVqGHVkXw7QWTnIKnr8uAMj1e1xpMygybw2A3p8N+VZpjtrUSCs3dwzJwWTOQrhzh9
 OuTzaGdsC0TZegR9xJoJJ7fI8B6meJuaSIyijvr3+blmSMxMAZzcYuMyMfDgrP1s2OnQ
 tlowCtjQ45qg9lz97L3MBnSaykdV3sF//cvJuiTj+4etqgoS1mzqoIkzPASgCCbVP5wa
 sZ5DI4t4eYtQv1LyGfV8XN4RttP5t4fr3Om60zzTtY0FCo6cQ5VeneJDQMih/4L2FehW
 TykEDlt+Fqo1bOkP/lSvC31fewdOqPSAiAzjGwgSVjaeT+ZzO0YG/8O8sgj5bvlWTZYN
 zgcw==
X-Gm-Message-State: AOAM532eqO+Z0ywgXNlQ0nh/XJKxM+sXOHknTjb/yF12LTSov2LhFaxX
 kqxcEoZ//ijDv0rnmelNDIw=
X-Google-Smtp-Source: ABdhPJyUyq2E2fXDnkUxVWp/j5jWIpuNtqvaMzm+mpXZLAvSnsksROoGwjE4/FO3VhjjbHEuUk4CIw==
X-Received: by 2002:a05:6e02:1aad:b0:2cf:48d4:52df with SMTP id
 l13-20020a056e021aad00b002cf48d452dfmr5831793ilv.187.1652066924195; 
 Sun, 08 May 2022 20:28:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 a16-20020a92ce50000000b002cde6e352bcsm2869157ilr.6.2022.05.08.20.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 20:28:43 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v6 0/2] Add generic serial MIDI driver using serial bus API
Date: Sun,  8 May 2022 22:28:34 -0500
Message-Id: <20220509032836.1116866-1-kaehndan@gmail.com>
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

 .../bindings/sound/serial-midi.yaml           |  50 +++
 sound/drivers/Kconfig                         |  18 +
 sound/drivers/Makefile                        |   2 +
 sound/drivers/serial-generic.c                | 374 ++++++++++++++++++
 4 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serial-midi.yaml
 create mode 100644 sound/drivers/serial-generic.c


base-commit: c5eb0a61238dd6faf37f58c9ce61c9980aaffd7a
-- 
2.33.0

