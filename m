Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DD2C1567
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 21:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15C55166B;
	Mon, 23 Nov 2020 21:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15C55166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606162406;
	bh=ABnlsKPOfpUuSdiUb0uO5qnpjb94kyO+s7S2G6yJ0BA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ToiCaINK7GoZrk4UJ3ClVR+R8vr5lSLtstMXu8V8ql1OzJasuufEpz+oijJF7nVjO
	 jsyz5GCKdo12fkJRMabDZ6eupXqdlJvQ+JOpeA52ZcjDBY1Q0RpIjUOA7u3fOHbQYg
	 +ZBTlTfE4mznYOGld1BGATEZ7BF3nlz71osKiAGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81CABF80268;
	Mon, 23 Nov 2020 21:11:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EEE7F80128; Mon, 23 Nov 2020 21:11:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BDFFF80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 21:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BDFFF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E6lXw85+"
Received: by mail-qv1-xf44.google.com with SMTP id e14so9465811qve.3
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 12:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bYBeLIWCrUIqclASPIXKC445auNw8MCDlGp7rK+0tkM=;
 b=E6lXw85+AjQSFOq8VF4M3sdAI+0EA/OGYcW/NRQPcOy2kB0V9+6FIcbf5TqSSVDivP
 XzX1hs8l6UUv7admuZflJbi3mF1KArR6fypzqwVbelXiS47V8fDKMFdX++Hh8/qdUSOe
 u3ihWBZ91HR8dHBio0r9aoO1uCmrx3BvqhDCRrW8V/RlCPkGoa2WR21fNgk5/88WqUCN
 +Fy62vY0ZozFTPnnpME8aEc0kW+/WNlJkbZJp7Ikr+CZuovumR5ehKNLWgUsU9sCk9Zj
 hyN/nfr9t3SubNsnmOI2CGOlAvCDx5wZHiCxzTtrmt3NyLSRla+I8ooqi32J3NDgP54Q
 HQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bYBeLIWCrUIqclASPIXKC445auNw8MCDlGp7rK+0tkM=;
 b=Smpt/RfcqUgcblnxeabzIfJd9fD4S1aXm+zzPY95I8rbuXoKtRK8Pf3eLdXEVTMdhc
 89I8b6fXZ+q7x1YLUD+FeiLhA0WX0yFDN12VV25haxJN6/976h0hmwciK8RCFKR3XiU+
 2WPYnH6G0mjqXAIuY5lZTht1cV8SZbDhzyNdCeT2/udNja99MgJpdNBHqdS+0b1U6biP
 8RVq5bvkTrSMpe4LZuMLITwx1UrHq1q6a/IfKX+C/1p3kOK2P6sxv1mA756hS0Sz46Xg
 XKFXyhbeE69ylENS6htmPL+lchzY+ryF8QlrwWM3Nk0+/gwKhhhJureEAZjZH3RQwz0z
 WTjw==
X-Gm-Message-State: AOAM532GHX0qJfjMB51EwTV8+O/IG6FjP0e+l2UnQyK82rbwQWqccX1Y
 8C7OTru/FtGMj5jl5XvrPug=
X-Google-Smtp-Source: ABdhPJzMsg5oc9vDWUzs22IzY5mYCckZghl+/PAbhGQafoAoYWQ4nKsDxVG+SjzW3T7nccqMw3ApCg==
X-Received: by 2002:a05:6214:2b4:: with SMTP id
 m20mr1161865qvv.34.1606162301736; 
 Mon, 23 Nov 2020 12:11:41 -0800 (PST)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id w30sm10850018qkw.24.2020.11.23.12.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:11:41 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: imx-audmux: Remove unused .id_table
Date: Mon, 23 Nov 2020 17:09:17 -0300
Message-Id: <20201123200917.16447-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: nicoleotsuka@gmail.com, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, shengjiu.wang@gmail.com
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

Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
.id_table support in this driver was only useful for old non-devicetree
platforms.

Get rid of the .id_table since it is no longer used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/imx-audmux.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 25c18b9e348f..dfa05d40b276 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -170,22 +170,9 @@ static enum imx_audmux_type {
 	IMX31_AUDMUX,
 } audmux_type;
 
-static const struct platform_device_id imx_audmux_ids[] = {
-	{
-		.name = "imx21-audmux",
-		.driver_data = IMX21_AUDMUX,
-	}, {
-		.name = "imx31-audmux",
-		.driver_data = IMX31_AUDMUX,
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(platform, imx_audmux_ids);
-
 static const struct of_device_id imx_audmux_dt_ids[] = {
-	{ .compatible = "fsl,imx21-audmux", .data = &imx_audmux_ids[0], },
-	{ .compatible = "fsl,imx31-audmux", .data = &imx_audmux_ids[1], },
+	{ .compatible = "fsl,imx21-audmux", .data = (void *)IMX21_AUDMUX, },
+	{ .compatible = "fsl,imx31-audmux", .data = (void *)IMX31_AUDMUX, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_audmux_dt_ids);
@@ -300,9 +287,6 @@ static int imx_audmux_parse_dt_defaults(struct platform_device *pdev,
 
 static int imx_audmux_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id =
-			of_match_device(imx_audmux_dt_ids, &pdev->dev);
-
 	audmux_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(audmux_base))
 		return PTR_ERR(audmux_base);
@@ -314,9 +298,7 @@ static int imx_audmux_probe(struct platform_device *pdev)
 		audmux_clk = NULL;
 	}
 
-	if (of_id)
-		pdev->id_entry = of_id->data;
-	audmux_type = pdev->id_entry->driver_data;
+	audmux_type = (enum imx_audmux_type)of_device_get_match_data(&pdev->dev);
 
 	switch (audmux_type) {
 	case IMX31_AUDMUX:
@@ -335,8 +317,7 @@ static int imx_audmux_probe(struct platform_device *pdev)
 	if (!regcache)
 		return -ENOMEM;
 
-	if (of_id)
-		imx_audmux_parse_dt_defaults(pdev, pdev->dev.of_node);
+	imx_audmux_parse_dt_defaults(pdev, pdev->dev.of_node);
 
 	return 0;
 }
@@ -386,7 +367,6 @@ static const struct dev_pm_ops imx_audmux_pm = {
 static struct platform_driver imx_audmux_driver = {
 	.probe		= imx_audmux_probe,
 	.remove		= imx_audmux_remove,
-	.id_table	= imx_audmux_ids,
 	.driver	= {
 		.name	= DRIVER_NAME,
 		.pm = &imx_audmux_pm,
-- 
2.17.1

