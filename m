Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A17BF26B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 07:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14AC1F9A;
	Tue, 10 Oct 2023 07:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14AC1F9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696916861;
	bh=I3DOkugUEv5TMG7WbdowrKDI2MTUTBMzOASEHnFndbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FepwkUtdUQMolPWSkYVOAOFFBHs9Jx/pUvBbxo+n4UMz6wKhQvExND5VPv7aOaAPf
	 oEFqu4h3pcjsELm8963ixA/xvRQzninb7WhRPR2iJzfLK6rEb3TB2AzjuyphIUOPZQ
	 zfjV+Cbw1WAXvYQtqyja6axfTDR2FBgeOjlr7CL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06553F8055C; Tue, 10 Oct 2023 07:46:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4633F8027B;
	Tue, 10 Oct 2023 07:46:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A67EF802BE; Tue, 10 Oct 2023 07:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D52F8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 07:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D52F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GCV/FWHf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3CFKdWynrUwz48r0dQKArwBhm4ke4ViwCLd+G0RVtr9HU1PliFtz4AEzLO8NpSq+DmuTDF27uq4GT9gty4fko5R3mDbBtL09WgXEWVAu/bKUj8935x/A/vy7X/iEytX/sy4sqhzQbaY36WDqiq2YZUKixiJHqo9VwRV5wyq00GHONEODMnlHGmwb/M1ZfuD5SOzNCoCR5MfxwduUw+/1CEedkIuiA84TRXvZTyf+AY8Qd+Y+arHAcaIbKmBwKXYG05+7OxCvXhR9nPhfHerbxXkbP0svUECUFn0JSUoRn8u+UrXEmDVo23Ltaj0W1ny0TBjyMLSjL00Zjz+IjLYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec22TgvYGh9jfnlsSOLc0jCivV2tQfRHLpdimHz0DBY=;
 b=dcv7A0+oPA1MnfeRljnPt0BlUziS8oJUBF8D/ZJRuJqmQvMMYNfAL2m2+ixzNTmqVWO3agHcbZPr4X5x9h14h6gWL5ocD1RvcsmocvT63xflLr+zm3D39sf+2WOB0wXdSVFh+FB7d2GKxLeU0vxtVuv+3wkoxSvbiy6Yuk7YPHq7r5dqAXwOmmwPuV266t7NjhKIOqQDIMKaUAISz61MrJ9oISpjDNaEEhQyL6ClGOXF9A7J90el/I92pb7wsCsozrQV6ZwfsX9igRZiOPvT3up2yg4FyU5ZriXO5GWg6VioRlvVYr/qshs6MEgaIO6A5md/WKwMzYHsjb76YD6sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec22TgvYGh9jfnlsSOLc0jCivV2tQfRHLpdimHz0DBY=;
 b=GCV/FWHf8pmAH1ZGvmCZgbCMzBpY97BxpxBkfuQzlxaWL4fFJvUPyl94/2amZPo5y8IoJKTFrVbDXGq5VuUJJUi3HHSxdNHD44QndYdv2/dMAbxHs8dWyTMueOrKDjQPOwRh4nWgVnzOBF5+xhE9h7t/VT7+d1D6NbFGXMsaxnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5663.jpnprd01.prod.outlook.com (2603:1096:400:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 05:45:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 05:45:20 +0000
Message-ID: <87sf6j6nf3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: fsl: mpc5200_dma.c: Fix warning of Function
 parameter or member not described
In-Reply-To: <87il7fcqm8.wl-kuninori.morimoto.gx@renesas.com>
References: <87il7fcqm8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 05:45:20 +0000
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdaac37-6129-4652-cb6a-08dbc9541731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ioopPQ14ni0P5DFk9xODmArLJzb6707Gnt/Xu7DvUJHCJCKAC0e1XADpbKkFAq+UIfJ+PULGeEhfFjK2l3sUQWFMTCMhU1eC/6X8wy73Foksgzc/3gf/zc8NFq1KnslG2vPP4gBDcNNj8eHVTDzTkUCrtqSaJ1SWdU5abQewuzsnJ0da8VYEvZETe3GWDXzNL4oy+vcz+KCRMh4orjYV3QB6A4wXgmZ3jsOjfAOIdQYgd5gVlKHta258JKByTZaGOEEy5DJBEjozA+Fa6zsF8Z9+3IUjWre3jFt1XcTvempN+V1CKPgAgIt5SFP5hg15/N5sRixpGcW+wDnKEaDBDMwhcJw8EOpGt5pZTLBUI53JkE7V56ZaMTqk65ZCIQ7AG4qGcA15S4QlAc31Vnieu2hj2wf/62Jp2tIOGVcEIUG+GUUmbt+nLluMoMd9sGepL67Jcd4zt22SBtEcxChk90AEj9lPPLkhnTYhGP0PvXjyChgYa8y7EEO/FcvinPJ6gvZL0p8xYtkddtFyJUf0zggNVayt65Ii7rEwNcqPkofCfYVe3YT3x9+Z7AeAnr4mVINazgTcVxCzJBqiIw5B4+EAihQa9U4iNCL8BnX6T1esZwpkeQnmjDrpA3Dv4D6f
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(4744005)(2906002)(38100700002)(38350700002)(6512007)(6506007)(86362001)(52116002)(66476007)(316002)(66946007)(66556008)(2616005)(41300700001)(478600001)(110136005)(36756003)(966005)(6486002)(5660300002)(83380400001)(4326008)(8936002)(8676002)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+aaJ/bAg5YUV4BRBEn+JogdLSj/x1+UoGrUF1BZJiV6+A8V6b4Zy56jhdvAk?=
 =?us-ascii?Q?DXsHbvo1YXCA589rZnFFvCM5Sm9LbIJrRT9+eYT6ANjeRGUb44xCj/ye8q+3?=
 =?us-ascii?Q?Oar46dCsbe7matJ9tDLr5mzAEf/hR7E1dkdqW2/P9X1wkP7JLLHMF/hhRAW/?=
 =?us-ascii?Q?r/+zvc+jW6i+UxGTTWoV+LVkJ9On47HwgadETDQOVh5JU3pUv1+XAwAVZjHy?=
 =?us-ascii?Q?NP9P2zEwQxIcDedEMqHlvKCYnIa5y6FOzM3A0mnTSQlEqywZO1JsIpA9skIA?=
 =?us-ascii?Q?lhRQ6XCjTBYku3McRb/BiETSXArMDjMttbhCzbbwWp/+8Hz5k3ZLKmyDNuSJ?=
 =?us-ascii?Q?rg44p1wVV2Q/LuUy2YOkVxMHP2OWszH24Thz9ZAnls81FZ0/9G+UAnrMrhbY?=
 =?us-ascii?Q?DSG3oEepIfT1DX1s9w6hYzDvcN6H31SX0lkbgXbQo2jvLB1zaaNerc0QClBT?=
 =?us-ascii?Q?zRkkU/1VE05nxrOxl3f/N6+ZQ0pL7WfjQ/bqYkj2P3aT3splo9NYoV/a8Aj4?=
 =?us-ascii?Q?7xonsgyjqb3DpQ3DLU7+qTRe1TJnzV/ZlZdIH0w96ldNjpkLoA+nXlzR7Xhq?=
 =?us-ascii?Q?iw8Jo93PayJ9+EdQta+cBFsSLoA54Yjd8z/gSIF2Ix2aWJE0/7nqS697tXoz?=
 =?us-ascii?Q?MA+qsdhzKNc1WDygm2JkIHbvCQbym6g5gdG1CuS+tRneKR/J1u61BIigLmCq?=
 =?us-ascii?Q?SR6osDTZo4QFpZ1xhyygGEN6MBuZYt6EO5G9zxVX497v+PvZpGX8DY7CzYo5?=
 =?us-ascii?Q?ap6/2IfYSSgHKPAsEXorPOb6V+XsWSe89zoIfeMfPNe4YAwijp6fQzwjeEOJ?=
 =?us-ascii?Q?Uk/MHqz9ua9w7lo9GZ8CD0CwssBVcLRqglTLHAC83Sd440hOgJum6qcciGKE?=
 =?us-ascii?Q?PotD47grfeVu22DGRBrQxXGfy6ig+rADppzX2pJG1WIzWvieABqAz4SbyWgO?=
 =?us-ascii?Q?sPqoz2MKil5tkJzNnBSgTkS+xxLZCMGF9sMBObETLSIWd7cPPiQtssr0K8tg?=
 =?us-ascii?Q?po2gtasV/nCTM8YSe1lEv8IpeQJQxngA5zuV+OpSxEALxpQS0roauIIaM0wm?=
 =?us-ascii?Q?0y02ortITQZMLbV0oMHvXBdCoDTPEvk5aBPvRIOu9Wb4uwfMJwb06XLTDhqa?=
 =?us-ascii?Q?k/jV1yR7lcKgLSJtAWewsonYyxLD/dALjs2dm4pwZsCqlWPAlKljPXcXDbsk?=
 =?us-ascii?Q?bHhuYFsLGrLlMzkJ9bA9ryReaUncAHUtgvRMIyksjeQKh+LQ85uj0Q8u11ur?=
 =?us-ascii?Q?l1xVQ3l613n5Ukbs9jcMXzRNpFElSmq9G6Y/EQr7ruTz5hr4jyG9ryBka7gC?=
 =?us-ascii?Q?Ic1c0ZHWY8A1WpCj7/StCgsmYUyJXRh0IwL2QnuhxeRN3H/kvUuqAg2+l24i?=
 =?us-ascii?Q?/ZGmSL5qliPuteRmMJMxpQ25JrpYpD5I6nJ0W5qB1FKCjMHz7NY/ut5sv7xK?=
 =?us-ascii?Q?U3k1dUJc5rJMFD2CMSVcmdMPgl1UOIlWpoEDzOdRGtFWig9c7nDlMrU6FUZt?=
 =?us-ascii?Q?zZxHJHynHU+ZnwL6sOewH7ohyq8dLClAOZ30PjdflfvuJTwQW7TmwPJ5xyE4?=
 =?us-ascii?Q?URYLCvCndxpScuIaW5cNh/arzPKvXsU/1xHltX3ApwR/xrDzb/8xAhTQIlK4?=
 =?us-ascii?Q?dx/GRJqpOngWthgcLIRO8tg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cfdaac37-6129-4652-cb6a-08dbc9541731
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 05:45:20.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XygoCyforYDTZi1y0iqeD/6HnQCGj7Z4eruKhYQon3uf1/mR2e0EjQ3OCv6wMoRa37QxFttodR46vyKRnOOFyLYGQHVgrPjK5C/2GoWtO9CZjB2Vq5O1AqLIhPafTnfm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5663
Message-ID-Hash: BDFDXO4JMFNYIQVWDQBIUABGVJFXFR4D
X-Message-ID-Hash: BDFDXO4JMFNYIQVWDQBIUABGVJFXFR4D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDFDXO4JMFNYIQVWDQBIUABGVJFXFR4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> This patch fixes the warnings of "Function parameter or member 'xxx'
> not described".
> 
> >> sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'component' not described in 'psc_dma_trigger'
>    sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'substream' not described in 'psc_dma_trigger'
>    sound/soc/fsl/mpc5200_dma.c:116: warning: Function parameter or member 'cmd' not described in 'psc_dma_trigger'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310061914.jJuekdHs-lkp@intel.com/
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Fixes: 6d1048bc1152 ("ASoC: fsl: mpc5200_dma: remove snd_pcm_ops")

Thank you for your help !!

Best regards
---
Kuninori Morimoto
