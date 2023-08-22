Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9198784D7B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 01:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F74C86F;
	Wed, 23 Aug 2023 01:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F74C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692748357;
	bh=YbkUo0UcVR1rfjDxS15FBe2KhW1QgQXwWLLX09URLnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GVlNpuDblc0cZe5Y9ZhK0gADRpY8zuVO4cheZrpnFoDnH70KCRcY1n3Pko3TpEC+8
	 4ezUCUUpVCEU+crZC1UKWuou2QbX+emux2FLrbr0sH7EIlZW7E/btRsndd0/Ut9HxF
	 lqafEYZALk5rU2kNtYTOXPrdBGbTjBhX/c9lZZhQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43106F80580; Wed, 23 Aug 2023 01:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D31F1F8057F;
	Wed, 23 Aug 2023 01:51:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01DFBF8057F; Wed, 23 Aug 2023 01:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6655F8057D
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 01:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6655F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ErH7xfG2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3/LuOyIATd9QuP8neEiSEEgQ+ClJaoXf+lGYPhRLlCT0/tZGP3y9ApfnK/jO2MPCcQ1i5w2lhcV4/qMXqFN+TA4YdwvD218u1otvb4gzJBJMhTeH3EDKE1onNBWupVxpbPzpC8uh/oFv/qIMhCMHFqc5PRvXMpYhmVw1LNQqcwe0B1BHP+NuAEsF3maNgQYf84uXIu9A7dK/hU2hoPb7WL7/XKpGH2apUNG8fNA+lNcbPN1CW42A0+EJZdtn6PhJfaR+I3/JOokVoS8tAeqwWzb2id06K61Y1xY4lpQ1HUZL0JlI6S5j0ygtL6Wnl2tXJ2NLyoEbrgR0Wq/QHEwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjabgIsF7ghw4vXCXK4DRXFKfcHr8+ZyT2rSxj8IBu8=;
 b=dhgUfNPQ4bwgaRvBK05PhEl4xEZWfLhUq3Witrj0vV+E0AJLI6ieKAU59JJXhwfNBe02nzZRZtl0ZW3IB+e85M2i4YMxxOwfFx9OC/2KSd7Ek7oyr1AB9L4f6bwNty1jBsNq6hsjnXQr8e888pwuLr5BOFcouo33FnXtVUVFv+NKBXbHc07VtchG6ewqmQGUQxHsrmKFHDIDSxu5dC1dgTxBIkNyk7IIWuGkbIOpKRPA6ywlFviP0qx4VBzHV5kdNMtcgLkSgfp0VVKJbIdbQ3UivfI9st4Jf9820MTrMhxh28Pf8YlG2xg3dVsVIKge3sFSrDtCK0N84xXX6UFaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjabgIsF7ghw4vXCXK4DRXFKfcHr8+ZyT2rSxj8IBu8=;
 b=ErH7xfG2aaepwyOWZFguXh4IcWZ3upazd/NcapwTCt2NLWHO/hl8HdadPuQxA3Nu8OsTSxL8ZU6wmDAFHtJggMrCJNSVSgqzxZLK+rcVkeJ1yJ213MSCxt1biB7ZLi9nFScOhB0lpvC7GmDm4ltideFZiRRKotFXrAli0mBX+qY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:50:48 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 23:50:48 +0000
