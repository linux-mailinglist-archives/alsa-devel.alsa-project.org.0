Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E12F86E3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 21:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739751830;
	Fri, 15 Jan 2021 21:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739751830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610743403;
	bh=AxE51BkiMkLTzvK1/J1z0q/+yFWuSP58ELukAvJl/+Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D0mJS1+nA5iooIuAR2RuWXD0ZsU5v1q57KI0gPsv+aY6Tv9lEeiAo1SJ+mMlGaBwu
	 SkRYxC4xpWyRVwqrmLcVQe/PCSZykUCKwbhivQXS0l+mWAIPcX76A0I/H/WP2CytFu
	 VNfJuGAsZTf2bROtfuQsT0MAkk6oJvIF66SCpubc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF668F80254;
	Fri, 15 Jan 2021 21:41:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F49F801ED; Fri, 15 Jan 2021 21:41:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A36CF80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 21:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A36CF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g/KeM1Kj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FKbMJd018307; Fri, 15 Jan 2021 14:41:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=BXMbSTYs/6mWVCG5cVYWFlAcuvl8gIl+wDHgVpijhGg=;
 b=g/KeM1KjJ+fiTw6VK8RAp9Vf6tn00vXhhrjc9Ademu1DaedX0BLDWIeZNkKL+J9pifba
 TqwCCqAEBOmZCZ56esbD15fyAk9Kg4sKTGdWpec0xL4BNGQgyBynwVsii0SS3hmggSSl
 MsuFGIdJlB2OEPG3qF7meWOir2vwLLAoBO8MO7IGFP1UPXVPOZPk347AthEcTd5yHOPf
 p/9R2+DoISfVMEqEiGJ6ZzN5qMAhiWlOtEIziVadT9T93G1c93dKiC+E5PbrGsvm9mRd
 kTooY/rLCk9OpVMvuX/Ia+NVvuMQnpuJJMdc7lVTVKKVEjIVvW8saF8r6d0Re8XxG+42 3A== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35y9ss05jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Jan 2021 14:41:40 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 15 Jan
 2021 20:11:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 15 Jan 2021 20:11:32 +0000
Received: from james-tower.ad.cirrus.com (unknown [141.131.78.182])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3B21A45;
 Fri, 15 Jan 2021 20:11:26 +0000 (UTC)
From: James Schulman <james.schulman@cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Fix control name parsing for multi-fw
Date: Fri, 15 Jan 2021 14:11:05 -0600
Message-ID: <20210115201105.14075-1-james.schulman@cirrus.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=848 impostorscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150125
Cc: alsa-devel@alsa-project.org, James Schulman <james.schulman@cirrus.com>,
 ckeepax@opensource.cirrus.com, david.rhodes@cirrus.com
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

When switching between firmware types, the wrong control
can be selected when requesting control in kernel API.
Use the currently selected DSP firwmare type to select
the proper mixer control.

Signed-off-by: James Schulman <james.schulman@cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 1fc7bc1970ea..262c2db4f81c 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2033,11 +2033,14 @@ static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
 					     unsigned int alg)
 {
 	struct wm_coeff_ctl *pos, *rslt = NULL;
+	const char *fw_txt = wm_adsp_fw_text[dsp->fw];
 
 	list_for_each_entry(pos, &dsp->ctl_list, list) {
 		if (!pos->subname)
 			continue;
 		if (strncmp(pos->subname, name, pos->subname_len) == 0 &&
+		    strncmp(pos->fw_name, fw_txt,
+			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0 &&
 				pos->alg_region.alg == alg &&
 				pos->alg_region.type == type) {
 			rslt = pos;
-- 
2.17.1

