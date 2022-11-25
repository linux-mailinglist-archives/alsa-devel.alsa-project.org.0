Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58936638E38
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:25:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D4B175C;
	Fri, 25 Nov 2022 17:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7D4B175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669393505;
	bh=XUfP3i5zZOPBlSdBYcxCJnf4K9znvQVeisyuaTP46LU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kpabbigjef3kV/39Cd1jlGT5y7QyxPXSfCxCP2z0ShS+O4gyNSWVQ9cVi/bFSSg50
	 g4A3VScMFnVzjbT69qmUowHoDPj7psb+TADBUst7fL3i9jjXrVc04DjqGdiRTXsJDc
	 AN7I9y1h5Y6Yxf+0P38WZ9JRFQADlm/ND9WjsxVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA312F80542;
	Fri, 25 Nov 2022 17:23:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FC43F80536; Fri, 25 Nov 2022 17:23:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34C96F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C96F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DiB+1EYN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APAeIaK029176; Fri, 25 Nov 2022 10:23:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=FTPAQaBI84T5fGmRvnjMMF29Uzq7na6tQmz0qrjkYdA=;
 b=DiB+1EYNnI89/NvVE4PdeuLN8EKbFEXcMMUfArTX+KzykwclaJ098DPMx2pcSdo7O6/h
 a9JYMlXVMJfSFO8Otz9Xl6Dlg9bVZQOafhdDqSv3SNPfavAffJDEaUcJvPVZBG00JF6M
 5c1KSoFQ65zYKwfG6hut0RYBg/1gs2oGYIUoCbk8BEanpj0/HMY7WVjjLU9gEqCv1nwD
 8G1LgKRFCQvzfwsXTVRDE4S/EAU94rJPaDuxVpMjZHq6IjFC3sqmuXwlxnTQzg3jsJLS
 mnOGvbmuyACN2+n+c+hdnp2LycyhjFP/GiNQLg116ZeMkzzpA3u1Dh/8lBLZ35MKAZe6 dw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet7g82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 10:23:50 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 10:23:48 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 25 Nov 2022 10:23:48 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4BF72BA;
 Fri, 25 Nov 2022 16:23:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: ops: Correct bounds check for second channel on SX
 controls
Date: Fri, 25 Nov 2022 16:23:47 +0000
Message-ID: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0OTHcAHjBB1bjxQ63tY1aa2bFHf3daZh
X-Proofpoint-GUID: 0OTHcAHjBB1bjxQ63tY1aa2bFHf3daZh
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com,
 james.schulman@cirrus.com
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

Currently the check against the max value for the control is being
applied after the value has had the minimum applied and been masked. But
the max value simply indicates the number of volume levels on an SX
control, and as such should just be applied on the raw value.

Fixes: e9b397afabb8 ("ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-ops.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1970bda074d8a..55b009d3c6815 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -464,16 +464,15 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
-		unsigned int val2;
-
-		val_mask = mask << rshift;
-		val2 = (ucontrol->value.integer.value[1] + min) & mask;
+		unsigned int val2 = ucontrol->value.integer.value[1];
 
 		if (mc->platform_max && val2 > mc->platform_max)
 			return -EINVAL;
 		if (val2 > max)
 			return -EINVAL;
 
+		val_mask = mask << rshift;
+		val2 = (val2 + min) & mask;
 		val2 = val2 << rshift;
 
 		err = snd_soc_component_update_bits(component, reg2, val_mask,
-- 
2.30.2

