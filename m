Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55FF7277D2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFEE851;
	Thu,  8 Jun 2023 08:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFEE851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686207071;
	bh=1nOFaW0Fu199oPgODN+yetNgIo6WGftlFqrbEzfF090=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ame23kLR4vwuHu1p8XqhF9GJebrMQjFSckBlgB0JYJLFHmrw+VOFDl8p8ipK1alm4
	 RFnMGVUh0YMcTzXht2jLu22jvJcYgJemiLTcIfvkR7UawYPFOLrx8cMV2jAuuFymgY
	 sJ4zrnerrdzCU44KjoEIhvlHnEipyc6ANwzjzmk0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3ED4F805A9; Thu,  8 Jun 2023 08:49:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A01F805AD;
	Thu,  8 Jun 2023 08:49:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B5E8F805A8; Thu,  8 Jun 2023 08:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5281F8058C
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5281F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=m8S4cthL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6beWdThYQRd9KGRbrCG7G/0DblN0rNb1VtT6q61mok+0TMIPhWMcbj97/l5xWWxSYvrcYFGBUEtmHStjCaZ4yi6+ECrb7/OUGzm4PLtBXIIIgG8g1obP0Lny/aWw78H+kpMZSGx/sGI0ciPGEI/+28bL8wGL3CHq1Bq8b3jnfhcE1SKv35XAIstRYiEwvUKT1Fc8CXJq0iPjdBeCiy/+qUSZik1XtZZf1K2sCRlgxiSf0XkiNbNlwewxHGgCJaukjYN6dQOqcqy2EA8yrFi9CJ7/QBvJG0DZ/kYWdbtP6iV3Su+qrg9agOK0GaFjIiHM1gQyc2iB/LnAQbXYyyonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpZCRgL1VfS8cYkHJvx6jZY/31YGIxV23swv8phq2WY=;
 b=UV7xafQe1CNLAB9mvhOlwlj/SZkiSfFH3IqUZBpE36VLEp0yWT3KcdrmUPQnha2oOm7eqdCucGLd/vr64Bt1Houq+IHsLb7ETC2IAaTsA8OcSrX7/+JNBgvFCLOl6mVmCV1zKrLxPrjS/PuuOEitF92Y9Ib9wUnrav1pug0Ebp8ZU9arw4+Bkz7AHAkuav66ZgdQBFvkstFpPYl65VGLoYj8SpEhYx0zFvuzRBn09kJ0BlzZauR7BiWiLYNwDImrjEpzVCF6rwZqywm48UWJ1bC7NZgDO0f9Gj8Vqp4YQnRhgMcEM6yhgnQe/jdj8v+QYe8FH9hvLGRW5IKqeNmlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpZCRgL1VfS8cYkHJvx6jZY/31YGIxV23swv8phq2WY=;
 b=m8S4cthLTTjrXJh8kW70lPcoIv4zvcBEG//N7hGDVJG/Nzi4ETSxILzfDeX+T0NEApWhSCsUSjx5Cn+wFAow0VBmuShgsQ5UWfyzdIrdRNCGMfzzhtZSsSjjo3egDD+LxI0Pe5gdUG0l5OCGTyGgzZWr1pKehu0kDwvMXxt/Fy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9300.jpnprd01.prod.outlook.com (2603:1096:604:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:49:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:49:11 +0000
