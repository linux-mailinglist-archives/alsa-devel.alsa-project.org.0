Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341B3766D3
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06E0A84B;
	Fri,  7 May 2021 16:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06E0A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620396518;
	bh=qxlczNazHFkEG49vMHlXZ0isJohgAYtrUCxsAEI1lO8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YtXbgpoSpywUdlNzIISW4NnLVCJkkC3haiWcHZLRXsfdV74NoV4slJEKg7Jp1owXW
	 QRc7eRIWw1Gts0VGaxrUhSxo/irt3RwWJzMjr/HoU2q4W+KZOgmsSbDgaMKY/zrIjV
	 okCtVSLDzmQFHG/Q67Aq9Azlhu/WCbGCqsdSDDPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39EC7F804E2;
	Fri,  7 May 2021 16:05:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44E5BF804E1; Fri,  7 May 2021 16:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0D91F804DF
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D91F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="WNCgn3gw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="A99rgBSf"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 9AFDD10B5;
 Fri,  7 May 2021 10:05:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 May 2021 10:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nkQdZXJuk0cxE
 elA5wlSpQhj9rb48V0iqU/erk5ij2s=; b=WNCgn3gwafgcn2JBF5quiVmtFUpGT
 4tEWnmpca5eee1KfZvSXeqNqsXG3rIhKNZ+HuQ0q+PyTIBMii9GFCxHm5Bof34Dq
 2i0x78q5h/e/zGSBkpmwmTE6jCUYIDdgM8Wow6AcWx62lbbtIDEBQMaIuRU2O+W6
 0pmjC4Q1UD9UTHPItLwunXnsXzufqi9lQzRbhwOXilh/MtGOe4p8w18hfXBgaAqm
 tPdvyfKkMnl+IfC+Ib9ZueZOcC7J1mWrUi440Cfz8R6B0nIpaFWxuzqT1rDjxs30
 oQ4kASgKgdm/7rUPUG9vrG37ZSxwDgVqUAxv6EUQVyUvU9wgHKT2jtHhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nkQdZXJuk0cxEelA5wlSpQhj9rb48V0iqU/erk5ij2s=; b=A99rgBSf
 Xv7TLELRpxa0M0OkDBfW84hTqG2kzADXPkRDHiVg+ldJkwI8kLsoDQVfKMiuPN9J
 FtWLq6yLI3kngBnR6C6t7lUfZj8F+CyrRE5A1OZs8AWkXH3TmTFtAWu2RFxenb0o
 aWpwA1ZG04o4o9M/PpMsCYSRW4v9Q+h5qRrRjqI387pbEk0s8/Zk+ZP6h5IJSXfk
 D5MuSURdA8TIi/wZxRbs7tFcuxijOGYs7/vLMrXLNBUyuYX2itWipuWgCp9Scz0s
 PoI2etFdqTUEbK6eoP4RUJJoy/+lFTj+EaC9Iw9bCA5eBM/aYv8WFc2ZBfDNKw/A
 M11JHmoH7c26EQ==
X-ME-Sender: <xms:GUmVYLQHJqUHbrksuL-76Czw2ayTxqq4yi7wEBePrJFJlimo6ICkxQ>
 <xme:GUmVYMwbA_bRx43omzQmF7ExgAK1p_DmrWjOyJEeaUILLTehC7O-CLJ_acapf6dg2
 HS4sbLZv5Dpk3q8Itg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GUmVYA12vAm5YuuHnHAAJuWUonc82a55LUWYTaVqhjo8K8f3pmPcrg>
 <xmx:GUmVYLBdLdYpRhSd6BrPLwOUvqgVn5xz0r9OgwIrHmosRNtUoehM2w>
 <xmx:GUmVYEjIAC747l5SjtjOf2FhQ1iGz1xkyQh_PPVwcrxzAGxt01e3Hw>
 <xmx:HEmVYMThXe4RN2wQb-RO1Zg6snpcG8L60dyieaVUz-8Y6FJks34SE0gvqqo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:05:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 06/11] drm/vc4: hdmi: Set HDMI_MAI_FMT
Date: Fri,  7 May 2021 16:03:29 +0200
Message-Id: <20210507140334.204865-7-maxime@cerno.tech>
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
 Daniel Vetter <daniel@ffwll.ch>, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
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

From: Dom Cobley <popcornmix@gmail.com>

The hardware uses this for generating the right audio
data island packets when using formats other than PCM

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 48 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vc4/vc4_regs.h | 30 +++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 459d76414a29..9d33ac464a2d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1125,6 +1125,44 @@ static void vc4_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
 	vc4_hdmi->audio.substream = NULL;
 }
 
