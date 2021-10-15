Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD242EB37
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3073416B8;
	Fri, 15 Oct 2021 10:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3073416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285602;
	bh=bT51uX5xrDP+T7Nj8bgDlISH6pp3V+/0gWr0qfogXq4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=icfPwnCj7g083ZchDjKGt8UpMB3Z3SbxmXMYAzmNz8kBHvcMw0y+TbcXfFQ5/6fvt
	 4Tvs71vLTUCYB/mDeQkoSvqXPaZ+eROy1gxnnqdIVdDiDz77ZBN2lJ/a/M/t24yi/a
	 QUrGAKJoB3ZXiJrGJUQ4dhMH1U99dQtHspmEjHTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 490CEF80269;
	Fri, 15 Oct 2021 10:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13291F80269; Fri, 15 Oct 2021 10:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D2F9F80423
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D2F9F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="6JilZfKD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ESKsG9rz"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EE3F23201CF8;
 Fri, 15 Oct 2021 04:08:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 15 Oct 2021 04:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lr3uFGjGpE1KF
 ZhtOxGrGI6Ul6aQOwIkffux4WxM2As=; b=6JilZfKD1Uec6cA5bD0vF2iCiVNXU
 prf3+noYihAMs4oudeukRHV8XjHCmPKT3BouF+IpcZpdEGh0gX1w2+7RhdO1jOuh
 BbrsijRwIyvEGub4ssLJzmjT8EnQnFBUypmVGCJZKvZW8rXQD8rBfAwsTQvz1UeM
 5SwuEyj8jZqVSU2IjrkaHxKA2J1MVFbkXw7KlsMqeS+SHqdBmk7+8moOHyvaHAj0
 s/Pru42czU4mxD0HdosCfP4Nia69A+wo+N/bFWAIuVW3vwN/KUhJXGwi1eqjaEZn
 RGDdzDRfBeTTmHHUvE7svZi3Si7kYh41/LxcTHQClNHIih8AlpM5EWByQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lr3uFGjGpE1KFZhtOxGrGI6Ul6aQOwIkffux4WxM2As=; b=ESKsG9rz
 5QXjw0aC+Z4aa+r6U6SLuL1vbCCtILWfrao0GHxtmYTO+d6L5czSBSaMdn+dqdhW
 /mqB4hYfZP/Xt/s8G18Rc8kJ3ZFWFDngo4bVcuYvZhA9H9ZKX1vn0r4z/HTx3zZu
 uXtR8lTuQjc6qFF4gxAm+cdnKizgpuJ3gRjzJMycs23KC0rG0tuUNbmGPZ7weObr
 lxocxU+An/zTt525gaA6xWd6fvL1hE8T0WWudIy/SQa02ZA3O91L7JJUOqziFzkS
 CBMvJtHocS5SVTf/2Jwv4rYczwqD0htR6OrakiSIa4Lrd1sx/DFx0SFhNXBunqAr
 knLPjxCkUroc/Q==
X-ME-Sender: <xms:BzdpYS3lkhnuIrfL71K0fkUZjT3AqTuQGjbi92XqD0I6f-IlnpDa3w>
 <xme:BzdpYVEe5HC9L1oe9io1wsfsKDN1i-B6I-3WzVOujUH1t4KDPnyl7AAGTBuw9E03-
 xBxghh-erWYCGrBaqs>
X-ME-Received: <xmr:BzdpYa4GaiyzrX6n1jZ2mX1HOfs96tTeXh0PbgGFnxzeVaYiIjfZJC62A7zUCJyPi2DzUGQO0Cx3802Sii_mK14pwbi_sDArQaxpGKTEeX_dXn5KU6t1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:BzdpYT2YcHxqAa-TLHyNzdRtv0FFc2re3ZZf-AVmT5Hwc6qpN1xqcA>
 <xmx:BzdpYVFkN5_pXkyIL56QAocUQPND19SYo2hXjJEYkjyMD4XuCB6jvg>
 <xmx:BzdpYc8YScirW6ambP-3SLRuH8yE1JgpKrC1_C0TyaoJiNsWK9215Q>
 <xmx:BzdpYaRK8njGbVUdgnZ6eCDejXWPpp6nriqaFz-txlqM6TOhTUyaEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 03/11] ALSA: firewire-motu: add ioctl command to read cached
 hardware meter
