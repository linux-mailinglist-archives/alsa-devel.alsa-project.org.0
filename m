Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3BFEDC59
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 11:20:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2C01785;
	Mon,  4 Nov 2019 11:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2C01785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572862808;
	bh=yINkti6WBpgibTl8gEYYvZ04ZSPDttFw9N/uh4VhSJ0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ByyzG7O5W6YQYFgqDSKMwUHT8SPU50Ib9mTgGjoV3gCZOu1hmMiAcEgH52K4mxsqr
	 VBTpWaPNIXz0o66IUBZ1I4TxOdOEY6eIpzHS7xDCHz/JheW6XosdSp/BJOPIrehgXB
	 20yEXEaWDOd9JBgNPuW7Y2DVAJDipitBOjx8OAj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCBB7F804FE;
	Mon,  4 Nov 2019 11:17:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00B9BF80394; Thu, 31 Oct 2019 20:39:25 +0100 (CET)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 396D7F800F6
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 20:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 396D7F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PDNh+7u/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9VJTKTO002257; Thu, 31 Oct 2019 14:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=KkJz18nh1/ye4Cx2fBia9eKa7yeDkgC0XwoKOI2MyWo=;
 b=PDNh+7u/rM70Yu1qCoEzVNQZEFo615+CevCgfJv8CtVzOIrpJ0eqIhGrFC0LefYjjyxS
 YEvMqElnxchHNBHuwvHwdbuEl3GqTD5v72F/Ok2R+qhp60Kwg5g5Bo+hO29YjCW2b9/j
 rgWHUyAce0rWSYBoSGpAKAo5ewmCE+vUmYEJZ3OUzIYjvIHPXr2iyu9d5J40rqsvm510
 EKKzfDzBXG6H+p/mnPMa0qFyS3wsIYVd3NffxzN4bdcGMVRFMcRnXmwVzNSRWLka+Tw0
 fHYM6VmMBxXJtoT2oD6XdnpnaQ9m2FoiJml7KHdi+6Rop/4EQ8hFW9OWeA7zt07u4U+Z Rg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=David.Rhodes@cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2vxwmdbdkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 31 Oct 2019 14:29:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 31 Oct
 2019 19:29:18 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 31 Oct 2019 19:29:18 +0000
Received: from david-linux.ad.cirrus.com (david-linux.ad.cirrus.com
 [141.131.206.99])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 161152A1;
 Thu, 31 Oct 2019 19:29:16 +0000 (UTC)
From: David Rhodes <david.rhodes@cirrus.com>
To: <ckeepax@opensource.cirrus.com>, <david.rhodes@cirrus.com>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Date: Thu, 31 Oct 2019 14:36:43 -0500
Message-ID: <1572550603-21560-1-git-send-email-david.rhodes@cirrus.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:107.20.210.250 ip4:52.1.14.157 ip4:141.131.128.20 ip4:141.131.3.20
 ip4:213.128.236.230 ip4:87.246.98.25 ip4:87.246.78.26 ip4:87.246.76.56
 ip4:87.246.98.35 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=2
 mlxlogscore=999 adultscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910310193
X-Mailman-Approved-At: Mon, 04 Nov 2019 11:17:36 +0100
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

Expose mixer control API for reading and writing.
The exposed API can be used by codec driver for
interacting with mixer control in kernel space.
This allows codec driver to implement more involved
interactions with DSP firmware, such as Fast Use
Case Switching.

Signed-off-by: Li Xu <li.xu@cirrus.com>
Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 70 +++++++++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/wm_adsp.h |  4 +++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index aa74fd1..77b8aea 100644
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
@@ -2194,6 +2209,59 @@ static int wm_adsp_load(struct wm_adsp *dsp)
 	return ret;
 }
 
+/*
+ * Find wm_coeff_ctl with input name as its subname
+ * If not found, return NULL
+ */
+static struct wm_coeff_ctl *wm_adsp_get_ctl(struct wm_adsp *dsp,
+					     const char *name)
+{
+	struct wm_coeff_ctl *pos, *rslt = NULL;
+
+	list_for_each_entry(pos, &dsp->ctl_list, list) {
+		if (!pos->subname)
+			continue;
+		if (strncmp(pos->subname, name, pos->subname_len) == 0) {
+			rslt = pos;
+			break;
+		}
+	}
+
+	return rslt;
+}
+
+int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, const void *buf,
+		      size_t len)
+{
+	struct wm_coeff_ctl *ctl;
+
+	ctl = wm_adsp_get_ctl(dsp, name);
+	if (!ctl)
+		return -EINVAL;
+
+	if (len > ctl->len)
+		return -EINVAL;
+
+	return wm_coeff_write_control(ctl, buf, len);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
+
+int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, void *buf,
+		     size_t len)
+{
+	struct wm_coeff_ctl *ctl;
+
+	ctl = wm_adsp_get_ctl(dsp, name);
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
index 5275a49..2a8cd09 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -223,5 +223,9 @@ int wm_adsp_compr_pointer(struct snd_compr_stream *stream,
 			  struct snd_compr_tstamp *tstamp);
 int wm_adsp_compr_copy(struct snd_compr_stream *stream,
 		       char __user *buf, size_t count);
+int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, const void *buf,
+		      size_t len);
+int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, void *buf,
+		     size_t len);
 
 #endif
-- 
1.9.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
