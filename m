Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D429638DB6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 16:50:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A7D174A;
	Fri, 25 Nov 2022 16:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A7D174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669391410;
	bh=XSHz6VR717egXDK5UvEyRnfZr/xU2xm8kEcDWoVLpbY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qWCUYP4Qs5cKLduIelk/k8pL4yHqNUCkUOhtbSFMpt9btJBZbTDxtMST1C9cLZJKy
	 zI8zjkUf12ltk5ie2Iu6bt8sB0XOmFZSaHWvKzKDFRYNetvTIDguguzHpfjYlGQpOE
	 aV40HouS3rLv5Rq/CbqVQ437BayVkDDMoWyPgmTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 183A6F80542;
	Fri, 25 Nov 2022 16:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C15B0F8047C; Fri, 25 Nov 2022 16:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87177F80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 16:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87177F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Q9q9CyUG"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AP8g16o009072; Fri, 25 Nov 2022 09:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zf6y8h8ZDqaMeXUKH5IWTKTnF1vtMDxWcziGIWTL3Yg=;
 b=Q9q9CyUGW/YoJxHI2gF2K01cvlN+Y/3DjiezflKBmqwlrwg/mXAV3xG1Nv+A8nGYpDTT
 g/ifX1NXcXlvpElkuriSUL7gkdEIwCppCmNITJScjvBOzps1WfZX16mm4bCU8d0grSmg
 cXYRyKEyAhnQ/QxDUslQZNK2CL1Xk8Po0iKBI0cUX2qI2QTILXfPUbUQrP44hWwoU/OA
 fhMj7l5S7iOQgONmjhVgY4vslr8xm6BzaKmEjo7vqFYGK6C6PwEoPDHzkEIWXPhEu74R
 uR0Dtwfgsl97gwt3LHsmVnMc/hVIOel8ACK9B89FtRaaqcxcbVUTrHs9TAIbi+/mzsP7 uw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet7f2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 09:48:39 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 09:48:37 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Fri, 25 Nov 2022 09:48:37 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B8109B10;
 Fri, 25 Nov 2022 15:48:37 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: ops: Fix bounds check for _sx controls
Date: Fri, 25 Nov 2022 15:48:36 +0000
Message-ID: <20221125154837.1270501-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125154837.1270501-1-ckeepax@opensource.cirrus.com>
References: <20221125154837.1270501-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BWQLL--qx7DDKPymZSKwuQ83k7uR-9ig
X-Proofpoint-GUID: BWQLL--qx7DDKPymZSKwuQ83k7uR-9ig
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 guille.rodriguez@gmail.com, lgirdwood@gmail.com
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

From: Mark Brown <broonie@kernel.org>

For _sx controls the semantics of the max field is not the usual one, max
is the number of steps rather than the maximum value. This means that our
check in snd_soc_put_volsw_sx() needs to just check against the maximum
value.

Fixes: 4f1e50d6a9cf ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()")
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index bd88de0563583..47691119306fb 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -452,7 +452,7 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	val = ucontrol->value.integer.value[0];
 	if (mc->platform_max && val > mc->platform_max)
 		return -EINVAL;
-	if (val > max - min)
+	if (val > max)
 		return -EINVAL;
 	val_mask = mask << shift;
 	val = (val + min) & mask;
-- 
2.30.2

