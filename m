Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53368774EF2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E7BE88;
	Wed,  9 Aug 2023 01:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E7BE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535924;
	bh=2pEQHopeuU9Y7nDeCsOU85jN82H4WeP4ub6trDG/C1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zy+8J489bWNJQdUe7p5h3R2uE4a70d2EKLOGybYIip5lGjQmQlWC+XFrYrd54t94F
	 3V0dfqSH4TyF54v2QToS658vcJJugl1AYzeGMxWOuwH9myl7kxbiFy3S0d9OzH0cTW
	 uw2DBv3MBJkxY0lD9DR5hcNBfvnej9msGgEPqldI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20E23F805F2; Wed,  9 Aug 2023 00:58:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54156F805D5;
	Wed,  9 Aug 2023 00:58:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA066F805E7; Wed,  9 Aug 2023 00:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B62FF805F2
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B62FF805F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VOWe+T+7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOUR7UJqYWNq0l1BzZKHj/eB60NG03RiXV4+uxrJs9yMArhMJV+gLkBWSy2mU11bGlNIRiwUJsBkXImsGwCGfY1mWuPhC7nWp0r+1cQr5ZGuN2VZAUSrhsVPmevivluhfT3F7ibBIsD7HGHPKrHPO1S59QWaO2nt2EvAmzg9C96Y2tEgSsxxuf9ARmvh8B14AMAGm22tOUfA/GLCFS6A08SbltZt4cLiKibxh8SknIaDXQ0rB8D7sxes471i+DeFDwYJEWIRK6LB3QIeVjnVYAPc06Hfmjhtg3p66Pz4v1s4tjSHm2iq33ZA00L8c8RhAcn15LnuaquJDEUSE8/agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39sKBHF3W+R1Hb50KD2+MC6AWxkxd8CDJ3zPAkda5Uo=;
 b=dPs31UixBs2PA0p+JpGNvbZSr4opGFE9NAoCVqk0sJAbdRfyqA3OP6qlVnmd4TXC0apCZ+EZqS3u/6cqFpj4yAM1gAVy37A/SNnMVcZIRAqypGm7krQhkpEXRxfz/238sdYFAxjToSWAO++uwOJXy+wEng7qicnZPNQGTwQbw0XRXIGPnYH15FK52i7Hmi86BKrTfH40DcojF8alqQ2k3VDzUENTcLW6eGqVI5r+M9rF5FwQEAFdP1fdCAgXtd0W7ZOUz5H/k0Ro0VAxS/bnTcfioVCPC4LtO12geO/bLQOTFIp/UvUoGWCaHdSs4diZtQ5T/Ua/4PiOLG5nObtHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39sKBHF3W+R1Hb50KD2+MC6AWxkxd8CDJ3zPAkda5Uo=;
 b=VOWe+T+7eY5xnFJSn821W+s/qXoKxPfF0COamq2opYu7ip9Oakbe9JVRnkeTC4+TmCash5lvOEMcKgq15Nvzjch8wgseTOwnJm2gKmLTbvW9ttEepFbz1gPkasTkIx0x6o7foyyDF0nS1ias0US2u++BpuavEs66N6AkC7WbjI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:31 +0000