Date: Fri, 15 Oct 2021 17:08:18 +0900
Message-Id: <20211015080826.34847-4-o-takashi@sakamocchi.jp>
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

This patch adds new ioctl commands for userspace applications to read
cached image about hardware meters in register DSP and command DSP models.

The content of image differs depending on models. Model-specific parser
should be implemented in userspace.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 |  2 +
 .../motu/motu-command-dsp-message-parser.c    | 18 ++++++++
 sound/firewire/motu/motu-hwdep.c              | 44 +++++++++++++++++++
 .../motu/motu-register-dsp-message-parser.c   | 18 ++++++++
 sound/firewire/motu/motu.h                    |  4 ++
 5 files changed, 86 insertions(+)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 82d4765fbeee..a8df8fb03b52 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -80,6 +80,8 @@ union snd_firewire_event {
 #define SNDRV_FIREWIRE_IOCTL_LOCK      _IO('H', 0xf9)
 #define SNDRV_FIREWIRE_IOCTL_UNLOCK    _IO('H', 0xfa)
 #define SNDRV_FIREWIRE_IOCTL_TASCAM_STATE _IOR('H', 0xfb, struct snd_firewire_tascam_state)
+#define SNDRV_FIREWIRE_IOCTL_MOTU_REGISTER_DSP_METER	_IOR('H', 0xfc, struct snd_firewire_motu_register_dsp_meter)
+#define SNDRV_FIREWIRE_IOCTL_MOTU_COMMAND_DSP_METER	_IOR('H', 0xfd, struct snd_firewire_motu_command_dsp_meter)
 
 #define SNDRV_FIREWIRE_TYPE_DICE	1
 #define SNDRV_FIREWIRE_TYPE_FIREWORKS	2
diff --git a/sound/firewire/motu/motu-command-dsp-message-parser.c b/sound/firewire/motu/motu-command-dsp-message-parser.c
index 6716074f8bc1..18689fcfb288 100644
--- a/sound/firewire/motu/motu-command-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-command-dsp-message-parser.c
@@ -23,6 +23,7 @@ enum msg_parser_state {
 };
 
 struct msg_parser {
+	spinlock_t lock;
 	enum msg_parser_state state;
 	unsigned int interval;
 	unsigned int message_count;
@@ -39,6 +40,7 @@ int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu)
 	parser = devm_kzalloc(&motu->card->card_dev, sizeof(*parser), GFP_KERNEL);
 	if (!parser)
 		return -ENOMEM;
+	spin_lock_init(&parser->lock);
 	motu->message_parser = parser;
 
 	return 0;
@@ -83,8 +85,11 @@ void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const stru
 {
 	struct msg_parser *parser = motu->message_parser;
 	unsigned int interval = parser->interval;
+	unsigned long flags;
 	int i;
 
+	spin_lock_irqsave(&parser->lock, flags);
+
 	for (i = 0; i < desc_count; ++i) {
 		const struct pkt_desc *desc = descs + i;
 		__be32 *buffer = desc->ctx_payload;
@@ -157,4 +162,17 @@ void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const stru
 			}
 		}
 	}
+
+	spin_unlock_irqrestore(&parser->lock, flags);
+}
+
+void snd_motu_command_dsp_message_parser_copy_meter(struct snd_motu *motu,
+					struct snd_firewire_motu_command_dsp_meter *meter)
+{
+	struct msg_parser *parser = motu->message_parser;
+	unsigned long flags;
+
+	spin_lock_irqsave(&parser->lock, flags);
+	memcpy(meter, &parser->meter, sizeof(*meter));
+	spin_unlock_irqrestore(&parser->lock, flags);
 }
diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index b5ced5d27758..7be576fe4516 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -155,6 +155,50 @@ static int hwdep_ioctl(struct snd_hwdep *hwdep, struct file *file,
 		return hwdep_lock(motu);
 	case SNDRV_FIREWIRE_IOCTL_UNLOCK:
 		return hwdep_unlock(motu);
+	case SNDRV_FIREWIRE_IOCTL_MOTU_REGISTER_DSP_METER:
+	{
+		struct snd_firewire_motu_register_dsp_meter *meter;
+		int err;
+
+		if (!(motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP))
+			return -ENXIO;
+
+		meter = kzalloc(sizeof(*meter), GFP_KERNEL);
+		if (!meter)
+			return -ENOMEM;
+
+		snd_motu_register_dsp_message_parser_copy_meter(motu, meter);
+
+		err = copy_to_user((void __user *)arg, meter, sizeof(*meter));
+		kfree(meter);
+
+		if (err)
+			return -EFAULT;
+
+		return 0;
+	}
+	case SNDRV_FIREWIRE_IOCTL_MOTU_COMMAND_DSP_METER:
+	{
+		struct snd_firewire_motu_command_dsp_meter *meter;
+		int err;
+
+		if (!(motu->spec->flags & SND_MOTU_SPEC_COMMAND_DSP))
+			return -ENXIO;
+
+		meter = kzalloc(sizeof(*meter), GFP_KERNEL);
+		if (!meter)
+			return -ENOMEM;
+
+		snd_motu_command_dsp_message_parser_copy_meter(motu, meter);
+
+		err = copy_to_user((void __user *)arg, meter, sizeof(*meter));
+		kfree(meter);
+
+		if (err)
+			return -EFAULT;
+
+		return 0;
+	}
 	default:
 		return -ENOIOCTLCMD;
 	}
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index efb9708b5b5f..fe804615294c 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -79,6 +79,7 @@ enum register_dsp_msg_type {
 };
 
 struct msg_parser {
+	spinlock_t lock;
 	struct snd_firewire_motu_register_dsp_meter meter;
 	bool meter_pos_quirk;
 };
@@ -89,6 +90,7 @@ int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu)
 	parser = devm_kzalloc(&motu->card->card_dev, sizeof(*parser), GFP_KERNEL);
 	if (!parser)
 		return -ENOMEM;
+	spin_lock_init(&parser->lock);
 	if (motu->spec == &snd_motu_spec_4pre || motu->spec == &snd_motu_spec_audio_express)
 		parser->meter_pos_quirk = true;
 	motu->message_parser = parser;
@@ -105,8 +107,11 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 {
 	struct msg_parser *parser = motu->message_parser;
 	bool meter_pos_quirk = parser->meter_pos_quirk;
+	unsigned long flags;
 	int i;
 
+	spin_lock_irqsave(&parser->lock, flags);
+
 	for (i = 0; i < desc_count; ++i) {
 		const struct pkt_desc *desc = descs + i;
 		__be32 *buffer = desc->ctx_payload;
@@ -142,4 +147,17 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 			}
 		}
 	}
+
+	spin_unlock_irqrestore(&parser->lock, flags);
+}
+
+void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
+						struct snd_firewire_motu_register_dsp_meter *meter)
+{
+	struct msg_parser *parser = motu->message_parser;
+	unsigned long flags;
+
+	spin_lock_irqsave(&parser->lock, flags);
+	memcpy(meter, &parser->meter, sizeof(*meter));
+	spin_unlock_irqrestore(&parser->lock, flags);
 }
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index d818ce4901c9..4f70036dea25 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -278,11 +278,15 @@ int snd_motu_register_dsp_message_parser_new(struct snd_motu *motu);
 int snd_motu_register_dsp_message_parser_init(struct snd_motu *motu);
 void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
 					unsigned int desc_count, unsigned int data_block_quadlets);
+void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
+					struct snd_firewire_motu_register_dsp_meter *meter);
 
 
 int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu);
 int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc sfc);
 void snd_motu_command_dsp_message_parser_parse(struct snd_motu *motu, const struct pkt_desc *descs,
 					unsigned int desc_count, unsigned int data_block_quadlets);
+void snd_motu_command_dsp_message_parser_copy_meter(struct snd_motu *motu,
+					struct snd_firewire_motu_command_dsp_meter *meter);
 
 #endif
-- 
2.30.2

