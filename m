Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8844D6667
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 17:34:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60936188F;
	Fri, 11 Mar 2022 17:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60936188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647016461;
	bh=mGP4UgXgI+4YBNBO95m0+T5xSCxpGud1d52Tmto/hfE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DMHdIUVpKTR1jMM230FZChR3lgmZCdjaAbHxpuYw2tZAihUYu0pylM2vBsRLOEIs+
	 Nm6XdosLK3y0gxtY4+eOAjW944W6JC1tsm9KcwwKYI3gftR3LJd2DFioSP2M+Haqqm
	 IB5h0XNtfnjz96xJMsH2LuR/twxpxs+dugrTRuVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6DB9F80238;
	Fri, 11 Mar 2022 17:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D647F801D8; Fri, 11 Mar 2022 17:33:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B1C2F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 17:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B1C2F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aHAIQygG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22BEUKKK002368;
 Fri, 11 Mar 2022 10:33:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=11NQRB95jP9BW2vLPRp75Kp4Z5rtJmYViWGBZWGdHtM=;
 b=aHAIQygGeXfHtJf0Tf/6x75WGElh3Ymc1oszAQjNHdDHEHmUWHZk7dVH2+Tga8jBZLgL
 sCpcx7TPFG7JYqxUyLSDt8oLA8iQQPkJNWm1IUIycloDnmXiSXgexluh6BbBOrJXxS5A
 +7Z73mSm9BP1sb4K2GMAiJ2e2xRXqk+il0+dacY0nMWJvd1HLpx27FL66zIbnODgsSVu
 jkZU8MQZz6XoiE4CvbwW/p4W49imXDtmzHkSd2dxKw75mXycq0AzPjMZ/8/94NVhOZje
 RCdUd1EjeLyo8lyFY+eG5h2JFKq82QKoySIxcuwn43HYlXEDzW7J6twl7sOyMPmY8ROU HQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3em656rrvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 11 Mar 2022 10:33:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Mar
 2022 16:32:58 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 11 Mar 2022 16:32:58 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5B1B42C5;
 Fri, 11 Mar 2022 16:32:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: core: Add new SOC_DOUBLE_SX_TLV macro
Date: Fri, 11 Mar 2022 16:32:58 +0000
Message-ID: <20220311163258.175627-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: OXftemRCB9rV3204gNjDJOTlDOs1hqp8
X-Proofpoint-GUID: OXftemRCB9rV3204gNjDJOTlDOs1hqp8
X-Proofpoint-Spam-Reason: safe
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

Currently macros only exist for SX style (implicit sign bit 2's
compliment) volume controls where the volumes for left and right
are in separate registers. Some future Cirrus devices will have
both volumes in the same register, as such add a new macro to
support this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7a1650b303f14..5e187236c2ad6 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -136,6 +136,18 @@
 	.put = snd_soc_put_volsw, \
 	.private_value = SOC_DOUBLE_VALUE(reg, shift_left, shift_right, \
 					  max, invert, 0) }
+#define SOC_DOUBLE_SX_TLV(xname, xreg, shift_left, shift_right, xmin, xmax, tlv_array) \
+{       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+	SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.tlv.p  = (tlv_array), \
+	.info = snd_soc_info_volsw_sx, \
+	.get = snd_soc_get_volsw_sx, \
+	.put = snd_soc_put_volsw_sx, \
+	.private_value = (unsigned long)&(struct soc_mixer_control) \
+		{.reg = xreg, .rreg = xreg, \
+		.shift = shift_left, .rshift = shift_right, \
+		.max = xmax, .min = xmin} }
 #define SOC_DOUBLE_R_TLV(xname, reg_left, reg_right, xshift, xmax, xinvert, tlv_array) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname),\
 	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
-- 
2.30.2

