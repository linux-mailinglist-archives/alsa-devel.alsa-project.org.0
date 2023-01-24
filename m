Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815AE678E0E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:12:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06518E91;
	Tue, 24 Jan 2023 03:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06518E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526362;
	bh=rC6vpG1Ta9mnRrdRF74hBeGJBtsTTlZH2sKayhKRNb0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nbCb1mQMxuWaD10e+HWBj6Bak/2fsbYV83f/xhzZM7X08l7glCWcgli5xtHAk9WYV
	 vAyl14w25QFXXfRJxs2c6LwNqZ3FUFv6Khsu1b0os6hfsf2a0AMKbku94ij5bkwAx9
	 J9RcsQDdfFGrU7y2d9X5AEt1X48z148Sp2drV9jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A497FF804D2;
	Tue, 24 Jan 2023 03:11:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D141F8030F; Tue, 24 Jan 2023 03:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F454F80163
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F454F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=eb3Xceyz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPSJEWkewtFo3PVY2BTQwLBzIsa/yKEXqHE/xpGCimythtJgxzlqIa+Q8SSEXmKFbv1cHPKpNgzexLtKgUvZJtdopDJlW3jLbMA+16XKlOyvZfHjBXfdaMbwi16tKFPbO5PlS2ui88hFrTo5OerjsQl9nDtp9+qLxb3MTWWigNUGmLvk9+rYbeCsjf4Znnos34FQEm2Yzre2eOAPUWzBrPIIcQWE9jG0hT0Ke/Kx/l0XHO4HwaeTqSa49BrmTZI0l1nCkZwX2Xewf2X+8R7nhmoOtE0n2a9+PKf8CdPyXDHtzw0Bpz+qMfm5WXPw5iDxpt9USGcrQrcIkNd/97M1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2CsvswnVRA/ZNYiMOCeNyvKVtXWrxiY4lp1NA2px+0=;
 b=SHxusahPl7Ofo1pqlDDfjz0+fbicRL0xjY5hKQ69LPsBr91CZ8ulXn2zA2jpPwW5wkJs2dKhb2Jcen8oRR4yoTKutJuS4aj9sE+Vq/3Lrx3gPtQ5zu9/VhlR21kpBh+10G49bIa5PxOpfVZhG0si+rI/nQQ6EFjlUSHgw8xQ0n5UT4Bg0ihb+fXjOKOhw652w+hQrWKxrCJkhVZLmbOaNuStQfsPa9ZQIaKJ8rWZ+hmsOK7RfJiJVAEM0s0lI4Tu7J8j50A6IX7rZhthr3m4U7kE2ERytYhhP24YxrupkYLMDSfQBjil7LE5hnWvxYAuxE73E4J6F0FdkxvMoFqClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2CsvswnVRA/ZNYiMOCeNyvKVtXWrxiY4lp1NA2px+0=;
 b=eb3XceyzKnHNjMq2JlGtLUQkoKotqgzqfuIp7w9E2opFMc2JbjUpOC5W1iiPC/okgOaG4L1P1w//pXqP8o6RqWQhqgbX0DlzIZUojkYWMlHHSYZDVBeZD4Yam/l9mOMIWZyqn4iemZAvylqq9okKDxUoR5HKPjjzbZaNvNPVlk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11421.jpnprd01.prod.outlook.com (2603:1096:604:22c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:11:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:11:36 +0000
