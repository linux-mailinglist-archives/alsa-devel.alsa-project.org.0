Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E455261B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 22:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DCF2806;
	Mon, 20 Jun 2022 22:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DCF2806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655758586;
	bh=FPCMSzy07NfG0YbKAIWIgTCxrrBNiGRc1Xk/aU7nWP4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dba8GAkOVn1gDBWz6d4H8nW/mDH6Nnst/IiAahl7s0/jIiUeEIEnDcFuGagZpggZh
	 25BVWwED1ADrzEUIb5Tr2MydzEArpf+ObUOULSsYDL2MD4Dcw3L3/6ap2ghhhYzTLQ
	 fd7TQZxljUNj68zcMy/hOW29hayaG9Z6GDw0K8oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E373FF80552;
	Mon, 20 Jun 2022 22:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4286F80548; Mon, 20 Jun 2022 22:54:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68C94F80536
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C94F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Myt9h/PX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KIfiVe023078;
 Mon, 20 Jun 2022 15:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VPZBc7LLWtqDFYox3jSoNijfQwcloC5vLsIWyXQT3Aw=;
 b=Myt9h/PXziRTTi3dxQXZQUrRdcv+DXqlQ/lDywugKHkSO6vVBI72gyM0FbT3TzhJc8kJ
 l9APA5KI3TJWJ5w+4mdf4Ih7W2+O9DQ/bWOIEcY3DcEz02CW9x8PJloNnieGvsWNa1pc
 EjUxE0PxBp2+N33wXXisC5Gt9OCdQbcmzUmTEKGftR44Li16xqjNz1Tc84YiF9o6oLvj
 esQAQ1EUsQanXftQoYZigbSw4vmkZbycI2VnRETNzi1g9BK8BQLtshbntM1G4fTORDXv
 hu102YRgnJ6LsRsJep7L6AUnBbgJWxRrN7HRAggAmEB+ze4TKoHhDi/Ife1jPaEkMPpm Fw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gsb4p2p54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 20 Jun 2022 15:54:45 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 20 Jun
 2022 21:54:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 20 Jun 2022 21:54:43 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.175])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1D2F1468;
 Mon, 20 Jun 2022 20:54:39 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v5 02/14] ALSA: hda: hda_cs_dsp_ctl: Add apis to write the
 controls directly
Date: Mon, 20 Jun 2022 21:54:20 +0100
Message-ID: <20220620205432.3809-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620205432.3809-1-vitalyr@opensource.cirrus.com>
References: <20220620205432.3809-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qDaRRzrNyvq0b0DoSIkDVSVOPwPmQ6Ry
X-Proofpoint-ORIG-GUID: qDaRRzrNyvq0b0DoSIkDVSVOPwPmQ6Ry
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

DSP controls are exposed as ALSA controls, however,
some of these controls are required to be accessed by
the driver. Add apis which allow read/write of these
controls. The write api will also notify the ALSA control
on value change.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 39 ++++++++++++++++++++++++++++++++++
 sound/pci/hda/hda_cs_dsp_ctl.h |  4 ++++
 2 files changed, 43 insertions(+)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index e61df1ce10df..c8c508e1f8aa 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -202,6 +202,45 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
 
+int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
+			 unsigned int alg, const void *buf, size_t len)
+{
+	struct cs_dsp_coeff_ctl *cs_ctl;
+	struct hda_cs_dsp_coeff_ctl *ctl;
+	int ret;
+
+	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
+	if (!cs_ctl)
+		return -EINVAL;
+
+	ctl = cs_ctl->priv;
+
+	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
+	if (ret)
+		return ret;
+
+	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
+		return 0;
+
+	snd_ctl_notify(ctl->card, SNDRV_CTL_EVENT_MASK_VALUE, &ctl->kctl->id);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, SND_HDA_CS_DSP_CONTROLS);
+
+int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
+			unsigned int alg, void *buf, size_t len)
+{
+	struct cs_dsp_coeff_ctl *cs_ctl;
+
+	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
+	if (!cs_ctl)
+		return -EINVAL;
+
+	return cs_dsp_coeff_read_ctrl(cs_ctl, 0, buf, len);
+}
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, SND_HDA_CS_DSP_CONTROLS);
+
 MODULE_DESCRIPTION("CS_DSP ALSA Control HDA Library");
 MODULE_AUTHOR("Stefan Binding, <sbinding@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/hda_cs_dsp_ctl.h b/sound/pci/hda/hda_cs_dsp_ctl.h
index 1c6d0fc9a2cc..c65bfd6878fd 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.h
+++ b/sound/pci/hda/hda_cs_dsp_ctl.h
@@ -29,5 +29,9 @@ struct hda_cs_dsp_ctl_info {
 
 int hda_cs_dsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl, struct hda_cs_dsp_ctl_info *info);
 void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl);
+int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
+			 unsigned int alg, const void *buf, size_t len);
+int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
+			unsigned int alg, void *buf, size_t len);
 
 #endif /*__HDA_CS_DSP_CTL_H__*/
-- 
2.34.1

