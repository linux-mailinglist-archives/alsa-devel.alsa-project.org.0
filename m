Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38496710C06
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 14:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B215207;
	Thu, 25 May 2023 14:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B215207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685017794;
	bh=X26WXzE4/2WrqzAzYhAQquKMaxlBOzuTu7FvMl6rPrw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qGUMSMw1CHaFdju+Q3ajudpr3UtzZXVsvLNnyFRAUuWjIQbl1f7krIu21OKVvh4J8
	 RVSmegKh8PUMPGQ7+CG/cGH+RLMWh0ON7yVj9WXIblM3zsyzNIvq+rZ+prU61e/dPY
	 ZGhIa5iKrgs412TGLyR+p6e8sbNi1ity18hDLAWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DDFEF80542; Thu, 25 May 2023 14:29:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A52FF800DF;
	Thu, 25 May 2023 14:29:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8999F8016A; Thu, 25 May 2023 14:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6384BF80007
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 14:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6384BF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=hMUcMxKg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSIXEm8Sh+7mIfY0J8ay6DePO1GPji5YAQqUw63qBg0zdO4R3Uc+XFjHI0mwjvGm9SDTC4HLFlFwWkWNusL2zqhZIQ84MEsL10y0Y4InSDqjWaJS0lVHijAIkQpm6MfS9SNDGlXvq1tZzvmtAAT0ZaMVQwXg8kDAf2gLJ5VY3NWv3OKxc3QQXsJ6AkRtcitpoI74bzxFXAa8bwVBY++2gMJf/1dopOSmfze6He8bBU7IXFTU6tAK6M3Fh0coVMSeUv6a/IN0ZH0FF1ZneOB8b5b9Ie7S0FX75KRcryL/wPW0cjLFhC6tU76hb6bVAKAlu0SirtEy2r1YbCz+AkSAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6ZNMSkR/btqJPZF4LEQM2FDLnN4kLgLCoFV5dCTOkQ=;
 b=m6CiASLcbIZoaQ8PQ1WWzf9EZ4f7BZskGBfrtpdtL6OY/buST32qJKO47ZF68WxQfx+GIDPOUkm1/NopdtecWNRLU37U6jKXS/luZmF27kyBvGGmSdFwjqRt3VK25jibJ9gvr7YE0pQTXqCELXgZB6O7XCLK+Vhu78YqX/mQ5Jjv7JiqcoxNiKQqWKPYWqiK2o+fMdfX7seIxZJdg0E5XROxc1HJFAT8vmt/ZzzkljFLz5dE4O/ZFjPKthm1arTQOuzqtyXdTfsZ6slNIIS+a/pVD8WZL9pBg0DSqlxKWF86Ogn2xNRplLhzsxA8qc8/vLMx/GSLo069s+fu06gwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6ZNMSkR/btqJPZF4LEQM2FDLnN4kLgLCoFV5dCTOkQ=;
 b=hMUcMxKgf0zu12/0Nxp0wj6CcDqGmzbMpXjdg5lb2gyFlMPM4q7gyKZU3LOhQSSrpG9bDIX0UfKrJoIIFgsjaT5asD7EFTK/Gr32rtrjyaqy17fDY84Tfz51GMbNUtFixK2QnY8CK4rDxdOOFpeh09XdB9ygANK36groyUuK4ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by DUZPR04MB9783.eurprd04.prod.outlook.com (2603:10a6:10:4b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 12:28:50 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::42e1:4216:edc6:52a9]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::42e1:4216:edc6:52a9%7]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 12:28:50 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com,
	lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@gmail.com,
	kai.vehmanen@linux.intel.com,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: SOF: imx: Add OF machine descriptors for i.MX
 platforms
