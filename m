Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D260D3B4F73
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Jun 2021 18:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE2715E0;
	Sat, 26 Jun 2021 18:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE2715E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624725100;
	bh=MBOGGS8a0aqu/HaweRNF8LHysELV3y53xGZcsCEXem8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvDe4uvcfM9lSn1cD3Sh7PTIdIcIvCmr2Xsta8m/LgicSJSZlTh6V995bkDrbrcIx
	 g1bo7pntzspyXY2uFmjUMdtg4JbOF7eqrAahj6P5ne5nW46ZPxi1bLrhG73XGgD14A
	 CfdcwOT63VUAwK1HJihyvL+8paLxi0zkNC1Udqac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940DFF80268;
	Sat, 26 Jun 2021 18:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19526F800E1; Sat, 26 Jun 2021 18:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF6DF80118
 for <alsa-devel@alsa-project.org>; Sat, 26 Jun 2021 18:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF6DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aQ/0zJAM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15QGNGeq010064; Sat, 26 Jun 2021 11:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=e7DrEIr40zU/mO68nSwoDuZveWMDxwCr/9B98Esucfg=;
 b=aQ/0zJAM1RVx5zuJ7fc1F3DLDkMNMxy8SZFBGWJGk7s9AdtjqMgt+ldpUdwPa9PbCB2G
 6KsJTaR5VirXoe9zMxvisoyl69O/Iy8M22Y0on3ifwFTgnujiHZfai+82Pe538ioTHDM
 Y2x/cHjviqNOOqRou9d0/SQiv7QIeg1lyL4TvK7tYsBQqPUXG7ZDYVKNPgYRm2SqY0BE
 Dg98edpAsX5lIEabCfHnZtOangBfeGlWjLyfBi9BrN7UUKJFox8vr5WKN1wH8NrgcQZL
 Tbaspv4BdvCsG4cBAP4H2iS09kf7sa2LKW9dAwwqE8mPgfsFKqZ9Jsm1Tvu+i1aZg+fk Zg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39e1n30ctj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 26 Jun 2021 11:29:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 26 Jun
 2021 16:59:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 26 Jun 2021 16:59:41 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C0BF146E;
 Sat, 26 Jun 2021 15:59:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: wm_adsp: Remove pointless string comparison
Date: Sat, 26 Jun 2021 16:59:41 +0100
Message-ID: <20210626155941.12251-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
References: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: ELZQuY9SRQf3-5xk8m8DVZmzBVXzYdzU
X-Proofpoint-ORIG-GUID: ELZQuY9SRQf3-5xk8m8DVZmzBVXzYdzU
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 mlxlogscore=869 clxscore=1015 spamscore=0 mlxscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106260114
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

The control fw_name is always directly assigned from the wm_adsp_fw_text
array, so it isn't necessary to compare the actual strings just the
pointer values.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 549d98241daec..b395df1eb72d8 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2030,10 +2030,9 @@ static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
 		if (!pos->subname)
 			continue;
 		if (strncmp(pos->subname, name, pos->subname_len) == 0 &&
-		    strncmp(pos->fw_name, fw_txt,
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0 &&
-				pos->alg_region.alg == alg &&
-				pos->alg_region.type == type) {
+		    pos->fw_name == fw_txt &&
+		    pos->alg_region.alg == alg &&
+		    pos->alg_region.type == type) {
 			rslt = pos;
 			break;
 		}
-- 
2.11.0

