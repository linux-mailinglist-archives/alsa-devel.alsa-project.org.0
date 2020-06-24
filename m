Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53105207151
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 12:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF771847;
	Wed, 24 Jun 2020 12:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF771847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592994975;
	bh=80MfcIAw92QRvg9ubPDQpPJvf5IRsvyywoYKDxgjB/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQ7hamSuYhbMo/pE3DR6YFqbGhc+bxMVsbVZjgbbB+2JZHOtjA/FurxYCQsXmN5Pr
	 CmBrqub+ZBpyMdOeKNRfAqxkfrLHIOvUiwJnSYBCKZGh4Jv9SSxIrgc0JORmMwC75a
	 ABjbIBpcKQEahUIJWTRikhS6PQo1WNkcgQOapmvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D2EBF802A2;
	Wed, 24 Jun 2020 12:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A04F8015A; Wed, 24 Jun 2020 12:33:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A293AF8015A
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 12:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A293AF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="mx0FBMJO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=is2cU8I+DreOCrF479No1PbO1eS/zKMmEzvZJ6g2KU61h/FdJ+aoCqd7LPtOdFHa3k8MBDeX7IE/Y10Kgv2/iNRqHDOmMEs6iBCQHxmVVhIwNm3BtAObiuB0Z+Hk+WcMHs938TUhlB/vMVzAQa/w0xif1QdDuiZHFhW0H6oAZs3qCe8yqHLP12+aR3qB0Kn1SolAl+BStqrFm0qDyBFZgQjm5CmzJLpqwq0MvONbhMW461J+gRIWQQMOpWE/nq5UHVmTzqiUvoxH2MOloR1tJ47g5jvuZ0c1EdMj7GmtmF+SbuTuNblBZJu12bzAi0U02AFcyG2DoOBBQEuRHqKdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNP6svsYgFgKnfef8+/h3dqOMyRzdkDZWcoLAm4/Qlc=;
 b=jQZTfiQ6blV4TTLbRZwUPZnk898ghWLJroTHM2CRwkMIJaMBmaMJaEcE2a25j60LvTPjPsyEYeRrq7fJvlA1806SXSClWu6zjrMQ1MzlUd3SI17eNM0gesK4v0ugxQ+MheTR3G8pUuBve6LOmC5zfyI3E3Xq2ZbHggWbHvgEGvggXuR4huy4OYB9CvXLlYCHoPN6GFotDdTdE+IJXWsgbGu7JI1rHAnIBqsbVW416BqN3r7WgWYYoAJLaXUmGwjL5sgnAAuwqVzzlsnYmU/qwqW8BnEPfDBf6SDC+MrZaD+p1WHHjrdoEo5Wsv1kdmrZt72N3S/l0OHFhFtZJolc/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNP6svsYgFgKnfef8+/h3dqOMyRzdkDZWcoLAm4/Qlc=;
 b=mx0FBMJOxzUAYiGrD++1x8bplcDV0kVxO4e9gdVoeEw9FXecqD0wYPQJlFyAWRW3Re2aJz5M6jLzM7Z3AuPZVqWuOsNRlKfqlBMofQkRe6wBuGLiG4gbeegI2ny/ocOMJoyHGKQwtUR3Sly6P/gjpGpPuFxX5n2u1HF/yd6vVpc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2445.eurprd04.prod.outlook.com
 (2603:10a6:800:55::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 24 Jun
 2020 10:33:18 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9d5c:685e:4b51:fa60%3]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 10:33:18 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: khilman@kernel.org, ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
 rjw@rjwysocki.net
