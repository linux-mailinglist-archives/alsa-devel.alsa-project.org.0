Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F275A2DD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 01:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DCC1F3;
	Thu, 20 Jul 2023 01:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DCC1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689809861;
	bh=HqFjV0rbULBjfVMkVjXdjWK/nZy3AFJ6x9qO2U/MBHY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iYeAWbOeyVM8y3E0B3sjjL8ojxQIZzwDL9iN7zFzz0ZZT2RPAHhyOUXokTTfry2PR
	 0UuIa/8JdYAggjCB9Q5FieyZrI4luZhzDmh1r8T4OBk6sY0S53oEZUI284qQqOG3Sc
	 XGFflgIXx4WXelIe1qBy00QCA2Rnrn/hzWl6p3Jk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC786F80551; Thu, 20 Jul 2023 01:36:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B9E4F8032D;
	Thu, 20 Jul 2023 01:36:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D60B6F8047D; Thu, 20 Jul 2023 01:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21810F80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 01:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21810F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HGxbAa2P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPxPiEQm+q4d/VAcHFsdpOLcDD/qAbYVihn0yl8rXyH20VLNT4AIooBA8LD994BaPAllO8bkLOJDpShAXwM/I88RX82Be+VG5fgN0bkNx8bMKaTfVDoHUKFvqnRRBFIyghkVTut407+oCsF2Gu7+s1fu55N31js3Wwzvthc/MoU4FVRvoEeis5wfo94/zA/u3hSFqfsdhYechYV4VIl8d9O/naoONOY334f3VbfcQrmJ2j3XapMfNjQNkgjpMzkYkMdG0QXXxx5JH26rdUOyzdPGEI6bQRcd4MTq3UoqCy6jJwKI25sBgY5JgK8jBv1Dqv03w4CYEXb9eXu8kzN1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPDcPKHp7e8Ywreunz3cvWHqccHwWaLCaZwcueGMpyQ=;
 b=mwKOuw8icIlSVQlEe78Zn0a7VqoKqw9UPQA0brJbiKi+08Bz8y8ZTDps+qWizvIUL1mZMRFSkLp0Y/15LrT2+HALzEkd53WG9VWvF4cPeJ1Vn/7jWe6ICckhzDM7k7+QFwTd3zzTk0eCLrnU296KGrRgoG1iQrQKe6RnNiRHzBe33AlPPRD0ThEjr96BCD7SL7qeyvYoW4j70ZZ3gpvruPTjCxZTwtl+WaM016mwEJofd3QQF4dsMy6zvLIgcK8aDRANMvDrMax/YR/7rC0V6Mqa0h783AkaCEUfxdINyMQr6+sCZM+ALpZEq/o8dpiTmnxHA/BYyckByZ3hHzOqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPDcPKHp7e8Ywreunz3cvWHqccHwWaLCaZwcueGMpyQ=;
 b=HGxbAa2PuY0tWhfKZD3YEsNLK9cSW3/Y38cZNNSVQNAkcZtHsQnKlAV1IVgFglBHltp7cGfGrg11xkmpQWMXFClb+RVGfCuRf4vQZLJuR1wHwY7Syw2qZykBDSG2EOyFAqi9cOfnUKnaDenLZLw/6ghM8MoKiFTLZiInszndnKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6221.jpnprd01.prod.outlook.com (2603:1096:400:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 23:36:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a3a7:e0b8:ca7:bdb4]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a3a7:e0b8:ca7:bdb4%5]) with mapi id 15.20.6609.025; Wed, 19 Jul 2023
 23:36:22 +0000
Message-ID: <87zg3rxymj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	=?ISO-8859-2?Q?=22Amadeusz_S=B3aw?=
 =?ISO-8859-2?Q?i=F1ski=22?= <amadeuszx.slawinski@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,	Linux-ALSA
 <alsa-devel@alsa-project.org>,	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 14/15] ASoC: dt-bindings: renesas,rsnd.yaml: add common
 port-def
In-Reply-To: <20230714144245.GA3492124-robh@kernel.org>
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
	<87351wo921.wl-kuninori.morimoto.gx@renesas.com>
	<20230710151956.GA1992791-robh@kernel.org>
	<87lefn8gh9.wl-kuninori.morimoto.gx@renesas.com>
	<20230714144245.GA3492124-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-2022-JP
