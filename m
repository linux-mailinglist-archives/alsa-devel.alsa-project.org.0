Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6826A453656
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:49:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F9386F;
	Tue, 16 Nov 2021 16:48:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F9386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637077748;
	bh=NUNo40AMwITmYCgzyRCqVYTB8d3VXbdnoe3fxfayUlk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qWaCPmDftsV3orUg115oOiE0RZIf3Oa5nv1AnwYiCcv9Oy1+kNwoVTduIHvLHytzL
	 0r8PtMY8VmYlk0nGeviIGcXlSaowXGu7JxUkhAQpaYeUNr5LuB5306RjivD8HF/dgq
	 O4+u8foGOew2wK2/2oLC4YfUMEKxKn6I2KgkH7JE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E00F804F2;
	Tue, 16 Nov 2021 16:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B201AF804EC; Tue, 16 Nov 2021 16:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A2A1F80423
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A2A1F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Q7hC9tkU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H07wkjqGuI6md6rYk5G13NCjo2LQ6UHMyguT9v7pYgAj6eAVC3WzUGVmfnBKC3TcFsN8VAmI+6WXlKiqWVtzoUIkKSrVcxNNNveUTVSsE2U37hb9Mw4cOwjjrmEes+2ghxmgsQiCxHTIpZOP0m2U+R8ar7NX1qSXwrtwaBoSyNaV1pAQkFUnVSSGyoJK4aExCWRXQsGgB0YJNGMuA+FojkQOaGeFw17ifDR07MJIM/TcpaGCWy6RbQhYaYfTXT2JALsjnux/ME95RQXN5eAfHpA2uhUO6UvJezBIBgR8LTg4Y7CEB0tWuf/50Em+iGpd0xKv1USP1Uq/m11psoHC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LQe9IPWGSX40mx6GtUVgAC3DVkLtlfK3i/BKjyQbsc=;
 b=ImuN8We4qE2r7egHWMsqfeNJaY+N7qW4yGKosRkaSlyD6ZVYl7UtDnrQHaSyyZN3sB+zQ0QfpLXaqxJkk4K5glfacHwF3Q5ZzRhS7yFuue8h8YKFn0iggTu012yUYdvvbEmVnYG4A6N6pDFxNE1j5ZY75gaKEw9BWEX6yDzwMgSze6qFATnmVSOIt9ZTMoo7g1e3oidSc3K05vJG5JF8dGr8DaONGJ/VbHy0DbFdMYYIwaUWuUE4lxIYcKVSy9Lz4wAb0TX7SuTZz6JEnLtAp3BAwKJ+haMc+IybrcnDqm4kgOcpqP5zxYkQpL3KYDq/9Kvent0pZGHVZ4Tt97oxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LQe9IPWGSX40mx6GtUVgAC3DVkLtlfK3i/BKjyQbsc=;
 b=Q7hC9tkUWN3qu28UXQg6luhLMoKu/2jGZC64PEiO+aILWHeviBXhgGpNTFMUwPfLKwfB6EV6Hv88gfuuku1388fgk9WHM5iLw2cxFIDSd2BjPdj4v5OT8PelzMBVd765ncBFElOOMn0srNZxTUQv8PSeCeAZdgwJQcgtOx2m6LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3824.eurprd04.prod.outlook.com (2603:10a6:803:22::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 15:46:35 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:46:35 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: imx8m: Implement DSP start
Date: Tue, 16 Nov 2021 17:46:12 +0200
Message-Id: <20211116154613.57122-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
References: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0076.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::17) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 15:46:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccbcd72b-4c9c-4e9d-4c7f-08d9a9184539
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB38247A24F7134E66B028FCC9B8999@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nNvc5LdI7dOy5iSvlEYd916+2NlNfK4bukcHow9AgHnZPQ+aQPpepzVtWFKi8NRO1jnNWUgiL9az0zQ6ZUc7wlt8hs3v9+Z197KysxzLfgedOSnJyN248fJV8Xcb8FPhIpxbgAoFQhe7KUxs9Sq9+bZ0yTjYd38L+yes7hjWqoqmVZ/cDTpiot48nxJr0tm1SRKAM43gX9cYZuou3b0xIph8X/nbtLxbUdZ0oEjNoqHCI0F2iqNuxSVDzlHSvZZ5FC+1RnmoPmt4NgNicWfuyehyBPW4jW898YrdyaQmGPoN8iG+RzZ3gVWYs6PGRKhh2ZMm9rOTIGhPKj6ou0Xv1dIozDjOQcfNUuotYyfayaV7MIq6Y+UShgJFVAM0zf/vSBD7vjx5JkX72b3UO3m++qLMhEpaqybrm+VQWEhuWQ0IHlFIQ1XQASF8UKHDWDKZT2hV8XN/gG8kKisbJ+flpY9NX2OHJ+q/tQHl18aQ5S8cJMqJGRlvKEufGXzBWvJHVys1A38q3bpl2KVLsRfPBOyiEg85C3IxVoP/ll4qtKKnuasemDQiMLraLE2/I59MFmd1aHA/xsqpA3B9OeoVxO5GfEoZ7fHdCruqdbwBgSzMFNHCB4l7gAOERzB7ApIUHtH9LFZdqVJnd6t3VgDV2GnWLicxLBfoUjTZkNPU0iYknqqCfSSZ0dumxRgdMMI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(186003)(5660300002)(1076003)(8936002)(38100700002)(66946007)(66556008)(66476007)(7416002)(86362001)(44832011)(6506007)(316002)(2906002)(83380400001)(6512007)(6666004)(4326008)(508600001)(8676002)(2616005)(52116002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9NByrk/Ab2AEKgf7nsYcZrG/zWnf4qnlUESq8qldH21EJRvPXNSC5gJxfTU?=
 =?us-ascii?Q?5pYsSK0PF1I0Sandp/MwaleYelgp/dvzaULoOGxZh5H+zIxlL17KMehMm83o?=
 =?us-ascii?Q?Yg+eftfaD7epy/pRmSa4l+ld/GuFq9gSsDGKe6EwM2dqi4ZDa99CEk2MVG5G?=
 =?us-ascii?Q?QE4+EMBylPp3+QeeBeLaZStiTImuAOff+12AYyvalQPz8WMsDx2cEmRiXe9k?=
 =?us-ascii?Q?kGDXfFhO5PWgjwRRxR0O6PD4BfQLHgRYj/iS1mxVcl1AWTQqqSSDOutDgqN4?=
 =?us-ascii?Q?z90LvXs8gDYjA1RKA1CHDDRcfPVd+1LRAdbv2+zKf0YPmG7GNaJ4/baTF6i9?=
 =?us-ascii?Q?GCIVxH9XzJmG/Ij82IJ3g5xrs4diOleV+W2aY5FjYfCdvMEdXViLsmvkNGQY?=
 =?us-ascii?Q?svnzX5CXXN/LvEGraLpx+gG95WHmZcsWbdQlKWxdA32yt55AciRN9s5JbT5R?=
 =?us-ascii?Q?0Z8vkGrcrYiNO4AWQWuyVYrrvRGNNMOfgGZKWfJnQh6Dfuj39rNP1ObEQjJq?=
 =?us-ascii?Q?vWWfgaFj6g5GkuCClLeivy1guPMhzb9Qm2/Ot08fMy9ZeODYUAB9ZXIM0JjZ?=
 =?us-ascii?Q?qU3/hBUKqcy0zjliGFP0kkpQSUgT+r8OHG0Qram8AHaDhJfidoa9x82B9E2K?=
 =?us-ascii?Q?ramxbQyhL0Z8baUUQrBX/aUemOJqF+YcP3KBRgo+Q83XoJfIbYZQAcIfj8z6?=
 =?us-ascii?Q?OCg/KnicwzVwkbgtCSZlJgSDWoMPeQGb/nzRBBwMXD4dMp7SC5k6ukIJiU4k?=
 =?us-ascii?Q?AsWzFu8kFT89ho3hbtVDMThht1NykRGlqBrJVJJ/8/edImvD9qy/bCI4hea0?=
 =?us-ascii?Q?lrFZJW2DHWqDd2ylZrcHj6RGAE/qsPB4ZjTmHgtEsylOAZy+nVn9OctQe9eh?=
 =?us-ascii?Q?xGTJwRWG+5V1ydQnimjplB2ET73jgXkWEK2T1zAHa6XEvBsTgZLpnqMtIzGs?=
 =?us-ascii?Q?cZiYshRyacp0KVa4YXixuFXvkY9cQnKmhh3dLTHVJJe10xgA0VKjjmfv4QR1?=
 =?us-ascii?Q?S3r96ltTQa/q+8VrTMQeg9rMKmfGJSBD0UVGv9x2A29pmguO5KPOxbHEKgvL?=
 =?us-ascii?Q?Lz19iB7LGveqp9pMoXqk4kGA8qJiz+r1JBOhdEiP8pdet66pH/pq1I5Y+qs4?=
 =?us-ascii?Q?L/zA8L0Zs9OzXB8MAU1AZTNFCWjacNxi3oo/mrsd8csOdp5y9clYValHrHc5?=
 =?us-ascii?Q?f90+fX1eCCT5xrUjntDeD381XdhBEy65LxZ0kiPi0hJ1tczds6Mrw1iLRA9f?=
 =?us-ascii?Q?Pq/uW+92lE0VGNX+RiDJcNlKysOOtEKcIMZuJ0aYljS0lnWh7LNfntS5x7YR?=
 =?us-ascii?Q?t4xAoPUnTo4ZhIwruHO7LtSqJ0c+1lW9GcoFopEK7bNWdXfk1YmhShOQQ4mN?=
 =?us-ascii?Q?IYvuyHC5cY2Ai5bfWDyeVKtPGoCRA7bMDNpvVOhxGP5dEFsOKUflfPxXGe4o?=
 =?us-ascii?Q?ayXp5bhascguoHo7qEGg7fLcD4oMEZgqX6ML+mXw+eA5vHy9ZKvxKiw763xG?=
 =?us-ascii?Q?8g5rRfj8WtrWmL54M2xbp0Vc/cosJ/3bSnb3ZSsFB50SyKW0bFIiVKb4sTOc?=
 =?us-ascii?Q?eiMA3OgMzh26KQmdalSOzHfxqvp4dyGxeiyf+/ghAc+PSm6HsWPs/CbZ3rT8?=
 =?us-ascii?Q?hBFpel5aXHowQpOTP20lwo4qbhX+vmmhoe1MM+cwnmdPZbUxq96u8EC2IOo0?=
 =?us-ascii?Q?5XFloKZ8E5jwwVudhJyoaktlMyk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbcd72b-4c9c-4e9d-4c7f-08d9a9184539
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:46:35.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPsrjFmP8IzO/rsvGRxa+d0ITGQSi4aEAYwFMf4DIfnBUY4uULe0V3TMEPr8b8/W1nZhcKd6Cd/F9fPMqG/3Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3824
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
 peter.ujfalusi@linux.intel.com
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

