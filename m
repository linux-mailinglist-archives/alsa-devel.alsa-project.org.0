Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9445E7077
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 02:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF8F15C3;
	Fri, 23 Sep 2022 02:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF8F15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663891370;
	bh=CvJeb17W9oXXmIkOz4RxpDIvAsD9k0w+VI709NtMMlk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CKxTTn91yUlHubrIBG9LB2GAWWQHEzVpaHQ5WPge+4SQJVrY1N4KVrZVymaHbXGqH
	 wvwFvvEte/TqsfmUMiCZm3AOKkcatmQVV+G2HlumQQhm0rPvef2eHpgX6jdtqbAkdP
	 SGKIB+bfd2rjGD3thiiWR2DlCh5IGyIIYxBh5z88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0507BF80567;
	Fri, 23 Sep 2022 02:00:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43906F80552; Fri, 23 Sep 2022 02:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F4BF804BC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 02:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F4BF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="fRZ6ih9L"
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AD38B660223D;
 Fri, 23 Sep 2022 01:00:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663891209;
 bh=CvJeb17W9oXXmIkOz4RxpDIvAsD9k0w+VI709NtMMlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fRZ6ih9LwAkI0KXAq2usOAZaS/JKkOsXjNJQiqFL6MvMycujfmHoLhpRPnYIsAYUb
 JN6+jRUWFl3nd2BSqCi61le6PTkTpJdq9qR0W/D//oFkmgnLcCZNo8J7WyM/NtXs++
 sBZgSR11QFLMmr/H0Ty30LBkVlDPPwzPKa4QuZG1nDaokWB6Od8pOG9nl8GuztcN0D
 FvSsKsTRm2nllEOk0Fd8dhqbQxwwyMpT+mqSVsQYe47tKBKSkWxWquq+PngTUcwKKW
 oW8RjISu/pOsqgy6A/vkJqRr5QQMd6EAZyC1KXhVc/ICDaQR5zh4hv/mh4gUghFOxj
 a/KU4vusoG6sQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 6/6] ASoC: mediatek: mt8186-rt5682: Expose individual headset
 jack pins
Date: Thu, 22 Sep 2022 19:59:51 -0400
Message-Id: <20220922235951.252532-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The rt5682 codec is able to distinguish between two event types:
headphone insertion/removal and headset microphone insertion/removal.
However, currently, the mt8186-rt5682 driver exposes a single kcontrol
for the headset jack, so userspace isn't able to differentiate between
the two events.

Add a definition for the headset jack pins, so that a separate jack
kcontrol is created for each one, allowing userspace to track and handle
them individually.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c       | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 4360871bfc44..2414c5b77233 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -41,6 +41,18 @@ struct mt8186_mt6366_rt1019_rt5682s_priv {
 	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin mt8186_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static struct snd_soc_codec_conf mt8186_mt6366_rt1019_rt5682s_codec_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF("mt6358-sound"),
@@ -75,11 +87,12 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 				    SND_JACK_BTN_3,
-				    jack);
+				    jack, mt8186_jack_pins,
+				    ARRAY_SIZE(mt8186_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.37.3

