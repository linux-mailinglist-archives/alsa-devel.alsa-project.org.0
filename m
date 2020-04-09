Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF41A2FF2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 09:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C295F166D;
	Thu,  9 Apr 2020 09:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C295F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586416991;
	bh=230QbDVBIRP7Fb5pPHb2FcdX7LzQnZIczaEJuEAkxMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBG+KdCqj9tpbI6h6mSd9xJSonak0DzRqhkr4qndDEwP0+V2zC1s1nHzXN+yxbADJ
	 rTtLH1sZ67cjxmhVQUejifdITWnttaQl0Qu2+V8sFFhzW/k+Pmo6qo/g4G1Ei/QwCk
	 QPQPIGAJcPvF3f/CET5rsbBbqOYPErUsthJBZ0OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A96F8029B;
	Thu,  9 Apr 2020 09:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18807F801F9; Thu,  9 Apr 2020 09:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47C14F80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 09:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C14F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="MZ2Zpe3n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4xLKlThJNJRP37jBaUqixfw8cm0r6H7ppedVNz+S4+ILSoaVBIDbAd6Eyl5XO0hLFgPcfFx5l/qe40olcCytdnp0Us1OiMLgTmSxJOIkuEgfAro4qlsvHrmFRIqXrbDtmxtsqx4y3s3yJlEdF8V4TDG5QIm/Xq/+AGVwGGnONzlWZ6kHhghR9R6ODA1pYIwJfSvBUWP029qJTzwWJzC4GdPj1KHlS+s9frmvfL+v9cRw/FiHKdW2tg30/KNIqwOztL2OtXWXWQCqAxEvR84TAqVI3AEoRmGaG0ycOuHdGg55LVF5Vng7sdf9rJdfoKs7j4x7393MciwsqjpFY7T0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/75uZVJuRyvM42nUIlOOHDEUg2Md3mX+iZHM+ujtfQ=;
 b=dOmJSVVyAooW7MXun3nDP4PJdejHeRcH77tTN+vC9H8372q6ZVs5SuRsEj+Ox3TE8LW9+Lap/FDyHbLnwMHkbGd6AqRQVoPAEi13PFBKGycQNsAc6RhHoeYoKcNMB6BEOulEjLW7TAdneu00xU8svYD2GUF1nzPbO3anv7iC2H4PopHT7IgMUFTOqW0HfByljxeKCqnvDFX5UrTLfawoBIwC+g+khOp70feEBAATY1D2da1OQ+aWTZS7oU4+yuEBE4RF2RNmSVR2JfoC7cSgE+HBHJFZbFqoCpCcZdH3zB4TjfIAdTapL0qzlhNpzE6DygGP9mJO/8rqTlNZy9Vx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/75uZVJuRyvM42nUIlOOHDEUg2Md3mX+iZHM+ujtfQ=;
 b=MZ2Zpe3n9wfTaq/WQe25kZwxDxLQPlbuaZEw+M1G22/i/LcaVQyzDgVGYo8PtVyMiMtRisX8bsB/sd6M5m23a7WmruYx8QNieRow5D7tSO3JiGnT8A3TEfU1ZJlb8PoZP59ROalmT37VAoC4jN+pcaetFirfYYxn++bLQdFgwuc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@oss.nxp.com; 
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com (2603:10a6:8:3::30)
 by DB3PR0402MB3756.eurprd04.prod.outlook.com (2603:10a6:8:12::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Thu, 9 Apr
 2020 07:18:53 +0000
Received: from DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c]) by DB3PR0402MB3835.eurprd04.prod.outlook.com
 ([fe80::f0e5:c143:32aa:ed7c%7]) with mapi id 15.20.2878.023; Thu, 9 Apr 2020
 07:18:53 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 4/5] ASoC: SOF: Add i.MX8MP device descriptor
Date: Thu,  9 Apr 2020 10:18:31 +0300
Message-Id: <20200409071832.2039-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
References: <20200409071832.2039-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::12) To DB3PR0402MB3835.eurprd04.prod.outlook.com
 (2603:10a6:8:3::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (89.37.124.34) by
 AM4P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Thu, 9 Apr 2020 07:18:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c82cea9-f93d-498a-ccec-08d7dc56423f
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3756:|DB3PR0402MB3756:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB3756570C99C22A3F4F8D9B75B8C10@DB3PR0402MB3756.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0402MB3835.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(4326008)(5660300002)(478600001)(316002)(26005)(1076003)(66476007)(6512007)(81156014)(81166007)(66556008)(6506007)(2906002)(66946007)(52116002)(956004)(2616005)(8936002)(6916009)(6486002)(8676002)(86362001)(6666004)(186003)(16526019)(44832011);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: oss.nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQFtS+ypWS4/DkuUU+TsDkYz5jmBRB7dSHV1E4cvP0BDwdjAAX5tQL3MJ9X2F0061krOqdTuoXM/D1uh3wfpnfYq/2vvnTeAQstKAu5Zq0bHBdFpgk+Ypb3TK3QH4KqIsjzx6evZYFl3CUUTJceijDUM4jnBEOJ7pC0tOGPL4tYUtqJt5ydKq3dz2cGtBCQm45vGQzMRW4jmybuE1d/jJ5vXcaHSEg39jS7LLuNKRPhHZlc8I/9XKoUpX4STtRjsPOSIxRmXWk+XHaNzqNIvb014a0IV6XMLnCXoQJNxCnvO385JR13nuvHYkClBR2bq0ywQI9jYsib6Kl1IQX2K8/L1Ou9Vl4CwJTd6SpHBZd23qmxVwGrKajwhdZwMtQgVS3nbAUD3BL7mp4uMiMu2s86TkYVcoQaSMNMhuwtWVYsaikuMDAYLlnbhaUx2M0dZ
X-MS-Exchange-AntiSpam-MessageData: ytQawywCaerAF3GaYyYGKx0UQUmCNTMFGxCUK3ljqRnw+IiCNA7g/nMKkBAzqJZLtgoWHaXYaOHrjGXv0ofNwSQ2XxrHBtJzaxOnA+U7/GpW+6OoZymSxYpOYNxDuKUwwKRnKPcImApSEcHVSVD8MQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c82cea9-f93d-498a-ccec-08d7dc56423f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:18:53.4579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX/ruktDay0ds5vUF8t0mw/TP08YIJmYPJoz4ePkhtIXiEX3c4H6ARF3AaOyEmmxjQ8+5dXsCHWHZ0viMtcDig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3756
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 shengjiu.wang@nxp.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-imx@nxp.com, festevam@gmail.com
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

Add SOF device and DT descriptor for i.MX8MP platform.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-of-dev.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 16e49f2ee629..c6167597d6fe 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -14,6 +14,7 @@
 
 extern struct snd_sof_dsp_ops sof_imx8_ops;
 extern struct snd_sof_dsp_ops sof_imx8x_ops;
+extern struct snd_sof_dsp_ops sof_imx8m_ops;
 
 /* platform specific devices */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
@@ -34,6 +35,16 @@ static struct sof_dev_desc sof_of_imx8qm_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
+static struct sof_dev_desc sof_of_imx8mp_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8m.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8m_ops,
+};
+#endif
+
 static const struct dev_pm_ops sof_of_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
@@ -113,6 +124,9 @@ static const struct of_device_id sof_of_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
 	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
 	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
+	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
 #endif
 	{ }
 };
-- 
2.17.1

