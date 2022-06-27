Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59755B8FB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 11:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A121EF;
	Mon, 27 Jun 2022 11:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A121EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656323088;
	bh=TD/iiG2MGXsHenjYSIQP13D63BfHzSUEDc6jUuJ8AD0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uXgumU54ZuSANm1oGg2xwKVNBl/9WipS9IDdn4RkSEnoRotDmU+dvtUYqZ69UW6s1
	 Vgcwj5ZSQ4v7fLniKH0RNeOtmp2U+WuCLiWqfCnae1A47Av1MVoCzNYvE5ywxTjx0+
	 nZVIV80aRc4o12o7epxZIzj3Pr9CsmSzKkKTF3ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F6D4F8028D;
	Mon, 27 Jun 2022 11:43:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75BABF8028B; Mon, 27 Jun 2022 11:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CC7DF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 11:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC7DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fFsyzNmK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25R6qLPI026382;
 Mon, 27 Jun 2022 04:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=yMU0jpROdhFuA14yjuioMus6L/3EfIebG5m6xYIHjn0=;
 b=fFsyzNmKqVuHg+36uywKRm1rw7/WN9EbtPtEEXYlnTpo3I4kV1cU4epi7vQGi0jpLF7x
 XmofCxq77j2+3JZkXRLsl1XkfmEgMroAM3HEhBfpJUTSI2XvyzCF+1idbFOD6pdhHkrM
 /6JQNIJA8LPaB3CNXbXoJpCdoTj4+/FdYZU4tyvBMAw9Pc78ZMMs2SVtGcuKFyrVchAY
 Y/FucMoJQWWMDBxve2Zy7PowJ7ewFshRvI+QOw7gXRuRXkfU0BlW5V/3/rgnd9OU6MeT
 yEAVD0JMLMh1LNW0wJ7siJ0IBgICaiEfwt4aXiWrhzCD/QmLhfby9MdMhWKiVKxBSPnM hg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gwxsq2ege-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 04:43:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 10:43:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 27 Jun 2022 10:43:35 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 47322458;
 Mon, 27 Jun 2022 09:43:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Date: Mon, 27 Jun 2022 10:43:35 +0100
Message-ID: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nY3888gUAWbKeO48SGu51K1Gcyn5iKeZ
X-Proofpoint-ORIG-GUID: nY3888gUAWbKeO48SGu51K1Gcyn5iKeZ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, jrdr.linux@gmail.com
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

The conversion of the set_fmt callback to direct clock specification
included a small typo, correct the affected code.

Fixes: 91c49199e6d6 ("ASoC: samsung: Update to use set_fmt_new callback")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/samsung/s3c24xx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 4082ad7cbcc11..c1a314b86b155 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -170,7 +170,7 @@ static int s3c24xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	pr_debug("hw_params r: IISMOD: %x \n", iismod);
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_BC_CFC:
+	case SND_SOC_DAIFMT_BC_FC:
 		iismod |= S3C2410_IISMOD_SLAVE;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
-- 
2.30.2

