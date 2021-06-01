Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AD396EC0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 10:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB39F169F;
	Tue,  1 Jun 2021 10:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB39F169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622535595;
	bh=TJQYc6g5T8oW2i7PmuYRFN60xpk8gy/sD6dfDNSEkeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cF/m/58UqysU4f+3vFOUKfaWrg6EgMFY1487fnLw+KChxcyxk26kG0KIUNwrV3kVp
	 6cZtFFjAIhfKxTtLwsolVi/Tk9pkGdluv6YvHheDAiPeXSUgKKERsLPv1VOwnRHQPU
	 1cBu1VuoIUsh0+T5raq1WAlgrjGrcj+Ekn3KgcPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DAE2F804BB;
	Tue,  1 Jun 2021 10:18:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4816F804B1; Tue,  1 Jun 2021 10:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91A6AF800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 10:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A6AF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="2IvVffT0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qA7wUJy9"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2575310D3;
 Tue,  1 Jun 2021 04:18:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 01 Jun 2021 04:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wY/w/UIXGVb1y
 +KyDya97gK1sT1t8Q9iFVV4XOs1wFw=; b=2IvVffT0qQD42lCKkyt88TwUWqYHP
 wyBO2hPo+Q/j3I8UtRAzAaSibzvj46nB9Q6xoUb/nOHO1rGCOpOUtNJySJAvVT9u
 9bu9p3Ja3lGUnD0Vxj+gqPDfcp9dXms95wPXDZ2ID0S6OsSdM4RyWkuH1KWFsHhc
 z1/IWRk5ErvlOZKCFBoPKQKkCDXbhdVb1osteq2B1g4zzGBplHZVRei+lqQSkwzo
 uIAwn+xbLxqrf3LcuibTjRMyEEx6APgeELUEioRfqYGRfvP81EBA6ItJ38/SDwac
 5CnMTY3yv2+o9gPEqycENh+VEeVE3cJPRKGZqAyXFnAitCFKa7cDCmhDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wY/w/UIXGVb1y+KyDya97gK1sT1t8Q9iFVV4XOs1wFw=; b=qA7wUJy9
 yRVthqLYgM0dPDWMyUMsGUaZANow6SBhE2U6HPdo7oaFNCPn1RbqhKb/atz5ufjr
 qNosGeCtiBOcj+B0/PwfEPy8dpPrW033wmcM/ucBxWs6n+QoSlDiMGO/BA8hVIDP
 A3nKCL8Tlwxaz6zB+/slCZvo6ICIhahZqaVrPUXREaDdX7OoMyy2ThZ4j9XY1ybc
 dFGURatdY+VbWgyKsQ3TPUfCrO++GM5C8EawteC1U8SAJRHDv7FzLcswukmnfbeB
 QfBIt8U1zowq5eE6bCSxYonlbC+ZMIgIhVdPno5vXxULs8FcIOyl6H4XREfOE46n
 utw7ojdPdHLoig==
X-ME-Sender: <xms:Oe21YMFuW4k_L3MGov2DsbMWBaRu5dTSuK4VxqTbNicX9b6h0grG4Q>
 <xme:Oe21YFWqUWGEuK1SekVIBRPJwWlyN8eOxG8-6VWrQZfXOLHEwsCAJRM3G2aU8yDq7
 NDbrRXrI4O_mLgn-WU>
X-ME-Received: <xmr:Oe21YGI8ioIlyC71RG_1j2t16sdISUnEJhXezWfHhyyRh5_-7vLIS8fg9dbxYT8j2BxHMF_e9cXpeWceadTvD45eDLvJOgWp2dM6ROt0T44IuaDGqpjv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Oe21YOEtV7LHesim2EasKQgoW_59GfInodM-FhnYGnEmOB0joiGSTw>
 <xmx:Oe21YCVzBui-1T3aH8ULj-gIYrTM3XyAQSUyBr4I0FTMREDbH2oQPQ>
 <xmx:Oe21YBPhNFOv2lxBbv8jXDHnmiU-cr86KsskGI0eYnICEw_rG9kcbw>
 <xmx:Oe21YFe0l56PPjNReph7ysPKO40aFkBjw6D3tsT4s_2n6TQvI6bjwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 04:18:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: dice: wait just for NOTIFY_CLOCK_ACCEPTED after
 GLOBAL_CLOCK_SELECT operation
Date: Tue,  1 Jun 2021 17:17:51 +0900
Message-Id: <20210601081753.9191-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
References: <20210601081753.9191-1-o-takashi@sakamocchi.jp>
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

