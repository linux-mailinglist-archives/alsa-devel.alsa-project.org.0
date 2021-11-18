Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCD4558C5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:12:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36EA18CD;
	Thu, 18 Nov 2021 11:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36EA18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230339;
	bh=tq8p14dgLQ88hgOrF7/zyMNbI/BoytAk0VK3aYb4eG0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbP0wm2E9QW1mr2zSWmQlTLBb38V0Qx1G09Zf5NmYypP1lpb49AP1gxB2IZjp5RK3
	 N1ZmeJT9tnW/gavcPNVr0aRyH8wfnOzOqQoDMGD3XHKmYY4QOKRav8QfgIwjSCae6W
	 TefBsZflWrrRYN38gXcgaKJpM33mmuSgjsTIT3o8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9643DF80526;
	Thu, 18 Nov 2021 11:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 817A1F804FD; Thu, 18 Nov 2021 11:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D9E1F804E7
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D9E1F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="b+T3jkI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNr/EDEktVeFK6ECm1rX6TxiDJuIbL4iacFa4PQ8bjoSQc9COR/+jB7Oppo9TS0kS3UNKcuzaTg3ESY4I2D52Gnb/zslaIgdup/xMlLYTw+x6D826R6GzgGWKcxVufDwJTZdCpNUVbWjfLDOPdYoaCKU0mjCahRB12maWiUMamyNoV6HU8X9UM0EX9JnwdddWC7SER+fEAlBXuaYNNySF1BIC/iOxFyNufTI3/aTJrgKE2S9nvxTrSrjfSTa/XpxaeHHxVD/c8rNk5WF/3ILDw6nqbdEWEoLv9HLkYtT+dWwUwhKaTussY//nlN1X+80RkKC90f9znTVT8ix2DQZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qA+AKWCWzOd4laj79fwXpT4DlJBt/zadXCV9ubK1x4=;
 b=cojsfRs9zDZqLXnAkdQatW8ZscJYz5DSn1ySOCaL5hpF9fGXw58wARfiW2M6ChWUYzxA6K+XSCEr3jMQ6Tj+vZoc1ck2aUzXhqBVYIx5XqgGZfjbrCB0tKBfWFrMuYWXFHBRMtZMWdO1+VisdvIo3f7AV4nGDn1R6DQ/jtHm0rf/7AGLNH18MANIkGaGpGlCRFNMEcDUB5ox0cqXj4JQHsu5WXDOAAFJ+I5BGKmu5wLYIY8eaDZ6fKmkQaKUgVYui+qoVhs+/S0UJPLBSxELLlE25IWdbssPNTU6wGo+e4sRKO4rmqtKF0R8y/QUT3uTJ0fbdS39G3A91Onj5yPPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qA+AKWCWzOd4laj79fwXpT4DlJBt/zadXCV9ubK1x4=;
 b=b+T3jkI/zUmYAgBOcheD/pAkRqtKqAY3PFJG33UeRhFWSwNAgquZnl325LRa5SsoqPS6tH1kZxyJUpfh63++KuqvlMxAq3dFExESMH8xI2MeMcTIMJD8EWz5twXiM7Jh0DKQxltQfO5rBmFG7tj8TmNTov219H5f9T0ONly7+QY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:22 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:22 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 8/8] ASoC: SOF: mediatek: Add DSP system PM callback for
 mt8195
