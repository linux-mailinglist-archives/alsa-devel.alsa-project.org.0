Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433AE82849B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 12:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D984983E;
	Tue,  9 Jan 2024 12:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D984983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704798867;
	bh=kGVlNbZeFWXQ4wJW7WiLbH4NlYzU4xWECs6Lng5b7lw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qZtLqpoPFn+0QmiizAxDXf5YOmpS4ihLGPLswEJjScS4Byi9hOGTeIUPC1+XjPSyz
	 bfOFQsgI+Dz2Xykkch5U3f9kstye7K3AYeIizn4Rf7HG08u4nK2GqMFgBhcucFYN1U
	 wb0B/EAG5ivY1U9KUW2srC9yoAH3+6ILQ46ahc38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39E42F8058C; Tue,  9 Jan 2024 12:13:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B47F8055C;
	Tue,  9 Jan 2024 12:13:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07FC9F80254; Tue,  9 Jan 2024 12:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B040F800F5
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 12:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B040F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=PJhHhIYR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb/aqmmv17Q9l19QR7fVI8SfFEsCyzaj2Fq8v9C5/nngUAICopkLQsArw7/0Zc2B8lWZqqWUK/ED7YhSvTjN5f2VN99Tmdj5ntxJbRh+7QiyInhpFiE/YHpElA+bPuO7ERk8i+H6RHMOwgrvh7VOJ2Le3utcQ0DverFpd1wFHuLlXoi5tGsTaYrHiQKQgnlhxQOQj8WM7UQj/uQ3veDsWO1UJGI6QMLGD88kr2GO/Yir/DaSfMSXCUCWwU77gZc3cfbGzy1WWcUSyKOh9ymU4oVh300HniHFa2eIItbUJzwik/gumv9iWXFxJtsAINK/k2gVi92PQLkoHXCgiA1iMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xA3+4Pa2q1G3v7y0wL0tfceWc+D2KU84vz6wEbotjms=;
 b=B3F8SS5tQgzDR9EsxBqvRN7BsD/x58u1oMYwe4A0e3RsZ2v6t195d/HnAPDnHtIre0qjIYkoDDIRIBEbvfgx3aegLDPGyonMNUpDZ1rkpUzV8In3Ub45jVWWmSPIyLQXXjXPxI1u3R7636armm8pW9FtaqUcjuAoFzgcdgoPHHCVoMzao8valHzXuHoCtysw6FiN8SNR6hMDdnIdxyg23einMfXk0ijhBKakDTFZwclD4dkwoOQIXoYikHlk08omBgxKET8opkIVtVCK2H1tYVGDrx+oQTTns7C12bspFwbgkkFvlfv9kPOt3yvn2DKvrLflt8ull4+Kdf1OYLaFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA3+4Pa2q1G3v7y0wL0tfceWc+D2KU84vz6wEbotjms=;
 b=PJhHhIYRXStwd8PyWsT1tRvHson5zhmCIfFAvlHGF48p1LGCn58BazISGjaxyTERKidol9Z/mOcCwo5zj/24wuh458O9v89aP/NSsOjoUTA0T40saTCrYYPUrFKeDfinpFpAr4StmWit3YWqL7i0+it1LIY6Nb0aP861hckm2YNGJuH9XP4J2gukCGPaUg/UMAf7gzd85+42rzR8NAUJGvYmJX4b8RM+CS3oYOlmHI0SC+LAPhCYgVHLTFtXO7j57oOEC5vZapUIuxaWilnWRDBRUT7D/uhhjWTlR5yQIcUREOvWcDFW0XxYp3q9m+GKZZMZFoW9DQVFv0qJ+5h2vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 9 Jan
 2024 11:13:39 +0000
