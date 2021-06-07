Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAEF39D6DA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CA41168D;
	Mon,  7 Jun 2021 10:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CA41168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053731;
	bh=z/BG1uSbS3B6aYFbcfW9c6dxn/+GH38EulJ8S7QivwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goGugGaVCiJoNkSurD7pwyCIVk9ZrcfSvnsEPOhUOfSowaOyrxWnCDHeFIi+I0otO
	 pwH9Do0Zlsx/Qy3WukAfYyW6LQkrMuL/Z/AoogrJI6TC4HC/j5ALYQjFsMFEvPXcMN
	 4d1dGQNnWKpVB0mbUDFBaDm1ezrbTgowH9VCzbTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 272F8F804BD;
	Mon,  7 Jun 2021 10:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84748F804CF; Mon,  7 Jun 2021 10:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1222F8020D
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1222F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EW7B9Cfj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uNtHv8kj"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AEF45C0112;
 Mon,  7 Jun 2021 04:13:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 04:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=77rMq5vwDPDPp
 8iC+iKVfbUPbzVG1KWCHo3rW16jQMk=; b=EW7B9CfjHvBtF6yAyradeJVOBNrjb
 VbamlVtALk+Xs2yFBXoQ0XGDD5TU/hH6LqCJkTmn/QEvfBN4rbohOxn0KFZ9nSgA
 K7O/NkEoaIZMi0afHMeOn64Y7Pe9Q2sB/1YLpJ+ANHaYCd5NQOVLzySTwiS1XCaH
 +UfXhQjax0tNqBYAMjarIGzmBvZIlinrkorJrd6s4qU0+UHSyqQ3e5wvEoL1q1hD
 CxSX4lLlP+IJ/xKeOUntNT3LRltzy6/olI0u8By9cOb2Ckc3OP4fSb6sl+tDH15A
 L8SiYKsXTG2oKMD0oOnNmcs2lMA3WtMxyQueqbKqNBgyhjSQDR3a9AQeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=77rMq5vwDPDPp8iC+iKVfbUPbzVG1KWCHo3rW16jQMk=; b=uNtHv8kj
 NDcGCChlV/QJtjZZrk5l0A3vFhPvghtI2OhJfe6Cq6njvl7VHUKt6nkw0VHld7Hi
 OqjXjO4L+WoutJHlSZ7gHkbdRBA15YYoZ+rFVZV5udbaWs0v9MkUQ9UV8f7Svpbw
 PqdQOttj9z7MxxCV9XUQfg6YrivUZvC5D22tvajYMcfXMcG7DqkWikOzYTbsz0AF
 mRD4E4ROWOUyVagt3yvjQAv8PfESbZRy+eiLZHcgMJDqhnENym/WsLRnD2GVun0z
 GaT5LpvVAsi1Pd5Gx+gU8DZSq9w1RcMEh6NEUUBfIWByui8c6cinixl23N1Dmor4
 rICQa5JKTEF6Jw==
X-ME-Sender: <xms:C9W9YHxzPhWa58QD8rPhNxVUYTc-S9giQM205gBF4pGA1IF6Nc_IQw>
 <xme:C9W9YPSvnm0l7Ismz2GkRYcoFlVXDN3RQCuLXjKYosqxr1hfUx_jt_M7Kev5BiUlo
 DV-MQiyDEMKIcdtr6g>
X-ME-Received: <xmr:C9W9YBV79gJ9ktv3_Eb6X1E1rPVfdwrrGfjZQbpk8LScy6YXGC2eDQdkNMZCyrZAxw8ZsRciyeUY8YP1XSRIPfqhh4Q1gfGtMFcejTv8JWcfNrano1Gk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:C9W9YBiyxqcuM4ZXyAMvuWzMMypbyQK0T6x0GbtKv7SHg0h1SHICLw>
 <xmx:C9W9YJAo_y0XqISw6_k9WEh4TwyWVy7a1zV0X_JnFu4aWtLHmuNo1w>
 <xmx:C9W9YKJBvJlntyfXal5qCpOJvVNziSvdN74fazWtzrgnn9blmo6NuA>
 <xmx:DNW9YG7oCMppGa0-EyGV6nGefj8cGa-Je9E9Ctmg6jwKDMS446HYtw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:12:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/9] ALSA: fireworks: cease from delayed card registration
Date: Mon,  7 Jun 2021 17:12:43 +0900
Message-Id: <20210607081250.13397-3-o-takashi@sakamocchi.jp>
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
 sound/firewire/fireworks/fireworks.c | 107 +++++++++------------------
 sound/firewire/fireworks/fireworks.h |   3 -
 2 files changed, 33 insertions(+), 77 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index b1cc013a3540..865dac3b37e6 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -194,19 +194,19 @@ efw_card_free(struct snd_card *card)
 
 	snd_efw_stream_destroy_duplex(efw);
 	snd_efw_transaction_remove_instance(efw);
+
+	mutex_destroy(&efw->mutex);
+	fw_unit_put(efw->unit);
 }
 
