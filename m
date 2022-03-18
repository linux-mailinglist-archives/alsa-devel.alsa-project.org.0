Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B554DDF16
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 17:32:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FA681750;
	Fri, 18 Mar 2022 17:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FA681750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647621158;
	bh=5+b6hHXimiC/x1ws7F1xkSrdL/K7Lyu9bPjtoM8/DEo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WeVkMyWDMf/jtV9voT/qO3Ef8YqMKSZrVow+J5bj+e0MtG4xVOfViwL4ckkJH3yhZ
	 F9OQ29TnSS7CN2ybapQE2UcDow54Xns1j2+xsPD2zjfw5F/l9Lam02J/wqPaZiDILc
	 A2Z8B9/4hTjsg1QSJSKqlYCz9Y5VrO9joTPwGj+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B4EF80527;
	Fri, 18 Mar 2022 17:30:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D61AAF8051E; Fri, 18 Mar 2022 17:30:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF35F80271
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 17:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF35F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="U5HqeiPX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22I7cSw1022149;
 Fri, 18 Mar 2022 11:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4tc4ncIANn0s6SD489iah443tBWGZROgIIkzG9Cdyrw=;
 b=U5HqeiPXiw9YftLaOP0XUUlTtsIVeCxqnsN2ACwSbItAwBA760un4JoAQbSgMwy7zthy
 ie6hwMGLzzkMS/Q4G2cdMnMOpFDVnI/J0T2QYwPAE5FMEkZ3rcGTRGk8sQ3GKtII5HwB
 m4Hk5GNRJH6cD1W3PP2NfRGzbfh3KQifO8ro6Pyz2BJmTJ6UZLtbSaVMFhfJbSY4kZmI
 ydBu0ft21tp49kxYc0q1zuhz2OGw38yKi//v2tnSdCOc11+zYtbfs56vo74KSgHhUW5C
 H1/OKAIA1yGwvXu7WMYvHUvg4wy9/quZyEQ2KXn226e3Vpx9mcyp93c7I1iLUq+yhGx3 VA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3et642efpx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 11:29:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 16:29:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 16:29:44 +0000
Received: from debianA11184.ad.cirrus.com (debianA11184.ad.cirrus.com
 [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5483DB16;
 Fri, 18 Mar 2022 16:29:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH 1/5] ASoC: soc.h: Add SOC_SINGLE_S_TLV() macro
Date: Fri, 18 Mar 2022 16:29:39 +0000
Message-ID: <20220318162943.1578102-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220318162943.1578102-1-rf@opensource.cirrus.com>
References: <20220318162943.1578102-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: esRbDl9EM1KkxmG1I-SXkSOw3ElnV3WL
X-Proofpoint-ORIG-GUID: esRbDl9EM1KkxmG1I-SXkSOw3ElnV3WL
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

Add a convenience macro for defining a single (mono) TLV control
with a signed value. This can already be done by using
SOC_DOUBLE_R_S_TLV() with the same address for left and right
registers, but a dedicated macro is more readable.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7a1650b303f1..e063b1ea9634 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -176,6 +176,8 @@
 	.get = snd_soc_get_volsw, .put = snd_soc_put_volsw, \
 	.private_value = SOC_DOUBLE_R_S_VALUE(reg_left, reg_right, xshift, \
 					    xmin, xmax, xsign_bit, xinvert) }
+#define SOC_SINGLE_S_TLV(xname, xreg, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array) \
+	SOC_DOUBLE_R_S_TLV(xname, xreg, xreg, xshift, xmin, xmax, xsign_bit, xinvert, tlv_array)
 #define SOC_SINGLE_S8_TLV(xname, xreg, xmin, xmax, tlv_array) \
 {	.iface  = SNDRV_CTL_ELEM_IFACE_MIXER, .name = (xname), \
 	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
-- 
2.30.2

