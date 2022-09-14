Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7E5B7DBF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 02:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8563217E0;
	Wed, 14 Sep 2022 02:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8563217E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663113965;
	bh=exxpg8Mkb34kOckEUVQTUb/uiqtgFpql8SRusJinIS4=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DuyUPpEe8piPXxLwuYAp+e+AuKxpAouxQwbOeRfEB9oTqGpRcOQcZIrMzOcJDEmr1
	 23Y0k4R8cKEEHRAiBi5lXu+ffc1ja/+ASQJSFFz9RI6hLvMupr4LiBgPN+3HkFWAD+
	 ASAINaccLIp7F23PklJ478XDSyfSTWdYcqVjCg5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E86FAF8025D;
	Wed, 14 Sep 2022 02:05:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A56E8F80224; Wed, 14 Sep 2022 02:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC47EF8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 02:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC47EF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Rtg80Xfg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckvPcHpyV6RQEQUwZDB1taOG5vlktVOb0tSIJoaCe4Mpg8dht6GAILUMA18+CQnPUqsIo3tp+xPh/1hKikLK5tSudshzUVNrw7iTlXK1JYqBGGBxnu7Upq/gVTNQ0jwIosriKuw/1KKcXOpV1U6lnf2OUwmIBBgWNf7pFy3N7FXE0ypwSdIynA19C0+NF/Chq/jBHFOfBVt0YEFcLLkp+P6EbD+DEshErm2xXRm0SXX7uDNfMyRqquQyhzIsKYunADNa3SrmDHKQPBo2h63BSbEIRiMLRJHd9nIH5d7xETrC+oBbHLpVW5gTqz0PwFdrqm3TiBuOjSi4ux1zbSJVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nemVscWD46iEGZw7yiw9WwGHTOEW5aAojhEcwAqQvI=;
 b=SSsR2Gd/ZqzBbHZtut4Kc80ZBjcawvOiQnq5Yc0W12JfT8+wKQkW7IVDu92NwMHYq1lQfhZecXvb8W590PKdt1W4BhwsDQbAmcT1dDugBOHCbSvlPuOGO34AmbaZYZhrWrlwh7PO9T5VFVYyfXemrfmkIOSLDghws1MvjmlIi8YisDi9VYXW+a3jU5/bOti5XtiBwQ7TcIWbZjAerGx4s4sebPOc1uvkuLjT+8FNLoUGDi5KMs3VWJ0XivIT28sCzI7K2OkjJiV0U/oZZIzoi3mV7C3QEAsAusnbDRmFa3gnIiUcNRSDB3JCfMdzZjpnox05xHhp4QhPLRkgFUULtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nemVscWD46iEGZw7yiw9WwGHTOEW5aAojhEcwAqQvI=;
 b=Rtg80XfgcwwSO5TQFs0rSo3j8AGwDoHg1m6dOUW5fj0YT/UxhHuhGeivqBeFZwPnyfZxDE+YTdJWHYsWwGLGiy6Zyfi0QfrXRdsCukTf8qct79PW/b1iCbYihmxP1fKUtWBzzQuAcyoFAYJ469uDcpp+agxPWwfQN/BwH6t1jbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9926.jpnprd01.prod.outlook.com (2603:1096:400:209::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Wed, 14 Sep
 2022 00:04:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 00:04:48 +0000
Message-ID: <87leqmakin.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(),
 and remove .remove function
In-Reply-To: <1jpmfz3cwc.fsf@starbuckisacylon.baylibre.com>
References: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
 <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
 <YxtpyvC/f6of8scT@sirena.org.uk>
 <87v8ps5gji.wl-kuninori.morimoto.gx@renesas.com>
 <87mtb4596e.wl-kuninori.morimoto.gx@renesas.com>
 <1jpmfz3cwc.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Sep 2022 00:04:48 +0000
X-ClientProxiedBy: TY2PR06CA0047.apcprd06.prod.outlook.com
 (2603:1096:404:2e::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9926:EE_
X-MS-Office365-Filtering-Correlation-Id: 9199ccdf-3e7d-442c-de8b-08da95e4bd38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJtmguyA49Bzh28uuIk/UMnWmHpevTDlvqlIsH9TlwvTiCx/1ESyYNyvi3LzyRkjH2TrpFSbn+PCByh83x2goeDpg6388Pjq8PlOqUxyg45hofjHozI/ZvzunWDDwgcP8k/GBYaOEyh/H7vC0/U/kHAKd0bzvWHYxOzXzOyZ8BsPwCtsZPsH0ZbdG/zNJITvccheSw+DOu57b8ceHH5hxLKR6mbWIkqGY9pwdLUyoLPIdqdNsKJCFVnejPrHE4Bk+xfl38uvKKXxOM7FCnM0pgHJjMosS/gdNySUFEmkxToglhpQRLDF/ONIGzFH2jA7fb2a/WX8mwaWZN/efETBxoUAZlyJ5jMS/O8B24w4vhQWlNv7YxiSARjmN11R97BGyLXohzJsBN8q+iliB6e+H3qJDmgkV/x5Va5gDYIjM3aLaFZvam7t2YJO9eE4gKlYhIaTFSuqVFnxmNWzaUan3MNk6nv5qqLRmEict/IzekBbArPuQp3iVT12hCbd8F3nuhOs48sR4OM7XV2BilZSXj6FphC0JTQwBvqJgEIqYrtFs/M8nUuDpJ9iDKnH/7FV+annBzXSmi4tBmoWI848VfYfxfqvve6O/ZmLJCSl7U7wHLYEIBXFn0kmUYaXGCnEU2bGnEgbz7pEtwGy5hh7k5bb35tmLm0s2mjtHJvWkHPx2HeLm3iDlu6Xa8JIeFQmPr4qZJwNxMhz0DvGwuV4jloMG9s8n+9f+hXXM5G0wjiAHMlKmt6RWOXRtKXW0mNUlnLEUH8xqflC7GBUCxxEqah5pmDHQv2/qt6U56+ZGjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(38350700002)(186003)(83380400001)(66556008)(66946007)(54906003)(4744005)(8676002)(6506007)(2616005)(478600001)(38100700002)(36756003)(52116002)(6486002)(86362001)(6512007)(66476007)(26005)(6916009)(5660300002)(4326008)(41300700001)(8936002)(316002)(2906002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HPLDRsjQuU7qye4BGfd2dGtUqXsj+HQmpkD+FTlum9aidGCCodAfdSTysBsn?=
 =?us-ascii?Q?LxsYU7pzbo2zLRld8LGo9anxPMpSNBo8UxKuYCt1etD/3n88DD8FGfJA3gPT?=
 =?us-ascii?Q?uNl/alxR+Z0l+3EsqUzvnEoieYPqOy+SDtP4PKWbkjT0fuROmDNcBxhHVUK/?=
 =?us-ascii?Q?T9J9TnClISFm1AjrUDgVsRfeAWU2cj9jz01oF0VqlkOz78f72KN1Ib2a1wR0?=
 =?us-ascii?Q?gpjYCXo9tgp3i2e1Aq0Sn2jNuQdk06zO8w5Sdqft2GasCHsdtLZNgLm7OWC/?=
 =?us-ascii?Q?Fqdnkn/vnuHLe3SfnDs0la5YRZPv1uFwx78VdE99vZDM/V6XrrEOvOyLCE2n?=
 =?us-ascii?Q?erUrmJkm9IsXTjbjal6IrIV2dESdLVfUpbk8+jzlFvlPutv5aKAlP8O1qgTr?=
 =?us-ascii?Q?iu8xQc0oqhza3WhPCoup86gHyBh7gGABILIZjgz5+xBDKIM14nn6gPjsOrSa?=
 =?us-ascii?Q?MsTnqbVNx5hQXKJJ+kX8NtWI/OfrcvGiNVEDgEAY8gYXqEl1rfJvtjEz448o?=
 =?us-ascii?Q?I0MPpxG9BkwcMZ3yRfGMnnDEDrsQE8YSU9nc5FuE3NlgktziWKgFzBl19VGP?=
 =?us-ascii?Q?SRBDSBYZcP9MYfbaJzPKn1Uc9S9+mhYTvff4dDDMptbX8lRv57i+wulkrbnp?=
 =?us-ascii?Q?QsYJf3Hs9rRJ0k1EVaSvDeMJgUCucEGrSOf/UlVt/cfhIlbu7ekUKasH2kp+?=
 =?us-ascii?Q?99UoNIkSSanUyb/9xAsq5BsAWMClRp87+PhLpniFGe5YQx5Tns8LKv5le1eD?=
 =?us-ascii?Q?9BjPLcO05V9jSaoO6JvYteQ1IK+hDBkdNR5F6EXZhOL3jnpy5XCDV6i3li1D?=
 =?us-ascii?Q?XSPIrWwfwuomYWOLVjDjUZUAwiVi/kuAxL2wI9kNim568uH15E2Ob9ggZfZk?=
 =?us-ascii?Q?ZlbznOIVnwE/c9Un5yNDVvvAIyjoIYQXMTmeAAvHJzvXtzniOQ5LcnSCFLj/?=
 =?us-ascii?Q?U4jMOWgeByfMQqHb+N4ogTd36TQlTr4QN3fyhncmwhOP3e6XCLPl/dwc9KX0?=
 =?us-ascii?Q?IHRq2sBB1ZLHRIbXEKVbUunmmMr4bWubvl8mJRVBATx/xuoUOU8I1i7b46vl?=
 =?us-ascii?Q?oXFLwvL/7LBQrpqDxzBk7rvADG4DlJlgvYeYhnF4oLcjdct78fJBRekzVRHV?=
 =?us-ascii?Q?GaxJvRe7WcaaILbDMA9rzn9YeZw+kPvYQ/pPSBQnRId/brnp1BnU4pPhI0xu?=
 =?us-ascii?Q?4juG39qU3NVOp8TnjOZAy59U8LlTjVb1cUc9QxbwQVURzfMJUIAK3XkHaTeN?=
 =?us-ascii?Q?Tj0jAbiOVdjVWCbqLkvFdk1LgQhX6WWTAtdLrq1iXZaHNhhIB5R2ngXjeCFN?=
 =?us-ascii?Q?Q3cNba7KARzoz/UNBi+MWmMT/ylNxphiMUl5LA58C0J6RBLJ6ubrbUQhKFDS?=
 =?us-ascii?Q?BX+G52yE31/P7x035y1H03q0QFlrYHPgVt2DFA9tsZTz/d3eq0Shy8Ni6Gag?=
 =?us-ascii?Q?Jh54UMtvBLfxJdgJCIhS4LNOcSFjzcVxPNxmjp3Ab3KnxQI4pwoonu44C45M?=
 =?us-ascii?Q?XeRnlVfE9dG1ZSAcOLdSCNHtJETyFre91QjhJP+ipL9NrrnuTs50ClPG/7x6?=
 =?us-ascii?Q?Vf8CnS2J9BvZz3v3u/2Uv1adOqNonLMNiSFXjWSyGRrVAyz8DesYArt/+G9r?=
 =?us-ascii?Q?MT24n9O7wxQ2fwkneaabKKA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9199ccdf-3e7d-442c-de8b-08da95e4bd38
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 00:04:48.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts2gP7R41TKCosaHqhshQEiMNeLeWp5fKGCC2xB0bbvueASe6i2M6w02NQmg14zKeOcsZac4SfGvpxRlWdOwny2J84C3zgi8PK8wSKrxzvJqLi6yb+LdrOULBPZXWolE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9926
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>
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


Hi Jerome

> The AIU is a device that provides multiple ASoC components. I know it is
> border line to have this and I'm sorry I was not able to contribute on
> this lately.
> 
> The device is a bit complex as it is. The allocation in question really
> belongs to DAI. Moving it to the device level might be possible but it
> would not help make the code easy to follow and maintain.
> 
> I usually pick devm_ function whenever possible but here I chose the old
> school way on purpose, to make sure the memory is managed correctly.
(snip)
> It would still allocate the memory multiple times if the card driver
> gets unloaded and reloaded, manually for example.
> 
> It would be strange to do so, but it remains incorrect from the driver
> to allocate the memory like this.

OK, let's skip this patch.
It is not a big deal

Thank you for your help !!

Best regards
---
Kuninori Morimoto
