Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A06578E38
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 01:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C847916D6;
	Tue, 19 Jul 2022 01:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C847916D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658186341;
	bh=k5ARtgWc/bskPJ7c3mnmLQWBGbGEH93ZFT7vxepur+g=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ik05zXQsA6PHB99QQIneW76iuFS+tasGOJIaSsqiCBW89bihrz/2XUuDBS0SaEjde
	 dRouL+D2BN7UBg6nZXwC7xw8FhHtvoJk1uz0wjLKSBrUIyvH3lSwu80e08nyT8Z/71
	 oONTWPDzLrkhdwW6PFpm6OdInX2bUnNaLcsP7emo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E01CF800F5;
	Tue, 19 Jul 2022 01:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D11CF80508; Tue, 19 Jul 2022 01:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F427F800F5
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 01:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F427F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="JOLyiGz4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbHr58KRkRhB7ENWzorF3h7lirYEBIwXtg/OB3vP2SAFPPbFQrcDPDI/WL4siXnkzVh9OKuhBF3V493FZPJHBcTg9KVHMD/K7l2GZfVcNPiogTbB8SohjcChVegNAZrZdMsLQMSnKa8qnKxDaYjZPQnXS1mng53+TPqNIvSa1hv5lvhbixSpxNmvAp+MKLX39kLQpTLV+y48rLsfqjKZ5DRMftT4DHuLrgRcGLEKpRnLugD7LHwFGLDJ8CwbaBDJlhdyV2Xmjif7eM8Cji0kfBw6W0m2Kl5aJoyvaT3AQCdboAaFtcWuhfJEeAcUiHIG8NhV78Qc0Djs65uzwDvhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZgyLyUUfpeEkfJalrk/4vl0tQKm3dPNumxETrBVUxI=;
 b=nRuVXSaeEk/LTdG8vTmZoVfCDPKP164XR3UBL8mdDQTSSkL7K0/v6VktVnaoQaDUErtPtjdRPKLCqfJxWYEPmy/+EfsLTlCWNelOzGkqO+m3blMsCPSoeplj/E597dMwK+or6S9KsMS4ojCrGjZDaiCR/zOoAMr2FdOy697MwxDzyQYqOEvlsB9bbWzCTzpxkr0Zk0yj/pmKDyi62HSx2OnQJ4huulPQEW/zkLuLcNMA3lRN+34KkYj6nz7YR84aev+kT+VBLaKxOoxnqcNBQng9P+CcyEsSOR2ubxgbBru9fqm5kcj3kgMnnT7Rpux37DLnUuqiNAdNOZQ2Blljpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZgyLyUUfpeEkfJalrk/4vl0tQKm3dPNumxETrBVUxI=;
 b=JOLyiGz4ZYxTt4mMbO/FJmdIjp1dijsReBfixPer5Uo6gMvvzgKQ7qmAzj683gMGFpqy8+LKtP/8/f+9qIgWjhgnK8hrq7AyEQkQGlSQtqNKlmwG/XVSHb02/G9q9TvQw9zF2m2Y0x5A6GEOP/L3VlyTyifrcvjzdYxBs4tpeh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB3788.jpnprd01.prod.outlook.com (2603:1096:404:dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 23:17:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 23:17:46 +0000
Message-ID: <87pmi2ko2z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jiada Wang <jiwang_wang@mentor.com>
Subject: Re: [PATCH v1 1/1] rsnd: ssiu: add missing .quit callback for gen2
In-Reply-To: <20220718110404.1529085-1-jiwang_wang@mentor.com>
References: <20220718110404.1529085-1-jiwang_wang@mentor.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 18 Jul 2022 23:17:46 +0000
X-ClientProxiedBy: TYAPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:404:29::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9a74b5-902b-43a9-00d0-08da6913b98d
X-MS-TrafficTypeDiagnostic: TY2PR01MB3788:EE_
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WX3kNy7sO4TkbIgAvL4JEB8bViSFhRa8zx0cukm1f2BV40ohNyEcIEGZDVIxCKLMfkzjrCMUexLtzHXYMGu+Wy9L6IEYmTXPufI3oRiEWoD332vqk94TNuqJlNUHqMlv4lUIu1CWU6j1XY3lzK+3ZYlJWo6yZJ5S4TVlORJ+AkcIS8WPd5cbs3KcGOKh1VgCYt0agqAuuHNeQTrCFZu9or7IfZBroB059WLsyHVW8uZPA6bCwqgmKjybWSFyU4672GOfGABthQp5f3Jf6oZbRJ9yH7VjR0jravy9VeksCZLFN242KFzGXn+EMPN6FiJlVfxvVxlOQKZs+qEm7ZppTpu+XHAgfdFzlqpK75WmYy9jaJppSi8IFOBe5fLtbzDv311YVIduOCydbGYT6il0lUUyOln9IxyIZJp5Bn+r8AEvTvWyuCvo9I24QNC8x8nj4HMnaamt03RBnYUN8UDNchVkL+lVS7gla/OpruIZjlQpClx+HxIXb+Jgefe8/ODNXHCFpCaJuQzq5ZRjQLFno0Y1tmZKjdCtq5CYoTwJaYfXQpHnGhZlPYI2xdd4CQha4djb24fE4QQArjftu/4HYmQDSTrPsBO/YDHgbfgsgdRn3StPHUpCzi/zlMAimuZsvQDyWT1OzqbCUCNvVmRGqlyUKcR8s2CTWtPTDnpBItVSz3Zd8BMnD4YSgH28LV5klsegl7UV0ucEt81Ovok1XTte2EaJhXZgZZKHus+cbm93w+x03begRJ1d6OIuRpVlmaiAh0WGD+Xf5s57ivklsKkuIPI16Y4puPkOsbdmO8g38AkuM+QlBTvK94pbrUJmZfDp6tQBnrvMixWuyYtaXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(6916009)(4326008)(54906003)(5660300002)(66946007)(316002)(66556008)(8676002)(8936002)(7416002)(66476007)(2906002)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6512007)(52116002)(26005)(41300700001)(6486002)(4744005)(2616005)(478600001)(186003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PaHqKcN14zViK0BXgQZGXTyPnIAPLR8FEZRV7mcqpW+f/P8BqQQ1cKlGcDMa?=
 =?us-ascii?Q?80McDUT/j7+0EDxCka82cYa6iixQwSxYPII7uKGSlQ+HT5fKx7CRugCgW4yF?=
 =?us-ascii?Q?fursfpew1sS7pCqqmlKRMTAAoxWUedgNn9RZcJNXLIWaRXKVMVbb1T3Il4Kk?=
 =?us-ascii?Q?IQ3Pq1snixEwJRP4kqsI87K6K5aMWpwGyzpB6Nd5BBjNzSPkkkP/JTy5V8V4?=
 =?us-ascii?Q?J1MwbAJi2oVmI3SpjMbmM+0dQ1aJikjy2pLilMP1L+/scKqrRDLZz7ykiWDs?=
 =?us-ascii?Q?5KBMic0LFb8ZRhun9NhXRIRoxPhUJ+L0r/5p/Grx9/6kuveEII+PNagV7p5b?=
 =?us-ascii?Q?mHgjhAdfeExyepIIvoNxV7L6/YP/Dnn/L5TtBrVD5T8XFxqPClKO8GY/SiG5?=
 =?us-ascii?Q?un2yJPEMfdgppMcdWEeuaLkOqrHcTry9ucCUfg+gRgivpIcBsxMIPXxqks17?=
 =?us-ascii?Q?2d7HNXW9X/+Kfd2vleMWyUmN7JCV2QZ4sCopcbsR7vbLOY5vRoWDns/jZh6A?=
 =?us-ascii?Q?C7gQlL0vGZRwxc5NjIeeuSR3+UrQR/Py2dYHwzl/G6S+X/yTIW7517lTsvZu?=
 =?us-ascii?Q?2mqWUakfwawb7qn2mI46R5BxqMliCOXFWXW1jj75i6t350pTFjDI4NoARbq4?=
 =?us-ascii?Q?IUswBxgu2bIvvre5tqLurlnoXjUfPMFpA2UGS6El2xKZruoPYn7z2Jurtk52?=
 =?us-ascii?Q?rIsftw1tVoE9G9+j1st9UkeY88iRwrlDs573K+NCYuLdgEMwPfSzTlqzvKoy?=
 =?us-ascii?Q?ruKbjFZQwaPIFVlZh+tWld6XXYxl4vdKdVqIfSurWWypeP4gBX8hjx/J8t6C?=
 =?us-ascii?Q?eaeZVKtCfLbtWhraJhuqS2BnqfmPHJD9o9YI+F1L0msqWY98iMbjhD/yjYPq?=
 =?us-ascii?Q?uvkmvx5BUaK9keIL20O3kVkkGCG+DFKzYJTYfA1LiwPyu35m+eGsyYBW3G/4?=
 =?us-ascii?Q?oW/IuWahsy3RPZ/yoVKZCjVfe2+7DK8w42+tDrku6bZUSSW3+9/dBchePPyP?=
 =?us-ascii?Q?T3m3LXDQUeFgUjeZ8hfiJAer0+LDEHh8xcQhJjiHX9Tb4nOc4EGu/LHxmXCL?=
 =?us-ascii?Q?ouwncOeXvTDcFrhz5vJv5ndP37spnN5mSYLga8uqxYbRU1EHjM5BRCWrkpm2?=
 =?us-ascii?Q?HS4TKewoexPkqIU83tVfav0CNE4nogrjbA1rGMtxIKID4VY4VpsD/8duLFr4?=
 =?us-ascii?Q?fXY5dabKgM1ylDmR0nmW2ymRsmUOW2L8zqHwh5aCtV+a4TxTNaOCXKmfBGm9?=
 =?us-ascii?Q?rAZdwBzwBS8/+ZUBI9eYzbcHhiIcx5uadXHM9w64F7fo+pkNFBGJKeEOaDso?=
 =?us-ascii?Q?pwtjr+dcMa75NZ+acTQhEPv6Xp4PzEfC5OeEor+Lcx/ZDLqYaIkzghcgCK42?=
 =?us-ascii?Q?Il/vkNVzsLtqeZOGb8JIy6LM7WwVMWg+faZrlBJYF5VVEanp2UpI8dm50tWa?=
 =?us-ascii?Q?fe8rEQN9TovievKuBaQveN48DtwvrIFWHtN+XoeAcjdTBAVMo7HioZAg8plO?=
 =?us-ascii?Q?0nW7Evfgg4ClfDDRiEBOqLVe5cpf09fAXnPZv9FOQjZMbXPXYCTXEG/0bb63?=
 =?us-ascii?Q?9V53LqCJ0CVIdpnRQ6OMe92cWJUTrKNIih1XXnUNYy2hizTzNYKWtvFz3yX+?=
 =?us-ascii?Q?iWO9VZumlX6ndEsfEL91esA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9a74b5-902b-43a9-00d0-08da6913b98d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 23:17:46.6073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ua4rQo15dihcPbfpq89FJXUiJjPUsZUfV0neTpjk09XkunH5ZSZwiO/JTYEfAkFOVFV1R/5q5S6b63bGdt7wiAKkGBvNqAhmGkz4nMzF+S258gdKuSX+k9N/QTtHh7RQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3788
Cc: alsa-devel@alsa-project.org, erosca@de.adit-jv.com, lgirdwood@gmail.com,
 jiada_wang@mentor.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 Dean_Jenkins@mentor.com, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi

> From: Wang Jiada <jiada_wang@mentor.com>
> 
> commit 83b220cf8eb2a ("ASoC: rsnd: implement BUSIF related
> code in ssiu.c") moved BUSIF related code in ssiu.c
> which added .quit callback in ssiu.c to disable error irq
> when ssiu quits.
> 
> But .quit callback was added only for gen1 and is missing
> for gen2, this causes error irq is left enabled after ssiu
> quits on gen2.
> 
> This commit adds missing .quit callback for gen2
> 
> Signed-off-by: Wang Jiada <jiada_wang@mentor.com>
> Cc: Dean Jenkins <Dean_Jenkins@mentor.com>
> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
