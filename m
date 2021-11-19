Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B3456CB1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 10:46:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 560A517C2;
	Fri, 19 Nov 2021 10:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 560A517C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637315181;
	bh=NUNo40AMwITmYCgzyRCqVYTB8d3VXbdnoe3fxfayUlk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t/9EDfW11ErbfhrZfgJhf7CLO7DAlN3U3n45h8KJVMXOiwOrINFHRUW9w0C2ml+fd
	 ez5vQ1JiWE61tgB0k+zPXTrB043Bunbi/ttsS0ODvsnpXNEWvLAgjPT9yD1T7xDNwH
	 dXEVsSD21hkx3lqHdn7dmK5J8TID6tFe0NmAgUa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A359CF80515;
	Fri, 19 Nov 2021 10:43:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 790BFF804D6; Fri, 19 Nov 2021 10:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C5BF804D6
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 10:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C5BF804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="glIKOViT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EImPeWD9Y6/143X9PIaeeGUtX9ovHFz2Vm6m36AJ8DWUP6QZepBBCiF1UcONhShJTKGOqFfiPMhk0F6MdX1n3etrVfsWypVqwI8VAPHJx5caF6d6IsgEkg/rwrGizpY4rly8yd0+jGdj33FDfpXUKXZ7wRt7Vlug7bcaSxI89mnSkFoH/c+hCKiB0x2otflhyFLk+BElcJEdS0GJbW3lkcuE8LGKybQUcLkuQfq0imiKK6sjWB8Pri9pfU4JezVPLC6SmL7HdL9mSyw/KDqaBI4tUZV6kceBfKL7AF2luD/vwcgFR3j5ujj7jB2mHTHyMutLdJZkqqTCerBsSKXTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LQe9IPWGSX40mx6GtUVgAC3DVkLtlfK3i/BKjyQbsc=;
 b=P235rJW2CgVkNs1njsMdEKA619RVQWLc+CvaeF9ZG4QIp+3c41y7UcH3NczVXvV7wPIv2cZi4GG63WQEUeM0XB9+wq5i1MXJXI/pF+L5jVlny6Y5TTAc/MZSTELnIPkc6TWQoJcIfa0Q6s9gGMEZm3GXoObrYIarI25hKUH4i5PgPxQINsFkzXybrjItB91nnmXSG4agx+8nDF01hn8iHVF+jyHxAya6s10VzOUuLFjypEo5WjnESV39t3z2UxN4lR4liO2ZN3mFxeSA9lwsZ6IpKyW2UZtyGCSHJXSNHNzMnqzbs5EfzJPEm37x2gheAmnYADqd8ALysmq3PP5d4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LQe9IPWGSX40mx6GtUVgAC3DVkLtlfK3i/BKjyQbsc=;
 b=glIKOViTpJ4gD10mN52yVlq6exKCtj4BnKuT6Tm5ztRbjz+MFOltbswXCm4qi1qLXXLCrAwBwvV6XcEZUJq9e49SteH19a19Bn7pjPm67FlVG0I6FLiU7Jj7R8TjHgcCdfhopDzzxGRgiI7W9SQQCjfyz64BN4YQRVBz0LFKFcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3037.eurprd04.prod.outlook.com (2603:10a6:802:9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 09:43:36 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.029; Fri, 19 Nov 2021
 09:43:36 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 4/5] ASoC: SOF: imx8m: Implement DSP start
Date: Fri, 19 Nov 2021 11:43:18 +0200
Message-Id: <20211119094319.81674-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119094319.81674-1-daniel.baluta@oss.nxp.com>
References: <20211119094319.81674-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:187d:3f5e:91e7:280d)
 by AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 09:43:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfcfe744-e94a-4362-5bae-08d9ab410eb4
