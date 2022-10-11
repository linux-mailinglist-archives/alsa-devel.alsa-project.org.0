Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7988F5FB4AB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB15D3DF9;
	Tue, 11 Oct 2022 16:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB15D3DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665499062;
	bh=FVb93QN4rM16FjghHboIPLLKwiWI1yLt6oV3chCPYmc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbF8raKqVHfcSx56d9Vc4ybynt+iLeKu8RDpE29ZEmoTuFqsYSGD/2dFVFjhqH5Qc
	 Xlihc5HdzLznd2odWDhDgedc9VILntt35QZ5KQOn8OrlNmeiFBLzBAUt09Zy1u1HNE
	 JEuSMrePjArifAxNc2yT3WTkjsPAo4AU30DxeIL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F5DCF80130;
	Tue, 11 Oct 2022 16:36:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC5BDF80506; Tue, 11 Oct 2022 16:36:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8CDBF80134
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8CDBF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="I/2qiTuo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B6p4J4008726;
 Tue, 11 Oct 2022 09:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LqOkwfdNZ/ZCmx2TzN2y0k5krzzeyl9p5lv9AobOKyY=;
 b=I/2qiTuonlcNPb9Zgd5zl1FtSDGIMm50UjN2+UW/nP/AKdY+0lT542kt4Fkrmgi19QS4
 wI6JFX2UBi+4NVN3ml3+56xjm4b5oA9W5JMhnuydC+XzPDOgGW/b2Se+T6qGhEaDCx27
 AH6nR7ZEw57eogLfuSdpl+fgoM2j+4AtkIQg1/nWI65Yi3tOAJv+kUA4LD/Q+fAOZeEC
 FOpUx+/xAM3yoTjAulHiJwFs0XeH/NOaTHwhBk00BnRrHyL4W14vKGjyzd2D6s5sTCei
 xh/TmTmd141sdFWiSs9S3fiXiPKxeuAq/LlWfmSG6bLY/0r7iyL3F5fEwblIa/AX9amE 7A== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3k35mpuhdu-2
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 08675356B;
 Tue, 11 Oct 2022 14:36:13 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/5] ALSA: hda: hda_cs_dsp_ctl: Minor clean and redundant
 code removal
Date: Tue, 11 Oct 2022 15:35:48 +0100
Message-ID: <20221011143552.621792-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
References: <20221011143552.621792-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eUuFYeNQKWWtPbyJ9e3-7CYlkj2OAGsn
X-Proofpoint-GUID: eUuFYeNQKWWtPbyJ9e3-7CYlkj2OAGsn
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

The cs_dsp core will return an error if passed a NULL cs_dsp struct so
there is no need for the hda_cs_dsp_write|read_ctl functions to manually
check that. The cs_dsp core will also check the data is within bounds of
the control so the additional bounds check is redundant too. Simplify
things a bit by removing said code.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/hda_cs_dsp_ctl.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index 89ee549cb7d50..41d3e8fd289d7 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -199,16 +199,10 @@ EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
 int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 			 unsigned int alg, const void *buf, size_t len)
 {
-	struct cs_dsp_coeff_ctl *cs_ctl;
+	struct cs_dsp_coeff_ctl *cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
 	struct hda_cs_dsp_coeff_ctl *ctl;
 	int ret;
 
-	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
-	if (!cs_ctl)
-		return -EINVAL;
-
-	ctl = cs_ctl->priv;
-
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
 	if (ret)
 		return ret;
@@ -216,6 +210,8 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
 		return 0;
 
+	ctl = cs_ctl->priv;
+
 	snd_ctl_notify(ctl->card, SNDRV_CTL_EVENT_MASK_VALUE, &ctl->kctl->id);
 
 	return 0;
@@ -225,13 +221,8 @@ EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, SND_HDA_CS_DSP_CONTROLS);
 int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 			unsigned int alg, void *buf, size_t len)
 {
-	struct cs_dsp_coeff_ctl *cs_ctl;
-
-	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
-	if (!cs_ctl)
-		return -EINVAL;
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
 
-	return cs_dsp_coeff_read_ctrl(cs_ctl, 0, buf, len);
 }
 EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, SND_HDA_CS_DSP_CONTROLS);
 
-- 
2.34.1

