Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E813766C6
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08AC9168A;
	Fri,  7 May 2021 16:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08AC9168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620396400;
	bh=auf0Sab7W9fcK8XdpkM4edcCbC5REHCVhHfilHZuh2g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GWMUJY/U/X8o111XmLiJrY5nZFLVzdddKGfhZ6kxHA+I62Aq3s+/F/sNMBxWXb9SC
	 4zl0BqjXE2Hzz9bO3lPbXnp3JRFG0dwWNTsaFUxt2q9VM6xzJFgWOfUxG5utiV1PAk
	 IZt3CC3BvBFrGTBPhsrZhSk6gO03cO+rowCI8RP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A993F80431;
	Fri,  7 May 2021 16:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CD78F80430; Fri,  7 May 2021 16:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 365CCF8010B
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365CCF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="FpwHwtiF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kAw3DjqR"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 72A3BFC3;
 Fri,  7 May 2021 10:04:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 10:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=tlvisBUixwxx0
 2iwNwk/riRnUZlx9HwwEFVjgJqkr6c=; b=FpwHwtiFKhbkBi6A/5OS2daLnVzx3
 oNppK0nk/VlOsrK0P8dPCWYNxQgNRP50BulwarVWLiwqOJRLUf1CtMVxgA3rJV3m
 LECEnM+zEYTN+GuTC1J1VLvotK7u3YIdVAz9W65w8wMckpTSG75VhFpJcoITnVm2
 Lh4QUHkBePoeTmTPBqR7EtPteVaLbIF6b3uxjmdlNdLJSZ7LhLVXQvSfnCn15GZt
 e+5qvwUhsidoH5OSk+4S3KMM+xpn4uJF62X7WsCUl0qvcnAg8eSGDLphO1jon/ky
 UCHRwH+9m7kkz1SMV3Lr6mz6Z7nS4x1VPsq4e8IeUfexXLuye35flLUOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tlvisBUixwxx02iwNwk/riRnUZlx9HwwEFVjgJqkr6c=; b=kAw3DjqR
 FFyeNTa4oRG2+tY6RiwjqpyfHePk9luqP2q+My6o9LeEG7a/3GDV4tYuSm06AI+b
 6n9Ckf/xr/ln4N05HKEdrE/upZUD3C0CTFdRMT8iIaCjEakl50C9h6vg1AY1uP+2
 hh4LFVCbwb11w2adzowSFg5OR71cuLMCe/oz+kGl0gkhCbuFJQ4MYTmYh2pWzVHB
 eiHsAeQ+d9QIkYMgaWe8wjUyNe/Su1MJWSzWW/ZqsT5EaP2H8STgmrH0PCRvqFd/
 BxHTjVjP/DpzODPP7ZelDHtp3ChQNgGGJJDxTIZXSr+M74fudwDl/45s7ll51if0
 XGP8T0kWtDxvEg==
X-ME-Sender: <xms:_UiVYACPDc-HStiRXEylK8D4fr1KUrrOOU2wrqIaDkkRQe6u5DCcrA>
 <xme:_UiVYCj_NXPS8RgV9yrDzJfyw78vde3yEvEavqNbHdGtm-sAPArlJMMoVtO-sg7rK
 J4EB2_K6ZPNWHePUTc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_UiVYDnse3G6iRsBhiH7_9FSc0oBMgJu-Cc5UFMlXOk7LR6CJjqGXw>
 <xmx:_UiVYGw2bh9Alpd9Sxcr744t-NXAZH3Rl_IVe8Bk7fnpAAvKUBkAQQ>
 <xmx:_UiVYFT4pXb5oH4PKXT7w94ucvvilXz3UZRuW1rdzlJs6L-3dqs5Gw>
 <xmx:_0iVYEAp9lP7hK-fdQyWHonrItRoT5rF_ym5igCinsYDBPyuwi3NmLBOrpY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:04:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 01/11] snd: iec958: split status creation and fill
Date: Fri,  7 May 2021 16:03:24 +0200
Message-Id: <20210507140334.204865-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507140334.204865-1-maxime@cerno.tech>
References: <20210507140334.204865-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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

