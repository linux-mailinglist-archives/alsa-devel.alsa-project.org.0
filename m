Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35369F396
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 12:42:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612A3EB3;
	Wed, 22 Feb 2023 12:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612A3EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677066157;
	bh=fd4NLfrMGNEkqv45c80hz3iconNusGtYl98kMXe+1uw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TB2mRTPjvYbh01U4X5lE5wZfBOK6zYE1cmlktCjyWKVnm28EzwZJ9SCa0CW4cvVwL
	 OxsZLizavY7elfpllmZPKsN8BW0iPh3IxbcJ1Batq7iHfwyOdwzRT8OC6NcQ4/REsg
	 JmFBY1zmw3fEj/L1DvHvoJRGuJCK2e3BJXHsU36c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7556F80551;
	Wed, 22 Feb 2023 12:40:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF080F80533; Wed, 22 Feb 2023 12:40:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17701F80525
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 12:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17701F80525
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Nx1YcikV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS+/PHOM8thu6o9MtFjO5w1ZW92ZooOxqgjfPNjn/i2jcBYea4qNvxBwfOdY9SMqzVY4f+AY9BluNrAG+XULYUT2AEaQR6d95AboCzkHKDqrY4Rok8VvjxBMl/p8HokgXzl2Ek00LM1JdqlVNmM3KIlKwkbPIN3NbHnmACOCRFeUPFU3G5ziVKoNE48fY7GjKphAaflH+e0lRxyjNyc9qqDyu7hvc0xaKokR/HEpAEh86yvHnQatE3vDR8aflQvjy3+muYwJq4qwsylEibiQ7hXH5JOIowf+ivRKVWhDHOP8V8PZfiy7EIskx2R18CVim2VnPwEg47wLXCaZwT/Ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++ejmGwQkUiwS651NWE/u4IbMYLd3/yUmOuJsIWglRI=;
 b=E5Wvk5azMT8mB3v65I3cORUZrsC0QUlFoYgwDMcMuKmhet0DuggCHlgnMQCx3jqnvSeOWPq5YrtyLpKDpfm1zRQp6m2oj0L8Ve/j1O6QczRnWkK+7/0xauXaDxw2xPlXLWrzjCHy/bXTSIySUU8b1U4s9bPvKPnw9zE1fnToe70Oi53OzEdSFVF90khDlHAs5SZkzb+PjhEJS6U0UZuenZK0q0waIt/4z388WlJHdx6JLwzbTn1j8N90ksFW0PULLFdrXs3uSwNTfS1bKUp5K1u4DeTNKN331MSaMr/0ipQcBOolo19H4cRcAZCHsGJGowVlWq/7os6D5PdCEi9qtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++ejmGwQkUiwS651NWE/u4IbMYLd3/yUmOuJsIWglRI=;
 b=Nx1YcikVw2KfbE9Cq9pkaFZ3tEsNeyOFDPN/G5oDEiwMMv35EdaeDHFjCvgA4RRy6MtAI0N0WCBHyZaOWEQyTsM79o3r0AFUz7LZd0aU7i9rwyaQFxcJGMrpiBree3uMsexZLx24IzXoaIv4jvTexvmr6R4v73YCPu2GNcICvzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Wed, 22 Feb
 2023 11:40:14 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8562:affc:e0c:c610]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::8562:affc:e0c:c610%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 11:40:14 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] ASoC: wm8524: Correct the MUTE setting while power
 up/down
