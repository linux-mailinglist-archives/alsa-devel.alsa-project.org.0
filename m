Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 844CA378CAA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 15:18:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C511725;
	Mon, 10 May 2021 15:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C511725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620652691;
	bh=0EfUEn7RQHEieeAnkB5ZnTdQ2ZN+9ljDgSFluuLzEcE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pk1tCam8bq1HqaZyRUgWtJN0Pi4Bsx/hxdbnHf0ww93rpC8lLpZ3uMfjTMiMzShed
	 yDytbI4FQXZM2PzwAXCBr5Vu9ppQMe3W81YOgVM2vl0tE29njxSplITtwemJE6Y7Ky
	 M5QdCmS5D4U0In1T9uzNfo8q6YlC+r6bsNCo5Zzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C826FF804CF;
	Mon, 10 May 2021 15:14:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF782F804AC; Mon, 10 May 2021 15:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C55FFF802E7
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55FFF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ge+D18w0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ADD5cl017163; Mon, 10 May 2021 08:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=VnoySpN+bzOhwzfk9vr2maK/1NzhkSxMSGSmgYfbXtA=;
 b=Ge+D18w0KPJs44Tn5OR3hzuCVWQm3ezLdfNKAiIb9Q5DP/Kl8O9RwRXzPLCXrQgCcxPw
 NUhKM90BDHXUIroljfnmDC3O0hAumfGWbMzypIsJ4dnXnu1gxDCHxcB6Z6Te7JJ8s+jB
 zhs8EH1W9G3BLukfogwTkpBWErSfX0fHPwFoAqWOTjses2LxMkf5oGAtc8+1RpazUxo6
 ttYGONtdAK5I1dMFKzKnCEGG5aB7PJfkFElB9ss6zFJ6YYqwvwK0AzIH6+2NCQc+ddQZ
 oWye+cI01DdyYqHXAOtdo7oINeH5YlOZXSeBDlcwoxglID9FdMKU6jPs6oAgp1SS00XA UA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38f4x181h2-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 May 2021 08:14:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 14:13:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 10 May 2021 14:13:57 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D22EB11DA;
 Mon, 10 May 2021 13:13:57 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 06/10] ASoC: cs35l35: Correct errata handling
Date: Mon, 10 May 2021 14:13:53 +0100
Message-ID: <20210510131357.17170-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
References: <20210510131357.17170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Yh5rTxPtostlhpJdwddmPc_DGQFHeeEc
X-Proofpoint-ORIG-GUID: Yh5rTxPtostlhpJdwddmPc_DGQFHeeEc
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100092
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, james.schulman@cirrus.com,
 david.rhodes@cirrus.com
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

Currently the check of errata_chk will always evaluate to false since
the values tested don't come under the mask used. A shift of the field
is missing, add this. Also there is an error in the values tested, they
don't match the comment and the value 0x3 is not a valid value for the
field in question. Update the value to match the comment.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l35.c | 4 ++--
 sound/soc/codecs/cs35l35.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 554b32f388d9a..a4309312e84f3 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -496,10 +496,10 @@ static int cs35l35_hw_params(struct snd_pcm_substream *substream,
 	 * the Class H algorithm does not enable weak-drive operation for
 	 * nonzero values of CH_WKFET_DELAY if SP_RATE = 01 or 10
 	 */
-	errata_chk = clk_ctl & CS35L35_SP_RATE_MASK;
+	errata_chk = (clk_ctl & CS35L35_SP_RATE_MASK) >> CS35L35_SP_RATE_SHIFT;
 
 	if (classh->classh_wk_fet_disable == 0x00 &&
-		(errata_chk == 0x01 || errata_chk == 0x03)) {
+		(errata_chk == 0x01 || errata_chk == 0x02)) {
 		ret = regmap_update_bits(cs35l35->regmap,
 					CS35L35_CLASS_H_FET_DRIVE_CTL,
 					CS35L35_CH_WKFET_DEL_MASK,
diff --git a/sound/soc/codecs/cs35l35.h b/sound/soc/codecs/cs35l35.h
index ffb154cd962c2..2117dcb08c467 100644
--- a/sound/soc/codecs/cs35l35.h
+++ b/sound/soc/codecs/cs35l35.h
@@ -168,6 +168,7 @@
 #define CS35L35_SP_SCLKS_48FS		0x0B
 #define CS35L35_SP_SCLKS_64FS		0x0F
 #define CS35L35_SP_RATE_MASK		0xC0
+#define CS35L35_SP_RATE_SHIFT		6
 
 #define CS35L35_PDN_BST_MASK		0x06
 #define CS35L35_PDN_BST_FETON_SHIFT	1
-- 
2.11.0

