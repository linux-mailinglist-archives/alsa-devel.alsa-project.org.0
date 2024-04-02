Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D141289494E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 04:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 608FF233F;
	Tue,  2 Apr 2024 04:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 608FF233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712024660;
	bh=67zAeJHPNpCjjt5QDSFmhjW31MpG6fc3ZELSdMfTUrk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q3h8cacpSnlAnW8ka25DKFko3TeCtO1BTnSJAzEZ+zU+c2GGCl5YGAy7ApsYfOc4M
	 YoKQqM6/VCj76Km2H2VyhDk24Tdx2YnCvOGUkNpmUanplRcd6ZYjVCciAZ15POpZsp
	 RDJKQvk8ZBd5uPxfjR8CX0YRkbKH2Xs6bkSw65ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3716CF8058C; Tue,  2 Apr 2024 04:23:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B2EF80238;
	Tue,  2 Apr 2024 04:23:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFBABF80236; Tue,  2 Apr 2024 04:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EF9EF8016E
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 04:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF9EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IN9cwPZH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5IFENOtG6WEfieYTQVYpBtapegipzyuJlFAaeSvVQHHZFU6wRlse649keUpY82F7xPgpcpoNdJlhxbv67M5cyCLOQLiZ45UFBMea/PTqtWrb+HOdPc/NSp5nE2a1qH7uBKd23XDKjkLy2Peqgk8V61CuR2+NdEg9wr35T9v1bSzSlHliKPRnD7XTCYV2Y9bkj5jJbj1zMPDblr9DcS++RZfrgBepXZTh1QNUPV3fpE1eKwIKZYfj8KL2nNFLVoFfhjon6SfakCiueGSf+aVulkz9hbs3IUohuxPJ2VqPI78qKe5WL9hD5L0JHIlq/ZDSSh3U9QlokTu0wyORzYVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g3NOY0inwv7tAZO2v/ckv0j75/RfW8F4S2B8ekXZsM=;
 b=bcxm4CuN2IiGexqT5GaiytllRER7UAdkCiZnMHtP2EAYpsjqsihpyzXRoEBFYba2kUZZWf28vlI622RdboQocxQLXUTtfgHF0SF2NvkKV81BUGbej7HQ3xxQ3qdOLFEDU/eUepRk1FbC8lcQu2466K8li9CoSd2Hnwwy07cbfReee8kcvPuHV4VkdQmKVquKfjdhMZvPY40YLXykzWYXKeMolxKAE+dM5LW4AJWp0iy4RFdb+1mPB/uJoxpLVxasQI+wOcBIvwVttC7RT9/bR59u8BsLZKzmycNN2hCwX/hCxzH5025A3qKV2rEfgNXhxwLyN8cOsg+WrKhPGtqbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4g3NOY0inwv7tAZO2v/ckv0j75/RfW8F4S2B8ekXZsM=;
 b=IN9cwPZHyt0qT/u9JM6VZCAOzOWYQA1YaPHRL3UIdX/jRiS2ZxjKbJL+dfPNU6v7OvHlknYwC6A3Z1KKUA8RIEKL+C5gJSTjnnRirY4flFYIUpSIumHKRTzn/QE+W84dsMDqgXF+gElXQH70hMSTucgB4J0x6bdZRlZn+fEqNjs=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5959.jpnprd01.prod.outlook.com
 (2603:1096:604:d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Tue, 2 Apr
 2024 02:23:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 02:23:35 +0000
Message-ID: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
Subject: [PATCH 0/5] ASoC: rsnd: reg cleanup
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 02:23:35 +0000
X-ClientProxiedBy: TYAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:404:14::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vNy/yTZ5uQDr20nQ3xgMVhSweCI/cqPPY3SAyrlFMNLxGqLcs2DOxuOhe+ppy8JgUQ1YUzpmUZYpYH/coYenly8cL8X4SM50q9BpYG/P0xQ5AR6iKSNoxqXvs593VT3bk8v6xDx7HNW44XW28wGNWyPlIxuKrxhT2J/ZVZFdGrUKTRcBjCvaYKg7fVx9/8nnY+7vgXwefQ+SIDvmGSlm2HATmnnIW6QhHh2ovx5dSO7a9rhyhjRuEsFA9Cj59L43aQmLy+nD/k1iGa8cpUOIzX0ftVSlLIqwU+DLbO/a/Sc+di1AW6U23ghT9h+okhCSKOwLdQYBDhDYg+291dVg3UyAHdsKKeM2PT+rurPIiuxlS0exItI94mn8t4IoXWq76wMeGCP5bgu5FqLNf1hxZdLjTjteOR0k4o+domz/pPHtxVJTTSEb6FkWFlIpDyQS6bFVbfabKlirdnB2LPUN7R28xxPfIZB9KhJtVCiBvFbzUUiRBxeipj2wuv4YY67IgAPiNWlPmxn6OyLjRn+cSdtcvkQHrDVpOzvL3+TtjvWVqOxMNPhBtsuucZuGUPR9p+KL7ITS3TKdA45w42DbKXZQK1ZEWL6QhmElLgvz/Q5l/skuUyOHnzCXNx6Usp/5xRwX3PsX+g9HaDLsy0Rm/vyrR80PKMbJEGN7wg4OjZuy8sfYURY0Rer38tis/q0s/B+Mo4pa3zGZ6FYqNsDpYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vmWCZWk+DGC+7ALDl05EG8n5FeMKuGA/LUIyEaKIk6F1OzmV3HMmzmMBZDIS?=
 =?us-ascii?Q?Xlnb1OmRpiulX+scGYqDPunQuju1NigJDbK5/lQPMdBS2STa76LURXEbhQSh?=
 =?us-ascii?Q?SFPCsjz8v5f7AOUF68adNCs7a2S5fEU1VIulxqjgxsn1q5Zjkzuf51F4kqhD?=
 =?us-ascii?Q?ykLWd3iZOhNBAQ2nzinkm4elCg+4vU6Olnr7hqawtrXWC2kHCHpENh/jEP6l?=
 =?us-ascii?Q?47liOmJwVDEmXIZ6bLuORi8SftmC74hCXnkQ5yLlvoWPeQovA6N8VVJs9xOv?=
 =?us-ascii?Q?JYXUn0cYJYp1ZXU4a6URk1EQVF6HRP3c5zAaAbvBV3FnykvCNaSTHXDvdFec?=
 =?us-ascii?Q?qt8ezCZPKLoFqvaScnYDjMb0V2D/IW4j0I/bfWsaOanNQz3ipYu9mqXfQWK/?=
 =?us-ascii?Q?kSiLolTMuX/N6F3bVlJE9vKK2dEn3vIQZ/VlV80ykrbp7kBaSwsbXf+flN6L?=
 =?us-ascii?Q?7+TtFRlAyQnkpM4qbn7xxEvjXwni+MsNqpq9keiQ17yEuGJkp3rt0wa2EZ+N?=
 =?us-ascii?Q?/I0X+I8i1CuvEly7JaKHPtHzd6ET26h8EbelqCT9Ri+SmHZn06TOVVjgXKEB?=
 =?us-ascii?Q?MQ2TYNbXpaUba88ZPtkD3+m4766dyN0OQ+FKE5kcFrhJAyGGrh4DXzhqvQJG?=
 =?us-ascii?Q?8mnY9yTPzv69Kgb/10/NrbP0ljdbzx/KEgBZ77K4twAYeuR7u/n/oRGBsdKc?=
 =?us-ascii?Q?SHQeoZgUBvAGQhTylDYwizqGHmuXb6ezLYkcrd0gmLfojqmO6CRIORScoQOy?=
 =?us-ascii?Q?tavtp14ZwgaGi0d3pJLkLeaSLwGGcOOJkx7YJOXlu2654Lxjyi55tvWFW+uB?=
 =?us-ascii?Q?g1M0wpuq8TGfO+/3IVyvXMz+nO/+1LdbJCEezySNCBpINul7RT1mC7c4/EHi?=
 =?us-ascii?Q?QjZIzDiH/rKeW9HRbmzArGDQHpZ314iyOiIWpaFzvO8ujFnOX9FNJS7Jvb+D?=
 =?us-ascii?Q?xgHXMNty3kdEM/rZrV5wI5J0B8aJJmS/ondonPtbo1SKNSFEnqRoCo5WzENy?=
 =?us-ascii?Q?P1S09KqtmO3/jm7vY2VVCi7J/NgDkcngHtofI9x3ttGfRDuP2sKxbTzkkaLp?=
 =?us-ascii?Q?VHjvLl6GkSr7XQJSxF0KRIw9HN/g/RP8jj7cnFiYZKiOdKzBAGuiHFAQBxRb?=
 =?us-ascii?Q?GQ1aKdV7L2AkiwdjWZiqejWuTxO2QIjvmTJYTFxXqF17Qo3AHxT78BiRVC6S?=
 =?us-ascii?Q?kO+aj7ePpTtV+nMxWcubX7Bg5uyiqqRB0SmvUzixQq/3Tv6Uv3gPuY+dUuTS?=
 =?us-ascii?Q?cptM8ZEfgG03M6CP0Kcha7P2Kd7zdlsdjf+GLMDNstzv9tpl0rpG0JEBsY3y?=
 =?us-ascii?Q?f0v/XIpOnVP3BsUUDpb7nCXFPYO94gUY7H+5lOKLUCTcN3hVg9flBmZ901VW?=
 =?us-ascii?Q?1ilD9NB6DHnUUQzMyx6U8NH5f1NxaTmQjDrC/2b4uJiY6SuTNFpMKD7TEXs1?=
 =?us-ascii?Q?mwUQm0nP16YbZrHvQ4mYBcJagnVNQiTaZXuXPR14mLMO7N7FMKvoeIl1O7WN?=
 =?us-ascii?Q?v1cwvkpIlxy1g7R7EEEbXk62sXO7JO8M9iI1ov/fsAuhzKqm2iQ182PZTXR7?=
 =?us-ascii?Q?X2Gd2JG2Us6y8oMJSwMjJD8jE823YlxPah+doa4/m8j/K1EyggjIv3ZNAz3Z?=
 =?us-ascii?Q?UalmXHKgRKTKtA/kCMQTeV4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab30ba7b-a257-4fde-c81f-08dc52bbe638
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:23:35.5950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q7EabDx3XO6nyIB+KK9IkO1oevrA/gr/aRka2YKJWnzqlpXxNmN8oJjYYMdTPEuiFqQxSSDm4mNgy6Jzp+sDJBOzxdCXG/HX82xQeW3XO9IHPDTN04sSaHUNgl62azA4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
Message-ID-Hash: CIKGSL2IOJFKJAGAI7JEYOOOJAFQ7L2F
X-Message-ID-Hash: CIKGSL2IOJFKJAGAI7JEYOOOJAFQ7L2F
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CIKGSL2IOJFKJAGAI7JEYOOOJAFQ7L2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

These are Renesas Sound driver cleanups for Gen3/Gen4.

Kuninori Morimoto (5):
  ASoC: rsnd: cleanup regmap table
  ASoC: rsnd: don't get resource from ID
  ASoC: rsnd: rename rsnd_is_e3() to rsnd_is_gen3_e3()
  ASoC: rsnd: R-Car Gen1/Gen2 exception
  ASoC: rsnd: no exception for SCU

 sound/soc/sh/rcar/cmd.c  |   6 +-
 sound/soc/sh/rcar/core.c |   4 +-
 sound/soc/sh/rcar/ctu.c  |   6 +-
 sound/soc/sh/rcar/dma.c  |   6 +-
 sound/soc/sh/rcar/dvc.c  |   6 +-
 sound/soc/sh/rcar/gen.c  | 519 +++++++++++++++++----------------------
 sound/soc/sh/rcar/mix.c  |   6 +-
 sound/soc/sh/rcar/rsnd.h |  22 +-
 sound/soc/sh/rcar/src.c  |  12 +-
 sound/soc/sh/rcar/ssi.c  |   2 +-
 sound/soc/sh/rcar/ssiu.c |   2 +-
 11 files changed, 247 insertions(+), 344 deletions(-)

-- 
2.25.1

