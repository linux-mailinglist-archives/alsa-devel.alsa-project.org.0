Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFCD2783D8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 11:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D27D1869;
	Fri, 25 Sep 2020 11:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D27D1869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601025637;
	bh=ZNTvC1xpcvyxdSY5E1/HZB6UX9XeCmkqxWVxtT1YWzE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JeAF+ui95MJYUlVjfEKHbqFISQdVi3G1/2LhA9zRqV4PN2m+YGnCDfYO7AGFGuMWt
	 QTFhrr/yZzX5vGe/ne1HENZlgLtCwFaOMLnaZEBiQ7VMM9Pvx1pZTjoJ+cYSYftuBV
	 tws8AqEQjSB5GFrji7siB4Is30CW8krytC4baefg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BCF0F801EB;
	Fri, 25 Sep 2020 11:18:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61D10F801EB; Fri, 25 Sep 2020 11:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 457A6F800F6
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 11:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457A6F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ICAL8fn0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 08P9GBBe003459; Fri, 25 Sep 2020 04:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=wph01T7UmRsyFJuRCiq74vVYOpu+avjXRH7hJzmc/J4=;
 b=ICAL8fn0AjdGbk+XShwhPQcf6TkLh2oLoqBRS8vy1gPPPkwdCmydrVnoO1oocgpkFb6Y
 OVuuKstsoo0j+JSX2Ff3vmE4xiQUqS5ewspzBXpfic0bgexn/jNlxiwpA+1zACF/xi32
 zghCx/5qY9evourpXsDKmLipamIR0UIkvXkvP+MlbZ64F2TFnMbTiYEfttiEX+YyCvP6
 JoCorMEeTqfUDTKPxbfpFkVzB1cvbANzMDS2MBAZ2yQyP2lVlwB7XaU13XSia4uokoRh
 q13LaAHod+FVlj73kDDPbZdRlBnt6BIMXSyTOAPV0jyknFcynJ5GLKfOyZj5ceXam5Me zA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 33nedn7te4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Sep 2020 04:18:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 25 Sep
 2020 10:18:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 25 Sep 2020 10:18:36 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.158])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AACF345;
 Fri, 25 Sep 2020 09:18:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: cs47l15: Fix EPOUT->HPOUT1 Mono Mux routing
Date: Fri, 25 Sep 2020 10:18:29 +0100
Message-ID: <20200925091830.7675-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=952 suspectscore=1 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009250065
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

EPOUT is always mono so should have a permanent routing through the
HPOUT1 Mono Mux.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs47l15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index a591e7457d11..254f9d96e766 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1089,6 +1089,7 @@ static const struct snd_soc_dapm_route cs47l15_dapm_routes[] = {
 	{ "HPOUT1 Demux", NULL, "OUT1R" },
 
 	{ "OUT1R", NULL, "HPOUT1 Mono Mux" },
+	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
 
 	{ "HPOUTL", "HPOUT", "HPOUT1 Demux" },
 	{ "HPOUTR", "HPOUT", "HPOUT1 Demux" },
@@ -1268,7 +1269,6 @@ static irqreturn_t cs47l15_adsp2_irq(int irq, void *data)
 
 static const struct snd_soc_dapm_route cs47l15_mono_routes[] = {
 	{ "HPOUT1 Mono Mux", "HPOUT", "OUT1L" },
-	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
 };
 
 static int cs47l15_component_probe(struct snd_soc_component *component)
-- 
2.20.1

