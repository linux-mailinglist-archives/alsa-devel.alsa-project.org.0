Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 833C5453654
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:48:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F239B1697;
	Tue, 16 Nov 2021 16:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F239B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637077724;
	bh=qmzWD08Kfa8VlD+nxKsplmD7jlP0ovWLFkY4Le3ntNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZvLpNwV3inGOnhPraCqRYbgqUAqhgmvuhX4VYh33NdCK/V2s1jlYJ1ij1o1YxSkUw
	 qVt2JsHpkroSER0ArPxJGhneIFxxvvv8FBSOY/cWClTFAy8TqddZ69/UUkI9efpnD6
	 oInxeyOv3x2LXCYyyKnDiTr+Ur5+qJQOLEDykNVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26194F80134;
	Tue, 16 Nov 2021 16:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE3BF804E7; Tue, 16 Nov 2021 16:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C131AF80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C131AF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ME4+RFIS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mlejee4M58q8adjdyhD/F2Oq+3KEJOQUtJ38LoB4C9jStuIcr+z7PUK+6ZZZvsD/LcUyNIyrvMPIS4SqkYJeYafy5UacB2ZKV5HKrokRlnY2xfXR3lDPSeF1EqvAm7TCNOLcvANx7LMNM5HkVCu3/yHaZE2IZv3ZufabWTQ93L/pgGFjv5W3R0oDhh5P2ZLT8Jr2PgAulvktGOyB4Qz1pmrnRfRJ+QQEyqnwyZUIFrIfrr3KdA1thwlGDRb9UYhaCc6TH30XGm3D5uLVgK/XvxCjq/uwlliy2IMbSF1xX0jsiupOgyoTD+QxHmRR7mIc7q2sXpeuCXG0X/DqChPUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxh10uJCvH4bSN1kqJK3p+nh3xdYf0fnlgTDIY2+/gk=;
 b=bQaxMcd2SAqcxLuS8QEB9TemIwpd/bxZRxF6GBxB8D3PoYy4WNNhIVFu9iQkOnOetX7mAzaMykp7M0v2RB73F5bJJCBR9gMoSeZ41RxAiwSF1i6G4LhzCBjl24Zi92QNcaG5+Dx9ftXNdTx0fYi6iRnGUPLEIsHMgFvM7g6FRfJPr1ZGVfCktGCTmhTL2Pie5HeJyaxoOjwTMRL6rNBfN7u4m/Psu/mYXo/n6uzeBr2eIUhJGNt1EiStKEiuxQ9Y8UJkfnLVCXUYHnxDIdz4SZPwpU0lgw0FWHijC45zi5vBcKrYSL6RudELh2DYdOqx6tBW4JuTUiFZFzwe07Y83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxh10uJCvH4bSN1kqJK3p+nh3xdYf0fnlgTDIY2+/gk=;
 b=ME4+RFISQO9F6IbNXh/wqVophbddsKo21Uua1r1d6m3z+nOweLIffNjl7qUyS1GM0Rm69EOoQlTS8gAdH4AC12l4epQEh/EmAdqA2VddT/wBDZHugu9bctgjsA0fDcdfh8S3WHj0LDsmG/PXd/pFSZntDPxLt81Ks6iQ5Vd9GsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3824.eurprd04.prod.outlook.com (2603:10a6:803:22::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 15:46:33 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:46:33 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: imx8: Add runtime PM / System PM support
Date: Tue, 16 Nov 2021 17:46:10 +0200
Message-Id: <20211116154613.57122-3-daniel.baluta@oss.nxp.com>
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
 Transport; Tue, 16 Nov 2021 15:46:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ba31d0-c80b-4bdf-3c20-08d9a918437b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3824A503B43DDE73CCC02DE5B8999@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIegHaYrzkY2swLq5qt6PIALEOVoZJMbsB6Mc5GGx47dttDGOqg92IM17HiWfODvfkaUzMZv2QBSdOZQY7fznF/+Xa90xHRPo0FTqWdS4ONUQMELTFyiJq5+S29294+HWK1xInvIG7y8+eLXfVPLRpQBFmkJ9PtLloVGjkgOAa8ltkFNIKdzB3F5TfiBC+KlRrKi0UgyY+8zWH1w99Gaa/PwnzNOjJ/c82PJv8w9IlJIOzExjCujXKkeornzINrcPZ6yaEpkm9SZrdLcJs3khygM5rSTvZDrb7KEHTi441bHbaZgz5jILbxobadZhRMzpQk+0EHBG4aUy7jWVPQ7Qfh1YyZCuB0k3hG+U9CjYrbdqa1hrWwLageq2d17diG36veSZ5G8xuWFS5WQL2B5BkAPgKAhJAbBtha0Zz6Gl9DWC9SB8hxWufHaNKJZOX9MIFiRxiSPIU+l8rA9hT1I4oVeqH7O1qKgAYDxxkA0p84+Gn4838HtlFPfw8FjkEIGw+Ta3QcwgTGOuRT2L0K2IPWtCqqGQjaPUrGr5UurStVMXlY/ReedWfEPsyAwx/vuNwys6DS1IuEaSW9JAiCdg0eSMCqs7y5lslL+zB8C0iKBUigorlBwkSwc5EIYdN9Bz/y1Hjrhc4JN3xteLCrhYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(186003)(5660300002)(1076003)(8936002)(38100700002)(66946007)(66556008)(66476007)(7416002)(86362001)(44832011)(6506007)(316002)(2906002)(83380400001)(6512007)(6666004)(4326008)(508600001)(8676002)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1zEI+rZf64ZKZZW7Zs98o/O2ZraTKi2iJm0rlQL+LcEQSNvvelDr9Z2VnzP3?=
 =?us-ascii?Q?rtmmxOzSEUr41gLvBvhT/Xa56myeeky3lOUMBTaO3aCSaaVGVMYzlQfF8nNi?=
 =?us-ascii?Q?W221nq53V2mwiCjWr2UTSVD6+Nv9jkyqvJTA0f6EWAfAH1G3m+bH3K5vz/e5?=
 =?us-ascii?Q?efZMREui6ILPsKPlKS6ZnykV4O9MMD+urgsz7sG9Q5/8Y0PwjxMENJ4BQTSF?=
 =?us-ascii?Q?IR5eRX0T2xqMtQtCnR+jy4+9OngSiztyjuGBv+jGr7VeSpb7z+BOdhUFuAr+?=
 =?us-ascii?Q?OGJj4sFQqE2BnmjMYzdpCcFz7n1hPiP7dFQNG87fee6f/LxSFQdWr+bpKle+?=
 =?us-ascii?Q?vOWaXQcdXGmzUZZUiAeUp6SqAEh3CxttQ/mfPLd+Xa2is+6BOkEWPEZexQ4/?=
 =?us-ascii?Q?f0iAL98Bov5sYil0tII5OIgymle1BTbg2K/OJf6x3R9aPSDMfDdu8ZQoi5Ge?=
 =?us-ascii?Q?cxE2sEYTfGtcDvuNjxKA+R8DHxLuJKnYi4NLzASAlzTss8bjoM52ya7L0YB+?=
 =?us-ascii?Q?mcqiLFPaMP0xbl1E3Q9bE5KSt8/Lun0JYohTiso3oM5ITw8j6y4aGTFUMIFU?=
 =?us-ascii?Q?A3sxAnrb0GoKoUcgINQbdnfB6LDtTHHzRbwEVJiSESZA7UQm6sZTlwRZ0gTU?=
 =?us-ascii?Q?IlX1z9Ss8tPYVjN0Vb8Ph5th4fmZ53jeUj3W/KrTZ3rXvmwSgT0XRuEWIS+B?=
 =?us-ascii?Q?uI8cWor++HxTgQE0dnwoHmcRpoNpuUh/w9ZOH4kQE1Eam0YG4hL6PRsUPr6Y?=
 =?us-ascii?Q?Um7YYCubr+SYiB/cCronBdjBK+h1xm69nvdQzWsRiL/MwhRRmhj9FbW1+lPV?=
 =?us-ascii?Q?7r5IKKHzQvSl5P1axyIe6WpYPhMhwEpW1G7KkEEpBN9Mjz1d0WdyKN0eZ2yQ?=
 =?us-ascii?Q?pcL/n5dnlBM8jgaXpicHBJDAUSAOdx2pEPcgmDCZTaqeQpBfjy7cFPmTG3VM?=
 =?us-ascii?Q?qLIvQAihLpR4RaTy2O7Ahtrq2XWFEU6DOeo6St3edNmLnue4IXlUCsXQOw3c?=
 =?us-ascii?Q?u5sNhr+BCgojwuPSz15yivSnf7C//r9XEnWx0Qvo/JHrEpC8cBwa1xn6P395?=
 =?us-ascii?Q?YkW1aMF57nRjAudiPbHRFmDiC15rSdefvvZ1iFun2fC7brbFTE4vkkCRT0b3?=
 =?us-ascii?Q?aTaIYSBJLRZXA8csnBBojfaaL1d3NwkpAPYMSt7z4c8v0r2lKQlBNIDoZyaE?=
 =?us-ascii?Q?xsmg73N0gFLKyCgxpAJ5+o7WVayVy/Gk571cfrM8BKFxY5zz677+pG2ilBEM?=
 =?us-ascii?Q?avfjMh06mtYLAYNCN96n6dM3bVvHkU2QiHDvPeS+erNfDIxPDZo/Y1fXDiBs?=
 =?us-ascii?Q?SfEC6uTNTrkg6CqgclqxkMEjF1hnvN9xaScaJIbtWRQ/DAGO5cmL6xT4nd89?=
 =?us-ascii?Q?crqIC3n9rfqZFECIoomj4WHmFBd/G81/jMsS4Y3eAQBpwfH/fW+utBEFNEqj?=
 =?us-ascii?Q?jNPatM4i0QDRY1VZmylAeYJl9zU1DXdO3Dcyxoks5V2hhiRLpxyQu0VOim9a?=
 =?us-ascii?Q?1MiHl4ZVMiwz/8BQSaLzebgtgx4qhA5+c+odiWOzO3ksAXqlCWO03JpsK57c?=
 =?us-ascii?Q?FBLh0QyBNY9yGWLveNdKsvhlH6hAPnfQTY8NKcG4xQtMJoBi8UNeTc8RlNP6?=
 =?us-ascii?Q?SoeCm+Ibs0c5Dhim5XrVYjHTZVqShwMkaSSE4NkuHeqewP8+Lf3UCfxPIT1D?=
 =?us-ascii?Q?6hi5UGrZXX5I6L4UwW6SfCRH7nU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ba31d0-c80b-4bdf-3c20-08d9a918437b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:46:32.9043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phggCjA1mLaUSzUWGJQv9+m1jHJN0QnTos4gYNBIQ0+yVUznGoAYZzg3XhOF8qk2dM7RaxOU07iPsgze2Fa1eQ==
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

Handle clocks and mailbox channels at runtime suspend/resume
in order to save power.

DSP runtime PM uses a timeout of 2s. If device
is idle for 2s system will enter runtime suspend.

Because SOF state machine assumes that even if the DSP wasn't previously
active at a System resume, will re-load the firmware we need to make sure
that all needed resources are active.

Kernel core will take care of enabling the PD, we need to make sure that
we request the MU channels.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 116 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 32f852cbba30..c4755c88d492 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -320,7 +320,9 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto exit_pdev_unregister;
 
-	imx8_enable_clocks(sdev, priv->clks);
+	ret = imx8_enable_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
 
 	return 0;
 
@@ -364,6 +366,92 @@ static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	}
 }
 
