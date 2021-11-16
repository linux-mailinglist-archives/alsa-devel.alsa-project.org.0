Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0B453730
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 17:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2497D16FD;
	Tue, 16 Nov 2021 17:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2497D16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637079585;
	bh=dfEJ/0s15Do+JJ6zK0RuzyMsMdINe0b3lUPlUxDAYiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/Urd6IBjTdOdD3gomxQMDutaOLSh901WMpCq8DEFckra/CifqkNqkXHjWQxrHLr3
	 kWAbp/KicqX5Fre9ReBETJQROzk1SQ859SuaRn+Efoj9Bb2wJiT7PZMG4pT1pq8Usc
	 MXtQKT3HKmcuuwGQABjDJouzIuykVmlbAWZPV/Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 406DFF80515;
	Tue, 16 Nov 2021 17:16:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB4E3F804BC; Tue, 16 Nov 2021 17:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F435F80423
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 17:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F435F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hrDjxYWy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AG7fwnL025797;
 Tue, 16 Nov 2021 10:16:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=U794aa6TxqSP/Zbgjvs0fRtCJbqeoJDK/QSWa6C7aF4=;
 b=hrDjxYWyrCy3NjqoTNqYJdLMbtAz0JWbxYBaC/HDWGRT5JagJBcbSiUIU80ehiLAUTVm
 5FYhU5GWKJgML4JWqiisywzzItyFxcWd8EBxYlBDp3+4RNmLcLykQkzgx8qGf5dov9Cb
 /qxikULl34aLAH+IVWv2tD47DZ2ZCH2AzFcJxUkp/CDz5Ribz2UkuWNMyIXdxeWx4Zur
 C524Bj0t/uiwuhoVocIYRB8Qz5J0JuHWCAaHCOhUBZ96W9aiJsYIbqoGROJ9OlAg6SKc
 Esqyj79SCahb8NQPONlSqVER7UcepMhNFfM4I14VmxsmJbuyeehyeElivNo1mp1Etpt0 0Q== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cbjn01x5t-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 10:16:14 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 16:16:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 16 Nov 2021 16:16:09 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9EF9A15A6;
 Tue, 16 Nov 2021 16:16:09 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 09/10] firmware: cs_dsp: Add offset to cs_dsp read/write
Date: Tue, 16 Nov 2021 16:16:08 +0000
Message-ID: <20211116161609.12223-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: UCqmm_yFJOzoM2xJ-RnH8RBz3iXH-lUE
X-Proofpoint-ORIG-GUID: UCqmm_yFJOzoM2xJ-RnH8RBz3iXH-lUE
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

Provide a mechanism to access only part of a control through the cs_dsp
interface.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 44 +++++++++++++++++++++-------------
 include/linux/firmware/cirrus/cs_dsp.h |  6 +++--
 sound/soc/codecs/wm_adsp.c             | 14 +++++------
 3 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index d1bcade2efe23..5fe08de91ecd3 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -616,7 +616,8 @@ static void cs_dsp_halo_show_fw_status(struct cs_dsp *dsp)
 		   offs[0], offs[1], offs[2], offs[3]);
 }
 
-static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg)
+static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg,
+				 unsigned int off)
 {
 	const struct cs_dsp_alg_region *alg_region = &ctl->alg_region;
 	struct cs_dsp *dsp = ctl->dsp;
@@ -629,7 +630,7 @@ static int cs_dsp_coeff_base_reg(struct cs_dsp_coeff_ctl *ctl, unsigned int *reg
 		return -EINVAL;
 	}
 
-	*reg = dsp->ops->region_to_reg(mem, ctl->alg_region.base + ctl->offset);
+	*reg = dsp->ops->region_to_reg(mem, ctl->alg_region.base + ctl->offset + off);
 
 	return 0;
 }
@@ -658,7 +659,7 @@ int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int
 	if (!dsp->running)
 		return -EPERM;
 
-	ret = cs_dsp_coeff_base_reg(ctl, &reg);
+	ret = cs_dsp_coeff_base_reg(ctl, &reg, 0);
 	if (ret)
 		return ret;
 
