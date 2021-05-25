Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D359739027C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73066173C;
	Tue, 25 May 2021 15:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73066173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949292;
	bh=kjjVI2DMqgUFoYNEuYHg2ME0QMinWPo7ml6YG9o7STU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKaxUCC2SvbXMSCY4qijLoTu8Ew9Fae+PUpSrdWnMs+mfv4QHrZSf1nCgJfD4mpc7
	 X5SS02Rct9F4iE8JCG4QE+kgqPOf37S6UmHDZW1on9UlIdIxYSh4xrxgN1v9OjqWt7
	 WcF3COafwa76HCJsmDyYMO0b7e4b0/cO6QcGWut4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85045F804D9;
	Tue, 25 May 2021 15:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 926A1F804B1; Tue, 25 May 2021 15:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCA48F80482
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA48F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="EkTUTihD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R57dyoR0"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0C454580715;
 Tue, 25 May 2021 09:24:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 May 2021 09:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=l0NAb6pUClJYD
 XAhlcpCQlGrHQYnA/GliFO1OEiukeo=; b=EkTUTihDTocMKdF3aDWTIcuSLvS4O
 07D5hskeyvDTg7KC84+E7xPxMWN3/NCqaW79myo7Cui8dImMV6rj0b6nJvD8yXa9
 EOKPh2kanBUT4XNtYqK6kU/eOmDby/GlhrnWRKLpjPz75+AqNZDFT6ECT2Elqgpj
 jb7+teXgo2YteTSiCyK/rammxvXT1ooXFX7BJ46sfamLhpqPx4eVerZ+W2pmG7Q5
 tRVkWuDziDQKkMKpxHCI1agLPUAEEVb/nMGX727Pho4RO1sNWPVluaHdME2q0bId
 DO7XFKRr+SjAwRoRnmOZIp3TP2L0okjsTWTxTp9C00/4caD7umUEAukaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=l0NAb6pUClJYDXAhlcpCQlGrHQYnA/GliFO1OEiukeo=; b=R57dyoR0
 8R1fWIvtaWMjoUx5CFkJxiK6BAR+lmTcX2665wj9Gmpi6hyrnrmxKp/OPbDdJwyx
 Ravql11jVrGcG25nCFRVzryMLsm5J4JOrK72yQxmbxzT7DTJFJYOBpLyRva3jvcM
 4s8HsDEgg1lfEDxhavgU7uOWSzMocLZYFn8c86MWIKIeDmHqKH7FpSznjtjzcTWl
 utmAPumBlYTsh+VY8ZZCq4Pnj9ELnzdbcCiO9b6MbdJOV/YfcmZpmDGTi/hheBRE
 fsT9hpKz/s0553L3MkKWWGfWWW7ULntUbvac1F51RoL1TcYuh4w9KkVPo+dR04US
 p7nsC2RgD9lf7g==
X-ME-Sender: <xms:fvqsYJE-a6nVCmd51xbADYUfpr3zvqwxZ3pFvLrWoe8sWeb0jjH0ow>
 <xme:fvqsYOUFgjBJa8GYNEt5HmWAfXKnTWsp02nmMl0h-rsyeDiZsDMU-bRgKO0ddeb-b
 Cl8A5Tek8OA5NX53yo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fvqsYLKYJHUqXRatgzI9CppiUpSvTXRmTfE1BUyr-6QZHZ9E6nMYRQ>
 <xmx:fvqsYPFbwCbsKhwt_TuG-Lfq-iXn0X5uVPSD0_cTnNZ5Gpmgff8DdA>
 <xmx:fvqsYPVv8U7oAuf_SFqnKKsN9UrTIXlI3y0zaVqfdyRcP6uNpPv73A>
 <xmx:f_qsYCryqC2zCySLxMIlVs55siIhSjCmSGg0fVmfCGO98fC2qpb4OQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 07/12] drm/vc4: hdmi: Set HDMI_MAI_FMT
Date: Tue, 25 May 2021 15:23:49 +0200
Message-Id: <20210525132354.297468-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
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
index 212b5df11d73..2c2f21ee0451 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1181,6 +1181,44 @@ static void vc4_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
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
@@ -1191,6 +1229,8 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 	struct device *dev = &vc4_hdmi->pdev->dev;
 	u32 audio_packet_config, channel_mask;
 	u32 channel_map;
+	u32 mai_audio_format;
+	u32 mai_sample_rate;
 
 	if (substream != vc4_hdmi->audio.substream)
 		return -EINVAL;
@@ -1211,6 +1251,14 @@ static int vc4_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
 
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

