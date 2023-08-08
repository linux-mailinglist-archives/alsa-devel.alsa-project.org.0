Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68A774EC0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5D29832;
	Wed,  9 Aug 2023 00:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5D29832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535446;
	bh=LCYK/1/6BWqejFL76Ga3ryvkO/tQWPvH2WASqt7z6ok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SQvZ6QxlEI973JVLaFtzs+fHSWNoaQeU5uknSnqbSCe2WzQDsbZqYI1dvTayPfVcb
	 gAfjT4OF5Evx1Dd8bDAnBjdhgHtuD0jZg4TwLn3lRBIkbe5Iw+JymipdnKAcX+FQMA
	 0OTJoPO0almtTocIVt7f/vYx3Dq29+WqeM3ZvDqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F23BAF805AB; Wed,  9 Aug 2023 00:55:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 323A2F805AB;
	Wed,  9 Aug 2023 00:55:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49A96F80589; Wed,  9 Aug 2023 00:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7383BF8057B
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7383BF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Bk1CFCoa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSHPcsvWafcmmWDe7ir9RqoxyEvX8dcFXQdKnZfJvu2rGssAR6UG5sCnvEpttF9qhrXFS5+LjNoIj0ZxnjiqruGHrSUm6M6JaW53ou4hlz4um0CVZF9uUzNPKXU7LVSDuW4SUnyWsa2DLqz0CyVvhbnNYgJ/sx31ZZJyVxHtZVVMhDVNABCHeATW+HLG0VDXEQkWigbaQOIDBbns2TzayfBeH9zF10S4zJ5DrMoQdiXBDLTF1042nqpm/zo9H3vPL5Y5hZpPqHtoEJ/N7k3F5OPAZrsqGlkmTXcobLi4naKXXyT0rSdIT7YDw+VC0wIhdx7WqzyDwVm9sQlibXg9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sFEtWV5t/aOU4BjXQ4Wq3pZd9Ax1rf1wCYPB6YfnkU=;
 b=O5wozSkIPgNLUpNyB4eYMrmH+8Q6k4SauAAz/cStMJVcA41jdRg4/opppmjpv2lTXD1XSGcBko4y83EJ5r0+j5hO3yZ+kwZTEDA/C8SuxFJMFGMMNmvVzGJeDbFJleACJe5yM97ZUblUwoGg7wnfuJ2jGf5WXNfw86qm1zHDwuiZgrVWwYtdc+rTWQTilYNBHIhmleF/RPp+UBDiK0qHuMdBuLdGNMHgk9GF64OYugxE3XkUCWtM7thCwqAllMKqMUf2qaytgkuBq0NEHBWfeC1p8prNeXGnEk0EIWK8ml0ALQgRv6WKGA+FOuXN5Bs2pPdCLymuhnkLl7/CXZISLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sFEtWV5t/aOU4BjXQ4Wq3pZd9Ax1rf1wCYPB6YfnkU=;
 b=Bk1CFCoa1q9O3AT5d8JlY5PkeKYXJ1o+qC5MucAlT36/yAaEO2Rma5OHDj8XClIV4poO/FESTfRY17iyunOhWiibYjjdvAbFwSfmlUatpaDW8SgJ4YFhRXDydjIg/hoDuNXehJTilODlusEFAhC+Gl4HkxJjYT2WcqGga2fOkXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:22 +0000
