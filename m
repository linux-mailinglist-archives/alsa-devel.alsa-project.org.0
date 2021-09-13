Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31140984E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941FF16CA;
	Mon, 13 Sep 2021 18:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941FF16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631549068;
	bh=wiie4R1HX76sVjgfZJ0UqNeuIJB8vW06YEPw782sPFA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gGShcowCQ/y8fNPV+11WOfdusjCiSJmcchE+BvGUBEepm0O9UmpTMCkMNjVOKo4aj
	 15/ysOssJ3LUUPov0QBdaxum+a7fAuvmkdxXjge9/a7XDumTd13HJ19HnuZRv3z9kC
	 oMFTx+3nYN4ReBxWpTwNIRgAAmzdmp1pDVycxHSQ=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D328F804FF;
	Mon, 13 Sep 2021 18:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40334F804EC; Mon, 13 Sep 2021 18:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D85F804D9
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D85F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AQkb31dL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DAEA6Q014550; 
 Mon, 13 Sep 2021 11:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=U1Axwhfj2EwweV3zrKBnAqX9SjNMmzIG+fFqlpSPhj0=;
 b=AQkb31dLrYvi4eR+ZrFQBlBT/cdzVNBz8w/eDxg9oodgs0ldllbnoM017Xae5EBsn4Qm
 GRaR51m8MzKVud+JmpfALma0j4PthI7NX3n6OmVOwh19MdQK11sT8SvYsH4E55kzx3bM
 GWs6OiYa66TEVMM8+xVcZPl9opoNiV+uD92Ig5IhtOJ28ycgOU9lz40jBePw2J4AxOWr
 zz8XOYDsdWG1eEvoE5iw8y/W9AVMTaqos/CFV5MKL39ODEzEYi3URC/PuywF+eoGrelw
 XkG58OOzs3668huQ2ZHvaVxXz6ZwVRiAVeYtoVAr0SNBwbhQM4eu9MJHHjssuPkeIW1r XA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b1n5drxkd-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Sep 2021 11:01:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 13 Sep
 2021 17:01:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 13 Sep 2021 17:01:21 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C529EB2F;
 Mon, 13 Sep 2021 16:01:20 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 10/16] ASoC: wm_adsp: Separate generic cs_dsp_coeff_ctl
 handling
Date: Mon, 13 Sep 2021 17:00:51 +0100
Message-ID: <20210913160057.103842-11-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 2r2tQ7EBh_VwJF0q7ptYnPmQA-rwfkbO
X-Proofpoint-ORIG-GUID: 2r2tQ7EBh_VwJF0q7ptYnPmQA-rwfkbO
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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

This is preparation for moving the generic DSP support out of ASoC. The
majority of the handling of firmware controls is generic and this change
separates the generic and ASoC specific details into separate structures
and functions and renames the generic code named wm_* to cs_*.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 283 ++++++++++++++++++++-----------------
 sound/soc/codecs/wm_adsp.h |  20 +++
 2 files changed, 176 insertions(+), 127 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 82038cac4286..bd335e4240e5 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -607,21 +607,8 @@ static const struct {
 
 struct wm_coeff_ctl {
 	const char *name;
-	const char *fw_name;
-	/* Subname is needed to match with firmware */
-	const char *subname;
-	unsigned int subname_len;
-	struct cs_dsp_alg_region alg_region;
-	struct wm_adsp *dsp;
-	unsigned int enabled:1;
-	struct list_head list;
-	void *cache;
-	unsigned int offset;
-	size_t len;
-	unsigned int set:1;
+	struct cs_dsp_coeff_ctl *cs_ctl;
 	struct soc_bytes_ext bytes_ext;
-	unsigned int flags;
-	unsigned int type;
 	struct work_struct work;
 };
 
@@ -938,7 +925,7 @@ static inline struct wm_coeff_ctl *bytes_ext_to_ctl(struct soc_bytes_ext *ext)
 	return container_of(ext, struct wm_coeff_ctl, bytes_ext);
 }
 