@@ -712,14 +713,14 @@ int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int
 EXPORT_SYMBOL_GPL(cs_dsp_coeff_write_acked_control);
 
 static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
-				       const void *buf, size_t len)
+				       unsigned int off, const void *buf, size_t len)
 {
 	struct cs_dsp *dsp = ctl->dsp;
 	void *scratch;
 	int ret;
 	unsigned int reg;
 
-	ret = cs_dsp_coeff_base_reg(ctl, &reg);
+	ret = cs_dsp_coeff_base_reg(ctl, &reg, off);
 	if (ret)
 		return ret;
 
@@ -745,6 +746,7 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 /**
  * cs_dsp_coeff_write_ctrl() - Writes the given buffer to the given coefficient control
  * @ctl: pointer to coefficient control
+ * @off: word offset at which data should be written
  * @buf: the buffer to write to the given control
  * @len: the length of the buffer in bytes
  *
@@ -752,7 +754,8 @@ static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
  *
  * Return: Zero for success, a negative number on error.
  */
-int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, const void *buf, size_t len)
+int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
+			    unsigned int off, const void *buf, size_t len)
 {
 	int ret = 0;
 
@@ -761,27 +764,31 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, const void *buf, size_
 	if (!ctl)
 		return -ENOENT;
 
+	if (len + off * sizeof(u32) > ctl->len)
+		return -EINVAL;
+
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE)
 		ret = -EPERM;
 	else if (buf != ctl->cache)
-		memcpy(ctl->cache, buf, len);
+		memcpy(ctl->cache + off * sizeof(u32), buf, len);
 
 	ctl->set = 1;
 	if (ctl->enabled && ctl->dsp->running)
-		ret = cs_dsp_coeff_write_ctrl_raw(ctl, buf, len);
+		ret = cs_dsp_coeff_write_ctrl_raw(ctl, off, buf, len);
 
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cs_dsp_coeff_write_ctrl);
 
-static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
+static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
+				      unsigned int off, void *buf, size_t len)
 {
 	struct cs_dsp *dsp = ctl->dsp;
 	void *scratch;
 	int ret;
 	unsigned int reg;
 
-	ret = cs_dsp_coeff_base_reg(ctl, &reg);
+	ret = cs_dsp_coeff_base_reg(ctl, &reg, off);
 	if (ret)
 		return ret;
 
@@ -807,6 +814,7 @@ static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl, void *buf, s
 /**
  * cs_dsp_coeff_read_ctrl() - Reads the given coefficient control into the given buffer
  * @ctl: pointer to coefficient control
+ * @off: word offset at which data should be read
  * @buf: the buffer to store to the given control
  * @len: the length of the buffer in bytes
  *
@@ -814,7 +822,8 @@ static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl, void *buf, s
  *
  * Return: Zero for success, a negative number on error.
  */
-int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
+int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
+			   unsigned int off, void *buf, size_t len)
 {
 	int ret = 0;
 
@@ -823,17 +832,20 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len)
 	if (!ctl)
 		return -ENOENT;
 
+	if (len + off * sizeof(u32) > ctl->len)
+		return -EINVAL;
+
 	if (ctl->flags & WMFW_CTL_FLAG_VOLATILE) {
 		if (ctl->enabled && ctl->dsp->running)
-			return cs_dsp_coeff_read_ctrl_raw(ctl, buf, len);
+			return cs_dsp_coeff_read_ctrl_raw(ctl, off, buf, len);
 		else
 			return -EPERM;
 	} else {
 		if (!ctl->flags && ctl->enabled && ctl->dsp->running)
-			ret = cs_dsp_coeff_read_ctrl_raw(ctl, ctl->cache, ctl->len);
+			ret = cs_dsp_coeff_read_ctrl_raw(ctl, 0, ctl->cache, ctl->len);
 
 		if (buf != ctl->cache)
-			memcpy(buf, ctl->cache, len);
+			memcpy(buf, ctl->cache + off * sizeof(u32), len);
 	}
 
 	return ret;
