Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3423E7C8B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272061698;
	Tue, 10 Aug 2021 17:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272061698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610032;
	bh=sIRYR5/s6XFnhtqdanlAnhz+IHNejpqoEwf8DfOZXFA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUkEze/Am4RO8jtYDneVb7nVNDgFqsLoB+yl8+BsjqUcxuLmC/g1vf5qxRNkpnsb5
	 ipU8M8DxfhfZcCzw/y9zBxVxP48K8oa/uEydyy9cdkiIQHl8aafOLkKlbCm/fVp57B
	 r8mxFTYmehIdphBvl1aZX2FELQKihk+0IRk8u2XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35472F804B1;
	Tue, 10 Aug 2021 17:38:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EDA9F804ED; Tue, 10 Aug 2021 17:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 958D6F80279
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 958D6F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qS9rMEQM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A75fJP008310; 
 Tue, 10 Aug 2021 10:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=qzvlKgJespRUedNIeq1fve2TKFRXG8vS3eQ0J6/hgy8=;
 b=qS9rMEQMtYl+YdJuja+4kbjkBqOogEnXfZHjvSawOOZ875KvlvsuJDsBu7ImpTM48gEV
 SxVW+qD0J2J4z4nrpN92+NXus/9BK7iT1LoMYCsA+JQvaXdATdXNcqxlJZm+p5gFeLlA
 O5ABnJ84zbgPvcGxwRlOYss2HciIKhIumB48Ypmi4S/Bb9xR6gezPwd+1tbLf615tset
 ikvw+NAp7tEnmAU+DsEHI/X8c8TbfO9VO24wnzi9UkBaFdxwQqMWr/pf14n/3SmdjAOC
 G9WRCzWdKK78/yPze+lc0vPLC9mAz0mPMmyP49HGGVo+SIh+LNGan/hWlRNy5QwxatDs Xw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3abmrkgkf6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:38:05 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 16:38:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 16:38:03 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8E1D546E;
 Tue, 10 Aug 2021 15:38:03 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 04/12] ASoC: cs42l42: Don't reconfigure the PLL while it is
 running
Date: Tue, 10 Aug 2021 16:37:51 +0100
Message-ID: <20210810153759.24333-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810153759.24333-1-rf@opensource.cirrus.com>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mTAyoRH8qLTBDN6MmPAfFNTYDN0T_OFj
X-Proofpoint-ORIG-GUID: mTAyoRH8qLTBDN6MmPAfFNTYDN0T_OFj
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=963 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100099
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

cs42l42_pcm_hw_params() must only configure the PLL if this is the first
stream to become active, otherwise it will be overwriting the registers
while the PLL is running.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 43fc357199f9 ("ASoC: cs42l42: Set clock source for both ways of stream")
---
 sound/soc/codecs/cs42l42.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 5dc3a30272a4..1893d3694570 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -884,7 +884,11 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	return cs42l42_pll_config(component);
+	/* Configure the PLL if this is the first active stream */
+	if (!cs42l42->stream_use)
+		return cs42l42_pll_config(component);
+	else
+		return 0;
 }
 
 static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
-- 
2.11.0

