Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED19A28F02B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 12:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AFC1771;
	Thu, 15 Oct 2020 12:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AFC1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602757694;
	bh=UnmhPaO7sqfUsq4gglcLWVIROnqRe8DBuEgDVliaC0w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wx1yqT/nZP7Gl7tOzyQFUSfPYBcF6y2NTOr7LnSOwMOcR4U9gIWEVjU2XmgXBR3rb
	 gpuQyqEDOEKcLA4R2LCGlHLqUgvjUKuVwykiAhR7/vDTxgSaPpn0zxGPonEv+9Puiu
	 6J0w/WpJop5PJCU1x6XwDFFRyjk7IorDu6txYpNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49393F80247;
	Thu, 15 Oct 2020 12:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88A49F801DA; Thu, 15 Oct 2020 12:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86869F8012A
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 12:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86869F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HCCcasdW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09FAQWiA029366; Thu, 15 Oct 2020 05:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=YZmqXR2DnD/3dyGb5tJzBz6gDCu6t5gNmbcyFzK2RDQ=;
 b=HCCcasdWBJJMgiZH+2Y1XZfgcm5UUejXWhNaclN4e0W+2v+amX4kFUWPTgsj/Pfjq3TM
 r2DNJ0ZnvaHtRHGTABlRUeQ/3GFFjMWnX3G0Q1Bt6aqn2Arnu1SomHcUXYxFPSpUqrrG
 VX1Mxlom80rzJNCvjS2bGTmapM+Z+s6u6iubdYfGyyU98Eb5l2Z1LAi7X1fJrAUIlA7t
 LgwsQ3WdcpeYAkF8IK4heAJq+Va427LWjLHkU4k1kWnhsczuAT8Ia2GrTiXXi3VDmIOx
 iuzzkOx0pSOhRF2WX6oaNt/zS2llY9u+6dVDKQ5iQhiC2KaqZdffiZ0Bfqu2ZwRuyZGV xg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3439cnefpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 15 Oct 2020 05:27:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 15 Oct
 2020 11:27:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 15 Oct 2020 11:27:07 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6B4292A1;
 Thu, 15 Oct 2020 10:27:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm5102: Use get_unaligned_be16() for dac_comp_coeff
Date: Thu, 15 Oct 2020 11:27:03 +0100
Message-ID: <20201015102703.24622-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=629 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150074
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Replace the two-step copy-and-convert in
wm5102_out_comp_coeff_put() with get_unaligned_be16(). Apart from
looking nicer, it avoids this sparse warning:

wm5102.c:687:35: sparse: sparse: cast to restricted __be16

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm5102.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 2ed3fa67027d..70d353b63fe0 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -682,9 +682,7 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
 	mutex_lock(&arizona->dac_comp_lock);
-	memcpy(&arizona->dac_comp_coeff, ucontrol->value.bytes.data,
-	       sizeof(arizona->dac_comp_coeff));
-	arizona->dac_comp_coeff = be16_to_cpu(arizona->dac_comp_coeff);
+	arizona->dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
 	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;

base-commit: 2ebefde9de62a0828936e47b62975501993b5ee9
-- 
2.20.1

