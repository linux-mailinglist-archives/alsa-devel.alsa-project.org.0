Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A287A36E5
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Sep 2023 19:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DA57A4B;
	Sun, 17 Sep 2023 19:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DA57A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694972379;
	bh=6z8SjZMLxneCiBJG763/yykLNzWt/YIop3JAmwUHrP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MBD74qaxd1Omv2eyZL5viLKJ3A7CaXyVwOFFWClrkckz+9lGWsDXYdcqqHrWFSUBu
	 2J9lJ6gwUjFJNMNfquzzqFQcsNHj7Ut33328ZBTtbLs4XmtlsrwaLqbA51J0GZmTQC
	 8ikkDlf4N4pi8xEV1foxuczkneiwUKifbUlz/suQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA9BF8057E; Sun, 17 Sep 2023 19:38:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20518F80571;
	Sun, 17 Sep 2023 19:38:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CE17F80578; Sun, 17 Sep 2023 19:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-215.mta1.migadu.com (out-215.mta1.migadu.com
 [95.215.58.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41A78F80558
	for <alsa-devel@alsa-project.org>; Sun, 17 Sep 2023 19:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A78F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=g4yyBsTr
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694972270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N323SG+p/mVo7ES7cWOerqa91xnNuXKTdwM6oN1zMZo=;
	b=g4yyBsTrB3fseLbnLyD7Kvsv9dd1GO321DCOd9vwtDJ3KLOkGHstcPcRRmPiO/W3mswFs0
	/IQ/7PJ8PafN3aG1Vu+Upx+2ZtzCaUvPPJoCqO9Kr5Bw5liM4cEXZBeAzoUbmg8F5eDgrf
	OdXPyQpWYNScywJbVSGE3yuZJKrDceb+MbQMB4RUXx0QqLFByAcDEtb0m4r8rZZxUvOrKC
	n/l7mAP8YiCe2LTvLu/pHuDUYeumbCEmmdrYs9i3sFbKIEjK/wytJDXtfGMk48pL5mY1EL
	bJ9BXykGRgneS5ztS+z22g4oS5AHB9MXsb+IVPAanIGAs/ycTFyx0pEJIzIu/g==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] ASoC: wm8782: Use wlf,fsampen device tree property
Date: Mon, 18 Sep 2023 03:37:25 +1000
Message-ID: <20230917173726.1916439-3-contact@jookia.org>
In-Reply-To: <20230917173726.1916439-1-contact@jookia.org>
References: <20230917173726.1916439-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: ITVZHXTD677Y5CMHBXVF75GPD4UV37RK
X-Message-ID-Hash: ITVZHXTD677Y5CMHBXVF75GPD4UV37RK
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITVZHXTD677Y5CMHBXVF75GPD4UV37RK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8782 supports rates 96kHz and 192kHz as long as the hardware
is configured properly. Allow this to be specified in the device tree.

Signed-off-by: John Watts <contact@jookia.org>
---
 sound/soc/codecs/wm8782.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index f3dc87b92b1e..3a2acdfa9b85 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -119,8 +119,9 @@ static const struct snd_soc_component_driver soc_component_dev_wm8782 = {
 static int wm8782_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct wm8782_priv *priv;
-	int ret, i;
+	int ret, i, fsampen;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -136,8 +137,26 @@ static int wm8782_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/* For configurations with FSAMPEN=0 */
-	priv->max_rate = 48000;
+	// Assume lowest value by default to avoid inadvertent overclocking
+	fsampen = 0;
+
+	if (np)
+		of_property_read_u32(np, "wlf,fsampen", &fsampen);
+
+	switch (fsampen) {
+	case 0:
+		priv->max_rate = 48000;
+		break;
+	case 1:
+		priv->max_rate = 96000;
+		break;
+	case 2:
+		priv->max_rate = 192000;
+		break;
+	default:
+		dev_err(dev, "Invalid wlf,fsampen value");
+		return -EINVAL;
+	}
 
 	return devm_snd_soc_register_component(&pdev->dev,
 			&soc_component_dev_wm8782, &wm8782_dai, 1);
-- 
2.42.0

