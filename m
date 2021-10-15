Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D642EB32
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 10:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11EB916A9;
	Fri, 15 Oct 2021 10:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11EB916A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634285561;
	bh=zKGKKLuIVefzIefPXCkUZtUDbJc/XUIyQAoMHNGqP+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbqPQOOtompkMTtTn0WPClzIEbmcrmgKV8/ZCXlzZ7gAzCwZ7sJ6GNSdI0VeJ1VG2
	 DB9hXdaMb94X8urCEeD+jvrrQEgktteKuLMStN2omK7aqM1ZY2FmPpAjrE9wrh0M5u
	 8dksDpLYkd1x8uK6sX2fjEw4n60N9lyH4v2bTQKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 593CAF80527;
	Fri, 15 Oct 2021 10:09:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35CCAF8051E; Fri, 15 Oct 2021 10:09:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82E4EF804FC
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 10:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E4EF804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="J+8ABnYO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ix+B9/N9"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DB19E3201D19;
 Fri, 15 Oct 2021 04:08:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 15 Oct 2021 04:08:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=+EfyYnK1LXmd3
 xeJ6lKU32J1XtdiNlHTx+YxR3hA5CQ=; b=J+8ABnYOF5hGhqoCGJZQMb0w+F2BE
 EMjfQUslX590AlrF4xfxfIUsw2eEdd9DhgckS+LYWkRKvf3GVIt/VhpzpgJACzFW
 a3SmbZwBFrMVRGGPep60glFse3LdbJ9h2q0p5fNrajR4SWjnWVaj+7dE+6zvuTx/
 hCObPMqxQPyvDlaWtli8A0PDdjw4KMbFRSWEKilqfVf/PWA89TNJ+bplRETr3wcT
 W+6PW5VDnNssyuDEAWJbR7gp+P08hjMFKxpa7aE2gwYGJoybUtI+0T2nIUZ9l6uT
 0ziXFWOFh4n9EVKbmGoBaJRkoSrWCT1y3Sm3gdcK3Dhe9O0XQaUJlaYlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+EfyYnK1LXmd3xeJ6lKU32J1XtdiNlHTx+YxR3hA5CQ=; b=ix+B9/N9
 Wqzex34MvQ8Ez6Tfvm00hDEdLaogTVy7/OlsNXD2vVb8lrrFwvnzw3pdayWAkJh5
 7qSlDd8aWwVOu872tuF+DOWWamgp4puRmE5St8Pgb1+ml4zzP7kDvRdfGAEQe6tw
 UNyZY8i62+0bw5amYirrOZmLC+QyCBcTYP9aQXnNxMf/dg+LQg7YKeVdq/TsgPLn
 4foppoSgYhN9dLaDEvihbcBKWoGPKeS6vg8scBciVQtZnb8I6PULok7MH4QGnF/A
 2tUTWQUwte2chm6R9pgokX4ZcIhjFryBfuADJzPCJPtDBgUIav0ZE9sPiE8kOyxB
 HwdqN746b8j5qQ==
X-ME-Sender: <xms:FjdpYXLqxRCvGisBlaS0N3CIFfGHZlq3EpiFaTnpLEn2IhMjkax2_Q>
 <xme:FjdpYbJa9TmCXaNqHlIJOd6HhzThrSh5lIB2oJ-mBATF7WoveJmBwbyUn2kQeiFHi
 _1sW5HwyTY6Owdh_ho>
X-ME-Received: <xmr:FjdpYfvhawzXIsU-BBDb5XCiglBtwc4RfMofpFtVR4MCGHE9Zwwm16OrNdFlmSFwn3kZJuFz54Un6z8O2y1dfuX-v55tS8DA3w-b5YPeT3z90kaDLnvf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertd
 dtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffeektefgve
 egfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushhtvghrufhi
 iigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:FjdpYQYmPnmEAzlV0yR1tKvyOLzYNp1Swu3CVhKfWQQMqZwRTTxoJQ>
 <xmx:FjdpYeZYa_PwDEx3JD3Pm3uzvvvwZftf8FfJ4OrDbIVEvcGDORmFhw>
 <xmx:FjdpYUAagv_273fi1h4shJwNI5ZnKU1wHUlo-6p3ISfWnJ_3aT1RZw>
 <xmx:FjdpYdlcFn15VJQl0UOnRCRoaqdw-TE7baZyYF8Ra43FcvLwc1czmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 04:08:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 09/11] ALSA: firewire-motu: add ioctl command to read cached
 parameters in register DSP model
