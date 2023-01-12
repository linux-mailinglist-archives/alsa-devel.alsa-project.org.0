Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA46671C5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 13:12:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406285D68;
	Thu, 12 Jan 2023 13:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406285D68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673525568;
	bh=bom6iDovjPR8h43XjUic+WoachRYoYeHoW3CUJ6aYy4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o83CsSgyOoOxyV3P+D/QoanfT9CW4itVzVyTudsxqE8QbCgHAxzTpq5xwVk6A8AnD
	 IBC1+aGeJ31NzuJAA7uTD/bqjIehiaSbcXhVnH6YigZXVRZ0zN6M8XM6WBjLFhSREB
	 0C4DDJGb4xqZ+t5ffk6EnielPvUYRsXFRO3v7Cy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1571AF8056F;
	Thu, 12 Jan 2023 13:10:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C63F80563; Thu, 12 Jan 2023 13:10:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 356A9F80539
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 13:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 356A9F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp
 header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=Cr65VU+o; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KlwGexP3
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3892932005D8;
 Thu, 12 Jan 2023 07:10:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 12 Jan 2023 07:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673525411; x=
 1673611811; bh=jIjQLxPzQp9KlPrtd/2Ool6fxDwQOyxeMj0J+DUzA0o=; b=C
 r65VU+oQGWzDJSWXV9bO5PXEC/EuQ6++W31QQ7P0UPP1sovzUF2pzXmjt4oemy8F
 Vrhm+FiNRIlcI3uy0raJy9nr6p4n4WYqZMZ2vXN0kRm0aMpZdIf59NgI0D92FvTD
 pOc3EaxrIwsblrLQ9MD6I9qljjAOraMe399bCv65dieR0A1cQAU04a8dKZ+CgvoK
 ZUqnnatapPrRooLkD4wYIXozWnWr8KY8d/ty0pqqV6eS1rYmCrGMeNVfFrg8o8fe
 RyughNsHmFE1GYVGYihAiDaHdgP6ZD1QY86VoUf8HjHvUEXA/zl7UoDTyvoic14v
 jBK31EJUpGYnUlZ/CwdfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673525411; x=1673611811; bh=jIjQLxPzQp9Kl
 Prtd/2Ool6fxDwQOyxeMj0J+DUzA0o=; b=KlwGexP3QiYf/QJ0MTQ8fJayv0OIU
 epQY2nw5z0MFK6EoBbcEDhGWSKRUnViQcIf5T09QOtLuyItEJTSYnP2Tnf7urY0x
 2ImLa+H82FbqRacpElOZ4nQChGHB8JIeK6f41yKHH7rFezvAbe70Ko69e2PbiIJg
 v+jEryWDCWGGyIJ7GbEl7Vhk4CxsB9Txs8JtcJf6S+1cwhkHbYT6sYSGz5ljy86B
 iFBoEjjOZIFv7OxlMiV5JmEizJ3M8vvox0BaXJ+VByRbO9khVejVfFN8iWqCDlmf
 7U3SSyaS7O5oO/6kBNz5pPHwVTekaPtul2asvAFO8u4RSwpMi0nl8dHWg==
X-ME-Sender: <xms:o_i_Yy658mzXp7-SMmMNVTNbFsYLn2bcrNYQwQ0B7kyCXB71E4SC3w>
 <xme:o_i_Y75IFlgTMkqWZUPiML22Kc7_sP5V7tNkcI4EfNob4P6HT9IVudKTgxPKa7a1w
 uEBAX4rdSikvkaZKLw>
X-ME-Received: <xmr:o_i_YxcFYFEoaPRRrKnxG0AW6I6Y_qeyZz5cZkm4mLx4rGxQ2rRuC2gtKQYjJ02e42JEFkFrQGeDpiPPPt7ei9x09XjxC4Ow6w0Z3jegB5Tlr73oBrl8CDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepvdejgfejue
 dvgfduudekleevtefgtdevhfdtffefiefgveeuteffiedvffekvddtnecuvehluhhsthgv
 rhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:o_i_Y_JAjNJJ4WKpA5gMeOfUgumOqlJ12esS60ISRW7fsIYFfdUmBQ>
 <xmx:o_i_Y2LXbJ-kmkRLsIutjXXDqfHWHl6e4eR72Ay9oyiA5oMzYtYwKg>
 <xmx:o_i_YwxdGLY17vnn-3LgYsRhZTouPcNxDdvks8uEUNVZzKbqcEqtSw>
 <xmx:o_i_Y4i4uwxOIFGZAK6NO-BWEml-bz6gBVl_Y2dBfVnF1wMxS8xBJA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 07:10:10 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/6] ALSA: fireface: add local framework to message parser
Date: Thu, 12 Jan 2023 21:09:53 +0900
Message-Id: <20230112120954.500692-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
References: <20230112120954.500692-1-o-takashi@sakamocchi.jp>
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
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit adds local framework to message parser. This is preparation
for future work to pass event of knob control for Fireface 400 to user
space.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireface/ff-hwdep.c       | 41 +++++++++++++++++-------
 sound/firewire/fireface/ff-transaction.c |  4 +++
 sound/firewire/fireface/ff.c             | 10 ++++++
 sound/firewire/fireface/ff.h             |  5 +++
 4 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index ea64a2a41eea..8a741b3b0436 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -15,16 +15,23 @@
 
 #include "ff.h"
 