Message-ID: <87leel9m5l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 33/39] ASoC: hisilicon: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:30 +0000
X-ClientProxiedBy: TYWPR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b69da60-0528-4e46-7fc8-08db9862fc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qvcv/ARUdfmRrHjxW7VrLVQ+GlEL/QLJk9rQeEY1c3aU6GuY2JWuSAgQBIgVsEAAzst6KqXXVqXsqMwbSp8BQPVgdAk93kL+erLftY2DQxB9gGyLYL4BT33MJ+PnkL3L/We7YqlWascyNmg1joUbRX5oj2EaQ15wzu30eMqS5f8JKj8LweANzRDzsXjxB52lp1ZqBimoQW8KhElRGjvPtefK57wJiirrSuz/LLdZqlSHz5mRa8LB31LajA8gY4smwVw6KSs1VyGqKoXQoI8/k4yyt04O1EXnyd+mPXa91zXShWyIoS6FkBA2GXnpIs2USsFpU+So0qZIR6nRGQkYVqoEpdCxQb0I+vS3QUpqkSPZW1PC/TmxMhYsxRuFLWdCebSp0c94gMO91kzmccHdme4ByPCwMj69DXARmnLqQq1rAA80GFT7b0/1WGeKdk+AIXDH29ZH/rMCFwozjFsqyN4mdtTFFybZcIKpmHoiPjGDDiG4HMS3XL4gU/IE5MbeLR9hEGUZGtgRkkYFJ3AaYCMFvcEJGoOjYcPCV43LcxxHxB38UsJYukddsAXj/HUy/I6dVo9LjjKNVgc8puqvI/1L0IrpqeSkGu9KjphRKrOvrEFxrvB7ZxnS9ZbPULqF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(4744005)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F/MK2E58/DDOwYSE62jCtZ7Q9PKhFlgFB06ixZvu3Z9bH3GOn2ZiPh7kQ8Hj?=
 =?us-ascii?Q?RT9f8x6N3DgD/Q5LiQ+S65VR278l3fRXQprRcru6hIQnMPMwFKOPuQY4VXRW?=
 =?us-ascii?Q?hNpHAhjkgsyl7p3/OBUFs3H6mABErvihcFdFwwvpPc9oAdvgs29MSd8+BgXK?=
 =?us-ascii?Q?qxG+zQRM06aL7q1GrhiRQgBcOUQ2r8/4I53szv9ZCNv+YsPfvychu3eRmuaR?=
 =?us-ascii?Q?ozvP5rHcCUJMU77LdUAmIFnUcWDnfJbvFx+xdb5/11qVf5IJPoxkw1ciOaba?=
 =?us-ascii?Q?dJXqo97Ku/KbfFkOvo8XAGxOjJd+IBWqZlN56mDphuHwv8d9csrv3HLvhlHA?=
 =?us-ascii?Q?Dcom1iPTiiNvnM7O5MPGfUKPAp1YEA5wOi2TDyvGrFMgHR/h8iu6aZBMU/TF?=
 =?us-ascii?Q?K5HnIoow09nOdfj5zHx7HUifuKOpONkEq5davoJAmd6D0AzEpGYxC7G6924u?=
 =?us-ascii?Q?6PutGR995xjalCsVpCEQR9GoILqqA/J3SoiDMZfnIIPCjyEcFMwNos2hZ+iA?=
 =?us-ascii?Q?4VdFde4wGK7E0LpLs6jbCoXEBEX+f6uWgiuB+a8SrvJSPaiiAzZY1sRDEn0z?=
 =?us-ascii?Q?VX5WTTbBBKSAKUZeMihShjXiSBIgbWyCzbdimObs83J/hh1GvXOgs23cRi9D?=
 =?us-ascii?Q?svS+T06p9l3D3ZowBv/CETvS2RJfBbBVwHW69sUCpXOPNDuU3k+/SMbsYOPJ?=
 =?us-ascii?Q?Z9OhUXj+uxJWP4YRZXO2Mg9bfFsszz+6YQHdVpslL4cdcmz85nsJ+keAaYBp?=
 =?us-ascii?Q?HngK+9GCDX/kchJZTaFR2N2IhZy5F1/seX1p8JnuqbnehKP13kz1a6T7bpTZ?=
 =?us-ascii?Q?Z/UIemceo4qtT9tSfq4tKO+y2KcK0tTpx2+/WLvle42ePkq2ANOQNy+BlSB5?=
 =?us-ascii?Q?tLSgnqNnbx+Pfn4jTCEohKJOgQ1PWL/jaZog/1WHn2+84rw1OLIdcvjcjHzJ?=
 =?us-ascii?Q?f/IlfVDqSZR7lyZxJroiU8WMGFeynrdH7PULv8LrhH6wpiGCmSXuF4bSkf/p?=
 =?us-ascii?Q?WqpXSaZq4alh471lZBLo787J8zmW1pWove1x7ndpy6kIoZOy/nG0dNaVpEga?=
 =?us-ascii?Q?6LBeeJxneL+aQj5R46ZnfQsJovRw996aSIH8KPzmaC2MjdMQ03CP7D9zNfQi?=
 =?us-ascii?Q?1iizid7NLr/GmyFXGZNM+7Hc2XMyAzNt9PSlPWlfcPg7g0V5KHbqtIOrN/Oz?=
 =?us-ascii?Q?o2ceOqV/NP3JHgUX1NujCex7M7JEIQ5pJY63iAza/BHWPAxAfGjMopAZdGl1?=
 =?us-ascii?Q?yFxdiPg7Ix7stO3TFEIPkyNRH724pO1AW4gRQJ5a+7wJQ8CM/f94GTeJVE/C?=
 =?us-ascii?Q?Y1MJALL/LSONK+nWuTnJ3yreTWC5FnIdu+kCvgqe7pi3DzboGbkUDHKCWj5o?=
 =?us-ascii?Q?jT+G6n2FlGUMQWPgzwgzKUEDuEAtOhEUCj6SyTgS0WduEVrR3Dw4NnR481Hk?=
 =?us-ascii?Q?X9KXeWQtqxbWhS/W4aK6dHY3S/i77uLq2KzCqSOK6FThAz4tDTemVcQCJn6u?=
 =?us-ascii?Q?nFOkRt6IQ3QcxWg1ihXePyuulbMSzdM8KLn3zdSYxywQqdOopqbdRoNfThA0?=
 =?us-ascii?Q?lK9q7VAUXRwdvf2pz8P09vmtQeHjBa/Z7ejkjUaa5A2bW85RE9P2nVKPCryJ?=
 =?us-ascii?Q?mi+SY2d54Fr31oXI1tsB+K4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4b69da60-0528-4e46-7fc8-08db9862fc4f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:31.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dAdlzfrvE8qWbz/iUkBNaln00bqgjFuMgJFXBhKWi5bJcfmiNwj9j9TIPToCyhwH1fxfbiprMzATdkwkD/77JnJB6d+ADf2VRIjpiVjDCbcm3iDdog/tixof6NM5QvGn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: XXSB4JRTHEECRT6JKMCZ4O5TME4K6WQE
X-Message-ID-Hash: XXSB4JRTHEECRT6JKMCZ4O5TME4K6WQE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXSB4JRTHEECRT6JKMCZ4O5TME4K6WQE/>
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
 sound/soc/hisilicon/hi6210-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 27219a9e7d0d..dd7d2a077248 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -511,6 +511,7 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 
 
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
+	.probe		= hi6210_i2s_dai_probe,
 	.trigger	= hi6210_i2s_trigger,
 	.hw_params	= hi6210_i2s_hw_params,
 	.set_fmt	= hi6210_i2s_set_fmt,
@@ -519,7 +520,6 @@ static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver hi6210_i2s_dai_init = {
-	.probe		= hi6210_i2s_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

