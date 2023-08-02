Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA2276C1C5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 235C1210;
	Wed,  2 Aug 2023 02:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 235C1210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937924;
	bh=lptviGAERvVnwVKJ7LTYAm2FXK94eKR8SJZamHmYrGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hxl++P9edtmUvRft6ngMOpDWoEjOlhbHKKy6xH0ljZtgbXdCJvigvC8DKS2JBfusI
	 sAjoM8rqJIInfW3wt6tJ4ITzeLxB3PO7KGtYGAoJ9Pddm+Ayvo/BolgmA4HODtpX5S
	 vIVR/eKON47+AcVEDwL5aCy2JQLUb5g7wmpWBzu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238A9F805FB; Wed,  2 Aug 2023 02:55:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4920F805FA;
	Wed,  2 Aug 2023 02:55:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4835DF805FC; Wed,  2 Aug 2023 02:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8094FF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8094FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UgAzJ1b7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ztm4DwcxOOdz1OJe6w2M5wGyldML24Q0ox27OA/CSInKlXYlNKHl9yFTp6mNHJOxJyXDcJhHRWr+776rmDCxHQ/8tWW86dwi1itO6khDb6vO1a3uN0bHCe21THk8Qhhr/e2RAlksVE5tp9tTSUlI+2QkWiCXpIRD3u/dSQhOqOsack5D9bavj4tRgvPO63dWCBRTmZSySd4n8w3AY6GvmAW7pmZWH0VQU8zcqnvsFf+uRDBimtOZr0I9NuX8aaXWKtU4nVrqy9txQkiA/6jOLC7O3L1P2k71ruEweBTo9etHw/cpCTPp2YqvnRLzCM7huwB45LMCWx5xLPhe+e8f6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbAIO1PkUaIeCrGezk//JvVkf1PpGZSGF/u4vP7S5RY=;
 b=gVwboOBYdbSAiuMohG3XpYOp7985gOCAeUHWjPF53blvbRSzMSVsrDx3oeN0dtMZb3F00VhBINeKPeS5/wmAvOUd4EaO95VcgRAJkvydIruR79xbdyVs/IcNWklJbijvq29Jr4Ej6EFc8LJNKGEYS6VC9TmlbZSAuk/nILviAyZ7jO8dy084zMoqJeMOskfsX7uU6HEG5tbqxJaJxW9Kqms+Z7l/EgXeqXEeckWv5ny5AUFUptp42gZOki0Ua/YsnkHIZEA8TGZrMJo9RiGYt75T3s05VAo8O2fB71+oKwYonwogjWPGLmylwarHIT1fa1BcyBa8AZ5NS/kUc2fc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbAIO1PkUaIeCrGezk//JvVkf1PpGZSGF/u4vP7S5RY=;
 b=UgAzJ1b7TxxjNEanBkz6r/GcX+IkGAYNPrEkG/vJmzWcIHvlWNXkg/wxZjxCqmeZLTOFOD5BU5vcI4Lq/R9rphpIYw04hFS+xX87BrRNC8FuWi904Du6sNIZoc1j/+z9KTepCQyFLrG2iWR7INuYA3I9XiySHP2rETPf5RraiZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:55:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:55:08 +0000