Date: Thu, 18 Nov 2021 12:07:49 +0200
Message-Id: <20211118100749.54628-9-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37125a9c-68a6-47f9-91e1-08d9aa7b5a0a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB428521705DF3C263560129ACB89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtDiLpb0DzPA+LjLsSZw9w7rNm+dkwEXNP5RNrvyNHU+oJOwIx2GJR4UHOXvdSv/Xqkoo4PukO5mT8M7p3r4Kf7RsRM/UXzj6JrEBbkPs0t73/ii8cPeCff/V25D6aQgEApP5Lk/ULxYETb2Mr1zriuYSur+pP9ua88lok4coBWyhpg0qzd2gOa/Q8imBktpe2Xt8K0H6IfHEuiwFgEADUFKzDAyVRgq4lNe02F2BwVr6FaPFM4p6BXqCHBbrVM6/zMCLRiabvJSZIi1b3su4PlbPcSs4+bmK/bU762q8O+8JBO1nNqwyx97Z9MnO4i83s9GBsLgoApi8LSA8bA8O/gDBdL4+TNIdpD1k9Yhszc6bZOtza1sQiPfR3sgOMwU+ZPOFOuDwwXwXVm36eBFjOEW9GAmATv/tb3cWxKN0Hd7yK7OertPH+reSVMhE/BkltVxT59ad5hvhkDUXkfDuhQC6FwfvWXtv9un5cXioxroQH8rO9YTNW1OawLHFvwtLLC3lIP78Pu8fVcU5bK/GzJdbQLdP2tXR6hqOwf0yJux+HnwobWnrJhrkueqVtqXxC2fuPYOKfs2ErgJjb1IRQXJM0Vy73WntZmDKGyWIPap6bHWNsGzy0s55RChUoWuCvFWmNgxdimiFZG55Iey5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8676002)(2616005)(4326008)(44832011)(86362001)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(83380400001)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJh3SwtL0XWr/6xhGr59nVTXQDWLjpp1vSBR+DRvTdZJMB5zc+t5aXkOpq/d?=
 =?us-ascii?Q?N0dBiLaR9oZKqQB6neJYNh1SsoEYjzlWFkyQeaJSfpxyEg+ilsY0Q7eOWwj7?=
 =?us-ascii?Q?AfzLd4hKZPP9TyM73LEF0YNzTDdoMxWLVOYUoPTrsF/hyZcbGXOCfp9HAj/N?=
 =?us-ascii?Q?2hdLgeiEiHcgOxg0CwyzVA02tztNbed683wydWvP1N0etyGKb9y+oDzYTSKa?=
 =?us-ascii?Q?JsQoU+JidOh0YxdOMVPL40qTif+Wf5raX/2oeUC+nOe3ui5XsS0Lx4uRT4uP?=
 =?us-ascii?Q?cCjCJFfEdczEqe3f1Zt4Q+fYksIYvy4tCf+SwIysHnM66H36QJh8Sbvi3ZKX?=
 =?us-ascii?Q?7lhj7HFqkgPzoIDUs+i71GhcD//gbzTcCD5qS68jMIENETjTMCu2wznEjp63?=
 =?us-ascii?Q?HIdNqvm4yTpAIaIVCuewPTISL1gFVU8n1J2yluJFuftzNkTUODUKxeTr2CY5?=
 =?us-ascii?Q?JbwbCSklOYAaAdJZXejRI0YNmDX3yH0lkdOEeQj7KbvQ0RKDwAmXxwYvXZaD?=
 =?us-ascii?Q?QYF3kf5sFIbj0fvYk8aUHkzhg0tKAvFzKUzd9FK5tQ6seT7oWstbxGuq3Xo1?=
 =?us-ascii?Q?S49vNIPGPMCJvyqqITKKT/oTwmgpzd8uqHrSm2VTK9nOc70ayiE8P+AtLSqf?=
 =?us-ascii?Q?fJvpVGoGbiWQAkoQ+wrBkxAxbX17PYkngT8LbYnlfx9FmT3PQVcevuNHbqMd?=
 =?us-ascii?Q?l2mL5Bi1apAGWtpv4utm/HuNxeECtafhpaD8X5+X1ceBKUvWo6DbTF7UsJv1?=
 =?us-ascii?Q?YqtbkvHvUMCvd9IT2VKutE1JZEF5CTQIpUjBq+VaMObhMz9DOPdmTgz+q7ko?=
 =?us-ascii?Q?4mhTFtIIeyiB0uvsoqdoTwQEzHaBv87ZT+SWdRZIpVQQ5E+/nwB2BHPo+nlO?=
 =?us-ascii?Q?FbpdjStvbqV22caDGnkpm3CJ9xX8c+PlMTrQextHkvdFsF6zIj5UG0gyImDt?=
 =?us-ascii?Q?NHpCWfish74hsGoaxeIc4R8f/CXnrw+FHWmMnzdocddN72Jje0ETh+V1wdf+?=
 =?us-ascii?Q?pZW9b/8HlFy5rApF7m9C2t50U3HUpT2ZipoiCfO3U1czI6NQhQR8xMUKdl6I?=
 =?us-ascii?Q?6nlODphvGnf0QB18LcPZlV/vQ8X5OpRPGk7fMTay41GzogMoJZgouZcP6KnQ?=
 =?us-ascii?Q?hpBQ1QSxo4Q5nRyWIsu71JGtYRxv2UiAmwefIFpolpBWtK5c1KatKMH2Cko4?=
 =?us-ascii?Q?m49HP85lGfQpgEvYOlt5KFG18JHcUwtMp0e5HeoPVxVD+cNkFltfxq0nXepj?=
 =?us-ascii?Q?H3SfF1GDwv9w2/20IPW0xdg2nzDCc/jIcD08+SgeI5oGEAxlm8JPQ7MwQ1+v?=
 =?us-ascii?Q?n1UTCIQZv1pIekladAl4aq4MgrQXf7sIWBTlw039UT84WQsMwh9qhVfclXY/?=
 =?us-ascii?Q?8ZWzpq+TVLQGiziT6uheIq6yN6noAXChE6/6IbAFW3yterWIuQ8uLPKgiCOO?=
 =?us-ascii?Q?ZH6oAvEK9zKNRziLvlccuOLnBJ0qmZJ2rUnGSS3WtZArrgPNbNJRfRDj6SaV?=
 =?us-ascii?Q?rTGaTxh4Hglr0JcmnUhR1jSX0xTrS7hvT2GrtNqO7DKwOlge8qdlgJiky0/R?=
 =?us-ascii?Q?oM2mm1X2homFkzMY4TY2asJJ4e1TT3GcrjNA3x93rHKJLIWGCgW52n20f7Aa?=
 =?us-ascii?Q?p/7veawW/J6YLeuOSrAHft2+ufdXxkJnaKGO+lVB7gruS6NAmm3KEvjuNDup?=
 =?us-ascii?Q?OGjJMDryooOK9BhnQ98nBsq906o=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37125a9c-68a6-47f9-91e1-08d9aa7b5a0a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:22.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8i5Ubp9v8rWqPUmuLONgX4GRaV9XyEa1Qi/kh+fQnGd+aF6P2UelgXLOEma7+KicDMQ0tz2mfXLHSo98gdO7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, daniel.baluta@nxp.com
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

