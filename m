Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBF28BFE3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 19:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56046166E;
	Tue, 13 Aug 2019 19:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56046166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565718415;
	bh=BinU9zzsZO5xoTC65q8KY2Gnj5P4wNFWAuAOTwWZkBs=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hIfK8m0YpGPFf7thbX+6Ix+O9GnoIKV+WXAL8CTkKzBSS7MjSFTZWSGmI6KVR35Eh
	 mZ+zMvCRG9xq/T1RjH8C6t4qjsvtgj02Gf2yZjZZLIGJeUAPm/IsIFpsKoFSebGzz7
	 lRw2Yv5uU0+9Xt7918gxYyi7xvoRdfsj1Zf1jx74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDD1F80273;
	Tue, 13 Aug 2019 19:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C924F80273; Tue, 13 Aug 2019 19:45:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A5B69F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 19:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B69F80120
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1565718304886940956-webhooks-bot@alsa-project.org>
References: <1565718304886940956-webhooks-bot@alsa-project.org>
Message-Id: <20190813174508.1C924F80273@alsa1.perex.cz>
Date: Tue, 13 Aug 2019 19:45:08 +0200 (CEST)
Subject: [alsa-devel] Sound Blaster RX does not play sound in side channels
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #9 was opened from logan001:

I don't have the card anymore but maybe someone else have it and can provide some help cause i like the card bass/treble control and if the bug is fixed i will buy it.
The card does not output side channels at all. 5.1 works but 7.1 side channels gives no sound with speaker-test -c 8
pulseaudio also gives no sound for side channels in speaker tests.
i don't know if its the right place to report this bug but i've tried on kernel bugzilla and there is no movement there.
the kernels i've tried 1 month ago are 4.18 and 5.1.15
here is the [alsainfo](https://bugzilla.kernel.org/attachment.cgi?id=283467) at that time

what i found strange is that alsamixer when i change the sound card had the side channels volume set at 0. its like by default was build intentionally without side channels support.

and yes i have that special cable with 3 jacks (sound card) to 4 jack (for speakers). i have it from an old audigy 2 zs if i remeber corectly. and the cable works since i tested 7.1 in windows without any issues.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/9
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
