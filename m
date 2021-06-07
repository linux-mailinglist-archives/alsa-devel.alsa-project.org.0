Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9232E39D6F0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB531691;
	Mon,  7 Jun 2021 10:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB531691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053872;
	bh=fg3kwo6hqo9hDYCPl1IEOFa1RBt/PZoB+AakqyKBzxE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TtbVReNg19P22zmDyMbU4xre3bi5SwyQVzQ0J9z4ivaSbPe5tL0Ka5GpUqM/52a6u
	 3XOJOXIDyncF2FLSu2LUiqXQZoLkhV9FAs7TvRoSvO3nzHdGys+ajfz2esKG2eDwcO
	 3G3tLzvNBmKjXh2jgYlKLRW8Q60QiZmYb4CP686w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 592C2F80507;
	Mon,  7 Jun 2021 10:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF00F804CC; Mon,  7 Jun 2021 10:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FA90F8026C
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FA90F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="T6LG1HGc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TSnS5Iv/"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5492F5C0051;
 Mon,  7 Jun 2021 04:13:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 04:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=r+qHfcEFnnY5a
 6LgYQwVfIyufVhbTVYUyqgj60vzq08=; b=T6LG1HGcyJidsSdjV1Kn1GRdjSjRU
 AWPgOeYVGZ8k8y94Grt49T0bJj4uK+pkGvqhuY0qUTZF5C17A6+5UJeRaXlgmPII
 lxR3xtpdO7OqFFypcxFkt74yJrANqFJdWGdnWq9d7756uOIa7bVViYulWeevRgUT
 p7BvJnQKt6cJ/YaCJJoUJXJ40YHeVgLPqDo7ZP/69GlPPmeJO2cxtD3sbs452tR4
 1oGWQH2cBDsK8P0viqwAh/kc0vYZhTTiOGUSqkDmqnVnxJlhCoN2MmVjELnMKZth
 PiDralMCammxrJDbBtsqvzAF0c40C+FmWpCkvtBwCfv1MAw6U3OpHzLvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=r+qHfcEFnnY5a6LgYQwVfIyufVhbTVYUyqgj60vzq08=; b=TSnS5Iv/
 oSO334Y8AXk0MwKVj9x05eloa3doFhW3UjTk5gZrZhIcaze6+NAHFJGNZnBVmDNf
 EKtK9t6Fa90D3dlek6vY/OpIk3cfTTocX+v/nDG07OqwZs3Qe6qNzJSJI2XZeujP
 qaFIXrnniyRhXQbxzAjmUve8OB/2/60mG5UcBWFYyW4wA9rbeSi/B3zst9FugaZG
 GTPInFmEt7ztRisUgcn7ikInD2R8gdC2VwQrb+hkbRTAepH8ROkWH8hdBH/QPjdA
 4PTvu/WXN6Gt6WTPASyj14bU5FdYoAW/BdWN+WuEet40fdMHaMFEBLLcKRG3BYZE
 xMXv/8C7ZxN1yw==
X-ME-Sender: <xms:DdW9YMp-b32S2Zvj0G5jFcsqLZa3AlQovrdssF-NTXbEf8LXjq9i0w>
 <xme:DdW9YCqUkOqBIxdj5cD_mlIuFrxrez5F32o6nDLHh5wcjwHZ1VLsbCK7YCIFCGwr-
 gGaf8RnF-J6Dpwm9-I>
X-ME-Received: <xmr:DdW9YBMqxb5hLNFjDvfIwH8y5hVTcPjBNPi1TmaQ2CV8R0w11w-1x6N9jQwNIIzxXW2j7QKKHNXsZZiqfnQiFsa9ZFo9P--6KErXUFaeE0hKifVxj04X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:DdW9YD5oJ-bIN_AEBQFnNyULMrYbfvR1vMZxnZxKD1YSxSW2thHpQQ>
 <xmx:DdW9YL7a2n_gwLN7OniCNTWNzqQrRFxOIFnC7fmyiU8YO_wnw-l93Q>
 <xmx:DdW9YDhzxPy4kAmA_wHJU5i-u4x77RlfH5KMlcxPcKtxCqZhvEcu7A>
 <xmx:DdW9YFT9H9PSJbyEVBhr03kWCl3R_b6ws5gcoflHGFihzS8XAJAegw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:13:00 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/9] ALSA: oxfw: cease from delayed card registration
Date: Mon,  7 Jun 2021 17:12:44 +0900
Message-Id: <20210607081250.13397-4-o-takashi@sakamocchi.jp>
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
 sound/firewire/oxfw/oxfw.c | 128 +++++++++++++------------------------
 sound/firewire/oxfw/oxfw.h |   6 +-
 2 files changed, 48 insertions(+), 86 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 59bffa32636c..84971d78d152 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -60,7 +60,7 @@ static bool detect_loud_models(struct fw_unit *unit)
 	return match_string(models, ARRAY_SIZE(models), model) >= 0;
 }
 