From: YC Hung <yc.hung@mediatek.com>

Add DSP system PM callback for suspend and resume

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 5bfae9379ac8..40e5a25875a6 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -311,6 +311,44 @@ static int mt8195_dsp_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static int mt8195_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
+{
+	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	int ret;
+
+	/* stall and reset dsp */
+	sof_hifixdsp_shutdown(sdev);
+
+	/* power down adsp sram */
+	ret = adsp_sram_power_on(&pdev->dev, false);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_sram_power_off fail!\n");
+		return ret;
+	}
+
+	/* turn off adsp clock */
+	return adsp_clock_off(sdev);
+}
+
+static int mt8195_dsp_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	/* turn on adsp clock */
+	ret = adsp_clock_on(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		return ret;
+	}
+
+	/* power on adsp sram */
+	ret = adsp_sram_power_on(sdev->dev, true);
+	if (ret)
+		dev_err(sdev->dev, "adsp_sram_power_on fail!\n");
+
+	return ret;
+}
+
 /* on mt8195 there is 1 to 1 match between type and BAR idx */
 static int mt8195_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 {
@@ -382,6 +420,10 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.drv = mt8195_dai,
 	.num_drv = ARRAY_SIZE(mt8195_dai),
 
+	/* PM */
+	.suspend	= mt8195_dsp_suspend,
+	.resume		= mt8195_dsp_resume,
+
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
 			SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.27.0

