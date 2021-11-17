Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139624543FF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:42:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2DC21888;
	Wed, 17 Nov 2021 10:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2DC21888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142138;
	bh=aj2+q0Za1YNNRr+wlYcPf6ZwDSMb3KapqxAInOcLqKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0yU/ib0uY8YLgFnILvd5P1RSMlgsbdw0RpG0veLUt9SP93QH+rT3QlsGaVw26pfD
	 oD/kbK8mRG4IoKtIlPX9iY876/rnWjnq23bZkUMat1sKg2bCpDKBZOPwEpl5dmi8/n
	 K1731T5aLJhgDP9GIbdxWqAz2C56vFc2P0c4aOok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 477B6F80533;
	Wed, 17 Nov 2021 10:38:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B3AF804EB; Wed, 17 Nov 2021 10:38:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1151BF804D6
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1151BF804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="FVW/b9oN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqidAvOO8nyiinpv+cnIskB3DBCr8OS8JWKvR4SkLwZBiAepu1yshPSMURJN81/n7KQpfjyf3Gcl8OJ82h+nRJuulOP/Vqe3kVO00U7WLdb9iazKwSkEX6sZxOGcuuBUt4DP6C8ko7ZChOy2Z6UVSRcbtYk/E0yTqK7jX9PDn2OdhLP0jqd3z0/qUIT60HlVdmD+Xep0hRKg+/9k7r+3cOSQBj/XS7nOkCNsRtd+FMT5OMwlF99X/KalzaE/opfra7P5PAjoSoK8eVys4zFyPBEXnl6awjd0NEzVDfJ+gHJJbcEU1P1MulrlTso8MneNfiarAR02jia2KmVnuDl2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qETs5pmNyjuaBLj+49Mq3BcTs04Xkehh/3KstmMEV3k=;
 b=BigAi9lyvm/hBVdz7IR2SSbmEXqy7J9ji2Jfd+QYWOa1C0ndbJY4qS+mHXF6agO5SWEhcqHjlDpLn8SSMe1qjpDA6o3i0E3/xk3QepCClg1dZVItYGlYmZXCX3pwpgrUiXI5B3DtzPwFtWdzn2IrPPC4QyTgmxKI7P6/hQx+SjV4URnZ50hiyiQsGHnJEDPGIacq2ucKuVeFDAfaIn9nreYaaOJV9e0tQjZmUr2vnuZNFYFac36VfoQjJkGyd+Q3y3yS+xH2G7Q1mDjpUmmjtyydd/e0XslXlkqSfdNuZMjsPdDJNAIopB21QpJ2RZrVV7W0FQLVQ0mVJz1QtUhMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qETs5pmNyjuaBLj+49Mq3BcTs04Xkehh/3KstmMEV3k=;
 b=FVW/b9oNh+Ysnz+RVl1NkcoIR2E2iR+0EPxymLedWUOeM7/EtaEuRNpKFyZ5Vp87xL0tN1DpBS4cr8fQ9XOFlWGYatkylMHy33pPvoLEWqCWcjKohpC94E+NFIi15VOrDwTZnmX+74jXdgQk/GtGltKSV34bTqkfCFvr0FIlrU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:18 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:18 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 08/21] ASoC: SOF: amd: Add machine driver dsp ops for Renoir
 platform
