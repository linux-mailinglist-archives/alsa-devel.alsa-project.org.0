Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D0382854A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 12:44:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17FD8E65;
	Tue,  9 Jan 2024 12:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17FD8E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704800663;
	bh=1/qEg55sDr4ZqlU6cjhSHHuGFi5//FFACB3vxtCRyBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmCN6Y5hEDQhZBu24Y2gNQZmbupXLWogSAIGTQxmcMq+vLrmB2vw9V9BZYgjqo/Rl
	 aeMi1Z3YNyi8TIXFzIDYfuyqhuXCMD5aYFyGoi9TsdrGMdg6Qli2Z8sZpv2KaNL7oY
	 6oCu/sD1zIOSFKyV7DIJBGwgduimL7JyJj4lsg3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2F63F8014B; Tue,  9 Jan 2024 12:43:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9216F80580;
	Tue,  9 Jan 2024 12:43:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CFB6F80254; Tue,  9 Jan 2024 12:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72F4CF8014B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 12:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F4CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=t5l+T7qp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFrn7XwoycCthVyCqkrspVzJXNX80AO+qJuuq9bUDbwyELMfM+ykpkRPZ1pCCxBYSpJnwENOnKP08Qv2xXoQNBWTfCex4bfAPSwFMl9bWtVzv+ILCtvhNmXNjcwHXCY66/ENTiI2KWboS4OtnOp270/ZMAwGujNwUIX3uYkHXs03dLl4aEpsGwLP0TaTpLGdAJsr7R6Ms9SZIkjyYTprHFbzg8IFB5ro600OJSxiCAbotlldHvt9boiuupcndKsbNWuj6/WGl5fp6mGkDEuNzAAOJsXRWnGt+5uuw3e/JPYznUbFm81A6ThlI+7JetOicOSccQIMs4lquorw4YbFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+S2iYufnKzf5fLLVvM9+bnrZjLkthR68uoownbZ5gp4=;
 b=bSw1iwb/Eh4+E7Eu5ePJRKducfPsLjeyyyNhwSau1XH5sAD8SLcZ/l0I9OTXdXa8vvdo0/9NdcLsZOXCdcLIvvg/YGKFZkB+9p63qgQtFHHpeKAj/Lniutwp1a7qRimGZ8o2xY7kM92/Y/SSrgrcwQV8DIzd9DFtlTBX2XLhRHhVN9GOQBttIYlhTts23GY3DDR+bY7yXA/rSyFrRiEh8CC83xkGvnB2msrhfl5vnrJtc7ducgPQZaX5WgIR8hC2zAbOHnw4SlDRWC3+YLk7SatT08G2LVrmUeaZHYSiyLkY02S5Iy1dicjU67V8hc7wTqfJ3gD4QaEdje94Xqje8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+S2iYufnKzf5fLLVvM9+bnrZjLkthR68uoownbZ5gp4=;
 b=t5l+T7qp39GKVH2uL9P/oKMt9ObrS2sJ1wgHrTqUFFv/4Sq2AYndGJ9ercO1CS+/j2Vl6iyOWu2HSbteKUbesIeOJcehHRZ16Dm4escNc7bU1oLQ4lz1IbBa/Sd/bttZhODdgyr7KMutMJD1a8TBPu3a6NL/w43mOuAZHhFvX3jIaGCdjW+cN5JyUchXssucwfwAtCXoFPkM3TKid2LP4ETvwhFwtafh4WgrM93RZC/8bo6BCvVtyzGCvRBjQgsnAc0HdEV3jrBdEX89sFTR/eX+YSwGSn4YlOUVZ2bUHi6kBP2PgBJruuqxBQ2ZZ20ZJx1MxD3n4Ev1nSEKbGFXog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by SJ1PR12MB6196.namprd12.prod.outlook.com (2603:10b6:a03:456::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.20; Tue, 9 Jan
 2024 11:43:33 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:43:33 +0000
Message-ID: <d550bf25-d841-4fbf-869d-b0719fee804e@nvidia.com>
Date: Tue, 9 Jan 2024 17:13:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
 <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
 <3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
 <ZZe5sTNz005Tt4jk@orome.fritz.box>
 <8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
 <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|SJ1PR12MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: fd09655d-16ce-472e-d447-08dc11083580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E9SmfPs962b5CMonKr9ISnJmnAX2DLFe0D/5cHGFMl+sMNmRy9DnKfnPTGSfo0Aqa795khhUr+O5//LcXKnNsFrOLiVh/NjttFZQiy56MtRky3qH4l5Esc40bedz4JxqCdm+dd9fjp/RHfUKsQZq2OcyPxGBOfbW18GfC/mgl3Fd9D+YWQwVvnTDL+m9qIq0lVR9hsXAkVzkw9RtYQq1100683BypE0bo++T2GaU3Z2YeOBSfbBo1qNRDoR3Q3qdXkHLLNEtx3gRTflysuK/R16Ctr3TEkM36egEWZj0Upz2fenwck1S/qIVWXuXb6yVOqmuIZf3WSoLYOx88nMLtGzt7SONZbSewJzjbmy5Z+0eww0xco4WX4dpstfT+dqUo8Lpa7feYkpFaLG3aVRMwsE05KazpDa4uEqg0oWg+Iwwa+OZH96XCm4vy2AS2A7yE/9tmWCxE2kA9ZXRoXXPFpt/5QHyQ2dmrnXq1A6bKfXkRZ8wDhcp5JbKl4n62Wtq6BOl7RPD3sfaGl0/nJdvzchW2CO2PvVCATIfefe1Qs6qZlSmD2AA9y+UdyyTr0wUF5jlDy18tnfdUX4MyZ30b65nwcNaV9RCvXdQ748Iw/6uPnxLEg3g68s36j4VJLxsNRo8jLA2etmy2C137omSj8dHVFs9m6Z8prmmGdEOv3hHYsq85P4sMAQi+dPhjVDy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(31686004)(54906003)(8936002)(8676002)(36756003)(2013699003)(31696002)(6666004)(6506007)(53546011)(33964004)(4326008)(66946007)(66556008)(2616005)(6512007)(6486002)(478600001)(26005)(66476007)(6916009)(38100700002)(2906002)(5660300002)(41300700001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S29oVDlzcnZaVnhjaVZKbnVJZ2NjWStIam1jUGR6WFRROW5ScWhITjQzSDA3?=
 =?utf-8?B?dE13d1p3V1Q1dDR3VFZrVy9sYXljRXErQUlPVmI0b2ZLRUVBeWJSNDFwajVI?=
 =?utf-8?B?NUpaU3N4QTY3aWh0S1VHWGhrN2NJS2ZyMFlFRHVtUWRFKzdkeXpYNTVDOE1x?=
 =?utf-8?B?L202SEIzb0xOa0dNZnduOXJLQmRIUFo1QUdqZDVPOENUeVFCK2Z5NU1iY2NY?=
 =?utf-8?B?dlZ3L0wvNnhRaEVFNXNFaDFoRjFJbUNoZVhXa0lyelh3enRpcHFlNTY4WEs2?=
 =?utf-8?B?ek8rU293emwyRUZtSk5jTnEyUFFDS2lYeXBFY1RlWWgyN1cxNHViL0xnMWZH?=
 =?utf-8?B?d3FJVlJSajNERG5NWUd2ajZLbHRqN3NOVWRnN1RESms0Yzd5Q3lPT2dzbENH?=
 =?utf-8?B?Y0FzZXFERXk1RlhjQVdSV2hEYVN4eFo1S1gzS0NpcG5VSWx5eFhnT0U0Wm9F?=
 =?utf-8?B?UHh6N2o2Y3FUbE5TSUhmK0RKZnRndVVxemhpT1V4YUNpbXhvYjdYNjgrbnZO?=
 =?utf-8?B?VmdLU3p0Nko4Tkh0b2xOSFdqWFk2d3REcUhndjYvYXd0MENnWjFhN1ZaVGV4?=
 =?utf-8?B?MG5XK3VKOWt5SG5HempRK0d0ZzZhSzQ5UWlSZFh5RXE3aDYyL2dPUG5vellB?=
 =?utf-8?B?ZEE5bVQrU1I4NzAyMWREUEVkemtCTHlWN3k1bWsyWE1vOTZnc1FaNFBwL3B6?=
 =?utf-8?B?QWw5RGRhbjZiVVJpOTdVN1JWM3FOekUxcmRLR1p6ZVRLdndDYnREVU81ZjRm?=
 =?utf-8?B?TmpsOUlRVGVnNE4vdEY2YVBQeWVVRWZtbEh5aWNQOFp4Sm5ZT2drS1QyNThj?=
 =?utf-8?B?cWtnY1pFZytpZ3Y4anNUbVlHT2RNTVowZWtyQldPRUZKN0FGSWQ0OEU4RExq?=
 =?utf-8?B?S0JoT1ZhcUR6OTh1VlIrb3dhRmFrY2hCL1VrZnJIZVNCcTF3RVJ2ZlhKZCtS?=
 =?utf-8?B?NFUzQ0xTVDEzUC84blVEY3gxZG1ENXQxSjFXSW9mVTMzQ2E0R2hjelU4UnFl?=
 =?utf-8?B?U3o2Ylp3S1BRdjI1OUEwRjZZZTJrWG90NDFSK0hZNjJCd0l6cmJzVkdxZHpM?=
 =?utf-8?B?d3NKUjR5U0d4S2ExTFFBUUJRb0JpWkNHMUQreUEyZ3ZXMkNSMkpESjZDdmg5?=
 =?utf-8?B?V1RleGw4UVUvZzdtTUZRbHFYaUxrcnltbVlibnJ1UDExTlNNRk1hV0M4TmNo?=
 =?utf-8?B?Q3JKNTR6RHArZml5eC93YkVIdGM1WWxYb3IyTGdWalZQbVhVZFhjSVQvS1hL?=
 =?utf-8?B?VVlOZWdKNUlFUDRKclNXa3EvWS9kVXJQTGVIZTNDdFM3eUtiZlF0dDhyelVK?=
 =?utf-8?B?S051dVNFNERKa0VOR3hBR3NkYXhlTVM3Q29RVUlMRVpmZ2M1bklCdE4zdk5D?=
 =?utf-8?B?NlBHTWlqSzJhWWR5bkN4NXVjRTJYS0NDZnlvMGQzc1hNYXIwV3VhTkh1bUFL?=
 =?utf-8?B?dVlkTDBma0IrYWg0VW9UZjlwdDRqU1htTWtrQjBpMTNFV2xHQU1hSjJXNjlv?=
 =?utf-8?B?ZXpwZXRma1MxY1gyTmV2KzM4RnpmM0IxalZ3Umh1TU9XQWl3aGYzY01HWlEv?=
 =?utf-8?B?ZzB4Nm01NjZ0T3dOcTJJZmp6K2NieGJNVzQ2UURzcnJJZzNSY3VzVTdrZk50?=
 =?utf-8?B?SEVzK3Z1TlpZVTE2Y0hKVTB4Ly9BaW1Ua2ZOKzYzNDVDSHNYOGdxRHljOFhY?=
 =?utf-8?B?dGsrYTRrTExOWHNscHo2VHdJYzNTYWJvSjFaRkFFUGZ0OWdXMmtWTUNKL2kr?=
 =?utf-8?B?UkVPaEp6ZUo4bC9IME5uRSsyQUs0Ri9HVm5XSTlRUkRJVnBqeEIzR2VjcWNU?=
 =?utf-8?B?SFFRbnMvTTROOE50QmpuR285QXpXSWkvNzRkUTBoSW9BbmEyYzBnaVorWThp?=
 =?utf-8?B?Ump1K0JMakpiUmdHZUYyWGVLWmQ1dVhnSEJOTnZRZzdCVm9uS1dyelZheWdo?=
 =?utf-8?B?eUVQTmk3QS9rSU9HOUh3WVJpdy92M2dQZWZ4RGpEd1ZqVkt2YlQrYjQ1RHFa?=
 =?utf-8?B?SzFMS3FFUWcwL3loWFZhYjdpY2hFeUVJQWNEMThQMXFyRkJGZHpGaG5CelVZ?=
 =?utf-8?B?WUowNWNuOXZqV1BmbDdEdXdFa1RaRytubkRaU3ZYR0hTeUhZTHBIbVpaTzlt?=
 =?utf-8?Q?0JDAKXdUmBYwYgQxqxg2gGXI2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd09655d-16ce-472e-d447-08dc11083580
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:43:33.5777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xnRYXKWi/9RG79vrLlp/EN5LGFTwjzkOoNssCt6BMwGuk49Y6XoPYGIKwh0xvp3zjcu5Spkqo0/p8jwbhJzDEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6196
Message-ID-Hash: H4QVCFWVA4C2HCMCRG7ZDDTJXLF6ZGNU
X-Message-ID-Hash: H4QVCFWVA4C2HCMCRG7ZDDTJXLF6ZGNU
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4QVCFWVA4C2HCMCRG7ZDDTJXLF6ZGNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCk9uIDA5LTAxLTIwMjQgMDc6NDcsIEt1bmlub3JpIE1vcmltb3RvIHdyb3RlOg0KPj4gICAg
ICAgICAgICAgICAgLy0tLS0tPiBjb2RlYzEgZW5kcG9pbnQNCj4+ICAgICAgICAgICAgICAgLw0K
Pj4gQ1BVIGVuZHBvaW50IFwNCj4+ICAgICAgICAgICAgICAgIFwtLS0tLT4gY29kZWMyIGVuZHBv
aW50DQo+IEl0IHNvdW5kcyAiU2luZ2xlIENQVSAtIE11bHQgQ29kZWMiIGNvbm5lY3Rpb24sIGFu
ZCBpZiBteSB1bmRlcnN0YW5kaW5nDQo+IHdhcyBjb3JyZWN0LCBjdXJyZW50IEFTb0MgaXMgbm90
IHN1cHBvcnRpbmcgaXQgc28gZmFyLg0KDQpZZXMsIHRoaXMgaXMgYSB0eXBpY2FsIFRETSB1c2Ug
Y2FzZS4NCl9fc29jX3BjbV9od19wYXJhbXMoKSBjYWxsIGluIHNvYy1wY20uYyBsb29wcyBvdmVy
IGFsbCBDT0RFQ3MgZm9yIGEgDQpnaXZlbiBydGQuIFNvIGlzIHRoZXJlIHNvbWV0aGluZyBlbHNl
IHlvdSBhcmUgcmVmZXJyaW5nIHRvIHdoaWNoIG1ha2VzIA0KQVNvQyBjb3JlIGRvZXNuJ3Qgc3Vw
cG9ydCBpdD8NCg0KPiBCdXQgZHVtbXkgQ1BVIHdpdGggTXVsdGktQ1BVL0NvZGVjIGNvbm5lY3Rp
b24gaGVscHMgeW91ID8NCj4gSSdtIG5vdCAxMDAlIHN1cmUgdGhvdWdoLi4uDQo+IFNlZQ0KPiAg
ICAgICAgICAke0xJTlVYfS9zb3VuZC9zb2MvZ2VuZXJpYy9hdWRpby1ncmFwaC1jYXJkMi1jdXN0
b20tc2FtcGxlLmR0c2kNCj4NCj4gRFQgbG9va3MgbGlrZQ0KPg0KPiAgICAgICAgICBbTXVsdGkt
Q1BVL0NvZGVjXQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICstKyAgICAgICAgICAgICAr
LSsNCj4gICAgICAgICAgICAgICAgICBjcHUgICA8LS18IHw8LUAtLS0tLS0tLS0+fCB8LT4gY29k
ZWMxDQo+ICAgICAgICAgICAgICAgICAgZHVtbXkgPC0tfCB8ICAgICAgICAgICAgIHwgfC0+IGNv
ZGVjMg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICstKyAgICAgICAgICAgICArLSsNCj4N
Cj4gVXNlIE11bHRpLUNQVS9Db2RlYyBjb25uZWN0aW9uIHdpdGggZHVtbXkuDQo+DQo+ICAgICAg
ICAgIGF1ZGlvLWdyYXBoLWNhcmQyIHsNCj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImF1ZGlvLWdyYXBoLWNhcmQyIjsNCj4gICAgICAgICAgICAgICAgICBsaW5rcyA9IDwmbWNwdT47
DQo+DQo+ICAgICAgICAgICAgICAgICAgbXVsdGkgew0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG9ydHNAMCB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBbTXVsdGktQ1BVXSAq
Lw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgbWNwdTogICBwb3J0QDAgeyBtY3B1MF9lcDog
ZW5kcG9pbnQgeyByZW1vdGUtZW5kcG9pbnQgPSA8Jm1jb2RlYzBfZXA+OyB9OyB9Ow0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDEgeyBtY3B1MV9lcDogZW5kcG9pbnQg
eyByZW1vdGUtZW5kcG9pbnQgPSA8JmNwdV9lcD47ICAgICB9OyB9Ow0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwb3J0QDIgeyBtY3B1Ml9lcDogZW5kcG9pbnQgeyByZW1vdGUt
ZW5kcG9pbnQgPSA8JmR1bW15X2VwPjsgICB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgfTsNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFtNdWx0aS1Db2RlY10gKi8N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRzQDEgew0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwb3J0QDAgeyBtY29kZWMwX2VwOiBlbmRwb2ludCB7IHJlbW90ZS1l
bmRwb2ludCA9IDwmbWNwdTBfZXA+OyAgfTsgfTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcG9ydEAxIHsgbWNvZGVjMV9lcDogZW5kcG9pbnQgeyByZW1vdGUtZW5kcG9pbnQg
PSA8JmNvZGVjMV9lcD47IH07IH07DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBvcnRAMiB7IG1jb2RlYzJfZXA6IGVuZHBvaW50IHsgcmVtb3RlLWVuZHBvaW50ID0gPCZjb2Rl
YzJfZXA+OyB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICAg
ICAgICAgICB9Ow0KPiAgICAgICAgICB9Ow0KPg0KPiAgICAgICAgICB0ZXN0X2NwdSB7DQo+ICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0ZXN0LWNwdSI7DQo+ICAgICAgICAgICAgICAg
ICAgcG9ydCB7IGR1bW15X2VwOiBlbmRwb2ludCB7IHJlbW90ZS1lbmRwb2ludCA9IDwmbWNwdTJf
ZXA+OyB9OyB9Ow0KPiAgICAgICAgICB9Ow0KDQpJIGxvb2tlZCBhdCB0aGUgMTpOIChTZW1pLU11
bHRpKSBleGFtcGxlIGluIHRoZSByZWZlcmVuY2VzIHlvdSBzaGFyZWQuIA0KU2VlbXMgbGlrZSB0
aGlzIGlzIGJyb2tlbiBpbnRvIG11bHRpcGxlIDE6MSBsaW5rcy4gSXMgdGhpcyBjb3JyZWN0IA0K
dW5kZXJzdGFuZGluZz8NCkFsc28gdGhlIGJpbmRpbmcgcHJvcGVydGllcyBvZiAiYXVkaW8tZ3Jh
cGgtY2FyZDIiIHNlZW0gdG8gYmUgZGlmZmVyZW50IA0KZnJvbSAiYXVkaW8tZ3JhcGgtY2FyZCIu
IEkgYW0gbG9va2luZyBhdCBhIHNpbXBsZXIgZXh0ZW5zaW9uIG9mIGV4aXN0aW5nIA0KYmluZGlu
Z3MgZm9yIFRlZ3JhIGF1ZGlvIHdpdGhvdXQgaGF2aW5nIHRvIHJlLXdyaXRlIHRoZSB3aG9sZSBi
aW5kaW5ncy4gDQpJZiAicmVtb3RlLWVuZHBvaW50IiBjYW4gdGFrZSBwaGFuZGxlIGFycmF5IGl0
IHdvdWxkIGJlIHNpbXBsZXIgZnJvbSBEVCANCnBvaW50IG9mIHZpZXcu
