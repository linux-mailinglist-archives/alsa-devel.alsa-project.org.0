Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293339D6DB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 946AF1685;
	Mon,  7 Jun 2021 10:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 946AF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053745;
	bh=8edTWF4F1VsKB+4A95aA5daEqKo0Dmb9btcEtpi4Gbk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=grjx5eZp7EMLWjChED+bmyNGwiDg753vbQviiNCYa5FwrdLRecbaZASdC3XxMK5r4
	 7mOMOcniILeFxpf4sBf+SEnPREKPYWQzuxPRDD+TisIEvmi+SYZRCrZgFMZDFKaA5n
	 DsqcX2o4DSklV85gf7eX1Bb4rTCAsLqVgB4g2l+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07636F804D9;
	Mon,  7 Jun 2021 10:13:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0725EF804BD; Mon,  7 Jun 2021 10:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 492CDF80212
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 492CDF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="laKwiucn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sog1DJu8"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E8D075C0150;
 Mon,  7 Jun 2021 04:13:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 04:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=p2Wud12XupASb
 hQ/UwxPPVfA9mJAS9EpWBQHWAG+UOM=; b=laKwiucnSEGBtEoKNAHqdE4sKUb2G
 zz7O+10IrQLz+Rhs4lJkIMCwuNXRnraV2KlNfKyU1cNV6URQMtTQ9KbztbtrL2AC
 ulwoLwcxQOBGDhIOnhD4FBC9cT0ZFQM/EXMxDdYjP2ljKxxORA70NNYGTjBF7diU
 beR4g5LmGrqWy1lZVRxrgCAesWlfT7e39c2OtVSHR5yens65jvNzV2Q4l2sTEbb0
 xYVCTaS/K/69SX/7/q8TvNZHFT1N+GP9lsv/vslga0XI0DDOmhp65jcj0S9U1RaH
 jI7GU2JcdURQ7xxDQOjq00wP0d530YodKXFLj4sZsKkndUOozkico8i2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=p2Wud12XupASbhQ/UwxPPVfA9mJAS9EpWBQHWAG+UOM=; b=sog1DJu8
 yV4B04MUOPap6pEbraqUpzO15X/j5dis5MCUOCM5ReoLiXh0ZEBeNYfiTMvJT3Kk
 IHYext+OYLiZbjBdqrxMWCYNPE38QDxaOD75eUat5pJljE+V9X01BH3VgVOJTfXD
 h7v4DYkrMynZzClX9RXH/UZvjqkQPcy950vHVyqk8TmnIj6qt2C8a5fdvL5wiA8E
 jybuQN30Xvx9wZObrZaBPC+X50UH215hB/AWZgWglwsmBFfZbTSFSD6dTzJKtsES
 zjJu3xdbrhUs7OR3NpPmJ7WAuA0QjmL9eYKNhudT1bo5l/Rl7eAffp3xMbj4C6rj
 UZCX8ABSevCtuQ==
X-ME-Sender: <xms:D9W9YJv0OD1wEtL9fO7FUCWwZLfz76Z8P4f_JjAVUIBvO9U_YyEEJQ>
 <xme:D9W9YCeE3W3d-mZ2CIZO8OiVY01H5a_6aXJM-RWDQ2OyiPRdgHNmwM4aVnDtZCDCQ
 eYVWF8dm7Wyw60Imv0>
X-ME-Received: <xmr:D9W9YMymYGmS0NqqfnfE7ng7x6ey0w1CbDjY7UI0R08WvLrAv_aQBVWQ3ykA-j055QpwtLZT8LPiNwN5RRZUlU5K7PDPZxNUynWvsMR5Eqin8VRRPlIy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:D9W9YAO59aRaSbm6MYLUTE-fsu1kXGnwM7VLDM4N4xHQJ6d9iEu3kg>
 <xmx:D9W9YJ884GWuezuejYzdFCEOAeqVI8RMGNzahwgtGL04KobKsuWIgA>
 <xmx:D9W9YAVGaxwhZ22-T-hK5_zvPW1MphFFl3re7UKEOaaWynCM0gONnA>
 <xmx:D9W9YLnBW5cELrefaPK6s-rD2Q9HEoTUBl-0HX-CwBlFAWXm1Lw2Yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:13:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/9] ALSA: firewire-digi00x: cease from delayed card
 registration
Date: Mon,  7 Jun 2021 17:12:46 +0900
Message-Id: <20210607081250.13397-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210607081250.13397-1-o-takashi@sakamocchi.jp>
References: <20210607081250.13397-1-o-takashi@sakamocchi.jp>
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

The delayed registration of sound card instance brings less benefit than
complication of kobject management. This commit ceases from it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/digi00x/digi00x.c | 101 +++++++++----------------------
 sound/firewire/digi00x/digi00x.h |   3 -
 2 files changed, 29 insertions(+), 75 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x.c b/sound/firewire/digi00x/digi00x.c
index ab8408966ec3..995302808c27 100644
--- a/sound/firewire/digi00x/digi00x.c
+++ b/sound/firewire/digi00x/digi00x.c
@@ -47,23 +47,32 @@ static void dg00x_card_free(struct snd_card *card)
 
 	snd_dg00x_stream_destroy_duplex(dg00x);
 	snd_dg00x_transaction_unregister(dg00x);