Received: from CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c]) by CY8PR12MB7706.namprd12.prod.outlook.com
 ([fe80::c6c5:6b6c:2422:b70c%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:13:39 +0000
Message-ID: <30e2cc15-28dd-4986-9d99-6908dfe81288@nvidia.com>
Date: Tue, 9 Jan 2024 16:43:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Query on audio-graph-card DT binding
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
Content-Language: en-US
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <875y03i739.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: PN2PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::9) To CY8PR12MB7706.namprd12.prod.outlook.com
 (2603:10b6:930:85::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7706:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dc6cb5-5be5-4c2d-0023-08dc1104080a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lMerWgT/O79XrK8wP2Dzpm8rO/z51JIOTY0/AOssTZveIQGmwQ0aQaYS0dFCvyM/3UrDF2rCwpnuv67Q4v1TFA0yvznoYUZDxKGNt8prN/yzgO6qiLZKkYbp2SfC0leLHGZ7qkoMq14vscyyTYDj0H06WiLWF0+novcPbyAuFalwYMAq/PmcKjIrd6hX8w3sQqVMtnhdAwl0ozeOsdrpb7f74ilUzeoiIUkjJ+EtjpTePJ7wRPC8L17/e6vIc38c0xOanmSZES9V4G8Ood9vMZlfr9VqIoilaYukAJA3lnFy5qD8XhNWSUIycFv9BbW99u667VvDEMp12imfTf5+sZFHoo75bvdp1LCkiKwrfMbgkZB98fQ8LVxvS9yyPVdTJyU6x78j++bxyrGEMAOElER5jVlPZxS0aTJxelEA0CJ6c4t0jeVAOyVdx0886Oad6Gto4k+nVT+80uL4A0dortemFtEt+e/vV3aRckNkhiiS/7gDxMdn3BnxERZrda8aPCa/95QBXzCB/bHGgz3uOVv8FIwnOLC7hySlkisXRfUtK1bjSNhB60tZgd/s/ZyP3xbK20y/jnMw9Pe+6TKrdgXNeKCZgoAkGwERFFmOdl7oPlcwd3f3W0nOHO/+h5oF5Koqpq6erpe9IrYk6pMJcSSz6XWZILIZWILr+izheg0obAU9w9CzpiFjBBdn2S+Xwqa6glWGVGEqYRCIcD4tvKBREsaoitgwyWXdRzokm94=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7706.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(5660300002)(41300700001)(2013699003)(38100700002)(966005)(6486002)(478600001)(2616005)(26005)(33964004)(6512007)(6506007)(53546011)(6666004)(86362001)(31696002)(31686004)(4326008)(8676002)(8936002)(66946007)(66476007)(66556008)(6916009)(54906003)(316002)(166002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Umg0OElneG1GcTVkQTRKR1pXaVpEQm5sZ2F6cVVQM3JKT1FJbVlVNHEzT1lI?=
 =?utf-8?B?UDM1REQybnpmZXA4akhJc0ljNWsxM0tVRzd6Z3BLNUZhUGJQeVpRYVVpLzVC?=
 =?utf-8?B?bWE0ZXJQWXU4S3hmU3hQOWxLWEtockNpQTM2Y3MvOUY5VW5uU2xYUmNsZWE1?=
 =?utf-8?B?dW1UTkJNS09ZU3pwQWFqSjhKSnoxUVdiK3VuWTY5SjhpalkyNm1LeFNkVG8z?=
 =?utf-8?B?RTlqVHlTL3h1b3gvSnA5Q2ttemhzVlI1MXZFY1BPcFRpcXRJYi9WMzQvQndv?=
 =?utf-8?B?b0xhVmd1bDJ6YWdqbk03WDZra2lYS0xKWXhid0xwNHNiVFFoNmpHT0FvMHhx?=
 =?utf-8?B?QS8wNHJ4MDhPL255aVR4SERaTmNLb0ZYaU9SNjJidHFodk1MQUNGTjBJQWJt?=
 =?utf-8?B?ZHRObUJLK0pXYUlUaTFyYTZGdWJiVUhKdkNYRnRsVExFdnNHdDJ1dGhtejVT?=
 =?utf-8?B?ZVBPR09xeFY4V2xmMVVjb25ES3JVdlI2cURhTEt2c0M5Z3VCK3ovRjE5RDlE?=
 =?utf-8?B?RlJRSWhXdmhnWWpvYjNRMDc1M1U3ajRFdnR5WE8yK2Erc2lJVXFUdER5UW9P?=
 =?utf-8?B?a1Bsc3RqajdjaVUzc3hKTTJqNG05T0pjYWZlMmFiblRSSkNjL2tEUVNFVWQ1?=
 =?utf-8?B?TGY0aHljZDJtUXN3WUEzbVFIbWg1UjN5cWxkR0NEdWF0emhDMXNQT0VyY0hz?=
 =?utf-8?B?UDNoSnpNM1lUUGplbmpsZ2JlS2xmVEdQM1Q2VTY1czIvdXhaRi92UjYxMkRW?=
 =?utf-8?B?Ui9zSGt1T2hxWGlqalhCVFhNS1FrZy9jZjEzS3VSMEhjbzZmOCsyNWVLeXhG?=
 =?utf-8?B?WFA4LzUvUFdISUM0eDkzV2l5dUJ5UHRFYytLS3lncDdWMC9MeEZrd3pCMGU0?=
 =?utf-8?B?VDh5MVBWS1VTK1NOQkFuVmRBVWF3Yk9qSEFWalhNMWcwUGR2WUVkSkhQUk16?=
 =?utf-8?B?SEV0bjE5WWRPY2pnbk1LVGVCZEt5cHIxZjZWL0xCMXpuT1NqazFXTGpQenlI?=
 =?utf-8?B?TnRTc1AzSi84ZGF3SHo3T1o1clVXbHc5RitERjdBaFBtRTdkTkVVRklRaVdH?=
 =?utf-8?B?cEZvMHRubVk5OEtGeGlFWnJVY3kzRzAxV2Y5KzI4WFBMQVBwOTRCVE52R3Y3?=
 =?utf-8?B?QnEyY3REQVN5bkpPdHRsU0Y4TlMybGU0Q0JsMTJvcnprUjFzOGwrem8xVWVY?=
 =?utf-8?B?d0I2SnZPWHVMYzMyK0xTUm5RdkFzajJadU1KMzhaODJGTEFIb2xGaDN1Nlcy?=
 =?utf-8?B?Qk5jb2d4TUdsSkM3UEtNUkV6ZW9LMlgxSFVuOS9XaGVuNWlXU1VrMFVieEdt?=
 =?utf-8?B?VzZMZG8wdGhDZGtCQ2UrRHBFcWZNbFd6KzFFTUE4SGlCMGdqY2c5N1J4SkpB?=
 =?utf-8?B?LzlzYUVpUGN6djFqV0Rya25SV1dBSGNzakh1SmV5d3pXMWdCSGFJeDEvM0Vq?=
 =?utf-8?B?QU9MVysyNVlKUHZwYldmN1RTeFFMRGZrRWszdjFOMXNwWlphQldBUk9UR21u?=
 =?utf-8?B?LzFJd293VlVmL2dWUDUvMFhjamRLRmRaTkJoZTRpQlNMamFLZ2NmNFd4UERo?=
 =?utf-8?B?cnFadnlWekpBdWdZdExvdkt4K1U1OGVTdVpWR2pWeUJrUVd1bE9wdDRCUVp2?=
 =?utf-8?B?akZDb0lSQ0VGWGxEVUJNVUZHL0srMVNKOE9VSzJwUld3RGF0QmR6bGR2Z2hD?=
 =?utf-8?B?bkxvOHBtYzIvTk5sM2V1Q0FjUkpkRElMZ0xVSDFLQmpzL0ViWUhuMkZ3dlNl?=
 =?utf-8?B?b1UybEN2UnZuY2p0dkE1TXplV0VwYUl0TGlzUUFVUnBwSWhXUmVNbUluaSt1?=
 =?utf-8?B?b2VhTVBTZ3hGM3hpbnhFT1J2Z0FDZkJscFR4bm9sWkFEdDR3YmR1c2o5MmtD?=
 =?utf-8?B?SE1pUG5Zc0NvQVJaVlA0MEpNSVlOSzMxeUJCaHJtaGIvdWFtdkxCSjl5R3Fv?=
 =?utf-8?B?OVVMM2JicG1rZGlCWXBEWUF0QzFTTWpOZWdtL0lIalhhRHozMlB3dmVkZjdh?=
 =?utf-8?B?NzUrTXVjKzZiWFNSV0VFWTdYSERWK3c3YVhnWkJWQUpReXhITlBBSXdGYTRl?=
 =?utf-8?B?NllCb09wTWl5cUpvQVJBQWlKdEpLZUM1VXdHNFdYT09KRUNRR0xvUGxWZmt4?=
 =?utf-8?Q?yoFhvowJQInmGVGOwD7Xhh1gG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3dc6cb5-5be5-4c2d-0023-08dc1104080a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7706.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:13:39.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kH4JDJu3Vd7StGDPDzd6rVV45v/mokV6FzBJG4uY0CbeXzrCy0JBo89GxyXT99ENQTwjNbCE2xs3baGTT3dv6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587
Message-ID-Hash: E4LDMWYNKFCBVXMVIP4SYPWVLZX65C2B
X-Message-ID-Hash: E4LDMWYNKFCBVXMVIP4SYPWVLZX65C2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4LDMWYNKFCBVXMVIP4SYPWVLZX65C2B/>
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
Y2FzZS4gVGhlIGNvcmUgbG9vcHMgb3ZlciBhbGwgY29kZWNzIGZvciANCmEgZ2l2ZW4gcnRkLg0K
UGxlYXNlIHNlZSwgDQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9zb3VuZC9zb2Mvc29jLXBjbS5jP2g9djYuNyNu
MTAxMw0KU28gbGF0dGVyIHBhcnQgb2YgeW91ciBhYm92ZSBjb21tZW50IGlzIG5vdCBjbGVhciB0
byBtZS4NCg0KPiBCdXQgZHVtbXkgQ1BVIHdpdGggTXVsdGktQ1BVL0NvZGVjIGNvbm5lY3Rpb24g
aGVscHMgeW91ID8NCj4gSSdtIG5vdCAxMDAlIHN1cmUgdGhvdWdoLi4uDQo+IFNlZQ0KPiAgICAg
ICAgICAke0xJTlVYfS9zb3VuZC9zb2MvZ2VuZXJpYy9hdWRpby1ncmFwaC1jYXJkMi1jdXN0b20t
c2FtcGxlLmR0c2kNCj4NCj4gRFQgbG9va3MgbGlrZQ0KPg0KPiAgICAgICAgICBbTXVsdGktQ1BV
L0NvZGVjXQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICstKyAgICAgICAgICAgICArLSsN
Cj4gICAgICAgICAgICAgICAgICBjcHUgICA8LS18IHw8LUAtLS0tLS0tLS0+fCB8LT4gY29kZWMx
DQo+ICAgICAgICAgICAgICAgICAgZHVtbXkgPC0tfCB8ICAgICAgICAgICAgIHwgfC0+IGNvZGVj
Mg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICstKyAgICAgICAgICAgICArLSsNCj4NCj4g
VXNlIE11bHRpLUNQVS9Db2RlYyBjb25uZWN0aW9uIHdpdGggZHVtbXkuDQo+DQo+ICAgICAgICAg
IGF1ZGlvLWdyYXBoLWNhcmQyIHsNCj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImF1
ZGlvLWdyYXBoLWNhcmQyIjsNCj4gICAgICAgICAgICAgICAgICBsaW5rcyA9IDwmbWNwdT47DQo+
DQo+ICAgICAgICAgICAgICAgICAgbXVsdGkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
cG9ydHNAMCB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBbTXVsdGktQ1BVXSAqLw0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgbWNwdTogICBwb3J0QDAgeyBtY3B1MF9lcDogZW5k
cG9pbnQgeyByZW1vdGUtZW5kcG9pbnQgPSA8Jm1jb2RlYzBfZXA+OyB9OyB9Ow0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDEgeyBtY3B1MV9lcDogZW5kcG9pbnQgeyBy
ZW1vdGUtZW5kcG9pbnQgPSA8JmNwdV9lcD47ICAgICB9OyB9Ow0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwb3J0QDIgeyBtY3B1Ml9lcDogZW5kcG9pbnQgeyByZW1vdGUtZW5k
cG9pbnQgPSA8JmR1bW15X2VwPjsgICB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFtNdWx0aS1Db2RlY10gKi8NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRzQDEgew0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwb3J0QDAgeyBtY29kZWMwX2VwOiBlbmRwb2ludCB7IHJlbW90ZS1lbmRw
b2ludCA9IDwmbWNwdTBfZXA+OyAgfTsgfTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcG9ydEAxIHsgbWNvZGVjMV9lcDogZW5kcG9pbnQgeyByZW1vdGUtZW5kcG9pbnQgPSA8
JmNvZGVjMV9lcD47IH07IH07DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBv
cnRAMiB7IG1jb2RlYzJfZXA6IGVuZHBvaW50IHsgcmVtb3RlLWVuZHBvaW50ID0gPCZjb2RlYzJf
ZXA+OyB9OyB9Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gICAgICAgICAgICAg
ICAgICB9Ow0KPiAgICAgICAgICB9Ow0KPg0KPiAgICAgICAgICB0ZXN0X2NwdSB7DQo+ICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0ZXN0LWNwdSI7DQo+ICAgICAgICAgICAgICAgICAg
cG9ydCB7IGR1bW15X2VwOiBlbmRwb2ludCB7IHJlbW90ZS1lbmRwb2ludCA9IDwmbWNwdTJfZXA+
OyB9OyB9Ow0KPiAgICAgICAgICB9Ow0KDQpJIGxvb2tlZCBhdCB0aGUgMTpOIChTZW1pLU11bHRp
KSBleGFtcGxlIGluIHRoZSByZWZlcmVuY2VzIHlvdSBzaGFyZWQuIA0KU2VlbXMgbGlrZSB0aGlz
IGlzIGJyb2tlbiBpbnRvIG11bHRpcGxlIDE6MSBsaW5rcy4gSXMgdGhpcyBjb3JyZWN0IA0KdW5k
ZXJzdGFuZGluZz8NCg0KQWxzbyB0aGUgYmluZGluZyBwcm9wZXJ0aWVzIG9mICJhdWRpby1ncmFw
aC1jYXJkMiIgc2VlbSB0byBiZSBkaWZmZXJlbnQgDQpmcm9tICJhdWRpby1ncmFwaC1jYXJkIi4g
SSBhbSBsb29raW5nIGF0IGEgc2ltcGxlciBleHRlbnNpb24gb2YgZXhpc3RpbmcgDQpiaW5kaW5n
cyBmb3IgVGVncmEgYXVkaW8gd2l0aG91dCBoYXZpbmcgdG8gcmUtd3JpdGUgdGhlIHdob2xlIGJp
bmRpbmdzLiANCklmICJyZW1vdGUtZW5kcG9pbnQiIGNhbiB0YWtlIHBoYW5kbGUgYXJyYXkgaXQg
d291bGQgYmUgc2ltcGxlciBmcm9tIERUIA0KcG9pbnQgb2Ygdmlldy4=