Message-ID: <87h6wgu1ew.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/25] ASoC: sdw-mockup: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:11:36 +0000
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11421:EE_
X-MS-Office365-Filtering-Correlation-Id: 421392c5-4e90-45b4-4dd1-08dafdb05289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yx61iOWXwc6VrEuq0lWCXcvcBc2yi2Rkjq1vIQYWufLUtg6i8seVrESRUumT6O7gU9ugHfxOGMq2Jkij+nYzPeSpJWarWmaeZZUTlXwVuRzvIDj6BXkBXw+C09LYU0vZ7UH72hpnqQKyNl85mN0kKabYZ3UDzMOnrnp3mL4nC+yg/zglXbq95DrcnMVoRWjuaYP4vwV7KIHjOgxqvoy0tcDa2kTSkKhtgIy1f7rqJaKtpAF1cBd7gRr97S3ipXsonzsce6YcATHruKXCyGoAmY1elOomxk1E+WPwCVqxhsq2zieRQiG+ARw9gEehyO1WKd3OPD1N189/6dxjJuJ5SPrdyJYTkUXYgKoe5B8BfdquNdo0Q5LUbF2T5P+x0n43UeYORpn57mbWNVFDgqWK0zeIFDj2B+vGrDSe6Djt1bOd4/GDO8DiknkFJLHdJihsih0oyWjS3jsk0PaUPj8FOFOKcjKfD+x50prssmmMEQRSKa8G0betQ4NjfX2C7aVKCt9iPQ+8PdO7sRR03RrwpSxLle/pyDu/YTEQEmZahOdVTSs/MXhjACd0PFk6Wk/3pUbHptQkd/AC4WYFdtT3rCVxeS0pjTsJ4KvCOalZHav0wqeAy/JTHcmP3xuESK1nOoShgNyE4CXndCRNZRKptJYmCDXfaMrUEDGY+TDwLhM94O94x0Tr5VbE19xIM7DYRHSVyZvnxJYvBQDWV/KX+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(52116002)(54906003)(316002)(41300700001)(36756003)(8676002)(66476007)(66556008)(6916009)(4326008)(86362001)(66946007)(83380400001)(38350700002)(38100700002)(478600001)(6486002)(2616005)(186003)(26005)(6512007)(6506007)(4744005)(2906002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V8MGpw7SqbBfDDDov4Yx47YIqrLR6KekDGevHekirdPW2+eckcR5rcTMl1Xl?=
 =?us-ascii?Q?kqyXIAyVTC7AjB3568hKzglsP65J5KkJkm251vBdGsevSlflGhXetWV3KI17?=
 =?us-ascii?Q?Unw/7JAoeYgXQibHJ4kHkCZSWXQtSTO3zrjsImClgWi9s+Vqcf5WXYdM+KOK?=
 =?us-ascii?Q?0xusAFJo6wvWU+raIrjZmc+U9HvsQq2Ac/R36cJQx3dwZNoVE/yvTfswbBop?=
 =?us-ascii?Q?9GCu0Di2RfxYrpBvBjhHRe5rMeGSERJkaPH9ejd23FVQcf+47mSBoQUbtJgF?=
 =?us-ascii?Q?zpMfdCEtPNkT4JsFzrNq6pFtQYtOip3L//14DdRB81c/KJCB+6W111VGNj8b?=
 =?us-ascii?Q?tyDbAKqbXeOWuE571q0hvzUG4urcdRiaJpcsXst4mudNKRlmtBXICu7b5kUm?=
 =?us-ascii?Q?LQVFQbct+dMx2BMSv7iADQ55A2sjjxS4oWRGscF6pEKLynAgKIJVaE19ngdm?=
 =?us-ascii?Q?fR0/oJuOuH7eS/rS+dv6XASbLO1ZI7lpRBAxQX6P2Tsnh0kgqCytMfZAs+kJ?=
 =?us-ascii?Q?ttJZ/hCOr4pu80/ty1VpXuetjPkrBP89l+0q8EnbXt0yuUR+87QMly1wug/N?=
 =?us-ascii?Q?SkPW0DaLN3tyYMHQUayjvRr2fSKmNuhgkhrRzu8XiNIQ9LB2hm+O7PlAdaP7?=
 =?us-ascii?Q?t5k7TW0vFksoR/JO2sLxE/fHbIuReyr6OYsXb1tJQIMYoSf/LgaTvZ32uvm6?=
 =?us-ascii?Q?dOpopy/NuxHVwnN3Nq2QBpNZR0Y7jMZtiSyOLq31+H+AMN0ng+414c+7xWmY?=
 =?us-ascii?Q?J/PuSJjj3hIxwgkzFqEkUckot3Vl/5q1+nI3gbqdQgtTtViBZ74Qyg1fBRIK?=
 =?us-ascii?Q?9B4cRGfUw62udYLfz6hX8bAdR+we4cRi95J0X8he+d6oWWNcgFemchs2HKi4?=
 =?us-ascii?Q?InaidPOJW+gcXTN5c/tPAHxwK4mSFvgPV8f8TshbDQrJfkg6y01xOdzvkmgz?=
 =?us-ascii?Q?bTJvIc9uk126vYAdaVAHHCQlfcj959UIuhUQ1vkXLy4JZrHWJRZuHo+Vidum?=
 =?us-ascii?Q?zF3sQef23hKMa/Xpd++fCsw7C2TZUGHWirasBBCPgcDwkhZt1Lw4TdVlSbCV?=
 =?us-ascii?Q?XQs1k9670U0OOw4ku3IeNS1Yp1W63Pl6rABHVrwAPLeMKx4O/ZxMRpLLq3iB?=
 =?us-ascii?Q?dIMbhrq8SSqKtdBX2Sfd4EXJbJxRPI69fynLfrAmmEynn+V8xCxlzmuJLBVG?=
 =?us-ascii?Q?D/+s9Gi5cwW665UVJN6FRf81dfOMe+LPzwfdtsuMj8X0mQxCrab5yn61UI49?=
 =?us-ascii?Q?bHuBOUQlU2X23QP3xrwYXbQH3WLvzBqIVxvBHSe/se6pIsJndv/Izps74jT9?=
 =?us-ascii?Q?pyTcvgI7cxt5eY98HcGG0IypmXejUvYveAeToefbei9kuaAZlmtT8+jvzjo3?=
 =?us-ascii?Q?5evsdmTC+1r1wNEksT/ZIjdMODJLSlLwOjaSVOl/jsT2fS8pEOR8qUdVyxnw?=
 =?us-ascii?Q?j+imbi7+utiQBeOB0xSnuQTJtuY4FGhFcpm8MyC7VMAp0oaK4sK/rP/FBMJ3?=
 =?us-ascii?Q?gDlBQ+5a/WznC/g4HI+x820YtMgR0dn8kgRsLQcWl+f7s/EURyXGK829Zxzq?=
 =?us-ascii?Q?53gQZ7AasEf9emZwMW/EY4qRebD2N4bIDQLHnDGI8pWoCDclwny/3agJKqtS?=
 =?us-ascii?Q?HmyDIlibRP0jGXRCcfJQtQE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421392c5-4e90-45b4-4dd1-08dafdb05289
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:11:36.8085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTHaFrhPI9YgeLMZ98A24H8yS9j5PcUeP8AmcJp8p54eVpPIOfLEzGI+6vpr/hEvNH6La8EvmUQLpSt/wEH3/JuvtnEGnmz06TwjeejOL27/ZbGpiBH/z/Zi3h8+5kqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11421
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/sdw-mockup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index af52f2728854..62b02d764f09 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -57,10 +57,7 @@ static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

