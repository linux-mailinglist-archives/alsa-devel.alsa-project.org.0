Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414C213AF6D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 17:31:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F25187D;
	Tue, 14 Jan 2020 17:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F25187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579019486;
	bh=nEm8o6z+L1APKfDOTtJrmob8roB79tkBWvX0jHyHH0I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzU86HatXksUdbXJKOr6Z0LvQ2Ga2MaLNJ/Ls4yERdDy0EuUahJWTdUxviBngudsL
	 Hbgd/QoLRMuDgdtZA/upuHJRdbgwhgVb98XmJpTcsTRZ3AJXvRaaxsDcPPpL2hK08m
	 gZrCYNuPjfO3wOubHHOkduyyNQbU/PNJWSiHE85s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A5AF8027B;
	Tue, 14 Jan 2020 17:19:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 732C2F8026F; Tue, 14 Jan 2020 17:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 192BAF8016F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 17:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192BAF8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="METh4cwV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00EG83Oo018646; Tue, 14 Jan 2020 10:18:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=DQLKQOu4BtXKVvPfzldzgrsq5nrr4jZi1LC3b1CwU/g=;
 b=METh4cwVKcTvV/W2RuxmPwHcfvNqwYWcooDdC3xzZYMnqnodYlb+Yy1lrRYDQE8DgAby
 OK/dihmryhNHNSmGYfG70iHbM4Z3+eZxT91x25okWYwOdfEr6UHjAcfOGkFoFcEMzMTb
 hcveINubNfYNQ2VFT9xdf4z2ra2M2f+sO3S5MDGrjr7FEQESV3kGcruc3PJ9Ue0hwWaJ
 nnXgQMq0u/+/ht8unE5AR73foDmalJ0Go1LFqp1ecee5B7kvpCH6hUN8ZAOHF6nQUoYA
 3Z7dsxdMsbpvqI1766sK648wUCQflwXleCPkL6tr5PDCpPHSrdxIFPxswkNjU3C64Ejs wg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 2xfcn7vrvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Jan 2020 10:18:43 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 14 Jan
 2020 16:18:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 14 Jan 2020 16:18:41 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AEF442B1;
 Tue, 14 Jan 2020 16:18:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Tue, 14 Jan 2020 16:18:40 +0000
Message-ID: <20200114161841.451-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200114161841.451-1-ckeepax@opensource.cirrus.com>
References: <20200114161841.451-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=764 priorityscore=1501 mlxscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001140137
Cc: li.xu@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, david.rhodes@cirrus.com
Subject: [alsa-devel] [PATCH 3/4] ASoC: madera: Correct error path handling
	in madera_out1_demux_put
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Should the write to MADERA_OUTPUT_ENABLES_1 fail and out_clamp[0] not be
set an additional error message will be printed. Clear the ret variable
to avoid this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/madera.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 12dc468ae6bf0..2be64422adf9b 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -575,6 +575,7 @@ int madera_out1_demux_put(struct snd_kcontrol *kcontrol,
 	usleep_range(2000, 3000); /* wait for wseq to complete */
 
 	/* change demux setting */
+	ret = 0;
 	if (madera->out_clamp[0])
 		ret = regmap_update_bits(madera->regmap,
 					 MADERA_OUTPUT_ENABLES_1,
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
