Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120EF4B1412
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 18:22:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F1F1AB2;
	Thu, 10 Feb 2022 18:21:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F1F1AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644513769;
	bh=UITBnANS4QAxDPCyGeMrlwr/H1mF81TpJ7v/Ppew1wQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=irjGIXBQDYg44aZaU6s6ZucN/YNaBRhxIv4PjpP+l9nkLJJTHb9VZzzke+brp+d9O
	 SiOuzoZ2SYdP6tKvrCBQPx58boped86kyKkArcTvN/ckXRDfsLVcUVVz0digBu58Bt
	 bb/KYF3pq+8EbI+tzJh2FUUiA9mz64Cpzd/gCgNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F60FF80511;
	Thu, 10 Feb 2022 18:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C30AF80508; Thu, 10 Feb 2022 18:21:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 788F4F8028B
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 18:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788F4F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EQlOVO8B"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21AEBvVh026091;
 Thu, 10 Feb 2022 11:20:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=pFbNrBPDkKKayEep6x/nv1MVmuK6rnPq1IzMvsZ90jA=;
 b=EQlOVO8B2O2Gdpi6BSrseYDuMVb95XRru5owoa8dhbcD6qx9Vx0nvFjWsCtfomSaP2Hq
 ZqfPsjayOa3lueHRaKftSB96de9cmdZLWe73auwfC9dGkcLO05ehqgKRB8h7KNcNyR9m
 sARoSgXpsAyet3oUx7NrgcGH3Uyu5qHROyDvBwIlGUxpqg3m5kdU4jISouIsAUZGmYGt
 LKdZA0ywajP5AQB/Q9MSqt7vBuXYCx4cz7CgJslbtJNg1LPRcUaYwb1kk5oODdKpsZaa
 7a7BJgKIBgUugvAQnwUeT6EPHN26NSNjbb8YJrB0rdKeEnVagvBLka/2Z5wI14V6e2Bv kQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e4brb9y38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Feb 2022 11:20:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 17:20:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 10 Feb 2022 17:20:53 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31D732A1;
 Thu, 10 Feb 2022 17:20:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: wm_adsp: Correct control read size when parsing
 compressed buffer
Date: Thu, 10 Feb 2022 17:20:51 +0000
Message-ID: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SkWsBQ2M1z616kscrAW7i2IQCRBY4ZdU
X-Proofpoint-GUID: SkWsBQ2M1z616kscrAW7i2IQCRBY4ZdU
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Vlad.Karpovich@cirrus.com, lgirdwood@gmail.com
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

When parsing the compressed stream the whole buffer descriptor is
now read in a single cs_dsp_coeff_read_ctrl; on older firmwares
this descriptor is just 4 bytes but on more modern firmwares it is
24 bytes. The current code reads the full 24 bytes regardless, this
was working but reading junk for the last 20 bytes. However commit
f444da38ac92 ("firmware: cs_dsp: Add offset to cs_dsp read/write")
added a size check into cs_dsp_coeff_read_ctrl, causing the older
firmwares to now return an error.

Update the code to only read the amount of data appropriate for
the firmware loaded.

Fixes: 04ae08596737 ("ASoC: wm_adsp: Switch to using wm_coeff_read_ctrl for compressed buffers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index f3672e3d1703e..0582585236a28 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1441,7 +1441,8 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 	int ret, i;
 
 	for (i = 0; i < 5; ++i) {
-		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1, sizeof(coeff_v1));
+		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1,
+					     min(cs_ctl->len, sizeof(coeff_v1)));
 		if (ret < 0)
 			return ret;
 
-- 
2.11.0

