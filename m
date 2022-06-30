Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A2956176E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 12:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BCA016B2;
	Thu, 30 Jun 2022 12:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BCA016B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656584174;
	bh=exjnFHfvLFV+iw6VzO1u74F/vhbC7MakEJ3C6P8I6VM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKWBOQWSIMlp+4em6rhMuu9q9E0GedW2KQUBiR9Nv6CLyL60JY04JbINQ6lmSHLic
	 Ty2z1ruca22nmugJWWtUqoUGek/z/XjiMP3phdIz/gTZHbykq+wOM5mulj/5Q27dcp
	 rYUUjGwNGCfifWBdNCxApCF4LAsjQeTGLeORCNFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8078FF800F5;
	Thu, 30 Jun 2022 12:15:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC01FF804D8; Thu, 30 Jun 2022 12:15:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7180F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 12:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7180F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TKuCNcQL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U40775015363;
 Thu, 30 Jun 2022 05:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=0mmmeX8EpEPHD8XrcSw4Sp8UGBDafDLcok2SpdJ8el8=;
 b=TKuCNcQLOPT5xP8Or4anqrBJ4TvBnDDVu1A5rfkYgdOqs+3mtWsiaHWkmWkIeDjPgtCI
 jD5Lk3J5d1eDtxXqLnEzNwADohaWABZL4iabKF2eR3LPh6z9Dzh4t1AuuWE1bfnqn+5O
 bSuf8+U7OD6mkUfq8F9/gqh/2vOH64VFHhnyJ8dhAA7pzgtWsVjhiq1upudrBXb47vku
 4NNMQ/Qepn/+FYEz7ZXHEIAqbJrGzvFj0WlgIUcNLVET8N28u4yGtWfgO3NdppApPsUH
 yi4cqIry9ZthrHa3yiPUpad++9e0h2yDQQi5wmCs3eESLjqlGsY8u02zzEMPj6eDQmEO 6A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gwys2pv7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jun 2022 05:15:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 11:14:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 30 Jun 2022 11:14:59 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 24A6C2D4;
 Thu, 30 Jun 2022 10:14:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: wm_adsp: Minor clean and redundant code removal
Date: Thu, 30 Jun 2022 11:14:59 +0100
Message-ID: <20220630101459.3442327-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QVdYrsh-ca0o5avYJJNBQYefF7y699T5
X-Proofpoint-GUID: QVdYrsh-ca0o5avYJJNBQYefF7y699T5
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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
there is no need for the wm_adsp_write|read_ctl functions to manually
check that. The cs_dsp core will also check the data is within bounds of
the control so the additional bounds check is redundant too. Simplify
things a bit by removing said code.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index a7784ac15dde6..cfaa45ede916a 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -675,21 +675,12 @@ static void wm_adsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 		      unsigned int alg, void *buf, size_t len)
 {
-	struct cs_dsp_coeff_ctl *cs_ctl;
+	struct cs_dsp_coeff_ctl *cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	struct wm_coeff_ctl *ctl;
 	struct snd_kcontrol *kcontrol;
 	char ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ret;
 
-	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
-	if (!cs_ctl)
-		return -EINVAL;
-
-	ctl = cs_ctl->priv;
-
-	if (len > cs_ctl->len)
-		return -EINVAL;
-
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
 	if (ret)
 		return ret;
@@ -697,6 +688,8 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
 		return 0;
 
+	ctl = cs_ctl->priv;
+
 	if (dsp->component->name_prefix)
 		snprintf(ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s %s",
 			 dsp->component->name_prefix, ctl->name);
@@ -720,16 +713,8 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	struct cs_dsp_coeff_ctl *cs_ctl;
-
-	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
-	if (!cs_ctl)
-		return -EINVAL;
-
-	if (len > cs_ctl->len)
-		return -EINVAL;
-
-	return cs_dsp_coeff_read_ctrl(cs_ctl, 0, buf, len);
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
+				      0, buf, len);
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
-- 
2.30.2

