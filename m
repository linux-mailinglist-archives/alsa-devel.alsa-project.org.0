Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838673E861E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 00:37:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E73C1751;
	Wed, 11 Aug 2021 00:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E73C1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628635045;
	bh=mZhZWZRtmzYLuSyPQ8sKc/ZZ/NOtmnYUPD48VGKIomc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pqb8v+9UznI3pQ81VwNKkexZj6TiWRgIBtgtVa5nRaFWUDkY3xfJ5DF95yQymxV2J
	 7me/xCUa5as0KnYmEY1MsITiwpqZVDV0KSoVV7AC8LTrqxUygp874mnhoAvzCg2S3w
	 4zC3ofFFUZ02CxvKBI/IBzfI8kuv9TlLCMc53+UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73CDFF800FD;
	Wed, 11 Aug 2021 00:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26FC0F8025D; Wed, 11 Aug 2021 00:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.49.40])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A4F6F800FD
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 00:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A4F6F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=offbeat.tech header.i=@offbeat.tech
 header.b="CgeUzWRX"
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 38E68400D7F2F
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:18:53 -0500 (CDT)
Received: from gator4324.hostgator.com ([162.241.194.183]) by cmsmtp with SMTP
 id DaLRm3q87rJtZDaLRmdCn9; Tue, 10 Aug 2021 17:35:37 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=offbeat.tech; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NSXDHy0bFTgodFP5Q5oIiB6lU3Jv99RCJJdSy/o3E1w=; b=CgeUzWRXU5EtA0rruF9cMP7K35
 7isPIs+be5beAStaMgOLzwl2wEsFWE1gDDQfLgHXRk2Ku8keb/h+Xn+yGGn29QEenmqHIWg1VXgsw
 mtrDvETZ7aEOdn0U9ogO0T0A7t9LilGj2a51vi4b8gxsXAFcRqQ7kFJGJy4QkBGrelVgUGWEtTcOk
 iagdlR9cAOJN2QN0PbgXl2nwCCZxRbfY4+NX+eLJbzDbBIDMtOf/3BcCHVT5r+tTb0wxlL5+UxNgP
 nrU3bQQ5sHXZ3lriYvaYsZA9eB52LTQtdxpFkHx5UFdjfvfh1dK1anBQimdDeFOY3ceHfszvkHwwK
 Q6W49zJQ==;
Received: from c-73-213-206-7.hsd1.md.comcast.net ([73.213.206.7]:39202
 helo=localhost) by gator4324.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@offbeat.tech>) id 1mDaLR-003tfF-5K
 for alsa-devel@alsa-project.org; Tue, 10 Aug 2021 17:35:37 -0500
Date: Tue, 10 Aug 2021 18:35:36 -0400
From: tom <tom@offbeat.tech>
To: alsa-devel@alsa-project.org
Subject: CORB reset timeout, Intel 3400 onboard chip
Message-ID: <20210810223536.u2y2cggfgrdqyhby@offbeat.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4324.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - offbeat.tech
X-BWhitelist: no
X-Source-IP: 73.213.206.7
X-Source-L: No
X-Exim-ID: 1mDaLR-003tfF-5K
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-213-206-7.hsd1.md.comcast.net (localhost)
 [73.213.206.7]:39202
X-Source-Auth: tom@offbeat.tech
X-Email-Count: 1
X-Source-Cap: b2ZmYmVhdDY7b2ZmYmVhdDY7Z2F0b3I0MzI0Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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

Hello all,
I am experiencing an issue with my onboard sound card, where I have no sound
output. Please see a copy of my alsa-info.sh for my current 
/etc/modprobe.d/*.conf config, located here:

http://ix.io/3vAV

I attempted troubleshooting using some config options that I saw listed in 
HDAudio.txt. Specifically, I tried model options for "generic". I also tried a 
few options for probe_mask, including "1" and "0x100".


It seems that no matter which options I put in, I always get a
CORB timeout from desg:

[    4.052955] snd_hda_intel 0000:00:1b.0: CORB reset timeout#1, CORBRP = 0
[    4.053038] snd_hda_intel 0000:00:1b.0: no codecs initialized

When I remove my probe_mask options, it first switches to polling mode, then
single_cmd mode, and finally fails to initialize any codecs. I looked at the
hda_intel.c file and saw a section for my onboard sound card (ref line 2515):

00:1b.0 Audio device: Intel Corporation 5 Series/3400 Series Chipset High 
Definition Audio (rev 05)

I also want to share my hw-probe output, located here:
https://linux-hardware.org/?probe=13e2d05856

It appears there are approximately 50 other users utilizing the same audio
driver. From my searches across a few different websites, it seems that my
particular audio chip should be very well supported and simply "work". I am now
thinking this is a bug, as I can't see a reason why it should be failing in
this manner.

Thank you for any guidance you can provide.
