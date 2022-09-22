Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80185E7072
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 02:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A20EAEA;
	Fri, 23 Sep 2022 02:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A20EAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663891315;
	bh=ISOW3z3UoH6ajFB2isdB1bDkL2oaj2boZn5kSY9GOek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBOrnftU/7y93yVn4srO+cUeejOkGFenHbTjC2Y7tvYpn1nAyo2bXHXvUSOxhMJr0
	 Yg13URkI7Gigye811rQcHDG1uk9AUpb2ti/UYrJ6ejXNNpFmZ/gNTF/jbHN2y9ZbI8
	 QxRHH80kfV6/yEN5aU077ZH9xF8H1F9kEuP/lHLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A623BF804E7;
	Fri, 23 Sep 2022 02:00:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7551F804FE; Fri, 23 Sep 2022 02:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E8D1F804BC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 02:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E8D1F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="fXD++uf1"
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F21C96602238;
 Fri, 23 Sep 2022 01:00:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663891205;
 bh=ISOW3z3UoH6ajFB2isdB1bDkL2oaj2boZn5kSY9GOek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fXD++uf1S/DU/o3qgoQuzLEuPjsV/8hsGcGH6JPA8b0kISH6CZxN/3z2fpHs7EZSQ
 xxEF8xEIQdzaJAnQDGQ6YFRMteV0jGr+ITZ0pv0M5FSrDQz9mokez4g9pJnIlCe/fN
 f5x2amI/KWrPugmS0QoAP7NRckfVaWUfs4gKsWsXwbG0YOGbkwWOXB4IkmH5cpWtta
 ctaHvw2ONYX8+SjYLXxY876Ee5md+TzaxFAUb1A6JRblSvLusp/Ht7DBuuLsh9qi5P
 zrcosJqUwBx+2wdfVmmaJZ5m+wndV6Gsms+TmlclU4lZOzcbBbfznKezFNmxzbmFkI
 kxizSUPJb88dA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: mediatek: mt8186-da7219: Expose individual headset
 jack pins
Date: Thu, 22 Sep 2022 19:59:49 -0400
Message-Id: <20220922235951.252532-5-nfraprado@collabora.com>
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

The da7219 codec is able to distinguish between two event types:
headphone insertion/removal and headset microphone insertion/removal.
However, currently, the mt8186-da7219 driver exposes a single kcontrol
for the headset jack, so userspace isn't able to differentiate between
the two events.

Add a definition for the headset jack pins, so that a separate jack
kcontrol is created for each one, allowing userspace to track and handle
them individually.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../mt8186/mt8186-mt6366-da7219-max98357.c      | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 8d428bc4a3b2..cfca6bdee834 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -37,6 +37,18 @@ struct mt8186_mt6366_da7219_max98357_priv {
 	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin mt8186_jack_pins[] = {
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static struct snd_soc_codec_conf mt8186_mt6366_da7219_max98357_codec_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF("mt6358-sound"),
@@ -72,11 +84,12 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	/* Enable Headset and 4 Buttons Jack detection */
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 				    SND_JACK_BTN_3 | SND_JACK_LINEOUT,
-				    jack);
+				    jack, mt8186_jack_pins,
+				    ARRAY_SIZE(mt8186_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.37.3

