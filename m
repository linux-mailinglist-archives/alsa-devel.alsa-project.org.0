Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9739D6D8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA551688;
	Mon,  7 Jun 2021 10:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA551688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053695;
	bh=/ISHuaEZmJ6ziLxJA8mFxCXw3f4RX/7eqxNJDPj2uNU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjO1Hbh8VdbCXzMnZ1Kj1r/2N7hxzBKSZerfazwDZWNY9A0CpE8a42UWricpObNTQ
	 5BqsSPBLeKA4aCQOtpk3cUrWWAkAAEtrD7X/feADoOB1rC56TKscpNCNIdOVpRViGT
	 601dwPMMsSsPL6T+QV1sqhjhgeWzopF3nk6WC9tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3709CF804CB;
	Mon,  7 Jun 2021 10:13:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9894F804BD; Mon,  7 Jun 2021 10:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19B0AF800AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B0AF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="nLN/fIGi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="odFz0HUf"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E2B55C014D;
 Mon,  7 Jun 2021 04:12:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Jun 2021 04:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jDc0BZFBlp678
 pKRtC5H2OYDGRBp2UXsNjZ9puINb90=; b=nLN/fIGiGF87h5JQwfiX6fHvoJvR7
 7Wh3tjE504qi03Ixj7QWrM8qscqlLqDvXS2JyYA3mlmmpFTUSlNIIe504g6jVRDM
 odR78ItcQWowlj7UHHbRQrnqqOWuTC2GUWJlExCno4JP+E4NC7JiZNBtUQQWPVqx
 iQaJRZKgSsb577cl0OJnLH/JUeWXm2A1khZ2oU2qDhxnY7P/IbjNFxyFAQrdYvUQ
 zva8cD+5Gr/OsnEfKcQp4XoRuh1pySP/UTRgHy+PchUrCKzD7Ci2XBfdzqMaXwQn
 9dS3O8M+vgoV2BJPyWrOokXsd2AjZFItyMzeVy5ZrUkxSagdZGPvtV+Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jDc0BZFBlp678pKRtC5H2OYDGRBp2UXsNjZ9puINb90=; b=odFz0HUf
 CVZx8TCS6rH/GV40Fs7u5nlEy4rvnUbmpc9gcEyrn7Yb10MnbqA2IRTaYcRwYasP
 K2ZpIdA2/FylNFHmv6A02lMFijBE1pNND6BpMbEaDd3GQqe8g8auwN4gWZY+aoeE
 gtlNlcYDjDRg04V4IDMTW3JdoKZXUuS1uGG+1nGiS7MeGPM0nrV9RJhwQzVuuPYB
 Co9+/EwqkYOJXFEVvIfIqGYIBJb55JgYHqa96gfCAvGJJxeLSPKRBpXQezzkGPMY
 cn8StwyMo8RdVqc0sN9ETqhnYyHQ6g2rBP8tKW79IAOm3Ztju4ch4C3rn5VaLpWJ
 jrsmJAIH2yP8Ow==
X-ME-Sender: <xms:CtW9YGEtAyeLwudQrGML29As38PwgFDljJLk4wS-BajVKUKSdGU0oQ>
 <xme:CtW9YHWUgbIDk4rV_n-_hKJqAevHTsaV7jNFkym_iSTnmGuXL4T5n6QRF6MH8WwFj
 Haab0hAcDYNn0S4ki0>
X-ME-Received: <xmr:CtW9YAKsybX8c6MFeD1Hg6vudpsZ-Ztguu4dW1Fxo_4CMfDIp4Y3imD_o4Y739QYDPUtwnbbEpj396V0ByAeOM_vpmuOB-vBujvAMwNaf6Lt0iFBfqvB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:CtW9YAF1Iyov4VhUEBROqs-mDIavvCNdu1rPuTaKQzsWafvcWuJ4zw>
 <xmx:CtW9YMV7Z8ObyM_n8NlNWfr68DaDRjVESsDH72tzu77AMlIR-GHrew>
 <xmx:CtW9YDNNxZxykUAGQ2_dUVvNVz5-pgJVI-3u6mcX7XWu7bVOkekjsQ>
 <xmx:CtW9YHe_uReM0K4AXnmFVk2FLTC43-BQNy-pQ4lj9Ee6rswy7fQZeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:12:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/9] ALSA: bebob: cease from delayed card registration
Date: Mon,  7 Jun 2021 17:12:42 +0900
Message-Id: <20210607081250.13397-2-o-takashi@sakamocchi.jp>
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
 sound/firewire/bebob/bebob.c | 159 +++++++++++++----------------------
 sound/firewire/bebob/bebob.h |   4 -
 2 files changed, 57 insertions(+), 106 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 5938aa325f5e..e7dd112c31c5 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -136,6 +136,9 @@ bebob_card_free(struct snd_card *card)
 	mutex_unlock(&devices_mutex);
 
 	snd_bebob_stream_destroy_duplex(bebob);
