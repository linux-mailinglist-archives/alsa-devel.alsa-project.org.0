Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D50D2331AE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 14:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5402178C;
	Thu, 30 Jul 2020 14:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5402178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596110950;
	bh=d+82iwWHkguLvJ841+6pGneC73eDjm9EIjKgvHKFyts=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cSiDyw006eRVx6dtHEmwAex4x5He67LybkdLzj1Jl9PT2CaxQcS2bPO6BLr27UjJQ
	 0msIQMQorxfPdCJHJlYTWAlXxy0np3WRmqLJpMjUROr73uKi04o6of8N3L6LwhVIE0
	 Wh8NyxoiYDeLsYsrucQ7lKTE/EN/3Eh/iPSahrNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE94CF80227;
	Thu, 30 Jul 2020 14:07:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 001C9F8021E; Thu, 30 Jul 2020 14:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E5BF80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 14:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E5BF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="noIwF1Q4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UC2C98019718; Thu, 30 Jul 2020 07:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=nyqotu57rbuKxGespPT9IiZiohZhwAGL6Bru1L1RYaA=;
 b=noIwF1Q4gPMPWvBR2oCk7QBjQa1uio/fIN+8/OIdZLFUyeSAIKtA0SkPxKKuigjhnKrG
 rAt0mkJyRjuqs6yi49khn9J8/yUxxbo/D3iczl0I3HkPlNDS3txR1FTFWlw/bVXR42Rb
 B6pJafFqBxkRSq3bJ8uspijOoN8rWnkV1OS+18csytke67qGzlZdiRSMX0yqEojClb5b
 ySDTRBWsNDRkToX4GsOXrp2/B+I/rHtYPEehCaQLdigRjjeDlXqSxo3zwwXkPGEo1g7R
 m8c3O3IdWyIf0G6gGL6V85fGvlNcmYSpqfYUWYR6i+6iw1D1pTE2htThKB71NyJ6sepz TQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 32gh5qqb5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jul 2020 07:07:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 30 Jul
 2020 13:07:15 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 30 Jul 2020 13:07:15 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 162F42A3;
 Thu, 30 Jul 2020 12:07:15 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: soc-core: Fix regression causing sysfs entries to
 disappear
Date: Thu, 30 Jul 2020 13:07:14 +0100
Message-ID: <20200730120715.637-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=3
 mlxlogscore=999 priorityscore=1501 malwarescore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300090
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
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

The allocation order of things in soc_new_pcm_runtime was changed to
move the device_register before the allocation of the rtd structure.
This was to allow the rtd allocation to be managed by devm. However
currently the sysfs entries are added by device_register and their
visibility depends on variables within the rtd structure, this causes
the pmdown_time and dapm_widgets sysfs entries to be missing for all
rtds.

Correct this issue by manually calling device_add_groups after the
appropriate information is available.

Fixes: d918a37610b1 ("ASoC: soc-core: tidyup soc_new_pcm_runtime() alloc order")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index defd96b14c287..df4c7116f308c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -446,7 +446,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 
 	dev->parent	= card->dev;
 	dev->release	= soc_release_rtd_dev;
-	dev->groups	= soc_dev_attr_groups;
 
 	dev_set_name(dev, "%s", dai_link->name);
 
@@ -503,6 +502,10 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	/* see for_each_card_rtds */
 	list_add_tail(&rtd->list, &card->rtd_list);
 
+	ret = device_add_groups(dev, soc_dev_attr_groups);
+	if (ret < 0)
+		goto free_rtd;
+
 	return rtd;
 
 free_rtd:
-- 
2.11.0