+static int sample_rate_to_mai_fmt(int samplerate)
+{
+	switch (samplerate) {
+	case 8000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_8000;
+	case 11025:
+		return VC4_HDMI_MAI_SAMPLE_RATE_11025;
+	case 12000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_12000;
+	case 16000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_16000;
+	case 22050:
+		return VC4_HDMI_MAI_SAMPLE_RATE_22050;
+	case 24000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_24000;
+	case 32000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_32000;
+	case 44100:
+		return VC4_HDMI_MAI_SAMPLE_RATE_44100;
+	case 48000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_48000;
+	case 64000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_64000;
+	case 88200:
+		return VC4_HDMI_MAI_SAMPLE_RATE_88200;
+	case 96000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_96000;
+	case 128000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_128000;
+	case 176400:
+		return VC4_HDMI_MAI_SAMPLE_RATE_176400;
+	case 192000:
+		return VC4_HDMI_MAI_SAMPLE_RATE_192000;
+	default:
+		return VC4_HDMI_MAI_SAMPLE_RATE_NOT_INDICATED;
+	}
+}
+
 /* HDMI audio codec callbacks */
 static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params,
@@ -1135,6 +1173,8 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
+	u32 mai_audio_format;
+	u32 mai_sample_rate;
 
 	if (substream != vc4_hdmi->audio.substream)
 		return -EINVAL;
@@ -1155,6 +1195,14 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
 	vc4_hdmi_audio_set_mai_clock(vc4_hdmi);
 
+	mai_sample_rate = sample_rate_to_mai_fmt(vc4_hdmi->audio.samplerate);
+	mai_audio_format = VC4_HDMI_MAI_FORMAT_PCM;
+	HDMI_WRITE(HDMI_MAI_FMT,
+		   VC4_SET_FIELD(mai_sample_rate,
+				 VC4_HDMI_MAI_FORMAT_SAMPLE_RATE) |
+		   VC4_SET_FIELD(mai_audio_format,
+				 VC4_HDMI_MAI_FORMAT_AUDIO_FORMAT));
+
 	/* The B frame identifier should match the value used by alsa-lib (8) */
 	audio_packet_config =
 		VC4_HDMI_AUDIO_PACKET_ZERO_DATA_ON_SAMPLE_FLAT |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index be2c32a519b3..489f921ef44d 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -516,6 +516,36 @@
 # define VC4_HDMI_AUDIO_PACKET_CEA_MASK_MASK			VC4_MASK(7, 0)
 # define VC4_HDMI_AUDIO_PACKET_CEA_MASK_SHIFT			0
 
+# define VC4_HDMI_MAI_FORMAT_AUDIO_FORMAT_MASK		VC4_MASK(23, 16)
+# define VC4_HDMI_MAI_FORMAT_AUDIO_FORMAT_SHIFT		16
+
+enum {
+	VC4_HDMI_MAI_FORMAT_PCM = 2,
+	VC4_HDMI_MAI_FORMAT_HBR = 200,
+};
+
+# define VC4_HDMI_MAI_FORMAT_SAMPLE_RATE_MASK		VC4_MASK(15, 8)
+# define VC4_HDMI_MAI_FORMAT_SAMPLE_RATE_SHIFT		8
+
+enum {
+	VC4_HDMI_MAI_SAMPLE_RATE_NOT_INDICATED = 0,
+	VC4_HDMI_MAI_SAMPLE_RATE_8000 = 1,
+	VC4_HDMI_MAI_SAMPLE_RATE_11025 = 2,
+	VC4_HDMI_MAI_SAMPLE_RATE_12000 = 3,
+	VC4_HDMI_MAI_SAMPLE_RATE_16000 = 4,
+	VC4_HDMI_MAI_SAMPLE_RATE_22050 = 5,
+	VC4_HDMI_MAI_SAMPLE_RATE_24000 = 6,
+	VC4_HDMI_MAI_SAMPLE_RATE_32000 = 7,
+	VC4_HDMI_MAI_SAMPLE_RATE_44100 = 8,
+	VC4_HDMI_MAI_SAMPLE_RATE_48000 = 9,
+	VC4_HDMI_MAI_SAMPLE_RATE_64000 = 10,
+	VC4_HDMI_MAI_SAMPLE_RATE_88200 = 11,
+	VC4_HDMI_MAI_SAMPLE_RATE_96000 = 12,
+	VC4_HDMI_MAI_SAMPLE_RATE_128000 = 13,
+	VC4_HDMI_MAI_SAMPLE_RATE_176400 = 14,
+	VC4_HDMI_MAI_SAMPLE_RATE_192000 = 15,
+};
+
 # define VC4_HDMI_RAM_PACKET_ENABLE		BIT(16)
 
 /* When set, the CTS_PERIOD counts based on MAI bus sync pulse instead
-- 
2.31.1

