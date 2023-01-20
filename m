Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29951674DC0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:07:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2F72A7E;
	Fri, 20 Jan 2023 08:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2F72A7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198432;
	bh=TQMlP2nPq/QDUPLRENOjCyTngOAgYkDlRcgvB7YXxlE=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DN1iEM3PZYBMxejCQ3+VxKuiL7Pt81bbyUO8VawnBkY9h/asXNukxYCcE0MjJcT2I
	 FT2w+hVnXd2gGbn4DpRoLgL8yHGSci3+E/UFNAzxKIH0iwnCWv97FoM65VHDp2J7PK
	 yjhB6uI66RNYfObkxsGrLgwHDcPvhtDbebfLRFM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBBD5F805BE;
	Fri, 20 Jan 2023 08:03:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FDDF805C6; Fri, 20 Jan 2023 08:03:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8B4F805BE
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8B4F805BE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YmsoQshn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWhSTsy0rYFQv39UP5/i9EXlWyfrtGK+uJkyQOJpf9RoMewQpeW9nAOVp5SyFSC/j+KIWd6SJQ3FUqFcwEW3jSf6eaKWpkaFHEomAThVgKJxF2eG7l4fl2OQg2towLYZ4dWHT65kKok+pUzT13SAs77CxAi4R/xuU59dRWibKzJXgYXVhaIr8jb8tJB3U3b83NWtJb+20+jwSSJHdLTVQC/xCej6R7A+Vzl/etEITAz5ABdhkPDQnUibyU4JP3wyRfugdCYS3cxtSUoPJaJS9Ed4ZohgVTNmkCbc78DZjeAczzIpcK632VaHG6ubBv1c4heu9bTbAWSP4TZxWKW1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1lwRWv+Ldc2M5zyJ6cUcgdNTcI7rj6Z3D3wQBfvenE=;
 b=mB+pg6DWLtwIhkt2/6EG6SQm1myOAevG8KfrlfQCRTX+sNNrQfRkmJB9qb4+xc8hZR4WmIUNMfuAB+MqZu8zcM34QpJiWcc2fvNO9KJqWLBnPD/D0br80gLvMJjjEsZnAFYeNyBrEC2yUph4J6GpLx1ZADxg5a2ZIB45c2jH7MBBDe5f2wSuxrsv9cz70O6hkP4iQWvvLfCTUXrfSK8zVr296ph6GQ3Dzudn87q9RywsT9IjKq0ga1geTr9QgnO/ozcoRHt6AEweQghy3nRZB4TUCe7rcQ7zVMtWt8aRVxMzpTNhVaVabJBCcSnciU47i7rd4e0XNDN8p79X2ID1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1lwRWv+Ldc2M5zyJ6cUcgdNTcI7rj6Z3D3wQBfvenE=;
 b=YmsoQshnsQyMNJSLmOMtHAhvUCO/G6PEY1F+xxCQ7TfsRQPgX/Q56ZasldoBNM7/LaxEjVJUZWbesoXRxkSu5f6aBI30cRb7dDHdSbm36U1AAhBig24yytGq3qemaXnxppbW5fmTDIpKQd6Q2vxGUA2VKbW7Hmm23AmGgHFO5gU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:03:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:03:16 +0000
