Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA07A103AF7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 14:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8240F16E1;
	Wed, 20 Nov 2019 14:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8240F16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574256085;
	bh=fhOEgEiWYn5ddFaRxnkiR1wu55g//W/EbOeg5nNoXD4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WVmUO/8wYTHaeiGzTgHs7QXu/4m4EOSOSdbSmRkiBUiPnTk8Nx/CiT5ZC/8T7tIoK
	 bnfV73cTyiqY/evJIuJYmCmAutOwJd89coDaDA0hj5SoYedZ4UAgMSGaAy8UnbI0lC
	 gUmuNqNYv34EGU3im5PE0QtlivezM6cSWg4FDG04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A71F8014E;
	Wed, 20 Nov 2019 14:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3466EF8013D; Wed, 20 Nov 2019 14:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC1EDF8013D
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 14:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1EDF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="idf7kk/S"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKDI4AL033449;
 Wed, 20 Nov 2019 07:18:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1574255884;
 bh=D7ZpGl2GOQVl1LRPY+tj5e7FhNzsNfXiSHrb52YKorU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=idf7kk/SKW+n+VPi6VHNfUmXqbu9DunvBJm74dYACuYsioLK7uY7gjc0QrJTTvGQV
 6awdD6aj6/IarAZvQTEXJmushWd5CIxh7TH5nklx43Q20QnZcvwMVUXCVAFpTmwSar
 mqhEZNWAqWqKLE8iYTa/VvjaUBhlx3LIhpN7NTkU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKDI4OI092105
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Nov 2019 07:18:04 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 07:18:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 07:18:02 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDHru7067880;
 Wed, 20 Nov 2019 07:17:59 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 20 Nov 2019 15:17:53 +0200
Message-ID: <20191120131753.6831-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120131753.6831-1-peter.ujfalusi@ti.com>
References: <20191120131753.6831-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: [alsa-devel] [PATCH 2/2] ASoC: pcm3168a: Update the RST gpio
	handling to align with documentation
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

The RST (reset-gpios) is low active so the driver must handle it
accordingly.

Add comments to explain clearly how the line is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/codecs/pcm3168a.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index f3475134b519..9711fab296eb 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -707,11 +707,15 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	dev_set_drvdata(dev, pcm3168a);
 
 	/*
-	 * Request the RST gpio line as non exclusive as the same reset line
-	 * might be connected to multiple pcm3168a codec
+	 * Request the reset (connected to RST pin) gpio line as non exclusive
+	 * as the same reset line might be connected to multiple pcm3168a codec
+	 *
+	 * The RST is low active, we want the GPIO line to be high initially, so
+	 * request the initial level to LOW which in practice means DEASSERTED:
+	 * The deasserted level of GPIO_ACTIVE_LOW is HIGH.
 	 */
-	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "rst",
-						GPIOD_OUT_HIGH |
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
+						GPIOD_OUT_LOW |
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(pcm3168a->gpio_rst)) {
 		ret = PTR_ERR(pcm3168a->gpio_rst);
@@ -814,7 +818,13 @@ void pcm3168a_remove(struct device *dev)
 {
 	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
 
-	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 0);
+	/*
+	 * The RST is low active, we want the GPIO line to be low when the
+	 * driver is removed, so set level to 1 which in practice means
+	 * ASSERTED:
+	 * The asserted level of GPIO_ACTIVE_LOW is LOW.
+	 */
+	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 1);
 	pm_runtime_disable(dev);
 #ifndef CONFIG_PM
 	pcm3168a_disable(dev);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