Date: Wed, 22 Feb 2023 19:39:44 +0800
Message-Id: <20230222113945.3390672-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222113945.3390672-1-chancel.liu@nxp.com>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: ba95e6ef-5e3c-437b-9576-08db14c98fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	spkZslXkZxPdQBU4nKzQA0BPpk9bPBlNy0o6ViE4ZTq1b8fFiTWD8SkCWN5FxRT6wSbI1EopOmtHs21bdtBt8QLllww7K7fXWKgsLRure6rgpCmWesT8MuXEonrBHPJqUuxckeutOWE/MzjrwfzEwQy6JBqEour9FzxidZ7Zv8rjdfuvpCAg6xrwGNGe4bq//+GXrosXzUBJVCAxsLeXQF/sDuJly9YYXnSZABc73Bl/WIbC9qxru5ad/Vus4OhkDKFet/FXLADlFQUlH7jOmrv0sEU89pZ/c9LYEdD0gaO7WRL8POpHDpDvgbg3ERtqEDdp6na4DRKai/NKMJ8XU4LFPGyzToZ+G0jKQKkCK98NJb7NwRyF4YFuaUEgmz9r5pUJ53WzDjuNvJDJJL/FIOWtD8zWnN8nAbrRduLxM/RFM4ATu2YgRfF2wlHiQn1YE+v46h1kurCdx+326DOaYKySssQbBrR1L5dIqyvA/B1vZ4uJe5/E9vBo3EoSf5J7+m1U4ETwimMThF11sOiMUibLTLMHBfF4oQ04qofqJ0/1yHM/VXnjJmhg46BZ4xDbhadIrHHg85dCwQHXaL8K5anxmVufZGzB68shIap8RWEEM2J6z7Ov2CeoM80HbCCKBM+0PVGrUA+CCRUubnz98xO8f78VxqIKavHgJeXPlAQfDM6QQHRqQSY4jXkagI4iXc13QHGBc3zeDiQ+rYCAOFSiTuD3WFE5QHvsao3ogdg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199018)(478600001)(86362001)(4744005)(38100700002)(38350700002)(2906002)(44832011)(921005)(316002)(41300700001)(36756003)(7416002)(5660300002)(8936002)(83380400001)(4326008)(66476007)(66946007)(8676002)(66556008)(186003)(26005)(6486002)(1076003)(6506007)(6512007)(2616005)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bd0WTVFPJ57SIkXu9EFaxgfHlAPc3ksHqmDYpHocuQunRfLFX3BOgTVQkmzS?=
 =?us-ascii?Q?d3+shf7k0CoWB9fkb2uto+S6fMwqGoRRXAXtyoT+3QA3E//lbNqmyBmLiirO?=
 =?us-ascii?Q?xm2oKDTsgrcBG268Bx4O8V9kAUwRYR3aJmb3LVKOFSw6odLz4yEZfua3AC02?=
 =?us-ascii?Q?hUdYOReC1HQ342fQt/+daUrSrhHmYvwtnVpBpkfqWKhBTyqA59ZFdtt16PCl?=
 =?us-ascii?Q?V8XvOUMX1iBi0C5dddBDvKLGEzxpEANDdfh/U+j4mj5JLhg3aEK1dWlBzn87?=
 =?us-ascii?Q?M6KUi/a9pCNp/bwngAobbPVdAVtp5Kd89BqOP+B9UzGoKpgQmY7k8JV9CjuX?=
 =?us-ascii?Q?K4Vo3gwbag8yiORCWH93N2QuaPivfUGRqqzABNNhxHjOD3TXLxENBbD8ORgd?=
 =?us-ascii?Q?ilbu//SCS8sMm4sSQUupR0r7/+cO9WCMx+G/V7IIG7HVz3fyDjJrhbz+Dheu?=
 =?us-ascii?Q?uZ4fRzdeBpz+91NbWuHAjZeatdoDFV9H/qMYwNnl8sisy3kFsworOefpcnLm?=
 =?us-ascii?Q?eWUn7EaaFpMQgM2/8bkPWTdjD1l/pRCDgx0kHsazodCgzddAvlJGvWlXNajL?=
 =?us-ascii?Q?Q/Ul0nkjsidxIU7Ejal+xUh621lz+eEYkWffFGkxXBbwAUZf9z+yJ1FWOVnN?=
 =?us-ascii?Q?+LbUxzZGiUNLdx5F0tHK8PmEamsbw///s2XyTMz7FJx/YSk3LLMEgewkegCF?=
 =?us-ascii?Q?q0BhxDSi+CoA4zM7GNeInTyBZngbWC+upWopoCWepUV2EX5t195azkVC+Ngv?=
 =?us-ascii?Q?6m0ZRhN/NF6Zg1wYUAdQ7wHNb9qIp685EgRzt6/coUAkQlQRBwRm4r0H1K+j?=
 =?us-ascii?Q?Akz/3HuUwQvkjrKHXuRn4nex0zDgV1mR1lLYHczH+Z3I/eqvdj7tomeLy40J?=
 =?us-ascii?Q?wviYCUnByAkAC/fnKIcYDhohGdNSCj9eUvo22iGdRu5nnDebGjQFNBoJBJK1?=
 =?us-ascii?Q?4VsnyiFA6XO8MptJDdA9Oh4ZCD5qyltyRNS8idt0mo6nGjq8GvornqhLnpKc?=
 =?us-ascii?Q?ULSxUvvy0/gYKwhmBU5dY5y3cPKnoXFaV94EOR3AbVXiWO1P62LqCsfh7WXg?=
 =?us-ascii?Q?YpNNOVONPknzpaTgjidKiJ05PVRNPjIWDCZEs50hT4ZZTXwNqsCRQFuAWtCB?=
 =?us-ascii?Q?jb06T5A4ST50UceAp72O+q7B22e9LO3e39DA5oDLLF/OEVBWi3dT+7C4WlUT?=
 =?us-ascii?Q?3nIMjY1r+MmGLWjEkfy5NERrfNKhCDb1DTjOcj6gHXMSUA8wskn8115H7tSN?=
 =?us-ascii?Q?LSFQDzbLVJKUp5xQG1yLe4WkRxClXESJE/2jXsRAGKuRawDaDhjxbJZEcMN9?=
 =?us-ascii?Q?5IbJ2HUcgMPCVfX0OQcNIisPc7aBsyiidlqK5vpw79YwGE8HLszwx/mskFXx?=
 =?us-ascii?Q?f6k2MLVdRNyOgjdFZcAhDDkhGOs1UratSY+qbNgXipXrd7leDPYjpEFdFMVH?=
 =?us-ascii?Q?WFJZzFb3/3ZzBPEZC8xkcJbNX1VnfdBUHFwjTxOf716czr52GcbbX9vuiGu0?=
 =?us-ascii?Q?WQ1Yupdj35wFjbWtXKsUxjsZ6p9xta3H64ldCb+EMQ7Dg9UzoIfX6fsjgK36?=
 =?us-ascii?Q?hoTpvJF+6DrFlyyIqBYNuE0b8b+5SF3lHAPf7tbG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba95e6ef-5e3c-437b-9576-08db14c98fcb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 11:40:14.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 85xhjDM1OnR54n7tV3UC5bmadYqHQ6SxYon1MWiPKxp/X8Lp00jzra6O51gKL18AHxnKmsON9t4Z2wCSeV4dzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653
Message-ID-Hash: KNMVXCNOKRS7WB3IKPGB7EQALYK4KB47
X-Message-ID-Hash: KNMVXCNOKRS7WB3IKPGB7EQALYK4KB47
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Chancel Liu <chancel.liu@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNMVXCNOKRS7WB3IKPGB7EQALYK4KB47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wm8524 should be set to unmute while power up and set to mute while
power off.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/wm8524.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index b56dcac60244..8f2130e05b32 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -75,7 +75,7 @@ static int wm8524_startup(struct snd_pcm_substream *substream,
 				   SNDRV_PCM_HW_PARAM_RATE,
 				   &wm8524->rate_constraint);
 
-	gpiod_set_value_cansleep(wm8524->mute, 1);
+	gpiod_set_value_cansleep(wm8524->mute, 0);
 
 	return 0;
 }
@@ -86,7 +86,7 @@ static void wm8524_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
 
-	gpiod_set_value_cansleep(wm8524->mute, 0);
+	gpiod_set_value_cansleep(wm8524->mute, 1);
 }
 
 static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
-- 
2.25.1

