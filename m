Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECA8456CAD
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 10:45:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B49C017B5;
	Fri, 19 Nov 2021 10:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B49C017B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637315120;
	bh=Q68hKuTbHoZ/Lx7YWAgHjvatLLrLX/X74bd+Z6qiZQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AeuWFnshbgUcij8mrZZ6iBoF1HlnbE+ynTd7khv3gTSML04+Psw+4qLR6WX0FXMzB
	 S6M4LHLaONSAixByL2tG2+O7wEKGFfQc7dXSmx9fAOIwPdBcqCbbuPSsFnvgDPC2lT
	 neVOv1SEKK1hO8exdCEEFlxpi6Bu55KhrmC0Ep24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED8A3F804C1;
	Fri, 19 Nov 2021 10:43:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66296F802A0; Fri, 19 Nov 2021 10:43:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52180F80115
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 10:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52180F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Z9a0u0L1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0OjKRqjkJcIOnVlHlBjvTPSyCR0TRln1MsIE2mTq5IYCIRwh2wZMh2O3YSxWsboUQ348ld8hVVvNmCQSUpt8I2XipL4I59RWnL254QaZpGS4CRijthPE1oClAsz7/6JZJdWvuO3COAAdu1pu4mPIgdGjLZ0ofuDC72VHiQvJJSeHZiCDuN6uMvaeWFxe3oLZ4jF9+diO6pMgDbdO8eyGWSrxQA/ICN/4s7Nzu3F20abTPnLdl8rUqo8f0T/fzK1xxkiruayEbzEf+mmVJfo1WMdqs3Dg+QEeGwZmP3U3TE3aH1nuFIjSyM42juuG/aaMA32WrZBkJ0M2UlGEOJqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeiXOMZ1lW1CcWDJMxc9X5sgHb6Ep25ieGa9wcv755o=;
 b=W5CQp9nFmENV/VYYxtYEg1VJGGlbjaKV04suHEW4nj9BdU1OOMzaoGc4wUdaCpqidfBDpg/rIbA2fDCq5PNPvs962lzHeU813nFxh3+X0j0gUps59TBdgdkWqE+xodcqwn2YIgoZOWYzBV4VfgjNP0BdhPU7njLiGd3XEWvJSecKpTs1pNxK+f/CRgShCPrElgyZT7NYGXfXhGyFu4m/lSbQ7mBjWNWaHZ97Nf/FaBdM0v5Ds6gdceSGTwA459Pn9wOmGthvWOQOTDyqPlhUyUR/uZ+RpUWs8Sn/xhPPMq6Ymi0w8s09FhPDgDLCKcQp2kPQkMvOnhUW0LQoGCzL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeiXOMZ1lW1CcWDJMxc9X5sgHb6Ep25ieGa9wcv755o=;
 b=Z9a0u0L1Ny813t/3uHN5zF5eXISZmBhUCFrDl0xM5Gw5PruUGS2JcMLMVp91fqMVzlOkFYqvMukHIyFhKW0fukYiocFq6i57Skbd13Cucr54YUI8bP1F7KhEi7cMW5PoruWedm2wuWhVBa4bLqH0b/ijIBDAc/NHfQXdiTMAm9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 19 Nov
 2021 09:43:32 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.029; Fri, 19 Nov 2021
 09:43:32 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/5] ASoC: SOF: imx: Add code to manage DSP related clocks