X-MS-TrafficTypeDiagnostic: VI1PR04MB3037:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB303777A98150259C9AE6FBD7B89C9@VI1PR04MB3037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xW/njJJl9Efq56OMmZMrIHxN9BFUcN5nh+x7m4WPGLpBFsQQC49CcXOmHRsLnS95CEUsmRQ/FVNWW5c39InF/j+Nj5GZoQyOYZ/GOCs3nyIfus7RAqoZ8p8wM+2+qX8ic37sK9I/Tb6BRx6JsipTREd8a7CKvoROcSi7I3nmhrXBytHc8A9Z9mlym3q+P5Kr0xs0KKoqsQQJMx/Iw3z4XNJ+I/PERmT/53s7DrQIlWTQuCHyajbHa/91YI3rPjleNt6NqJgSGtds7O8t2SX+X8s8EJeU+hc2qFHOR5/IMxnoIlX+fhOA/S+/bbVg6nb6BZ4TpCBMYLP1ZZr5VCqJNY1KG6Tco+uue0MeZvdluo7JAhwoa4LvuBlfKk+OqlEjADrcL20b/mYhhu2mzzJUVn9SH0pMZKsSZcOvPch8r0pWmQUSjrnFH/uFI7jqAt2PuyOgkdnylqSSQQ9BPwcApifXHzE7kVFn9ki1sn2p+6LD7yKvRPlCDzdf8CsdTUN7+w+MfqJcWYkyGZc+H1QhmqCJUIDXMEMvTxkzcN9RoU6bN98qPOOQG6tPZyIqJBSuGe/GcUV3zUMKcOm+vMyaed95YNfhYfosf0cZgZjUtdcfotIWrQo4vu8aJg0lpdli32by/xN8bQ+5sOMc4NRla5q13BM9wzs5CxUjeGMlCIvrjjpsNPvm60aCLpoWU+42GqPJT9G70r/z1TnA5eIe5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(4326008)(5660300002)(8936002)(86362001)(8676002)(6512007)(66556008)(186003)(66476007)(6506007)(52116002)(66946007)(2906002)(83380400001)(316002)(38100700002)(44832011)(6486002)(2616005)(508600001)(1076003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2KuZGFBPbS5uTvnZeCJ/z/OdUszgIOdbXSEpyxqoziueAR2EA85ZBp9jOX0D?=
 =?us-ascii?Q?vBVgEXdhX/vbq5WGlJaDB4i+dd4OabDF6ftzm00Py840LDfv4NdfXK+1X/mH?=
 =?us-ascii?Q?n2nVBad8oBtrcKaPQ2V9+2wGMDcrfq4leN5D7ZbFD69ichX5rxxwSOQRSMo8?=
 =?us-ascii?Q?VfqI9fZ5U5ZfOsQVQbdwaNjrQLpJeflfsAqqGN99CyUkndlejYftUIZQ/fra?=
 =?us-ascii?Q?rC+Cm3LDOf+KvSUUsox0nO7TLn6MnHNj1mIz0MjL0Ko+4swojlx+EtuS10HG?=
 =?us-ascii?Q?asZkQyB14U7031WcxXeGzU495hdiY2bckETU4v6D1tJIseHBeeyISgVJr7pp?=
 =?us-ascii?Q?fdKQ63LncoUUa0oxQObsrLFOxn8LxmF3iTXpuBblhSTOJ0P0EbEgCaQFm6Mi?=
 =?us-ascii?Q?+jTTg4s1LMIyDzjOA0/IN09CoEfmDPHNdl+dxMugHhl0DxPsz6+k/ZN3gYYL?=
 =?us-ascii?Q?QADscdzoHserR3VmaqlfKgbgAaXrSGDv/YYfhDdMf44RT5uj5KC1Aj1976eE?=
 =?us-ascii?Q?dcucwSGMf5rgt3ldjN3IBnke+XOYULHjbm/6QjKWW+dXlhbLP0Q1zoKl5TlG?=
 =?us-ascii?Q?omrQ01x1RxC7aU7WeLwPKKz+dbnxfZ34lR0ysgNMc45uFDodZlIIg5SxJ7Il?=
 =?us-ascii?Q?AWtLYWBYyKcNbqlo4HWbEhp6iNXqXPETvXs0yuEmr9gf3yS6WAoqB//aViH5?=
 =?us-ascii?Q?5lnSmmOvUeeHeMu98Q3S9EfUXpVzJ2WbDrY5TQ9uyyUhnDcYj7F58PumDSFb?=
 =?us-ascii?Q?VELNRAApmLxhdpIOOBJfO30aCFoAIFyLIM2dX7uhXIrYfIobGl9/HzmJ+xwb?=
 =?us-ascii?Q?OJUCfkK/QZRHmkDHqkcVn8ewQ9pUhTQiLbWMjaSH26E1VlVoIfxp5YqdEEMs?=
 =?us-ascii?Q?INMtq4Ar9fjIzLRKpOhPu2y3W9T9XL7uvukQj4ObixT6lBKiazhUc9LS0HBw?=
 =?us-ascii?Q?W+3GONYW2rr69rpz/5rMbD4X1eiJjYsBBkX74G05VSYVHExoVSIQD9DYKeA/?=
 =?us-ascii?Q?RkNZcqyUfbr3F2SwrScAfIDHbidGjJC5Lonp4aSITFAW5MWpal2QaKKr3yTA?=
 =?us-ascii?Q?NOgijLvA0w18VRIUnkh1uzTRVNmes+YP/9eqkxJRdkP33nI1xEUbPtDPGfSE?=
 =?us-ascii?Q?ciR6X4KxSycUw0i4sebKSTH6TLg8EOf/yRDZWJSCffcv60rEqpJ5S6ny6ssT?=
 =?us-ascii?Q?7MSJclr9AG62ievvMPyt2L1e4s27Q453xNt4EdjWC0O9f3vrlno6UOO7AEAt?=
 =?us-ascii?Q?X99hmAeF3jaOD4eFpXNARxMAXQGU5TDuErtin2FpFfOjXaXb4JRx78F18fio?=
 =?us-ascii?Q?40lpSBA+MXJHeMZViLI9GjN4kSXLKo3Wt7IexC1lATtgZaA8VtgJ49S5PucV?=
 =?us-ascii?Q?R36S3+7RX3ynwBNIL5lgtg6MMkYcyC3GGZO0EF21zMVQ1DG9lHjnXlzuKUhM?=
 =?us-ascii?Q?RyzX8f6OISNOnsUOfX/NyzG99KMvbP49c6wo8oPbneSwr1Nu6RkFWNry88pE?=
 =?us-ascii?Q?ToPujfIZ7JR0s31FErDlcRumW7P+DwZ9XzOCCST9uLUAcnyC8zAEa6YF1nDI?=
 =?us-ascii?Q?YrGBPK8JexcEc9zHAdsNPLr+2P+sDt1huxphbaTL0Y21+NrknnR0yv89n5r6?=
 =?us-ascii?Q?yi7UDauca2hCVYc9cAKr/gy8ADN1NDXm3SeyoVpDJdwD2YF+4lJOMW9sIzx7?=
 =?us-ascii?Q?tBki/8v6l27n85f4WGu/4juCuOCSt8OLZ2vC5E3YBa1PLCDN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcfe744-e94a-4362-5bae-08d9ab410eb4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 09:43:35.9089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYB3HgDp+IW5sefJQyhMRzLckw6ntuthWR8iD3oeA1nK/PqcJJjkcXKGSEknZxPGg8FG0RPECketzsay6NTiqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3037
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com, daniel.baluta@nxp.com
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

On i.MX8M DSP is controlled via a set of registers
from Audio MIX. This patches gets a reference (via regmap)
to Audio Mix registers and implements DSP start.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8m.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index b050d4cf9cd5..9972ca8e6ec6 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -6,10 +6,13 @@
 //
 // Hardware interface for audio DSP on i.MX8M
 
+#include <linux/bits.h>
 #include <linux/firmware.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/regmap.h>
 
 #include <linux/module.h>
 #include <sound/sof.h>
@@ -29,6 +32,14 @@ static struct clk_bulk_data imx8m_dsp_clks[] = {
 	{ .id = "core" },
 };
 
+/* DSP audio mix registers */
+#define AudioDSP_REG0	0x100
+#define AudioDSP_REG1	0x104
+#define AudioDSP_REG2	0x108
+#define AudioDSP_REG3	0x10c
+
+#define AudioDSP_REG2_RUNSTALL	BIT(5)
+
 struct imx8m_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -38,6 +49,8 @@ struct imx8m_priv {
 	struct platform_device *ipc_dev;
 
 	struct imx_clocks *clks;
+
+	struct regmap *regmap;
 };
 
 static int imx8m_get_mailbox_offset(struct snd_sof_dev *sdev)
@@ -96,7 +109,10 @@ static int imx8m_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
  */
 static int imx8m_run(struct snd_sof_dev *sdev)
 {
-	/* TODO: start DSP using Audio MIX bits */
+	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
+
+	regmap_update_bits(priv->regmap, AudioDSP_REG2, AudioDSP_REG2_RUNSTALL, 0);
+
 	return 0;
 }
 
@@ -187,6 +203,13 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = MBOX_OFFSET;
 
+	priv->regmap = syscon_regmap_lookup_by_compatible("fsl,dsp-ctrl");
+	if (IS_ERR(priv->regmap)) {
+		dev_err(sdev->dev, "cannot find dsp-ctrl registers");
+		ret = PTR_ERR(priv->regmap);
+		goto exit_pdev_unregister;
+	}
+
 	/* init clocks info */
 	priv->clks->dsp_clks = imx8m_dsp_clks;
 	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8m_dsp_clks);
-- 
2.27.0

