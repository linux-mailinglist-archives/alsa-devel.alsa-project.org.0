Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE015381677
	for <lists+alsa-devel@lfdr.de>; Sat, 15 May 2021 09:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFB11728;
	Sat, 15 May 2021 09:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFB11728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621062828;
	bh=QUo0NTN3O6hnqYVUpMfxw9Bxjka5oYDZMVnHHZvv61w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kRSv0AJu9u87FenjhEGaLz2iJeS5/7Xyq7k1/+XsMzflfdsa15FRtdiYz6KiDjK0C
	 g4hA6AMHH8LFnVl2jZ5uefgss2ZO5QDSR6ezvixjroR7Y8bAOBe8IOeMLsBSME4/eN
	 cVHDc0zKVmEZM2GWmN5XweguNVJp5PFnogtQqBkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E6CF801D5;
	Sat, 15 May 2021 09:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3210BF80430; Sat, 15 May 2021 09:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B0F7F8013A
 for <alsa-devel@alsa-project.org>; Sat, 15 May 2021 09:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0F7F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mZUrFzC0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="g0pJR6V0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D3EA55C00BE;
 Sat, 15 May 2021 03:11:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 May 2021 03:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=5r4qNJ6Slnn2w
 YcWFM1v2Bcgl5wWb46dH9GLsqSOK5g=; b=mZUrFzC0CFIcTq4801vGgFTf1LJ2E
 c0rCfOXRaOONWhG9mqeyeuhf41nDzA5f6/NqduH92tmuZw9QSujg3CCJcAhpjhbk
 JCR/iTd29PNJyrUMIVcPget27LD4qGrkN9/94PLfHdBctW8f1rDydJgZtKO/4YDC
 S5JHKODFpkj1wznxz9AgiU5e5R5tSVb3OzlCltbRdUkpQ9rr4P56TyVasxxOBhTH
 BBoJ05AO5MOT5TnNOAX4FXf8IsI3r1i1XJRdsqfSxhf8ha6tMxWWKCa6drTWahOG
 D+wRCVslzTLYfnoU4wUhNjTzO85U5d0i4cnNei2zKF2iS0S7Y0HLFkjxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=5r4qNJ6Slnn2wYcWFM1v2Bcgl5wWb46dH9GLsqSOK5g=; b=g0pJR6V0
 CHni31HLcbo4Bf1ZmMuQcoWIznT19CIO35yjDyWpPgtvWuTeYUnkAvT1fU8XmThm
 g/GAIcuRj7LUVQTyewmUUxDi2COqDW0VJkj1oszm0QO2uxU+dzWCVXO7nFApynsZ
 J3GUHL8jKqepcPC8MwedGsSnUJ65Iv6OdrK+ubfirsCm0/tDzJBrsdFN+TIViIuD
 yP/oDI9Q+YZLE0GjEGvy9gq53MgUskBy2E32KthHLH9VvlWHegFnqxo0/IEnhAcH
 iQP/nuLuMbqrkP7K/2PiNYm6NzBLT+ljN0nUSrmVrfPwnFLB2E2Ie48WKHRQNfLZ
 w+35eFE+fpfGGQ==
X-ME-Sender: <xms:FnSfYIVZZ80sl_dLmTj1Gwk9Ry3A4-kLrT-RyEMdrtJgDdiwSBX26g>
 <xme:FnSfYMm3AHSHpDcY4GQ3uhMaLLoSgr5bq0dqzbsVEjyOpNUDbc963f-seum-zsCcr
 u-7YKNISV1ZH-G7AaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehledguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:FnSfYMYuGbzNO9x04feFAMXSUs4pK_BFpbDFdRbgf420DH544fCxYw>
 <xmx:FnSfYHU6Ks7R9ANz9OsgUDzyhtHqtp9AxHwBAU9Pxn5qCdY9I77x-g>
 <xmx:FnSfYCnGn07Vp_flzU8VJflYQNSEzvqqknsslp1SxwsmFKTxi_QxBw>
 <xmx:FnSfYGs_AAeA9n8umL3axbXJGyKvFtnEE-b6lXA0faRklox-rD6tcg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Sat, 15 May 2021 03:11:17 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v2 01/10] Revert "ALSA: bebob/oxfw: fix Kconfig entry for
 Mackie d.2 Pro"
Date: Sat, 15 May 2021 16:11:03 +0900
Message-Id: <20210515071112.101535-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
References: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

This reverts commit 0edabdfe89581669609eaac5f6a8d0ae6fe95e7f.

I've explained that optional FireWire card for d.2 is also built-in to
d.2 Pro, however it's wrong. The optional card uses DM1000 ASIC and has
'Mackie DJ Mixer' in its model name of configuration ROM. On the other
hand, built-in FireWire card for d.2 Pro and d.4 Pro uses OXFW971 ASIC
and has 'd.Pro' in its model name according to manuals and user
experiences. The former card is not the card for d.2 Pro. They are similar
in appearance but different internally.

Fixes: 0edabdfe8958 ("ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig       | 4 ++--
 sound/firewire/bebob/bebob.c | 2 +-
 sound/firewire/oxfw/oxfw.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index 9897bd26a438..def1f3d5ecf5 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -38,7 +38,7 @@ config SND_OXFW
 	   * Mackie(Loud) Onyx 1640i (former model)
 	   * Mackie(Loud) Onyx Satellite
 	   * Mackie(Loud) Tapco Link.Firewire
-	   * Mackie(Loud) d.4 pro
+	   * Mackie(Loud) d.2 pro/d.4 pro (built-in FireWire card with OXFW971 ASIC)
 	   * Mackie(Loud) U.420/U.420d
 	   * TASCAM FireOne
 	   * Stanton Controllers & Systems 1 Deck/Mixer
@@ -84,7 +84,7 @@ config SND_BEBOB
 	  * PreSonus FIREBOX/FIREPOD/FP10/Inspire1394
 	  * BridgeCo RDAudio1/Audio5
 	  * Mackie Onyx 1220/1620/1640 (FireWire I/O Card)
-	  * Mackie d.2 (FireWire Option) and d.2 Pro
+	  * Mackie d.2 (optional FireWire card with DM1000 ASIC)
 	  * Stanton FinalScratch 2 (ScratchAmp)
 	  * Tascam IF-FW/DM
 	  * Behringer XENIX UFX 1204/1604
diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index daeecfa8b9aa..90e98a6d1546 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -387,7 +387,7 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_BRIDGECO, 0x00010049, &spec_normal),
 	/* Mackie, Onyx 1220/1620/1640 (Firewire I/O Card) */
 	SND_BEBOB_DEV_ENTRY(VEN_MACKIE2, 0x00010065, &spec_normal),
-	// Mackie, d.2 (Firewire option card) and d.2 Pro (the card is built-in).
+	// Mackie, d.2 (optional Firewire card with DM1000).
 	SND_BEBOB_DEV_ENTRY(VEN_MACKIE1, 0x00010067, &spec_normal),
 	/* Stanton, ScratchAmp */
 	SND_BEBOB_DEV_ENTRY(VEN_STANTON, 0x00000001, &spec_normal),
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 9eea25c46dc7..5490637d278a 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -355,7 +355,7 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	 *  Onyx-i series (former models):	0x081216
 	 *  Mackie Onyx Satellite:		0x00200f
 	 *  Tapco LINK.firewire 4x6:		0x000460
-	 *  d.4 pro:				Unknown
+	 *  d.2 pro/d.4 pro (built-in card):	Unknown
 	 *  U.420:				Unknown
 	 *  U.420d:				Unknown
 	 */
-- 
2.27.0