-static void
-do_registration(struct work_struct *work)
+static int efw_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
 {
-	struct snd_efw *efw = container_of(work, struct snd_efw, dwork.work);
 	unsigned int card_index;
+	struct snd_card *card;
+	struct snd_efw *efw;
 	int err;
 
-	if (efw->registered)
-		return;
-
-	/* check registered cards */
+	// check registered cards.
 	mutex_lock(&devices_mutex);
 	for (card_index = 0; card_index < SNDRV_CARDS; ++card_index) {
 		if (!test_bit(card_index, devices_used) && enable[card_index])
@@ -214,26 +214,32 @@ do_registration(struct work_struct *work)
 	}
 	if (card_index >= SNDRV_CARDS) {
 		mutex_unlock(&devices_mutex);
-		return;
+		return -ENOENT;
 	}
 
-	err = snd_card_new(&efw->unit->device, index[card_index],
-			   id[card_index], THIS_MODULE, 0, &efw->card);
+	err = snd_card_new(&unit->device, index[card_index], id[card_index], THIS_MODULE,
+			   sizeof(*efw), &card);
 	if (err < 0) {
 		mutex_unlock(&devices_mutex);
-		return;
+		return err;
 	}
+	card->private_free = efw_card_free;
 	set_bit(card_index, devices_used);
 	mutex_unlock(&devices_mutex);
 
-	efw->card->private_free = efw_card_free;
-	efw->card->private_data = efw;
+	efw = card->private_data;
+	efw->unit = fw_unit_get(unit);
+	dev_set_drvdata(&unit->device, efw);
+	efw->card = card;
+	efw->card_index = card_index;
+
+	mutex_init(&efw->mutex);
+	spin_lock_init(&efw->lock);
+	init_waitqueue_head(&efw->hwdep_wait);
 
-	/* prepare response buffer */
-	snd_efw_resp_buf_size = clamp(snd_efw_resp_buf_size,
-				      SND_EFW_RESPONSE_MAXIMUM_BYTES, 4096U);
-	efw->resp_buf = devm_kzalloc(&efw->card->card_dev,
-				     snd_efw_resp_buf_size, GFP_KERNEL);
+	// prepare response buffer.
+	snd_efw_resp_buf_size = clamp(snd_efw_resp_buf_size, SND_EFW_RESPONSE_MAXIMUM_BYTES, 4096U);
+	efw->resp_buf = devm_kzalloc(&card->card_dev, snd_efw_resp_buf_size, GFP_KERNEL);
 	if (!efw->resp_buf) {
 		err = -ENOMEM;
 		goto error;
@@ -265,80 +271,33 @@ do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = snd_card_register(efw->card);
+	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
 
-	efw->registered = true;
-
-	return;
-error:
-	snd_card_free(efw->card);
-	dev_info(&efw->unit->device,
-		 "Sound card registration failed: %d\n", err);
-}
-
-static int
-efw_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
-{
-	struct snd_efw *efw;
-
-	efw = devm_kzalloc(&unit->device, sizeof(struct snd_efw), GFP_KERNEL);
-	if (efw == NULL)
-		return -ENOMEM;
-	efw->unit = fw_unit_get(unit);
-	dev_set_drvdata(&unit->device, efw);
-
-	mutex_init(&efw->mutex);
-	spin_lock_init(&efw->lock);
-	init_waitqueue_head(&efw->hwdep_wait);
-
-	/* Allocate and register this sound card later. */
-	INIT_DEFERRABLE_WORK(&efw->dwork, do_registration);
-	snd_fw_schedule_registration(unit, &efw->dwork);
-
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 static void efw_update(struct fw_unit *unit)
 {
 	struct snd_efw *efw = dev_get_drvdata(&unit->device);
 
-	/* Postpone a workqueue for deferred registration. */
-	if (!efw->registered)
-		snd_fw_schedule_registration(unit, &efw->dwork);
-
 	snd_efw_transaction_bus_reset(efw->unit);
 
-	/*
-	 * After registration, userspace can start packet streaming, then this
-	 * code block works fine.
-	 */
-	if (efw->registered) {
-		mutex_lock(&efw->mutex);
-		snd_efw_stream_update_duplex(efw);
-		mutex_unlock(&efw->mutex);
-	}
+	mutex_lock(&efw->mutex);
+	snd_efw_stream_update_duplex(efw);
+	mutex_unlock(&efw->mutex);
 }
 
 static void efw_remove(struct fw_unit *unit)
 {
 	struct snd_efw *efw = dev_get_drvdata(&unit->device);
 
-	/*
-	 * Confirm to stop the work for registration before the sound card is
-	 * going to be released. The work is not scheduled again because bus
-	 * reset handler is not called anymore.
-	 */
-	cancel_delayed_work_sync(&efw->dwork);
-
-	if (efw->registered) {
-		// Block till all of ALSA character devices are released.
-		snd_card_free(efw->card);
-	}
-
-	mutex_destroy(&efw->mutex);
-	fw_unit_put(efw->unit);
+	// Block till all of ALSA character devices are released.
+	snd_card_free(efw->card);
 }
 
 static const struct ieee1394_device_id efw_id_table[] = {
diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 49e12cf7c0e3..2c0c7de8b824 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -65,9 +65,6 @@ struct snd_efw {
 	struct mutex mutex;
 	spinlock_t lock;
 
-	bool registered;
-	struct delayed_work dwork;
-
 	/* for transaction */
 	u32 seqnum;
 	bool resp_addr_changable;
-- 
2.27.0

