Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6333B52D997
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1011E1775;
	Thu, 19 May 2022 17:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1011E1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975850;
	bh=irLb3mFc/U9ThrTwr+3hguGpVf0bi3R9CUJnridSs9M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXaTR5zr/T1mSj8FAoMkFyVI06CqZtfmkTni1P4H2rPAz7pi+z7HuifKq0pgblCsN
	 L7qb2fXA8Lg0P2zV7w9OpEFIrH61I2SAKkLWK+SGx9IZR/bzNor4Plb5da86XlTWkI
	 4T4MHPur0fjZfNL7/jAxHRFwavXoUJRjVr/0cBGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D36CF80681;
	Thu, 19 May 2022 17:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6365F802E3; Thu, 19 May 2022 17:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C16AF80568
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C16AF80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lnkQKKHH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k127002261;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=O1k08BLLSrWLN8bDTTYO6I9etCPuXwIsP0TRdmjUUh8=;
 b=lnkQKKHHuHjFy2bWDCn0K8JZyA+GsPfpvFgZ8fqdM3BOiG35hdgPqaNpjQdsSrkj7Yf6
 lLQfqfot2Htp2f4p2B5VtLD7M31mLzMxKDe0gK3iWoZA/8zc2ES0NKcd/kZ+d4CGyhp0
 vbglizWFVHzMOLJ8ncPuvYJGW6mS0fkaRV7tbgzqEpAZEyrPvld/OPJju8LzLbO6DQEU
 P+EpLEuGVy8l14E3a7Fdh8Z4Kq4hPmOGRNUmJSwU7O72KAe7t+YBxeA5nCo3d8JDsVKM
 ttTS+KvBrQlEwv5NLq3EpoiNmjPkXY4/jN9gB1hOvjQQJegSUx9dCkbYs1V/iU8U2/Wq Fg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 10C0511DA;
 Thu, 19 May 2022 15:43:21 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 37/56] ASoC: img: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:59 +0100
Message-ID: <20220519154318.2153729-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zERY7-qXw1jE8CwXTYUsZQAsiyaYzUHL
X-Proofpoint-ORIG-GUID: zERY7-qXw1jE8CwXTYUsZQAsiyaYzUHL
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 79e733bc0ae69..97cab6d95b169 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -373,7 +373,7 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
 	.trigger = img_i2s_in_trigger,
 	.hw_params = img_i2s_in_hw_params,
-	.set_fmt_new = img_i2s_in_set_fmt
+	.set_fmt = img_i2s_in_set_fmt
 };
 
 static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index d92539603d6cb..9ec6fc528e2b4 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -381,7 +381,7 @@ static int img_i2s_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
 	.trigger = img_i2s_out_trigger,
 	.hw_params = img_i2s_out_hw_params,
-	.set_fmt_new = img_i2s_out_set_fmt
+	.set_fmt = img_i2s_out_set_fmt
 };
 
 static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
-- 
2.30.2

