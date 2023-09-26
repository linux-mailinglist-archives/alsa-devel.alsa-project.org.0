Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5D77AE5C1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243D4E91;
	Tue, 26 Sep 2023 08:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243D4E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709437;
	bh=jgNFtKHkdErYxCZQ1r+k/5cOm1HXpmR5K5JttCVttuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pna4wKSbwe+SES14Uoi/YvzGL7l0YJ4NnnwOnLd1MK3EGX7FvtkOw++HGMRA3tTDo
	 vN9TRoTJKKEeUkQ7RcGjmHUYmeOOKz/A9zIn2WAX4lMYzmbdJovuqQHKnX2ae8aFY8
	 6Nirk6/tG+6CjLTCWvbCn2AFuDjCYbdrfF5p06RE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4D12F80553; Tue, 26 Sep 2023 08:21:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D37F805D2;
	Tue, 26 Sep 2023 08:21:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C18CF805C6; Tue, 26 Sep 2023 08:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93E7DF805C5
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E7DF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Fl83vUq7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d244LBpN+xcqi4AWN3iLodK4wG4GAnCyA60xLPjqkoXGe8qAScMu2CEbcOOgRkA+jS1EJOxt8Bv8YFMNFrRBAX+BINYwapvCVgD8dZ2CzrAMlceJLDYwyjk/XsSP17A5LiZcHf7pdFTZytcQ5r775j6qkUHW4bkf+/TgLgAz5Kd7G7OMbrQgSf/9TnRfATlEyUJRWTDSkvCPvYxPGxEF7ZEv99W/YJr43gDaca/ZL3KUNwXxfo05/Do6wIM/neGHDIXwiybi2GMHEHjtOSVa7kvLxFrE+Bl4ypF/G3nttHHIp9vTgTugyE7hG12BSdlRnQcoir3/Wtya5Z2dY2+EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6ctewlhnV6MC0z4WQvKY7BRsPdcJqkjqAdCkCiwm/Q=;
 b=URcJU7x2W2EKIV2yy7dEYZY/iMxU+htc8/SGgYCpNe4WnCIDwxOti2600J/moqmoG6uEGVEhfsQ5OcYeqy4cZThTj0qnT0GqhixvcELBbfzXdvHMN+Imqix+48lA+HVASTpdCsiilNFlJ64GOB8OfnnWFDm+05IJ01alnCHjdmOxV9AheHHU9z1BMs1UJRSi1S67Fkd8hZEo2oj76tBtK8/YEN7rQag5jrFhqB3vY2YzEef/EXSqciYWPjj4Vyg4WZQ7dLPKgHhPAQTSQ6KG0/WXq1yTHWhgnQ7tqllvQZFpbbm0EEkbc4Ghxf/MIuG5z3C8AYa1Taz4YIS8XIgu7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6ctewlhnV6MC0z4WQvKY7BRsPdcJqkjqAdCkCiwm/Q=;
 b=Fl83vUq7bHpmn6qaEe/WRWO4JVlJovklXTcJh/4vKf0mnwXvvjfSrKkdUDybFBnhQ4V7Vvi/OnY8qHxbHvNtJeptUH0diEwbFqJr9TdZn4nRHlozuR43vOsvlI7HZBsyrmBD35uIqGxhpckomoz9q7S1EqCKugoIJ2RgCp/n8EY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:27 +0000
