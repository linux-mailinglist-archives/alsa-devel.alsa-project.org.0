Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1CFE5F3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 20:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33870167B;
	Fri, 15 Nov 2019 20:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33870167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573847283;
	bh=/fbUs6SbAbkgS9sEX8uAG4gweCF6hWxp0gqWAxrJQ4k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXgLACh60GQ7ZYx60+btsMKdLVegentSU9G14V1+uSp7AMpcAwXb4zFka+fVDAoHt
	 5ffNnpoadPtOiQZRBCAwAKMyZLIcqD3QsbWqUefQyqnnbIs4MpIwku6ILuJ2VuIqV1
	 5566l8F0PK3nJfEMmki9cdPBWdCrBH1/Hd8VIjcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE234F8010A;
	Fri, 15 Nov 2019 20:45:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E77A1F80108; Fri, 15 Nov 2019 20:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CA2AF8007E
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 20:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA2AF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j9ssBzkJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFJiilp009698; Fri, 15 Nov 2019 13:45:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=5gu+deuazP/W3ain5t92Qro2DI4GyhyFvAze8omi5M8=;
 b=j9ssBzkJFNj3xkr/6lf4iw3O/tF6cwZk3G2ewLGlT6rFyMoJ6/laoXTEX2IuDL9btRfJ
 SZ6Un7dFqApkG1UXbUX14E2ExS5z7orw3nqFJ1gSvNFowtWFEIflID9SFNVSXEe2e8jz
 LS3Cx7YUogwbjTPrUUGsbtU4neN8do260tgkCD7i2orzbIwMyKMuoBW5lTBFEdkh7YbR
 R8jXFw953sO2mG2pa8hU94cRi5YgHa7Z6xc/+1kKmJjr5RkdK9R2cZQP2jKCj2VlNYYk
 PwIZjwkLkn4tn+g6jI/8KLkvvXrUWnGeEVODQmtitSqWMpOtGh2TEHmXtNBgzQmXTc3S gQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=David.Rhodes@cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2w5ur2tqdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 Nov 2019 13:45:45 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 15 Nov
 2019 19:45:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 15 Nov 2019 19:45:42 +0000
Received: from david-linux.ad.cirrus.com (david-linux.ad.cirrus.com
 [141.131.206.99])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 101492A1;
 Fri, 15 Nov 2019 19:45:40 +0000 (UTC)
From: David Rhodes <david.rhodes@cirrus.com>
To: <ckeepax@opensource.cirrus.com>, <david.rhodes@cirrus.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Date: Fri, 15 Nov 2019 13:54:13 -0600
Message-ID: <1573847653-17094-2-git-send-email-david.rhodes@cirrus.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573847653-17094-1-git-send-email-david.rhodes@cirrus.com>
References: <1573847653-17094-1-git-send-email-david.rhodes@cirrus.com>
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:107.20.210.250 ip4:52.1.14.157 ip4:141.131.128.20 ip4:141.131.3.20
 ip4:213.128.236.230 ip4:87.246.98.25 ip4:87.246.78.26 ip4:87.246.76.56
 ip4:87.246.98.35 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015 spamscore=0
 suspectscore=2 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911150174
Cc: Li Xu <li.xu@cirrus.com>
Subject: [alsa-devel] [PATCH] ASoC: wm_adsp: Expose mixer control API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Li Xu <li.xu@cirrus.com>

Expose mixer control API for reading and writing controls from the kernel.
This API can be used by ALSA kernel drivers with ADSP support to
read and write firmware-defined memory regions.

