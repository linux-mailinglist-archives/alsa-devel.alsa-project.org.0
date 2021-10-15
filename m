Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA1742EB33
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C336016CD;
	Fri, 15 Oct 2021 10:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C336016CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285583;
	bh=iVx6iD2D2rZBM2YVJZM31ODFfqS1j4RICe5da4nnYu0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYbRN/+gEB/eC2Nb/948da8PZ//3nOawrf2S0ML72pUUVQBs5neodfqRMfL8LYTpT
	 NQMASyJxuNuB+eZIbPBSPhFYR7Wc1e1NCJRMDc44e7PGTz7HUTVZMesPGh3ygH0ty8
	 zF3vZhW625j6cjSXkxjbcm1pfpK+TlZ5RpJYT4n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6D6F80537;
	Fri, 15 Oct 2021 10:09:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C24F80529; Fri, 15 Oct 2021 10:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A417FF80519
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A417FF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GKYPWZ6r"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="H/EKB/s/"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 987613201D41;
 Fri, 15 Oct 2021 04:08:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 15 Oct 2021 04:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=00Y/dRtfT1mpP
 gIPGMd+E7m2X0t0cTMJTwwnAquwpoE=; b=GKYPWZ6roMZ5SQaci1C8xNBOBUmD1
 Le1HoSPAF0dyYYoi4hVv/MthVPH6Wa0g1HVd7hm2+IJSWod2Bxj64BEFEkVt3Xjb
 6Uz2b+SCLSgz3236TQVWbgo+f+THufNj75KD2AbkzELbxOwcOgAHpdZSpYEpydUh
 3I91DMbG1GV2IlPNTpuM+eYFh5H2bP0plUZXl0Joxo18XQcCF/s4V49IfChq3Gds
 87HD9BTqhKh7v8ghwtfrYEJ5d7B85yHKKgbyaf7m+MABQY9yltAKET9zDuateOO6
 TG//0kQP4B2sNRYfugEbiTUei2i1+yTUOftZqwPbQKFJfw9u+U9UH0OtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=00Y/dRtfT1mpPgIPGMd+E7m2X0t0cTMJTwwnAquwpoE=; b=H/EKB/s/
 +F0FHs6ryW0P/QL0PBSzUOOyAxDNB2/KW2OcITo+RU5PlNBb5HS5eYgYIKyOre+C
 jHJ4+a2eOqQ/JGQi5kL5U7NxcaAXdoggnQhqnsZkk326UxutohHfjB+7tdMduH1v
 ymh4xEPyg3ATGqszInkPG5dBCE3RVfTLw1daohSPkrpUu6E34GNzATUtpcrrh2tP
 b/TqcLmgwSCM/OTtk/mpk8/8G7OPCYAkWynSSyPg5g9tdFr//EoY4tcLgIq0t/QQ
 vwDlX4r6MCjyNtniz5hwbEv1mvrR/1a3LCZ7v0RnXZdaRMgGlfstuIDMZ6aI22Ub
 tCwShvgahNqA2w==
X-ME-Sender: <xms:GzdpYSGBMqdf9KZSWqAU6niPYDD_GUFLBUEB1IZkeAdpLmt3XxRerQ>
 <xme:GzdpYTW95oAXTKZ_baDmYkeqBhrgpvEx02vi_WYzw-LBYej5-uxcNB2riFM4UwzFw
 h7nfQNaD-nhU_F2l6Q>
X-ME-Received: <xmr:GzdpYcKFeIqeusO-5zBpJtnoqtV1CA6rmWP3TbRCXsIPYpCC7EHSHM1sn6sc07r3izMrGXDc9QNCF7PzMl3AHEkSWJvQhRcdf6pJdWGFq_GNob1OFQ4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:GzdpYcGrOA1MbLWT7Bk5p6b_H0ZM1uK_dvZbJnar7WOah14sjMBtvw>
 <xmx:GzdpYYVLoHsGmOo1eGIh6hZmOszCvK1RgSiiEJRM5j4Ro6OMPRNmpg>
 <xmx:GzdpYfNBnBxsSMWBuWo5GjHvgEoN0MWgke62mPqOSDQRwZBhZuCe7w>
 <xmx:GzdpYVhklcALQSRB8RrK_Aj08sJOWLJru8MibswX1vgqfP9q44qD4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:57 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 11/11] ALSA: firewire-motu: notify event for parameter change
 in register DSP model
