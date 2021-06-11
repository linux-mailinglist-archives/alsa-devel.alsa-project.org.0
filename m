Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F023A3F3C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D1D01932;
	Fri, 11 Jun 2021 11:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D1D01932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404456;
	bh=t/u9exB41Dj9Wj/HEe2AeMCe5J9vf6rR116iV9gJ+gM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbhCxmRWNEQw6BOdmi9dHMyV85N4WdcBptZS7IaRgjIqgAhxa5ab6DyNvP2N6v49v
	 XEYmDQv1O0Cf9FLuArQHWUNG6FvS1QfhJJvACJJWHRJ5FgS7+Z4LdLsk7BRfjOg76l
	 xWXB1FtW+kA/E5Q3BUrxtG+Zq7rIL8gl/g+pvcPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD0DF804E0;
	Fri, 11 Jun 2021 11:38:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0355F804CA; Fri, 11 Jun 2021 11:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BCA2F804C2
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BCA2F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="4elbml2S"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="wmHVJV+6"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7B7711AFF;
 Fri, 11 Jun 2021 05:37:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 11 Jun 2021 05:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=efE89pEmRxnS3
 XYyJlRs4LPxJ1xwWk2TzmO3uBn0TRU=; b=4elbml2S4QMBoFW+WBkgkaQ+xgcAl
 yLaaUOT5HTakgrtlpxAZ/SZxzeSOckXWv5RTJdCgegADKTmJ4EZvfsH2XDtcwSL/
 Kkv5bwTMPBjrM+wgK7drKtzIsivhU+a1K334jCvL+pB0LM3xaJQatsmr9+x2+Myy
 dJXp82ZA/bZ73H6YAlkm1IgnoHDwgnA4U0BsdMlAzoP7HH/bY6iVkWiSIH5hthAL
 elWUHlGv8PhHhd6HirWbb4z8VWRDlVDY/Krzeu6IBjfAL0GOprAabl40ZK+cqDxl
 M+Yc5r5u6Dddv1hgsTwqapu5f50QFw0wL9Khe6GYFf3ZMlYdNmWgnzIfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=efE89pEmRxnS3XYyJlRs4LPxJ1xwWk2TzmO3uBn0TRU=; b=wmHVJV+6
 f7+FjJG2p5D5EJtE+SapBFu7MuMzYYbdUigYbNSuqK9+ZrCeH6SE4jFt5Dp5h3pz
 CE3tBgZGmbsZxW619gdcVFLWwQFtTgUEED/y5qgYeq+W+vz4saU4Aia9u9aIYXnX
 a5srDUqnfi5ikO1z3BGHnkWgqSNSOV/6pk+4K6FpwY/T3V0LV3u4s2sXJc8A4R3A
 ISEidAcNJlWZHPr/uT3ZeLCxaVCnbnVdioVZ6FHrumY2w3CP52jmaH0DNfcSzxPQ
 grOFPde752a8iYxwJbpBM7+7/nXqU470cCnSXAb5ra/fwliv6nULzslb/feZpFZw
 hwOkjLGpKGoTug==
X-ME-Sender: <xms:6y7DYOfM3TGCqNfvnBdelxaAufo_sjbtg7joVg2NdxXRL-Nmh7dqKQ>
 <xme:6y7DYIPkcQA4_oeH5wFrZwO-zt70MbjD6A3bMFvjLWWIhoCfe6aFOamplqmbGsts8
 DKSxRiaTS9G9bamvx0>
X-ME-Received: <xmr:6y7DYPhV8L19DjXZvL4534qMzM_1IOLCiG1x8jYKF-RrD4XTOzgzEXEKT0gbyDicU9wY8aPe_r5e5R7Kc5c4rWAJWLJB4dexBOqNDJjy3knGBh0s1Oq1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedujedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6y7DYL_WFGIQmFQOMfN9saM_qPwSdaINVJoRn6H_toHWv5npJ-MtzA>
 <xmx:6y7DYKvNJlJRSbGuIfKOXta9n2oRtEwOU0VqSXnwmGZ_d7insN_SfQ>
 <xmx:6y7DYCHQ1zty9-ZcG84DMuvICNUPync5Orm0CozZl_ew2dEDvBOKJg>
 <xmx:7C7DYPVaAlyEe-l4SPCKK1WIyfNwjfKZpgb4-BvWsQuQmCOajSmUew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Jun 2021 05:37:46 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/6] ALSA: bebob: correct device entries for Phonic Helix
 Board and FireFly series
Date: Fri, 11 Jun 2021 18:37:30 +0900
Message-Id: <20210611093730.78254-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
References: <20210611093730.78254-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Phonic shipped Helix board and FireFly series with IEEE 1394
functionality. Regarding to the parameters in unit directory, these
series have two cases below:

1. the same parameters in unit directory
 * Firefly 202
 * Firefly 302
 * Firefly 808 Universal
 * HelixBoard 12 FireWire, 12 Universal
 * HelixBoard 18 FireWire, 18 Universal
 * HelixBoard 24 FireWire, 24 Universal

2. Unique parameters in unit directory
 * FireFly 808
 * HelixBoard 12 FireWire MkII
 * HelixBoard 18 FireWire MkII
 * HelixBoard 24 FireWire MkII

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 9f8df57c1e8b..e8d5ba105480 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -406,13 +406,16 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_TERRATEC, 0x00000002, &spec_normal),
 	/* CME, MatrixKFW */
 	SND_BEBOB_DEV_ENTRY(VEN_CME, 0x00030000, &spec_normal),
-	/* Phonic, Helix Board 12 MkII */
+	// Phonic Helix Board 12 FireWire MkII.
 	SND_BEBOB_DEV_ENTRY(VEN_PHONIC, 0x00050000, &spec_normal),
-	/* Phonic, Helix Board 18 MkII */
+	// Phonic Helix Board 18 FireWire MkII.
 	SND_BEBOB_DEV_ENTRY(VEN_PHONIC, 0x00060000, &spec_normal),
-	/* Phonic, Helix Board 24 MkII */
+	// Phonic Helix Board 24 FireWire MkII.
 	SND_BEBOB_DEV_ENTRY(VEN_PHONIC, 0x00070000, &spec_normal),
-	/* Phonic, Helix Board 12 Universal/18 Universal/24 Universal */
+	// Phonic FireFly 808 FireWire.
+	SND_BEBOB_DEV_ENTRY(VEN_PHONIC, 0x00080000, &spec_normal),
+	// Phonic FireFly 202, 302, 808 Universal.
+	// Phinic Helix Board 12/18/24 FireWire, 12/18/24 Universal
 	SND_BEBOB_DEV_ENTRY(VEN_PHONIC, 0x00000000, &spec_normal),
 	/* Lynx, Aurora 8/16 (LT-FW) */
 	SND_BEBOB_DEV_ENTRY(VEN_LYNX, 0x00000001, &spec_normal),
@@ -476,11 +479,6 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	/*  Infrasonic, Windy6 */
 	/*  Mackie, Digital X Bus x.200 */
 	/*  Mackie, Digital X Bus x.400 */
-	/*  Phonic, HB 12 */
-	/*  Phonic, HB 24 */
-	/*  Phonic, HB 18 */
-	/*  Phonic, FireFly 202 */
-	/*  Phonic, FireFly 302 */
 	/*  Rolf Spuler, Firewire Guitar */
 	{}
 };
-- 
2.30.2