Message-ID: <87jztmzlew.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: rsnd: tidyup brga/brgb default value
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 23:50:48 +0000
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TY3PR01MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f83fef0-075e-49c3-6c3b-08dba36a9c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uhveJtbMybfxL64IAJ6+JWu81lJr2LTE1/Fk7L3tufJor5sIilWeMUzX7Myu3AtlelCPRqNvkhshfN63cOD+1PD4qdUraoUHd0aF0UN4MqGPI2sAMgNlfUnPCErTjE4vJUJ2XR3gYZMQsA31VY5rkfUTirFU4fEEwmPesFS3MZDIRl+gMKJp530wNCJR1v9udAkHp41CK3hs9Nx8Y/3NYVr+If5E0bONW4tkT3uOuynyHpayKPxnOSlFkbKUf1u4kdDC08F6HTKlIUWaJ30rFQ8NffuvsAeOxqxOJVJ64Vwd02tjH9zOCx6/l49dv/+Zib668kdv8pouZC5zWgs17GyzxhxGkVVGqiE1+DnjhJyI/+v/wxDewhTTKXKOWxd97Y9AXaSP2MLd/Zckx3HCE4zoXfiS+gR2UwtjOnNA+IVjCUe/Pt22HMj1BIpOc1O+xuUii41GRKnOsr3yOHqUviYf57G+HBaSUBQIUkhb1BTHt+DcAWPkGpSqwvQsLnc2AlRxMwvt5/1pzP3P+2iE+iXoUKcti0mRiveZv0lZRf0Uo3XG/UCeescA1DXbMj5gbUWY5Bje+EQKnlFhrU5LuKulzOSystmlUTpq4qen8IrgpotMdzFAs2fhBynug8xa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(41300700001)(66946007)(52116002)(54906003)(6506007)(66476007)(6916009)(316002)(66556008)(6486002)(4326008)(38350700002)(38100700002)(2906002)(26005)(8936002)(8676002)(2616005)(6512007)(5660300002)(83380400001)(4744005)(86362001)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c7NTk2StzIt+tFtAaLAKJHV4kvHgJ7S1uiKLjxuu2UR/ADiiQAKcj1PR6RLT?=
 =?us-ascii?Q?aqdiO8JBpjz4st/ON48Pdz13LHXZwGDDjty54qzFCqxrIKeVPdWav66TwhKb?=
 =?us-ascii?Q?xkhA4YRLjSwDLKrkSLm/6L1DMP6uSIZNOS/0u8k5Kh4Y5BNswH1Neq5h4mWe?=
 =?us-ascii?Q?r1BXwaaQ/kBi3GICfFv+2ooedE1dheZz4MfDV6MMPkIW7HBbeeWRjwBF087O?=
 =?us-ascii?Q?AWqQSFqKIcVG2tRiUPS+EFbYVInEzZoO+FZcu2R6MD+pzr0zBkGa3U0Ynb/d?=
 =?us-ascii?Q?+l9Lz0Iga1TGjdDRQXeWxwh3Pik3L/sFDmEQnRKpwD4tIOZKyZiWWzJzY6No?=
 =?us-ascii?Q?DVBqgShUq8mH0Zubo0zbBvfyXRoHHMCqx+HcdLGLhjYOEYZG3OIahqIfPKLa?=
 =?us-ascii?Q?QXCs7Vu4vmuxIWCZU7KpwhaT/8czZ8aT4j4v+7BGPbh5uIJk3e6lSNsgYVQE?=
 =?us-ascii?Q?2y4VKLpFB9kG/YIjLmEVqm+k33kSAnpl628qvpR/Hi6Out0M8AS3kk0kTquv?=
 =?us-ascii?Q?TsSFLUuncJEK3Q1+xLY6AAgVVFdG6mLwZnrRTDCLNWsFoPkaYzjHGE1MM9md?=
 =?us-ascii?Q?yIZhvkMH+KEvXRAkhAEiBGBtMF9sRndYJaaD8APiyiBob60aPLE5cqnAj5am?=
 =?us-ascii?Q?B9cg3Cx4qQowaBbBREBgHGruZNifckniP+jfxl/lpMNNx5rN4ZTkLKgFMI9A?=
 =?us-ascii?Q?fx9h09xgriiXe3ej+/nNiHVL375OF1aU+5H7MUuNJkmN7TXX6z1/LPiqNIcL?=
 =?us-ascii?Q?bUZuZt0S6KJY+t1PImxt27kiH1WDQytdGJFsBNPYoKi1FWanppcZYIC2j/ng?=
 =?us-ascii?Q?5oMnv0M/2ieUxbF/qII5py8KdcMijGMmnB9fESJzpwWvnfggTutBUl2d6wju?=
 =?us-ascii?Q?UrZ8bDszW8d0TSkOx5Nh0m270WF8uv7JZUTeN7inhetBCrtFdG84dhKxZPXU?=
 =?us-ascii?Q?qXQ+N43VXyJjQshevd3W+rzRtPoxB9BTvLq5+s+9IeQcxFEu1vCXPHQsD4kS?=
 =?us-ascii?Q?MCdoGpYchrjw9WgCiWaakslmU0KI4epkoqWYuDco+MiaiPYREswpAJFIQjkR?=
 =?us-ascii?Q?U0jKZ3cTMhfZYXAzcHQ1X3FYvTypzmcESRewL2/xaQiGAE0H7ZNVd6hvHagj?=
 =?us-ascii?Q?YtYHFj90hWC8pefIvY3l5taNVsTi73PIavLOEIxZ5hVn+4xciELOwuxLxbL2?=
 =?us-ascii?Q?N9fwRyY/5DJ39sPkHqloHQYHvpxxecZ4oz0Txbvxx2F6QbbS+YNSiMr2KrBu?=
 =?us-ascii?Q?cKsuioFat55ooShhXZ7nnpyf4tVTMIb/01VtCSgGtVwcB3VrLgZjgwv8ay3b?=
 =?us-ascii?Q?chR72CgDQp4/lc6vWt/xqXzztE6MDbK/uTbITvgAKcsh0FNQb6xRQEUYqsJc?=
 =?us-ascii?Q?AogY+LeY0M9Baaq+CBkhgzm5WyvrYOB8N4C+4GUA6n+EIqKTTY3UyfJipV05?=
 =?us-ascii?Q?Y53bvku8a+9JPh93LyIuAcHUzhwzcdn6p+0EAVC/dt8GsxkM9tUQ0IMuYS1F?=
 =?us-ascii?Q?XLfwL+K+8KeKYnQ2d53bIU80jGB12Y5502F6yxXzlZeZ8/lykj9ji9LNOTx0?=
 =?us-ascii?Q?KTt2DGGX0r3pVXbiejw6NpuvFYiBrA99Eou4rBjcmyW8F2ATON0ecBJ4GfW2?=
 =?us-ascii?Q?3zfm7IfJY01hGomQCeS1sfk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f83fef0-075e-49c3-6c3b-08dba36a9c0b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:50:48.3605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LAu9p6rgDPS5vTWLqwzgwUBxmfeZjiWXqJL3HOFrXRitZcST+oRIcHR4cf0glML+92h1HdB5ObTVHU/p1CkbpuNno/CxT5vD9JN+23J7wup/45w46Cjj8HhEXwMNnpkO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11948
Message-ID-Hash: FFGIEENP2TUW4QPISNWF36UQZK7MXXKS
X-Message-ID-Hash: FFGIEENP2TUW4QPISNWF36UQZK7MXXKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFGIEENP2TUW4QPISNWF36UQZK7MXXKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

default value for brga/brgb should be 0xff instead of 0x2.
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 5528351c7535..fbe209b2430d 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -503,8 +503,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	};
 
 	ckr = 0;
-	brga = 2; /* default 1/6 */
-	brgb = 2; /* default 1/6 */
+	brga = 0xff; /* default */
+	brgb = 0xff; /* default */
 
 	/*
 	 * ADG supports BRRA/BRRB output only
-- 
2.25.1

