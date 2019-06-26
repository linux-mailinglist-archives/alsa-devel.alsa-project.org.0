Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3D556DDC
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 17:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79D21699;
	Wed, 26 Jun 2019 17:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79D21699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561563488;
	bh=xFs4riGyNDgjYOC17bEirnvsSRGRaC4quFMejXUbK3M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2alHGqFDuwAHm50PThwRN2XncgtJkkHnKTwDN3Y81SRnOY3mrqAnX64PLM9y13Z5
	 +UwQR0OSYoVKDkYnXNrpo/9Aai7T6H0xafMD3uc97hNZDB3J8ry3EYvRYf5r919YpC
	 fq8Aa6xiToc77x/UajTTzBUNzLaTFFTwS5/ub+8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16AADF896B9;
	Wed, 26 Jun 2019 17:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ECA5F896B7; Wed, 26 Jun 2019 17:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D95F896B9
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 17:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D95F896B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XdWeeh8/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QFXYle022897; Wed, 26 Jun 2019 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=AV/T2mCUaARe6CJNXa05QO9AoXOQYuMlU5+Mm4v9h3w=;
 b=XdWeeh8/g7cPQCN9AaHL6MEFcrJWxb2XFE8ed2AmWDVpcwSTd038KUHfAbYtBKH2Luwd
 FybTGQHiFQMcD/3Dx31Z7l0u8rq9QSRYTLxgaxTG1qpteafkaX1pRnDUtmGJxxtX1Pmj
 f6kC9ZifX+v1pcvmDxvseaKLnO/Pw4C9RsyELM1r9tHWWGtinl7HS7yvLGT8cyyltGOM
 8YaTq95cb7u6gC61LYO+bYL1Xsq8v18UXkWGPX9LqrnpvKyZ0+yb9YxlDPCWsFpulcr/
 rCQxjc8jXo4BwyWU0WEt3tIWhE5Op4surSd6h4Yu9aWdIfYGMAUezzh87Cl1mdwizV/5 Ng== 
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt8cvx-1;
 Wed, 26 Jun 2019 10:36:12 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
 by mail4.cirrus.com (Postfix) with ESMTP id 410D6611C8B1;
 Wed, 26 Jun 2019 10:36:14 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 16:36:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Wed, 26 Jun 2019 16:36:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF64F2DA;
 Wed, 26 Jun 2019 16:36:11 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Wed, 26 Jun 2019 16:36:11 +0100
Message-ID: <20190626153611.10170-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260182
Cc: alsa-devel@alsa-project.org, rafael@kernel.org, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, linux-acpi@vger.kernel.org, patches@opensource.cirrus.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: madera: Read device tree
	configuration
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

Read the configuration of the Madera sound driver from device tree using
the new device tree helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Note this patch depends on patches that are currently going through Mark's
tree so probably best if this one also goes through there.

Thanks,
Charles

 sound/soc/codecs/madera.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 1b1be19a2f991..8fe16e4e19c7b 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -300,6 +300,68 @@ int madera_free_overheat(struct madera_priv *priv)
 }
 EXPORT_SYMBOL_GPL(madera_free_overheat);
 
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
+	n = device_property_read_u32_2darray(madera->dev, "cirrus,inmode",
+					     tmp, ARRAY_SIZE(tmp),
+					     MADERA_MAX_MUXED_CHANNELS);
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
+	n = device_property_read_u32_2darray(madera->dev, "cirrus,out-mono",
+					     out_mono, ARRAY_SIZE(out_mono), 1);
+	if (n > 0)
+		for (i = 0; i < n; ++i)
+			pdata->out_mono[i] = !!out_mono[i];
+
+	device_property_read_u32_2darray(madera->dev,
+					 "cirrus,max-channels-clocked",
+					 pdata->max_channels_clocked,
+					 ARRAY_SIZE(pdata->max_channels_clocked),
+					 1);
+
+	device_property_read_u32_2darray(madera->dev, "cirrus,pdm-fmt",
+					 pdata->pdm_fmt,
+					 ARRAY_SIZE(pdata->pdm_fmt), 1);
+
+	device_property_read_u32_2darray(madera->dev, "cirrus,pdm-mute",
+					 pdata->pdm_mute,
+					 ARRAY_SIZE(pdata->pdm_mute), 1);
+
+	device_property_read_u32_2darray(madera->dev, "cirrus,dmic-ref",
+					 pdata->dmic_ref,
+					 ARRAY_SIZE(pdata->dmic_ref), 1);
+}
+
 int madera_core_init(struct madera_priv *priv)
 {
 	int i;
@@ -308,6 +370,9 @@ int madera_core_init(struct madera_priv *priv)
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
