Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B22782D3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 10:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D86B51837;
	Fri, 25 Sep 2020 10:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D86B51837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601023019;
	bh=TYaWEUuXgf8SrFir2JFSOxoxU7ix8kQv7VvBHRxTODE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sROtz/HjLWYUCS7x6hPhpA0vZtv3VDOVN1mRPjYOhB+vcPYWPHJfieZgIOhVVdcKg
	 NwAJ8mv0gsQolEUjdFSJrMgRWAF+QRAAYemtPd/a2JclPPDDBp0u53+v+2yypeUgey
	 /vNAZKeis3s5o6sOXhCsv7ncqNWGo/QrElCuYpAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B427BF802A2;
	Fri, 25 Sep 2020 10:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B813CF8021C; Fri, 25 Sep 2020 10:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B22F80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 10:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B22F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CT+K70rt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 08P8WBa8026867; Fri, 25 Sep 2020 03:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=J72k7oataLeTskram+R5dvF7s3C8RVc9QykzHum188Y=;
 b=CT+K70rtH2SApqIZGjso530XBdXrhGr+gSTHfpHPth802twSjwG+hFH8NxzL+XjL1RO9
 Uqx+J/+932XBSoJtKsBpwvFjCjrgq++kn25J0VQmTcvSL/I73keCHQhyw8Z77aGqhsAd
 eoyoVnrz03aUoFbw85XwUPFr22zjC1dry8qqT5fttYacb1A0T0XKmK7mSzYZbhFiRhaF
 qRLrNiZxNLe/5r2nlfoBoLB7mX4GD/x5NKQSFibTMV3rp3NyhCA5+puQ2E2q++LdQmHU
 YC022DjVZuxP7yiB4v7AbGOJrSQmFMnoxCCBOZsVlf53b+XY7XHqXhoQIsYM/egwJYOw KA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 33nfd283rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 25 Sep 2020 03:34:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 25 Sep
 2020 09:34:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 25 Sep 2020 09:34:16 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.158])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D308145;
 Fri, 25 Sep 2020 08:34:15 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [RFC PATCH 2/2] ASoC: cs47l35: Fix EPOUT->HPOUT1 Mono Mux routing
Date: Fri, 25 Sep 2020 09:34:10 +0100
Message-ID: <20200925083410.3987-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925083410.3987-1-rf@opensource.cirrus.com>
References: <20200925083410.3987-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=1
 mlxlogscore=904 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250058
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
 sound/soc/codecs/cs47l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 7f5dd01f40c9..e967609da8a3 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1305,6 +1305,7 @@ static const struct snd_soc_dapm_route cs47l35_dapm_routes[] = {
 	{ "SPKOUTP", NULL, "OUT4L" },
 
 	{ "OUT1R", NULL, "HPOUT1 Mono Mux" },
+	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
 
 	{ "HPOUTL", "HPOUT", "HPOUT1 Demux" },
 	{ "HPOUTR", "HPOUT", "HPOUT1 Demux" },
@@ -1550,7 +1551,6 @@ static irqreturn_t cs47l35_adsp2_irq(int irq, void *data)
 
 static const struct snd_soc_dapm_route cs47l35_mono_routes[] = {
 	{ "HPOUT1 Mono Mux", "HPOUT", "OUT1L" },
-	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
 };
 
 static int cs47l35_component_probe(struct snd_soc_component *component)
-- 
2.20.1