-static int name_card(struct snd_oxfw *oxfw)
+static int name_card(struct snd_oxfw *oxfw, const struct ieee1394_device_id *entry)
 {
 	struct fw_device *fw_dev = fw_parent_device(oxfw->unit);
 	const struct compat_info *info;
@@ -92,9 +92,8 @@ static int name_card(struct snd_oxfw *oxfw)
 		oxfw->quirks |= SND_OXFW_QUIRK_JUMBO_PAYLOAD;
 
 	/* to apply card definitions */
-	if (oxfw->entry->vendor_id == VENDOR_GRIFFIN ||
-	    oxfw->entry->vendor_id == VENDOR_LACIE) {
-		info = (const struct compat_info *)oxfw->entry->driver_data;
+	if (entry->vendor_id == VENDOR_GRIFFIN || entry->vendor_id == VENDOR_LACIE) {
+		info = (const struct compat_info *)entry->driver_data;
 		d = info->driver_name;
 		v = info->vendor_name;
 		m = info->model_name;
@@ -123,9 +122,12 @@ static void oxfw_card_free(struct snd_card *card)
 
 	if (oxfw->has_output || oxfw->has_input)
 		snd_oxfw_stream_destroy_duplex(oxfw);
+
+	mutex_destroy(&oxfw->mutex);
+	fw_unit_put(oxfw->unit);
 }
 
-static int detect_quirks(struct snd_oxfw *oxfw)
+static int detect_quirks(struct snd_oxfw *oxfw, const struct ieee1394_device_id *entry)
 {
 	struct fw_device *fw_dev = fw_parent_device(oxfw->unit);
 	struct fw_csr_iterator it;
@@ -136,17 +138,18 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 	 * Add ALSA control elements for two models to keep compatibility to
 	 * old firewire-speaker module.
 	 */
-	if (oxfw->entry->vendor_id == VENDOR_GRIFFIN)
+	if (entry->vendor_id == VENDOR_GRIFFIN)
 		return snd_oxfw_add_spkr(oxfw, false);
-	if (oxfw->entry->vendor_id == VENDOR_LACIE)
+	if (entry->vendor_id == VENDOR_LACIE)
 		return snd_oxfw_add_spkr(oxfw, true);
 
 	/*
 	 * Stanton models supports asynchronous transactions for unique MIDI
 	 * messages.
 	 */
-	if (oxfw->entry->vendor_id == OUI_STANTON) {
-		if (oxfw->entry->model_id == MODEL_SCS1M)
+	if (entry->vendor_id == OUI_STANTON) {
+		oxfw->quirks |= SND_OXFW_QUIRK_SCS_TRANSACTION;
+		if (entry->model_id == MODEL_SCS1M)
 			oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION;
 
 		// No physical MIDI ports.
@@ -156,14 +159,14 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 		return snd_oxfw_scs1x_add(oxfw);
 	}
 
-	if (oxfw->entry->vendor_id == OUI_APOGEE && oxfw->entry->model_id == MODEL_DUET_FW)
+	if (entry->vendor_id == OUI_APOGEE && entry->model_id == MODEL_DUET_FW)
 		oxfw->quirks |= SND_OXFW_QUIRK_BLOCKING_TRANSMISSION;
 
 	/*
 	 * TASCAM FireOne has physical control and requires a pair of additional
 	 * MIDI ports.
 	 */
-	if (oxfw->entry->vendor_id == VENDOR_TASCAM) {
+	if (entry->vendor_id == VENDOR_TASCAM) {
 		oxfw->midi_input_ports++;
 		oxfw->midi_output_ports++;
 		return 0;
@@ -189,22 +192,30 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 	return 0;
 }
 
-static void do_registration(struct work_struct *work)
+static int oxfw_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
 {
-	struct snd_oxfw *oxfw = container_of(work, struct snd_oxfw, dwork.work);
+	struct snd_card *card;
+	struct snd_oxfw *oxfw;
 	int err;
 
-	if (oxfw->registered)
-		return;
+	if (entry->vendor_id == VENDOR_LOUD && entry->model_id == 0 && !detect_loud_models(unit))
+		return -ENODEV;
 
-	err = snd_card_new(&oxfw->unit->device, -1, NULL, THIS_MODULE, 0,
-			   &oxfw->card);
+	err = snd_card_new(&unit->device, -1, NULL, THIS_MODULE, sizeof(*oxfw), &card);
 	if (err < 0)
-		return;
-	oxfw->card->private_free = oxfw_card_free;
-	oxfw->card->private_data = oxfw;
+		return err;
+	card->private_free = oxfw_card_free;
 
-	err = name_card(oxfw);
+	oxfw = card->private_data;
+	oxfw->unit = fw_unit_get(unit);
+	dev_set_drvdata(&unit->device, oxfw);
+	oxfw->card = card;
+
+	mutex_init(&oxfw->mutex);
+	spin_lock_init(&oxfw->lock);
+	init_waitqueue_head(&oxfw->hwdep_wait);
+
+	err = name_card(oxfw, entry);
 	if (err < 0)
 		goto error;
 
@@ -212,7 +223,7 @@ static void do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = detect_quirks(oxfw);
+	err = detect_quirks(oxfw, entry);
 	if (err < 0)
 		goto error;
 
@@ -236,85 +247,38 @@ static void do_registration(struct work_struct *work)
 			goto error;
 	}
 
-	err = snd_card_register(oxfw->card);
+	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
 
-	oxfw->registered = true;
-
-	return;
-error:
-	snd_card_free(oxfw->card);
-	dev_info(&oxfw->unit->device,
-		 "Sound card registration failed: %d\n", err);
-}
-
-static int oxfw_probe(struct fw_unit *unit,
-		      const struct ieee1394_device_id *entry)
-{
-	struct snd_oxfw *oxfw;
-
-	if (entry->vendor_id == VENDOR_LOUD && entry->model_id == 0 && !detect_loud_models(unit))
-		return -ENODEV;
-
-	/* Allocate this independent of sound card instance. */
-	oxfw = devm_kzalloc(&unit->device, sizeof(struct snd_oxfw), GFP_KERNEL);
-	if (!oxfw)
-		return -ENOMEM;
-	oxfw->unit = fw_unit_get(unit);
-	dev_set_drvdata(&unit->device, oxfw);
-
-	oxfw->entry = entry;
-	mutex_init(&oxfw->mutex);
-	spin_lock_init(&oxfw->lock);
-	init_waitqueue_head(&oxfw->hwdep_wait);
-
-	/* Allocate and register this sound card later. */
-	INIT_DEFERRABLE_WORK(&oxfw->dwork, do_registration);
-	snd_fw_schedule_registration(unit, &oxfw->dwork);
-
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 static void oxfw_bus_reset(struct fw_unit *unit)
 {
 	struct snd_oxfw *oxfw = dev_get_drvdata(&unit->device);
 
-	if (!oxfw->registered)
-		snd_fw_schedule_registration(unit, &oxfw->dwork);
-
 	fcp_bus_reset(oxfw->unit);
 
-	if (oxfw->registered) {
-		if (oxfw->has_output || oxfw->has_input) {
-			mutex_lock(&oxfw->mutex);
-			snd_oxfw_stream_update_duplex(oxfw);
-			mutex_unlock(&oxfw->mutex);
-		}
-
-		if (oxfw->entry->vendor_id == OUI_STANTON)
-			snd_oxfw_scs1x_update(oxfw);
+	if (oxfw->has_output || oxfw->has_input) {
+		mutex_lock(&oxfw->mutex);
+		snd_oxfw_stream_update_duplex(oxfw);
+		mutex_unlock(&oxfw->mutex);
 	}
+
+	if (oxfw->quirks & SND_OXFW_QUIRK_SCS_TRANSACTION)
+		snd_oxfw_scs1x_update(oxfw);
 }
 
 static void oxfw_remove(struct fw_unit *unit)
 {
 	struct snd_oxfw *oxfw = dev_get_drvdata(&unit->device);
 
-	/*
-	 * Confirm to stop the work for registration before the sound card is
-	 * going to be released. The work is not scheduled again because bus
-	 * reset handler is not called anymore.
-	 */
-	cancel_delayed_work_sync(&oxfw->dwork);
-
-	if (oxfw->registered) {
-		// Block till all of ALSA character devices are released.
-		snd_card_free(oxfw->card);
-	}
-
-	mutex_destroy(&oxfw->mutex);
-	fw_unit_put(oxfw->unit);
+	// Block till all of ALSA character devices are released.
+	snd_card_free(oxfw->card);
 }
 
 static const struct compat_info griffin_firewave = {
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 853135b5002d..ee47abcb0c90 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -40,6 +40,8 @@ enum snd_oxfw_quirk {
 	SND_OXFW_QUIRK_WRONG_DBS = 0x02,
 	// Blocking transmission mode is used.
 	SND_OXFW_QUIRK_BLOCKING_TRANSMISSION = 0x04,
+	// Stanton SCS1.d and SCS1.m support unique transaction.
+	SND_OXFW_QUIRK_SCS_TRANSACTION = 0x08,
 };
 
 /* This is an arbitrary number for convinience. */
@@ -50,9 +52,6 @@ struct snd_oxfw {
 	struct mutex mutex;
 	spinlock_t lock;
 
-	bool registered;
-	struct delayed_work dwork;
-
 	// The combination of snd_oxfw_quirk enumeration-constants.
 	unsigned int quirks;
 	bool has_output;
@@ -73,7 +72,6 @@ struct snd_oxfw {
 	bool dev_lock_changed;
 	wait_queue_head_t hwdep_wait;
 
-	const struct ieee1394_device_id *entry;
 	void *spec;
 
 	struct amdtp_domain domain;
-- 
2.27.0

