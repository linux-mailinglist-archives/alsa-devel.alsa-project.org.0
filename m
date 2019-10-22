Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365B2E0361
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1088165E;
	Tue, 22 Oct 2019 13:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1088165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571745069;
	bh=dvRh5ZBY30PfUQEDKRsCjsaZiH6XL90uOPZmH4n5OfU=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVXhRLoWh90H1CGZ6P/WaM74ikBbalm6Y39oTVXlJpkLQrEf3xdgnxs4MUCd6AEXO
	 vD2c9GyCPUn/wuCjf+YWSkiGy6Pii5Cf1IAz821ig0k+OSucqAyxuCRWK2pEk7/Erp
	 WiZkWuVcRhA0nrAcRq5AAuPDy1m1K9QnuLb+Te1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00998F80635;
	Tue, 22 Oct 2019 13:47:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42CC1F80612; Tue, 22 Oct 2019 13:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424C3F805FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424C3F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="SIBiN9mi"
Received: by mail-pf1-x44a.google.com with SMTP id 22so13182590pfx.8
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=bhx4XpOMOAvSvKbY+GNWUpjZmdRh9xAzVtH8yGRzOsQ=;
 b=SIBiN9miBukP2vHVz9yb1Z7FzYKWBp7bstUfIx/l48YcGQot4ut6+8V5YUJL6c1Vqp
 0A/NHXnagesp/88Em+/Q++21OMqJgdwe9fSH0k6LaOG4jpyJyc5tDwISjoBwE6mLxDSa
 5veKygBQcZRHA4AZSjrCwhGgXe5MlbkeCUSywhc1nboAqBjXAADehO5RiEnoH+Ya/rkn
 8ncAtmX9QmchPk8cZwR0wLlGED4guLq/cpUFd7MfjP5n9FZtZt9lRPqBFKOrIKm+5r9x
 hpFDohJpJTr9QNLCYOEN8Ii6mALgfaNKpGwWnkxxYn5ezvpwhygwN7nAytfE7CPmcqJN
 cXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bhx4XpOMOAvSvKbY+GNWUpjZmdRh9xAzVtH8yGRzOsQ=;
 b=NkMXAGJDgStjNfQ/Ysgr08s7zZLUqpfNAP+UJdyPwuTWW+W+6HXk8JXA1zAg68bx7N
 80PW13qu581uVinEYXDW+Rwwi3TwZlOVM6eWnD8u/lI1d7EtZ6luy0JS3rl3DqdD8T/J
 +hXV9HfM/IpNGx0sHDVoGa+yR7JiYCq720/E/ke47Y+bBAOeSKlzM1yvkH6uXT+lazA7
 vH32TqH4cSvWB2wwjNXI9W3M/qZyfrFdbTDoquWYxPDLKdX8yLMNverlDjUkR4pvkKC4
 n5rzNd3KYzo5EO5gpoSQAGwyXsuA1Dh4CDjHmTZjwPuOcgWjtWUEKXRuloGb0QDKLpNn
 5yDQ==
X-Gm-Message-State: APjAAAWEaCNU4v0yy/2EfMasI4M1+aglqKaM9XHDn4kcidCtnqpPatLa
 sRP/87h/cAPu5f3kCbsq6RzTtWIX8tzI
X-Google-Smtp-Source: APXvYqxav0HrOfMpw4960RSWWzv7KqgN4pnD2wXbdoyd8cYu/tGEv/ffv9S5k7+O4gnGu3yAJgDijmZjv4MQ
X-Received: by 2002:a63:6116:: with SMTP id v22mr3089716pgb.95.1571744825052; 
 Tue, 22 Oct 2019 04:47:05 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:45:03 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.4.I659b5e6b25155890b85eb1c361e60f92d2500b7e@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 4/6] ASoC: mediatek: mt8183: use hdmi-codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add DAI link to use hdmi-codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c      | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 0555f7d73d05..258f1416fae1 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -191,7 +191,7 @@ SND_SOC_DAILINK_DEFS(i2s5,
 
 SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
@@ -479,7 +479,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8183_mt6358_ts3a227_max98357_card;
-	struct device_node *platform_node, *ec_codec;
+	struct device_node *platform_node, *ec_codec, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
 	int ret;
@@ -496,9 +496,12 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
 
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platforms->name)
-			continue;
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = platform_node;
 
 		if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
 			dai_link->cpus[0].name = NULL;
@@ -509,9 +512,10 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 			dai_link->codecs[0].dai_name = "Wake on Voice";
 			dai_link->platforms[0].of_node = ec_codec;
 			dai_link->ignore = 0;
-		} else {
-			dai_link->platforms->of_node = platform_node;
 		}
+
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
+			dai_link->codecs->of_node = hdmi_codec;
 	}
 
 	mt8183_mt6358_ts3a227_max98357_headset_dev.dlc.of_node =
-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
