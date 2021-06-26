Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4B3B4F74
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Jun 2021 18:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA85166E;
	Sat, 26 Jun 2021 18:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA85166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624725115;
	bh=NsjJ114HX96PYHfOmodR0X6SqMXciwYt9yvGtEVJ/N0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GVWHQt9VJGjmy7xHaDTH2uTNNO2SRN8ZP3m3IsoRATnO7mTS/dNmw4W9ZI3aUfah1
	 nbpYC7ppZq4ZWuoL2enGKz3kK1nuqYis5DJwurydKICIa+yFfQaILZDDEdz8GIe4s9
	 0Og/atDSt/FmR7bIBJUeqm/j1E6zikukDJ6vL+iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 810C6F800E1;
	Sat, 26 Jun 2021 18:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC885F80271; Sat, 26 Jun 2021 18:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFD8BF800E1
 for <alsa-devel@alsa-project.org>; Sat, 26 Jun 2021 18:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD8BF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="STEKJ9E4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15QGNDB1028903; Sat, 26 Jun 2021 11:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=vjFpkEk0tZxVTzj9ZPMBg8GOxkVyG7PUJqc/UQoYdPQ=;
 b=STEKJ9E4670ciVG6X9LW6VR7LrEXe8ECWs/X7hN6fdnhmA2cPWGt2aXtyUHDTfyUl/od
 maml3VxucF2bTVxQfcRXGXZu6249DhJr/SfMd6oCntqyhd7BDbE/hdvJy1OeNu0FqHGQ
 jUx8QNPtI0e0gO3koLs25dKUDYHMoGy+YsBWdL9/V1tIGIK1dPqdo4xmwxX4L/zTA1KY
 eWoHCyuXR1jgyOfaTKzMYv68oUCJcMe54VCOTJv0/dlyId8dYA9ki476kp38//koa0S/
 qQhbOH/TXEl/3+HQhTvQyqlP6X2D/sc7TIwFPAzRD1Ov8i1HPwcbWk0LHGWtjg4+nRqY gA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39e0nsrbx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 26 Jun 2021 11:29:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 26 Jun
 2021 16:59:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 26 Jun 2021 16:59:41 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A46B4448;
 Sat, 26 Jun 2021 15:59:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: wm_adsp: Correct wm_coeff_tlv_get handling
Date: Sat, 26 Jun 2021 16:59:39 +0100
Message-ID: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Gz1_O_qp7gCn8LLemggYY8u64FduE5DW
X-Proofpoint-ORIG-GUID: Gz1_O_qp7gCn8LLemggYY8u64FduE5DW
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106260114
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

When wm_coeff_tlv_get was updated it was accidentally switch to the _raw
version of the helper causing it to ignore the current DSP state it
should be checking. Switch the code back to the correct helper so that
users can't read the controls when they arn't available.

Fixes: 73ecf1a673d3 ("ASoC: wm_adsp: Correct cache handling of new kernel control API")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 37aa020f23f63..59d876d36cfd8 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1213,7 +1213,7 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&ctl->dsp->pwr_lock);
 
-	ret = wm_coeff_read_ctrl_raw(ctl, ctl->cache, size);
+	ret = wm_coeff_read_ctrl(ctl, ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, ctl->cache, size))
 		ret = -EFAULT;
-- 
2.11.0

