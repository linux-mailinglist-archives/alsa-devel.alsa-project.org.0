Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242DA2DD3C8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 16:10:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1869E186F;
	Thu, 17 Dec 2020 16:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1869E186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608217822;
	bh=cE8hDY17ZKvLvXpGPRpBTmaW7BROh9mWezI6jFITYvk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pUsLV1fhQhirkwfKptKyyseOS+iqYItEjdzqKqA8gtBXJfGT+Jcv+FUjvw0MFgEAX
	 6oWiXXwc8lNasrvD3cPFh4zI3e/nxV9iGqB0T2KR53qscZu/2lG9Ce/oCCGy7MWTii
	 6eVNWoPVuX+ppj73yx/XKI3dYGcVqKpfY3vhA3WQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B98D6F8028B;
	Thu, 17 Dec 2020 16:08:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54D16F8027D; Thu, 17 Dec 2020 16:08:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A7F0F80278
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 16:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7F0F80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="I+skmb5K"
Received: by mail-ed1-x534.google.com with SMTP id j16so6538102edr.0
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMTdGaZz4epAF+h7Vd7eoxRPSBCFlzhMnNdcHFWnV2E=;
 b=I+skmb5KXzOywyDXyDuqmQZUCxvxJexgo9S7JdYiSIIbpjJI+efsBbBEqZiHwZ7dGy
 qTmcRDFbZ88zADmj51WkixxV7kI6jw1VyG7Ex0FtJNAN5j/5hDZakhfJKgc14r1XBGHR
 /FKdHIIFdAx9nSQVOmD4FRd9z6gVrkiYqiL5XEM76af2oJJEhoTr6AOKLxPcrmoqy3Ie
 nTVyzqKoRzvIr4FXOBpJHmjDfyTi8KULgIT0ywfXGIioheUgHnuHKvLiTDwKsyKQH/sQ
 +2jFyZ8hu/wYBOEqjSzjkHxMu2sZ1pxQNOQKRBD6O1iSQH4+hiDIMG26dBkPgJ1EvzSR
 QrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMTdGaZz4epAF+h7Vd7eoxRPSBCFlzhMnNdcHFWnV2E=;
 b=BImUJuA6TxdR94Z4rSDsWkzamFbq7rUzJZVXKrxXdDyiOigVJRbUalba9EOUvAlTNW
 paNBt1mEeJobpou59xRxwtlVzJZACv0k/aiplR2T2BJdxjDA63ZSG+w+83mScV25gTvE
 CNMRdBjkfwLurAlqc2P3+RYypeKzGnQpR8+vysOnkAScoLw/btqGZmdTF7Q7IvIm+/HM
 63YdEBd8MnpOBKUOy51+hsV3aWs1zRJhjm8Jz3g8SPe1FX2TsCc24zhbScHmwd6ISFHD
 tUu7ICqmCCOyURx5VbxdcLdMnpAbQ4oEnIU92TYkDsUzMO2KVeFRQHHtM9UM+BQUoXFF
 A5aw==
X-Gm-Message-State: AOAM531cPwe8S5HVF3IwiiLEB38+TcICbYieMU6lTJoTSZuTfGygUdB0
 AJb9k5tYoSvuX4w8JhDsZhieGA==
X-Google-Smtp-Source: ABdhPJzToiS9DNA9nvKxMA55z2+ccMLPeBi2mj6gfCBdo9SCEIyCgtEBh+GVDXsOPgSA9ByNoUQcFg==
X-Received: by 2002:a05:6402:c0b:: with SMTP id
 co11mr37972133edb.180.1608217719534; 
 Thu, 17 Dec 2020 07:08:39 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id k21sm3909042ejv.80.2020.12.17.07.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:08:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdmin: fix axg skew offset
Date: Thu, 17 Dec 2020 16:08:34 +0100
Message-Id: <20201217150834.3247526-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

The signal captured on from tdm decoder of the AXG SoC is incorrect. It
appears amplified. The skew offset of the decoder is wrong.

Setting the skew offset to 3, like the g12 and sm1 SoCs, solves and gives
correct data.

Fixes: 13a22e6a98f8 ("ASoC: meson: add tdm input driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 88ed95ae886b..b4faf9d5c1aa 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -224,15 +224,6 @@ static const struct axg_tdm_formatter_ops axg_tdmin_ops = {
 };
 
 static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
-	.component_drv	= &axg_tdmin_component_drv,
-	.regmap_cfg	= &axg_tdmin_regmap_cfg,
-	.ops		= &axg_tdmin_ops,
-	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.skew_offset	= 2,
-	},
-};
-
-static const struct axg_tdm_formatter_driver g12a_tdmin_drv = {
 	.component_drv	= &axg_tdmin_component_drv,
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
@@ -247,10 +238,10 @@ static const struct of_device_id axg_tdmin_of_match[] = {
 		.data = &axg_tdmin_drv,
 	}, {
 		.compatible = "amlogic,g12a-tdmin",
-		.data = &g12a_tdmin_drv,
+		.data = &axg_tdmin_drv,
 	}, {
 		.compatible = "amlogic,sm1-tdmin",
-		.data = &g12a_tdmin_drv,
+		.data = &axg_tdmin_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmin_of_match);
-- 
2.29.2