Date: Fri, 19 Nov 2021 11:43:15 +0200
Message-Id: <20211119094319.81674-2-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 19 Nov 2021 09:43:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d8c6bf1-c3ad-4335-890d-08d9ab410ca6
X-MS-TrafficTypeDiagnostic: VE1PR04MB7358:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7358C34FD57C24E4042A2364B89C9@VE1PR04MB7358.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vRaUQLSMNbQ+P+UpuRru/BwC5QOIOHbO1VsuO0C++jiaSqeaxujJDBQ3wzXufnXZsoG0dz6bREOjyFnlrHmrPxE57lSfMVXM3NJuz8McCywK4w+47v009NpIoKZYrtEDfgsEMk/cwke2uakG3XMgXrDCwWgGPgiinGbmcbjOARpUNHV9aYx04zpjNc8K7Dejlp+ZyEvt2ypO5eMHP5D7drM5GV54Z13/77OagxgllYb65GWRZy0ddq9UB5UUWZ9bU7eZ7hJEaI5I4iS4gPcyZUM52VdjwS5e2k4ZfF93QxN2wLSZk3kOYRG2w4aOJYT0aEOGbTGjrxW+v/9itWgUCgVFJr7RMgw6EnAOyClviDnGw/wZMJOAuuqwlKNoiuFuKQaVkT0MPhkwr/ou+OpYesJwBOLlW+LHr5w4YY8ipfJVvqeOk4di0HCmveX9hNfbsetJ1gQ6ciSrqaYE8OZHpo6BtIL8sdlAKVDwA9qP2bh/eLV2gDrKrOO5ZCPMo6zj11HFbCuEmaQ6YiWLjl9+rNFteSzsYSFCenlveDT9wJRFa+l7CftxQxwn8lafs+NjRl/GJio2SK4ud4V9h8LWK/pfJDjQ0XDuo+1OIv0XCU+0uqRBadyVr13IVrNBoW8Vth5bbTxUgnsosYddicPPdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66556008)(52116002)(186003)(6506007)(6512007)(44832011)(2616005)(8936002)(508600001)(66476007)(66946007)(1076003)(5660300002)(83380400001)(38100700002)(6666004)(4326008)(6486002)(316002)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qITfLWEZU9vsfnlJj4+27ubx4PnLi2CC+2zJ0Yv9cvoiO59f1lqSq6ONc5NJ?=
 =?us-ascii?Q?7/704QvaIZHwYjavPu5xAt/GbIPhPs6UIwfRe5JyteA0CfBBBxjxmN5SOqaS?=
 =?us-ascii?Q?DsjVUhJo8ACFhy7qeHj2LxIq5UaupmC906iGOdv4XquULqcDnovuIB/xy5LL?=
 =?us-ascii?Q?eMX2OydQ/+tC4UgDbY2f4XyPdcTYb9KDyVAQMGdEp5k9ZIxU8KperGfVgJFx?=
 =?us-ascii?Q?DKUh4vJOv3nUyLXV4VZ027jSt6W3lJHTdO0yA5D2n1Ds8BuDc4lk4X6XhjCu?=
 =?us-ascii?Q?ovGxtmL9U50FIddTaPmyars7viH5tMfYYBs2W6DdfIumGfcYcsjb0u9g5J3t?=
 =?us-ascii?Q?NOSsW5DIPw4BB7XMzzUTQo+YWzci8OWkMcZFnAFyK6LnEhEz9kggyEjHQjYd?=
 =?us-ascii?Q?Muj16ehTGNNecrPt/ouBkeH7zKavOBwXqIpXcyUAKgNOPWTMOgbkBr2kbXjO?=
 =?us-ascii?Q?828FLY1KT/MoA4GxjVSD316Rn/FTG+az+AdtX13+BicNq51CdXfh9GczR4qt?=
 =?us-ascii?Q?QcEgRCwQBlU9rtwIgh6qf4egdftRdypITHFztdlDDR6gOV+MTq6Hdd7uEk2P?=
 =?us-ascii?Q?NGROYZiXnIuz5NKooT8W+7cjots5BwedhdxDwMCbCKyAdkAPoU0zTepnjqUj?=
 =?us-ascii?Q?yOm3uvB+rpVanLbVZn/nXMIPAiLfok0VnHz7C3CueTbQC0dVwmhNrdV/2lhv?=
 =?us-ascii?Q?8rEb9BnsbB9ntiYEH/upAK7tA82YJWN7BQmVQlN9OA1F5agfSq1MNF+0//nt?=
 =?us-ascii?Q?oxutElJWm6AoLAiZlcmdKyo+oDex7r4Vznxk6l+cxlexRIMj+EraqDZaV6S4?=
 =?us-ascii?Q?sacN06VxqXo5lrOCHy4zet9ngnrHYn6en88j0w90vPhyyHSrLXwor+gTxZpY?=
 =?us-ascii?Q?fKTJUVhbibJCZ6vFwjWSp+HPhbfoLz4AhV0evabh9CabMptldP6Tf5/Vy0fd?=
 =?us-ascii?Q?Kgya/E+5orHwMJOJ4g+PlPo5WQrb0tkq3axM2X03A0ko8wrN+CRI8203r1am?=
 =?us-ascii?Q?Lroe7wyIYZ9ktBJVgTTtd+Z2agHc94upw48ACQl+0zJ1wNtB2171XiJxuMln?=
 =?us-ascii?Q?Jtiuc9+3euifMssI1ArzM9OKRVT1skTMhZKPHAIwxy8V88YRuVZK+eXMlP6B?=
 =?us-ascii?Q?LJb2aNPCNT17kRNIKNahlzMO0Yh8BfLxSqlJO+lCPjWhDpbUUNyT0i8UoiQX?=
 =?us-ascii?Q?+bWt8ZI0DuaVFF+1v90/JHGnLiAd4QLSkJFquEG+WOsxkPFViNxseF24DC+f?=
 =?us-ascii?Q?FciJeYPIh+whqjL0Wbua11oJAulN65V00hmx2beRp4LSmSiinGQKShiVUqsc?=
 =?us-ascii?Q?pvQDeEM4apAFx+Unf19M+uaMgGgWiQ5/h7IGCMWGbCJN7mvG19ABGCS0Dgg/?=
 =?us-ascii?Q?DUF9AoimNncTN4NtaRoDqdDV1GX9mltgXX06Ch5iueqHol3XwqI9XdASaVqV?=
 =?us-ascii?Q?G3iKoAu0MymN0yjVim4oOr14MqBZPvLkOK1ZAupBEALQHLhmr8BGBnyIs/+J?=
 =?us-ascii?Q?UJ6oAkdTofeEp//7xrktt/Tpie7nQWLI3yk50brWNU0zHKTP/wwXnDirDaEa?=
 =?us-ascii?Q?8E7Y66tmvJbHtqRWkVVHwPW1MwuTGsAyRYbdXPCbXb7hf9KS2TF4r+7AAFoS?=
 =?us-ascii?Q?tjX7lfOQuVoKl1bPoNFyLEkOmhu26XXsw+pdClg9PtGuldx0xl7irT+cSusA?=
 =?us-ascii?Q?lbRrMefhIzkrgG/rGo5gBh0wbxMs9Ze1VrcwH3MR2JOB2yLI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8c6bf1-c3ad-4335-890d-08d9ab410ca6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 09:43:32.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ovm3vIelOHsdp3O0zZa/ufWGXGJuL/NdMDYendU7j/Jug7Ag0JBmXScD2hELwgvr3giu0JWrWQRJWGD3KBzTCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7358
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
 Paul Olaru <paul.olaru@oss.nxp.com>, daniel.baluta@nxp.com
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

