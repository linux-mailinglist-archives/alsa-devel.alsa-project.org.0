Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F85FB4AC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:38:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287003636;
	Tue, 11 Oct 2022 16:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287003636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665499083;
	bh=JRRV7WcnfGogimST2X0sUPH/p0+AgA3kBqy0G+xUDJk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peNlRzNJFuP4Rc3xzn9NM7DwJSt3hN5Byi2bR3YrPkChpyTbpVCt0QVp9PjJnxMQS
	 mVkrF6dOCvO7HC3ZnL3QMe2RhehwD3+Xoj76ERZMeOnB7cDsuz9FZXaX+GLFD5x5Rr
	 1S3Nu2PoAdykSJqlNzSd5oWOBChO+FvhchiguC7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C602F8053D;
	Tue, 11 Oct 2022 16:36:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B4BAF80506; Tue, 11 Oct 2022 16:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CCE3F801D5
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCE3F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Cv1AnO2K"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B6p4J5008726;
 Tue, 11 Oct 2022 09:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=XpD3vjfMDf0YYXuf5IWPT96/3bj0Ps8yH0imFYBmlWc=;
 b=Cv1AnO2KDbj2/HcvmY1bR44JcZx5Ul8VCGlRMY5dvGRzJYFuTlpGeDX+uq1UpfgLYGvy
 qX+btcQuJpCjZDXH+WFgeo45+1RU+2zGtkNieY8zeIFbVXxcx/8+626zwhxM7vufPDUh
 EPNY+ef7mdek7KxfjD36EF5vfG1Pg5NTZfbnv7OSw8W6kMUCSBN1PVhBChluNFRd+5vj
 SnzX3H4UwNnk12tUfwlti0DfxGEqmBFGf7BPVrT5PWOx4mgYNrxhrjU/bcuK1H5w68M2
 li0q/OEEVZSOwaVqHofOb20DblcaEEFvwvb2AbHb/skO7rn2UCZj3opGaEoww9TG77WQ 1A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3k35mpuhdu-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 09:36:15 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 11 Oct
 2022 09:36:13 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 11 Oct 2022 09:36:13 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 29943468;
 Tue, 11 Oct 2022 14:36:13 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 2/5] ALSA: hda: hda_cs_dsp_ctl: Ensure pwr_lock is held
 before reading/writing controls
Date: Tue, 11 Oct 2022 15:35:49 +0100
Message-ID: <20221011143552.621792-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
References: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Pnf8HhuwWKo8p8iBPdEC3daPdezRieyk
X-Proofpoint-GUID: Pnf8HhuwWKo8p8iBPdEC3daPdezRieyk
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

These apis require the pwr_lock to be held.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 41d3e8fd289d7..75fb691858172 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -199,11 +199,14 @@ EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
 int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 			 unsigned int alg, const void *buf, size_t len)
 {
-	struct cs_dsp_coeff_ctl *cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
+	struct cs_dsp_coeff_ctl *cs_ctl;
 	struct hda_cs_dsp_coeff_ctl *ctl;
 	int ret;
 
+	mutex_lock(&dsp->pwr_lock);
+	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
+	mutex_unlock(&dsp->pwr_lock);
 	if (ret)
 		return ret;
 
@@ -221,7 +224,13 @@ EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, SND_HDA_CS_DSP_CONTROLS);
 int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 			unsigned int alg, void *buf, size_t len)
 {
-	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
+	int ret;
+
+	mutex_lock(&dsp->pwr_lock);
+	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
+	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
 
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, SND_HDA_CS_DSP_CONTROLS);
-- 
2.34.1