Date: Thu, 25 May 2023 15:28:37 +0300
Message-Id: <20230525122837.649627-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P251CA0013.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|DUZPR04MB9783:EE_
X-MS-Office365-Filtering-Correlation-Id: e5108cb0-743f-4e53-daf3-08db5d1b97fa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qaSkmuk3uGqhrDvbdN0vggTe/TEJ6zfpOraXl0mdRPC4EuEqFh1bw7/ZrXaBAnGBQU7b9rGDVvM2B+Th7VdGQmXkTYpCDbWpHwPWVvhY1D+mMdP2yHQfcHRrZaZDy2JduZIywMj7c0ZcNkt6xGk5cUqhIZk0DDaDMhYM1c3vwXTIGGgxhrq7vxgNv6QlvgFf1hFQc+Z8VEI5S7grBJetmGv8JCfT8ibcu+iCwDPo2klWwAL/WpGTHv2Crn/gChBF7hvrKB6rjmx2t1U0+xxVSx79pmfdSJ6Btg8q8D0yDqB9/KMa1XVOsJ8PdpPqeJ9CEKZXWKLinp9EjLo5QCzMoN1vmQkPCn+2HZG4AnTC5WGtNXLm29tlnKO44dUtsYHLIcud81YkfPnGKbhOEby66GZLD1hIRGJrgf7PdUnGSWDBYbx68jKOQT8vEGxgYhKUtwRsFGy2+pFjLVCfBNRSh7J17xbvZMc3fwLItPU4eE5cfg+6hTYKyP5JuqO5+Ao2W8UJqfgEVYglhPbrbIhncE2gI89wCGp7nIvwifGFU9dqrd36bS/WaI7x5dsX0woZlCPMTkhVPolBzUHXNhXBqqVz8wBva57yqzzLaLL4f7Hs3xDvKaGDmOFiKq1Rjoze
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(86362001)(316002)(4326008)(66946007)(66556008)(66476007)(478600001)(52116002)(6666004)(6486002)(8936002)(8676002)(41300700001)(5660300002)(44832011)(2906002)(38100700002)(38350700002)(2616005)(1076003)(6506007)(26005)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B2zioXVHaFBaQ8rGhTbB71AqQ/wV/tAPzx/xYE23potqrCjfgpoUabedN9Uf?=
 =?us-ascii?Q?bfP178mLBqQN5cbc5fal4MprTw0pIBV0ZZASegyTqhX9qz4JlBpQeY0THuOp?=
 =?us-ascii?Q?cIr9Ivvu9055uVWwSC46O7mciVqJEbsjaY1FXMiuy4IeP9AC7TzT+1o+3QUg?=
 =?us-ascii?Q?qnIvZVq26Mj8hccNiROW2PX6S2tZuyPBxMG0f23ASOcXV0ZzmkLItytOPY+m?=
 =?us-ascii?Q?CNLLXUNZiP4NPd9LWCqhX8IuQop9yyNfA3C0ELfisp2D6fQOqAz55Xyjc4kw?=
 =?us-ascii?Q?3GTk1SSNbu/r6TscVfTwcF1NgZ2yfEEoB2jl5E6VU8x1x41Pr74P0J6Iq7sz?=
 =?us-ascii?Q?/oz9cjF2l5ugWEOP6Q6+gkd7ei0FYNu+EoeSWSiGmfgHqPgJ9uUA4nP5l8WQ?=
 =?us-ascii?Q?VFk/cougQEmgDvnUafJKrXKpepDUlRkPEs3pd845mbiqTFe0R0FTzu6ZGd38?=
 =?us-ascii?Q?9IEaDu3qpTgRo+LrO2N3ic/QlN4UhfaE6Nev+k3m8v4qsx7NhWmr8yyoIwN+?=
 =?us-ascii?Q?eod38Pfan1TKX9wR0uy6LtO3phd/D0ZOg86wf8lZIRUH5vy3xMyO1zY6FPiU?=
 =?us-ascii?Q?hSLG9mHSeae+lioa0jLwHaLg/1zdoXNIUF7z+pi1iV4byQjk+hAWT5e7GZwC?=
 =?us-ascii?Q?WPLri259RuZkdvj6MstxgsPMgfVEjLHLkhQIGjnf5NMPx/OIDNEVZps4bKqc?=
 =?us-ascii?Q?g2ffQkF2Y0R+DYG/p8pLolqaKevjcx81Bdn6fQnsfXVTfcamLciurEMbbB5M?=
 =?us-ascii?Q?nmRCopiNa78wp8ZZRxFidpHUe8iPcTh4KGpfmTxhETyXLD9r561P9A5w5lvv?=
 =?us-ascii?Q?iPwlpooAONEXiqPM6dwFFkDM1NR7h9K/2M2cHd0ITSV/lQvnCwmxGgWe0VlX?=
 =?us-ascii?Q?YcN9sPTxba8AyPZqO4xqt5KjoxN0WapZh2++qVMWAVN3jY6ZK5x62M7L0RwJ?=
 =?us-ascii?Q?XquByEggJ9a4WQdQoWFMXxTS60l584cBKCdj+aWCS3YwqfYPRF8QSqfGeWNz?=
 =?us-ascii?Q?G/udaw+T1pO/u2LIfHn38lxL0cCZEgvxFbOmGXd+uSdZjHOji9GDV7Qz6hNX?=
 =?us-ascii?Q?1WCic4Pa8f8Z9KkZPt07tKHnGjYABTjA+C7TJIf9/V2a/RROaOEfsH2rrmVJ?=
 =?us-ascii?Q?sC3aiBA0euNtw3wS8LjdSF2MqsykSvUVz7Rv4hVExDwsY6j2mAz2gHmEqf5D?=
 =?us-ascii?Q?Q+R+8X//0DoqrzuVRHZ+3L5hAL+Qnj1i4P1XMqRrChj7e822zeturXMOI1P4?=
 =?us-ascii?Q?kMqCLo+HJTidEI7HtueBzTHbWwFo+rTJOXt5W3SLwOctZlbvYNtC+mHbfvsj?=
 =?us-ascii?Q?bfA1pjoRAyRAHt3UPib9+3ksEema1MxNSpoEqliMwh8v0OrV+S8VwRem6MO4?=
 =?us-ascii?Q?ysOGr/amKFCuaqvHVsIQj2OxyHcdM3FHWEDZl1YxP3qT6Bpn9PSw5due/YNy?=
 =?us-ascii?Q?obZgqjaxfZ8gO24ttJYB72M7xl0AO2I3BWtxf1devl0R9a22/9kcH2lhxkH+?=
 =?us-ascii?Q?LKeivZuCqeWXp2MBbEmO51iSEW98NE7zXe16ZupJEeaQmLXqUFcD4PNem2sO?=
 =?us-ascii?Q?+wSKwLdaeFW7GCkfa3Upc0eDKB2xYBhObwukDUdh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5108cb0-743f-4e53-daf3-08db5d1b97fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:28:50.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RaP0w6VgH1UYi8wD4jmaEcSzf/iNYMuzbjXlEQKq2kFy5KrLpl4Wbxk99byVfxN3klAV1E6eWlzS1qAoN8Q7pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9783