We need at least 3 clocks in order to power up and access
DSP core registers found on i.MX8QM, i.MX8QXP and i.MX8MP
platforms.

Add code to request these clocks and enable them at probe. Next
patches will add PM support which will only activate clocks when
DSP is used.

DSP clocks are already documented in
Documentation/devicetree/bindings/dsp/fsl,dsp.yaml

We choose to add:
	* imx8_parse_clocks
	* imx8_enable_clocks
	* imx8_disable_clocks

wrappers because in the future DSP will need to take care about the
clocks of other related Audio IPs (e.g SAI, ESAI).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx-common.c | 24 ++++++++++++++++++++++++
 sound/soc/sof/imx/imx-common.h | 11 +++++++++++
 sound/soc/sof/imx/imx8.c       | 23 +++++++++++++++++++++++
 sound/soc/sof/imx/imx8m.c      | 23 +++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 8826ef94f04a..9371e9062cb1 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -74,4 +74,28 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 }
 EXPORT_SYMBOL(imx8_dump);
 
+int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
+{
+	int ret;
+
+	ret = devm_clk_bulk_get(sdev->dev, clks->num_dsp_clks, clks->dsp_clks);
+	if (ret)
+		dev_err(sdev->dev, "Failed to request DSP clocks\n");
+
+	return ret;
+}
+EXPORT_SYMBOL(imx8_parse_clocks);
+
+int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
+{
+	return clk_bulk_prepare_enable(clks->num_dsp_clks, clks->dsp_clks);
+}
+EXPORT_SYMBOL(imx8_enable_clocks);
+
+void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
+{
+	clk_bulk_disable_unprepare(clks->num_dsp_clks, clks->dsp_clks);
+}
+EXPORT_SYMBOL(imx8_disable_clocks);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
index 1cc7d6704182..ec4b3a5c7496 100644
--- a/sound/soc/sof/imx/imx-common.h
+++ b/sound/soc/sof/imx/imx-common.h
@@ -3,6 +3,8 @@
 #ifndef __IMX_COMMON_H__
 #define __IMX_COMMON_H__
 
