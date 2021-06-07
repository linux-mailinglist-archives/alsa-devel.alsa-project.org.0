Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA8239D6E3
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 10:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2111677;
	Mon,  7 Jun 2021 10:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2111677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623053780;
	bh=DM8bMCqfT9yQTkn1XHVCkTTduYpvUgZxrby5delvPpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMeTip/e6cvCPkMovcDn3eRGACque8APuua3i+7D7ZulBrKGIh66XvUUuKBLU8GaO
	 qdgcbx61phAaLjB+EwDHDf6PtswFc6sSwgUlNKCexEgHjvyNY1R29ZAriYZDLbc2+F
	 S/CoOaEvlDJbN3PpcJGwj6/BP7jQnKdzNCg6h840=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F357FF804CC;
	Mon,  7 Jun 2021 10:13:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48F3EF804D1; Mon,  7 Jun 2021 10:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81465F802DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 10:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81465F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="1sTUJh0c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="spmWeEbO"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C19EF5C013A;
 Mon,  7 Jun 2021 04:13:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 04:13:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sfWqAck5aMqeu
 6QM4bNtm4xlVwYLtkmjGbdbX/T323A=; b=1sTUJh0cJqUKMsk+i2HUGTxjzWbSf
 vpnYmWxb7/fO8uA714je0/vsesFqFal5tjI7eerrLPGS7cH9tU8pAPoUDp0HDFSv
 2UnAZ7wSMrewGvumusXQIOpl/0qNtSwnY3xkjMjKTbwdWju+UvJg6+QZo6vosrcB
 HNNEgWXO0FW4kODeNAZGVgN5vuHzY70Oo8z/QXEY5e8ZE8oRVn/ndNVUMPAnp9fi
 fTFJiVHeOK5K5136vZq3kwakI4YM4/tTb+dti+xdoSzd4kQNYsPGhqTUUMPPdFUW
 66KMvVDCNb2IjHRtYhuJE1v2XOfHgCTi4STG1kFKG71o786vXOXPwK/Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sfWqAck5aMqeu6QM4bNtm4xlVwYLtkmjGbdbX/T323A=; b=spmWeEbO
 O64bCbcPyusiphVr9T0PSjI52Wmm1ELq839l+/2tLV/oVp5GO66Zf5o1/F1jCa3x
 FCivwlRcmL7kle2XkgZOyZV0OYHzhl2aX4IxnHTevXaLJjMW1/3yxY1myCjT5qnW
 7ZPFPJjVSKxSrg8P9T3+HAqD856PFcMKkGEPII4jMx7lR+IqoUl0LgRAMJ4Q22su
 mLgjf1mx1DiiJ04ZIvESxcK1qT+Ot3Sd8yP1nyjmo3OjVG9iLzZkHXAVAxg5rUam
 lE5lp6FhUqyIT/Ppz4nQYYYh+/sS85jxuo6K3cpleq5Mx+KhX9unb/ZnzJHGuaBm
 KYbQ1WxweI4ngQ==
X-ME-Sender: <xms:E9W9YKZmOQ3SbCD5isq2pOpEUS5Q48eEKRaOxS5LZi7AuwOalM2ACA>
 <xme:E9W9YNb0pxBkkuUvdnWFalBeW_aZMN2TUO0TJJvwuvKl0-k5cpq_ElBKPf1dEKrVj
 q3WM6tPH99RSOKDpKI>
X-ME-Received: <xmr:E9W9YE_bIz7K5LJLlvE1eOtCbzj_2ULFChpmikm3oOv8TREdx7R75p6K91DtJSDhgbIbN5X6r0ZgLnz32g2JjhBVxtqniPRzWNj-etIz13w-J9Elr_bS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:E9W9YMrGBKAdz6HOsiRiwzUnqi7BWC3N_SfxtNUYb9rSZOWJCBKhrQ>
 <xmx:E9W9YFrkHRfDP90UJuXWW6nkpOjvkoyL4tCmY1DBcMiYq83jy6t25w>
 <xmx:E9W9YKSywcIk6v2ImLxeKqhaQ1m9iDWdv4emSL_vOtCLcfVQRbwxLA>
 <xmx:E9W9YGAhnuTz6SJ-BilHCIkQEMLcRB8oKMvjx4Uu04bFW7ThqVur6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 04:13:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 8/9] ALSA: fireface: cease from delayed card registration
Date: Mon,  7 Jun 2021 17:12:49 +0900
Message-Id: <20210607081250.13397-9-o-takashi@sakamocchi.jp>
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
 sound/firewire/fireface/ff.c | 90 +++++++++++-------------------------
 sound/firewire/fireface/ff.h |  3 --
 2 files changed, 28 insertions(+), 65 deletions(-)

diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index bc39269415d2..7bf51d062021 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -42,22 +42,33 @@ static void ff_card_free(struct snd_card *card)
 
 	snd_ff_stream_destroy_duplex(ff);
 	snd_ff_transaction_unregister(ff);
+
+	mutex_destroy(&ff->mutex);
+	fw_unit_put(ff->unit);
 }
 
-static void do_registration(struct work_struct *work)
+static int snd_ff_probe(struct fw_unit *unit, const struct ieee1394_device_id *entry)
 {
-	struct snd_ff *ff = container_of(work, struct snd_ff, dwork.work);
+	struct snd_card *card;
+	struct snd_ff *ff;
 	int err;
 
-	if (ff->registered)
-		return;
-
-	err = snd_card_new(&ff->unit->device, -1, NULL, THIS_MODULE, 0,
-			   &ff->card);
+	err = snd_card_new(&unit->device, -1, NULL, THIS_MODULE, sizeof(*ff), &card);
 	if (err < 0)
-		return;
-	ff->card->private_free = ff_card_free;
-	ff->card->private_data = ff;
+		return err;
+	card->private_free = ff_card_free;
+
+	ff = card->private_data;
+	ff->unit = fw_unit_get(unit);
+	dev_set_drvdata(&unit->device, ff);
+	ff->card = card;
+
+	mutex_init(&ff->mutex);
+	spin_lock_init(&ff->lock);
+	init_waitqueue_head(&ff->hwdep_wait);
+
+	ff->unit_version = entry->version;
+	ff->spec = (const struct snd_ff_spec *)entry->driver_data;
 
 	err = snd_ff_transaction_register(ff);
 	if (err < 0)
@@ -83,76 +94,31 @@ static void do_registration(struct work_struct *work)
 	if (err < 0)
 		goto error;
 
-	err = snd_card_register(ff->card);
+	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
 
-	ff->registered = true;
-
-	return;
-error:
-	snd_card_free(ff->card);
-	dev_info(&ff->unit->device,
-		 "Sound card registration failed: %d\n", err);
-}
-
-static int snd_ff_probe(struct fw_unit *unit,
-			   const struct ieee1394_device_id *entry)
-{
-	struct snd_ff *ff;
-
-	ff = devm_kzalloc(&unit->device, sizeof(struct snd_ff), GFP_KERNEL);
-	if (!ff)
-		return -ENOMEM;
-	ff->unit = fw_unit_get(unit);
-	dev_set_drvdata(&unit->device, ff);
-
-	mutex_init(&ff->mutex);
-	spin_lock_init(&ff->lock);
-	init_waitqueue_head(&ff->hwdep_wait);
-
-	ff->unit_version = entry->version;
-	ff->spec = (const struct snd_ff_spec *)entry->driver_data;
-
-	/* Register this sound card later. */
-	INIT_DEFERRABLE_WORK(&ff->dwork, do_registration);
-	snd_fw_schedule_registration(unit, &ff->dwork);
-
 	return 0;
+error:
+	snd_card_free(card);
+	return err;
 }
 
 static void snd_ff_update(struct fw_unit *unit)
 {
 	struct snd_ff *ff = dev_get_drvdata(&unit->device);
 
-	/* Postpone a workqueue for deferred registration. */
-	if (!ff->registered)
-		snd_fw_schedule_registration(unit, &ff->dwork);
-
 	snd_ff_transaction_reregister(ff);
 
-	if (ff->registered)
-		snd_ff_stream_update_duplex(ff);
+	snd_ff_stream_update_duplex(ff);
 }
 
 static void snd_ff_remove(struct fw_unit *unit)
 {
 	struct snd_ff *ff = dev_get_drvdata(&unit->device);
 
-	/*
-	 * Confirm to stop the work for registration before the sound card is
-	 * going to be released. The work is not scheduled again because bus
-	 * reset handler is not called anymore.
-	 */
-	cancel_work_sync(&ff->dwork.work);
-
-	if (ff->registered) {
-		// Block till all of ALSA character devices are released.
-		snd_card_free(ff->card);
-	}
-
-	mutex_destroy(&ff->mutex);
-	fw_unit_put(ff->unit);
+	// Block till all of ALSA character devices are released.
+	snd_card_free(ff->card);
 }
 
 static const struct snd_ff_spec spec_ff800 = {
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index 705e7df4f929..0535f0b58b67 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -69,9 +69,6 @@ struct snd_ff {
 	struct mutex mutex;
 	spinlock_t lock;
 
-	bool registered;
-	struct delayed_work dwork;
-
 	enum snd_ff_unit_version unit_version;
 	const struct snd_ff_spec *spec;
 
-- 
2.27.0

