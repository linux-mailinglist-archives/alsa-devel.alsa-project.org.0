Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E47520722
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E458417E6;
	Mon,  9 May 2022 23:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E458417E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652133262;
	bh=p2Y2OuWswwlEAsRMd+LEvzU9ghjEqfHC7XzQd0VPyo4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PfOqII2ODiGxUxbZjMhh4Q+bStvGYS6OpcFWbAwjI/916mWlPFYqw5VXmYva1rFJj
	 QL4XwGtvcRENN8hh7aSswH+HhwYptY+CJoGsQLXB4SuXWxV3gVONLZaW3jLZLpZThq
	 cz1yybrS0XmjZ6T/swfBpAHYvxXo/W1K4MjsjAxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA7BF805D7;
	Mon,  9 May 2022 23:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54510F805B3; Mon,  9 May 2022 23:47:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19C3F80526
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19C3F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HclHPvZ3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BF6xh021606;
 Mon, 9 May 2022 16:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BHvt0GoazKSHegeYyWk5aMj+yVaa8Tq7p3VCq6SFMPM=;
 b=HclHPvZ3H3ozi6LdIvsPvHfqLwFXmaEtF3hkdGRTz0vsG8CffEB30mWoTGBDugiCnx7K
 LxlcE8jH090FE9x8xU2wn1lrwzN0lsQqV8rM5WuiDUuzsBYiEVFBxUTNdGnxGvLv+uyD
 Av4aS9xGwkjcoZdKOWcngAqt4N1vThzmejOH6gdnf4e90Zu+Pd15I6zF4FyoWD0jnZ15
 9LBJDFGpoWSWYA4eVQq2TZB5byZMedOloznRsyCp+XkE76DOjgrcXI7hSeF5zzzDvCl0
 k9wBMa79xjPX1Q1o5+6+oItMllhiUpYFHuCAt9qVrzlJ9JLyCCDPnaaOw0iBzm+N9Ndc gQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jer-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:13 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 381DAB10;
 Mon,  9 May 2022 21:47:13 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 23/26] ALSA: hda: hda_cs_dsp_ctl: Add fw id strings
Date: Mon, 9 May 2022 22:47:00 +0100
Message-ID: <20220509214703.4482-24-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lE73GHNFk5uzm4zr8kYfE3IfTNpsOPPL
X-Proofpoint-ORIG-GUID: lE73GHNFk5uzm4zr8kYfE3IfTNpsOPPL
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

This will be used to define the firmware names.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 8 ++++++++
 sound/pci/hda/hda_cs_dsp_ctl.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 4b4446043356..b1fbccc56efa 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -28,6 +28,14 @@ static const char * const hda_cs_dsp_fw_text[HDA_CS_DSP_NUM_FW] = {
 	[HDA_CS_DSP_FW_MISC] =     "Misc",
 };
 
+const char * const hda_cs_dsp_fw_ids[HDA_CS_DSP_NUM_FW] = {
+	[HDA_CS_DSP_FW_SPK_PROT] = "spk-prot",
+	[HDA_CS_DSP_FW_SPK_CALI] = "spk-cali",
+	[HDA_CS_DSP_FW_SPK_DIAG] = "spk-diag",
+	[HDA_CS_DSP_FW_MISC] =     "misc",
+};
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_fw_ids, SND_HDA_CS_DSP_CONTROLS);
+
 static inline struct hda_cs_dsp_coeff_ctl *bytes_ext_to_ctl(struct soc_bytes_ext *ext)
 {
 	return container_of(ext, struct hda_cs_dsp_coeff_ctl, bytes_ext);
diff --git a/sound/pci/hda/hda_cs_dsp_ctl.h b/sound/pci/hda/hda_cs_dsp_ctl.h
index 65b9c5c68957..265d8024eec9 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.h
+++ b/sound/pci/hda/hda_cs_dsp_ctl.h
@@ -27,6 +27,8 @@ struct hda_cs_dsp_ctl_info {
 	const char *amp_name;
 };
 
+extern const char * const hda_cs_dsp_fw_ids[HDA_CS_DSP_NUM_FW];
+
 int hda_cs_dsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl, struct hda_cs_dsp_ctl_info *info);
 void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl);
 int hda_cs_dsp_remove_kcontrol(struct snd_card *card, const char *name);
-- 
2.34.1