Message-ID: <87legufnyy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/5] ASoC: remove old trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 06:49:11 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eaab750-b0c0-4967-7d76-08db67ec772a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HuBC+dPXKhNUf5lR6EVYB+BngpMP2e6d15MiMNVSKAZFyTAv9n4kSlxDDiSQev+nzZ0sxttT+xPsOp9klxC11OoLF8QGaYVjxfEiJxd9oawCdm/aYnzIKl5dJaZoTxc71Q/yLLhvt5BA/xoppcE7XEJOEj9xXI2Ur94oMNztlT+xo5JCwxMzMtwCC3bEluZJyB+yPLCo6G7Qq0FugfA8WFvCGLXbBRDtQdlL21U791kI4sVWVtb1K5E4QyebWruYIUYwUbVxsAIK9GKRTqvQx4IXydpyKtSX8HpQtwcpRtZTtQD6UFDAhqrDlKVUFiFz2Y02IzyyEJVoxPgPCSh6097wPtPK8LOBKm0ZU04W0x1qED9UlEKoQbAuxFOPS+dHrBUI3gz7ODQSxadd5osyjJvX4AR160+d5/TbFqkHXTG93kquiFAQa81f8IbS+ELgxA6mCbD0s0dHzVhwGQct6IStFHTIsdx0nRd0c/ahcjqdwP6J0E/1+CfXw/Lq9jUvHavg2+GkSYhDzKVwAvc/HNnmr761l9omfjoxQ16TehX8MiR3bkmEzAOEoVYrcyLcm+/kggVwn7c7J+ucKEvMJpsHEfV5FZlKEoIHtOzhX5nIW2g2+R+C1/dz1pY+Irmr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(41300700001)(8676002)(4326008)(66556008)(66476007)(8936002)(66946007)(110136005)(5660300002)(316002)(2906002)(478600001)(38100700002)(6512007)(6506007)(86362001)(26005)(38350700002)(186003)(36756003)(52116002)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fu0Duk6ThbKDmaobXRZwEFsDDCd94bz5RDr4kRIgCJrubCUE5dpZ6ijVBQZH?=
 =?us-ascii?Q?mzb5dD82FB5bZUmLDkfJvkcVhtjtpjAUeC3KLaQ2qbFuSnJciib/QYDruRMv?=
 =?us-ascii?Q?/PAl/NPvBszwXTroFzdCoov3kLzySawGKxk9q0uY7pPAyGpVK8RoBp8uPoXh?=
 =?us-ascii?Q?yWPM6eP2Lm/cYDP9nxn670acdtjPLGPDJ3wCIasPfbCUMF4pyFv9mSnyS5fN?=
 =?us-ascii?Q?easw1NNJcDRMmCiPu+coKAuJd77BDZF8YkrDNq6wWtHsZVDo9pfWRO8DPi9D?=
 =?us-ascii?Q?QF4m7hiHlqvcyrpeF8jRGOuONFVdFm7AnHQEq+r2PDN3IqCau6YzS2EFXkNw?=
 =?us-ascii?Q?z6gY+axRPc0oryJTZA1VDLONRChlMuUOWn9+wZ3uTvXRZ3XUd5+ycl9cv1bN?=
 =?us-ascii?Q?7eIekc2AE4MoIx01gIYmtpcZSuCl/9zOxk8jhFS1SQTw2yAhmdkf1fweJfWV?=
 =?us-ascii?Q?dLwLU0fLn1yP6V6RVJUNIyJ3Po7Pmvk2PrUb4HHxCFWto/WFzBtgs5friyCa?=
 =?us-ascii?Q?o/rAxRtpRRX0D7xYtvqiNZtRTc227BnjOvvTtmE+moLYu60rR4PsQucejJ2O?=
 =?us-ascii?Q?8A4CIGXSiCaaiwvOyiM3MS9uZ0JLDzHr8lO64COGVsdyABg/U9PVeUffxMtI?=
 =?us-ascii?Q?ieeiR19f98yB86rqn/FOCrmIrjvTsrRPonWYlh8QgEom1A2nZaJXhOLOeoVB?=
 =?us-ascii?Q?HUttOiSJJtewDjd1OX0bpdBsq6WwTW7ncqndGrkJ+u8RleU4gsrXcqPO1MVy?=
 =?us-ascii?Q?uqnMO51XqXCvYsRpAHCnZPKEVVD1b3DklZeKlQR1oF2BRv7yrl7s0h8AjoBK?=
 =?us-ascii?Q?m1isTEbIm11fpoVSCZkCu7VVxK57FO1vIaVQTK+TtxtIIPG3spiuFAWZDfW5?=
 =?us-ascii?Q?qZCpAvvWofABHo3OffgiswOd92beicxaGo+wAeqbMWegd9EbefXMlQff4TbN?=
 =?us-ascii?Q?DFvjC5j5eh77MRnkM5iznh8xjpG1KF0Jetf0m6N6stWE0W5HegeACVIulX/i?=
 =?us-ascii?Q?mp5a9+JWiEigPau8yuTRCuquBog70QIAZCXOigKetPfim2MCPhR7/QfAjLB2?=
 =?us-ascii?Q?nN736FpXX1IVjGct6T1ob0wLmLGEnGNTxI1d1wnALALu0UAVfc3SrV8jv2hS?=
 =?us-ascii?Q?EzkXSE7joh2Ns13S2s+Y5FGm9+WaQWLlTu85O4RLUnzDaZo8ra6oqdlL+Kg4?=
 =?us-ascii?Q?a+a1Kg/LTrBGT8jyOmEr2whz+h4FRQlLhrql3VcgbfMN+V2wHjg4QEChFVrZ?=
 =?us-ascii?Q?qQiFJI25ZoWFwdWbBHSsXF96ke5SjiKUzJ7AaIgAA4MIaS9IHmLWgOpftoVZ?=
 =?us-ascii?Q?ICQP6uc0HfNaJZtWYbrPAZRNSsW/q7k5Z8gWcOE0c/V7WHY9/kdE/6HHRab3?=
 =?us-ascii?Q?FSGt7b145Vbw/Ir3Ehi6cXPGiU+r0RA/nGLAncOAU6MXV58oG5OryJKXaoFr?=
 =?us-ascii?Q?aY0Aw3IZdqFmaaPBgOlOWrEV+d8Lx31DfjQkyKwaG8ZpPvxA9IV8dyPWcD7h?=
 =?us-ascii?Q?qz4GcmlrN3ObXxExamUvsOaHCcofWneVblEQwqt3FhI/sNqu6H+D1kBA8nB5?=
 =?us-ascii?Q?MUiV4DjLSD1PZNM+XmY2Tm6Z/rueJUSNPa4/1yGKGVdkZJdW7XU+mDFKVpqC?=
 =?us-ascii?Q?L8P7aqiHMS4y4kobM27qVnQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5eaab750-b0c0-4967-7d76-08db67ec772a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:49:11.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 50qcNQ2afFMp5imNZcuQFNmQsMHEWbsyazeP2kZ9EC/oP1OranWXupni9CivPNALmzwxdsSiqXKvcHQHX+cgPRicHhHiBWAkE0sXaUNVeKEWPpfKXCySYExYcFX2IbKm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9300
