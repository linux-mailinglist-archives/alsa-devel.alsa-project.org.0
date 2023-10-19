Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B37CEDD8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 04:04:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D4591;
	Thu, 19 Oct 2023 04:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D4591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697681065;
	bh=uFpP8RUvEpDjj2tHxXulzBFkyi+3qEWm/PrTwdHzBOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nt04L4NxluJtxCXYAhBJ86aj5+gYalcZXlu+GEZwV8jrzK98CRjaCgOiMJQ7r665E
	 y02kRQ4qApuIrTH0/3qmZctI70UdKFKuKsiQBPn/g/Q2WoALbYysD5sr9phTyB5kUO
	 hFSuNtBMi9AOt8gO4K72eRjGCVhWSkAqR4dTjS00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B83D4F80558; Thu, 19 Oct 2023 04:03:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5946BF8024E;
	Thu, 19 Oct 2023 04:03:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20F71F8025F; Thu, 19 Oct 2023 04:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F7FCF80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 04:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7FCF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nStmXNOr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKS2wANYSox2FO4kNCSzxXby2yP2ZK2OtXmOTmJt6ce575hJFQLOjSMgnM0GHNapjaF1IoLv0Fn2A80XbQ9VFSUNHX6oj9+iClbuctylXztQW+RSC9v/6VXA0cluZjqLDDaZQWs7IvWBXwtewXpQGSR5vczVG2FGWeEkqAUokasxtFk2DJMpglKOEriehkCNEvNM295+kSMlCdEAYB6Mh4ifuEz2ap6q1womp7RIFPQx0ccvJhIpJBh5m+Y7H0F+L6PHA8MXbk4BCrwIid3J8142osN7ec8LGXo0e9EUdVigrsbGUTFcMpIJxHGspLBp1hjLX605Av4BH1GoNfqtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgZbCkWtKnFWFDcutbVCfBDoA5nYsd3GvLBghBzheLI=;
 b=IYOxJbMH2Tl/c2L+dvlJ9neXNEQaOt/7dOyA+/MCzm7U44ii6n+Eph6cj+sc7NIueftIOc9MllTiEG3zrlaZMSQE63H17nA4d2YgKBXLH0N72Cs54As0ZKFJczx+IB6fTV8eo3yvUv6L4q4PyUwPBinWQrKf9O1aVx6AAVJBS6Nm2GfV64d0NORv0FUczhsksCwXYkGC2RTMDDZ0L0D6GE4gdiOpX4Rau0CDeVoAzdIunep3nkMerEpaRuAMHhEzub2braQNvJnyYl8USI8Ee0dw1OwaMlvKY8DwjYbr5uGXrHZkRoaIAXwd8zSerO3/aAXFzyS2PqziXnf/+Sx2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgZbCkWtKnFWFDcutbVCfBDoA5nYsd3GvLBghBzheLI=;
 b=nStmXNOrum/MaeMOyVtsnl5nG7V5gVV1CgKW86xVE5+U5DbQwJI4iVVVxsGonF22GGOzyBFz82j8pCHpIsPi9+ygi9HnglfPQX7RUvmazQnMKWgEpUGQ7tEowv8v7bIm6wjQCMDhGhulzsY0cWMYuwIRZVvDelu9fADpwB2Jyas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB8136.jpnprd01.prod.outlook.com (2603:1096:400:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 02:02:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 02:02:38 +0000
Message-ID: <87y1fzpdxe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
In-Reply-To: <8734y8kd1a.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
	<87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
	<d3c97c54-d149-4bed-9013-3f07bc6a7f52@linux.intel.com>
	<874jiokg1r.wl-kuninori.morimoto.gx@renesas.com>
	<5667241d-6976-4b44-8edd-79ee426415eb@linux.intel.com>
	<8734y8kd1a.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Oct 2023 02:02:38 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7e9549-f5b2-4ba1-9a4c-08dbd0477882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G+/+7znBwRVk1PMVwDz3N2zabGqf3JlmaLd3+Se83pNDBHCfim50CM2DM0Mdec4kBpVQsBvG2VpRn/EBMz760Q59ARfYJLyPtcsu0HX/gGiJijPb/BOCXNYrxNr/afW+gX6qILKy6wLDZHGyle7sWjOLZPY+boL0MxHDGENixPEB7s4vXwWbDd885nAkBkVvpcu5hcVch/P5PZr897hR4hu/s0QGB62VoJJZGnyMvbodDQosPo+awdPRZVrKfAQsCc9gX0nxjm6PBYrG6MAte8c9NUxywldJm0Ou3LZ5W0teIytzdy6wzQzQKFg1b8dl8kCZFURTordZrhtWnvBqwy8TGHAETDStI81vykFa1mvoU/BQ+DBrgWMDvCZ9DC9riReWV6Fnws/6llE3K5C+O4CBRMfqs+na8vQNMk7FPWX1jVvmVMgprHWcQQjIP5glEvMv+fp2c6QlqIG6AhBR/kgkyjEP79ihvw7072v+CurKTlON1WWVDLYL0EcOXjYoJCMP0m6kkAEWfZARA7pDIOM6cxC2HvP4o8iiRPKVHTBbbQ8hUGGPjWwvsJXOLNCOJsEgOPhQz1vEQN/X25WA/+vY1ImwaDLWAy0GLWNjkZMDji69ef9NXaK16wpI5R6q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(4326008)(8936002)(8676002)(52116002)(478600001)(6486002)(41300700001)(54906003)(5660300002)(6512007)(6506007)(2616005)(2906002)(4744005)(7416002)(26005)(66476007)(316002)(6916009)(66556008)(66946007)(38350700005)(38100700002)(86362001)(36756003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CkFxUQBTKCGSD1PXpVoWMlQ0wJMgX+HX984k4wSZrLTnx+KhH6Vq1F/CdaK4?=
 =?us-ascii?Q?nkMSPsJXBALH7yQ3DS6SDmNaBNtUSvLi+m8uIrDFf48v/X6o1oLpgrHvrLxc?=
 =?us-ascii?Q?syhug89Vq1ZVWvpjUv3tkpoeHmuwuQyjEdDJFGXGjWeOB/+9iQcTdxk4wc/a?=
 =?us-ascii?Q?YYS/01ZJU91Q0+y4wAq6fy8dLIFP2Ru/9eQnrsJmyCfXjcsYa3ddttWHp6cr?=
 =?us-ascii?Q?1Cc3c82lizIkXFn1frmVSioV2D8Ysd5UnDFMYGaE1aDMo/ufV+JwJi+n1Hxo?=
 =?us-ascii?Q?mh6iS+RGIuJlv8ETtPKZipzfQ78Y/UWIeaFcIAeYgFon29qg7LZg9Y7GhZ85?=
 =?us-ascii?Q?LwnrPAgx23VtoUO6X4cng3tGwDxtbB7Rc5nvcr6eX6AVaVdTkMHOfhU4s0Ml?=
 =?us-ascii?Q?cVpiNks2RGFUhL5x7d+jvqicT77hkg3bFZ8r8N1ZsrK+0UX37POVmUHADdkd?=
 =?us-ascii?Q?Us5jl7TnC4VmEsmjSnWoLY6/P2yhCogKYuzRGM2zhjxFm5a6gHHAjka1XV7D?=
 =?us-ascii?Q?TPZF+b11bUi0TQUgRQTEQ1lS5Gw57YNwqOuXUlDOIUmLXUGhRNtTKFKG9wkl?=
 =?us-ascii?Q?sQPVmby+8xrk6c9oWfPX0tJjucCKGts/f3YmaG+QGDFXCUP1Fa3J3Jc84mQM?=
 =?us-ascii?Q?tawupXkx9LcWU18qsFwjsHUtxSrZWFFr6GkO3e4bFL2vPhAkLI/eGJ+0Rfa+?=
 =?us-ascii?Q?N5X9q4NRGq4s8SqrKPY0kYejQb5yoPVxfWmMS7AROV3/Rhv7CFXbeGC1Bukz?=
 =?us-ascii?Q?F3FPmfeYQVnMT8thFU1QiWTdpWml9Z6eqINDq6IHO7Cm9D4F7TciRNdGFv2b?=
 =?us-ascii?Q?Y0GsmfQwtdUO+UHn9jpuinmUFo1VI7r8cIzW4GL+9QntTfNf82BTiPPGW8oi?=
 =?us-ascii?Q?U/H+1j8TNx8JRTLauXtLBJYb1aQs3R8mrApjUmz1N7ojBeiVRgOgRBf+h0Ro?=
 =?us-ascii?Q?igQs2Iv7/6sItiXqWpeGnSg91g3MzSZ3AjIf5JKDtoS2TceL0eorcU3EIYez?=
 =?us-ascii?Q?AtZECkX4OL0SqNQandTo6ZHZFtMfPL+G1k7tdemX0Vhm1md9FIXA8v+1Fohl?=
 =?us-ascii?Q?gi47OIfnDbc2U/a9SLrJlWwllUnvIsOmr7mGTE7dXBIGhX5SkdM3C1Jb4zY2?=
 =?us-ascii?Q?KNrzzsXa+BK0GSJTYpYL1SCzI7PLDo7rdHxvfbApylI3RoaP3DyBHMb6sE0B?=
 =?us-ascii?Q?+/1+uG7YJf16R3FGndOIXEjSak/4AsymP1rbnoMo4LWqQ2q/UGa+l+YB7/FV?=
 =?us-ascii?Q?6/0eNcVMYBdKhcLQxB2f8z3LSGsdmyxvijOzc37FrmBQkIqNLIVfduOokSM5?=
 =?us-ascii?Q?n6cYpvgGsZzUQB0HJ3eKJWE8J1/1WWef+RDtzQbvJhmYG3xD3l9p9D0j+CpV?=
 =?us-ascii?Q?y6u4Ko77Kwyb7WFEYPKkijAqPWlwGCxRH+dZTb7qyq3hHYU72/d9vZZx+fU5?=
 =?us-ascii?Q?G43GHApya6gwuUAVdQgCrHDEV/CCe29K5nW74fG99hX+y9SRF4XlJtA9Eo+w?=
 =?us-ascii?Q?yIjtBjvXe4KFJPkGfHq87A5ELcW9sYzZ1WW+TlqYRY3Hzl4Y9S4CuXH1xTT3?=
 =?us-ascii?Q?9DrsDvn4mm9UHdUt8CCyjDqUvzH0o4ueqWtAM8wIrhcqcmuNti8VTzSokl2n?=
 =?us-ascii?Q?yTsM9yHtsz64ONRmQ31C50w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce7e9549-f5b2-4ba1-9a4c-08dbd0477882
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 02:02:38.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uK2y1eg7OwRTxpU2KoRbZkSGWMvk+GADj9PWqtUBgwcjCe0O0W/JoEULSXG+IUn3HEz9XgFAfAFGwKWfjUM6Yb0oe0kQpGAumfoc0lTHtJ97BEuYNWebdRtvKlaJQgBG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8136
Message-ID-Hash: AXLQ6B6346ZVVTVZOSE7A6HBUS7CHN6K
X-Message-ID-Hash: AXLQ6B6346ZVVTVZOSE7A6HBUS7CHN6K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXLQ6B6346ZVVTVZOSE7A6HBUS7CHN6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, Bard

> > Yes all our solutions are based on the topology, and I don't really
> > understand the benefit of a ch_map for an FE? the codec_dai is a dummy
> > one...
> 
> This is my personal opinion, but the code can be simple
> if all case can be handled in the same way.
> 
> For example this case, we don't need to care about FE or if (!ch_maps)
> if all dai_link has ch_maps. Complex case/pattern can be bug entry, IMO.
> ASoC is already very complex system...
> 
> And because Codec is dummy, there is no effect for FE if all case
> handles same way.

I will post renew [1/4] patch after this patch (not yet v5).
Could you please test it ? If my understanding was correct, it should
work correctly on your topology.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
