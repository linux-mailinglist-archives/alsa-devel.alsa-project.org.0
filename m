Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8EF2276BC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A201614;
	Tue, 21 Jul 2020 05:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A201614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595302218;
	bh=M68k7+Y6CDLSOctWh9eljFPAQkdM/TNzPSmO8HoXcis=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exQWgBwDMqm4CV+pCXN7RtuJTWKF3ZklsyTZppq/WZCtl2ecntu+evmXAzFEKr55D
	 18keQVQB47iDeLfePFjAJlWgSiLQ7ovSR80pRVHIHP0M6xoMLg3V2ByKn2AhpaGwYQ
	 C6gvjD0FgjOI1Q8e3AqC0eOnHCnqcOne6Wx0NRrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E93D1F80268;
	Tue, 21 Jul 2020 05:28:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3014AF8024A; Tue, 21 Jul 2020 05:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 59CC0F80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CC0F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1595302098158725977-webhooks-bot@alsa-project.org>
References: <1595302098158725977-webhooks-bot@alsa-project.org>
Subject: Realtek ALC3254 is not recongised
Message-Id: <20200721032825.3014AF8024A@alsa1.perex.cz>
Date: Tue, 21 Jul 2020 05:28:25 +0200 (CEST)
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

alsa-project/alsa-lib issue #72 was opened from daleclack:

I upgraded the newest alsa,but I found my sound card can't found,and sound output is unable to use.
My Device:DELL G3 3500
Sound Card:Realtek ALC3254
Terminal Output:
[dale-g33500 dale]#  lspci | grep -i audio
00:1f.3 Multimedia audio controller: Intel Corporation Device 06c8
01:00.1 Audio device: NVIDIA Corporation Device 10fa (rev a1)
[dale-g33500 dale]# cat /proc/asound/cards
 0 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0x83000000 irq 17
[dale-g33500 dale]# cat /proc/asound/version
Advanced Linux Sound Architecture Driver Version k5.7.9-1-MANJARO.
[dale-g33500 dale]# head -5  /proc/asound/card0/codec#0 
Codec: Nvidia GPU 94 HDMI/DP
Address: 0
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x10de0094
Subsystem Id: 0x102809e1
[dale-g33500 dale]# pacman -Q alsa-lib
alsa-lib 1.2.3.2-1
The Realtek Sound Card is disappeared!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/72
Repository URL: https://github.com/alsa-project/alsa-lib
