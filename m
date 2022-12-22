Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127B7654616
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 19:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C6494EA8;
	Thu, 22 Dec 2022 19:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C6494EA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671734463;
	bh=m9ZyIu36eosf+XT4oian2DPKpA8Xr5erckKM++UYUVI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+yMp/d9I18DlEWD+jYjoR96EsAwuYdwXjt5v6fA1MXmumRA/qcuWhnG03/P5t1Zg
	 ltHGrsXekFqQMwRu834MDgwLGqv8gaHT60mzk2YSw/fM/nvAxYD07nsudbzwAW/LJ/
	 bb2bHsT2XSF696iUctKM7GnqMuUrvkhUqt5YN+Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A8DEF80158;
	Thu, 22 Dec 2022 19:40:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 829BDF8026D; Thu, 22 Dec 2022 19:40:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3843BF8024D
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 19:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3843BF8024D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1671734399455161095-webhooks-bot@alsa-project.org>
References: <1671734399455161095-webhooks-bot@alsa-project.org>
Subject: ALC4080 z790 apex no sound
Message-Id: <20221222184004.829BDF8026D@alsa1.perex.cz>
Date: Thu, 22 Dec 2022 19:40:04 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-ucm-conf issue #257 was opened from pipes80-collab:

good evening everyone, I have a problem with the realtek alc4080 audio peripheral integrated in the Z790 apex, the peripheral connected to my yamaha 5.1 amplifier signals the pcm but no sound comes out, everything works normally under windows, I followed some solutions on the alsa-ucm configuration -conf for the device but to no avail. then invo output lsusb and aplay -l

Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 005: ID 046d:c08b Logitech, Inc. G502 SE HERO Gaming Mouse
Bus 001 Device 003: ID 054c:0ce6 Sony Corp. DualSense wireless controller (PS5)
Bus 001 Device 006: ID 195d:2030 Itron Technology iONE Func KB-460 Gaming Keyboard
Bus 001 Device 004: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 001 Device 002: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed hub
Bus 001 Device 009: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 001 Device 008: ID 0b05:1a52 ASUSTek Computer, Inc. USB Audio
Bus 001 Device 007: ID 0b05:18f3 ASUSTek Computer, Inc. AURA LED Controller
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
[filippo@pipes ~]$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [USB Audio], device 3: USB Audio [USB Audio #3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: Controller [Wireless Controller], device 0: USB Audio [USB Audio]
  Subdevices: 1/1

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/257
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
