Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A296811E7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 15:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E2CDF9;
	Mon, 30 Jan 2023 15:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E2CDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675088232;
	bh=H1vdzOzYwrsPZ576IHg1NJv1CJHomL5Iw3rzuojc05w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qB2fojfyMTf79mSmcLb5piOYERly2pi8unXoct0wtv8haU4Qs5T2h7ZxR05LxMjzk
	 ez0jFAG6a8xMAIUhufgAsxuYTQLW1OW/0vu9Y+hynfr1cWe6Z0JrrW7uXf15L+vOHZ
	 V/lHOrHh6P5+Gnn+inGT6A1PfFfZwQ13uptHCNrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D07F80423;
	Mon, 30 Jan 2023 15:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C88CF8047D; Mon, 30 Jan 2023 15:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8239F80423
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 15:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8239F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=H3NVBroV; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=n/XfQT7d
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 72FDA5C0081;
 Mon, 30 Jan 2023 09:15:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 30 Jan 2023 09:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1675088144; x=1675174544; bh=3FUca8Cn2O
 fbYV0ZeE/vVep3iQyPh0WwZanYzFsTSjQ=; b=H3NVBroVM1IutJXP/T687Yg72a
 jsCjHIUo2Y0AOGI5rpdEk9eqPymaeEUH72ZybXCEk170W2nVYQNjinTh7UdC7gdj
 n+Kuges2O9DJ4L3+cEV6Joteu6iLEtNsx12ACCa1iD9IgvgFLG2YHvTPb6aOf46K
 SVSO8nQXqzBC78U180821yMGX6DVT+8OI1JgXo9zjp+JSyPSRfl1fSL0xyahyh8p
 XZa0xUxnqsjQSS7sPDVodER6am7GhJHEzBYskmdd6AkdImz8bHAmdgueQtw/sK4X
 hziKsjjxwT5j3wGkedRwBoKnFY9G/VDRyIbMBpn00zalozthx79bvhwOIjjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1675088144; x=1675174544; bh=3FUca8Cn2OfbYV0ZeE/vVep3iQyPh0WwZan
 YzFsTSjQ=; b=n/XfQT7dZhYlbu+07AN5qFhYFWAuLWtSPDArE8xUQoFm8M20qm1
 Z93vl8ZVy3T3cTAttXNO/xjS3kS5BglPGIDFXsmV0FpwwElzUOximFiAwfw4aZ1K
 HXYqlWMXzZPZvGkjPcNNRyOgvF1yYbuJ9ns6xbt9sImrvLscNWiEXO1KrHn4PibF
 wGGt/2bYJ1Z56TorHWXTl1/hR5yUKF8XRxMqPMQjt5LDEkYplagjxjq40UTJoORD
 vw9IhUPbK91E7bVd4zb4bNoX1t2+3osMU+PRw9Ag1szMnZc8HdbGyh8G2IYG7c0P
 JJxy0SaEaBWyvUD4mBKjICTnvr68vRiFaIg==
X-ME-Sender: <xms:ENHXY_RHu3BecHMv6UhTKGY07Rmxuz6KBnPBp-MHb2yX2BfGudr5pA>
 <xme:ENHXYwz3SHeU4TVADex1LQPTAtwy2wf0IVgkRnpZHi_Owv3NDHiGpr2CmE2rGGLRm
 _-a9akpROOB8Fdi1V0>
X-ME-Received: <xmr:ENHXY01QdnbLZmZ-uR3leVQNdtBrxfJ6SuwXSqjSlej5-drFWjKtuP08kYdO3aMSgHatdIk0xIlowHoHF7-Pobi-eB5kEtTUqMz5zI1IrsC4aC_1GZzVl4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
 ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
 hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ENHXY_DKZM7BzEXPgR_mS-uAAFnTJ4vxlCIY7CAp8V6atRDSQ2RGKg>
 <xmx:ENHXY4jMweCKOGrb2shfSx6XFRnLzCxJ-JFvSpVaWm1NFFWtKuAkZQ>
 <xmx:ENHXYzrijM7WUT8JkcuPm7Q-JKB6SazZeRhzeawL0VbPxMejYahotA>
 <xmx:ENHXY0ZEELXr86FzWkG1--ObzAA4nx4MHc3E1TinodTs1EOAeW1COA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jan 2023 09:15:43 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: firewire-motu: fix unreleased lock warning in hwdep
 device
Date: Mon, 30 Jan 2023 23:15:40 +0900
Message-Id: <20230130141540.102854-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Dan Carpenter <error27@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Smatch static analysis tool detects that acquired lock is not released
in hwdep device when condition branch is passed due to no event. It is
unlikely to occur, while fulfilling is preferable for better coding.

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-hwdep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index a900fc0e7644..88d1f4b56e4b 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -87,6 +87,10 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 			return -EFAULT;
 
 		count = consumed;
+	} else {
+		spin_unlock_irq(&motu->lock);
+
+		count = 0;
 	}
 
 	return count;
-- 
2.37.2

