Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE34851D6
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:32:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4292617D9;
	Wed,  5 Jan 2022 12:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4292617D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382373;
	bh=sjjoPk0E6U4lQamnPVYRl8j+EauO9N//3k3aruaKd3A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sk8I4KtRbHPA9ixkAo3PwoCGWyN1R56V6gwTFzBjlToCrrZlBZ0LP+3rmVqErjWxm
	 aI35DPPu/Pp0YhVk8i57ea1N/bUVjhgEafLiOAfu0T4f98LPoZ0/r3cUA2gQgPvz8j
	 rmfOviS/6+V0pv4iLnO8zS4vxum0RVBv3MZB4tts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F4C8F80516;
	Wed,  5 Jan 2022 12:30:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9850EF80515; Wed,  5 Jan 2022 12:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DDFF801D8
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DDFF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AfubpR0l"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2058aLPB003317;
 Wed, 5 Jan 2022 05:30:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=nbeQz7+kax8KGxsoU57iC5EuFa9Z9sreof0EFQJ+Y9E=;
 b=AfubpR0lsqt+zfuMzrtw13WLjNyE1IGkTTlM5ENxouZus22u08E5FooF+uzXvpjlUl14
 kqx3GxGeDcGw+5K9kYUAOdp6T7SzFsMPRkk3YQzRyjl7SA1Wz2kWF/0optSpfTNzVS11
 2NYYroPJb8aNRsZcfRdJ45iSPeTVF/X+Dvhdfy7dhA/ivc2UkecdVaWtJfL7Ro+7h1NS
 qE9fnrLgoNCnjeuCKMXKorrPZbsw8oKnq3z77tWOvlK6kzoSnp+6Vf5mxo9j5DH1YeVB
 KoJs9leoPaw/6K0GDhwAlrVbX0f6HmHITKWFty2dWlYVYkZ2TNzijKjg+yPwTbw/QbK9 eA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dd7y3g4bt-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:27 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 27865475;
 Wed,  5 Jan 2022 11:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 5/8] firmware: cs_dsp: Clear core reset for cache
Date: Wed, 5 Jan 2022 11:30:23 +0000
Message-ID: <20220105113026.18955-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: oBnkIOmoVSAYs2QdORJ70z2vfGDa6-YU
X-Proofpoint-ORIG-GUID: oBnkIOmoVSAYs2QdORJ70z2vfGDa6-YU
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

If the Halo registers are kept in the register cache the
HALO_CORE_RESET bit will be retained as 1 after reset is triggered in
cs_dsp_halo_start_core. This will cause subsequent writes to reset
the core which is not desired. Apart from this bit the rest of the
register bits are cacheable, so for safety sake clear the bit to
ensure the cache is consistent.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 5af8171d6cedf..e48108e694f8d 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2744,10 +2744,16 @@ EXPORT_SYMBOL_GPL(cs_dsp_stop);
 
 static int cs_dsp_halo_start_core(struct cs_dsp *dsp)
 {
-	return regmap_update_bits(dsp->regmap,
-				  dsp->base + HALO_CCM_CORE_CONTROL,
-				  HALO_CORE_RESET | HALO_CORE_EN,
-				  HALO_CORE_RESET | HALO_CORE_EN);
+	int ret;
+
+	ret = regmap_update_bits(dsp->regmap, dsp->base + HALO_CCM_CORE_CONTROL,
+				 HALO_CORE_RESET | HALO_CORE_EN,
+				 HALO_CORE_RESET | HALO_CORE_EN);
+	if (ret)
+		return ret;
+
+	return regmap_update_bits(dsp->regmap, dsp->base + HALO_CCM_CORE_CONTROL,
+				  HALO_CORE_RESET, 0);
 }
 
 static void cs_dsp_halo_stop_core(struct cs_dsp *dsp)
-- 
2.11.0