Message-ID: <87h6pitg9g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 20/38] ASoC: atmel: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:55:08 +0000
X-ClientProxiedBy: TYCP286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ebd0a8-75cd-4fea-335e-08db92f31e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XvbYSB9VL+abVrY3xO6CcFLDqpIly4QP48BD6Rr8P4GtfZrz4CBodhHK0Pt4W2roVsvKRHm5vxZfE0xIE7ozR1Yqu+r23C+1Tv9IYBMbJGYHjuuHUXMfyTOkIXD1Y3U5/bhvtzhEvrLqDbJtxkkLRoxfIMSSr1W1SnbVX0khS6xsljjdkOeOMZAV1oli1pl/iAvI64BBjt3K/HqVhl9pwqV++5iLMmVEf36fJRMKLJr8o2G9LrM0+OcXjbSyG43149Uugu3JwbFcqcFWYWWqoy+9P3KORR/QuesmKBn5LPcZuOWKBxz+Mqt0vBNKnwdHH3n5y556zlQsGnz/rzfpSe5OMUQzFckOV/8V/81l6xNkvfuOcDBYKCV7A98PtTymobZuD+NX1r/tUCxSfsOJ6TGERvc23N67rpD/V8+G4lBW2RzAkYMlEe+pFrLcD1H0Un/cxL33Lw7AM5J9S18kaCOPVCYwOssFhx5R0TY2+qEFm3rqI93a3yj6cUhPYAMupbdB3RNuZGVQPMusMM8ECFssQMD+/CrUqHWwtV1i1FXKdvAmO79kAJY2ghXePzloyaT2phM392nH7nX6afyVt0sxMyX5vOmWbh7yxWpr0d3ihMTi4y80C7B+Jik5fQ69
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7hRnIwkhI/PIe4tecWqn+5ZkJ0eWKGzIagZlN+pEL2TvfuEW5HRE/PeBjOiE?=
 =?us-ascii?Q?OrajQWFQhdI7tRkx64LyigSFzX9xpksMaaQMSmP4EwT6JeGylROD+0Npym6y?=
 =?us-ascii?Q?pyUKszZzEA7G+7V5H3mKs3YR6PzALgnoyIHBg+BsCd4QH8bk/Wkrb/+sg7NQ?=
 =?us-ascii?Q?9NA4y9HHZeqffFP/4vkG2QC2Nk6LeCwhsQEIAh2a/CUzmT3WlmTex/dbBo9X?=
 =?us-ascii?Q?ijnbOyZihIScCn4AKpi5zhb4aTNgMy3NLktLwJJ2legFFfPcO/0qcCTBfSpO?=
 =?us-ascii?Q?RoXqkZwdnryARJex81WiF4gdzzoU2htazHWcPZxTJrTlewAnU+8kZAI062uI?=
 =?us-ascii?Q?cCPC0tOC6mE8ztWI74ImMHJEEFvX1y94ZunpbVlDQrf19Oo8RUabidpQ5+EB?=
 =?us-ascii?Q?0N1eFpI72wTY6aZ5yyyODlvTWFx6NMYXl1o3wF5dSMPpjWC8XIqH9XXbHbEq?=
 =?us-ascii?Q?2+hvBf6uYhMV6cFc225MDNkv9mL7szUXcYg9m/nHzyuVhHlrJ/i9DV6YEmbN?=
 =?us-ascii?Q?Gg49OybBI0ZxohsA80GLQsIK31pEim2ThrorV2ZkNE/Txhpra5LT9AcZ+ZeP?=
 =?us-ascii?Q?muV7ELeq7Mdvoi4lvn/0CCF8eDOuCa1ACbECIakfkzdknGXOO1VZyvUdv/y0?=
 =?us-ascii?Q?0i0dkvp9lZeubVS616Ar5mo+K1rlDb3DCt4TOgGaTsZazKTh2KE4YyYARMKQ?=
 =?us-ascii?Q?mI7kWPCvTdV7s4qnDEcnNGMLzjbmg14BOppJo+QOiriyOmUezlmRERfiK8d3?=
 =?us-ascii?Q?5PUQUfAN/cDWhzkw8x4aMNCZFRX++ALFTFLs79y9aLv/rC3I9uFQPDm3vp29?=
 =?us-ascii?Q?rl7/7+SJ15CNCXNdBzxylA7meyelX5FkZBaOfssyPtvTGE2FIar6DhoN8pwL?=
 =?us-ascii?Q?kgm+HGBAP9d23th3xeTC/qpBlo2AszotiRDvIfBZoP1+xoXvRj+9yfcGDSdh?=
 =?us-ascii?Q?Mf4IMRDcLi9BaskV/5RW4fWiGgOFUG5SHSC4cYJxk8AEBXZVHPN49y3Ofmvv?=
 =?us-ascii?Q?5z8wU6+7urOU+KMPuKJXBuR5/y5hs/1yIPJTWX9gcYC+91Qn673aIrGTNrxQ?=
 =?us-ascii?Q?GBYeC9lIedNa50PyTtz1SlDBLOSxySztDM1d6AqWUqh3FTKGXJQXbbiTxuQo?=
 =?us-ascii?Q?MPjWgciMBFk8SMe1oZ0NPDyRpcvcb+uSJAV44wmPngoyCHKsoVjqBTJsFVlH?=
 =?us-ascii?Q?3e9MhKNIxt90PcNE5MGlL937b0ibs8aSxYMRc5GbQZWtFfCswYfZ5o1z5Diu?=
 =?us-ascii?Q?90i0CvUnlBpQzaor5L1w1GuV2jfUyudgxlJENDBSopSWDt44e05B5WKeqU87?=
 =?us-ascii?Q?kc9bUgVp9TbAvfOxN/BfqNUGs38f6a4vrlIriADJH93DoThh6n0JT59aFaPo?=
 =?us-ascii?Q?loTbZHFjz5hAAEySkqxuAzqEwhLXOPmUBvl5INVqIhgNlf42P8anw4Wk3Gfi?=
 =?us-ascii?Q?N/j6RFbG6Vdp1dIR6zeoSoiyVS/noavqQmNdzsaNuqalIQhkPz5m6gksj8Gk?=
 =?us-ascii?Q?0Et5/i0hN23rAx3vIaBjIfebVan+ER75npzl3X99r5P5aX8PPJVl58d5y5oq?=
 =?us-ascii?Q?usC+swzf9GQSpUQUfxYmUwyt5XseomxA4amo2A1XkCC0Jz1LVwNq018ETfIp?=
 =?us-ascii?Q?IMF8+/B0ClLiSOESuQUsuoc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41ebd0a8-75cd-4fea-335e-08db92f31e1e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:55:08.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 365zwNGBk7Sz/2I+/ec2vtkDu+MlEuCPKmSPIwK+u+lz/ULn/r8el7aJp5fzrr7K1gz9bVOQE6oNM/Scx3GTR0vvRSdaI+lzZ4P/aLpmhfDIQU7s4JHvnxoPsuJ0INf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: 4XVEJJBPXSMXS2JUPGYOPF4Z3NCVH3ZS