Message-ID-Hash: UOKNJEYVO3FW3WMTC2R34HST6S2SQWBM
X-Message-ID-Hash: UOKNJEYVO3FW3WMTC2R34HST6S2SQWBM
X-MailFrom: daniel.baluta@oss.nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOKNJEYVO3FW3WMTC2R34HST6S2SQWBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Paul Olaru <paul.olaru@nxp.com>

Covered platforms: i.MX8QXP, i.MX8QM, i.MX8MP, i.MX8ULP.

These descriptors are used to locate the machine driver and topology
filenames.

Note: because the compatible values for the boards do not change between
the cs42888 and the wm8960 cases, I have selected a common topology
filename, which is intended to be a symlink to either the wm8960 or the
cs42888 topology file. For uniformity I did the same for i.MX8ULP.

Signed-off-by: Paul Olaru <paul.olaru@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
 - rebased patch on Mark's tree.

 sound/soc/sof/imx/imx8.c    | 16 ++++++++++++++++
 sound/soc/sof/imx/imx8m.c   | 10 ++++++++++
 sound/soc/sof/imx/imx8ulp.c | 10 ++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 2844d9a8040a..3c9f0cfd8218 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -608,7 +608,22 @@ static struct snd_sof_dsp_ops sof_imx8x_ops = {
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP
 };
 
+static struct snd_sof_of_mach sof_imx8_machs[] = {
+	{
+		.compatible = "fsl,imx8qxp",
+		.drv_name = "asoc-simple-card",
+		.sof_tplg_filename = "sof-imx8.tplg",
+	},
+	{
+		.compatible = "fsl,imx8qm",
+		.drv_name = "asoc-simple-card",
+		.sof_tplg_filename = "sof-imx8.tplg",
+	},
+	{}
+};
+
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
+	.of_machines = sof_imx8_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
@@ -625,6 +640,7 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 };
 
 static struct sof_dev_desc sof_of_imx8qm_desc = {
+	.of_machines = sof_imx8_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 1243f8a6141e..a4050f6ec263 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -470,7 +470,17 @@ static struct snd_sof_dsp_ops sof_imx8m_ops = {
 		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 
+static struct snd_sof_of_mach sof_imx8m_machs[] = {
+	{
+		.compatible = "fsl,imx8mp",
+		.drv_name = "asoc-simple-card",
+		.sof_tplg_filename = "sof-imx8m.tplg",
+	},
+	{}
+};
+
 static struct sof_dev_desc sof_of_imx8mp_desc = {
+	.of_machines = sof_imx8m_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 4a562c9856e9..82fcc672bb1c 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -477,7 +477,17 @@ static struct snd_sof_dsp_ops sof_imx8ulp_ops = {
 	.set_power_state	= imx8ulp_dsp_set_power_state,
 };
 
+static struct snd_sof_of_mach sof_imx8ulp_machs[] = {
+	{
+		.compatible = "fsl,imx8ulp",
+		.drv_name = "asoc-simple-card",
+		.sof_tplg_filename = "sof-imx8ulp.tplg",
+	},
+	{}
+};
+
 static struct sof_dev_desc sof_of_imx8ulp_desc = {
+	.of_machines = sof_imx8ulp_machs,
 	.ipc_supported_mask     = BIT(SOF_IPC),
 	.ipc_default            = SOF_IPC,
 	.default_fw_path = {
-- 
2.25.1

