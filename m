Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F27277CE
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91661D7;
	Thu,  8 Jun 2023 08:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91661D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686207039;
	bh=JedLMgsuGpKvPbjClm2qG1ONH+8KFgsXrg1AGmJDWRY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AmyMYFeS4kfIM+c8b3JfYsLBdHnZyc6EdOzAmRGUcX733shliLTtI0tw0KKchcIUe
	 1rubOKw1+4MdvTs33UvkaQ8mlOC3rOYzHFu2UW+dcKuN6D+dphyaDmJNEZDqVEaprp
	 zI1n4qswqb3QNSs5hLkYF14rjA0qaiL6xfvw0FQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68CB1F8057D; Thu,  8 Jun 2023 08:49:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE64F8057E;
	Thu,  8 Jun 2023 08:49:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 014A6F80564; Thu,  8 Jun 2023 08:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42CF3F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CF3F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Khr5i88O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/daMGqA5CKPt3+T7oi8b0UFzedmBH3lKkv2dHO5LB5WsGUa/3vfNiaF6W1Ahpmf+KcU21V+J43KBU6+/sUy4PSdD9lWos1tHuKVEfCraCqghL0/8eQB5H3+Kgic/M4U736Z6FlvHs17s/ZstM3+oE7YSX1o/96tkIK/bPN4+DaiTLE8YAjiYJjMDiN0/+ZfPPgOK6btxXFBX/Tw0705YpTddrucewdY2K9fbfdatnm8OqceCM8ImsHD/sc1MPPNzIgzbfQHnMniX942pb2o2qDQwhc253CIYLiYBwvFlXwmyiGP8X0hfjsaw3NbrYtarGE+yfRBPmDqsT9n2VtDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fLC9GCw6jiHc6GwdV2jQ+7O1ASraTYwwsIlAvCeFTA=;
 b=Bctw9AyYE+6rHYG/RTZOyboC+U+NcQHnLc3Ge9M2eDrs1UMSnVjm9ko2fRVGfWELf1x5RBnDyOgievu1pG9HNnFfnwtDGrkSlcH7MvE4nNM+hoyOL+zhrquXO2lGn+GGoOl4sipWPCe6Ji/HQZGqzb2nM12F2MTafa1LQoNnqrfvRQhyfJHUhlJIqxfdYVZKQ9h2H9/0KmpZEb+o11nYrOGmuUk/XwpWCKJziVsY9kE/PNBoMl/VYOpB7DBNVCf9nVTulJY4WpPtdjilM/kwFCT2v0uVusXux42BVTs4cIusBVyY5XceXJMS906i439ER+9tMy/lj/ooKXWlBf5UPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fLC9GCw6jiHc6GwdV2jQ+7O1ASraTYwwsIlAvCeFTA=;
 b=Khr5i88O7R2Gb/DzWwAhgc/erCWKg0h8WUMvcjL00VjIVRw94wHFVJ+PcJ57ekDF7wYgf/P57LJQmxWUCpGF6MZeRV59nuy4DMxQA+RI/alTFO8qsmMJOX+qPFNAN/+nX8jCh+xIK8oQ0tQFiwAPklLmD4FVbZjVO3bx7zUffOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9300.jpnprd01.prod.outlook.com (2603:1096:604:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:48:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:48:58 +0000
Message-ID: <87o7lqfnzb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/5] ASoC: atmel: use use new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 06:48:58 +0000
X-ClientProxiedBy: TYCPR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:3::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a7bf72-ce0c-4d5c-9b42-08db67ec6f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EPt95toJhX+Alc1yCTSHk6AXBaewrqwnx5FlxyJXUJuK85wSkxT4bGsmF2hpf3rfH2/T4Cv078VfyuU+5zYopl4pKMJ6JXsk80DevAHmRBSRU02QIgFFdypi/bKtkynXW4V/0k73Q4yux9NkEA5UTWE+s8E2aNFPRSqakhstAa4cm+DK73p9TM7KuaUJVgHn3Dl2JGxhXnJx4qAyVoean8OaoRUFsE+05lAF/raD/WwoJziZyMBUoMB4859zqFcepwumZXpQ1woliaze378x88RjK8tzVX2MuLR2R1dJRxc8svOx30F0ky/Nve0W3jbZyjS5+MVOPnvo6JPWskbBNx0v7mQm9nQmg/0GA9bNcTjQ4lvWVP68hTdSDQfRue+QEDbcdyhVkiCRvID/8tNQ+cyOrztw+YpOrf2tOHg8QZmZOZ5SD/HrF1xiEnVyTK3xtaWcgtgyO6C6STJWCARAiN96hAmCqJ5P9XRmjda5xokiUTYpom9cq3HdrRgyOdvm+7jPY71InIfGZ9eyLyc9cJnj7IArg1dOOSj4493z9qaARbMGXHqzvRZ73c0pgaRaUGC5GfpcnaLx2t57keFzTWTGeos59la/PTO64Ztj80r52moRBh0BEzuk32uW+pPa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(41300700001)(8676002)(4326008)(66556008)(66476007)(8936002)(66946007)(110136005)(5660300002)(316002)(2906002)(4744005)(478600001)(38100700002)(6512007)(6506007)(86362001)(26005)(38350700002)(186003)(36756003)(52116002)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?brmjGNhOOKkdWd6z9md9Lb8pYAcmpXLpGbA2JUUc+cEFBT5jxZD2yQoQuIey?=
 =?us-ascii?Q?MP06oz0WjBHw6tznzgcErq4Iejgx3BIU0oTGa2IuftMrM+xKX6B1DVj9troi?=
 =?us-ascii?Q?vdKjB5J11P2huko4vt8Gnke9MNBB4THYq7rjicBw8ZFERyqA/rq6I1HXEUS8?=
 =?us-ascii?Q?IYYg0sams1y3xQZMZjBORTO4kv43JxEcwzLMfAOYnEGKXbr7mTP2IFyYuH3D?=
 =?us-ascii?Q?EZrVvzMljUPBO57DI7qLz48VeOdozvuo/4BYOE1wnOkjK7AeQk0FCgAdNSgP?=
 =?us-ascii?Q?fgwwrRFPNR3GATe+zZnUbpsh3XPtmuYY+PPVvNmRt8hQ30YdJwpCZLupXUNF?=
 =?us-ascii?Q?nCjMdgYu6j9v/c1v9F6jhLUS6TE6Nrob+zuvIKfba0yDCowYMYjNyre/f82g?=
 =?us-ascii?Q?UR9kPNnbbO/IptSTUgod9Y4H1/WlAOshHhjkIFmP4d1RzlQLw/XXVVwHGhBr?=
 =?us-ascii?Q?Qcc+uVcXpebDMeCy2DD1T6+hxxHOIpEANhgdhJa7NKM0OpX+oLscLY+F56Wh?=
 =?us-ascii?Q?BrTKMdeq0x6kjnErqTBOcEWkV1XvmodAT/5duJvr/DNIFqG+F5ufLWa+dk7X?=
 =?us-ascii?Q?/XhVXT0mdn/jXT9TExgw8Z6OplrOcwoJCOK5tQ1tmdY73L60sJkBBeVLcQGc?=
 =?us-ascii?Q?HmQJ96DlR5SGnXWcI02RFbYZ86OsJ5IxFT3Kt4eoJhy130MsR5gJ7oNCzKRD?=
 =?us-ascii?Q?95OQrdksTERbBRUHPu50NM8OE//6rK6nuJ6UCE0cotQturY7BtbIXYFMyk5a?=
 =?us-ascii?Q?75TE/Ua4rSZesrguiF7dczdX96XFLPGDNmodJbHCBaRNX5vtYe3LYKia1ncW?=
 =?us-ascii?Q?DSb6uMIiXlqE6WDsoxxVNnUsGo8bZeuhz1msGuqtcawBgQLcPKKdpy9msrqb?=
 =?us-ascii?Q?Bal8Fj5cuMgMX4QmMl2by9o9eB2mzdxbXna1bhqtnaG7J6RG6HV8LAL7Q61G?=
 =?us-ascii?Q?4lk/VjdDS8dfRgBCfyuqejpxJWGnad0VbLtFIE+49xdz6+baV/uewL2YJdcI?=
 =?us-ascii?Q?Qr0BS1SptwfTONnwHNbcD/eX1d/J/pw5HaTtOgf0HdOo+nBian9leME0+Vpi?=
 =?us-ascii?Q?Aj/Od1XdxTB+lZcI7HjKmjJ51TCWl4/Xc3R8BlDCaRs9Wq2KUd1WYfFd5B3E?=
 =?us-ascii?Q?jj7UgcLTN0MAdQZcqPTrE6dMu0z4UVSKu9ZGDI24SJSFWaPXMF70dZQ57cCq?=
 =?us-ascii?Q?uCFd750RvMrAXII9dzwBq0UFYghxxhPPEZj5HIjqPAG27qYiirLql6pGLMpw?=
 =?us-ascii?Q?3vhx3Vta3G5AHaGRFqfcCEJQ648CP3gMSgrlpcIxW2ysza5n5kJ7Ua9bH/P+?=
 =?us-ascii?Q?g1SFSjBMTGDJGHTNiwPbA7HusNpGagJEXhgSI89bTCBQMorLXI8qOyBIK0Ll?=
 =?us-ascii?Q?EhuOtYSBYI9NZwxIlXjQIksIIUmr2W6o6inYBSLCI9KQupfg6yRiXtCeZu+o?=
 =?us-ascii?Q?AP8plHfQ9RswVbe37Q4Ah7hudeh1AjQkwEIaenLFJhTqyk6XtsDWiMLxIRjb?=
 =?us-ascii?Q?yh8qRaoA7XqXC4KSkMLdMx2UAoWXvtWJzzXUOIP0FvfJWyaIXW31FXlBBc3Z?=
 =?us-ascii?Q?aUKpgyD4BykMoO6oRDou/r26SfREILHExhwc6Vk3yOBkqSwc1EH9LjU4Ew98?=
 =?us-ascii?Q?WrGZi8Zf+F73Dx54Kd8cDAM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17a7bf72-ce0c-4d5c-9b42-08db67ec6f80
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:48:58.4604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PJGgbBa82q/XnAKVUZNbb2ZRKlA5VfuD1wkarC44degkXvAB1ALEoHzsK8o+YpV9gATbGftuIdvGmAvZuyiw7HCIWkV4KNGVOzn1/tgY+Bp2Nl+AflkG70rzVJEbpdn2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9300
Message-ID-Hash: SMFF7WUJVEUTD5VNJIAS6JXMRWAMT6SB
X-Message-ID-Hash: SMFF7WUJVEUTD5VNJIAS6JXMRWAMT6SB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMFF7WUJVEUTD5VNJIAS6JXMRWAMT6SB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now supporting generic trigger ordering method.
This patch switch to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/mchp-pdmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index da23855a0e40..c79c73e6791e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -423,7 +423,7 @@ static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
 	.open = &mchp_pdmc_open,
 	.close = &mchp_pdmc_close,
 	.legacy_dai_naming = 1,
-	.start_dma_last = 1,
+	.trigger_start = SND_SOC_TRIGGER_ORDER_LDC,
 };
 
 static const unsigned int mchp_pdmc_1mic[] = {1};
-- 
2.25.1