Message-ID-Hash: FDFZRDS7WFKQ3HABEVCXALGIRG3TJBIK
X-Message-ID-Hash: FDFZRDS7WFKQ3HABEVCXALGIRG3TJBIK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDFZRDS7WFKQ3HABEVCXALGIRG3TJBIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All drivers switch to use generic trigger ordering method.
Let's remove old method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  2 --
 include/sound/soc.h           |  6 ------
 sound/soc/soc-pcm.c           | 10 ----------
 3 files changed, 18 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index c7733382757b..87f248a06271 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -199,8 +199,6 @@ struct snd_soc_component_driver {
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
 
-	unsigned int start_dma_last;
-
 #ifdef CONFIG_DEBUG_FS
 	const char *debugfs_prefix;
 #endif
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 49442583d46d..52bb64d427f5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -762,12 +762,6 @@ struct snd_soc_dai_link {
 	/* Do not create a PCM for this DAI link (Backend link) */
 	unsigned int ignore:1;
 
-	/* This flag will reorder stop sequence. By enabling this flag
-	 * DMA controller stop sequence will be invoked first followed by
-	 * CPU DAI driver stop sequence
-	 */
-	unsigned int stop_dma_first:1;
-
 #ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj; /* For topology */
 #endif
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 40a75b3d0e9e..73860fe9b3a7 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1111,16 +1111,6 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	    stop  < 0 || stop  >= SND_SOC_TRIGGER_ORDER_MAX)
 		return -EINVAL;
 
-	/* REMOVE ME */
-	for_each_rtd_components(rtd, i, component) {
-		if (component->driver->start_dma_last) {
-			start = SND_SOC_TRIGGER_ORDER_LDC;
-			break;
-		}
-	}
-	if (rtd->dai_link->stop_dma_first)
-		stop = SND_SOC_TRIGGER_ORDER_LDC;
-
 	/*
 	 * START
 	 */
-- 
2.25.1

