Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645E7AE60B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:36:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9CFAE79;
	Tue, 26 Sep 2023 08:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9CFAE79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710172;
	bh=3ma2lXt5PFXHYLaMco8remmBQtR+Owoj3r1Mq5g5JTY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LK9mKwzPAWOfWRtDdh3dKHToC92b2eRC5kU9KZcFp/tCgd2WqdxwbxptaAMEFtXAR
	 7IND4y3uOUp96166JgwyGqdXv8B/qW9UZzNJ8USRgoVCG7Y95Sw7aKoyP7vSErVho3
	 78zfvEidemjMwhnjCW3BuSRfavFXdwt22lzFy3e8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2CE8F80774; Tue, 26 Sep 2023 08:27:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70252F8076B;
	Tue, 26 Sep 2023 08:27:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ED94F8061A; Tue, 26 Sep 2023 08:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E667F80614
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E667F80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S1Nriu6f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDTqT+dHO1HprocpZuMWb2NL3fTY7ZKVLrkeAizmcBUyRvhUVK5EcRfd2y5AHCFmfp/bJcEXiaUkFb61VrHPvnEH0CJiIOrEwOj0VnYuaHDwSzsfzmMe6QCtHEzDcL7oy7cCKy2iuGLg/ybd224zm2/YwkiIP3vpqjScCCead4MhjHSxRP1L+tV5KGOjQK+0UrNmiRv24G+bSsiEWxFLa4iKd1AaLMpnrH0BD9io68EMYD1ymTjsp/vIjI9P2XthVvnrEL2Ldk9dwypbooQEoanwKUoicW8EpOLvw3AuCgIhqZy4IKQ0TjeZ514DbRY5y3dOuDX41kKQ+Q1ty6b3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieKZK76b92YthWhL3vni/EtsN9v8Qa++gUYAs/WMRSg=;
 b=mfXA6m9Ewp4B/Ycd6qHl8OXElRpZlVGWZF+zKX6oBEu9jaYvfVcEOQprZQb3wwpNsU5ukYhZHLimOsIkUKmH1OXZyPIf59vB8xSRMXlI7XoViv3qojyOwNLN4z6gJMQF+FLDaIlgC7iEoks1lAvmvsbMvbbfzIFWK6ebNOJE2neQRlDluLHO5jJOpFCuhRrpHW4qsLUwMqeUjNa9XqZvdNUUt2RAW847YHDH2CnLvi13RWSHfvBAYnbLsb0cbbwVrO8FNMFNY5k4AxjRQzh9nLMEXAZIoB5ItKBNtICrRO3J9tJ7rJGkeHj/QjJM7eK7vPZUlZG6Mfip/75LjUAr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieKZK76b92YthWhL3vni/EtsN9v8Qa++gUYAs/WMRSg=;
 b=S1Nriu6fCnrel+G8ldKSeHrhi5Z2oGGOP99Tcv7weg88V922ldLWoneSqwTaANLbcTPSWumaUV4Qmuzf2zOq9fwmUSP879ElCn3/+deV5i/5Z9GK/4gpJiXVJYSVSkXlViDN7xLOctEhyFBwpdBQfymSYLJ8y29DDVHlza92a70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:27:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:27:00 +0000