In some situations, like a codec probe, we need to provide an IEC status
default but don't have access to the sampling rate and width yet since
no stream has been configured yet.

Each and every driver has its own default, whereas the core iec958 code
also has some buried in the snd_pcm_create_iec958_consumer functions.

Let's split these functions in two to provide a default that doesn't
rely on the sampling rate and width, and another function to fill them
when available.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/sound/pcm_iec958.h |   8 +++
 sound/core/pcm_iec958.c    | 131 +++++++++++++++++++++++++------------
 2 files changed, 96 insertions(+), 43 deletions(-)

diff --git a/include/sound/pcm_iec958.h b/include/sound/pcm_iec958.h
index 0939aa45e2fe..64e84441cde1 100644
--- a/include/sound/pcm_iec958.h
+++ b/include/sound/pcm_iec958.h
@@ -4,6 +4,14 @@
 
 #include <linux/types.h>
 
+int snd_pcm_create_iec958_consumer_default(u8 *cs, size_t len);
+
+int snd_pcm_fill_iec958_consumer(struct snd_pcm_runtime *runtime, u8 *cs,
+				 size_t len);
+
+int snd_pcm_fill_iec958_consumer_hw_params(struct snd_pcm_hw_params *params,
+					   u8 *cs, size_t len);
+
 int snd_pcm_create_iec958_consumer(struct snd_pcm_runtime *runtime, u8 *cs,
 	size_t len);
 
diff --git a/sound/core/pcm_iec958.c b/sound/core/pcm_iec958.c
index f9a211cc1f2c..a60908efe159 100644
--- a/sound/core/pcm_iec958.c
+++ b/sound/core/pcm_iec958.c
@@ -9,41 +9,68 @@
 #include <sound/pcm_params.h>
 #include <sound/pcm_iec958.h>
 