Message-ID: <87pm3xb0va.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/39] ASoC: amd: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:21 +0000
X-ClientProxiedBy: TYCP286CA0286.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: f81b7e0e-f9ba-4ab1-b380-08db98628b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VGiHs5ycnVA8zBNvkopvgUsN32oy3VfEPI2oxZ543O1EpfQzKjqHZKaYZdXPTdQURsHgrqRBGsch23HHUYIgyFKmQ9snxTDHdn1XG0u3MU+YkJzdwGlq8XBAONToWLDIoJKa1y7qDlIm5a1WHDDpL4wBU/xrCW/Lu80TYuJJAsuyPgFv0f95hXn74hO4GXCn9FfLTMskCdEuUxJ8ZYTUvS/0855xNvH3QACClUkhtkjJ6NgeTebLKGxTYTUPi32oy1B0k3Txv4NbxojoM7XQ8hIXqis3QfkUcysduLJaYvzg4PjvIToeyhjhmoklWmUSmrGZViqQ/Y/r7g7LrRTlXPPcNW1PtsAPM6gEv74BPQPALT0qIE1DnnuZmvd5MNumoAnjzugJQb2AljVp7L/jfX4d5n7+fC6RahNIEbM3ln/nKjORIF2BtnkSIm7eotLpEcVEIfM6PJs+WomHoQGSfIEehVK/8s3KwmlgumnHcOuEUrXlzYO8T9bXffZ2aqRtgbO/T6+YFUs5C6NCs5IxM1J5i70+E4RZVAmEXpww18cct+1pirayJyxhST+JpTgL+5JCs27sjDq+xU6gnunAD6l3kPcJsWvkzySxJh31EURB5CQZiYSpsMt7Jp2MBfyz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dl7fZyoMnnxJI1qi6Qu4NDP6Rupm5TKGQz5YlV1qbiRq1B/1dn4fd8XZCQ0U?=
 =?us-ascii?Q?OK9o6grcNt3zpa1NPlvUBcLtqfmXOlgw1gQJSZCoYVLB9BdwN/ollQid83gH?=
 =?us-ascii?Q?UXQg0lk3PDViZSyRalgooUy1M49pb+GGzREQRWXgFZZgVEEPuvCJXKJsrezU?=
 =?us-ascii?Q?0Bnk1rH3VUneQlKu5mt+4j3+1XLGk3FqZuFoXshVh7C+bkTDsWp1BFtpp1RE?=
 =?us-ascii?Q?nQI6Oxiqw+I1zXsECYNmTtKCoC9wQ/t2XLDTygTdnVxpkqzBbsKLTAno+8aA?=
 =?us-ascii?Q?PkZLCXgA2DkD8+5Rg8GyAhsp9VDTssoPF4dKvFqmJzc10LsgkurUuLun+pcu?=
 =?us-ascii?Q?EUUEkPSMSTD/Gmw059EjUmx+0aqwVeQ92LFm05ZidbWNd1vJ6NNm6xWfsnEb?=
 =?us-ascii?Q?v9ax/UsrxF7PYQNzhcMSMR4UJSQGsyk8Fe4QrNMGJsHLmxsE4pBbHwrz9Y1s?=
 =?us-ascii?Q?ytZPdWVIDCVD8r7RGq5z/moyz3khKRZ8l6Eqi0qiSrExus9nua04OFic243f?=
 =?us-ascii?Q?ZejORdDlZIPcaUp7emVqZn0uh/GgdRZUXio8DzcwByxwXi9D23ro9rGJGJ8E?=
 =?us-ascii?Q?GhtRsE4quURUYGiYSBp73E91nVTVJeSqWB/U4xN0DfY8Y+ig6nMWd06ops3P?=
 =?us-ascii?Q?rI/TAFYIchL26zlsOSmm41asHszVlk2Uj/dfEv7XEOtMDzgJki5s3uWuOHpW?=
 =?us-ascii?Q?x3GYk1ofUDJ3eCObHWIp76Gp97cJHg8bH5DNI6/WZdXCr393CAqAnjNfMn64?=
 =?us-ascii?Q?Y4U8/HtGPiDwSXWXLeWgDyQJA7y9CsTDR+GclhPJTWshXCNelRtwzIMnfpwe?=
 =?us-ascii?Q?mz40fehC1CA6ic0n1G+8E6w1nXU8GEGw/KNyOuu39TGm3IRmp5vmRUxvJmHi?=
 =?us-ascii?Q?Nkb5BUwQ6xY/yj52/jC6O8E25hrOh82sjJm1hy97UzTeQFtTbXXvUkP1TJWg?=
 =?us-ascii?Q?ay8uiT9LDP9KgbtezoYytFkHnPJrkEWFl7qeAI/VQPWXk4Rkgm0k7Dc6Fl6S?=
 =?us-ascii?Q?IKXITmmpX2iKb5iAD0KkFODf86MLHLN8o38maiPg+OPKUg4MXRmk9RE1/xyy?=
 =?us-ascii?Q?PrjTyd3IjTK7F+oeTwKBtGpD7L5u2sAJ5gKpP0hEDTd3aa08ijd8WbLfJ1qo?=
 =?us-ascii?Q?Jo7IsDoVqlt6B72NiuJGRmPyxJEEPI3ju9hkNWhHIqwYRmGf1O072sqOsGDd?=
 =?us-ascii?Q?w0tlSLxyj99w9hcRtCbf3Jj/KOWsK8RFSNyshLn/wK17urOuSWPw3X3r/bbI?=
 =?us-ascii?Q?oFymnxUAN2sfRciTim+B3EotXuBKm1xYjZ6parAqq3Zdbs1wcdXRekIKhLQG?=
 =?us-ascii?Q?NIKuo1/Y5Hh3vRbwgAHNu3gw5yx4L5rkBTUWoRczsjMkC2teKRlohevtOEbc?=
 =?us-ascii?Q?a1/y7S/DJ02l1t2ZPocD25bKVnHn99YH5dcloBov39uhRmj7lWNL3ImEyBMz?=
 =?us-ascii?Q?Q6sqAjnZ/MmhJuzvIDsqhSg0mZwDHufj5+KdUAn3upMcu7PEq+nJAalvCOH1?=
 =?us-ascii?Q?reFGQl6PfJfDX2Dqa4bxSqm9S72m6e2A4jD5NBNt2Xtvd7u2RhqwB7cmISWJ?=
 =?us-ascii?Q?JpTAuLr0isGWLiRuxRbzDk06kg5d5bFgYMYJwOLmm0qeiV62pqDdBNITLRRu?=
 =?us-ascii?Q?K5DclT1yl78MZEmeBC85Huw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f81b7e0e-f9ba-4ab1-b380-08db98628b82
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:22.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VWybS7+m811/PwvBzGctsc2XWfbEJBZb7BQOpI7LGjnaDEMYRz55Hr/ryBPU8BIZPR3mS+e8ItbCg/CoTfGuomyUfL9tKWn41DhEVSo/L7Bk1E/rRWRB7s24IZTNPi42
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: S5C7THC7PNPMOSOEG3ZSVXEXIZPEQFXK
X-Message-ID-Hash: S5C7THC7PNPMOSOEG3ZSVXEXIZPEQFXK
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5C7THC7PNPMOSOEG3ZSVXEXIZPEQFXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-i2s.c       | 24 ++++++++++++------------
 sound/soc/amd/acp/acp-rembrandt.c |  3 ---
 sound/soc/amd/acp/acp-renoir.c    |  2 --
 sound/soc/amd/acp/amd.h           |  1 -
 4 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 09dc5f2c0bfc..df350014966a 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -539,17 +539,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