NOTIFY_CLOCK_ACCEPTED notification is always generated as a result of
GLOBAL_CLOCK_SELECT operation, however NOTIFY_LOCK_CHG notification
doesn't, as long as the selected clock is already configured. In the case,
ALSA dice driver waits so long. It's inconvenient for some devices to lock
to the sequence of value in syt field of CIP header in rx packets.

This commit wait just for NOTIFY_CLOCK_ACCEPTED notification by reverting
changes partially done by two commits below:

 * commit fbeac84dbe9e ("ALSA: dice: old firmware optimization for Dice notification")
 * commit aec045b80d79 ("ALSA: dice: change notification mask to detect lock status change")

I note that the successful lock to the sequence of value in syt field of
CIP header in rx packets results in NOTIFY_EXT_STATUS notification, then
EXT_STATUS_ARX1_LOCKED bit stands in GLOBAL_EXTENDED_STATUS register.
The notification can occur enough after receiving the batch of rx packets.
When the sequence doesn't include value in syt field of CIP header in rx
packets adequate to the device, the notification occurs again and the bit
is off.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c      | 29 +++++++-------------------
 sound/firewire/dice/dice-transaction.c |  2 +-
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index 0fb8b4ae6a0a..d7220160c778 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -9,7 +9,7 @@
 #include "dice.h"
 
 #define	READY_TIMEOUT_MS	200
-#define NOTIFICATION_TIMEOUT_MS	(2 * MSEC_PER_SEC)
+#define NOTIFICATION_TIMEOUT_MS	100
 
 struct reg_params {
 	unsigned int count;
@@ -57,13 +57,9 @@ int snd_dice_stream_get_rate_mode(struct snd_dice *dice, unsigned int rate,
 	return -EINVAL;
 }
 
-/*
- * This operation has an effect to synchronize GLOBAL_STATUS/GLOBAL_SAMPLE_RATE
- * to GLOBAL_STATUS. Especially, just after powering on, these are different.
- */
-static int ensure_phase_lock(struct snd_dice *dice, unsigned int rate)
+static int select_clock(struct snd_dice *dice, unsigned int rate)
 {
-	__be32 reg, nominal;
+	__be32 reg;
 	u32 data;
 	int i;
 	int err;
@@ -94,19 +90,8 @@ static int ensure_phase_lock(struct snd_dice *dice, unsigned int rate)
 		return err;
 
 	if (wait_for_completion_timeout(&dice->clock_accepted,
-			msecs_to_jiffies(NOTIFICATION_TIMEOUT_MS)) == 0) {
-		/*
-		 * Old versions of Dice firmware transfer no notification when
-		 * the same clock status as current one is set. In this case,
-		 * just check current clock status.
-		 */
-		err = snd_dice_transaction_read_global(dice, GLOBAL_STATUS,
-						&nominal, sizeof(nominal));
-		if (err < 0)
-			return err;
-		if (!(be32_to_cpu(nominal) & STATUS_SOURCE_LOCKED))
-			return -ETIMEDOUT;
-	}
+			msecs_to_jiffies(NOTIFICATION_TIMEOUT_MS)) == 0)
+		return -ETIMEDOUT;
 
 	return 0;
 }
@@ -304,7 +289,7 @@ int snd_dice_stream_reserve_duplex(struct snd_dice *dice, unsigned int rate,
 		// Just after owning the unit (GLOBAL_OWNER), the unit can
 		// return invalid stream formats. Selecting clock parameters
 		// have an effect for the unit to refine it.
-		err = ensure_phase_lock(dice, rate);
+		err = select_clock(dice, rate);
 		if (err < 0)
 			return err;
 
@@ -646,7 +631,7 @@ int snd_dice_stream_detect_current_formats(struct snd_dice *dice)
 	 * invalid stream formats. Selecting clock parameters have an effect
 	 * for the unit to refine it.
 	 */
-	err = ensure_phase_lock(dice, rate);
+	err = select_clock(dice, rate);
 	if (err < 0)
 		return err;
 
diff --git a/sound/firewire/dice/dice-transaction.c b/sound/firewire/dice/dice-transaction.c
index 2c0dde29a024..92941ef83cd5 100644
--- a/sound/firewire/dice/dice-transaction.c
+++ b/sound/firewire/dice/dice-transaction.c
@@ -155,7 +155,7 @@ static void dice_notification(struct fw_card *card, struct fw_request *request,
 
 	fw_send_response(card, request, RCODE_COMPLETE);
 
-	if (bits & NOTIFY_LOCK_CHG)
+	if (bits & NOTIFY_CLOCK_ACCEPTED)
 		complete(&dice->clock_accepted);
 	wake_up(&dice->hwdep_wait);
 }
-- 
2.27.0

