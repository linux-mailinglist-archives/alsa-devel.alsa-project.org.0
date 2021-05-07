Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DFF3766C8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 16:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF9FA850;
	Fri,  7 May 2021 16:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF9FA850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620396434;
	bh=IkNXHguKRULC0E3LwgrPw7/3X/77urE1ScXoDAulgkA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hs9Pm0CaaZJUwVkW8qwI0bLcFtQDFuRx28ZfVFxFXQeQe3sbl6qRLG3o//u0xpFRL
	 uObE8jpIId4RqJXADl4Z/TshkIp7RKAOrwLoBgKklPOtNNULOrxWKZYqjvqfV9EKOx
	 7AzKJKe3Msc3eTODSz5bIg4E7AtFVZaFyRnjjdT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 479F0F804A9;
	Fri,  7 May 2021 16:05:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55116F80482; Fri,  7 May 2021 16:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 078FDF80108
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 16:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 078FDF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="b+o1gs9k"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sfgEYNl3"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A409BC82;
 Fri,  7 May 2021 10:04:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 May 2021 10:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=p4zNkQ6XqSu53
 1sqVPafbjFGIX0E1EULqXXdj3asw88=; b=b+o1gs9kqt42h8FDXMFQBMaAq5EIY
 Y61zxCthjPYd0PYYRRmVFk4Y6hbhQSbyda3qcwLQ0W6UwbomliRnH3DnqesUPUox
 dn0v9KN5aYmE1zpMqK66JWUO8akYPvTTC58WSDoX3gMRDNhxe8kUeOEeKMusy4jr
 oPnYlbQ8G+JfCUFIEC+y5PldrOgBiePSU87UTJlDcW8aDzGA0oHLUPnwhC3dEWLD
 cLeVUiMCbKAQND18f3JGccjePbq/ONBi1C2uIlFfNycXFncEjsUgxonjV1iPXZOo
 zcxUmyZ0ja3I+eYItvRAKsXgIH3cErYa2XsWGfs9qSyLj3hj3u9XX4FEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=p4zNkQ6XqSu531sqVPafbjFGIX0E1EULqXXdj3asw88=; b=sfgEYNl3
 KEYOaerCWT0EZO7ibWnt8UIbcFyT7qlk56JtzvjvAv8caTmTPrxq84a+oaNFQiKK
 3tPXP50iyFZeerowCaIQpT8+aaGScaFWZ78sQ5cDXKAQte/lMjwV7kP/kOjxv84r
 nrwAiHbFNGaeSdqn/PAaSjOV2TbgDselj/+5sGMsZgFeHKWVDhzNc902tYBK9zAh
 K1MmlV1eCexg8rjJOtYQP3km3ppxyoa9/JIWxBl+0Z91XHOKoeUB0Qe1ojGTSKlE
 hN6Jy4uoBd8lSjBUIyuhN21Nvx+AFSemwDhaWYcFc9BvnxFBoignlgq5iKO97suW
 sgU0c2KCA0lXqw==
X-ME-Sender: <xms:BEmVYG_AmEyOlku4kJKBRS-KAsQb6Hqdgq_u9iO7qK4SYgGr55ga3g>
 <xme:BEmVYGvFN8pqCAMEhDjBIx4WfHjp8NbXNGQfklBjAPkaETbXEkZ8vmPIQzf1xhBPG
 45-WeG-E6JkQvvqAsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BEmVYMCIIfUjZc_JH8hRPP-Li0zjGQ-r3FaH6QUAT6lDe_jaiqWJSg>
 <xmx:BEmVYOclB1Y3j-b-u84Qlxs0v6q8-Y-YfELrNjn37dpOWocNUChVyw>
 <xmx:BEmVYLNxUIz_mYWEXvdKgU38cX0d59dFuAGjgzHF5WnEZ2hKgBSbpQ>
 <xmx:BEmVYC--udB5snsYV8MDhU2i9uafBmlFmnKy0kxCQViD10DLVjiVl7URYw8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:04:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 02/11] ASoC: hdmi-codec: Rework to support more controls
Date: Fri,  7 May 2021 16:03:25 +0200
Message-Id: <20210507140334.204865-3-maxime@cerno.tech>
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

We're going to add more controls to support the IEC958 output, so let's
rework the control registration a bit to support more of them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/hdmi-codec.c | 43 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 422539f933de..bc0d695d2df0 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -621,21 +621,23 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 			 SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S32_BE |\
 			 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
-			      struct snd_soc_dai *dai)
-{
-	struct snd_soc_dai_driver *drv = dai->driver;
-	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct snd_kcontrol *kctl;
-	struct snd_kcontrol_new hdmi_eld_ctl = {
-		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
-			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+struct snd_kcontrol_new hdmi_codec_controls[] = {
+	{
+		.access	= (SNDRV_CTL_ELEM_ACCESS_READ |
+			   SNDRV_CTL_ELEM_ACCESS_VOLATILE),
 		.iface	= SNDRV_CTL_ELEM_IFACE_PCM,
 		.name	= "ELD",
 		.info	= hdmi_eld_ctl_info,
 		.get	= hdmi_eld_ctl_get,
-		.device	= rtd->pcm->device,
-	};
+	},
+};
+
+static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_dai_driver *drv = dai->driver;
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	unsigned int i;
 	int ret;
 
 	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -652,12 +654,21 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	hcp->chmap_info->chmap = hdmi_codec_stereo_chmaps;
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 
-	/* add ELD ctl with the device number corresponding to the PCM stream */
-	kctl = snd_ctl_new1(&hdmi_eld_ctl, dai->component);
-	if (!kctl)
-		return -ENOMEM;
+	for (i = 0; i < ARRAY_SIZE(hdmi_codec_controls); i++) {
+		struct snd_kcontrol *kctl;
 
-	return snd_ctl_add(rtd->card->snd_card, kctl);
+		/* add ELD ctl with the device number corresponding to the PCM stream */
+		kctl = snd_ctl_new1(&hdmi_codec_controls[i], dai->component);
+		if (!kctl)
+			return -ENOMEM;
+
+		kctl->id.device = rtd->pcm->device;
+		ret = snd_ctl_add(rtd->card->snd_card, kctl);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int hdmi_dai_probe(struct snd_soc_dai *dai)
-- 
2.31.1