-static int cs_dsp_coeff_base_reg(struct wm_coeff_ctl *ctl, unsigned int *reg)
+static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg)
 {
 	const struct cs_dsp_alg_region *alg_region = &ctl->alg_region;
 	struct wm_adsp *dsp = ctl->dsp;
@@ -962,8 +949,9 @@ static int wm_coeff_info(struct snd_kcontrol *kctl,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 
-	switch (ctl->type) {
+	switch (cs_ctl->type) {
 	case WMFW_CTL_TYPE_ACKED:
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 		uinfo->value.integer.min = CS_DSP_ACKED_CTL_MIN_VALUE;
@@ -973,14 +961,14 @@ static int wm_coeff_info(struct snd_kcontrol *kctl,
 		break;
 	default:
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-		uinfo->count = ctl->len;
+		uinfo->count = cs_ctl->len;
 		break;
 	}
 
 	return 0;
 }
 
-static int cs_dsp_coeff_write_acked_control(struct wm_coeff_ctl *ctl,
+static int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl,
 					    unsigned int event_id)
 {
 	struct wm_adsp *dsp = ctl->dsp;
@@ -1040,7 +1028,7 @@ static int cs_dsp_coeff_write_acked_control(struct wm_coeff_ctl *ctl,
 	return -ETIMEDOUT;
 }
 
-static int cs_dsp_coeff_write_ctrl_raw(struct wm_coeff_ctl *ctl,
+static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 				       const void *buf, size_t len)
 {
 	struct wm_adsp *dsp = ctl->dsp;
@@ -1071,7 +1059,7 @@ static int cs_dsp_coeff_write_ctrl_raw(struct wm_coeff_ctl *ctl,
 	return 0;
 }
 
-static int cs_dsp_coeff_write_ctrl(struct wm_coeff_ctl *ctl,
+static int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 				   const void *buf, size_t len)
 {
 	int ret = 0;
@@ -1094,12 +1082,13 @@ static int wm_coeff_put(struct snd_kcontrol *kctl,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	char *p = ucontrol->value.bytes.data;
 	int ret = 0;
 
-	mutex_lock(&ctl->dsp->pwr_lock);
-	ret = cs_dsp_coeff_write_ctrl(ctl, p, ctl->len);
-	mutex_unlock(&ctl->dsp->pwr_lock);
+	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	ret = cs_dsp_coeff_write_ctrl(cs_ctl, p, cs_ctl->len);
+	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
 }
@@ -1110,16 +1099,17 @@ static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	int ret = 0;
 
-	mutex_lock(&ctl->dsp->pwr_lock);
+	mutex_lock(&cs_ctl->dsp->pwr_lock);
 
-	if (copy_from_user(ctl->cache, bytes, size))
+	if (copy_from_user(cs_ctl->cache, bytes, size))
 		ret = -EFAULT;
 	else
-		ret = cs_dsp_coeff_write_ctrl(ctl, ctl->cache, size);
+		ret = cs_dsp_coeff_write_ctrl(cs_ctl, cs_ctl->cache, size);
 
-	mutex_unlock(&ctl->dsp->pwr_lock);
+	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
 }
@@ -1130,25 +1120,26 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	unsigned int val = ucontrol->value.integer.value[0];
 	int ret;
 
 	if (val == 0)
 		return 0;	/* 0 means no event */
 
-	mutex_lock(&ctl->dsp->pwr_lock);
+	mutex_lock(&cs_ctl->dsp->pwr_lock);
 
-	if (ctl->enabled && ctl->dsp->running)
-		ret = cs_dsp_coeff_write_acked_control(ctl, val);
+	if (cs_ctl->enabled && cs_ctl->dsp->running)
+		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
 	else
 		ret = -EPERM;
 
-	mutex_unlock(&ctl->dsp->pwr_lock);
+	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
 }
 
-static int cs_dsp_coeff_read_ctrl_raw(struct wm_coeff_ctl *ctl,
+static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 				      void *buf, size_t len)
 {
 	struct wm_adsp *dsp = ctl->dsp;
@@ -1179,7 +1170,7 @@ static int cs_dsp_coeff_read_ctrl_raw(struct wm_coeff_ctl *ctl,
 	return 0;
 }
 
-static int cs_dsp_coeff_read_ctrl(struct wm_coeff_ctl *ctl, void *buf, size_t len)
+static int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
 {
 	int ret = 0;
 
@@ -1205,12 +1196,13 @@ static int wm_coeff_get(struct snd_kcontrol *kctl,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	char *p = ucontrol->value.bytes.data;
 	int ret;
 
-	mutex_lock(&ctl->dsp->pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(ctl, p, ctl->len);
-	mutex_unlock(&ctl->dsp->pwr_lock);
+	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	ret = cs_dsp_coeff_read_ctrl(cs_ctl, p, cs_ctl->len);
+	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
 }
@@ -1221,16 +1213,17 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 	struct soc_bytes_ext *bytes_ext =
 		(struct soc_bytes_ext *)kctl->private_value;
 	struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	int ret = 0;
 
-	mutex_lock(&ctl->dsp->pwr_lock);
+	mutex_lock(&cs_ctl->dsp->pwr_lock);
 
-	ret = cs_dsp_coeff_read_ctrl(ctl, ctl->cache, size);
+	ret = cs_dsp_coeff_read_ctrl(cs_ctl, cs_ctl->cache, size);
 
-	if (!ret && copy_to_user(bytes, ctl->cache, size))
+	if (!ret && copy_to_user(bytes, cs_ctl->cache, size))
 		ret = -EFAULT;
 
-	mutex_unlock(&ctl->dsp->pwr_lock);
+	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
 }
@@ -1283,12 +1276,10 @@ static unsigned int wmfw_convert_flags(unsigned int in, unsigned int len)
 
 static int wmfw_add_ctl(struct wm_adsp *dsp, struct wm_coeff_ctl *ctl)
 {
+	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	struct snd_kcontrol_new *kcontrol;
 	int ret;
 
-	if (!ctl || !ctl->name)
-		return -EINVAL;
-
 	kcontrol = kzalloc(sizeof(*kcontrol), GFP_KERNEL);
 	if (!kcontrol)
 		return -ENOMEM;
@@ -1298,16 +1289,16 @@ static int wmfw_add_ctl(struct wm_adsp *dsp, struct wm_coeff_ctl *ctl)
 	kcontrol->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	kcontrol->tlv.c = snd_soc_bytes_tlv_callback;
 	kcontrol->private_value = (unsigned long)&ctl->bytes_ext;
-	kcontrol->access = wmfw_convert_flags(ctl->flags, ctl->len);
+	kcontrol->access = wmfw_convert_flags(cs_ctl->flags, cs_ctl->len);
 
-	switch (ctl->type) {
+	switch (cs_ctl->type) {
 	case WMFW_CTL_TYPE_ACKED:
 		kcontrol->get = wm_coeff_get_acked;
 		kcontrol->put = wm_coeff_put_acked;
 		break;
 	default:
 		if (kcontrol->access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK) {
-			ctl->bytes_ext.max = ctl->len;
+			ctl->bytes_ext.max = cs_ctl->len;
 			ctl->bytes_ext.get = wm_coeff_tlv_get;
 			ctl->bytes_ext.put = wm_coeff_tlv_put;
 		} else {
@@ -1332,7 +1323,7 @@ static int wmfw_add_ctl(struct wm_adsp *dsp, struct wm_coeff_ctl *ctl)
 
 static int cs_dsp_coeff_init_control_caches(struct wm_adsp *dsp)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 	int ret;
 
 	list_for_each_entry(ctl, &dsp->ctl_list, list) {
@@ -1358,7 +1349,7 @@ static int cs_dsp_coeff_init_control_caches(struct wm_adsp *dsp)
 
 static int cs_dsp_coeff_sync_controls(struct wm_adsp *dsp)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 	int ret;
 
 	list_for_each_entry(ctl, &dsp->ctl_list, list) {
@@ -1378,7 +1369,7 @@ static int cs_dsp_coeff_sync_controls(struct wm_adsp *dsp)
 static void cs_dsp_signal_event_controls(struct wm_adsp *dsp,
 					  unsigned int event)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 	int ret;
 
 	list_for_each_entry(ctl, &dsp->ctl_list, list) {
@@ -1401,47 +1392,30 @@ static void wm_adsp_ctl_work(struct work_struct *work)
 	struct wm_coeff_ctl *ctl = container_of(work,
 						struct wm_coeff_ctl,
 						work);
-
-	wmfw_add_ctl(ctl->dsp, ctl);
+	wmfw_add_ctl(ctl->cs_ctl->dsp, ctl);
 }
 
-static void cs_dsp_free_ctl_blk(struct wm_coeff_ctl *ctl)
+static void cs_dsp_free_ctl_blk(struct cs_dsp_coeff_ctl *ctl)
 {
-	cancel_work_sync(&ctl->work);
-
 	kfree(ctl->cache);
-	kfree(ctl->name);
 	kfree(ctl->subname);
 	kfree(ctl);
 }
 
-static int cs_dsp_create_control(struct wm_adsp *dsp,
-				 const struct cs_dsp_alg_region *alg_region,
-				 unsigned int offset, unsigned int len,
-				 const char *subname, unsigned int subname_len,
-				 unsigned int flags, unsigned int type)
+static int wm_adsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl)
 {
+	struct wm_adsp *dsp = cs_ctl->dsp;
 	struct wm_coeff_ctl *ctl;
 	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	const char *region_name;
 	int ret;
 
-	list_for_each_entry(ctl, &dsp->ctl_list, list) {
-		if (ctl->fw_name == wm_adsp_fw_text[dsp->fw] &&
-		    ctl->alg_region.alg == alg_region->alg &&
-		    ctl->alg_region.type == alg_region->type) {
-			if ((!subname && !ctl->subname) ||
-			    (subname && !strncmp(ctl->subname, subname, ctl->subname_len))) {
-				if (!ctl->enabled)
-					ctl->enabled = 1;
-				return 0;
-			}
-		}
-	}
+	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
+		return 0;
 
-	region_name = cs_dsp_mem_region_name(alg_region->type);
+	region_name = cs_dsp_mem_region_name(cs_ctl->alg_region.type);
 	if (!region_name) {
-		cs_dsp_err(dsp, "Unknown region type: %d\n", alg_region->type);
+		adsp_err(dsp, "Unknown region type: %d\n", cs_ctl->alg_region.type);
 		return -EINVAL;
 	}
 
@@ -1449,22 +1423,21 @@ static int cs_dsp_create_control(struct wm_adsp *dsp,
 	case 0:
 	case 1:
 		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s %s %x",
-			 dsp->name, region_name, alg_region->alg);
-		subname = NULL; /* don't append subname */
+			 dsp->name, region_name, cs_ctl->alg_region.alg);
 		break;
 	case 2:
 		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 				"%s%c %.12s %x", dsp->name, *region_name,
-				wm_adsp_fw_text[dsp->fw], alg_region->alg);
+				wm_adsp_fw_text[dsp->fw], cs_ctl->alg_region.alg);
 		break;
 	default:
 		ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
 				"%s %.12s %x", dsp->name,
-				wm_adsp_fw_text[dsp->fw], alg_region->alg);
+				wm_adsp_fw_text[dsp->fw], cs_ctl->alg_region.alg);
 		break;
 	}
 
-	if (subname) {
+	if (cs_ctl->subname) {
 		int avail = SNDRV_CTL_ELEM_ID_NAME_MAXLEN - ret - 2;
 		int skip = 0;
 
@@ -1472,30 +1445,81 @@ static int cs_dsp_create_control(struct wm_adsp *dsp,
 			avail -= strlen(dsp->component->name_prefix) + 1;
 
 		/* Truncate the subname from the start if it is too long */
-		if (subname_len > avail)
-			skip = subname_len - avail;
+		if (cs_ctl->subname_len > avail)
+			skip = cs_ctl->subname_len - avail;
 
 		snprintf(name + ret, SNDRV_CTL_ELEM_ID_NAME_MAXLEN - ret,
-			 " %.*s", subname_len - skip, subname + skip);
+			 " %.*s", cs_ctl->subname_len - skip, cs_ctl->subname + skip);
 	}
 
 	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
 	if (!ctl)
 		return -ENOMEM;
-	ctl->fw_name = wm_adsp_fw_text[dsp->fw];
-	ctl->alg_region = *alg_region;
+	ctl->cs_ctl = cs_ctl;
+
 	ctl->name = kmemdup(name, strlen(name) + 1, GFP_KERNEL);
 	if (!ctl->name) {
 		ret = -ENOMEM;
 		goto err_ctl;
 	}
-	if (subname) {
+
+	cs_ctl->priv = ctl;
+
+	INIT_WORK(&ctl->work, wm_adsp_ctl_work);
+	schedule_work(&ctl->work);
+
+	return 0;
+
+err_ctl:
+	kfree(ctl);
+
+	return ret;
+}
+
+static void wm_adsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
+{
+	struct wm_coeff_ctl *ctl = cs_ctl->priv;
+
+	cancel_work_sync(&ctl->work);
+
+	kfree(ctl->name);
+	kfree(ctl);
+}
+
+static int cs_dsp_create_control(struct wm_adsp *dsp,
+				 const struct cs_dsp_alg_region *alg_region,
+				 unsigned int offset, unsigned int len,
+				 const char *subname, unsigned int subname_len,
+				 unsigned int flags, unsigned int type)
+{
+	struct cs_dsp_coeff_ctl *ctl;
+	int ret;
+
+	list_for_each_entry(ctl, &dsp->ctl_list, list) {
+		if (ctl->fw_name == wm_adsp_fw_text[dsp->fw] &&
+		    ctl->alg_region.alg == alg_region->alg &&
+		    ctl->alg_region.type == alg_region->type) {
+			if ((!subname && !ctl->subname) ||
+			    (subname && !strncmp(ctl->subname, subname, ctl->subname_len))) {
+				if (!ctl->enabled)
+					ctl->enabled = 1;
+				return 0;
+			}
+		}
+	}
+
+	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
+	if (!ctl)
+		return -ENOMEM;
+	ctl->fw_name = wm_adsp_fw_text[dsp->fw];
+	ctl->alg_region = *alg_region;
+	if (subname && dsp->fw_ver >= 2) {
 		ctl->subname_len = subname_len;
 		ctl->subname = kmemdup(subname,
 				       strlen(subname) + 1, GFP_KERNEL);
 		if (!ctl->subname) {
 			ret = -ENOMEM;
-			goto err_ctl_name;
+			goto err_ctl;
 		}
 	}
 	ctl->enabled = 1;
@@ -1514,18 +1538,17 @@ static int cs_dsp_create_control(struct wm_adsp *dsp,
 
 	list_add(&ctl->list, &dsp->ctl_list);
 
-	if (flags & WMFW_CTL_FLAG_SYS)
-		return 0;
-
-	INIT_WORK(&ctl->work, wm_adsp_ctl_work);
-	schedule_work(&ctl->work);
+	ret = wm_adsp_control_add(ctl);
+	if (ret)
+		goto err_list_del;
 
 	return 0;
 
+err_list_del:
+	list_del(&ctl->list);
+	kfree(ctl->cache);
 err_ctl_subname:
 	kfree(ctl->subname);
-err_ctl_name:
-	kfree(ctl->name);
 err_ctl:
 	kfree(ctl);
 
@@ -2013,14 +2036,14 @@ static int cs_dsp_load(struct wm_adsp *dsp)
 }
 
 /*
- * Find wm_coeff_ctl with input name as its subname
+ * Find cs_dsp_coeff_ctl with input name as its subname
  * If not found, return NULL
  */
-static struct wm_coeff_ctl *cs_dsp_get_ctl(struct wm_adsp *dsp,
-					   const char *name, int type,
-					   unsigned int alg)
+static struct cs_dsp_coeff_ctl *cs_dsp_get_ctl(struct wm_adsp *dsp,
+					       const char *name, int type,
+					       unsigned int alg)
 {
-	struct wm_coeff_ctl *pos, *rslt = NULL;
+	struct cs_dsp_coeff_ctl *pos, *rslt = NULL;
 	const char *fw_txt = wm_adsp_fw_text[dsp->fw];
 
 	list_for_each_entry(pos, &dsp->ctl_list, list) {
@@ -2041,23 +2064,26 @@ static struct wm_coeff_ctl *cs_dsp_get_ctl(struct wm_adsp *dsp,
 int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 		      unsigned int alg, void *buf, size_t len)
 {
+	struct cs_dsp_coeff_ctl *cs_ctl;
 	struct wm_coeff_ctl *ctl;
 	struct snd_kcontrol *kcontrol;
 	char ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ret;
 
-	ctl = cs_dsp_get_ctl(dsp, name, type, alg);
-	if (!ctl)
+	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
+	if (!cs_ctl)
 		return -EINVAL;
 
-	if (len > ctl->len)
+	ctl = cs_ctl->priv;
+
+	if (len > cs_ctl->len)
 		return -EINVAL;
 
-	ret = cs_dsp_coeff_write_ctrl(ctl, buf, len);
+	ret = cs_dsp_coeff_write_ctrl(cs_ctl, buf, len);
 	if (ret)
 		return ret;
 
-	if (ctl->flags & WMFW_CTL_FLAG_SYS)
+	if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
 		return 0;
 
 	if (dsp->component->name_prefix)
@@ -2083,23 +2109,23 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *cs_ctl;
 
-	ctl = cs_dsp_get_ctl(dsp, name, type, alg);
-	if (!ctl)
+	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
+	if (!cs_ctl)
 		return -EINVAL;
 
-	if (len > ctl->len)
+	if (len > cs_ctl->len)
 		return -EINVAL;
 
-	return cs_dsp_coeff_read_ctrl(ctl, buf, len);
+	return cs_dsp_coeff_read_ctrl(cs_ctl, buf, len);
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
 static void cs_dsp_ctl_fixup_base(struct wm_adsp *dsp,
 				  const struct cs_dsp_alg_region *alg_region)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 
 	list_for_each_entry(ctl, &dsp->ctl_list, list) {
 		if (ctl->fw_name == wm_adsp_fw_text[dsp->fw] &&
@@ -2885,7 +2911,7 @@ static int cs_dsp_adsp1_power_up(struct wm_adsp *dsp)
 
 static void cs_dsp_adsp1_power_down(struct wm_adsp *dsp)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 
 	mutex_lock(&dsp->pwr_lock);
 
@@ -3199,7 +3225,7 @@ static void cs_dsp_power_up(struct wm_adsp *dsp)
 
 static void cs_dsp_power_down(struct wm_adsp *dsp)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 
 	mutex_lock(&dsp->pwr_lock);
 
@@ -3496,11 +3522,13 @@ EXPORT_SYMBOL_GPL(wm_halo_init);
 
 static void cs_dsp_remove(struct wm_adsp *dsp)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *ctl;
 
 	while (!list_empty(&dsp->ctl_list)) {
-		ctl = list_first_entry(&dsp->ctl_list, struct wm_coeff_ctl,
-					list);
+		ctl = list_first_entry(&dsp->ctl_list, struct cs_dsp_coeff_ctl, list);
+
+		wm_adsp_control_remove(ctl);
+
 		list_del(&ctl->list);
 		cs_dsp_free_ctl_blk(ctl);
 	}
@@ -3936,15 +3964,16 @@ static int wm_adsp_buffer_parse_legacy(struct wm_adsp *dsp)
 	return 0;
 }
 
-static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
+static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 {
 	struct wm_adsp_host_buf_coeff_v1 coeff_v1;
 	struct wm_adsp_compr_buf *buf;
+	struct wm_adsp *dsp = cs_ctl->dsp;
 	unsigned int version;
 	int ret, i;
 
 	for (i = 0; i < 5; ++i) {
-		ret = cs_dsp_coeff_read_ctrl(ctl, &coeff_v1, sizeof(coeff_v1));
+		ret = cs_dsp_coeff_read_ctrl(cs_ctl, &coeff_v1, sizeof(coeff_v1));
 		if (ret < 0)
 			return ret;
 
@@ -3955,15 +3984,15 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 	}
 
 	if (!coeff_v1.host_buf_ptr) {
-		adsp_err(ctl->dsp, "Failed to acquire host buffer\n");
+		adsp_err(dsp, "Failed to acquire host buffer\n");
 		return -EIO;
 	}
 
-	buf = wm_adsp_buffer_alloc(ctl->dsp);
+	buf = wm_adsp_buffer_alloc(dsp);
 	if (!buf)
 		return -ENOMEM;
 
-	buf->host_buf_mem_type = ctl->alg_region.type;
+	buf->host_buf_mem_type = cs_ctl->alg_region.type;
 	buf->host_buf_ptr = be32_to_cpu(coeff_v1.host_buf_ptr);
 
 	ret = wm_adsp_buffer_populate(buf);
@@ -3974,7 +4003,7 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 	 * v0 host_buffer coefficients didn't have versioning, so if the
 	 * control is one word, assume version 0.
 	 */
-	if (ctl->len == 4) {
+	if (cs_ctl->len == 4) {
 		compr_dbg(buf, "host_buf_ptr=%x\n", buf->host_buf_ptr);
 		return 0;
 	}
@@ -3983,7 +4012,7 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 	version >>= HOST_BUF_COEFF_COMPAT_VER_SHIFT;
 
 	if (version > HOST_BUF_COEFF_SUPPORTED_COMPAT_VER) {
-		adsp_err(ctl->dsp,
+		adsp_err(dsp,
 			 "Host buffer coeff ver %u > supported version %u\n",
 			 version, HOST_BUF_COEFF_SUPPORTED_COMPAT_VER);
 		return -EINVAL;
@@ -3991,7 +4020,7 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 
 	cs_dsp_remove_padding((u32 *)&coeff_v1.name, ARRAY_SIZE(coeff_v1.name));
 
-	buf->name = kasprintf(GFP_KERNEL, "%s-dsp-%s", ctl->dsp->part,
+	buf->name = kasprintf(GFP_KERNEL, "%s-dsp-%s", dsp->part,
 			      (char *)&coeff_v1.name);
 
 	compr_dbg(buf, "host_buf_ptr=%x coeff version %u\n",
@@ -4002,17 +4031,17 @@ static int wm_adsp_buffer_parse_coeff(struct wm_coeff_ctl *ctl)
 
 static int wm_adsp_buffer_init(struct wm_adsp *dsp)
 {
-	struct wm_coeff_ctl *ctl;
+	struct cs_dsp_coeff_ctl *cs_ctl;
 	int ret;
 
-	list_for_each_entry(ctl, &dsp->ctl_list, list) {
-		if (ctl->type != WMFW_CTL_TYPE_HOST_BUFFER)
+	list_for_each_entry(cs_ctl, &dsp->ctl_list, list) {
+		if (cs_ctl->type != WMFW_CTL_TYPE_HOST_BUFFER)
 			continue;
 
-		if (!ctl->enabled)
+		if (!cs_ctl->enabled)
 			continue;
 
-		ret = wm_adsp_buffer_parse_coeff(ctl);
+		ret = wm_adsp_buffer_parse_coeff(cs_ctl);
 		if (ret < 0) {
 			adsp_err(dsp, "Failed to parse coeff: %d\n", ret);
 			goto error;
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 98b12b485916..eee298e94946 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -49,10 +49,30 @@ struct cs_dsp_alg_region {
 	unsigned int base;
 };
 
+struct wm_adsp;
 struct wm_adsp_compr;
 struct wm_adsp_compr_buf;
 struct cs_dsp_ops;
 
+struct cs_dsp_coeff_ctl {
+	const char *fw_name;
+	/* Subname is needed to match with firmware */
+	const char *subname;
+	unsigned int subname_len;
+	struct cs_dsp_alg_region alg_region;
+	struct wm_adsp *dsp;
+	unsigned int enabled:1;
+	struct list_head list;
+	void *cache;
+	unsigned int offset;
+	size_t len;
+	unsigned int set:1;
+	unsigned int flags;
+	unsigned int type;
+
+	void *priv;
+};
+
 struct wm_adsp {
 	const char *part;
 	const char *name;
-- 
2.33.0