X-Message-ID-Hash: 4XVEJJBPXSMXS2JUPGYOPF4Z3NCVH3ZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XVEJJBPXSMXS2JUPGYOPF4Z3NCVH3ZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-i2s.c    | 16 ++++++++--------
 sound/soc/atmel/mchp-i2s-mcc.c | 24 ++++++++++++------------
 sound/soc/atmel/mchp-pdmc.c    | 18 +++++++++---------
 sound/soc/atmel/mchp-spdifrx.c | 14 +++++++-------
 sound/soc/atmel/mchp-spdiftx.c | 18 +++++++++---------
 5 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 69a88dc65165..0840b8220510 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -532,13 +532,6 @@ static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return err;
 }
 
-static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
-	.prepare	= atmel_i2s_prepare,
-	.trigger	= atmel_i2s_trigger,
-	.hw_params	= atmel_i2s_hw_params,
-	.set_fmt	= atmel_i2s_set_dai_fmt,
-};
-
 static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct atmel_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
@@ -547,8 +540,15 @@ static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
+	.probe		= atmel_i2s_dai_probe,
+	.prepare	= atmel_i2s_prepare,
+	.trigger	= atmel_i2s_trigger,
+	.hw_params	= atmel_i2s_hw_params,
+	.set_fmt	= atmel_i2s_set_dai_fmt,
+};
+
 static struct snd_soc_dai_driver atmel_i2s_dai = {
-	.probe	= atmel_i2s_dai_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 7c83d48ca1a0..be83333558d6 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -870,17 +870,6 @@ static int mchp_i2s_mcc_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
-	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
-	.set_bclk_ratio = mchp_i2s_mcc_set_bclk_ratio,
-	.startup	= mchp_i2s_mcc_startup,
-	.trigger	= mchp_i2s_mcc_trigger,
-	.hw_params	= mchp_i2s_mcc_hw_params,
-	.hw_free	= mchp_i2s_mcc_hw_free,
-	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
-	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
-};
-
 static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
@@ -895,6 +884,18 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
+	.probe		= mchp_i2s_mcc_dai_probe,
+	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
+	.set_bclk_ratio	= mchp_i2s_mcc_set_bclk_ratio,
+	.startup	= mchp_i2s_mcc_startup,
+	.trigger	= mchp_i2s_mcc_trigger,
+	.hw_params	= mchp_i2s_mcc_hw_params,
+	.hw_free	= mchp_i2s_mcc_hw_free,
+	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
+	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
+};
+
 #define MCHP_I2SMCC_RATES              SNDRV_PCM_RATE_8000_192000
 
 #define MCHP_I2SMCC_FORMATS	(SNDRV_PCM_FMTBIT_S8 |          \
