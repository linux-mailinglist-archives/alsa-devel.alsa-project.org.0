Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057E6821E4
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:06:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2FEDF5;
	Tue, 31 Jan 2023 03:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2FEDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130798;
	bh=aBIS9eLwcw2qWqc3fSOiP3StdWrMhyu4mnVwlbnI1yA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QCzYSZZdy7dSlAcRvwchaaLn6+SpC98H2jPdapMt5yWmeB9vB0tL5OpbpY/cKHuTu
	 I17v1gWXjuHrY0Pr7T8E5DKknk5j8f5KUr/bl57/aRJmhHH8n5MLKuNvUOFt7hIOAH
	 hVu/nN9MF8+Xknw2XrBuFHu11RpJ51IbEDAay2h4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA63F805D9;
	Tue, 31 Jan 2023 03:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E963AF805D9; Tue, 31 Jan 2023 03:02:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2112.outbound.protection.outlook.com [40.107.215.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F5DDF80558
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F5DDF80558
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bGL9/UBH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgwsIYOyBP0PRRntlERbMXolf2r7jWpwThllmiINbQty7vKKpCPxY4Sp4fzs/OcxYRG/jCKXG1zaZ9yviDvepKqAvfGSpvDJLGkCBDomKQzbCntSW8ukbxEL0vcCMil30jMTcwKOcbm27g66YCm11VNqOyOZeXJ49Lliu+vXdxwZa1Vyc+Z0phqB28gphfKrKzUey/v4A7tRCGO1A5d5ZlwNDrpV5+LJtLvYoVfn7q/EHpbAih0U70dB8OAv0i03fQ8J+dbVtM4nlr5Wp0x1q+ZWHdGdKXrb7Q0oeWAD8WE6x6bIE2uKT2DblU6s1efmsXy0NRRMhqIWARfWSeeVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXK2sxJk8N/3kQByOfVX60fjYZw4VWoFiws6HBc0z5s=;
 b=hy4Lp1xU24xKo1yDna27DCScc+XDMSreRsOleU7Nq4+x3nQun5PyoQTv6tN0O1qeQnbrpewDbXmXwS7dOl673UyXowpP9/2wJ20sOO+ysfoap03tbPyRwrUsSBGdo6MdGq2ef4tV3rniFyBi0yNUXJF54QYgDzsW19fyY3yPbKTN5eiqSJJqTaPVkpdAO0hBMEHsfOy6PiH4rwP/pNMMoBXBt5O6kygnH3nFyDfa0e7/ShmWHCavR8JqQKzKuW8U1SFTI4WvAIMs7ubZuAVy+XPse2wMqESUppx4+cBO2CO8OC8pwlnolBZZ1N+ICX97XvUq1QmWkUo8F8McPXdaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXK2sxJk8N/3kQByOfVX60fjYZw4VWoFiws6HBc0z5s=;
 b=bGL9/UBHKiW4DiQKIwRYS8nG5h6G4S5+dz6aZDxRUG7ssm60VeOPT8OsYHsi+KjRJVfHDbwoQP7zGUH2vSHsJtgH12mhJSm/gckc14sJrOHlzzkAc7TDZjj20J/F8mLua42h2yJJsFNVVxnrqHlazF7+xxQ6d0YruEwKNopO0jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:59 +0000
Message-ID: <87edrbea20.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 24/25] ASoC: soc-topology.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:59 +0000
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad2403a-009b-4d2c-a249-08db032f237c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muzfNJahB5uBQGfN6J1eI7tr+leRtkeLjDyT0KlF/l1PDFZy5oS4J14eOHJ5OgluFUtZ3qJXNeuqeY1LWKRE0T5sUuo6pc78lje6i8Um4D/5yG+eAgaGuqgjSMOu2WX0Xlc88c/N9RYoBb1AOf+CuzFMPlBfFUWCpGKEhO0c0HytWMt3239evc23NC6wQAVb4weFTGRhP+qKpM3ibVvFbI1+ybtHBgwORfEGSxoNCng40RRIUbW366/CxwNL7KWgev7JlCY4jVb83Yb8WSWzYYzk2GucjgOUIsCbUyGqfYt4L96y3oDoO7EdJ5zMf0SFo3Bg2GXl8AbJfXgU54fhBdPTYAfttcFbqYhbbN2BpuhWhjBMHvLxSM0nP1x6TWLeXw4ux7EDLsDQDv9k/erhMnajiNixOmHhKs+m9U5uk6Fuytg+d4mPu4GCaJlfgoLsk16ABlMS6AgyUAKrmFjcDsaHtTaStrqJiq66XSoMemoyxcMIMFsnOxlAVoKAYUKb4spM1TDc1IeR4M1ONt4x9TNU0Cl+qLJWGZvisbl2I+mbnT9c9KjiMII+8eBzr8joa4JdDX21e+upIW7uH6fLbqXSN2P5VpEueRTlrdnFdXM5HR+w0803M+hAPjRdxYa69+biIhJIv8lf8MKt4HJGUoOjIo+QWpj/x/rxBfKOB25ntnldh7ZMOUq3qhOeSQIeRK+P3XSIubaLHgNj+vOG1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8oCsELjCpIyV+9zrWiBW0TiFr8WttV6w001eeAVyM7H6aapU/ISDLXNg3Gz?=
 =?us-ascii?Q?eEP9LS4qLw+HvpkI5O0z9OiFPGDuU/ZRVS3CrJR8t+mMKgOmDtaYlEcYlcTw?=
 =?us-ascii?Q?IY+cld5uWItbGfbBZGJnXFs0ox/OYsi5UVfAl1zOCq0WZbUi6ftcW6kkCzMb?=
 =?us-ascii?Q?B1s3TKh00va7rAKuo11vz6fupzqlbeJ4J4+1OOfbRWM1/bUO6Fy23ETjqDLg?=
 =?us-ascii?Q?ZwSWLwnb+xdZxAs3AQm1wkBiXGB+vJxOef0ycY6nABk7k78SRsvepghcCjyY?=
 =?us-ascii?Q?nbI6RQWTtB8WpZbh12U/DVTVtaYR2wodpWBdoaQb5kCB94PuSj3N620Z8jLt?=
 =?us-ascii?Q?JtHGjD7z+ZJF9eiS23L+SIA7tO7dVS6SeabXhQww1bfeIsRpp07WotmrAiCV?=
 =?us-ascii?Q?QnY0FeOoJ8IHXMY5lA+gnTFHIQIgkvgWRKGFWkdCXSeA5s8TXNvL42lzcuZd?=
 =?us-ascii?Q?2Lrv82TDFwl+AMIPwMm5CbsSjEl2f8UN5jDHIlJlyDEqf8ZtAe0z7j9WMEyj?=
 =?us-ascii?Q?9MW//8Oh5iLqL1a0JT3T98MI8aYUT2ezk+/b19AaViqC1zInf0ASJv+GTE+y?=
 =?us-ascii?Q?dE7K1W3Fxe+mgYMI5kGqaLJAmiHmdQ9iiMq7AV88HNvM/q61/6T7OQyykLh0?=
 =?us-ascii?Q?Mzp8EbbmV3cJ32Ga/IQzKe5tRHVinvg18YAhM7Kh7ZeoktPBPEawYTFTHO17?=
 =?us-ascii?Q?vJ3ogwBRvqHhNbNSrhjH6/UQ38nU8uyHIy0t7c39JFkS94h0gOlFITEbbHLm?=
 =?us-ascii?Q?vW64mk3i8+c9KpGIaUfBBkVxD8RFdFvT9YU0gOBOiigqwPKPMjMWsqxvxFuD?=
 =?us-ascii?Q?LPcb4rq5mPWBnfAiKjnSpdut2t3sH7K0nPM9J+Jxj5+QHLulJfYrpkToi5l3?=
 =?us-ascii?Q?xQBDDP3pNWoaSjXWnB0XaS+qkFGk/DN5uMK1/BUhX+IGmSFv7yG7ODPc0Y+I?=
 =?us-ascii?Q?g6ZeJZMV/hR33WoWb4YgHBYZcELelHneh+McX328XbIN0GVYqNpb6Vdj/792?=
 =?us-ascii?Q?bb0nSHdNW6uec2paXmYf1Upilz09i9UAMDxdjX5SL3DuGFSUPdvGpqQ6+WlF?=
 =?us-ascii?Q?s2Fjn8Mdbs7HuAoFLK4jGTC2dvR47yxHVTSNzvtL9kuvXc3Xvo6ZYNFCDu3R?=
 =?us-ascii?Q?x3QGfQ/JGWfA9oQ4tEYeJelGKdHzPrY4ZZ69M+2WtSGM8YOmEJPIBM7GXz80?=
 =?us-ascii?Q?ghUrCx8zBXflWioET4VFmaWZztOZjQe3npdfOBreE5dmoBHx3tehYLyqk5tP?=
 =?us-ascii?Q?KJRG7EEOGRWwzQ/R5BOwaWn7he6Jzfjn6Ujd3RCnnHSGOMrTy7/E8mjG3V4E?=
 =?us-ascii?Q?qL7pwCyG6h8TJSuJcFcL7ReL/csUPURY0jA26R4ddPruegyb8FMEYSw1MrhA?=
 =?us-ascii?Q?7LqjRlDTiyrrq95a2SNpW7kaQdFZAIg+vnBTSHVxrpfNPILTt24eVAlpW9bu?=
 =?us-ascii?Q?IuVRNJycr0xZE1nqPTLbwD8CYK+j1jDkmQzhzkDOSTOaH0LTd467ASulSnok?=
 =?us-ascii?Q?5IMmHibnqTRrU3oDAK/IuWeEdXn6fJdCpKTQttkdNIURb3y/LYrlDRmRHCc/?=
 =?us-ascii?Q?Dasv5OVUycvAjjatsBqWgAkt6ZNhnKzlWJkSSV8xlTVdjw9DYCg7cRxO0qOy?=
 =?us-ascii?Q?/rdqYQe+5oFiT7ldKTzzmus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad2403a-009b-4d2c-a249-08db032f237c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:59.7867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrXaLvcitz1rMfkaSVkNijY/t2ilHjHqhlU8fFoY31Nyv0z0aAMQ7mx48wIqT4NN0jjToGwPX9NAQRuxZO8GpaRPldescFUZNQmwi1w8wc24UKDChPmGV0k0WOdM23Yg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index c3be24b2fac5..6bb3efcee3b9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1468,7 +1468,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	/* card dapm mutex is held by the core if we are loading topology
 	 * data during sound card init. */
-	if (card->instantiated)
+	if (snd_soc_card_is_instantiated(card))
 		widget = snd_soc_dapm_new_control(dapm, &template);
 	else
 		widget = snd_soc_dapm_new_control_unlocked(dapm, &template);
@@ -1556,7 +1556,7 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 	/* Card might not have been registered at this point.
 	 * If so, just return success.
 	*/
-	if (!card || !card->instantiated) {
+	if (!snd_soc_card_is_instantiated(card)) {
 		dev_warn(tplg->dev, "ASoC: Parent card not yet available,"
 			" widget card binding deferred\n");
 		return 0;
-- 
2.25.1