-const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
-	.startup = acp_i2s_startup,
-	.hw_params = acp_i2s_hwparams,
-	.prepare = acp_i2s_prepare,
-	.trigger = acp_i2s_trigger,
-	.set_fmt = acp_i2s_set_fmt,
-	.set_tdm_slot = acp_i2s_set_tdm_slot,
-};
-EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, SND_SOC_ACP_COMMON);
-
-int asoc_acp_i2s_probe(struct snd_soc_dai *dai)
+static int acp_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
@@ -569,7 +559,17 @@ int asoc_acp_i2s_probe(struct snd_soc_dai *dai)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(asoc_acp_i2s_probe, SND_SOC_ACP_COMMON);
+
+const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
+	.probe		= acp_i2s_probe,
+	.startup	= acp_i2s_startup,
+	.hw_params	= acp_i2s_hwparams,
+	.prepare	= acp_i2s_prepare,
+	.trigger	= acp_i2s_trigger,
+	.set_fmt	= acp_i2s_set_fmt,
+	.set_tdm_slot	= acp_i2s_set_tdm_slot,
+};
+EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, SND_SOC_ACP_COMMON);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS(DRV_NAME);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index cc8284f417c0..1bf7b2e68a11 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -98,7 +98,6 @@ static struct snd_soc_dai_driver acp_rmb_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-i2s-bt",
@@ -124,7 +123,6 @@ static struct snd_soc_dai_driver acp_rmb_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-i2s-hs",
@@ -150,7 +148,6 @@ static struct snd_soc_dai_driver acp_rmb_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-pdm-dmic",
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 1899658ab25d..54235cad9cc9 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -97,7 +97,6 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-i2s-bt",
@@ -123,7 +122,6 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
 		.rate_max = 48000,
 	},
 	.ops = &asoc_acp_cpu_dai_ops,
-	.probe = &asoc_acp_i2s_probe,
 },
 {
 	.name = "acp-pdm-dmic",
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 2ebe2099cbb5..d6cfae6ec5f7 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -198,7 +198,6 @@ union acp_i2stdm_mstrclkgen {
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
 extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
 
-int asoc_acp_i2s_probe(struct snd_soc_dai *dai);
 int acp_platform_register(struct device *dev);
 int acp_platform_unregister(struct device *dev);
 
-- 
2.25.1

