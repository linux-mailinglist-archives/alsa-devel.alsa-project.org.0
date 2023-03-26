Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B06C9454
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 14:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B0EA4B;
	Sun, 26 Mar 2023 14:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B0EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679834689;
	bh=NQp5qoPgBStpeaTB9I/gHoi1QzXt72mOR41wnzSi/4c=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=df7Ug/1jp+BbHhv55Cq/cKfnh8NP7C5/CmHHK502O9RL1TyKsVAogMCkafAFZjLKb
	 +DseDPtTw4jok+asVLfIWCXtekkd1TTLIKf4pKKSePqo++bcra8epAnoYcJq+4GLhJ
	 SMWF4AvDZ63oUDgHTqu4siuLq2wJoU9kgXU650Gc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86325F8024E;
	Sun, 26 Mar 2023 14:43:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0E93F80272; Sun, 26 Mar 2023 14:43:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr
 [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CFADF8021D
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 14:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFADF8021D
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id gPimpclLpV6zQgPimpzJp6; Sun, 26 Mar 2023 14:43:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Mar 2023 14:43:42 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] ASoC: meson: Use the devm_clk_get_optional() helper
Date: Sun, 26 Mar 2023 14:43:38 +0200
Message-Id: 
 <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q3X6V4MIEVI4TB5OIKD6235Z2ELSR3MS
X-Message-ID-Hash: Q3X6V4MIEVI4TB5OIKD6235Z2ELSR3MS
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3X6V4MIEVI4TB5OIKD6235Z2ELSR3MS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use devm_clk_get_optional() instead of hand writing it.
This saves some loC and improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/meson/axg-tdm-interface.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 7624aafe9009..5e5e4c56d505 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -496,7 +496,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_dai_driver *dai_drv;
 	struct axg_tdm_iface *iface;
-	int ret, i;
+	int i;
 
 	iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
 	if (!iface)
@@ -533,14 +533,9 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	 * At this point, ignore the error if mclk is missing. We'll
 	 * throw an error if the cpu dai is master and mclk is missing
 	 */
-	iface->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(iface->mclk)) {
-		ret = PTR_ERR(iface->mclk);
-		if (ret == -ENOENT)
-			iface->mclk = NULL;
-		else
-			return dev_err_probe(dev, ret, "failed to get mclk\n");
-	}
+	iface->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(iface->mclk))
+		return dev_err_probe(dev, PTR_ERR(iface->mclk), "failed to get mclk\n");
 
 	return devm_snd_soc_register_component(dev,
 					&axg_tdm_iface_component_drv, dai_drv,
-- 
2.34.1

