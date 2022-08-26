Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C35A3211
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 00:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 512F71622;
	Sat, 27 Aug 2022 00:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 512F71622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661553160;
	bh=vsV2kNVe+rb+2HMJkG/CGr7j1Q+tuQBWy+W7CRfWbgI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XzQ5SoRpUBITU+ZpxKn5bVLOw2Q3Z7vr8K0BxhDtZLxZ/Zjyc4dE8t8helLEJSGJL
	 UzzwgfAQS7IQpRX12A4U70sMLW57jhcaSm8l4rLCFvJgdpOYk8qTLKOWc5Tx61H6Ks
	 jeNWpx86qY3zaSQOL0ESqIYPQg7xMxEQL90oqm8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B67F8032D;
	Sat, 27 Aug 2022 00:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42309F80238; Sat, 27 Aug 2022 00:31:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 13C2FF800BD
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 00:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13C2FF800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661553093287622929-webhooks-bot@alsa-project.org>
References: <1661553093287622929-webhooks-bot@alsa-project.org>
Subject: Asus ROG Strix B660-F (ALC4080) output issue: No audio front
 headphone, No audio S/PDIF
Message-Id: <20220826223140.42309F80238@alsa1.perex.cz>
Date: Sat, 27 Aug 2022 00:31:40 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #205 was opened from RomanAverin:

I have problems playing audio from the front headphone jack, as well as S/PDIF. 
Kernel-5.19.4, Fedora 36, X11, Gnome 42


1. usb-device detect as `Bus 001 Device 004: ID 0b05:1a16 ASUSTek Computer, Inc. USB Audio`
2. Sound cards device by ` arecord -l `
```
**** List of CAPTURE Hardware Devices ****
card 0: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 3: J250a [Jabra UC VOICE 250a], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

3. Info from `alsa-info.sh` uploaded 
[http://alsa-project.org/db/?f=4376afd5f9282787f5ce07b8dd473e48639b6201](http://alsa-project.org/db/?f=4376afd5f9282787f5ce07b8dd473e48639b6201)
4. Trying to change the device id in the `/usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080.conf` on my id `Regex "USB(0b05:1a16)"` (default 0b05:1996)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/205
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
