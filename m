Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 050BF552F9B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 12:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974F220B0;
	Tue, 21 Jun 2022 12:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974F220B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655806947;
	bh=nI535fs2CA7z203uPHDTWLYdYgeAoMxb4fo4Nv4vfXI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azlJv3WsOjgcyTQrJhGG9+0ce6RTQwUt8Bcy7HVRjtJMGwntyMg6kYKACYMut/HIp
	 /n8JMLyGXvbtNOVgKZqGSeSoU3Fod5DVbldn6rdOyXoEidQltZBVOmR98Yusk+rSps
	 Q8K5S+P2koQd9mTaeRXGZHo39kBXOt8NgEqnpcJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52DD1F80104;
	Tue, 21 Jun 2022 12:20:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BF5BF80256; Tue, 21 Jun 2022 12:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB299F80152
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 12:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB299F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lYL4jHyy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L7wQ94011194;
 Tue, 21 Jun 2022 05:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=V8BsBPLcWqkZbi4o13owpXVyxD3Le6lVb4WyABIu+K0=;
 b=lYL4jHyyasDxuSDllGvsUPULf8L2aYvQl16sTr2dhp9s6JHuYWBrhP3Na+3EzQi399Pr
 EADiAb1wwCIelMkM+Bcj/ZdtLdZ8MAi6CSna1WkzeNWwhfLhnX1+POTERcTr5qIcki0G
 aCLMcCNNhyxdOCdzzZ0qNXNSEgScjmPzOJ28AseLbdUTzO1/NOA7uc7+BVSXrTBm/9oT
 jrsIB7qe+0A05OdQh4pPR36ACmC/eI50b5I0DNUMUuImGNl3GPStSZuP/bu5vSxaD1ON
 koGVUR5F5Lx4oNCZT3y9RMX1pzYLXZyA7DzQNLlqmPniT7Ukd7uaXnT9U4BBsSx2l66W Vg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41bcxp-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jun 2022 05:20:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 21 Jun
 2022 11:20:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 21 Jun 2022 11:20:42 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C35D11D4;
 Tue, 21 Jun 2022 10:20:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: core: Add new SOC_DOUBLE_SX_TLV macro
Date: Tue, 21 Jun 2022 11:20:41 +0100
Message-ID: <20220621102041.1713504-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
References: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: n4YPNgZV-FIDC4NVgaabiWhq3SJmMRbO
X-Proofpoint-ORIG-GUID: n4YPNgZV-FIDC4NVgaabiWhq3SJmMRbO
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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
index 8909cc7d311ef..76ee3c2b8b56c 100644
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