@@ -857,7 +869,7 @@ static int cs_dsp_coeff_init_control_caches(struct cs_dsp *dsp)
 		 * created so we don't need to do anything.
 		 */
 		if (!ctl->flags || (ctl->flags & WMFW_CTL_FLAG_READABLE)) {
-			ret = cs_dsp_coeff_read_ctrl_raw(ctl, ctl->cache, ctl->len);
+			ret = cs_dsp_coeff_read_ctrl_raw(ctl, 0, ctl->cache, ctl->len);
 			if (ret < 0)
 				return ret;
 		}
@@ -875,7 +887,7 @@ static int cs_dsp_coeff_sync_controls(struct cs_dsp *dsp)
 		if (!ctl->enabled)
 			continue;
 		if (ctl->set && !(ctl->flags & WMFW_CTL_FLAG_VOLATILE)) {
-			ret = cs_dsp_coeff_write_ctrl_raw(ctl, ctl->cache,
+			ret = cs_dsp_coeff_write_ctrl_raw(ctl, 0, ctl->cache,
 							  ctl->len);
 			if (ret < 0)
 				return ret;
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 1ad1b173417a0..38b4da3ddfe4f 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -232,8 +232,10 @@ void cs_dsp_init_debugfs(struct cs_dsp *dsp, struct dentry *debugfs_root);
 void cs_dsp_cleanup_debugfs(struct cs_dsp *dsp);
 
 int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int event_id);
-int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, const void *buf, size_t len);
-int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, void *buf, size_t len);
+int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, unsigned int off,
+			    const void *buf, size_t len);
+int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, unsigned int off,
+			   void *buf, size_t len);
 struct cs_dsp_coeff_ctl *cs_dsp_get_ctl(struct cs_dsp *dsp, const char *name, int type,
 					unsigned int alg);
 
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 404717e30f44d..f084b093cff64 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -401,7 +401,7 @@ static int wm_coeff_put(struct snd_kcontrol *kctl,
 	int ret = 0;
 
 	mutex_lock(&cs_ctl->dsp->pwr_lock);
-	ret = cs_dsp_coeff_write_ctrl(cs_ctl, p, cs_ctl->len);
+	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, p, cs_ctl->len);
 	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
@@ -421,7 +421,7 @@ static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
 	if (copy_from_user(cs_ctl->cache, bytes, size))
 		ret = -EFAULT;
 	else
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, cs_ctl->cache, size);
+		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, cs_ctl->cache, size);
 
 	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
@@ -464,7 +464,7 @@ static int wm_coeff_get(struct snd_kcontrol *kctl,
 	int ret;
 
 	mutex_lock(&cs_ctl->dsp->pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_ctl, p, cs_ctl->len);
+	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, p, cs_ctl->len);
 	mutex_unlock(&cs_ctl->dsp->pwr_lock);
 
 	return ret;
@@ -481,7 +481,7 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 
 	mutex_lock(&cs_ctl->dsp->pwr_lock);
 
-	ret = cs_dsp_coeff_read_ctrl(cs_ctl, cs_ctl->cache, size);
+	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, cs_ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, cs_ctl->cache, size))
 		ret = -EFAULT;
@@ -684,7 +684,7 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	if (len > cs_ctl->len)
 		return -EINVAL;
 
-	ret = cs_dsp_coeff_write_ctrl(cs_ctl, buf, len);
+	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
 	if (ret)
 		return ret;
 
@@ -723,7 +723,7 @@ int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 	if (len > cs_ctl->len)
 		return -EINVAL;
 
-	return cs_dsp_coeff_read_ctrl(cs_ctl, buf, len);
+	return cs_dsp_coeff_read_ctrl(cs_ctl, 0, buf, len);
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
@@ -1432,7 +1432,7 @@ static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
 	int ret, i;
 
 	for (i = 0; i < 5; ++i) {
-		ret = cs_dsp_coeff_read_ctrl(cs_ctl, &coeff_v1, sizeof(coeff_v1));
+		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1, sizeof(coeff_v1));
 		if (ret < 0)
 			return ret;
 
-- 
2.11.0

