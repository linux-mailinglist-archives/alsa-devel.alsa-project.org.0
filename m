Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022139D6E9
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABE811680;
	Mon,  7 Jun 2021 10:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABE811680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053820;
	bh=03+LufOL/LGPPDRYGIMcHqBtmtTDGojeLWTdOYpT9+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOhrIaj19AwLpZbWk7vxwnmpRdmbKdHqqexj9XyVwTxiEW1BmVEWNg/CIsdpqD4fc
	 AtP/oBXpU6/NzYrvWLS+GWgY+72OeFVMOU28CKbvqJXA1FUTC5ls8sOmIrAP0vIMas
	 nRPAXZPHwz1e5tVQ2LFLEc+n3Un2TH5/fSFvYC20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D64F804EB;
	Mon,  7 Jun 2021 10:13:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EC95F802DF; Mon,  7 Jun 2021 10:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EF90F80276
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EF90F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="c14TxnGI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Jznd8u5X"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BCA05C0163;
 Mon,  7 Jun 2021 04:13:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Jun 2021 04:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ByyAaM+r0fDTE
 q3Pa3wcsL4rHOFoTELYVuoqyMMKHbQ=; b=c14TxnGIQl+pHbOSFEx4UJ3I9Cpnn
 kv1P26R+CXjzE1UofRDwHGgU3V9Fel0RqkKhphag/QQcT02yVWhjs62fGaFMLwPx
 dlH6fo/0M2VIXfi51RubcTZcUeW/pTFNJev0Vy8YwNij46jg80LEiHw0/Uqkfq9a
 yba8/AaVwPuLFesaClQS3FM7Dlt16tDJlS7KQrm1cL1yyFDFwhiVh7buE9dJ1/Jn
 tdH1L6r5ndzHVHRJW3fJvZTQ1uMH352PI0mOd02qhUdDgaIhZVZoAa+ot00nrUzN
 5MWIzkLjoiQLoznYtr49Q3Tc32Au87SHq2yiU5fOaTiC9s9ZWe1b9eIqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ByyAaM+r0fDTEq3Pa3wcsL4rHOFoTELYVuoqyMMKHbQ=; b=Jznd8u5X
 /MELiTF5Q/eHEmMSnHianTmA4VdgaxLg1p1MPwZQ+gSh17z/60fMW4eWGkvFlRgo
 i2yYYoKelABYax+4zvfDS1SexqVCKyr2F+86NlqvQfY7sNUe88moSO2GViyOXlLU
 rSdp6vAagjp1c/jY+lqkwEubiHbuKFSM0qk5xsXBRDT5/Jv31Db9PRHNcfDRPnKi
 EvP1MMOOM1yuwDrZiDZm6PWusPWYO5zFYatfD4bDgVrSoE1g8odZsR82sT7eX90/
 x/k2qFn90lY7qRnhXWVaNxseRisVsPDn8JeLudXA8JMAkTRIa4n56Dec6rCelmYd
 Mj7Y/9S+7EnTDg==
X-ME-Sender: <xms:EdW9YC0xFZR4P0tDGZjRBPe1iw6RrrQXMzIZQTdzqRHDkodbyhygmQ>
 <xme:EdW9YFF6prqa2744pyvj62dL2Yn40dGFLuXm0_EVgHyV3zrOngSB-YjwWE90-lfhJ
 L16g2tpnmga6Dl9QZ8>
X-ME-Received: <xmr:EdW9YK4y0wLDNmS9DzsRsYFTu18JlAurcpDDtQGcRGpXLTsuzvCF857q6n1Us2Q4EaQemJSQt668QwdNc3VX7w9T9bGDMILeKsLUobFMQLe-SQiM3W4H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:EdW9YD1UwNR3gbU_F-uDyK1eUYnO07vKEVCumnfl-Jrn2NrdTIrsgg>
 <xmx:EdW9YFFwEizvCFSmZn_hQppQmNTw3uAQ8cztMQoi9mMDcqydXLccfg>
 <xmx:EdW9YM80VZ4p1uuwfuLytMQ00Ja3MXr7HZAMJYSfEairxQqx7Ll1fA>
 <xmx:EdW9YDPKRAxR-GOqY75A7zWSIQqJwsognTFgJWK6inK_4UzUl8z7Ew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:13:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/9] ALSA: firewire-tascam: cease from delayed card
 registration
Date: Mon,  7 Jun 2021 17:12:47 +0900
Message-Id: <20210607081250.13397-7-o-takashi@sakamocchi.jp>
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
 sound/firewire/tascam/tascam.c | 92 +++++++++++-----------------------
 sound/firewire/tascam/tascam.h |  2 -
 2 files changed, 28 insertions(+), 66 deletions(-)

diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index 75f2edd8e78f..eb58d3fcf087 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -90,19 +90,31 @@ static void tscm_card_free(struct snd_card *card)
 
 	snd_tscm_transaction_unregister(tscm);
 	snd_tscm_stream_destroy_duplex(tscm);
+
+	mutex_destroy(&tscm->mutex);
+	fw_unit_put(tscm->unit);
 }
 
-static void do_registration(struct work_struct *work)
+static int snd_tscm_probe(struct fw_unit *unit,
+			   const struct ieee1394_device_id *entry)
 {
-	struct snd_tscm *tscm = container_of(work, struct snd_tscm, dwork.work);
+	struct snd_card *card;
+	struct snd_tscm *tscm;
 	int err;
 
-	err = snd_card_new(&tscm->unit->device, -1, NULL, THIS_MODULE, 0,
-			   &tscm->card);
+	err = snd_card_new(&unit->device, -1, NULL, THIS_MODULE, sizeof(*tscm), &card);
 	if (err < 0)
-		return;
-	tscm->card->private_free = tscm_card_free;
-	tscm->card->private_data = tscm;
+		return err;
+	card->private_free = tscm_card_free;
+
+	tscm = card->private_data;
+	tscm->unit = fw_unit_get(unit);
+	dev_set_drvdata(&unit->device, tscm);
+	tscm->card = card;
+
+	mutex_init(&tscm->mutex);
+	spin_lock_init(&tscm->lock);
+	init_waitqueue_head(&tscm->hwdep_wait);
 
 	err = identify_model(tscm);
 	if (err < 0)
@@ -130,81 +142,33 @@ static void do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = snd_card_register(tscm->card);
+	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
 
-	tscm->registered = true;
-
-	return;
-error:
-	snd_card_free(tscm->card);
-	dev_info(&tscm->unit->device,
-		 "Sound card registration failed: %d\n", err);
-}
-
-static int snd_tscm_probe(struct fw_unit *unit,
-			   const struct ieee1394_device_id *entry)
-{
-	struct snd_tscm *tscm;
-
-	/* Allocate this independent of sound card instance. */
-	tscm = devm_kzalloc(&unit->device, sizeof(struct snd_tscm), GFP_KERNEL);
-	if (!tscm)
-		return -ENOMEM;
-	tscm->unit = fw_unit_get(unit);
-	dev_set_drvdata(&unit->device, tscm);
-
-	mutex_init(&tscm->mutex);
-	spin_lock_init(&tscm->lock);
-	init_waitqueue_head(&tscm->hwdep_wait);
-
-	/* Allocate and register this sound card later. */
-	INIT_DEFERRABLE_WORK(&tscm->dwork, do_registration);
-	snd_fw_schedule_registration(unit, &tscm->dwork);
-
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 static void snd_tscm_update(struct fw_unit *unit)
 {
 	struct snd_tscm *tscm = dev_get_drvdata(&unit->device);
 
-	/* Postpone a workqueue for deferred registration. */
-	if (!tscm->registered)
-		snd_fw_schedule_registration(unit, &tscm->dwork);
-
 	snd_tscm_transaction_reregister(tscm);
 
-	/*
-	 * After registration, userspace can start packet streaming, then this
-	 * code block works fine.
-	 */
-	if (tscm->registered) {
-		mutex_lock(&tscm->mutex);
-		snd_tscm_stream_update_duplex(tscm);
-		mutex_unlock(&tscm->mutex);
-	}
+	mutex_lock(&tscm->mutex);
+	snd_tscm_stream_update_duplex(tscm);
+	mutex_unlock(&tscm->mutex);
 }
 
 static void snd_tscm_remove(struct fw_unit *unit)
 {
 	struct snd_tscm *tscm = dev_get_drvdata(&unit->device);
 
-	/*
-	 * Confirm to stop the work for registration before the sound card is
-	 * going to be released. The work is not scheduled again because bus
-	 * reset handler is not called anymore.
-	 */
-	cancel_delayed_work_sync(&tscm->dwork);
-
-	if (tscm->registered) {
-		// Block till all of ALSA character devices are released.
-		snd_card_free(tscm->card);
-	}
-
-	mutex_destroy(&tscm->mutex);
-	fw_unit_put(tscm->unit);
+	// Block till all of ALSA character devices are released.
+	snd_card_free(tscm->card);
 }
 
 static const struct ieee1394_device_id snd_tscm_id_table[] = {
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 28dad4eae9c9..d07ffcb27be6 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -70,8 +70,6 @@ struct snd_tscm {
 	struct mutex mutex;
 	spinlock_t lock;
 
-	bool registered;
-	struct delayed_work dwork;
 	const struct snd_tscm_spec *spec;
 
 	struct fw_iso_resources tx_resources;
-- 
2.27.0

