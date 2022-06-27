Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F181055B9B0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 15:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82BFF1670;
	Mon, 27 Jun 2022 15:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82BFF1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656335596;
	bh=Mgt6ye6zY9H8vX5xoFIVqg5jkbqC3mUF9oCCVZsqFJ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VM4N1hfDx2SrqjfuappD4Soem9eon+3aAh8EZiJKr2uqsLbp2Mf+sEhWSDGBn6oOw
	 Ak2IkYEqi+YVpJVVrVlHJE+wkyFdCokZYXrAwiJgmaqF9xm7/KJuVnp7MecZV7FlLQ
	 y1L9tl3P4Oh0Z2gzkvq1vNvZWrQhIs9DgxlbvJ/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF813F80128;
	Mon, 27 Jun 2022 15:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49206F80128; Mon, 27 Jun 2022 15:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8233F80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 15:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8233F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Vdtnw+e2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RBmurk015955;
 Mon, 27 Jun 2022 08:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=0Khu6/fuJfMLzW9aQk1bRq1eHO8RZ0Hw8Fa6zQNMHwg=;
 b=Vdtnw+e2/Z5f0r9TaRj6P+z8CFdM5/uMRDNNaz7dDa6LkDEuGG0er5QbUg/Rr44z8C84
 xRyhkm8yjKTJr3D10fAeJT6UpZx2vZfDOQ05n0lGsORJwgdEp+XdjCOp+ZV3yUUSc2mL
 WGLiX7A1ZtuAceJScHAUn20aoA5ibMpIMBaNk07298AmzEIB+qnMxPahk/krCYFsv5VG
 KiD595tv8HBKMZmRqin/c62DIaFDQZCJfc6x/LsYeyfL6SRYAJuVBOBzS3BsXg7yO8E9
 AkahUruv7Z5wG6mhFWjdDbrV6BlFZsVGDYNjKFsqN8i76w0fp5pSXwHGX5xRInFAxlX8 rQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gwys2jthu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 27 Jun 2022 08:12:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 14:12:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 27 Jun 2022 14:12:02 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52443458;
 Mon, 27 Jun 2022 13:12:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Date: Mon, 27 Jun 2022 14:12:02 +0100
Message-ID: <20220627131202.3148329-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5HNY2iefiqGyrAbo5CP_Ne9bRYCsGn9B
X-Proofpoint-GUID: 5HNY2iefiqGyrAbo5CP_Ne9bRYCsGn9B
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

Fixes: 0b491c7c1b25 ("ASoC: samsung: Update to use set_fmt_new callback")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Correct fixes tag.

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

