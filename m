Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9A454424
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:47:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDD11898;
	Wed, 17 Nov 2021 10:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDD11898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142430;
	bh=tq8p14dgLQ88hgOrF7/zyMNbI/BoytAk0VK3aYb4eG0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mh8OxvA0wMK3zhj5AnYo6DR8qQR8THgUUtYYBrbOBL9G3KsalEMtJvLZcUok5MNAc
	 ZDebK/U8juMME5N2BbUdYyoaupQMmLoOVwnXw2lkIkkEDNiX0XTiNPamxqibU1GuFn
	 baxifJ2iiwra/oaVQTbIWGy3D4EXwVb2qU8bdpvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89776F805DA;
	Wed, 17 Nov 2021 10:39:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5458BF805C2; Wed, 17 Nov 2021 10:38:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40061.outbound.protection.outlook.com [40.107.4.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57624F8057D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57624F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Ik1Ay2MV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEc9SNJVNVeNgewzUMrWfnVRwnm89LU1VBzU7BYz2BHX9F1Icb7Mact1Cw0pj0p8ROhEB2kdAMUq4ZYnCYMutqO56jRTZ5Piux94W7lNEKgexpawtcFE99PcmXZwbskEjJ58MGmZJItj3wv/zIcHPRPVyy9yVt+Q6EkkaRBJ/vv9Yz3UX4IN0LonXlaHvRcthKArympw3C8jUDogKKsGblMkju6A5gATnsF/WCUzad3tv3r0yPgHJGZ6nnx8drEa3X8On0+0D/9GvEuC7bgJqKSerkNO0flG3sqxrCeeWyVlIhc3cPsIvl3u9UrO/ZI9M3yTs2QQq+3/6hvo9XNO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qA+AKWCWzOd4laj79fwXpT4DlJBt/zadXCV9ubK1x4=;
 b=B0Lj16ClSGrCd3CMHwl5iT1Uh3rxFwK6vclxPJqsaJUgR4FyMzmGo+64i+1u9dzDsL85VJdiU0wJ9XT8WYMg8J0ef/AgkTkqJjqGOYlOaINL0KICXEBQcqsahdghEwjOclmuRDie/jisC9kt3fTh4VTvYt5/h3EXgxoiuc5Q0k6WPswTAGupx++NDLuAs+9qfsSlrtitQ2xF5nK3kQYKeezIxX3BjyLwA8NQvdj9+MwqlAhqmocYda2+3mD47ITth5f7H742bGBqYrVwH5mS1lNSE1U4kS+kcRgy5o6AqobcBssGVH3pYdqBIoc1gVoqQ+8ZG3eRA8X8b03o+4pYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qA+AKWCWzOd4laj79fwXpT4DlJBt/zadXCV9ubK1x4=;
 b=Ik1Ay2MVX5tyqMHgT0NlPnORamMrFqb47j/GbE0crJ0Uk584f/edyj+2TqzsY1nbQ5FchWZ5xLez1RCcD9X65Bc2u85kSzPhV34f/urj+HjOeecr/lslS/fI0Gp7RjfqFWWv3K/vR5Ga9A+E3ey9tUFUO5lx1/ecI1sIAmLL8e8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3039.eurprd04.prod.outlook.com (2603:10a6:802:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Wed, 17 Nov
 2021 09:38:46 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:46 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 21/21] ASoC: SOF: mediatek: Add DSP system PM callback for
 mt8195
Date: Wed, 17 Nov 2021 11:37:34 +0200
Message-Id: <20211117093734.17407-22-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3d8225-4339-4d01-8a4d-08d9a9ae0caf
X-MS-TrafficTypeDiagnostic: VI1PR04MB3039:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3039994C2A00140B4D40B35DB89A9@VI1PR04MB3039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VM1Ni1qqInNFquIlVq4wSafqdaeNYiApKz+wBG1bYC8GhPNwi8WkHgi9MBaPmwrP91x0XDfCbPFE1fGBmhWlPxCpS9A5Bere1waD4FgUHpyUUbAuxT80/w8tMAlDcMVyEw8KE6Y1+mN5/XxP4GQFPcYFlpbqUlv/51XqR0XEyvvmU2m/VdM5cbDEmxcV52SBFaDZRQOOz+5oANx/sxMiHmvMF2DwLluBNtyDhuP9kwWai4mVNzhOy00Z7dVge1CD7kAIoewjHv0yCFEFxUi3C2lQ8I2oPeLefbyGsEP7+17mvPs87jSquumboItV7GjycwgyfhiBqjx8QdW08Ba8l1z9Ux5lCbUxVkHU4KEqBf69Ga8mqMegSTgrykx26rX65h8mqlCIueQVxplsfRt354bNOt7AAm9Avj061XIliOpTagryOm+12ICAtbR8qh5xWfKL+nDD1dBGAf4juvRWz1YokA0A++Iiwkb3wxFQfnd/gZ+5/T95ehkCfCRxjv/j6A6JHRb4sg/K6bnrSMiyy+OlWjJtWAi3PdJy1ch9gibr35vSkeqZO18nomUjxVxBN1rL4EZBeSfa8NgWscotSa15UVX9soAcXEZYbN0A84sPIxY8ABr7+y1vfdj0EgdXKY5GhI3EqOQRXHvdnY61WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(186003)(6666004)(44832011)(52116002)(6486002)(5660300002)(66556008)(6512007)(6506007)(4326008)(7416002)(2616005)(8936002)(8676002)(1076003)(2906002)(66946007)(83380400001)(508600001)(86362001)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fUwRz3VSlUnbXLwoG/tAB5GUuN1VzmTARqxpnKo7ezc9CPdJ4MsRM1CdPxLY?=
 =?us-ascii?Q?xgfHK7thisfBZPWgwdneHhoAlURiIXcptCLxh712fZkxYEZXOSR6DvkoaEBN?=
 =?us-ascii?Q?qlw23+PSs/iB8dtkZXvWLXl/QegTgStcOBID+KX+Yp0oGNaa+sJvDN+tFCet?=
 =?us-ascii?Q?h2x3kkInBwBtYtiD5mrQMbGh7SnapMP7o5A7A6CvEr4tO/Aag81BjXbV4kZk?=
 =?us-ascii?Q?efB5oA/Ih65ilplUS2BXLEzwdMA6Kl1id/vwp7GV6mEIo1j7G3HFoZwlTOHj?=
 =?us-ascii?Q?Xfw0si3mNjQJC5wjymAsqRjJWRiE57+tw+Ve6FyFbiTKjYvDZgI7y+WkJcSm?=
 =?us-ascii?Q?JftkrQvbDSuPponCqRpAhbIigmtuxuDY/mTn5wCBChuksKMjct14uVCn6ECQ?=
 =?us-ascii?Q?KgYemONu8/H/pHg8QtXdjSDdSIhP6cxw2blEOGnqSwtR+bK9/awEb9USwRBN?=
 =?us-ascii?Q?E8s+p45fTg6VDq088blVZ3+XYPVTRBLxAMD5W/22WHu9yO90B3hAlCtISPN0?=
 =?us-ascii?Q?dbQsQe5iYM5NK7NX/4kTlmBdSo4Og+hTsu0wRNPc7h6tmT97qUiIqunDtKhe?=
 =?us-ascii?Q?KRwk1s6+XY2edRvGFXRWLM+yFEN1vl6nSvEtB045FIoP6qr6G6x26GfiIW04?=
 =?us-ascii?Q?F3aREd97M+MIvBbJScrkR4VjfHr1WoMiPLwJfRzt1VzEQ4yRvp2S2EAooeAL?=
 =?us-ascii?Q?D6qsNnx2zhNiXK9kxGjBbZyhpSwfARVuCcZOeMVRmuhSKAGZHgzcGvdYdUQq?=
 =?us-ascii?Q?1/UOrBtCm6XCwUmiXo2rxj+5dGbsDSP1/ofp6OgVWGMR1/x9J9k/149skC+8?=
 =?us-ascii?Q?2iwMnE7trDbMlrbMhqFcty8ZpmdOa9pWrcVLA8L1S6ZdfrghMCy50FaYiceO?=
 =?us-ascii?Q?J44sYjo7dq1PWUiW/hlyjcXMCyhqhA9VacBBNd9NhEuUV5xbj1aCr25jIPEt?=
 =?us-ascii?Q?7+p4LXhyRWoPmPcx/aD+ZIrL2es65S7J0i/m+QrPOyMVviusPP9EdHdQq9RN?=
 =?us-ascii?Q?zzWwPpE3b6UuYOHydfYioiIPvWlq+Smnw8atV9dDMLKx+Usm9zv/EVIPuwj1?=
 =?us-ascii?Q?F3VZi5zYz02f/WCQ4Hg8RXy4QZLD542HWrLsDXd1iFDivwWO2Yu6w2oVjVOC?=
 =?us-ascii?Q?6R+z6gcXyQn0w4zF/vqzr52pg4jidPRfsr6HXwFsIAr5iJvvV6JJg8G20t4h?=
 =?us-ascii?Q?anF/ASud4dHwI8YDF+XhW4KfA4JVfsOoPUOvverXFzIv99C8aQ5bLn1ysdw8?=
 =?us-ascii?Q?HStp5h7XxgUZbOSUq5XnhI2m3PpymIfMigTV96l3g+LjhGMe7tOaLvQeXfPf?=
 =?us-ascii?Q?lMkeXWtigqIqrORhVbb0GPqgU/rEeHju9sbUo3q0fQumLiYcW/GPz76qigqX?=
 =?us-ascii?Q?DMVdLst7jZVVklXt+VV9oeIHkwSccDALyhNnABs3FBlKL+KUGieJV04uVCSx?=
 =?us-ascii?Q?ugyZjbDYgGyG/eJJJUZJnRBLqlSfL/9jnEADXDcUVYfYgdVdeDQE3/NzLGle?=
 =?us-ascii?Q?oGbhv/GkNETZCbmZ/cNP+i/aOnN3wWFEOaVBdX+EnUnYAnCHKaq+KYTD4Ha9?=
 =?us-ascii?Q?GebVxDltYdXVAYdxTTDnEEvwuFsUvWF5EqUpy7lSNPkFd43wVIB0uuo4FnMc?=
 =?us-ascii?Q?FqybEjISwpcEOqxOE05AmvLS5Idv2OjVQ6nfQjLasBrn+Hhdw3IHXUTUSEMy?=
 =?us-ascii?Q?Vb2NvSQt4gsLQs+0DOD0SxzW+ig=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3d8225-4339-4d01-8a4d-08d9a9ae0caf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:45.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsOo6R9iDsrFx1yF54xjK+o/vahOQIOSWOmPGIcdUf4f4nTTlUhFWgWtPW3Eidlmu/Ep81A0sSao10DU2ZKfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3039
Cc: daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Julian.Schroeder@amd.com,
 linux-mediatek@lists.infradead.org, Balakishore.pati@amd.com,
 yc.hung@mediatek.com, vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
 daniel.baluta@nxp.com
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

