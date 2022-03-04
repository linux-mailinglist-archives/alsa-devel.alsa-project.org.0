Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D464CD753
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44CCC1AEE;
	Fri,  4 Mar 2022 16:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44CCC1AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646406611;
	bh=cPkDaWk4vF4qY3BD4mWwqE+ekezKk0pqvQZyr5WLb+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvrRwImr7i9hqG0XPGGPQMGQ/1vp8Zw1fHZYK4ZpyauPmbX7SkjM84m0SLsIxtTkR
	 WISmFUwSDr3bnlbcN/CPCoeO3CZRIOcF+g9e/QgSVY6fXji+1hB1oDflmr2XctLu3C
	 e35dhUr3249VEwiC0dkm/ZtzBPQf3abZoVduF9X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A8F4F80536;
	Fri,  4 Mar 2022 16:07:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED254F80507; Fri,  4 Mar 2022 16:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EED8F801F5
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EED8F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="e6V4QIBi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2248TInC019088;
 Fri, 4 Mar 2022 09:07:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=MvLIFyK+aPdf1q6xBSETIIvvuYavScJ3HoTXvZNE4tQ=;
 b=e6V4QIBiamBH3bq/Rwq+k67DtHSHxWtslgUgLp5puCVw82UqF5F1NpGgr6tXK/t3H5MN
 U04tx7SnsJtE3KCmkXRrhOvNu4T3jgkg1c0c9n8aEJ97rxnnogbYmZCzvBmtVm3pQXGT
 uAW+03ez1vRMsdoOWAJoattn8cjgGEb8Bsi4MKHCdHrP/xa4XRwWYPyRnwDzYhZk0naQ
 ZIwW501O/DdEYRxJyz9vHfTvjJIeFzVAZHa8AgWH/84C2Fr9IIlBQFSabS8GblUaRfeO
 v/8dHMUd0fP6qDy75Ch8AQulrhQaVQiQ77vjV1SeVmkuE/Mhg9QU1z9+Rao4hdBPPOj4 hw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h413-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:07:26 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:07:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:07:25 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DDBC6B06;
 Fri,  4 Mar 2022 15:07:24 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 04/20] ASoC: cs35l41: Remove unnecessary param
Date: Fri, 4 Mar 2022 15:07:05 +0000
Message-ID: <20220304150721.3802-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: khyzbKfRW4-RRab9-btNdSgE0h_DBZig
X-Proofpoint-ORIG-GUID: khyzbKfRW4-RRab9-btNdSgE0h_DBZig
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
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

cs35l41_private is not used on cs35l41_handle_pdata

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 05de94fd2e55..6b784a62df0c 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1115,9 +1115,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
 	.set_sysclk = cs35l41_component_set_sysclk,
 };
 
-static int cs35l41_handle_pdata(struct device *dev,
-				struct cs35l41_platform_data *pdata,
-				struct cs35l41_private *cs35l41)
+static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_platform_data *pdata)
 {
 	struct cs35l41_irq_cfg *irq_gpio1_config = &pdata->irq_config1;
 	struct cs35l41_irq_cfg *irq_gpio2_config = &pdata->irq_config2;
@@ -1260,7 +1258,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 	if (pdata) {
 		cs35l41->pdata = *pdata;
 	} else {
-		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata, cs35l41);
+		ret = cs35l41_handle_pdata(cs35l41->dev, &cs35l41->pdata);
 		if (ret != 0)
 			return ret;
 	}
-- 
2.35.1

