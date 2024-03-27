Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F359488ED12
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:49:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FF702C50;
	Wed, 27 Mar 2024 18:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FF702C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561763;
	bh=38DuKqkU9nqb2IfvIxDlQ62FIPAB7Mg2+F+R/IAhNOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hoikl4TxIB7M1YBBoZ+YUPvpk/s/3iAUb5TR6U76f8BpOKVK1OoyyfCodBeQlQuSI
	 2K2wp/TFGarFfazJlpD+a5RPsu1s23/DZQ+Xty7w5sFwDlGzM5BKTqKc0gvFKX7cSb
	 FybOVzd4H2zP/kcMf1x4HN1uF3VUQ3Ybgl+F6jWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91920F80808; Wed, 27 Mar 2024 18:46:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95BD5F8080E;
	Wed, 27 Mar 2024 18:46:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84125F80571; Wed, 27 Mar 2024 18:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04531F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04531F80074
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9EA18CE2534;
	Wed, 27 Mar 2024 17:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD10CC433F1;
	Wed, 27 Mar 2024 17:45:52 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:48 +0100
Subject: [PATCH 13/18] ASoC: rt712-sdca-dmic: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-13-86d5002ba6dc@linaro.org>
References: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
In-Reply-To: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=754;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=38DuKqkU9nqb2IfvIxDlQ62FIPAB7Mg2+F+R/IAhNOg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsXCxBFta4gJBMxr74GIAMr9a0NC2TzvDsA7
 BOg3IotuY+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbFwAKCRDBN2bmhouD
 1+bXD/9NlKjrxfXLzHczcbbEhUfmf+yjawqYo86xd07g4rDr5x1C3FktGeUAwpBLslIkZN+DJos
 2Si7OhfNcNugqnuO50POTZGbY4lOLexZW6tTL8F0xrdyu1WVh4+18mSfzfgmbPaTey92ie46ki2
 dI1ixahN3BZ5YD17yl2zPDmSy5yLJyXA74hpIlY6D6JUGP9jrGj7W0atg5nXoMkfCrZYQuqTPPB
 nvAMWMFNIXIFTbZ3dUvNmaY0ZzKNJghJFN0cPy6qmmmcEeUpuEnXDCQkt37QvV2R6EXpISElgrk
 67fCdZB/5llKr8L8cZb1cVOdXWTyga3OGUBnrereBt6sAMSTPonBwmJ6NAK7I7ApJtEO39Rsslh
 eUOQyTQuBoWY0kVA3fg3XPmBIq6I7qwztgRMunEHLC5mZ7ou1AvD0K7L3fdyMACd4siV36CiO5s
 QuSmTwzpuuQaFNbva2+h8uCTJ8ObzOzhU2QrV2ynUCOqTyEoT5QVes+91plxZ9W7GNwqRjiXZwX
 oM8Rzb4XLvUS0T1zLqeRWihBu3vqPdpEh041BHonUF1y1BmPtN6cY1DvPOklAVSL6CuCKJUgJuv
 c/JSJMNzWFvR2Cw4Lk/fq4/XXTezqbM1JzL6F2EGHetzaBwV6MCx+sGmWNLEpw7M4deCoI4vHA7
 YFdNrNbfJazYkZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: WVSQIXSWT23GKNVBU5KKZRZFXRBGGC63
X-Message-ID-Hash: WVSQIXSWT23GKNVBU5KKZRZFXRBGGC63
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVSQIXSWT23GKNVBU5KKZRZFXRBGGC63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in sdw_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt712-sdca-dmic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 0926b26619bd..0e4d7cbdc951 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -976,7 +976,6 @@ static int rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
 static struct sdw_driver rt712_sdca_dmic_sdw_driver = {
 	.driver = {
 		.name = "rt712-sdca-dmic",
-		.owner = THIS_MODULE,
 		.pm = &rt712_sdca_dmic_pm,
 	},
 	.probe = rt712_sdca_dmic_sdw_probe,

-- 
2.34.1