Date: Fri, 15 Oct 2021 17:08:26 +0900
Message-Id: <20211015080826.34847-12-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
References: <20211015080826.34847-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de
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

This commit copies queued event for change of register DSP into
userspace when application operates ALSA hwdep character device.
The notification occurs only when packet streaming is running.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 |  8 ++++
 sound/firewire/motu/motu-hwdep.c              | 46 +++++++++++++++----
 .../motu/motu-register-dsp-message-parser.c   | 39 ++++++++++++++++
 sound/firewire/motu/motu.h                    |  2 +
 4 files changed, 86 insertions(+), 9 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index d52691655d79..76190a0cb069 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -13,6 +13,7 @@
 #define SNDRV_FIREWIRE_EVENT_DIGI00X_MESSAGE	0x746e736c
 #define SNDRV_FIREWIRE_EVENT_MOTU_NOTIFICATION	0x64776479
 #define SNDRV_FIREWIRE_EVENT_TASCAM_CONTROL	0x7473636d
+#define SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE	0x4d545244
 
 struct snd_firewire_event_common {
 	unsigned int type; /* SNDRV_FIREWIRE_EVENT_xxx */
@@ -65,6 +66,12 @@ struct snd_firewire_event_tascam_control {
 	struct snd_firewire_tascam_change changes[0];
 };
 
+struct snd_firewire_event_motu_register_dsp_change {
+	unsigned int type;
+	__u32 count;		// The number of changes.
+	__u32 changes[];	// Encoded event for change of register DSP.
+};
+
 union snd_firewire_event {
 	struct snd_firewire_event_common            common;
 	struct snd_firewire_event_lock_status       lock_status;
@@ -73,6 +80,7 @@ union snd_firewire_event {
 	struct snd_firewire_event_digi00x_message   digi00x_message;
 	struct snd_firewire_event_tascam_control    tascam_control;
 	struct snd_firewire_event_motu_notification motu_notification;
+	struct snd_firewire_event_motu_register_dsp_change motu_register_dsp_change;
 };
 
 
diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 389e59ff768b..9c2e457ce692 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -25,7 +25,8 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 
 	spin_lock_irq(&motu->lock);
 
-	while (!motu->dev_lock_changed && motu->msg == 0) {
+	while (!motu->dev_lock_changed && motu->msg == 0 &&
+			snd_motu_register_dsp_message_parser_count_event(motu) == 0) {
 		prepare_to_wait(&motu->hwdep_wait, &wait, TASK_INTERRUPTIBLE);
 		spin_unlock_irq(&motu->lock);
 		schedule();
@@ -40,20 +41,46 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
 		event.lock_status.status = (motu->dev_lock_count > 0);
 		motu->dev_lock_changed = false;
+		spin_unlock_irq(&motu->lock);
 
-		count = min_t(long, count, sizeof(event.lock_status));
-	} else {
+		count = min_t(long, count, sizeof(event));
+		if (copy_to_user(buf, &event, count))
+			return -EFAULT;
+	} else if (motu->msg > 0) {
 		event.motu_notification.type = SNDRV_FIREWIRE_EVENT_MOTU_NOTIFICATION;
 		event.motu_notification.message = motu->msg;
 		motu->msg = 0;
+		spin_unlock_irq(&motu->lock);
 
-		count = min_t(long, count, sizeof(event.motu_notification));
-	}
+		count = min_t(long, count, sizeof(event));
+		if (copy_to_user(buf, &event, count))
+			return -EFAULT;
+	} else if (snd_motu_register_dsp_message_parser_count_event(motu) > 0) {
+		size_t consumed = 0;
+		u32 __user *ptr;
+		u32 ev;
 
-	spin_unlock_irq(&motu->lock);
+		spin_unlock_irq(&motu->lock);
 
-	if (copy_to_user(buf, &event, count))
-		return -EFAULT;
+		// Header is filled later.
+		consumed += sizeof(event.motu_register_dsp_change);
+
+		while (consumed < count &&
+		       snd_motu_register_dsp_message_parser_copy_event(motu, &ev)) {
+			ptr = (u32 __user *)(buf + consumed);
+			if (put_user(ev, ptr))
+				return -EFAULT;
+			consumed += sizeof(ev);
+		}
+
+		event.motu_register_dsp_change.type = SNDRV_FIREWIRE_EVENT_MOTU_REGISTER_DSP_CHANGE;
+		event.motu_register_dsp_change.count =
+			(consumed - sizeof(event.motu_register_dsp_change)) / 4;
+		if (copy_to_user(buf, &event, sizeof(event.motu_register_dsp_change)))
+			return -EFAULT;
+
+		count = consumed;
+	}
 
 	return count;
 }
@@ -67,7 +94,8 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 	poll_wait(file, &motu->hwdep_wait, wait);
 
 	spin_lock_irq(&motu->lock);
-	if (motu->dev_lock_changed || motu->msg)
+	if (motu->dev_lock_changed || motu->msg ||
+	    snd_motu_register_dsp_message_parser_count_event(motu) > 0)
 		events = EPOLLIN | EPOLLRDNORM;
 	else
 		events = 0;
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index cda8e6d987cc..cbc06b3b70f6 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -95,6 +95,7 @@ struct msg_parser {
 
 	u32 event_queue[EVENT_QUEUE_SIZE];
 	unsigned int push_pos;
+	unsigned int pull_pos;
 };
 
 int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
@@ -122,6 +123,7 @@ int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu)
 	return 0;
 }
 