+
+	mutex_destroy(&bebob->mutex);
+	fw_unit_put(bebob->unit);
 }
 
 static const struct snd_bebob_spec *
@@ -163,16 +166,30 @@ check_audiophile_booted(struct fw_unit *unit)
 	return strncmp(name, "FW Audiophile Bootloader", 24) != 0;
 }
 
-static void
-do_registration(struct work_struct *work)
+static int bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
 {
-	struct snd_bebob *bebob =
-			container_of(work, struct snd_bebob, dwork.work);
 	unsigned int card_index;
+	struct snd_card *card;
+	struct snd_bebob *bebob;
+	const struct snd_bebob_spec *spec;
 	int err;
 
-	if (bebob->registered)
-		return;
+	if (entry->vendor_id == VEN_FOCUSRITE &&
+	    entry->model_id == MODEL_FOCUSRITE_SAFFIRE_BOTH)
+		spec = get_saffire_spec(unit);
+	else if (entry->vendor_id == VEN_MAUDIO1 &&
+		 entry->model_id == MODEL_MAUDIO_AUDIOPHILE_BOTH &&
+		 !check_audiophile_booted(unit))
+		spec = NULL;
+	else
+		spec = (const struct snd_bebob_spec *)entry->driver_data;
+
+	if (spec == NULL) {
+		if (entry->vendor_id == VEN_MAUDIO1 || entry->vendor_id == VEN_MAUDIO2)
+			return snd_bebob_maudio_load_firmware(unit);
+		else
+			return -ENODEV;
+	}
 
 	mutex_lock(&devices_mutex);
 	for (card_index = 0; card_index < SNDRV_CARDS; card_index++) {
@@ -181,27 +198,36 @@ do_registration(struct work_struct *work)
 	}
 	if (card_index >= SNDRV_CARDS) {
 		mutex_unlock(&devices_mutex);
-		return;
+		return -ENOENT;
 	}
 
-	err = snd_card_new(&bebob->unit->device, index[card_index],
-			   id[card_index], THIS_MODULE, 0, &bebob->card);
+	err = snd_card_new(&unit->device, index[card_index], id[card_index], THIS_MODULE,
+			   sizeof(*bebob), &card);
 	if (err < 0) {
 		mutex_unlock(&devices_mutex);
-		return;
+		return err;
 	}
+	card->private_free = bebob_card_free;
 	set_bit(card_index, devices_used);
 	mutex_unlock(&devices_mutex);
 
-	bebob->card->private_free = bebob_card_free;
-	bebob->card->private_data = bebob;
+	bebob = card->private_data;
+	bebob->unit = fw_unit_get(unit);
+	dev_set_drvdata(&unit->device, bebob);
+	bebob->card = card;
+	bebob->card_index = card_index;
+
+	bebob->spec = spec;
+	mutex_init(&bebob->mutex);
+	spin_lock_init(&bebob->lock);
+	init_waitqueue_head(&bebob->hwdep_wait);
 
 	err = name_device(bebob);
 	if (err < 0)
 		goto error;
 
 	if (bebob->spec == &maudio_special_spec) {
-		if (bebob->entry->model_id == MODEL_MAUDIO_FW1814)
+		if (entry->model_id == MODEL_MAUDIO_FW1814)
 			err = snd_bebob_maudio_special_discover(bebob, true);
 		else
 			err = snd_bebob_maudio_special_discover(bebob, false);
@@ -214,8 +240,7 @@ do_registration(struct work_struct *work)
 	// M-Audio ProFire Lightbridge has a quirk to transfer packets with discontinuous cycle or
 	// data block counter in early stage of packet streaming. The cycle span from the first
 	// packet with event is variable.
-	if (bebob->entry->vendor_id == VEN_MAUDIO1 &&
-	    bebob->entry->model_id == MODEL_MAUDIO_PROFIRELIGHTBRIDGE)
+	if (entry->vendor_id == VEN_MAUDIO1 && entry->model_id == MODEL_MAUDIO_PROFIRELIGHTBRIDGE)
 		bebob->discontinuity_quirk = true;
 
 	err = snd_bebob_stream_init_duplex(bebob);
@@ -238,80 +263,26 @@ do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = snd_card_register(bebob->card);
+	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
 
-	bebob->registered = true;
-
-	return;
-error:
-	snd_card_free(bebob->card);
-	dev_info(&bebob->unit->device,
-		 "Sound card registration failed: %d\n", err);
-}
-
-static int
-bebob_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
-{
-	struct snd_bebob *bebob;
-	const struct snd_bebob_spec *spec;
-
-	if (entry->vendor_id == VEN_FOCUSRITE &&
-	    entry->model_id == MODEL_FOCUSRITE_SAFFIRE_BOTH)
-		spec = get_saffire_spec(unit);
-	else if (entry->vendor_id == VEN_MAUDIO1 &&
-		 entry->model_id == MODEL_MAUDIO_AUDIOPHILE_BOTH &&
-		 !check_audiophile_booted(unit))
-		spec = NULL;
-	else
-		spec = (const struct snd_bebob_spec *)entry->driver_data;
-
-	if (spec == NULL) {
-		if (entry->vendor_id == VEN_MAUDIO1 ||
-		    entry->vendor_id == VEN_MAUDIO2)
-			return snd_bebob_maudio_load_firmware(unit);
-		else
-			return -ENODEV;
-	}
-
-	/* Allocate this independent of sound card instance. */
-	bebob = devm_kzalloc(&unit->device, sizeof(struct snd_bebob),
-			     GFP_KERNEL);
-	if (!bebob)
-		return -ENOMEM;
-	bebob->unit = fw_unit_get(unit);
-	dev_set_drvdata(&unit->device, bebob);
-
-	bebob->entry = entry;
-	bebob->spec = spec;
-	mutex_init(&bebob->mutex);
-	spin_lock_init(&bebob->lock);
-	init_waitqueue_head(&bebob->hwdep_wait);
-
-	/* Allocate and register this sound card later. */
-	INIT_DEFERRABLE_WORK(&bebob->dwork, do_registration);
-
-	if (entry->vendor_id != VEN_MAUDIO1 ||
-	    (entry->model_id != MODEL_MAUDIO_FW1814 &&
-	     entry->model_id != MODEL_MAUDIO_PROJECTMIX)) {
-		snd_fw_schedule_registration(unit, &bebob->dwork);
-	} else {
-		/*
-		 * This is a workaround. This bus reset seems to have an effect
-		 * to make devices correctly handling transactions. Without
-		 * this, the devices have gap_count mismatch. This causes much
-		 * failure of transaction.
-		 *
-		 * Just after registration, user-land application receive
-		 * signals from dbus and starts I/Os. To avoid I/Os till the
-		 * future bus reset, registration is done in next update().
-		 */
-		fw_schedule_bus_reset(fw_parent_device(bebob->unit)->card,
-				      false, true);
+	if (entry->vendor_id == VEN_MAUDIO1 &&
+	    (entry->model_id == MODEL_MAUDIO_FW1814 || entry->model_id == MODEL_MAUDIO_PROJECTMIX)) {
+		// This is a workaround. This bus reset seems to have an effect to make devices
+		// correctly handling transactions. Without this, the devices have gap_count
+		// mismatch. This causes much failure of transaction.
+		//
+		// Just after registration, user-land application receive signals from dbus and
+		// starts I/Os. To avoid I/Os till the future bus reset, registration is done in
+		// next update().
+		fw_schedule_bus_reset(fw_parent_device(bebob->unit)->card, false, true);
 	}
 
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 /*
@@ -338,11 +309,7 @@ bebob_update(struct fw_unit *unit)
 	if (bebob == NULL)
 		return;
 
-	/* Postpone a workqueue for deferred registration. */
-	if (!bebob->registered)
-		snd_fw_schedule_registration(unit, &bebob->dwork);
-	else
-		fcp_bus_reset(bebob->unit);
+	fcp_bus_reset(bebob->unit);
 }
 
 static void bebob_remove(struct fw_unit *unit)
@@ -352,20 +319,8 @@ static void bebob_remove(struct fw_unit *unit)
 	if (bebob == NULL)
 		return;
 
-	/*
-	 * Confirm to stop the work for registration before the sound card is
-	 * going to be released. The work is not scheduled again because bus
-	 * reset handler is not called anymore.
-	 */
-	cancel_delayed_work_sync(&bebob->dwork);
-
-	if (bebob->registered) {
-		// Block till all of ALSA character devices are released.
-		snd_card_free(bebob->card);
-	}
-
-	mutex_destroy(&bebob->mutex);
-	fw_unit_put(bebob->unit);
+	// Block till all of ALSA character devices are released.
+	snd_card_free(bebob->card);
 }
 
 static const struct snd_bebob_rate_spec normal_rate_spec = {
diff --git a/sound/firewire/bebob/bebob.h b/sound/firewire/bebob/bebob.h
index cba6793bfdb2..edd93699ce1a 100644
--- a/sound/firewire/bebob/bebob.h
+++ b/sound/firewire/bebob/bebob.h
@@ -83,10 +83,6 @@ struct snd_bebob {
 	struct mutex mutex;
 	spinlock_t lock;
 
-	bool registered;
-	struct delayed_work dwork;
-
-	const struct ieee1394_device_id *entry;
 	const struct snd_bebob_spec *spec;
 
 	unsigned int midi_input_ports;
-- 
2.27.0

