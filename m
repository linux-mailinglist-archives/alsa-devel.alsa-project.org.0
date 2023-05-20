Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871270A8A7
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 17:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96676741;
	Sat, 20 May 2023 17:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96676741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684594914;
	bh=s2589WTfDHqv8RZb7utrRSep/6ImKHthV3pzZb2k6n4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AV1HD724wRzRxa2V96fLb86WFtN5HquHK1svPosPRngbodA/6mTHSF9IiQAaKXQ5F
	 5N4U5llbOREG1bzujmaZjW840yyCuOiqGd44c7zBi118ojVAS6X7jD0KvpvMcFhKAA
	 5iVc8nia2o8eEoE0MZA0oItrKpBhC40t5CQBZvY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E1E4F8016A; Sat, 20 May 2023 17:01:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E9B7F8025A;
	Sat, 20 May 2023 17:01:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 673A4F80272; Sat, 20 May 2023 17:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F095F8016D
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 17:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F095F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=QyT70HvV
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 0O4hqFQmweM6M0O4iqgCiP; Sat, 20 May 2023 17:00:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684594853;
	bh=5VvxviU32EnF0yUc09qoA4jqdLeStDT9+mAuA1G4mT8=;
	h=From:To:Cc:Subject:Date;
	b=QyT70HvV0e5RPfiuGIrnDb/2Rni0o2JNkfLH9Xnif4lQWNXymjTE4Pp8pXFvUuufv
	 jAodpg9v2ARZslta04J0XOkseNB0plN7Gta57uvW+RwcGBsd7ANChzHaTYEYD67/A+
	 t7RPE59bhX6x1mwoaaOB9xIzomKA+h3J9Mw4f5dlJAjBzp6AiAP6HfM/kYYjfUe2ag
	 KFSdS66CHdYGz8ctvva/4/sAhcqImOmUZ59GMfyExKNsrSFaXWfWd6daxlaVOaP392
	 1TdFD5Xk+Tz2/xAKb3gbZoPbaFloiA5dtXhg6vRLml1TapBPcqtUSMNUmu+as7ZIf6
	 MOMw8Bb4h58YQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 17:00:53 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: stm32: sai: Use the devm_clk_get_optional() helper
Date: Sat, 20 May 2023 17:00:50 +0200
Message-Id: 
 <f7987f18dadf77bfa09969fd4c82d5a0f4e4e3b7.1684594838.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LUNSKSHRTVXAQCOBHS4XPCHEWT3Q2ORG
X-Message-ID-Hash: LUNSKSHRTVXAQCOBHS4XPCHEWT3Q2ORG
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUNSKSHRTVXAQCOBHS4XPCHEWT3Q2ORG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use devm_clk_get_optional() instead of hand writing it.
This saves some LoC and improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/stm/stm32_sai_sub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index f6695dee353b..271ec5b3378d 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1485,12 +1485,9 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 	} else {
-		sai->sai_mclk = devm_clk_get(&pdev->dev, "MCLK");
-		if (IS_ERR(sai->sai_mclk)) {
-			if (PTR_ERR(sai->sai_mclk) != -ENOENT)
-				return PTR_ERR(sai->sai_mclk);
-			sai->sai_mclk = NULL;
-		}
+		sai->sai_mclk = devm_clk_get_optional(&pdev->dev, "MCLK");
+		if (IS_ERR(sai->sai_mclk))
+			return PTR_ERR(sai->sai_mclk);
 	}
 
 	return 0;
-- 
2.34.1

