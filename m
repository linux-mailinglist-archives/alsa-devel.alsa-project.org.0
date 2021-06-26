Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDF3B4F75
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Jun 2021 18:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBF7168A;
	Sat, 26 Jun 2021 18:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBF7168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624725151;
	bh=v9pcLBuN5lE0fY9/Dc4EqDeuN5Ewy8vO0EB5MtsCKa4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NL7nC8hptA7txn9Ao9V9XBXRArcBvN4NlP9SVuVNQOgK1+h6iod926FkD3saux4Xo
	 S6H9neyk82LLYh01IkAVJXxPdyYCLhb1R3Z2Vzyq9sOS0zuUCUoxT64QgvFrnhlSET
	 75bFXxkqvfNyAKsTeSNU4Ev2Az5deLg53aMOmN74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4CFBF804CC;
	Sat, 26 Jun 2021 18:30:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B42F801F7; Sat, 26 Jun 2021 18:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB007F8025F
 for <alsa-devel@alsa-project.org>; Sat, 26 Jun 2021 18:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB007F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Kx5MjT9m"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15QGNGep010064; Sat, 26 Jun 2021 11:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=yuM+hVCB/36QB3zQvKLKENxYrU+zpZIMKd9JOzjEZ5Q=;
 b=Kx5MjT9mBE2cQFSutE2GGtdVaTL8eJvMQ6wSzq8oHViO4M0gdwLxv0/d/nLO/bClclUn
 1e0lc20Lr0ZDwRtz/78O2pjBGP5oaJIDgM52k7qxKbQYsFErkhbApG5GvD2oWh0XrnOR
 4bFXcF4sdeRaJ7EeX3EQSzKyTiojdg7/ctKL5UGH4ayWz8DmjS7rpub6rIzyR3jNY+BZ
 gG01duISHVItoUcCf7dvO0jLoR7QAbxDnsf55dxo1Cca/L17GCXrH54vKtc3UtWF0ngx
 tyPXxB4go9sVYeN43zV+vp9KDyjc+pkXBnp4VtmX9rZbtYeVGRh8VUtetCpNPqiMESBQ gg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39e1n30ctj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 26 Jun 2021 11:29:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 26 Jun
 2021 16:59:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 26 Jun 2021 16:59:41 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B263B46A;
 Sat, 26 Jun 2021 15:59:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: wm_adsp: Add CCM_CORE_RESET to Halo start core
Date: Sat, 26 Jun 2021 16:59:40 +0100
Message-ID: <20210626155941.12251-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
References: <20210626155941.12251-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: eRYQK9g28W2y2om1Bl4_kQeSSy8YqrGn
X-Proofpoint-ORIG-GUID: eRYQK9g28W2y2om1Bl4_kQeSSy8YqrGn
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 mlxscore=0 malwarescore=0
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

When starting the Halo core it is advised to also write the core reset
bit, this ensures the part starts up in the appropriate state.  Omitting
this doesn't cause issues on most parts but cs40l25 requires it and
it is advised on all Halo parts.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 59d876d36cfd8..549d98241daec 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -282,6 +282,7 @@
 /*
  * HALO_CCM_CORE_CONTROL
  */
+#define HALO_CORE_RESET                     0x00000200
 #define HALO_CORE_EN                        0x00000001
 
 /*
@@ -3333,7 +3334,8 @@ static int wm_halo_start_core(struct wm_adsp *dsp)
 {
 	return regmap_update_bits(dsp->regmap,
 				  dsp->base + HALO_CCM_CORE_CONTROL,
-				  HALO_CORE_EN, HALO_CORE_EN);
+				  HALO_CORE_RESET | HALO_CORE_EN,
+				  HALO_CORE_RESET | HALO_CORE_EN);
 }
 
 static void wm_halo_stop_core(struct wm_adsp *dsp)
-- 
2.11.0

