Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDBD783E4F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 12:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C0420C;
	Tue, 22 Aug 2023 12:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C0420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692701469;
	bh=tIxFtpdxnuZdOTnLjxJV9o+yNhhobBPWATb4TXe6zUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fUxkjJ0VlMw3J8vDAKQrdraA5+m0Zjo6hZjobJp8fqIliKMZCKhURNlKFHUrUcoET
	 3jPoUpxUDPt1IdvZsE9RYrsx7+/LJJZjBFFPxEsryfXucwfKjuG6QyXnRuCh7VvUAm
	 MljjCaYVHSzF9ZuTt7UYD5o9gnZFkaPogbgpiWgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2364F8023B; Tue, 22 Aug 2023 12:50:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45784F800F5;
	Tue, 22 Aug 2023 12:50:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB3CF80158; Tue, 22 Aug 2023 12:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B39CF800BF
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 12:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B39CF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=YSfdTYZ8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxnzhUIyasOy5niM8dHx/UMbfuUjz9vkLf9RebFpGiXRqx+ypBKbI/NA6w4Jl03ADw0hCKOlFEbFkUoYc5Rhd7YYQuk8iHpDoZnY8gMONFWgT5Zc8YVOycFMrsWCHHzmWhgXgG8r5lj5eHD8w0JjRu7stzaZHm2wjREEfUSjGCMUwq0py9fRoMMa4vYr7KZYH4UwH0HzzNX+N2B86zjacYwWdQBh0o5q3w45uBitrphRhvBFcgr1m8pSHWGoLyycyR5K/W9O5yVjVpOxKQ6lKLDmQ8Hk6ooK9h+/pv1cp8s9F5SdIlI3Vuv3sIEbbe7psSRUHsmno8nTf0xtaYf47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go8IBEQD0Zp5/CVswASn4ocy8MhC3IiUxWM7Le7DeNE=;
 b=N3mV56ex9m/jreKkFmX+jku7YFURckd9gngUTn4DBd+/5TrZIXSndw076pDSQP9Dhx440Nhj3oiUgtzuCusfmkCudSwXyK6Hoc2J52tHC/8n1jhlFzrFiRa8ychNL4/LXpLgxojXlZXitCLrFreWStkXfRj3PZqNPd3eu0TSkcsg8UM794WpMtdhb3zbNs36EAqTC7/nnD9o2DGjcfmx20DIAF5/xQPguf3w70puXJY56ksbt8W9E8PdsfyOz+8Qoh1k9bUIoF3Mn8RsQoWrTfOkUfwbEW1BnyozaZPWvsy2t7Swc/wz6wRuBSoBCxM3/fxr7Vh4kW2hCuXPKljFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go8IBEQD0Zp5/CVswASn4ocy8MhC3IiUxWM7Le7DeNE=;
 b=YSfdTYZ8O77pSxNi5mrLMbTEPScWNdbeeUZusS5Ht8NLOvC1z1CK2+6mSiIaMbDiWMvUS9ZTMrpOoqKoeyQuA6d2K8OWZPhTj3Xd9jmcGtqPtB0B5HP0Ghtknx8yWXPH2dSLDMT+eJGPmr2Zp1QkkSYen0SAbJ5uJFEF93ePML8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com (2603:1096:100:5c::17)
 by SG2PR03MB6729.apcprd03.prod.outlook.com (2603:1096:4:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 22 Aug
 2023 10:49:55 +0000
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::fb4e:cd3:aee5:88cf]) by SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::fb4e:cd3:aee5:88cf%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 10:49:55 +0000
Message-ID: <5129f779-79e5-3c0a-aeca-ce558393f2cc@nuvoton.com>
Date: Tue, 22 Aug 2023 18:49:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] ASoC: nau8821: Improve AMIC recording performance.
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
References: <20230816080006.1624342-1-wtli@nuvoton.com>
 <20230816080006.1624342-2-wtli@nuvoton.com>
 <2f72d241-7617-48c0-a0c9-86bd14c50ac8@sirena.org.uk>