Signed-off-by: Li Xu <li.xu@cirrus.com>
Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 81 +++++++++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/wm_adsp.h |  4 +++
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index aa74fd1..4d4de97 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -635,6 +635,9 @@ struct wm_coeff_ctl_ops {
 struct wm_coeff_ctl {
 	const char *name;
 	const char *fw_name;
+	/* Subname is needed to match with firmware */
+	const char *subname;
+	unsigned int subname_len;
 	struct wm_adsp_alg_region alg_region;
 	struct wm_coeff_ctl_ops ops;
 	struct wm_adsp *dsp;
@@ -1520,6 +1523,7 @@ static void wm_adsp_free_ctl_blk(struct wm_coeff_ctl *ctl)
 {
 	kfree(ctl->cache);
 	kfree(ctl->name);
+	kfree(ctl->subname);
 	kfree(ctl);
 }
 
@@ -1597,6 +1601,15 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 		ret = -ENOMEM;
 		goto err_ctl;
 	}
+	if (subname) {
+		ctl->subname_len = subname_len;
+		ctl->subname = kmemdup(subname,
+				       strlen(subname) + 1, GFP_KERNEL);
+		if (!ctl->subname) {
+			ret = -ENOMEM;
+			goto err_ctl_name;
+		}
+	}
 	ctl->enabled = 1;
 	ctl->set = 0;
 	ctl->ops.xget = wm_coeff_get;
@@ -1610,7 +1623,7 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 	ctl->cache = kzalloc(ctl->len, GFP_KERNEL);
 	if (!ctl->cache) {
 		ret = -ENOMEM;
-		goto err_ctl_name;
+		goto err_ctl_subname;
 	}
 
 	list_add(&ctl->list, &dsp->ctl_list);
@@ -1633,6 +1646,8 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 
 err_ctl_cache:
 	kfree(ctl->cache);
+err_ctl_subname:
+	kfree(ctl->subname);
 err_ctl_name:
 	kfree(ctl->name);
 err_ctl:
@@ -2194,6 +2209,70 @@ static int wm_adsp_load(struct wm_adsp *dsp)
 	return ret;
 }
 
+/*
+ * Find wm_coeff_ctl with input name as its subname
+ * If not found, return NULL
+ */
+static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
+					     const char *name, int type,
+					     unsigned int alg)
+{
+	struct wm_coeff_ctl *pos, *rslt = NULL;
+
+	list_for_each_entry(pos, &dsp->ctl_list, list) {
+		if (!pos->subname)
+			continue;
+		if (strncmp(pos->subname, name, pos->subname_len) == 0 &&
+				pos->alg_region.alg == alg &&
+				pos->alg_region.type == type) {
+			rslt = pos;
+			break;
+		}
+	}
+
+	return rslt;
+}
+
+int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
+		      unsigned int alg, void *buf, size_t len)
+{
+	struct wm_coeff_ctl *ctl;
+	struct snd_kcontrol *kcontrol;
+	int ret;
+
+	ctl = wm_adsp_get_ctl(dsp, name, type, alg);
+	if (!ctl)
+		return -EINVAL;
+
+	if (len > ctl->len)
+		return -EINVAL;
+
+	ret = wm_coeff_write_control(ctl, buf, len);
+
+	kcontrol = snd_soc_card_get_kcontrol(dsp->component->card, ctl->name);
+	snd_ctl_notify(dsp->component->card->snd_card,
+		       SNDRV_CTL_EVENT_MASK_VALUE, &kcontrol->id);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
+
+int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
+		     unsigned int alg, void *buf, size_t len)
+{
+	struct wm_coeff_ctl *ctl;
+
+	ctl = wm_adsp_get_ctl(dsp, name, type, alg);
+	if (!ctl)
+		return -EINVAL;
+
+	if (len > ctl->len)
+		return -EINVAL;
+
+	return wm_coeff_read_control(ctl, buf, len);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
+
 static void wm_adsp_ctl_fixup_base(struct wm_adsp *dsp,
 				  const struct wm_adsp_alg_region *alg_region)
 {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 5275a49..8589032 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -223,5 +223,9 @@ int wm_adsp_compr_pointer(struct snd_compr_stream *stream,
 			  struct snd_compr_tstamp *tstamp);
 int wm_adsp_compr_copy(struct snd_compr_stream *stream,
 		       char __user *buf, size_t count);
+int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name,  int type,
+		      unsigned int alg, void *buf, size_t len);
+int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name,  int type,
+		      unsigned int alg, void *buf, size_t len);
 
 #endif
-- 
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