+
+	mutex_destroy(&dg00x->mutex);
+	fw_unit_put(dg00x->unit);
 }
 
-static void do_registration(struct work_struct *work)
+static int snd_dg00x_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
 {
-	struct snd_dg00x *dg00x =
-			container_of(work, struct snd_dg00x, dwork.work);
+	struct snd_card *card;
+	struct snd_dg00x *dg00x;
 	int err;
 
-	if (dg00x->registered)
-		return;
-
-	err = snd_card_new(&dg00x->unit->device, -1, NULL, THIS_MODULE, 0,
-			   &dg00x->card);
+	err = snd_card_new(&unit->device, -1, NULL, THIS_MODULE, sizeof(*dg00x), &card);
 	if (err < 0)
-		return;
-	dg00x->card->private_free = dg00x_card_free;
-	dg00x->card->private_data = dg00x;
+		return err;
+	card->private_free = dg00x_card_free;
+
+	dg00x = card->private_data;
+	dg00x->unit = fw_unit_get(unit);
+	dev_set_drvdata(&unit->device, dg00x);
+	dg00x->card = card;
+
+	mutex_init(&dg00x->mutex);
+	spin_lock_init(&dg00x->lock);
+	init_waitqueue_head(&dg00x->hwdep_wait);
+
+	dg00x->is_console = entry->model_id == MODEL_CONSOLE;
 
 	err = name_card(dg00x);
 	if (err < 0)
@@ -91,85 +100,33 @@ static void do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = snd_card_register(dg00x->card);
+	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
 
-	dg00x->registered = true;
-
-	return;
-error:
-	snd_card_free(dg00x->card);
-	dev_info(&dg00x->unit->device,
-		 "Sound card registration failed: %d\n", err);
-}
-
-static int snd_dg00x_probe(struct fw_unit *unit,
-			   const struct ieee1394_device_id *entry)
-{
-	struct snd_dg00x *dg00x;
-
-	/* Allocate this independent of sound card instance. */
-	dg00x = devm_kzalloc(&unit->device, sizeof(struct snd_dg00x),
-			     GFP_KERNEL);
-	if (!dg00x)
-		return -ENOMEM;
-
-	dg00x->unit = fw_unit_get(unit);
-	dev_set_drvdata(&unit->device, dg00x);
-
-	mutex_init(&dg00x->mutex);
-	spin_lock_init(&dg00x->lock);
-	init_waitqueue_head(&dg00x->hwdep_wait);
-
-	dg00x->is_console = entry->model_id == MODEL_CONSOLE;
-
-	/* Allocate and register this sound card later. */
-	INIT_DEFERRABLE_WORK(&dg00x->dwork, do_registration);
-	snd_fw_schedule_registration(unit, &dg00x->dwork);
-
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 static void snd_dg00x_update(struct fw_unit *unit)
 {
 	struct snd_dg00x *dg00x = dev_get_drvdata(&unit->device);
 
-	/* Postpone a workqueue for deferred registration. */
-	if (!dg00x->registered)
-		snd_fw_schedule_registration(unit, &dg00x->dwork);
-
 	snd_dg00x_transaction_reregister(dg00x);
 
-	/*
-	 * After registration, userspace can start packet streaming, then this
-	 * code block works fine.
-	 */
-	if (dg00x->registered) {
-		mutex_lock(&dg00x->mutex);
-		snd_dg00x_stream_update_duplex(dg00x);
-		mutex_unlock(&dg00x->mutex);
-	}
+	mutex_lock(&dg00x->mutex);
+	snd_dg00x_stream_update_duplex(dg00x);
+	mutex_unlock(&dg00x->mutex);
 }
 
 static void snd_dg00x_remove(struct fw_unit *unit)
 {
 	struct snd_dg00x *dg00x = dev_get_drvdata(&unit->device);
 
-	/*
-	 * Confirm to stop the work for registration before the sound card is
-	 * going to be released. The work is not scheduled again because bus
-	 * reset handler is not called anymore.
-	 */
-	cancel_delayed_work_sync(&dg00x->dwork);
-
-	if (dg00x->registered) {
-		// Block till all of ALSA character devices are released.
-		snd_card_free(dg00x->card);
-	}
-
-	mutex_destroy(&dg00x->mutex);
-	fw_unit_put(dg00x->unit);
+	// Block till all of ALSA character devices are released.
+	snd_card_free(dg00x->card);
 }
 
 static const struct ieee1394_device_id snd_dg00x_id_table[] = {
diff --git a/sound/firewire/digi00x/digi00x.h b/sound/firewire/digi00x/digi00x.h
index 129de8edd5ea..82b647d383c5 100644
--- a/sound/firewire/digi00x/digi00x.h
+++ b/sound/firewire/digi00x/digi00x.h
@@ -37,9 +37,6 @@ struct snd_dg00x {
 	struct mutex mutex;
 	spinlock_t lock;
 
-	bool registered;
-	struct delayed_work dwork;
-
 	struct amdtp_stream tx_stream;
 	struct fw_iso_resources tx_resources;
 
-- 
2.27.0

