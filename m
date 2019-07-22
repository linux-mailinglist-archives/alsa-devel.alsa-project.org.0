Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D2701C7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C251B17F0;
	Mon, 22 Jul 2019 15:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C251B17F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563803644;
	bh=Eyct3ToQAIT48di24pFWpWs8z+iWY93hUYpAnp+XWqw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oHYFy2U6TIK920ghH6hjNvCvZFEhv8K/Ix7Gradd19WWMkml5qbYAPhDTf2sZg1JX
	 SaVZibY0/2KxSIaFzjsnmStz10ZJ6DJlBGwdjWUGjmyQKCDbKT6FCZz3bKgev721OY
	 Y7SMgO52VD11Hd5ezeQesEixneZxkuHaX0Gt/Yf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EEEF803D6;
	Mon, 22 Jul 2019 15:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA741F803D5; Mon, 22 Jul 2019 15:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A596F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A596F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="STIhqBNh"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6MDnNml012542; Mon, 22 Jul 2019 08:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=MxqzYXdhV50zgEBTtTBsuXRpXvLEZA6kJSarbG2Iiw0=;
 b=STIhqBNh2AlvPsQsLScBVjsYyCC/AJAWoNCkREWrmyfsVlUuUfG1tRqdnK1VZlgNuwYs
 U6vDAXrNAhigv/9xqiV3ei7y7YtRA7A6bnRztbb+bNCBMMQi+/7g+m9a+7GZDlwXWUHL
 1eh+Ww9eSsJ4qAOvfN2k46+r2tSt+1fwMhRz05vqyZPtEJvKiBcfTgZJe3osuvOYOi+X
 RbBFHmM+Pt9tgZX2NMwJj8gPol+CC6rO+7nyAeAnOrSxVRBe4RP5Stujw4BM70+Jo4du
 iQoMy+Z78YyWkFgjXDKme68K8YXTVmRCC2g59IXbx+VEznLCFjtumQwgIVngGTWne5n+ Mg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tv0c0afb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 22 Jul 2019 08:52:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 22 Jul
 2019 14:52:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 22 Jul 2019 14:52:09 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA7932C5;
 Mon, 22 Jul 2019 14:52:09 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Mon, 22 Jul 2019 14:52:09 +0100
Message-ID: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=3 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907220160
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH v2] ASoC: madera: Read device tree configuration
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

Read the configuration of the Madera ASoC driver from device tree.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Returned to using a helping in the madera driver itself,
   discussions around adding a generic helper indicated that all the
   error reporting would still need to be contained in the driver which
   constitutes the vast majority of the code in the helper anyway.
 - Updated the code to use the new device_property_count_u32 helper.

Thanks,
Charles

 sound/soc/codecs/madera.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 1b1be19a2f991..5f1e32a5a8556 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -300,6 +300,100 @@ int madera_free_overheat(struct madera_priv *priv)
 }
 EXPORT_SYMBOL_GPL(madera_free_overheat);
 
+static int madera_get_variable_u32_array(struct device *dev,
+					 const char *propname,
+					 u32 *dest, int n_max,
+					 int multiple)
+{
+	int n, ret;
+
+	n = device_property_count_u32(dev, propname);
+	if (n < 0) {
+		if (n == -EINVAL)
+			return 0;	/* missing, ignore */
+
+		dev_warn(dev, "%s malformed (%d)\n", propname, n);
+
+		return n;
+	} else if ((n % multiple) != 0) {
+		dev_warn(dev, "%s not a multiple of %d entries\n",
+			 propname, multiple);
+
+		return -EINVAL;
+	}
+
+	if (n > n_max)
+		n = n_max;
+
+	ret = device_property_read_u32_array(dev, propname, dest, n);
+	if (ret < 0)
+		return ret;
+
+	return n;
+}
+
+static void madera_prop_get_inmode(struct madera_priv *priv)
+{
+	struct madera *madera = priv->madera;
+	struct madera_codec_pdata *pdata = &madera->pdata.codec;
+	u32 tmp[MADERA_MAX_INPUT * MADERA_MAX_MUXED_CHANNELS];
+	int n, i, in_idx, ch_idx;
+
+	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode) != MADERA_MAX_INPUT);
+	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode[0]) != MADERA_MAX_MUXED_CHANNELS);
+
+	n = madera_get_variable_u32_array(madera->dev, "cirrus,inmode",
+					  tmp, ARRAY_SIZE(tmp),
+					  MADERA_MAX_MUXED_CHANNELS);
+	if (n < 0)
+		return;
+
+	in_idx = 0;
+	ch_idx = 0;
+	for (i = 0; i < n; ++i) {
+		pdata->inmode[in_idx][ch_idx] = tmp[i];
+
+		if (++ch_idx == MADERA_MAX_MUXED_CHANNELS) {
+			ch_idx = 0;
+			++in_idx;
+		}
+	}
+}
+
+static void madera_prop_get_pdata(struct madera_priv *priv)
+{
+	struct madera *madera = priv->madera;
+	struct madera_codec_pdata *pdata = &madera->pdata.codec;
+	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
+	int i, n;
+
+	madera_prop_get_inmode(priv);
+
+	n = madera_get_variable_u32_array(madera->dev, "cirrus,out-mono",
+					  out_mono, ARRAY_SIZE(out_mono), 1);
+	if (n > 0)
+		for (i = 0; i < n; ++i)
+			pdata->out_mono[i] = !!out_mono[i];
+
+	madera_get_variable_u32_array(madera->dev,
+				      "cirrus,max-channels-clocked",
+				      pdata->max_channels_clocked,
+				      ARRAY_SIZE(pdata->max_channels_clocked),
+				      1);
+
+	madera_get_variable_u32_array(madera->dev, "cirrus,pdm-fmt",
+				      pdata->pdm_fmt,
+				      ARRAY_SIZE(pdata->pdm_fmt), 1);
+
+	madera_get_variable_u32_array(madera->dev, "cirrus,pdm-mute",
+				      pdata->pdm_mute,
+				      ARRAY_SIZE(pdata->pdm_mute), 1);
+
+	madera_get_variable_u32_array(madera->dev, "cirrus,dmic-ref",
+				      pdata->dmic_ref,
+				      ARRAY_SIZE(pdata->dmic_ref), 1);
+}
+
 int madera_core_init(struct madera_priv *priv)
 {
 	int i;
@@ -308,6 +402,9 @@ int madera_core_init(struct madera_priv *priv)
 	BUILD_BUG_ON(!madera_mixer_texts[MADERA_NUM_MIXER_INPUTS - 1]);
 	BUILD_BUG_ON(!madera_mixer_values[MADERA_NUM_MIXER_INPUTS - 1]);
 
+	if (!dev_get_platdata(priv->madera->dev))
+		madera_prop_get_pdata(priv);
+
 	mutex_init(&priv->rate_lock);
 
 	for (i = 0; i < MADERA_MAX_HP_OUTPUT; i++)
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
