Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C1B533DA7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 15:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 533C316BD;
	Wed, 25 May 2022 15:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 533C316BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653484793;
	bh=uUePv91SGBoIY6PbN5B4ccVxrsUIAKkEylYxrUNGLEU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ew4sK9XbKPhA3211RNrLI+xIyOo7pC78b9VajuYJrUn2I3mW9ZZYYrySfhonFEHjH
	 h4y86GyUAkxnjaLtDc8hNGPlz58/6UQmuZFdKKmQ/n8lSGP1iacvRd503Y9/HVdeUY
	 vxdv6hycbqq23aWqnLNA1VzQrtgzJI7tl07+AkAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19777F80169;
	Wed, 25 May 2022 15:17:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BEFCF80536; Wed, 25 May 2022 15:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03586F801EC
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 15:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03586F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZertTB1l"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PBxMvb005635;
 Wed, 25 May 2022 08:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=J0fR9KNlFufNc0MdSXybhI4lFVPpHlH9P+kE1CluQgE=;
 b=ZertTB1lJ1Tkn3b7rDKVsZH1nQ51SPMOzFc/u8kqPDRtbsU52Y8Nza29N8arOX6zp2Mc
 ompu5q+ovPeeDQJYlTN47v1Wahu7mWW0NNHymlaz1RK2IIH5fkOc1cIH/KTYmlJjjh55
 hHa4xOaTtW6igQdorYeYGQQa3uNZ3pDx4uq293LiKsoBt78a+F0biQ6yPrppe81kkZ+P
 sQEcH9NWoAhnW8J983J6zedDz0ltXluh+6mJRoKAn+rAx7/KoQB4mOp8JtXrWYsOJq2e
 Tz3YEuPSDfuN3C1XK28Z9ZJLLiytzNTga6dU/8o6I72Nq+s2kaswIdEpHcJxlEsCcEtO LQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g93u4gx4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 08:16:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 14:16:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 25 May 2022 14:16:40 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.233])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2A8B5468;
 Wed, 25 May 2022 13:16:40 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v4 02/17] ALSA: hda: hda_cs_dsp_ctl: Add apis to write the
 controls directly
Date: Wed, 25 May 2022 14:16:23 +0100
Message-ID: <20220525131638.5512-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: r0-ty98q_QKxfTnhHLoiMuyOT_uSqERn
X-Proofpoint-GUID: r0-ty98q_QKxfTnhHLoiMuyOT_uSqERn
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

Changes since v2:
 - No change

 sound/pci/hda/hda_cs_dsp_ctl.c | 52 ++++++++++++++++++++++++++++++++++
 sound/pci/hda/hda_cs_dsp_ctl.h |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 46df48ff2ae1..3b837d000a00 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -237,6 +237,58 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
 
+int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
+			 unsigned int alg, void *buf, size_t len)
+{
+	struct cs_dsp_coeff_ctl *cs_ctl;
+	struct hda_cs_dsp_coeff_ctl *ctl;
+	struct snd_kcontrol *kctl;
+	int ret;
+
+	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
+	if (!cs_ctl)
+		return -EINVAL;
+
+	ctl = cs_ctl->priv;
+
+	if (len > cs_ctl->len)
+		return -EINVAL;
+
+	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
+	if (ret)
+		return ret;
+
+	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
+		return 0;
+
+	list_for_each_entry(kctl, &ctl->card->controls, list)
+		if (!strncmp(kctl->id.name, ctl->name, sizeof(kctl->id.name))) {
+			snd_ctl_notify(ctl->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+			return 0;
+		}
+
+	dev_warn(dsp->dev, "Cannot find Control for %s\n", name);
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
+	if (len > cs_ctl->len)
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
index 3c90312b45d6..65b9c5c68957 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.h
+++ b/sound/pci/hda/hda_cs_dsp_ctl.h
@@ -30,5 +30,9 @@ struct hda_cs_dsp_ctl_info {
 int hda_cs_dsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl, struct hda_cs_dsp_ctl_info *info);
 void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl);
 int hda_cs_dsp_remove_kcontrol(struct snd_card *card, const char *name);
+int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
+			 unsigned int alg, void *buf, size_t len);
+int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
+			unsigned int alg, void *buf, size_t len);
 
 #endif /*__HDA_CS_DSP_CTL_H__*/
-- 
2.34.1

