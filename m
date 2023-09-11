Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC979A101
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 03:43:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24D4286F;
	Mon, 11 Sep 2023 03:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24D4286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694396606;
	bh=/BERaRBhN9FXF9FbvPho2x3kb9JuSYXHeS+d8b3Ztrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uwZ7Ex1jf5xOpG3HT2REdh4ozRWarPGzvTFL578qZ+PU7QTBU6kPQkNrf8Gc0oAHm
	 MFHoKEG37WoE+HPGSrslaiiBVyD+wHe6rNc3KLmjHAJGlYUm8ePVeIDeqF2QNJTW4X
	 ysAFJfu1d62hACw46d5YxO/PJALCfTi8Lkqs9PSY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 704FEF80571; Mon, 11 Sep 2023 03:42:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A66F8055A;
	Mon, 11 Sep 2023 03:42:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 960E7F80558; Mon, 11 Sep 2023 03:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4644FF8047D
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 03:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4644FF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LUvJIgI5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKvH0ObCax3JSeVXHwcY7wIdo0WIQ1p7FMlcLVg67bQfPkRm5/J9S+0FmD52RcYfuY6cu2JLxcU5aIfRjYSZC9WF6TcD2gX+w6eyYt8egc55iNDv0Z5lZzWeMx7KE4el4BqvNc+8uBWa9n5CjmP06/Ev/gSpLRJ2z7WGpGy5MqZ7uIq/Lx0nrWRGxV+D3JaNyoi2kXYulzYLTC40wB2+YPl4ZB/q3nIbnsH7ODiXxcIoE1bbOxOqK9DRTj4zk51hmdcIuRyiPQphrwkbL7U5MWceq7NfIG9jA2XiM3VXdTswNSokyZt1ydu71YE8RVVGzMcpOtfM/2h5g9H6RTkGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7tpRLA2GZgP65eHN5lHj5vNNEsZHutNo9iQx3lRqmQ=;
 b=jIkx7OQGj4nZ0mHo7qxFkZSe2bgxZoGuKZaiyLsLAF/GhMZ7OZfjv3CmQjoHmTsUoGEhSb4h0C2sQhjPuU+y2ElWI7RXJtiP64u0fBrQaHo4EN4CYqlCvGQLdoZ4yI392Hb0TPnwvQOHWIbzGu9mAEZdjKoHddaW42M20LcVY8MRm1BAMNYuMaaJIhnw9VpytcmKWQuFpB5/hiPC3VxTgAyyEyonSxbr43fW4JIJjUfYmJZug7kkyRfvSQS8opTl19t5gkOlu+ahkBb8tpuVWfWPSpPCJO8IjuJ3Ql+AMmBm5RXDQtfW0loX9amsFk2Ulatp0viEWeuvX6wgWsWMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7tpRLA2GZgP65eHN5lHj5vNNEsZHutNo9iQx3lRqmQ=;
 b=LUvJIgI5rEppMIDnbEyJGAw+0R0q1K3fFsTGEUsmwkFAhqHkZdHR3L5AO5A4L05rTGtEx5r+uPovTDU2EfCmUJKIGIk6jHulch4ME2Gd7kURWilnGxnUyUrVzIkliBj1B58JcG9JH9cKfmVU1A3nBkfIHnNjT18FgtQB7FlcQws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11990.jpnprd01.prod.outlook.com (2603:1096:400:37b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 01:41:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 01:41:48 +0000
Message-ID: <87zg1th4f8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
References: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: da7213: tidyup SND_SOC_DAIFMT_xxx
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 01:41:48 +0000
X-ClientProxiedBy: TYCP286CA0186.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3593d569-64b7-456e-861d-08dbb26843bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yw8bevMLHlmK3qkCxlZ5XqMiWwlirI5fLoExHLNJYonw/FFCe1EYn3e0JdKOQmmiwt8gV1vzIZzG6DiMBQMv23DEbGe/N0hcp89zgAHvyf0+YKtBqqyFmCvxhHPYztecHlvSFJulL8Rx6iPR1JnrG/n207rowzq/H7ppKiqBcXRYolNA+BVCJqjxwYG5OjRL8HdPW1XYGMy21oADgtxcEgbYgK28Ou3DKvDo+KTmwkZS4CdJjLupKOvRZXAguELkY3PzLrnQoEeUJU9Qk3jWyQEgJLCt3TN4plztjPDWNDuT9K7v1kdRXgxBeVS5e2OC0jxI2XAbWcvey6PPKGV52unvEc7HXA+6MWoeVuOtfCoGcgzCkPs+abenL18FpcQ4y/UULst0dpgGSvNlA4+AfyT8JTp2zg/OVsLmgeg0xzXk4RwbkMhEUnelYbnoOTb/aUHVEJJs83UIiQmXSrVlZY5GF+ODTP0Ezqoe49iUIphbsmTVrzJnbGG9zWuV2eep+50GLMVNpNXCK6oj8Km29H8G2snTzNS+aJ+YL7vaRnDgs9Dnr81dr/lF62/7BRq5iObpdSlaf4oNjh9o1F6GKmTZhsqSkWCaSxD9jiAIqEa6Jm1QHgiN8HpIwfzep7ifKCDj1CDATNLUqzUPKzqiCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(26005)(2616005)(2906002)(66476007)(66556008)(66946007)(110136005)(316002)(41300700001)(5660300002)(4326008)(8676002)(8936002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QvZUaC7nWIrcQPaT8+vywmo5I6nXr3RBTWX7vV0hNRNCIoizL5FxQPp/0CBn?=
 =?us-ascii?Q?FPd8Nx4iyAJZ+M/k1m++cvOHxRlQWn8gjTHExWVIqjkm6puMjfrwFMR6/tA5?=
 =?us-ascii?Q?xNahXvo4Yy5cGaQ0iojHJG3ZMTx99d34EYBkL6eE/HpVTG/vJ7ULG/eQ5c0P?=
 =?us-ascii?Q?nQEu3jf8W5/EGBtGXbDTbEDpOWZ0BYGKJ910GDEUCjvXSvkWSCYV8pHy3fYa?=
 =?us-ascii?Q?mxNF6LiGJnF3jRdSF/tJlvKrW9hz+piMeNOyYv4I6nWLIPh4m1dkKn/sKDph?=
 =?us-ascii?Q?lOBBhNX3hxPkyI/29m1TWbUWLSOJwzKvvBsSm7h3RhEFVFbwCzo9//dnSEQW?=
 =?us-ascii?Q?QrmRYwVaSs7vJxRJ9aKm18SQ84Da1xBegJRgQyXsxzXy7X4ERjgsVMLY5hPT?=
 =?us-ascii?Q?j67xYi2D2hitMR/Sb6rpWpRO4X1N/ZV2dD09KfLQYW6GxXLwTKSC32WOu4Hd?=
 =?us-ascii?Q?4rJuZtZGr5ujpjEVI8QwEQwQxo9X6u2aaKeMsKh9RltFJ6JqQmRH0BuN1Ze9?=
 =?us-ascii?Q?6bGj4rnkE/eZJ+4lKLRz+B4ZdQZcH5W6z9CNEvrexzM1RbfD3AzA0582i8J7?=
 =?us-ascii?Q?XzR8IPkSFJqlcrkmof93D4CW2zjoiCcOoq8E6UiTrWJly/4T0k/Y2ictJtYV?=
 =?us-ascii?Q?/tMQ7KQqMLspflbd+KfNYWtyx4FBZRS34TzoxNmTRGozxzJ5Y1S83wup5bR+?=
 =?us-ascii?Q?NLbEl+nws2vIhMYan9A6XXi53O+FOhTuJ2zGExXOqGwiHC8HzDkmepMupISH?=
 =?us-ascii?Q?0eobr6S7dY5Nrp9OTL7winBR5dAkmfaoHcoyeHnIpTPYSnY3GB1zh0OvNtiK?=
 =?us-ascii?Q?zwG3ulioS32PdxEyjPAjRFTzM7OK3YmvFkHfEasMNs+9fd1cVm2ZWZS4Daes?=
 =?us-ascii?Q?eCQ98jLg9188Ae84Y2kxwypnkbGD0rijeshuiPg6RLjLcsxz+jIdmeMG0+Jj?=
 =?us-ascii?Q?N3kvvgeRnTCbfRo32JdFvpYlM/B6sw72dflJyCfnnbMAumHPkfKpBIrP7W+Y?=
 =?us-ascii?Q?lEUTS7R79NtoZu+G4RBLnMmttq/eju8DN5um96KBmwk3XLg3zHit2xBlhlHR?=
 =?us-ascii?Q?BYsdRk+x+X7oEi5HpF+dna7wvTxiOCfYCkUdIR3rRXtcXnAzw64JA8llnxQi?=
 =?us-ascii?Q?BktXn2eA0jESV8cCQT8A3hsfdKQjjen7DD452r2R0gSLN9XBf64WRvS1HFbk?=
 =?us-ascii?Q?SZPWDB0WuQiVXgHWcZM7DznBlNnnun8wnLmpXicDQWhzMy/odtp46Mgk2xFQ?=
 =?us-ascii?Q?uUvV1l7xgS8hcFUhMqYbSbz4Lr9d7Vl4WjXQrbw6uJpNikWFyODYwbMUgVJG?=
 =?us-ascii?Q?cqilUfhBD8ipoujPILDH03XTd21JJcJEHZoPrnYJdMwRMVpTGsQyaE3/5CWn?=
 =?us-ascii?Q?OkhyTSV0mrxn3G24qzFDUdwVIqkq9N6h6dDyW9HBq1Pzxh83u8mScpMSIFr/?=
 =?us-ascii?Q?zZiw9LjYmcXSl2m31nIoyUNlxcZBookG5TLfMDCRwAHx+TeKepsKZSHV8HzO?=
 =?us-ascii?Q?3Uom1Z2OKinLQoIzHZ6G35NhZM6tfUa4QcfYPf4rMCv6cbLcJ5KRJJT3S9ek?=
 =?us-ascii?Q?ZjQhdp7V9IgMQ4NU2yEf5a5yapGLWSCf1yEKsQYdZarm/7oWGCbinCHu0bo9?=
 =?us-ascii?Q?pmYCzw4/sjXY9YQXhmPmWpQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3593d569-64b7-456e-861d-08dbb26843bf
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:41:48.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S4Iy9qc2cqUCgfnoGKE/17Ur7a0MtJm+vEYuuxUnqkDUqlMaBB1QuU9J+TzHOqECPQgD4QygUrHLDosFhcP9KVkqBPbsY5Gn1lWJVdp5+QoO1FbqNDjQTn9fmRzRncpC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11990
Message-ID-Hash: 4HCLHPJALYIKTY7DU2CKG4XXLGYYYYXW
X-Message-ID-Hash: 4HCLHPJALYIKTY7DU2CKG4XXLGYYYYXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HCLHPJALYIKTY7DU2CKG4XXLGYYYYXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We should use P/C instead of M/S for SND_SOC_DAIFMT_CBx_CFx.
We should use SND_SOC_DAIFMT_xxx instead of SND_SOC_DAI_FORMAT_xxx
This patch tidyup these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7213.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 3a6449c44b23c..d725ec25ce2be 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1261,10 +1261,10 @@ static int da7213_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 
 	/* Set master/slave mode */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		da7213->master = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		da7213->master = false;
 		break;
 	default:
@@ -1293,8 +1293,8 @@ static int da7213_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 			return -EINVAL;
 		}
 		break;
-	case SND_SOC_DAI_FORMAT_DSP_A:
-	case SND_SOC_DAI_FORMAT_DSP_B:
+	case SND_SOC_DAIFMT_DSP_A:
+	case SND_SOC_DAIFMT_DSP_B:
 		/* The bclk is inverted wrt ASoC conventions */
 		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 		case SND_SOC_DAIFMT_NB_NF:
@@ -1331,12 +1331,12 @@ static int da7213_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		dai_ctrl |= DA7213_DAI_FORMAT_RIGHT_J;
 		da7213->fmt = DA7213_DAI_FORMAT_RIGHT_J;
 		break;
-	case SND_SOC_DAI_FORMAT_DSP_A: /* L data MSB after FRM LRC */
+	case SND_SOC_DAIFMT_DSP_A: /* L data MSB after FRM LRC */
 		dai_ctrl |= DA7213_DAI_FORMAT_DSP;
 		dai_offset = 1;
 		da7213->fmt = DA7213_DAI_FORMAT_DSP;
 		break;
-	case SND_SOC_DAI_FORMAT_DSP_B: /* L data MSB during FRM LRC */
+	case SND_SOC_DAIFMT_DSP_B: /* L data MSB during FRM LRC */
 		dai_ctrl |= DA7213_DAI_FORMAT_DSP;
 		da7213->fmt = DA7213_DAI_FORMAT_DSP;
 		break;
-- 
2.25.1