Message-ID: <87mt6dk7rg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 16/25] ASoC: rockchip: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:03:15 +0000
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: a32cdb9b-a85c-4368-6d29-08dafab4673b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IkGeYVpIAdkzdKW4v3WTNEznn1DpiJWRlzmrxcGEDzymVIgKzJKInKCIC/ElU+33Cgo0LTA3Z1Vz9SIoPNBHZgB5UWd7VQPNokIIkkMcF7NxkxuAOsOsHvsOeHOeL9eA/4N5hjQScABf20QI7MSQokwkUjbJx8qt8AUtRzzkC/tXhf+i9RVW26u3l6jR9g8f7bNiH8fYz6i3s+qqDDg76fVuyvswyHsRgn17pQRAEUhbbJ6brJb8e+301FpKU0yFSKcAvwq8MB+ziob40GPGM/zroobeVWKdCLF0PiUv9oYP2bJgnQngNvi+6teWXNf1LlcbLynylm/8hdC2ft5h2M6AwszhFOtFRU8rnJDw7yfq5R35s/4gugiwVWKnUhpCrnbPjOsNgMVGNvpWi61PMZAO7820a7v/atmUoDSpR9K0MFUDtUZM3pz4AicTACIiAem/29nXpZGtxNEdSmMkpf8gWE8fqaH1jP8kGSRx1UFvR5+9kadvBPpWTtUVMx1pnS1u80xTr80n/EFwChlqRyPkygvYBgebWD4sXM62R3ZAQzvcvLITe/GDmlHU8RzKdzu53scZXf6Sfh9L/LZ//++04YjiQGHgVC2Wn9DFwgrygSoMR0lwS/70GUE6cSXn2LoCpKnP4sRMz54ekQCHuexqyfnLH9O4TeiRQh/K/V09USwlJzS6j7JkZjBMl7FIhRc6uWPKRupCsco0u2Uog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?902mrMlh8GCdjBDIp0T8npcdCLyDgIrUD1aSHy5bgdglYxAsmL8Bd5Qul0oA?=
 =?us-ascii?Q?oQnNK89nVD27e1XwSJhVjZU5SNLDsJmeDK60Q15Y9P/aHwOv6ahNSGKDjXk5?=
 =?us-ascii?Q?h2lNa3ss3ZvvFdYCZtUah11P0pSiApHaPLg1AT/sioVlvQOwwsglFbLXP+QU?=
 =?us-ascii?Q?oTaTEglyKN6Oiv92sQuCrHwPkQ5Ed4M+ZFsLTvIrbupkJUeP0sy5+x0rNedC?=
 =?us-ascii?Q?vQzSfe2wa1KotTZZyiQ+thpL9VT2Kr7nF8pMKZcnmNGbRAxrtWXwFWqG+UYz?=
 =?us-ascii?Q?uMrVvlOoLFU8fqyQ/LzdzXC2GelW7ag3rmfjkM7AW9R6yR+p5J2/Mbuvjorm?=
 =?us-ascii?Q?3KOQ4jp4X2EPt+sXeiacySRSYU9fwkYYwtR1tH4tPlV7cWQzy04CwDlmUKSj?=
 =?us-ascii?Q?cbHekPQCYJSyjUDORbfFARiaVCeg/yhtoSiQpR6EUc4FBYYYAMV//XmSla2j?=
 =?us-ascii?Q?gFaOHHveWeuo6pR+rCoy2J7d2bzSXl31Z2midEaNDa37Au6hIeTXiQpoi4+G?=
 =?us-ascii?Q?bvmwiU9S3sjWvU85a5lyxgdbi6JJDdzHuqz+5chI4grcoXBqsN5vAEWqawNb?=
 =?us-ascii?Q?uRGeYS7v+aIUCZJBbVlzD3M16d6/jvM87pQ1aXii/zIkh3S8TxGNUByZrdr8?=
 =?us-ascii?Q?p3Bet50QaJV9maDJJP0818AUmkWGY/HWbcVdfVa6IWVip/yj2L/+wxlNOgIe?=
 =?us-ascii?Q?ypuNLAqW6l8iv5VUBNrN1I50PHE77wZYnjff67aL88UEwLBuzUCVg2RYJYUx?=
 =?us-ascii?Q?O9U0ATPwBw1emLAbK6moIRFiYCSsDmjJu+oLfd6VTtGgZj9+RRwjL/rq3WyI?=
 =?us-ascii?Q?9Qo7+jyGdex9oiOt83s35hrQVm7my0IUZ4T/P3300DVZQRtDsb3TD/b8TO9P?=
 =?us-ascii?Q?HwwL1WQfFiqywqTNbnuxUobAzeaySu6RvdLAlml5bnhdRsEeF0u1c5Zb3rSM?=
 =?us-ascii?Q?SBK57WxfsNJdSTe03VGglSxxhgGp6/UyqvrizCQObbC6pkNooSO3zw3P+4Le?=
 =?us-ascii?Q?2xec4ySP0ELHTHg7juGhdgpN0y2AeeyGF5iK482/V1a7EPlqwIDXVsh4n8qF?=
 =?us-ascii?Q?mijnHbP1XdeelTBtuqoLKxzPqs0winvuka5ZIygD3sZyEdtjDPJwHW0l9H3W?=
 =?us-ascii?Q?qQshjO304iA1biEJBvgtg86TvBCejKDq+HalhWPjAUURIZASclHwyFCrUEcb?=
 =?us-ascii?Q?GQDtARKWGMT6hmxPY87e448hBc1Pqy9w7gVo6sMOsy8LTH4sNzWXwq649+nT?=
 =?us-ascii?Q?BkuUmiJEkFqmnDMFTETAH+RmaanUU7Ow6FkKD2gxHnN+r9K3bFigoSZpX4pa?=
 =?us-ascii?Q?UDmXer7ejSxQOWukdutssDuSWG9fjS8kVBrr1Dw1zWiBzqErdSA5jsl2yS23?=
 =?us-ascii?Q?CukWFT3Nrrt8aNBS71WAgZIqBdNFHHBwiTSyTdvfJ5M7fTOCpicFxdHU36oj?=
 =?us-ascii?Q?WTAhifSOG41iWDhFj6T1R8mN8qDVkdRNAjh0x7BRCyDVg8IUx6A1oun86P7H?=
 =?us-ascii?Q?fpGuLfoStlbp5ivPV6cX3zjUsVznhoJ7mrX7QZYeUTxhmEpCfeQSsul1pVDB?=
 =?us-ascii?Q?JNWi5nfUVJKf5SJIuLIt1yv0XAnx8V0KlFd6M1Sy5RVbWORqWxGqvvZjEX/F?=
 =?us-ascii?Q?hyrQqpDjPiorkUyeTlFyKSU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32cdb9b-a85c-4368-6d29-08dafab4673b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:03:16.0601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LKOnX5dq+dX/wZDOQu1RWxukh0TrBr6pE9bhIscOHZqjyZo7sQ5xdFW81iaSuaDyEcVDVz3V9sGx7MuF0XI4IQQECxh9zQu2JY8ZeCoJ/BebQzpWO2a/fgzHcrzlft8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 4 ++--
 sound/soc/rockchip/rockchip_pdm.c     | 2 +-
 sound/soc/rockchip/rockchip_spdif.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 08b90ec5cc80..166257c6ae14 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1070,9 +1070,9 @@ static int rockchip_i2s_tdm_dai_probe(struct snd_soc_dai *dai)
 	struct rk_i2s_tdm_dev *i2s_tdm = snd_soc_dai_get_drvdata(dai);
 
 	if (i2s_tdm->has_capture)