+static bool has_msg(struct snd_ff *ff)
+{
+	if (ff->spec->protocol->has_msg)
+		return ff->spec->protocol->has_msg(ff);
+	else
+		return 0;
+}
+
 static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 		       loff_t *offset)
 {
 	struct snd_ff *ff = hwdep->private_data;
 	DEFINE_WAIT(wait);
-	union snd_firewire_event event;
 
 	spin_lock_irq(&ff->lock);
 
-	while (!ff->dev_lock_changed) {
+	while (!ff->dev_lock_changed && !has_msg(ff)) {
 		prepare_to_wait(&ff->hwdep_wait, &wait, TASK_INTERRUPTIBLE);
 		spin_unlock_irq(&ff->lock);
 		schedule();
@@ -34,17 +41,29 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 		spin_lock_irq(&ff->lock);
 	}
 
-	memset(&event, 0, sizeof(event));
-	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
-	event.lock_status.status = (ff->dev_lock_count > 0);
-	ff->dev_lock_changed = false;
+	if (ff->dev_lock_changed && count >= sizeof(struct snd_firewire_event_lock_status)) {
+		struct snd_firewire_event_lock_status ev = {
+			.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS,
+			.status = (ff->dev_lock_count > 0),
+		};
 
-	count = min_t(long, count, sizeof(event.lock_status));
+		ff->dev_lock_changed = false;
 
-	spin_unlock_irq(&ff->lock);
+		spin_unlock_irq(&ff->lock);
 
-	if (copy_to_user(buf, &event, count))
-		return -EFAULT;
+		if (copy_to_user(buf, &ev, sizeof(ev)))
+			return -EFAULT;
+		count = sizeof(ev);
+	} else if (has_msg(ff)) {
+		// NOTE: Acquired spin lock should be released before accessing to user space in the
+		// callback since the access can cause page fault.
+		count = ff->spec->protocol->copy_msg_to_user(ff, buf, count);
+		spin_unlock_irq(&ff->lock);
+	} else {
+		spin_unlock_irq(&ff->lock);
+
+		count = 0;
+	}
 
 	return count;
 }
@@ -58,7 +77,7 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 	poll_wait(file, &ff->hwdep_wait, wait);
 
 	spin_lock_irq(&ff->lock);
-	if (ff->dev_lock_changed)
+	if (ff->dev_lock_changed || has_msg(ff))
 		events = EPOLLIN | EPOLLRDNORM;
 	else
 		events = 0;
diff --git a/sound/firewire/fireface/ff-transaction.c b/sound/firewire/fireface/ff-transaction.c
index 79f733d8c98b..6b89e39f4a43 100644
--- a/sound/firewire/fireface/ff-transaction.c
+++ b/sound/firewire/fireface/ff-transaction.c
@@ -132,11 +132,15 @@ static void handle_msg(struct fw_card *card, struct fw_request *request, int tco
 	struct snd_ff *ff = callback_data;
 	__le32 *buf = data;
 	u32 tstamp = fw_request_get_timestamp(request);
+	unsigned long flag;
 
 	fw_send_response(card, request, RCODE_COMPLETE);
 
 	offset -= ff->async_handler.offset;
+
+	spin_lock_irqsave(&ff->lock, flag);
 	ff->spec->protocol->handle_msg(ff, (unsigned int)offset, buf, length, tstamp);
+	spin_unlock_irqrestore(&ff->lock, flag);
 }
 
 static int allocate_own_address(struct snd_ff *ff, int i)
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index 7bf51d062021..448e972028d9 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -43,6 +43,8 @@ static void ff_card_free(struct snd_card *card)
 	snd_ff_stream_destroy_duplex(ff);
 	snd_ff_transaction_unregister(ff);
 
+	kfree(ff->msg_parser);
+
 	mutex_destroy(&ff->mutex);
 	fw_unit_put(ff->unit);
 }
@@ -94,6 +96,14 @@ static int snd_ff_probe(struct fw_unit *unit, const struct ieee1394_device_id *e
 	if (err < 0)
 		goto error;
 
+	if (ff->spec->protocol->msg_parser_size > 0) {
+		ff->msg_parser = kzalloc(ff->spec->protocol->msg_parser_size, GFP_KERNEL);
+		if (!ff->msg_parser) {
+			err = -ENOMEM;
+			goto error;
+		}
+	}
+
 	err = snd_card_register(card);
 	if (err < 0)
 		goto error;
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index f430ebe157b3..7e42f5778a8a 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -97,6 +97,8 @@ struct snd_ff {
 	wait_queue_head_t hwdep_wait;
 
 	struct amdtp_domain domain;
+
+	void *msg_parser;
 };
 
 enum snd_ff_clock_src {
@@ -110,6 +112,9 @@ enum snd_ff_clock_src {
 };
 
 struct snd_ff_protocol {
+	size_t msg_parser_size;
+	bool (*has_msg)(struct snd_ff *ff);
+	long (*copy_msg_to_user)(struct snd_ff *ff, char __user *buf, long count);
 	void (*handle_msg)(struct snd_ff *ff, unsigned int offset, const __le32 *buf,
 			   size_t length, u32 tstamp);
 	int (*fill_midi_msg)(struct snd_ff *ff,
-- 
2.37.2