From: AS50 WTLi <WTLI@nuvoton.com>
In-Reply-To: <2f72d241-7617-48c0-a0c9-86bd14c50ac8@sirena.org.uk>
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To SL2PR03MB4348.apcprd03.prod.outlook.com
 (2603:1096:100:5c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR03MB4348:EE_|SG2PR03MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 792c0585-52f7-4887-6d1d-08dba2fd855e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v5YdRstaRF4TpyTTJ8eoU6EQvx19Ii8oiHBFSbGUwIjWlCAcVR8q5vqibxzCqEi0qMnJ9wb1L3y8j3cZlRIpOugmoyC5OWCRAJSHXj6Coqm5vb7vnZ7wwioRl6ZrcGaXY8e9UfGLoO7AvGZZUoWhryKva3lG6Z3cun85NZp8PgZFxiQ1haRLZOEIuxzZ+93n9QKrq6i9E8oN/Dlfh1kg2DMlxlnS7Yq7zU+ZunNsja2ut5V53p6+LzyLysHKkBMaUcShigq/LNEaKttFVoVP/xW3VpP3OeKPkNndsfc9af7bdVDrXxzNtJu2bXEzjNiJ0ToTFPwQW9aDmqu++iGvFvU9iXceW1ZplrdbxZBu6SsgJR3iGHcjOva8rQzh7iQT4HO7ISBHV94vad65TjxA92Ga+GbWGnKtXyKJ6sf5adaoNd+hiVxGcohH5Mb1wpkBZgE9VQ0mgrcB4rFGdN0iyvbe7a/nv9chaippf/P19NS7Dh2vGNWHiYkqYEsZJRHC7wWEa+gZNU3EBXygfBmPNLl+k9Zhq+GCWu550jOcAHnDTG+6Lc6siilDsD8Cc95B2LekS6wlYGrIzrfC1p1FX5B+I/LclaKYXenOPSGSQHmUjfMDVlLn4AKrSrRDioQXUrsO6+6YvpfXJqQ79C21/Eg5CnSNJl3qgTphuZ2B5H3095hPGWTd8uKoHHrHTFvviNZo0b/9J6zVfoUv+H7KMjuGynY5VFaksiWH0uHKCow=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4348.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(1800799009)(186009)(451199024)(83380400001)(2906002)(7416002)(86362001)(478600001)(53546011)(6666004)(36756003)(33964004)(6512007)(2616005)(6506007)(31696002)(6486002)(26005)(5660300002)(41300700001)(6916009)(66476007)(316002)(66556008)(66946007)(12101799020)(38100700002)(31686004)(8936002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGlSSHlya2pOWkU0YjU0R2ZNZHJaOGdhcld3MnAwY3Rta0llcVVPN3dxQWds?=
 =?utf-8?B?eXhJVUcwZng5NThHUk1qbStRMmdyOVArVWliVmU5dk1sNGhzVW9uS1lGTzZ3?=
 =?utf-8?B?Tm9ra0JnZTdJcDlOcE1qVTVkcm5KZ0ZRTnZVdHdmVVptNWFZMEZueEhWWVlL?=
 =?utf-8?B?NFBIRUQ5SXI1dUhkV0tFS2pKbmtCRzhSZ3VSc1JqVUZ5WWUxdTRxL2ppZ2Nx?=
 =?utf-8?B?eUlpMktKQWVzak1RUng0WjRUbTRqeW02ZWk3cDBvN3pxaTlFdTlVR3lmSjY1?=
 =?utf-8?B?RTZIbWRwUTVWUGhZMnhDNGVtclJHcGYyYWthSGtGa3IweUhEd2F3czBVTmNJ?=
 =?utf-8?B?by9kaFh3WFFEZmpVWElRazVMQXNyMHprSlBEQUU3TVVBT016VGpBd3EyNWRn?=
 =?utf-8?B?cEtrb0ptcVlSS2VROG5udlJRZ3pwbXkwejJIMzkvcitJcTFGdGJGM1gzSUsx?=
 =?utf-8?B?OTZJOGMxVmRGWDBnYjRodzkxUzRER2hiaXNNNHU3dTkwcVgzUzB0bkdaU3Nr?=
 =?utf-8?B?V2F0SEpzNURwdDRnL3Z0OGFEcitOZFNQMlFkdlVkazROaDk3bEs1VUtwVVVK?=
 =?utf-8?B?Ni9HM0Z1OE9iaGl1ZlVlRmUzMWtNMUpaOXZvM0NlYUdldExtRGZxQnRzUGdk?=
 =?utf-8?B?d2YwZFUxeURJUHg4TlR5V1lvejR2Tnk5cUdOeXNaUVNOdkY1RzZrblR4Y2lw?=
 =?utf-8?B?b01ZTmdyc2JjdExTcmc5WEF3WmhRS0tZWGNoNllPV0FCUytRVVA3a0JVQlZq?=
 =?utf-8?B?bU1Bd0RHSHVvYk9SU1dkTHJVV2dYWE9BREJtZzFpV0ZmaFViemlKYXlWZmp3?=
 =?utf-8?B?bVo5NVhJVVVlVXdUUnViR0l5R1RzcXh2K0dCT0FkZDdiZTNlQlNxMHRTMm9n?=
 =?utf-8?B?ZlBnbHViNXhodEIwU1lFNTdkVjg5T204TEI4bVFZM3pYN1B1eXNYOEhkYmV4?=
 =?utf-8?B?aUpkZmhYT3BPUVZmRHhlVGNOV0lXTXVYc0VFUEROOXpzdUlVd3IvZHNWUFNV?=
 =?utf-8?B?TmRuZTA0WnB5aFJkRzdhdlNmRjlOZUJZYm0ydXJYUktRV1lEeDAvRzMvQ2p6?=
 =?utf-8?B?UzZNbGJIS05QNlpvYWRJbHZDNUhSNE1VUkZQTHB0NVVjLzdEemhrN2hnOVdV?=
 =?utf-8?B?RXh6V2Q5QVpHWTlJQnV4ckdEdUtnYVM3SnlucjQ0dG5rcUdzNmN3bWFJakx1?=
 =?utf-8?B?YS9WVTRaWjcwNktHNWgzKytNK0pVUERoWkRYc3BybTYrS1dPaXRSeElQeGJj?=
 =?utf-8?B?c043dkNMeHNqd21oWDRvOC91Q2dQTktQclhVVmZjZ1V6bmExTTYrSzYvSG9E?=
 =?utf-8?B?MGFlODBoeVhvM2pGMTVwZFlhdXNJQ0xmd2p4WVkwdVA3TFRHM2hMaHRqbU5Q?=
 =?utf-8?B?WFJyeE94Y1Bha0dOOGs5d1ZrNHQzZEYwYStvblE5TTMzS1NNY0UvZnRSOTJv?=
 =?utf-8?B?STB2VlJ4eDFMYXhmUTNocVJibGRpL3NCbnVHbkJLWHVQYzhpK1VOMkNJcDh6?=
 =?utf-8?B?SXJDMHQ0NHZXS2VWU3poQjI2bHE2VHhMaFJNR1N6RHRtQzVYV0VTamtRZ0h4?=
 =?utf-8?B?bnVSYlRCenUrZklYdGlKQlFWNzZoVG02V2Rxd1hRYmoxNGhoVU1JVnZ0L2Nm?=
 =?utf-8?B?RnU1c0dpV3FxWEd3ZkFRVDNDNEZybVRTdEFMWkFqN2tzT2VPL1dNS0RQU1Bt?=
 =?utf-8?B?ZFZCMTFVZUR5Y2p1bEpWeU1uYVhwRS9xZ2FzMFBlWjlYOHVyTU4vaGVnY0ZL?=
 =?utf-8?B?clpneThhYzJjYXdUVXdoVTMxVjRPeVNrVzRRZnIrVWNHVHRXdlNIclZCSlMx?=
 =?utf-8?B?YmdIUWpMdHIxYkhnbEZnRSt1aGVoT0lzTy93alNtenN1bW5TZjdjRjkraU94?=
 =?utf-8?B?NFVSVFVIK1Zyc1liaG5XL1piU1NJdEhhdlZ6ZVNwMzNBcmQ4b0lZTHdoZ2k0?=
 =?utf-8?B?VEhOQ1VMR0hMeEpncDROQ2lJVDRoTjd4U2ZYclJuRUZVZEllNXlFdzVoblBn?=
 =?utf-8?B?WDNmeU1lcGpqNURmS3BmTGp1NDNSWmN1eGhaQzZwWWpPNnc3N3lYb0ErRmF2?=
 =?utf-8?B?MFhJcUVDVmJhM3J0N00rbFlZY2xxcGdVeWJqaTZrU0o1M2EwLzMwV3hyZTIx?=
 =?utf-8?Q?zlyYYOa1kk4CihR0Kw5MnNN7x?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 792c0585-52f7-4887-6d1d-08dba2fd855e
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4348.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 10:49:55.3452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cAKEBg0ZIemcx3PMoBHSHa+yWbNQkSGEoD3JECLbEaj5cK5ef/g5JmWX9ZmZrC1LbezMStHGwuD+p4nBuKPOOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6729
Message-ID-Hash: N7WCKCICD3SFXY6CMSWV6WBSS2B77SWI
X-Message-ID-Hash: N7WCKCICD3SFXY6CMSWV6WBSS2B77SWI
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7WCKCICD3SFXY6CMSWV6WBSS2B77SWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA4LzE2LzIwMjMgMTA6MDUgUE0sIE1hcmsgQnJvd24gd3JvdGU6DQoNCk9uIFdlZCwgQXVn
IDE2LCAyMDIzIGF0IDA0OjAwOjA2UE0gKzA4MDAsIFNldmVuIExlZSB3cm90ZToNCg0KDQpTaW5j
ZSB0aGUgaGFyZHdhcmUgbWF5IGJlIGRlc2lnbmVkIGFzIGEgc2luZ2xlLWVuZGVkIGlucHV0LCB0
aGUgaGVhZHNldCBtaWMNCnJlY29yZCBvbmx5IHN1cHBvcnRzIHNpbmdsZS1lbmRlZCBpbnB1dCBv
biB0aGUgbGVmdCBzaWRlLiBUaGlzIHBhdGNoDQp3aWxsIGVuaGFuY2UgbWljcm9waG9uZSByZWNv
cmRpbmcgcGVyZm9ybWFuY2UgZm9yIHNpbmdsZS1lbmQuDQoNCg0KDQpUaGUgbmV3IHByb3BlcnR5
IGxvb2tzIGZpbmUgYnV0IHlvdSBuZWVkIHRvIGZpeCB0aGUgYnVpbGQgZXJyb3IgMGRheQ0KcmVw
b3J0ZWQuDQoNCk9rYXksIGJ1dCBJIGhhdmUgYSBxdWVzdGlvbi4gQWZ0ZXIgY29ycmVjdGluZyB0
aGUgcGF0Y2gsIGRvIEkgb25seSB1cGxvYWQgcGF0Y2ggMi8yIG9yIHJlc2VuZCB0aGUgZW50aXJl
IHBhdGNoPw0KYmVjYXVzZSBJIHNhdyBBY2tlZCBtYWlsIGJ5IFJvYi4NCg0KDQoNCg0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFs
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ug
b25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRl
ciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBp
biB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBl
bWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIg
aW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91
ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRp
b24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9y
aXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0
bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZh
bnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFz
IG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uDQo=