Date: Fri, 15 Oct 2021 17:08:24 +0900
Message-Id: <20211015080826.34847-10-o-takashi@sakamocchi.jp>
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

This patch adds new ioctl command for userspace applications to read
cached parameters of register DSP.

The structured data includes model-dependent parameters. Userspace
application should be carefully programmed so that what parameter is
common and specific.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/firewire.h                 |  1 +
 sound/firewire/motu/motu-hwdep.c              | 21 +++++++++++++++++++
 .../motu/motu-register-dsp-message-parser.c   | 11 ++++++++++
 sound/firewire/motu/motu.h                    |  3 ++-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 6366127e923e..d52691655d79 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -82,6 +82,7 @@ union snd_firewire_event {
 #define SNDRV_FIREWIRE_IOCTL_TASCAM_STATE _IOR('H', 0xfb, struct snd_firewire_tascam_state)
 #define SNDRV_FIREWIRE_IOCTL_MOTU_REGISTER_DSP_METER	_IOR('H', 0xfc, struct snd_firewire_motu_register_dsp_meter)
 #define SNDRV_FIREWIRE_IOCTL_MOTU_COMMAND_DSP_METER	_IOR('H', 0xfd, struct snd_firewire_motu_command_dsp_meter)
+#define SNDRV_FIREWIRE_IOCTL_MOTU_REGISTER_DSP_PARAMETER	_IOR('H', 0xfe, struct snd_firewire_motu_register_dsp_parameter)
 
 #define SNDRV_FIREWIRE_TYPE_DICE	1
 #define SNDRV_FIREWIRE_TYPE_FIREWORKS	2
diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 7be576fe4516..699136b911c7 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -199,6 +199,27 @@ static int hwdep_ioctl(struct snd_hwdep *hwdep, struct file *file,
 
 		return 0;
 	}
+	case SNDRV_FIREWIRE_IOCTL_MOTU_REGISTER_DSP_PARAMETER:
+	{
+		struct snd_firewire_motu_register_dsp_parameter *param;
+		int err;
+
+		if (!(motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP))
+			return -ENXIO;
+
+		param = kzalloc(sizeof(*param), GFP_KERNEL);
+		if (!param)
+			return -ENOMEM;
+
+		snd_motu_register_dsp_message_parser_copy_parameter(motu, param);
+
+		err = copy_to_user((void __user *)arg, param, sizeof(*param));
+		kfree(param);
+		if (err)
+			return -EFAULT;
+
+		return 0;
+	}
 	default:
 		return -ENOIOCTLCMD;
 	}
diff --git a/sound/firewire/motu/motu-register-dsp-message-parser.c b/sound/firewire/motu/motu-register-dsp-message-parser.c
index d94ca4875714..ed9fd0cef200 100644
--- a/sound/firewire/motu/motu-register-dsp-message-parser.c
+++ b/sound/firewire/motu/motu-register-dsp-message-parser.c
@@ -299,3 +299,14 @@ void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
 	memcpy(meter, &parser->meter, sizeof(*meter));
 	spin_unlock_irqrestore(&parser->lock, flags);
 }
+
+void snd_motu_register_dsp_message_parser_copy_parameter(struct snd_motu *motu,
+					struct snd_firewire_motu_register_dsp_parameter *param)
+{
+	struct msg_parser *parser = motu->message_parser;
+	unsigned long flags;
+
+	spin_lock_irqsave(&parser->lock, flags);
+	memcpy(param, &parser->param, sizeof(*param));
+	spin_unlock_irqrestore(&parser->lock, flags);
+}
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 4f70036dea25..fa0b3ab7b78d 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -280,7 +280,8 @@ void snd_motu_register_dsp_message_parser_parse(struct snd_motu *motu, const str
 					unsigned int desc_count, unsigned int data_block_quadlets);
 void snd_motu_register_dsp_message_parser_copy_meter(struct snd_motu *motu,
 					struct snd_firewire_motu_register_dsp_meter *meter);
-
+void snd_motu_register_dsp_message_parser_copy_parameter(struct snd_motu *motu,
+					struct snd_firewire_motu_register_dsp_parameter *params);
 
 int snd_motu_command_dsp_message_parser_new(struct snd_motu *motu);
 int snd_motu_command_dsp_message_parser_init(struct snd_motu *motu, enum cip_sfc sfc);
-- 
2.30.2