-		dai->capture_dma_data = &i2s_tdm->capture_dma_data;
+		snd_soc_dai_dma_data_set_capture(dai,  &i2s_tdm->capture_dma_data);
 	if (i2s_tdm->has_playback)
-		dai->playback_dma_data = &i2s_tdm->playback_dma_data;
+		snd_soc_dai_dma_data_set_playback(dai, &i2s_tdm->playback_dma_data);
 
 	if (i2s_tdm->mclk_calibrate)
 		snd_soc_add_dai_controls(dai, &rockchip_i2s_tdm_compensation_control, 1);
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 5b1e47bdc376..6ce92b1db790 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -373,7 +373,7 @@ static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct rk_pdm_dev *pdm = to_info(dai);
 
-	dai->capture_dma_data = &pdm->capture_dma_data;
+	snd_soc_dai_dma_data_set_capture(dai, &pdm->capture_dma_data);
 
 	return 0;
 }
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 5b4f00457587..2d937fcf357d 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -196,7 +196,7 @@ static int rk_spdif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct rk_spdif_dev *spdif = snd_soc_dai_get_drvdata(dai);
 
-	dai->playback_dma_data = &spdif->playback_dma_data;
+	snd_soc_dai_dma_data_set_playback(dai, &spdif->playback_dma_data);
 
 	return 0;
 }
-- 
2.25.1