@@ -906,7 +907,6 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 				 SNDRV_PCM_FMTBIT_S32_LE)
 
 static struct snd_soc_dai_driver mchp_i2s_mcc_dai = {
-	.probe	= mchp_i2s_mcc_dai_probe,
 	.playback = {
 		.stream_name = "I2SMCC-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index c79c73e6791e..944d78ef2f36 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -706,13 +706,6 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
-	.set_fmt	= mchp_pdmc_set_fmt,
-	.startup	= mchp_pdmc_startup,
-	.hw_params	= mchp_pdmc_hw_params,
-	.trigger	= mchp_pdmc_trigger,
-};
-
 static int mchp_pdmc_add_chmap_ctls(struct snd_pcm *pcm, struct mchp_pdmc *dd)
 {
 	struct mchp_pdmc_chmap *info;
@@ -765,8 +758,16 @@ static int mchp_pdmc_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
+	.probe		= mchp_pdmc_dai_probe,
+	.set_fmt	= mchp_pdmc_set_fmt,
+	.startup	= mchp_pdmc_startup,
+	.hw_params	= mchp_pdmc_hw_params,
+	.trigger	= mchp_pdmc_trigger,
+	.pcm_new	= &mchp_pdmc_pcm_new,
+};
+
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
-	.probe	= mchp_pdmc_dai_probe,
 	.capture = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
@@ -777,7 +778,6 @@ static struct snd_soc_dai_driver mchp_pdmc_dai = {
 		.formats	= SNDRV_PCM_FMTBIT_S24_LE,
 	},
 	.ops = &mchp_pdmc_dai_ops,
-	.pcm_new = &mchp_pdmc_pcm_new,
 };
 
 /* PDMC interrupt handler */
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index ff6aba143aee..5da88a8562ba 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -503,11 +503,6 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_soc_dai_ops mchp_spdifrx_dai_ops = {
-	.trigger	= mchp_spdifrx_trigger,
-	.hw_params	= mchp_spdifrx_hw_params,
-};
-
 #define MCHP_SPDIF_RATES	SNDRV_PCM_RATE_8000_192000
 
 #define MCHP_SPDIF_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |	\
@@ -1009,10 +1004,15 @@ static int mchp_spdifrx_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mchp_spdifrx_dai_ops = {
+	.probe		= mchp_spdifrx_dai_probe,
+	.remove		= mchp_spdifrx_dai_remove,
+	.trigger	= mchp_spdifrx_trigger,
+	.hw_params	= mchp_spdifrx_hw_params,
+};
+
 static struct snd_soc_dai_driver mchp_spdifrx_dai = {
 	.name = "mchp-spdifrx",
-	.probe	= mchp_spdifrx_dai_probe,
-	.remove	= mchp_spdifrx_dai_remove,
 	.capture = {
 		.stream_name = "S/PDIF Capture",
 		.channels_min = SPDIFRX_CHANNELS,
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 1d3e17119888..4b19a98b331f 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -516,14 +516,6 @@ static int mchp_spdiftx_hw_free(struct snd_pcm_substream *substream,
 			    SPDIFTX_CR_SWRST | SPDIFTX_CR_FCLR);
 }
 
-static const struct snd_soc_dai_ops mchp_spdiftx_dai_ops = {
-	.startup	= mchp_spdiftx_dai_startup,
-	.shutdown	= mchp_spdiftx_dai_shutdown,
-	.trigger	= mchp_spdiftx_trigger,
-	.hw_params	= mchp_spdiftx_hw_params,
-	.hw_free	= mchp_spdiftx_hw_free,
-};
-
 #define MCHP_SPDIFTX_RATES	SNDRV_PCM_RATE_8000_192000
 
 #define MCHP_SPDIFTX_FORMATS	(SNDRV_PCM_FMTBIT_S8 |		\
@@ -703,9 +695,17 @@ static int mchp_spdiftx_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mchp_spdiftx_dai_ops = {
+	.probe		= mchp_spdiftx_dai_probe,
+	.startup	= mchp_spdiftx_dai_startup,
+	.shutdown	= mchp_spdiftx_dai_shutdown,
+	.trigger	= mchp_spdiftx_trigger,
+	.hw_params	= mchp_spdiftx_hw_params,
+	.hw_free	= mchp_spdiftx_hw_free,
+};
+
 static struct snd_soc_dai_driver mchp_spdiftx_dai = {
 	.name = "mchp-spdiftx",
-	.probe	= mchp_spdiftx_dai_probe,
 	.playback = {
 		.stream_name = "S/PDIF Playback",
 		.channels_min = 1,
-- 
2.25.1