Date: Wed, 19 Jul 2023 23:36:21 +0000
X-ClientProxiedBy: TYCP286CA0276.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c02029e-7c00-40d2-a988-08db88b0f599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yE5AYVsXJYQ68cM4WPssMpPaWdVIiJFCuDhZcPnIv9cVwNVTRT18ImHFXB9s9is+2bY+s25czWFfA1RLG1XUH2ocfgV6kpRYnINnIV2OriMqK0jBH+rl1Kf/XWTnsGzK7+wZfRNyFGVvnwroVh37W172YDYP+eCGqZmtXerSCuOvkg5ZWM2+fMzXsT8A+vlDShByeQ6S9/8SULVUqM7xHVEIc1rV7oxHdZI3XEF7C+0p1QmbKEUi+xpJvtpZ56RKMG8j2S4KRKu6pXrjR9mGSAxRujxM5AhPT9vGQIWaVrMNRx9vSHRdChvQMJ+oGd3uNahbegOxnvqzLFIoELkJfC+IKDXv3ByOZhB//MF/4ThDlk3FOVhwBjzF1QC6x3zlEbgJRKbxSvFNmOdw/782H4+gO3tOUz543E+FZYT7b4jT0QF/UuHt3s5w/nYq/D1BE+aqVHyQfF46SsjesBEALduhW7BNq7EguizQyNsvX5DC5emC8BXH8Rdf3IcOOnx5bixIRG7lA0ZXL+Wou5whVnMsAYwMkaE7NHE6Rqs2Xj6fJkFPqAhzpa5c9+SmELKRnpCkd1D/RWxZn5AGJVVtGa3LaANNht10mGpsCSsE1YnDfeCnrBGt4QZ2svPmrtJR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(451199021)(2616005)(6506007)(26005)(52116002)(6486002)(110136005)(54906003)(478600001)(83380400001)(4326008)(6512007)(186003)(66476007)(66946007)(66556008)(38350700002)(38100700002)(5660300002)(66899021)(41300700001)(2906002)(8676002)(8936002)(316002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-2022-jp?B?RnBLQmR2MVlCK3pTWk5lQzZ2cXozMU1Xb2o2b2FpZlAxa2szY0V2N1M0?=
 =?iso-2022-jp?B?Rjhrejh3RXIvN01oRFRhUlRwNUltd1pqSGZHZG9DR0lQY1hRZ040WFFp?=
 =?iso-2022-jp?B?Uld3WmdiRWlJVW9RY3V2NDd2b3RmVUp2eUcxZE51ZnRBVmFwUkRmeUFn?=
 =?iso-2022-jp?B?Z3hMcTRVVGtxNGk0aVhvRWYxN1I4eXlFbDhoTVZNbzhMcFNTRnNqVldv?=
 =?iso-2022-jp?B?VDd6NGovcXNGaE00ZWtyK0NVZjJDVzNtUHpUVXlvd2N1SFhTMzNSQy9E?=
 =?iso-2022-jp?B?KzlydjZrZjYwNy8wRzc4M2ZmbkdTcnlrK1BmRjN4NkJySU05UGgxUzhP?=
 =?iso-2022-jp?B?RDN5d0o5NlJHUWVkZUVIQXJIS2Uxd1NIQVdKTFNod1NRZXJ6OUR3Zngw?=
 =?iso-2022-jp?B?UVU1UUdnTTBZWFY4MlV2RkFGOGg1ZlVIRk5QQWNZNHgxTUg4ZXg0bHk0?=
 =?iso-2022-jp?B?UjQxc2UvVDFTcmNGNWE4MFlUdUY0bGZ0YVdJekJDc3Z4LzlpOGNPd3Nq?=
 =?iso-2022-jp?B?emJESTFvcmVtWU5pZWJXNlRva2FGWDV1ZzlJb3g5d1Z1cUNJTGpJYWJS?=
 =?iso-2022-jp?B?bVc5R0lhWG9BaU43SndWcnBLdzJUTUIyaHBaK3crWm1YUmhxRTN5ZHVV?=
 =?iso-2022-jp?B?ZG5RcWhHTldLTnhQbTZLNmJoSjlOU1VwNDVlV1pGYSt6dlVZVnpITEM5?=
 =?iso-2022-jp?B?MWYzQU9qcHlxZ0EwbzNQUHFOZ0FiSkhLOFdZZkV4K1Z4aXNGbTloZVNQ?=
 =?iso-2022-jp?B?YVllYXNCMVFOOUM0MHRVeWxBeTNETHZKYThwNXlQWHlJbDA0T3BYV2ZX?=
 =?iso-2022-jp?B?b1A3U2p0TTVoMEpjbzU0MHY0bU54TFhpZlRDSklBdmpGK3pMQzFzVnNK?=
 =?iso-2022-jp?B?d1dJRDgvU3lVWndpbFg5cG1EdTZDTVZjTUJ6Qy80VnpjRFQrenlJQ1Bn?=
 =?iso-2022-jp?B?cVJ0ZGVXeUhBMlhmaWFJNnRCOG96a1ZpMm5RamtxQ1lWMFlPVjdVRnpX?=
 =?iso-2022-jp?B?WlEzczlyTURCNEc3K21wWTR1bmducmZFQUo0Nmt1Yjh1MEtKWDNHSzNZ?=
 =?iso-2022-jp?B?UTRQSEdVekQrMVhYeStFU0xqWFBkMzl6ZUVpcmdLTGdhRkRjSnRid3lS?=
 =?iso-2022-jp?B?MlZXbnppV2U5MDVwb055UlYzUFBxTzBXMlNPN2w3K1RlSGp3YVM5cTdj?=
 =?iso-2022-jp?B?Q1NEVkVlUDVkUXVrb1hiT1N2bW5TUlNVa01xN2lFZjRxNm5Kc2xDNnNy?=
 =?iso-2022-jp?B?Mlp0S3hpWUsyY0NKM25iT2g1elpFZTJ5WFVqQ3c3eGx5QlV0eFZ1REln?=
 =?iso-2022-jp?B?ZXZ0eUpWUVNMQVNuMXY3V1J6V1pLbWQzd3Jiby9KVk9WRU9yK1lkSkR0?=
 =?iso-2022-jp?B?NU50S0NTRkpuM0huRFFpV2dDdDVGSUZxaUp6aXc3dEhselBEd21TYVpi?=
 =?iso-2022-jp?B?YmxFOVBlNU55dU42TzNVdkwvUEFObW5RWWpQN1orRUNyUXdhZnBDOEVa?=
 =?iso-2022-jp?B?Q1QxZHYyK2dZcW9ST2hrMithRlc2dTdkeGd4RTA2c1FyNjlvSEdsSldI?=
 =?iso-2022-jp?B?WW1FWVhhNjVJZGVyTExvUlFQZkpnT1lOczdORHZzaWQ2MmVZYUUxMFFE?=
 =?iso-2022-jp?B?OVErQTJDRDZ5bWFOU0p2QkxUaHpqUnprZVExS2FIemJFRDFmTWNoTWM0?=
 =?iso-2022-jp?B?enhRSkpBTDZDN05OYUU4ZDFMdFhac3UvejBlN0NXajJHYzB4ZFdGYVhM?=
 =?iso-2022-jp?B?cmdiWUN0Y1pCb0JzSWVwUW1BUUNSOEVNZWhnWVg2a28zcVhsZ2kxRGt5?=
 =?iso-2022-jp?B?TXljRGxwWjlQSlJZU20ya2NWRGJIbllPQjNmaG9DTkF3OUR1aWo5N085?=
 =?iso-2022-jp?B?TENLbDFpcE1ndWl6VHFmRGNhVnBvYm9jcDIzMjg4NlExY3h2SzRWaG4y?=
 =?iso-2022-jp?B?dC9GV1pyaFhFQ2tJYmdsUkl1eDB4aTg5b0xlVkpyL1RXTUNteTQ4REF1?=
 =?iso-2022-jp?B?MFF5WnJ3RTErTFpYQ2RuazFSQW1IM0hGUUVGYXQrTWw0VmdyZWZGTHdD?=
 =?iso-2022-jp?B?Y1BhMVNPV3JiU1d3TFNVTXl6VStKSzhxeGxWVkRIRFFSMFlleWd1bFhs?=
 =?iso-2022-jp?B?dFVMV3I4WUN3alVGWnlnUUpNOWRpVHFENmgrZnVSS29xY0V4c0psVDNm?=
 =?iso-2022-jp?B?QVBnc3VUaFExL3JGOTFNZ1ZTQVZPZGN2cW5ZRzh0NUVDamVsbWxzS3A5?=
 =?iso-2022-jp?B?ZVNGRGcxc1VhNDRiVzByTnZ4ZUZsTnd1M24ySjR4dXBaT0JzS21TRy9M?=
 =?iso-2022-jp?B?TkJWMG1oYUJ2Vm43K1JtSElGZzdBOXFLSG5Jb0hoMFZ3TnVianQwbWhj?=
 =?iso-2022-jp?B?bWFLUGM9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c02029e-7c00-40d2-a988-08db88b0f599
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 23:36:22.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sMQn65jt/qhz0MllKWSh8UkU08r69osiVq8H6ig8Ccj3LifNw7Jh55mjDidPpslryfdU0FDXpc+1xs0aDum/dEy7R+zCX0RcZN9nMCLCQb1+kv2w+8gfWDepX3tMpeho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6221
Message-ID-Hash: FQCGVI2NX5HWCWOS7S7Z3GPQ3GXOAHDZ
X-Message-ID-Hash: FQCGVI2NX5HWCWOS7S7Z3GPQ3GXOAHDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQCGVI2NX5HWCWOS7S7Z3GPQ3GXOAHDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Rob, Mark

> > > > diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > > index 8a821dec9526..d9808b130e8d 100644
> > > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > > @@ -9,6 +9,20 @@ title: Renesas R-Car Sound Driver
> > > >  maintainers:
> > > >    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > >  
> > > > +definitions:
> > > 
> > > $defs
> > 
> > Hmm... many drivers are using "definitions" ?
> 
> Patches welcome to change them. I don't think it's many (not counting 
> types.yaml). Use of "definitions" or "$defs" is an exception.

I will get error if I used "$defs" instead of "definitions", like below.
There is no error in "definitions" case.

Mark
Thus, I have no update for remainings (= [11/15] - [15/15]).


	> pip3 list | grep jsonschema
	jsonschema                     4.17.0
	> pip3 list | grep dtschema
	dtschema                       2023.6.1

	> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
	  LINT    Documentation/devicetree/bindings
	  CHKDT   Documentation/devicetree/bindings/processed-schema.json
	/opt/disk_cd/morimoto/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:
	Unresolvable JSON pointer: 'definitions/port-def'
	  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
	Traceback (most recent call last):
	  File "/usr/local/bin/dt-mk-schema", line 38, in <module>
	    schemas = dtschema.DTValidator(args.schemas).schemas
	  File "/usr/local/lib/python3.8/dist-packages/dtschema/validator.py", line 355, in __init__
	    self.make_property_type_cache()
	  File "/usr/local/lib/python3.8/dist-packages/dtschema/validator.py", line 406, in make_property_type_cache
	    self.props, self.pat_props = get_prop_types(self.schemas)
	  File "/usr/local/lib/python3.8/dist-packages/dtschema/validator.py", line 173, in get_prop_types
	    props = extract_types(schemas)
	  File "/usr/local/lib/python3.8/dist-packages/dtschema/validator.py", line 165, in extract_types
	    _extract_subschema_types(props, sch, sch)
	  File "/usr/local/lib/python3.8/dist-packages/dtschema/validator.py", line 159, in _extract_subschema_types
	    _extract_prop_type(props, schema, p, v, k == 'patternProperties')
	  File "/usr/local/lib/python3.8/dist-packages/dtschema/validator.py", line 52, in _extract_prop_type
	    tmp_subschema = tmp_subschema[p]
	KeyError: 'definitions'
	make[2]: *** [/opt/disk_cd/morimoto/linux/Documentation/devicetree/bindings/Makefile:68: Documentation/devicetree/bindings/processed-schema.json] エ
	ラー 1
	make[2]: *** ファイル 'Documentation/devicetree/bindings/processed-schema.json'　を削除します
	make[1]: *** [/opt/disk_cd/morimoto/linux/Makefile:1500: dt_binding_check] エラー 2
	make: *** [/opt/disk_cd/morimoto/linux/Makefile:234: __sub-make] エラー 2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