-static int create_iec958_consumer(uint rate, uint sample_width,
-				  u8 *cs, size_t len)
+int snd_pcm_create_iec958_consumer_default(u8 *cs, size_t len)
 {
-	unsigned int fs, ws;
-
 	if (len < 4)
 		return -EINVAL;
 
-	switch (rate) {
-	case 32000:
-		fs = IEC958_AES3_CON_FS_32000;
-		break;
-	case 44100:
-		fs = IEC958_AES3_CON_FS_44100;
-		break;
-	case 48000:
-		fs = IEC958_AES3_CON_FS_48000;
-		break;
-	case 88200:
-		fs = IEC958_AES3_CON_FS_88200;
-		break;
-	case 96000:
-		fs = IEC958_AES3_CON_FS_96000;
-		break;
-	case 176400:
-		fs = IEC958_AES3_CON_FS_176400;
-		break;
-	case 192000:
-		fs = IEC958_AES3_CON_FS_192000;
-		break;
-	default:
+	memset(cs, 0, len);
+
+	cs[0] = IEC958_AES0_CON_NOT_COPYRIGHT | IEC958_AES0_CON_EMPHASIS_NONE;
+	cs[1] = IEC958_AES1_CON_GENERAL;
+	cs[2] = IEC958_AES2_CON_SOURCE_UNSPEC | IEC958_AES2_CON_CHANNEL_UNSPEC;
+	cs[3] = IEC958_AES3_CON_CLOCK_1000PPM | IEC958_AES3_CON_FS_NOTID;
+
+	if (len > 4)
+		cs[4] = IEC958_AES4_CON_WORDLEN_NOTID;
+
+	return len;
+}
+EXPORT_SYMBOL(snd_pcm_create_iec958_consumer_default);
+
+static int fill_iec958_consumer(uint rate, uint sample_width,
+				u8 *cs, size_t len)
+{
+	if (len < 4)
 		return -EINVAL;
+
+	if ((cs[3] & IEC958_AES3_CON_FS) == IEC958_AES3_CON_FS_NOTID) {
+		unsigned int fs;
+
+		switch (rate) {
+			case 32000:
+				fs = IEC958_AES3_CON_FS_32000;
+				break;
+			case 44100:
+				fs = IEC958_AES3_CON_FS_44100;
+				break;
+			case 48000:
+				fs = IEC958_AES3_CON_FS_48000;
+				break;
+			case 88200:
+				fs = IEC958_AES3_CON_FS_88200;
+				break;
+			case 96000:
+				fs = IEC958_AES3_CON_FS_96000;
+				break;
+			case 176400:
+				fs = IEC958_AES3_CON_FS_176400;
+				break;
+			case 192000:
+				fs = IEC958_AES3_CON_FS_192000;
+				break;
+			default:
+				return -EINVAL;
+		}
+
+		cs[3] &= ~IEC958_AES3_CON_FS;
+		cs[3] |= fs;
 	}
 
-	if (len > 4) {
+	if (len > 4 &&
+	    (cs[4] & IEC958_AES4_CON_WORDLEN) == IEC958_AES4_CON_WORDLEN_NOTID) {
+		unsigned int ws;
+
 		switch (sample_width) {
 		case 16:
 			ws = IEC958_AES4_CON_WORDLEN_20_16;
@@ -64,21 +91,30 @@ static int create_iec958_consumer(uint rate, uint sample_width,
 		default:
 			return -EINVAL;
 		}
+
+		cs[4] &= ~IEC958_AES4_CON_WORDLEN;
+		cs[4] |= ws;
 	}
 
-	memset(cs, 0, len);
-
-	cs[0] = IEC958_AES0_CON_NOT_COPYRIGHT | IEC958_AES0_CON_EMPHASIS_NONE;
-	cs[1] = IEC958_AES1_CON_GENERAL;
-	cs[2] = IEC958_AES2_CON_SOURCE_UNSPEC | IEC958_AES2_CON_CHANNEL_UNSPEC;
-	cs[3] = IEC958_AES3_CON_CLOCK_1000PPM | fs;
-
-	if (len > 4)
-		cs[4] = ws;
-
 	return len;
 }
 
+int snd_pcm_fill_iec958_consumer_hw_params(struct snd_pcm_hw_params *params,
+					   u8 *cs, size_t len)
+{
+	return fill_iec958_consumer(params_rate(params), params_width(params), cs, len);
+}
+EXPORT_SYMBOL(snd_pcm_fill_iec958_consumer_hw_params);
+
+int snd_pcm_fill_iec958_consumer(struct snd_pcm_runtime *runtime,
+				 u8 *cs, size_t len)
+{
+	return fill_iec958_consumer(runtime->rate,
+				    snd_pcm_format_width(runtime->format),
+				    cs, len);
+}
+EXPORT_SYMBOL(snd_pcm_fill_iec958_consumer);
+
 /**
  * snd_pcm_create_iec958_consumer - create consumer format IEC958 channel status
  * @runtime: pcm runtime structure with ->rate filled in
@@ -95,9 +131,13 @@ static int create_iec958_consumer(uint rate, uint sample_width,
 int snd_pcm_create_iec958_consumer(struct snd_pcm_runtime *runtime, u8 *cs,
 	size_t len)
 {
-	return create_iec958_consumer(runtime->rate,
-				      snd_pcm_format_width(runtime->format),
-				      cs, len);
+	int ret;
+
+	ret = snd_pcm_create_iec958_consumer_default(cs, len);
+	if (ret < 0)
+		return ret;
+
+	return snd_pcm_fill_iec958_consumer(runtime, cs, len);
 }
 EXPORT_SYMBOL(snd_pcm_create_iec958_consumer);
 
@@ -117,7 +157,12 @@ EXPORT_SYMBOL(snd_pcm_create_iec958_consumer);
 int snd_pcm_create_iec958_consumer_hw_params(struct snd_pcm_hw_params *params,
 					     u8 *cs, size_t len)
 {
-	return create_iec958_consumer(params_rate(params), params_width(params),
-				      cs, len);
+	int ret;
+
+	ret = snd_pcm_create_iec958_consumer_default(cs, len);
+	if (ret < 0)
+		return ret;
+
+	return fill_iec958_consumer(params_rate(params), params_width(params), cs, len);
 }
 EXPORT_SYMBOL(snd_pcm_create_iec958_consumer_hw_params);
-- 
2.31.1