Message-ID: <87a5t9fo0c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [PATCH v2 53/54] ASoC: soc-generic-dmaengine-pcm: convert not to use
 asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:27:00 +0000
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c85e70-76de-41fa-85e1-08dbbe599776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3x25K9x8OlrUvorUEaSGUzI6fVOhQoFylqm/5YiUM77Mq90XKXYi3n7SlM6nPIcd3x54s0bh5aUshtvxX3yok49LVqgDF5YJGP3MiDtkQEGZN8MigH3U96VNXrEWwNYMTfW2MhGiIxyl0Lzhrc4/l0D7+LBdALcXyUYTiWRBP0/9z2M+Am5ECw7G8WkAs4oBhtA8L/WapKjAyud0YP0p7I7PtLW3Ap8sYHWRg8zW/y2goEwC2SfJ/6Ki1O47ruiWCRKK9skcIw9zK/Z1PX+nENYySAUcM5Y5EMKIOMWtU2gpPyca4TGh1qtxkKqt/hDkqJJl2AphcEYz4vyZVEMvvzYX3dzWOUaIJcb6T+jhUt595g8mcSebZfazw5INOf3n2thbDqz+LB0+uS/Zag2ZWLicRJotGDjRkFUQbXfV6yHAAARtKtVg0TZ7yl8UeG9XM46O1HvnTyMMePYwd18276LZQm/ZNal510EAWO7UpwVQledUN3/+Bt4nlVZ7gjhXcOkquOmmcdBvIsSt2nJJRUJDvrS1V+H5S2jP1hjPN/22bPWLgs+xKg/+I+kGD5Mz71SX7G4SjOs+qtLx18K17nrr+T2yIX1Zmh04BiB7A3EhqR4kezZ845bXkJBFCkIF1k7xDXLnuMlj4tg1jIxyDAjkaTHu2oV+hhk1KyuSndc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(41533002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L9JZFvrPlh6VcO2v7sQSDQCNCMFsZ9rUppoXlQf4pBOxITZVnGEP9/Yr/1O8?=
 =?us-ascii?Q?UNg08mWvqIMBPJt8BJZHYteW6/Od/4y7LDfRBBMHebsRoCeD/d+GN1gINRm9?=
 =?us-ascii?Q?hH0oqKvadgCE+VamH6siWElg7p+QTx0kAb0xrqERPEGmw1DRRHrX3Mq3sj08?=
 =?us-ascii?Q?t8evXhyX17VNlnhQscAMqny+ZJLGZ6LzJjDPZkCile5/L/yKefR4aZoXJaSw?=
 =?us-ascii?Q?kVPdbq2JgFxaEpBPc+dOI3DW9y8KQ2ox36LQuUwS74lgg7jzh4Q4G8bDj4je?=
 =?us-ascii?Q?GT/0DHehJAApfut1irdA95TDc53HwusMbUxe+oSx6sBkbFbecfgUFfUyOjQ6?=
 =?us-ascii?Q?P4ElzUa8J9JR32qHBbw/+tPxiPiSnFsvak99oSmiLIB3Ko67ZY3GW71jRegp?=
 =?us-ascii?Q?Jf3rnPxnofHEFQXJtyk22sUCxCXZ5ydT9uBygopUqqbyyd1bxEaSnbVNbO72?=
 =?us-ascii?Q?atDeSteHG/d67c9YLPqUy7ql2foQdekRLHJ/bNGkeHFxoBlFZy+zCFWYs2je?=
 =?us-ascii?Q?3S8GZjJaLVV9/NlMtjo+XKUgW4WPIel+qowPqtvOVmNxnQ7+mhL5Qu8KzZKn?=
 =?us-ascii?Q?yDUCZO/ozX/qnIL4lSjF1q9YsP/dLT8Dgq5lQh9aAblLBcYWe8OQlS6jvony?=
 =?us-ascii?Q?YgtPZ1ffyFLOH66saA0n+h1cZnZqXpn2vAEWHORmG20mycl59BsUYcHo4Qvl?=
 =?us-ascii?Q?B2RhzmHltI6CS8EQD5X23nr8XqJ/aN3WAZF+Y0J68AkcJBqCOYxuLl/ocm4t?=
 =?us-ascii?Q?OkRAwufiRTnjp+eXtrFZD0YKCqFr3cKvGM/7spd5zHjMKEL5FEDMaxqKIrmU?=
 =?us-ascii?Q?NnTOcUt+bvRY0zDlrTupJMIRLaSBW1Ixjy7P84eiGaJa039fKVa0/W0s7+71?=
 =?us-ascii?Q?W3OHdr/JWot57XoIgkGCiG4IcfTP972+ft17JECxmO2+bz+oprC/jKKwSlaE?=
 =?us-ascii?Q?hFRs4lsnyChu0K+Kv56IBhOvpUZui/o+NN50I0KLVSTxRtmiI/ZVeYV6HFiL?=
 =?us-ascii?Q?TNxAVAKpUXUg4vxfhS7bNqWUP2qqSIctynWr5sxWH6JbHRBqRKCryDrlNlRd?=
 =?us-ascii?Q?j4OqEnJyJCZzZhU0o8rrevGgeTmyeixOSJ0vCLKT+LL2p1INWp6AxQMDErX1?=
 =?us-ascii?Q?ue/xzfQsltCno6AWrDcun+BJV7SCM1JqvHDm8ENqR443MpDhnES89HoSDxCS?=
 =?us-ascii?Q?P/QqNz009Glc1XISGwqD0cKC7BwDy7blNVAh+L77pA6CBr8b1NwoAPF1IBX0?=
 =?us-ascii?Q?DJOf9cwD/3hucf1cetM/C/J9LVGyxpmYlN5SiiCAgTeQL5xr+H3mQ/BRV7S0?=
 =?us-ascii?Q?8XVClJ5UPCKNzk/wZPn+VqoqqHXinJOmZIx+SGUF4kvekgAcrKDCId0jGbCI?=
 =?us-ascii?Q?VwXK5MBuAwTLiC3+pGSTBYvP+MUgzjOGZPPe7OOSc8FIb9BNb3eZMe/V5/or?=
 =?us-ascii?Q?v42IneB4tqcgTBYCLlOVmPuX9qpgEzucJ4o0gnnXrr4IEew4rh/V6+zkf2uk?=
 =?us-ascii?Q?GrD/ScatcatevJ145LD/A3qi94OqeAXbEpB3RaJPQXG409bxjuEp37mtT9F7?=
 =?us-ascii?Q?8HAJ6xHCk8CC5v8qSEiQNOUFOn4LFYZhlDC+wZ6srAe8C7bD2E7GxpwCqTmk?=
 =?us-ascii?Q?F45Ldt4tlfX1G1MmZm0jeY8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4c85e70-76de-41fa-85e1-08dbbe599776
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:27:00.6303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9XBnb0/yf+aWY17GDWFUFtBZqr52Mr0GXkR0IzaPFJg4DAW0L1+zjfoWLE3k0inCFk7xuvcVURLErfrBCTVHLiykFzSwOoV6DnYuKP8UMkNAYshW1669FAvj9ttzIa0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: ZTSLPPW7FJZI4I3H5CAEZN36NPEUW53D
X-Message-ID-Hash: ZTSLPPW7FJZI4I3H5CAEZN36NPEUW53D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTSLPPW7FJZI4I3H5CAEZN36NPEUW53D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d0653d775c87..63ae0c2310d7 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -50,7 +50,7 @@ static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
 int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
@@ -60,7 +60,7 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
 	if (ret)
@@ -98,7 +98,7 @@ static int
 dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct device *dma_dev = dmaengine_dma_dev(pcm, substream);
 	struct dma_chan *chan = pcm->chan[substream->stream];
@@ -115,7 +115,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream,
 				pcm->config->pcm_hardware);
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	memset(&hw, 0, sizeof(hw));
 	hw.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
@@ -185,7 +185,7 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 		return NULL;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
 		return pcm->chan[0];
-- 
2.25.1