Date: Wed, 17 Nov 2021 11:37:21 +0200
Message-Id: <20211117093734.17407-9-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6beb1744-f0e0-4322-305c-08d9a9adfca1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB58079B76AE2CE7DFB26FB193B89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zu+hQ9iK5kM3HEeQ4xUH5MHF2nsZvfLS9fL5lVv5uSpHNkEChuPTUsJEODInuDxH5zhfJtDowacc/XzGXRtGWTXYtsrUC1f0fqTZ1hWhhoOwwhJcAm90SvlSgTaSFFNmtxv24oITacR+zp1Gn5mPI/O8KAJD19YOkDUQIsrjXoo+oaoYO2YCGbhJpxZpyUArrG+lPp+cQROGJJ2d4TYpmywxrAoxYq58298Av01DSbVpA3j5kxouo+I8W1UgIRDdI11u3GaqPybpNWaER5TrofaVRfaoLE4MFm8Ft6QnBkjR43z4i1L+CE5me8Qd1HGn6xZYgbzqaN//3wdVNwKtEmtvInFXNLlyjGYsVdIkpnpznCzvK4Q2zH3rDFnFLFfQTFbY2/l4hhfluSx8D2HKqBvJWQVoPeY/jkjQX1PKO616Ebb85v+dur1fpbWvaxkG9s1IE6ao1qSvbLdDMv/kggLg+z19frNsdkZhON2e9cpWRJoXunALxZJ1clNfzQ/f47bNGZYdFQUMZrSCAy72TLKQsCuC8cczXCwNjoZUPPulUN85RJILxz1Ckuw5QDe7edFvrHA7Fsu0ogo1Da+VltJMX/D3ZavjLimMb2pUQ7RJrZCFkNqndmiAzMX4DZ9Bcn307pPThwncYYsxVG+sIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(54906003)(8936002)(66946007)(186003)(6512007)(2906002)(6666004)(6486002)(7416002)(6506007)(1076003)(2616005)(66556008)(66476007)(44832011)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h7rFmaVKnQjnqBbzyMo+JPAps9nd+lDz0TY/HfRM9k9KZ+ZDxrppP3SEYBzr?=
 =?us-ascii?Q?SsIu6m7v5YNNF41Qyi+V3w6Sd1/OYapdMbms70ENcJhZxqZYfhsqQnrzkhBS?=
 =?us-ascii?Q?ryosJKZT7vtnO4aEjPEyLWzvRYwLLc4porvp6QREuLhQ6s0vnBkYOsm7rhsz?=
 =?us-ascii?Q?t2ZIyfOU9VPb7MVIYjv5ABZiAmib6p/bSUjP00Kfs5S6TdoCTnimCeYA+urn?=
 =?us-ascii?Q?6Pa61wMqqwHCljLz+jnozU6HCUX+ub1LsaIIkcphU9699+PPfTG4AJK/iNt7?=
 =?us-ascii?Q?g8ttPgMf96FU2UrY6pQZinXEkUiW1Ff3e8HkzIU4a6W5GAxUJscKl1plsOND?=
 =?us-ascii?Q?y06wLkZQQ07x57fZunSgn4zo5TtKPiEvTCng8eqGRil4kgcSBDZBkKM2X/JD?=
 =?us-ascii?Q?lABPRvNyfVpdhkRFt9WyVaOJQ1yEl6QnlNkMax76aYWW1QlyD9UNUNTH9UZ1?=
 =?us-ascii?Q?7xlHYoKz2BT4WNKn0x9riDTfnedJ3CNL/Wa60c6dY+yWhlvAm6wgg+Z2HkSj?=
 =?us-ascii?Q?altW1Mw34K6LP8g8fIxstnjHtv3/UWtNMDaESjLKaffSvDn0zS6Xdjx+ltGy?=
 =?us-ascii?Q?oi3Rn4XfwKhAcNLzwP55I+iPzcxDSRNkz1xm/Qds4vXWwbP1+tBTgoq6cf7u?=
 =?us-ascii?Q?d/JJwzYjABfn732789XYjAXigXSPWxQ8HKx0mEvTjKCViAzr1KzYHDjOJrs+?=
 =?us-ascii?Q?n2d0L6YN2XwpbZ/lTi9+BNZha/7AYSgO2XrtGCNePbhWH2mejnP4q0OWrXyR?=
 =?us-ascii?Q?nmfDzgPUicH0GOVT6Wo4HWpOQWhH3L+TzXuyadLA8yqEEa1qRXUfLrVflGmd?=
 =?us-ascii?Q?lgwhwtIpKsVQRDTLBa5PXONFG5e2jPx6ItEiakBXI4dVdSlLqE/ZY1fBJZSE?=
 =?us-ascii?Q?sHizpoM4QX1AYvpfByBRJHxXvMloYo1vkR9w4HC8QhObgXDsuFW8eI4OWL1F?=
 =?us-ascii?Q?48RvYgC9/tbXl69wNCdZBxKK0oNlQCy1c31vnGvcs0o0Gi7WgV3uunAo1ieR?=
 =?us-ascii?Q?am8llupzbxD0jd6O6dpTBqjKR8Tg9tV6QpiiXcytADAfcCL8RRABUfwJ6TY9?=
 =?us-ascii?Q?5X0DPtOn2bCapuQDkktRKL+1DtV3BDK6zxx+Zb9xGtqXLcrBy7t7j1holI9C?=
 =?us-ascii?Q?AH0AzPLnJS9HfeS1c70xdxHkVwbWn8v13ccfBPRDbjjZ+8P9tpsD2INpgK0O?=
 =?us-ascii?Q?xTdrtE4hRnGHjP30pc336UPDnH8mtDlvWEr48aebKuEHjNEP9eRYIs0baYgm?=
 =?us-ascii?Q?Aqj9HjacnkWjxd8uSFppUkk9as1ZEUykaRhyFcbmu2jqIn0N5sQeBTgtmHWj?=
 =?us-ascii?Q?Rk0qlfIApE8dYm9kDQx5vDbWrkzEEXpxsukONm6X4s0BCqcfrBxKIuC51d0g?=
 =?us-ascii?Q?T4Bi6tzDbaEPL0FReoXM6z4Cq5qfh8OORBpQKKu1AwaT4MmOChl6zmaNxys6?=
 =?us-ascii?Q?GUGWf5lPeL1RMYlvw7UZQ3QRVeRWXPAtBTfjv6TSeULvIyzb17/vLxsQxEU5?=
 =?us-ascii?Q?M621qg2ZIk89XhR4seHA92Chd6z7a5cSLDRhOYLyM5YEDfaqD888eVf4Tk+W?=
 =?us-ascii?Q?mKGBekqV60sl1q0sGsbNFwRKuB4QioRoX9wp/utL4cb4uI9DSkTA2fk0YNI5?=
 =?us-ascii?Q?1dnWZnT1qttdzXSSIFb9bv0ERhjwR9o39uP70y5M4/Gm2fPn5O2/YcnUYvft?=
 =?us-ascii?Q?Ls/q6pbXBuAl/kz915Fy1IqNDFZbL48xgpI/OzhFYPhkrWze?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beb1744-f0e0-4322-305c-08d9a9adfca1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:18.5972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WdFty6i87FY55yJnLaZu9i2DRvYUg10Q48dWcX8GI/kjjxa0pNDj6NSEfmLDyD8uBvckYP7zZGyA94JZflzkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5807
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

Add dsp ops callback to select and register machine driver.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/renoir.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 0241c5dce156..3cd269bfe75d 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -104,6 +104,23 @@ static struct snd_soc_dai_driver renoir_sof_dai[] = {
 	},
 };
 
+static void amd_sof_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_soc_acpi_mach *mach;
+
+	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (!mach) {
+		dev_warn(sdev->dev, "No matching ASoC machine driver found\n");
+		return;
+	}
+
+	sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	sof_pdata->fw_filename = mach->fw_filename;
+	sof_pdata->machine = mach;
+}
+
 /* AMD Renoir DSP ops */
 const struct snd_sof_dsp_ops sof_renoir_ops = {
 	/* probe and remove */
@@ -151,6 +168,11 @@ const struct snd_sof_dsp_ops sof_renoir_ops = {
 				  SNDRV_PCM_INFO_INTERLEAVED |
 				  SNDRV_PCM_INFO_PAUSE |
 				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	/* Machine driver callbacks */
+	.machine_select		= amd_sof_machine_select,
+	.machine_register	= sof_machine_register,
+	.machine_unregister	= sof_machine_unregister,
 };
 EXPORT_SYMBOL(sof_renoir_ops);
 
-- 
2.27.0