+#include <linux/clk.h>
+
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define IMX8_STACK_DUMP_SIZE 32
 
@@ -13,4 +15,13 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
 
+struct imx_clocks {
+	struct clk_bulk_data *dsp_clks;
+	int num_dsp_clks;
+};
+
+int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
+int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
+void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
+
 #endif
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 0aeb44d0acc7..32f852cbba30 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,6 +41,13 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
+/* DSP clocks */
+static struct clk_bulk_data imx8_dsp_clks[] = {
+	{ .id = "ipg" },
+	{ .id = "ocram" },
+	{ .id = "core" },
+};
+
 struct imx8_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -57,6 +64,7 @@ struct imx8_priv {
 	struct device **pd_dev;
 	struct device_link **link;
 
+	struct imx_clocks *clks;
 };
 
 static int imx8_get_mailbox_offset(struct snd_sof_dev *sdev)
@@ -188,6 +196,10 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
@@ -300,6 +312,16 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = MBOX_OFFSET;
 
+	/* init clocks info */
+	priv->clks->dsp_clks = imx8_dsp_clks;
+	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8_dsp_clks);
+
+	ret = imx8_parse_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
+
+	imx8_enable_clocks(sdev, priv->clks);
+
 	return 0;
 
 exit_pdev_unregister:
@@ -318,6 +340,7 @@ static int imx8_remove(struct snd_sof_dev *sdev)
 	struct imx8_priv *priv = sdev->pdata->hw_pdata;
 	int i;
 
+	imx8_disable_clocks(sdev, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 
 	for (i = 0; i < priv->num_domains; i++) {
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index f454a5d0a87e..ab40c0bdf796 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -23,6 +23,12 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
+static struct clk_bulk_data imx8m_dsp_clks[] = {
+	{ .id = "ipg" },
+	{ .id = "ocram" },
+	{ .id = "core" },
+};
+
 struct imx8m_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -30,6 +36,8 @@ struct imx8m_priv {
 	/* DSP IPC handler */
 	struct imx_dsp_ipc *dsp_ipc;
 	struct platform_device *ipc_dev;
+
+	struct imx_clocks *clks;
 };
 
 static int imx8m_get_mailbox_offset(struct snd_sof_dev *sdev)
@@ -108,6 +116,10 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
@@ -175,6 +187,16 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = MBOX_OFFSET;
 
+	/* init clocks info */
+	priv->clks->dsp_clks = imx8m_dsp_clks;
+	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8m_dsp_clks);
+
+	ret = imx8_parse_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
+
+	imx8_enable_clocks(sdev, priv->clks);
+
 	return 0;
 
 exit_pdev_unregister:
@@ -186,6 +208,7 @@ static int imx8m_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
 
+	imx8_disable_clocks(sdev, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 
 	return 0;
-- 
2.27.0

