Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739CDA3510
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 12:41:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 009841666;
	Fri, 30 Aug 2019 12:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 009841666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567161660;
	bh=TJF6WRmTEP4v11HSkReNU9QbL3gPTIf3gTcbNPDWL5M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p1L/D7lhbFhS0K1PulTTcA8crRFdXmKeTpv+RiaZMI/uRrxgYmTQtSNn7i3nQTg8N
	 0eUqIecttpU/SJtgGjVVxG1YgogqtRMUmWPritzydjv6NuTqi/QGkw9U1dfx2nko08
	 bvORk7VaobMp01PGHBBlEiQ8wwD5shB/5ityGdNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 137AAF805A0;
	Fri, 30 Aug 2019 12:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6FE8F80369; Fri, 30 Aug 2019 12:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33C49F80096
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 12:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33C49F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NSKMJhVQ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcLqi096670;
 Fri, 30 Aug 2019 05:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567161501;
 bh=XkrXSk4Ay3T1YcaHUJRNTcibDPompzK0GAMKJX330kA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=NSKMJhVQojhD5RPbenIQYfbSfUN9kbdmbESdnWOEhFkAQ1WHUkSxRSOy9Zqq7zc7+
 IQ1AwKf+mcOIYUAQzCIUzNJGQcwHObK6m1FId6zK9McjEQSnI3vatn/xTjuyAnGvY7
 yjYD1Jo1jm31js1HiGiSAQyXAwXS7O78K7biQT1M=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UAcLV9027949
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Aug 2019 05:38:21 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 05:38:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 05:38:20 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UAcG3Z076275;
 Fri, 30 Aug 2019 05:38:19 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Fri, 30 Aug 2019 13:38:38 +0300
Message-ID: <20190830103841.25128-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190830103841.25128-1-peter.ujfalusi@ti.com>
References: <20190830103841.25128-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, nsekhar@ti.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 1/4] ASoC: ti: davinci-i2s: Add S32_LE as
	support format
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

ASP/McBSP can support 8/16/20/24/32 bits word in theory. I have only tested
S16_LE and S32_LE, the other formats might not work so only extend the
supported formats with S32_LE for now.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-i2s.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 92c1bdc69086..f04d9fb5130f 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -612,6 +612,8 @@ static void davinci_i2s_shutdown(struct snd_pcm_substream *substream,
 }
 
 #define DAVINCI_I2S_RATES	SNDRV_PCM_RATE_8000_96000
+#define DAVINCI_I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.shutdown	= davinci_i2s_shutdown,
@@ -639,12 +641,14 @@ static struct snd_soc_dai_driver davinci_i2s_dai = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = DAVINCI_I2S_RATES,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,},
+		.formats = DAVINCI_I2S_FORMATS,
+	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = DAVINCI_I2S_RATES,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,},
+		.formats = DAVINCI_I2S_FORMATS,
+	},
 	.ops = &davinci_i2s_dai_ops,
 
 };
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
