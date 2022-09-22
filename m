Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E55E7070
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 02:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9CA183E;
	Fri, 23 Sep 2022 02:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9CA183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663891288;
	bh=vvjVtvI3wHKKEr7/3vOsCQXLkdfJFdUPXRSTytaHoMM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZthnWN9bopJbQT37hAq/1rZLqB42fkGAdY/LRflxdbW+qYsUF5So0EabNUCyEIt5r
	 A56M5S76UG/hEb9+OGp+4oG9uhEdOg/YUFMKLqmoOFB75VRSkO1dDiQUQgCAqzthLI
	 YJyPHov28z7Qoh5iatEC6jKRWr+kPk8N+jqLTW/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8790F80538;
	Fri, 23 Sep 2022 02:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE1D2F80538; Fri, 23 Sep 2022 02:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E146F80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 02:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E146F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="ZThd4pFy"
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2227C6602232;
 Fri, 23 Sep 2022 00:59:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663891199;
 bh=vvjVtvI3wHKKEr7/3vOsCQXLkdfJFdUPXRSTytaHoMM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZThd4pFyNYKjwnLwGvDV46S8HUeVjZgaTEdZLNgI1Wg6hX7YO8BCGh8L/N3AqSZmk
 ioKwaeSmSYXwIu7PdNANhRB2V2/NPI+IwhNmtKHHmDlFCD4J0iDbTA/Nf/4fqe3ooc
 y2LHkSk8Ql0ohvzn2LSna2G6b5OC89p9w5PS9dlxv7CLx1cOJfT6ZBP+I3YEy2kkjc
 O3/MNfWOWGNdvnJQaskhRlf4AlwaMHgIAomOdDpLFIG6/obHgByMvTidnjQ9frdvnS
 QpL5QYUcuB4H3QiEynhyJpWWX63nKWXjK6uw+jTQOLLLNLD36kZP1KtMifo5l4pVQ5
 DB0MnGu8fJJAA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/6] ASoC: mediatek: mt8192-mt6359: Expose individual headset
 jack pins
Date: Thu, 22 Sep 2022 19:59:46 -0400
Message-Id: <20220922235951.252532-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
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
However, currently, the mt8192-mt6359 driver exposes a single kcontrol
for the headset jack, so userspace isn't able to differentiate between
the two events.

Add a definition for the headset jack pins, so that a separate jack
kcontrol is created for each one, allowing userspace to track and handle
them individually.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../mt8192/mt8192-mt6359-rt1015-rt5682.c        | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 044d6ab71f0a..ff40ccd36f7e 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -41,6 +41,18 @@ struct mt8192_mt6359_priv {
 	struct snd_soc_jack hdmi_jack;
 };
 
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin mt8192_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -326,11 +338,12 @@ static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 				    SND_JACK_BTN_3,
-				    jack);
+				    jack, mt8192_jack_pins,
+				    ARRAY_SIZE(mt8192_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.37.3