Message-ID: <87zg19h2u0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/54] ASoC: img: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:27 +0000
X-ClientProxiedBy: TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: cff80939-6f1b-493f-507f-08dbbe58d10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KGTyIRwJAUFtfMxHUiea8T/bd3GU1vhwbnEgLm60fqGHUEBRotC1k01j0xQBfdkNJsq1fCMfHar8cZCjARdGr9mhgVFxnN6cEL+tSVdiVyBCXSDFCLHQpGKoVUc/tfyaHwwLy79D/ionzBM788ruy2HgN8bXEnBohDyzIZBT/ce9Fwutdy/9Ldbprz8eyzIw6nCXwCepPIXc2wejJxNgA2QUokNd8PtKZS5amAF/AUqe4zFJ9MWDBmOyHbYHeGybF79bjdZwh/ACAPafhfOHsfvM7WyE5uYeO5PZbBgw/c3EAT5tJzfKXKEMmUlAI0tyllXuKUPQZcGce79NQ7ajBSq8FYXItrXu0Aoe1gdOq+p5KqVFL/cyxGohpoVLv821pPFvwYfWm4KFLjYxJCvQ9n3KSO6xbBoAWnWPr4nlfU442Js+EIwOUDpQKlOjY4rfPwyu2m37Ctb++Yj/GSbdMQw3pdGiiOoNaw1+y+EBa+GW9xJdRuu0wav2pfgA3ehpHiQREEOBSiwDg0Fia4ckwsSgeslQO08DuIk/ClYXk/s7t0Sc3yN/K/iNT7dOuA5nPPD8pY33U2mPXdfstJJlbkrtxgfjjw4yiM5o/CjRbpe2vwWE51IKhwSld+lQpLU7zyIGW/2KB2k4lDkiqjmYHw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JC4Hm0B6BTUcjAR9F0sGt0uuqiUBflwE8avtKrbncxwUpX/PzZiOhXKhYh8t?=
 =?us-ascii?Q?tUNES4qf1LrxoRzGc3/AUshKA1WpV4gT4Bcy6v7B4aMb8dVCr8FaoJ88cHJo?=
 =?us-ascii?Q?rZUvPsqXYv+SECmNpkskTcJewLtvtv2ceCurCRYNNJT+Pyd0IPLwXb0cbrci?=
 =?us-ascii?Q?439cAhaleVCzH0oIJCkZROGJWUyjryohGxmsJSP4RxBy7catFY2l4cOXfRmg?=
 =?us-ascii?Q?OBRlXEt+GATtzFLgA3ZKw2UICgShhMAsug9z+m44M2NobCcS8NoEq1ANppn1?=
 =?us-ascii?Q?IVBNKfdYY+2+vJmhHMoCSaMLzltq3qC6kiyLYZt3+ImR7iQKRcyDH3Qd32jr?=
 =?us-ascii?Q?ijV5Fl2TtwtJqR/FepXubc1Fx4VnwNGkXJ/dtCSR2wOB+UWqfiXBNMn7QR0w?=
 =?us-ascii?Q?NkhtiJ9rkWENJw5C7rm4bvZ63rnNuaMMv1cQvGhIGzJatJTlsBMYxI49dMIa?=
 =?us-ascii?Q?M0S2WRGUe8vBW6c7tivXjMq+jZ8F8I6yDREai5es4E/z523vNzfAio/eIp3S?=
 =?us-ascii?Q?ttXgLbA0VM3dkZBDOacv0oFe7SAg1BmXHqipjkOMeNu9N2/Z5dF5Wwtd3MLj?=
 =?us-ascii?Q?WyqxMHPVcqALMAEHJeo7DQJfNtAz1gp97mSm2BOWz5nk9DhnBJfZQtpNv3mS?=
 =?us-ascii?Q?hFUuqQuO6km3uqnbwu2uDyOpUE7KeOlcHYYvCXtahGq0dafq/UMdbKZKlswY?=
 =?us-ascii?Q?dSg3eIgtEWVRvrLt+GGnMbFYtUGN4aktk4xI35lQmGSjVWh02Gx/AHs+IR/R?=
 =?us-ascii?Q?ZKRgooWYKFRmf/T5sN5G8hI4nsD/U+rnPepPB3QZ0YqOrFIR7UKXQ0xyslbk?=
 =?us-ascii?Q?BawLLI7hepGK8okzw7i4xdYzLHC/KbxgDtg50ysd8KPaPURVuVraA54Qtzsb?=
 =?us-ascii?Q?PXMBMYBFNaukf27AmxljvEuqEDaQ9o/5qQjhtjSjUvUsC3O1kZc92MD+x2rt?=
 =?us-ascii?Q?+i4vD2jzUuQ0/WctpRtk5cZyts722mV8FeFpOTIFV3tUdhkrsRk9eI7F5FWv?=
 =?us-ascii?Q?AZbOzDkfEmQVxiW9hY3+efzqUL28JAU6oQ/az9DLpnAnPVLEruiJWYfIB7fo?=
 =?us-ascii?Q?Jtwu0Wa3jjXUCcsxJeI3stz0cPkbSYUa7Aaf4ZKi2BzssCXUmp97uG8MEDb+?=
 =?us-ascii?Q?aS688FGa+orF1sMOOwTwfRZLZhvBlq2+xTO4i623keOLIjW7YIbh266R7A72?=
 =?us-ascii?Q?eZUffDOU/ruCMf3r/RJQUp/T41VLlhblXd1mFUt2uUOwJfarf2LutaozYhIj?=
 =?us-ascii?Q?uuQMjWZu4Thw84uOI2aTQZ8AttoN7Zk6jwbtSEXjBW/o3ShAPeg4v75kgkPn?=
 =?us-ascii?Q?aKYfzdhuwqHxmzXe+E2yp/+DygwI4In3qplnwrxlARsx1UlpxdB5k8evgg45?=
 =?us-ascii?Q?3v6BwdKEkyO12dV729kWgtZesjblEYixpOJa2obhYdZnnNWwfNKmOZmBgU1i?=
 =?us-ascii?Q?LR7wxDIxxsOPeQbrCvY2bNvN9JbQrrkWuxF+qQTDwym7j03FQZy+8uCp00S9?=
 =?us-ascii?Q?/C+ZZLjX+Z14tA5e0u9zlnBYUw87YsoHScTlS0urhOVMf2FvsJ4lRSNZxqm3?=
 =?us-ascii?Q?/gSwa6SLAXOFVk7DQ7zYko3I1FKV9q5sDlMK7NfMZV2c1uHt+NH6FjVe3fFX?=
 =?us-ascii?Q?4UatY6L6K01Bdp1HR445A34=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cff80939-6f1b-493f-507f-08dbbe58d10d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:27.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V4WhiDS6BpN/4rfARpJ0X+B4ZMOFaBHZVInFKJ9zMx8UkjkFb61zbDVTHg+wMN8XOg6Vn5OGwp6wr5dWDnvNq70oxwJ/KlxZz7MdRQIY49x8q2ihhJxgBbYZEu1mNCFO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: XB3FQ3T2VJGXGF6AEZHDMJ2MIULDQ5EK
X-Message-ID-Hash: XB3FQ3T2VJGXGF6AEZHDMJ2MIULDQ5EK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XB3FQ3T2VJGXGF6AEZHDMJ2MIULDQ5EK/>
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
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index b6b6339c164b..dacc29fcf24b 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -399,7 +399,7 @@ static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), st);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), st);
 
 	ret = snd_hwparams_to_dma_slave_config(st, params, sc);
 	if (ret)
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 41ea5ba52181..f442d985ab87 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -405,7 +405,7 @@ static int img_i2s_out_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), st);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), st);
 
 	ret = snd_hwparams_to_dma_slave_config(st, params, sc);
 	if (ret)
-- 
2.25.1

