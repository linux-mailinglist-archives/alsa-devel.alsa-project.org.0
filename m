Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 409725520FC
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E42712835;
	Mon, 20 Jun 2022 17:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E42712835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739112;
	bh=gdlYQXwWRtKL2CgBPbDv66bH7NuVC5xMJQGrWl1yumU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ni/LUiVdO345cm3FpJFgz7gWWRcpd2gegv0By7c3OwYJZM1f3kACuHZ9N8Bdr4rLc
	 eq/JMMD1fVhYbxlajChT6pZtJC6yQYGPkTPRUA734wMfi0BggqQpoLKm6jb68qHedj
	 Q5aEe/eNdFvEOFvL8WJphDXaTLSfyTyVqSqw+XNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA634F80C0B;
	Mon, 20 Jun 2022 17:08:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7557F804D0; Thu, 16 Jun 2022 16:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51488F80528
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51488F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NS8cl+rP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25G4igBo030693;
 Thu, 16 Jun 2022 09:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MJd4HTYiz47/wuQOLQf1s1YFU4vXLOeqEUW76ST4wvc=;
 b=NS8cl+rPwfa8MUX3QB5NWqoul1M/dV8noXSsOmnBTdy0e7fMPatWHoxrBgsbzNienzLQ
 eQQW3VKrZwA6m1OlLciydM7R2WER4IqJwNxJOeZKRcwLSFQRiPJy/rYZPqDr2yk/Bs+/
 jo6+nN5srH7nwJUVrkN/PWrHG3nzIhKDbpnPMgPQ6X1yUwnNVthLlYZvNzubMWV5LBsb
 jggr3o5IVAJgNfyAskKZ/2xNm6YJ1cmC873it/M+a6QeYCCbS6LnINhT9Zm0ke/LTGSF
 0wanPZUiEjjVLpD6H5cJymcC3Yhjv2NbNm4PS1UB2SsCRuRGOzdq+k/2Bbhz6xYI9pAb Fw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuw-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:37 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EE27111D4;
 Thu, 16 Jun 2022 14:34:36 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 87/96] ASoC: ml26124: Remove now redundant
 non_legacy_dai_naming flag
Date: Thu, 16 Jun 2022 15:34:20 +0100
Message-ID: <20220616143429.1324494-88-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LLhfd5OQapMheBczOb5ZBYu3eswTS1nF
X-Proofpoint-ORIG-GUID: LLhfd5OQapMheBczOb5ZBYu3eswTS1nF
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:46 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
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

The ASoC core has now been changed to default to the non-legacy DAI
naming, as such drivers using the new scheme no longer need to specify
the non_legacy_dai_naming flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/ml26124.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index de8fcbdd85be4..3c6ac77379cbe 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -537,7 +537,6 @@ static const struct snd_soc_component_driver soc_component_dev_ml26124 = {
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
 };
 
 static const struct regmap_config ml26124_i2c_regmap = {
-- 
2.30.2