Subject: [PATCH v3 2/2] ASoC: SOF: Use multi PM domains helpers
Date: Wed, 24 Jun 2020 13:32:47 +0300
Message-Id: <20200624103247.7115-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624103247.7115-1-daniel.baluta@oss.nxp.com>
References: <20200624103247.7115-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::41) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR01CA0100.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Wed, 24 Jun 2020 10:33:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20506606-785d-4286-1695-08d8182a028a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB24456BE047B8DA88944B07FDB8950@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4kigOxSjKoglRV07XNIa0i/JFjy+KFnHpjYUcf3KRIJHF7EDBB1WNHvNhbq1HTabfEGXIkX3JfD41E2f3zXVgnl07LN3uMChCqy7Dx1wil2sge/wwqn3MGxf+YAL9Z1XwCJhwTE7dzqM7cJWQxUsxk1nwmxrfki5vCBmbRSX7cmMTFkUOuIwXqJeomGfewBzRHhGzKDPu/RgJ2ojvJzuO0fxTj4z4Qws26HDaUEKB8JvsN/BCLozdWIJvV/ljY/Lb0N4YKchMCpPvxbkduuxi+pQ4zyQEUofAi7a1IjqWOkbKyAh3e2q2e8pRd526DNhDZzyfsurXTfS1XWbnPzM2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(86362001)(8676002)(186003)(16526019)(1076003)(8936002)(6512007)(66946007)(2616005)(83380400001)(66556008)(5660300002)(66476007)(316002)(956004)(26005)(6486002)(44832011)(4326008)(6506007)(2906002)(52116002)(478600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zd+QXYH5g90CW6nEnEXNVAlytKPXzMA22kCOja/COv6Du86+4J27B0ANRRbEZKTcG9Z4PC5e7VfY1+EDFQCwEMci8Ofgv8YfixJccxo16Gue4CT/eN88wRNyc+jXLisJbcFKsNgW1/EXwqfgl+oro7tyO9El4J+YTTXzM0CXBoNQg5TpiwA40DMowPUTVTDy18G31XEeqTRcw9lE/bZBNzZvuzGqB5Tw4o0pJgRTGusY/+YEDz597Zo1/Jji+Vl9sGEJaFHG/lOUBJ9MyklplaV8aitfgehiUAOkk37KP7g7gX8kRRFl0cTD8xFFwM0u0REQnA6/QKiB9l1SRqJiaJ/pwlttptQCY7d63a24XtpDmW2+2JPItNFmEwJKzMs4VWljXCfqYvLmaE5d8ygLsgjQAmHQuWDyCH1atWwn39xygDxw/BodZ0mYmNC/ljrUzw571oMKmi2WeadeataXePTkNAkvUXZhhL1Rcx8kHhw=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20506606-785d-4286-1695-08d8182a028a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 10:33:18.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijIwhoA5fYDcr0bN2jpvzEE5Mw++N+0jpoUFx0E7miwpHGjZTPGyITJ/rR2jC7s7RqWlUq8B0hWsZ3xud+FGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Use dev_multi_pm_attach / dev_multi_pm_detach instead of the hardcoded
version.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 60 ++++++----------------------------------
 1 file changed, 9 insertions(+), 51 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 68b2edccd791..7229993c5af8 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -51,10 +51,7 @@ struct imx8_priv {
 	struct imx_sc_ipc *sc_ipc;
 
 	/* Power domain handling */
-	int num_domains;
-	struct device **pd_dev;
-	struct device_link **link;
-
+	struct dev_multi_pm_domain_data *mpd;
 };
 
 static void imx8_get_reply(struct snd_sof_dev *sdev)
@@ -207,7 +204,6 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	struct resource res;
 	u32 base, size;
 	int ret = 0;
-	int i;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -218,45 +214,15 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	priv->sdev = sdev;
 
 	/* power up device associated power domains */
-	priv->num_domains = of_count_phandle_with_args(np, "power-domains",
-						       "#power-domain-cells");
-	if (priv->num_domains < 0) {
-		dev_err(sdev->dev, "no power-domains property in %pOF\n", np);
-		return priv->num_domains;
-	}
-
-	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-					  sizeof(*priv->pd_dev), GFP_KERNEL);
-	if (!priv->pd_dev)
-		return -ENOMEM;
-
-	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-					sizeof(*priv->link), GFP_KERNEL);
-	if (!priv->link)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->num_domains; i++) {
-		priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev, i);
-		if (IS_ERR(priv->pd_dev[i])) {
-			ret = PTR_ERR(priv->pd_dev[i]);
-			goto exit_unroll_pm;
-		}
-		priv->link[i] = device_link_add(&pdev->dev, priv->pd_dev[i],
-						DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME |
-						DL_FLAG_RPM_ACTIVE);
-		if (!priv->link[i]) {
-			ret = -ENOMEM;
-			dev_pm_domain_detach(priv->pd_dev[i], false);
-			goto exit_unroll_pm;
-		}
-	}
+	priv->mpd = dev_multi_pm_attach(&pdev->dev);
+	if (IS_ERR(priv->mpd))
+		return PTR_ERR(priv->mpd);
 
 	ret = imx_scu_get_handle(&priv->sc_ipc);
 	if (ret) {
 		dev_err(sdev->dev, "Cannot obtain SCU handle (err = %d)\n",
 			ret);
-		goto exit_unroll_pm;
+		goto exit_detach_pm;
 	}
 
 	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
@@ -264,7 +230,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 						      pdev, sizeof(*pdev));
 	if (IS_ERR(priv->ipc_dev)) {
 		ret = PTR_ERR(priv->ipc_dev);
-		goto exit_unroll_pm;
+		goto exit_detach_pm;
 	}
 
 	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
@@ -328,26 +294,18 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 
 exit_pdev_unregister:
 	platform_device_unregister(priv->ipc_dev);
-exit_unroll_pm:
-	while (--i >= 0) {
-		device_link_del(priv->link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
+exit_detach_pm:
+	dev_multi_pm_detach(priv->mpd);
 	return ret;
 }
 
 static int imx8_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8_priv *priv = (struct imx8_priv *)sdev->private;
-	int i;
 
 	platform_device_unregister(priv->ipc_dev);
 
-	for (i = 0; i < priv->num_domains; i++) {
-		device_link_del(priv->link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
+	dev_multi_pm_detach(priv->mpd);
 
 	return 0;
 }
-- 
2.17.1