+// Rough implementaion of queue without overrun check.
 static void queue_event(struct snd_motu *motu, u8 msg_type, u8 identifier0, u8 identifier1, u8 val)
 {
 	struct msg_parser *parser = motu->message_parser;
@@ -145,6 +147,7 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 {
 	struct msg_parser *parser = motu->message_parser;
 	bool meter_pos_quirk = parser->meter_pos_quirk;
+	unsigned int pos = parser->push_pos;
 	unsigned long flags;
 	int i;
 
@@ -351,6 +354,9 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 		}
 	}
 
+	if (pos != parser->push_pos)
+		wake_up(&motu->hwdep_wait);
+
 	spin_unlock_irqrestore(&parser->lock, flags);
 }
 
@@ -375,3 +381,36 @@ void snd_motu_register_dsp_message_parser_copy_parameter(struct snd_motu *motu,
 	memcpy(param, &parser->param, sizeof(*param));
 	spin_unlock_irqrestore(&parser->lock, flags);
 }
+
+unsigned int snd_motu_register_dsp_message_parser_count_event(struct snd_motu *motu)
+{
+	struct msg_parser *parser = motu->message_parser;
+
+	if (parser->pull_pos > parser->push_pos)
+		return EVENT_QUEUE_SIZE - parser->pull_pos + parser->push_pos;
+	else
+		return parser->push_pos - parser->pull_pos;
+}
+
+bool snd_motu_register_dsp_message_parser_copy_event(struct snd_motu *motu, u32 *event)
+{
+	struct msg_parser *parser = motu->message_parser;
+	unsigned int pos = parser->pull_pos;
+	unsigned long flags;
+
+	if (pos == parser->push_pos)
+		return false;
+
+	spin_lock_irqsave(&parser->lock, flags);
+
+	*event = parser->event_queue[pos];
+
+	++pos;
+	if (pos >= EVENT_QUEUE_SIZE)
+		pos = 0;
+	parser->pull_pos = pos;
+
+	spin_unlock_irqrestore(&parser->lock, flags);
+
+	return true;
+}
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 9703d3af59ec..79704ae6a73e 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -283,6 +283,8 @@ void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
 					struct snd_firewire_motu_register_dsp_meter *meter);
 void snd_motu_register_dsp_message_parser_copy_parameter(struct snd_motu *motu,
 					struct snd_firewire_motu_register_dsp_parameter *params);
+unsigned int snd_motu_register_dsp_message_parser_count_event(struct snd_motu *motu);
+bool snd_motu_register_dsp_message_parser_copy_event(struct snd_motu *motu, u32 *event);
 
 int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu);
 int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc sfc);
-- 
2.30.2