+static void imx8_suspend(struct snd_sof_dev *sdev)
+{
+	int i;
+	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_free_channel(priv->dsp_ipc, i);
+
+	imx8_disable_clocks(sdev, priv->clks);
+}
+
+static int imx8_resume(struct snd_sof_dev *sdev)
+{
+	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
+	int ret;
+	int i;
+
+	ret = imx8_enable_clocks(sdev, priv->clks);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_request_channel(priv->dsp_ipc, i);
+
+	return 0;
+}
+
+static int imx8_dsp_runtime_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	ret = imx8_resume(sdev);
+	if (ret < 0)
+		return ret;
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8_dsp_runtime_suspend(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D3,
+	};
+
+	imx8_suspend(sdev);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
+{
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = target_state,
+	};
+
+	if (!pm_runtime_suspended(sdev->dev))
+		imx8_suspend(sdev);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8_dsp_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	ret = imx8_resume(sdev);
+	if (ret < 0)
+		return ret;
+
+	if (pm_runtime_suspended(sdev->dev)) {
+		pm_runtime_disable(sdev->dev);
+		pm_runtime_set_active(sdev->dev);
+		pm_runtime_mark_last_busy(sdev->dev);
+		pm_runtime_enable(sdev->dev);
+		pm_runtime_idle(sdev->dev);
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
 static struct snd_soc_dai_driver imx8_dai[] = {
 {
 	.name = "esai0",
@@ -389,6 +477,14 @@ static struct snd_soc_dai_driver imx8_dai[] = {
 },
 };
 
+static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
+				    const struct sof_dsp_power_state *target_state)
+{
+	sdev->dsp_power_state = *target_state;
+
+	return 0;
+}
+
 /* i.MX8 ops */
 struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* probe and remove */
@@ -441,6 +537,15 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	/* PM */
+	.runtime_suspend	= imx8_dsp_runtime_suspend,
+	.runtime_resume		= imx8_dsp_runtime_resume,
+
+	.suspend	= imx8_dsp_suspend,
+	.resume		= imx8_dsp_resume,
+
+	.set_power_state	= imx8_dsp_set_power_state,
 };
 EXPORT_SYMBOL(sof_imx8_ops);
 
@@ -490,6 +595,15 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
 
+	/* PM */
+	.runtime_suspend	= imx8_dsp_runtime_suspend,
+	.runtime_resume		= imx8_dsp_runtime_resume,
+
+	.suspend	= imx8_dsp_suspend,
+	.resume		= imx8_dsp_resume,
+
+	.set_power_state	= imx8_dsp_set_power_state,
+
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
 			SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.27.0

