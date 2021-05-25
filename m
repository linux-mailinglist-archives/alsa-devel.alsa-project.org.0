Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB98390267
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD9E1732;
	Tue, 25 May 2021 15:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD9E1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949228;
	bh=+xXQb7ysbfjEEDB2GnobBdyD5HMvf13xTHzpFnuoBDc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MxL3fOmcX7J7ey1g6FUTOjyfuu/6YCOTgjf/ZSjdtP+ghHbF70nvW/egCfFhndddD
	 WF+ANApXEpTvr8+cklHh5BZi/LQax9VB7UQP5ISMkB2qPu0XsFWAmSg9qOjjGdmBIm
	 fXjxups83Tz+aUFMZ1UcFib9X68fw1v4Xmm+SS1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 715ADF804AB;
	Tue, 25 May 2021 15:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 984D0F8026B; Tue, 25 May 2021 15:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A008BF8011B
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A008BF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="FDPwjmp0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="opvUfrsh"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id DCA1758070C;
 Tue, 25 May 2021 09:24:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 May 2021 09:24:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=m3jqrHUcLvTHp
 x0b4SsKGIVJ+DdDaje1iSf3ZfK37qk=; b=FDPwjmp0f2USjfe98TFZn/YeVgsFc
 ofGk6rqMTPcnr3AuTv6O6T6LDLwXdeDbr6jc6TMkF8SbHy1qELqLanKNRPQTLRHx
 8cJLDHM8hdBQAMGua9envdWRmFSOtiXh9ubcX1mRaGKvywVt1HaHqb1mq4HA2n7m
 a9ly/2uETZ33/0z7yD0HylD3bdQEEzBk95zkOi6I0G8cNzpCrOmIg1y3rTtDyLBC
 o+kDb5ho027OofRcHD/XOrf2F6Q9TcktkNH1J/t0qBkjSRoSMC+YRxvU67qKz9K3
 q7xv9h6WvM6Fdf+RmtuSYSXxaNDB8q2pEtExGbFm8ZRhDPtjfO8D+dctg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=m3jqrHUcLvTHpx0b4SsKGIVJ+DdDaje1iSf3ZfK37qk=; b=opvUfrsh
 bg3bZ2mRB8yulvFszzrLnSug0JN4xdLWnREQo+PU6plQmFtJGAUM1YaE1dsRNa7t
 lxhSzNPgGfme0EvvaGj4+B53DL9Nvyd4B1aihYcZmFFJKUMXFASNoQ2OSZN0Fkbc
 8XiAdkSm/Nsh9qk0erjrcYIoQfW9Mkghulzds1Z2BMHtoksldA/KWrznj3TlGsZ9
 U7uH7AuYFhaoeAuc9xKuODlpNRlPCU3etJNTKlFhl/0RQKprYYe5J4oAsLGaRyB4
 NMaYqJZDmddMjXVQFWpzcWxaegOsODW8zrUR5vyWwUnfugh2/KNlQz6DQQCbJAi6
 YS3/JGIm/I6hlA==
X-ME-Sender: <xms:ePqsYKbo2bsNvCn5g4rOLs08WOcroIlhY1OcvwWvnSzGGj-Rid0pKQ>
 <xme:ePqsYNZOy3eGIofrJGLTzjZBJwfmkpVN_ik1TemFdJXM2W_ugJ6rBFhJz24SbbWj_
 Jn_p0mYj6Ot2ucFAdM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ePqsYE8tDePLz03Oojiu_vYtm7msMtvvsHfsTn_MaUnfVODFbCleiQ>
 <xmx:ePqsYMqwCA-4iwMHwtVyRb7LqgvfymQ-WrE4Dy9ZiNo7XRneEfQowA>
 <xmx:ePqsYFqGBJihHv8Lgt0UPAMUuW0i_XuzSCZVHX-MsVu_FlNJ6E4f_A>
 <xmx:ePqsYLhjkn6p9tGrEcM9PWoJ8_EoX8Rh-q4I18IPMtcfG81nKs_sQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:08 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 04/12] ASoC: hdmi-codec: Add iec958 controls
Date: Tue, 25 May 2021 15:23:46 +0200
Message-Id: <20210525132354.297468-5-maxime@cerno.tech>
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
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
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

The IEC958 status bits can be exposed and modified by the userspace
through dedicated ALSA controls.

This patch implements those controls for the hdmi-codec driver. It
relies on a default value being setup at probe time that can later be
overridden by the control put.

The hw_params callback is then called with a buffer filled with the
proper bits for the current parameters being passed on so the underlying
driver can just reuse those bits as is.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/codecs/hdmi-codec.c | 66 +++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 65bde6f0ea1c..5d6324585a31 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -277,6 +277,7 @@ struct hdmi_codec_priv {
 	bool busy;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
+	u8 iec_status[5];
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -385,6 +386,47 @@ static int hdmi_codec_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int hdmi_codec_iec958_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_IEC958;
+	uinfo->count = 1;
+	return 0;
+}
+
+static int hdmi_codec_iec958_default_get(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	memcpy(ucontrol->value.iec958.status, hcp->iec_status,
+	       sizeof(hcp->iec_status));
+
+	return 0;
+}
+
+static int hdmi_codec_iec958_default_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	memcpy(hcp->iec_status, ucontrol->value.iec958.status,
+	       sizeof(hcp->iec_status));
+
+	return 0;
+}
+
+static int hdmi_codec_iec958_mask_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	memset(ucontrol->value.iec958.status, 0xff,
+	       sizeof_field(struct hdmi_codec_priv, iec_status));
+
+	return 0;
+}
+
 static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
@@ -459,8 +501,9 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 		params_width(params), params_rate(params),
 		params_channels(params));
 
-	ret = snd_pcm_create_iec958_consumer_hw_params(params, hp.iec.status,
-						       sizeof(hp.iec.status));
+	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
+	ret = snd_pcm_fill_iec958_consumer_hw_params(params, hp.iec.status,
+						     sizeof(hp.iec.status));
 	if (ret < 0) {
 		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
 			ret);
@@ -621,6 +664,20 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 			 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 struct snd_kcontrol_new hdmi_codec_controls[] = {
+	{
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, MASK),
+		.info = hdmi_codec_iec958_info,
+		.get = hdmi_codec_iec958_mask_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
+		.info = hdmi_codec_iec958_info,
+		.get = hdmi_codec_iec958_default_get,
+		.put = hdmi_codec_iec958_default_put,
+	},
 	{
 		.access	= (SNDRV_CTL_ELEM_ACCESS_READ |
 			   SNDRV_CTL_ELEM_ACCESS_VOLATILE),
@@ -873,6 +930,11 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	hcp->hcd = *hcd;
 	mutex_init(&hcp->lock);
 
+	ret = snd_pcm_create_iec958_consumer_default(hcp->iec_status,
+						     sizeof(hcp->iec_status));
+	if (ret < 0)
+		return ret;
+
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.31.1

