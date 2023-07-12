Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854674FD87
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 05:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05238E87;
	Wed, 12 Jul 2023 05:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05238E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689131636;
	bh=7heXZT42URTRnQeh65skrSJWmTyTsPxmt3mCupfqLFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j0tr1D4Q0mJhw6bOaBI10R0flt1oxfj/GsZv8EZq1L6DtQQUQV1zmTaOIxtIYAfOB
	 0gVq5VmdxITw/TBMEHAINS1SIaCs+A07fl8iRpD2q+2cPy0jHi8W9pf9H37E4yOTpw
	 Jb9m/Ln6vVV10Tn6Hc4fEUmoE7pvsJEsfxScKMXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DF15F80544; Wed, 12 Jul 2023 05:13:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF925F800D2;
	Wed, 12 Jul 2023 05:13:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2232BF80249; Wed, 12 Jul 2023 05:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95C82F800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 05:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95C82F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=V4ZIxHdL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF3+PnsvM33EUXltZVDq4NJsdlos5yqjRxkYNN6jX2PwtGmw+ez/GiTCoxwA+041q94DiV4jRgKbOwKxdK58pkyUuH62olhJod+tivUawTAgqxIMGhK1g8rvaRS6/JDrAKXvXVs0KAbxlg6woCR1bXmdbZdlGZceIeP5Y83e1h6h9X7qNjyMzcBJbmJY6QdEiMxVl/LkVUIsYuj9F7a1Ed2QSFbYmTS8441c22rBDGIw56l0B5SoUoEcbaENL8wDQbGkODiPbHW0uWvCDByu625ZHwQN24V/sEWLxloeb7qBF3e//r7LUs9EjDS/sG+Ukkj5romuHfVKW7IYUSq6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtThnzYrGdXde1TJtvbojeuuq10uzeWVinL36dKh650=;
 b=XzWNFdD3aVSKIjx0gKSwnr1cMMWMSoq5MdCKbLwVvuQFkpb9c8xkYkKTtWPLhFwZyfhwsJn2hYdLCoc+Q4Pc8zqBLqPJFpvZDiAevvKWYprxAGfIiaMsPhDlXPZL2sShkrdaBt8tCyei5UO1BVSzljnqa7NwArED1ytBMXNrjxVRXBJ4rrXHodUyh/gvx6vOEwaXWxgsCz+2T6X+UgeBi8vb0NKqGGxFzJGw7ZaKAWtub1xk+m7hzpvOJazNaMw6KAl2yvRFcktvcYhqGFdIYFRGGSA2dztvlAMEsM/9JD8/VeUoxfpDpockehfCFusvqckziJiAKEEsFUmeiGyvXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtThnzYrGdXde1TJtvbojeuuq10uzeWVinL36dKh650=;
 b=V4ZIxHdL0Dpm8qiG4j+hOgnknchM49iBbbzflNjjm+PrAbTC/7ZDDmbkZX5VdF5Hu4JpSn7/ZC5cpuIyXlREO757B5e/Qpm0/RuzsXRABKDO/BeFnwLlTcVaaSSz58y+yY7UrbeLvTxPh8tkw5EINO7Mw+XDWMXbYq7l5Yu+e/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com (2603:1096:100:5c::17)
 by SI2PR03MB5545.apcprd03.prod.outlook.com (2603:1096:4:131::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 03:12:32 +0000
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::cf35:c00c:61ed:cba0]) by SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::cf35:c00c:61ed:cba0%3]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 03:12:32 +0000
Message-ID: <6e11cd40-c8e9-a370-24b7-7c6e6afd448d@nuvoton.com>
Date: Wed, 12 Jul 2023 11:12:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com
References: <20230626104619.1112588-1-wtli@nuvoton.com>
 <1ed60d4d-8e94-78b1-17ad-4305cadf867c@linaro.org>
From: AS50 WTLi <WTLI@nuvoton.com>
In-Reply-To: <1ed60d4d-8e94-78b1-17ad-4305cadf867c@linaro.org>
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To SL2PR03MB4348.apcprd03.prod.outlook.com
 (2603:1096:100:5c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR03MB4348:EE_|SI2PR03MB5545:EE_
X-MS-Office365-Filtering-Correlation-Id: e4be95e3-6b49-45b2-9804-08db8285d4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Exh1oUVT/kNxuV1Bftax7AmRE6XrAgla5Ec3pVpP6j8g1/Bw4PHQUB265APMC9bs+YFbyR6A6ApZGVqizP1WDIjFzcxKBM7Su7ha7mq7hGkLt8Qo50vXdy+dfHSiBR7PIqVf7VZCAAcmMxF+K9NGPFztWnVTt6DJBzcBxnZv42QxmWbASWJ422+8c5+AwdItSxra2E6695Yv9o7jgpYCePBTqJVWs663UzQUUZMxpCXgmwqxxrI4dCVjLEVytrHCkxYg5vMepwAouNasdANVILEnL6KJGpcqcQGdv0yGOY21Aud6zH1Ubyyx9QyGEVXu4DQe0TgJMuLf2Giice74pTlrbgxZRgiaId6fYfBCQBAv8CF66hkK21F/yIbULDTtO3sMqjZ80qydfKqB6pz0+KavuCXsvZnWf4FDJAKSviycfRzAokabEmkqrfENUaDT181v5FInmrIEMBjjA8kgdP2L9CfKIfu37iPcp66P6ZeUA+XbTI9K68NCvYZW8CKaVQ9R5L1kZKcpXeT25zZCvPqgQSjBtaBqZa7QVkF+6TQXapa4kwtL+Ai5ZpGm1B1V14aF2DAWbIx7qxfYANuXgHY1D/D4l186eurqUQHkUwG0rwRROgzuOLbNYFnAJpyvEFWxHzA3vVHC/ID2kAfn8dCnH6ZAwfjayZqQljbunqCkUpxgqR3Oqyg+aa3zzS/m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4348.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(83380400001)(2906002)(2616005)(36756003)(31696002)(86362001)(38100700002)(41300700001)(4326008)(33964004)(6512007)(316002)(6486002)(5660300002)(8676002)(8936002)(478600001)(66556008)(66476007)(6666004)(31686004)(66946007)(186003)(53546011)(26005)(7416002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NVJCV1k2TUhCajh2WjBlaTFZT1BqQkRGMW1rYlRDVGtGbnBkOHpxWVdnODFV?=
 =?utf-8?B?WXUwWXp3cGh6UDFWcC9ENEdWZGJQb05GZUFENFY4WklYOXFYMkJBYVlFbXg2?=
 =?utf-8?B?a2hETnRlUXE2V2crVXVyNko1c09EQ3VjUlVkLzVJamxBWW5hNEtHN202YjVp?=
 =?utf-8?B?M3FIY1YwTUx1c0tEQ3ZVR0JwelkvS2dMNG9Pdi91WTF6K1JPa1AzbTB4R0gy?=
 =?utf-8?B?TjVvbXl5dGlrSVJpcnFwMWdHUENEK3hJRDlKUDN2SjRmY0Vrcnk5R2RTQ3hz?=
 =?utf-8?B?dGw3dE81R0hQWWluaG1oU3pzVGtncHhXR1ZsQXBhVHRnVGhxZE1sTXo5cGRy?=
 =?utf-8?B?eUlBWnNPQnc4czhoMVJZWllOSkd4TmF1VG14aFZ4VDNVVS9NU0RjWkZieFpK?=
 =?utf-8?B?TURQNVpHL3pXTzFvdkVCc1VjdE1nQzFNQkRxVGMxd3NSSXpQb2FuOGlnclBF?=
 =?utf-8?B?WDQrNHV6Z1V4NnBTZHVlTlV5TitITm1vdlZIb25OY251VUZ3UjUyNzBNZXdl?=
 =?utf-8?B?SmUwQXpPbUczNDVISm10VVVOMEVTTU1JV21RQXFYNGgxNWYwNUIwQXlURlp6?=
 =?utf-8?B?emVHV0czSVl5dlFhbjltL3pDdjhzUytMSUxqRGZNSUNoVEZaTVVtNTJCQ3NF?=
 =?utf-8?B?QVdsWWtrTUoyM0hjZVNSWjdOS01UK3JDeU9SVUhEbzhVSGVUNElBOHQ0cDVn?=
 =?utf-8?B?L3BtK2xnSzBPM3YwbTJHbjE0Q1dxZHFpWTlmZTh2UEZRWGIydVNKMkpZSGhN?=
 =?utf-8?B?TDRycVVQTnE1a0lpQmQ3eTJFcjVZNE1vMTNUNG5BYXZhMHcxaGZka1orYXc0?=
 =?utf-8?B?Q1ZzRlp2TS9pNnhDS0RPMnpHY3BXUW5POGE1dkRkNGw0T0lDaCtzSGFsdmZY?=
 =?utf-8?B?Q0RrUXVkbDE2ZGd5V3NnTm9pY0xXYmZ0SEJ3SFBaZ0tGNGlCNnJUa1QvdFVC?=
 =?utf-8?B?WDFjbURWMEJKN3lUNkNXMlZ2a0NmOGRCV21xV3VPYmpzQXRCSFR0SSs2MzRT?=
 =?utf-8?B?SGR4d1dtbklLVTRnanVSSlpPdEg5aUd2dTlRRG1ab1pCNEZ6RU1BNFBDeFBh?=
 =?utf-8?B?ZzkxNlJSUUNmRmRQdWxVZ28xSDhBTCtVeFRzT0xWeEtoMDI1c3IyaWswU2Yx?=
 =?utf-8?B?d2cxcnR2SWRINlBqZTF3c3B6c2JFUjgxNWhtS3dZS1M1MXQrMng1WFhxQkdX?=
 =?utf-8?B?Qit6MzFsTUYzTlRxY1JoTnBON0RETWRVSEVOYkpzWEhuRW1za2kwVWxnR1h2?=
 =?utf-8?B?SUw0QzhUNVFNY2pUM0NYeXBNdGlSUWlKMjJiUGhJTUs1ME5Zc2RVaDRMbGNs?=
 =?utf-8?B?VloxWjlIL0FmQ2hLNzhqMU04YUMyRmFJV1h6ZDIyWU1Qd2hxK1Fac3hoNFJv?=
 =?utf-8?B?TlNSZUROMnVXRHV1L3VZdVN3TXJKa2hzTEVkdkx1ZG9WTDVjVE0vQ0pNcHI3?=
 =?utf-8?B?b1NxUzlvb1hXQk4rcG54bGxoSUprTDBNVUxZSDc2MHhzQVFLdHpuOUtERHR4?=
 =?utf-8?B?cjdJRnpVaVIzQXlEQi9lZnpERzMzNDIxNnBPRlRFUU1PTjM1SHlESGxHRnZs?=
 =?utf-8?B?cHZCcDM3UnhjaldBdWt5Ull4aS9yMmxzckUxSEl0ZzJ3R2FENXFFVEhaSGFa?=
 =?utf-8?B?RW52dnBqOHczZ3VBUUJtM3gxYXB6NFhHTTJhRE9Mck9JMXluc3hDTXBVV2Nk?=
 =?utf-8?B?MHZLWEllcnJ3czlTZkJ5Y0JOYVpURVR1eUtTcGZwZVdUYkFlbWRhK0hiZkJP?=
 =?utf-8?B?blVhVE15U1d2TUJSMVZsbU43Mk93T2dtRmtKREM4MUNueE8rZ0cyd3MwY05F?=
 =?utf-8?B?ZFU5NVB0UVVrQlRJRUtvWDlMM3h4Sld3dkFwTFNVYWhJMDN4L2ZNSXFyRG8z?=
 =?utf-8?B?TTV6OWZyZUU4NE5QRDJWYzNiRjJJenRTZ00rbDNRWnJ6SkdGaE1DbzRyNGtm?=
 =?utf-8?B?eUZnNjExakdBQmFwRTgxODk1U2M1NUlOYkVGdXFZU2VQYVBmQWJkeGx5dW5C?=
 =?utf-8?B?SUlaVFdibXhmSXE3QjJ2UjRvODBZelNLUmNrUkhRMU9iTDllUDhmU2ZpTGZP?=
 =?utf-8?B?QXJrOGdUZ0lPQ0ZrbmVaSHpacEpPL09KSTJPM1A0OCs1L2FYa2EvazBmQ0g4?=
 =?utf-8?Q?Mg571N45AbkZTwXW6LPcfhlU4?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4be95e3-6b49-45b2-9804-08db8285d4f5
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4348.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 03:12:32.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 miPVh/T+NOAXIIWfDHj/oKD8ZFBQxI7Kj376VeugsCRMK90gcam2wHEyuHl5GNDk+tWpExLd3dL1ydlRo6LUMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5545
Message-ID-Hash: 5JYAXG3GYALZSN7RAHWAFUECN2IEJ4OS
X-Message-ID-Hash: 5JYAXG3GYALZSN7RAHWAFUECN2IEJ4OS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JYAXG3GYALZSN7RAHWAFUECN2IEJ4OS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiA2LzI3LzIwMjMgMjozMSBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCg0KQ0FV
VElPTiAtIEV4dGVybmFsIEVtYWlsOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGFja25vd2xlZGdlIHRoZSBzZW5kZXIgYW5kIGNvbnRlbnQuDQoNCg0K
T24gMjYvMDYvMjAyMyAxMjo0NiwgU2V2ZW4gTGVlIHdyb3RlOg0KDQoNCkNvbnZlcnQgdGhlIE5B
VTg4MjEgYXVkaW8gQ09ERUMgYmluZGluZ3MgdG8gRFQgc2NoZW1hLg0KDQpTaWduZWQtb2ZmLWJ5
OiBTZXZlbiBMZWUgPHd0bGlAbnV2b3Rvbi5jb20+PG1haWx0bzp3dGxpQG51dm90b24uY29tPg0K
LS0tDQoNCg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0
byBkaXNjdXNzL2ltcHJvdmUuDQoNCg0KDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9u
Lg0KDQoNCg0KDQoNCg0KDQoNCisNCisgIG51dm90b24samtkZXQtcHVsbC11cDoNCisgICAgZGVz
Y3JpcHRpb246IFB1bGwtdXAgSktERVQgcGluLiBJZiBzZXQgdGhlbiBKS0RFVCBwaW4gaXMgcHVs
bCB1cCwNCisgICAgICBvdGhlcndpc2UgcHVsbCBkb3duLg0KKyAgICB0eXBlOiBib29sZWFuDQor
DQorICBudXZvdG9uLGprZGV0LXBvbGFyaXR5Og0KKyAgICBkZXNjcmlwdGlvbjogSktERVQgcGlu
IHBvbGFyaXR5Lg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzINCisgICAgZW51bToNCisgICAgICAtIDAgIyBhY3RpdmUgaGlnaA0KKyAgICAgIC0gMSAj
IGFjdGl2ZSBsb3cNCisgICAgZGVmYXVsdDogMQ0KKw0KKyAgbnV2b3RvbixtaWNiaWFzLXZvbHRh
Z2U6DQorICAgIGRlc2NyaXB0aW9uOiBNSUNCSUFTIG91dHB1dCBsZXZlbCBzZWxlY3QuDQorICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICBlbnVt
Og0KKyAgICAgIC0gMCAjIFZEREENCisgICAgICAtIDEgIyBWRERBICogMQ0KKyAgICAgIC0gMiAj
IFZEREEgKiAxLjENCisgICAgICAtIDMgIyBWRERBICogMS4yDQorICAgICAgLSA0ICMgVkREQSAq
IDEuMw0KKyAgICAgIC0gNSAjIFZEREEgKiAxLjQNCisgICAgICAtIDYgIyBWRERBICogMS41Mw0K
KyAgICAgIC0gNyAjIFZEREEgKiAxLjUzDQorICAgIGRlZmF1bHQ6IDYNCisNCisgIG51dm90b24s
dnJlZi1pbXBlZGFuY2U6DQorICAgIGRlc2NyaXB0aW9uOiBWTUlEIFRpZS1vZmYgaW1wZWRhbmNl
IHNlbGVjdC4NCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyDQorICAgIGVudW06DQorICAgICAgLSAwICMgb3BlbihkZWZhdWx0KQ0KDQoNCg0KRHJvcCAi
KGRlZmF1bHQpIg0KDQoNCk9rYXksIEkgd2lsbCBkcm9wIGl0Lg0KDQoNCg0KDQoNCg0KDQoNCisg
ICAgICAtIDEgIyAyNUtPaG1zDQorICAgICAgLSAyICMgMTI1S09obXMNCisgICAgICAtIDMgIyAy
LjVLT2htcw0KKyAgICBkZWZhdWx0OiAyDQoNCg0KDQpZb3Ugd3JvdGUgdGhhdCBkZWZhdWx0IGlz
IDANCg0KDQoNCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIHdpbGwgZml4IGl0Lg0KDQoNCg0KDQoN
Cg0KDQoNCisNCisgIG51dm90b24samFjay1pbnNlcnQtZGVib3VuY2U6DQorICAgIGRlc2NyaXB0
aW9uOiBudW1iZXIgZnJvbSAwIHRvIDcgdGhhdCBzZXRzIGRlYm91bmNlIHRpbWUgdG8gMl4obisy
KW1zLg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIN
CisgICAgbWF4aW11bTogNw0KKyAgICBkZWZhdWx0OiA3DQorDQorICBudXZvdG9uLGphY2stZWpl
Y3QtZGVib3VuY2U6DQorICAgIGRlc2NyaXB0aW9uOiBudW1iZXIgZnJvbSAwIHRvIDcgdGhhdCBz
ZXRzIGRlYm91bmNlIHRpbWUgdG8gMl4obisyKW1zLg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCisgICAgbWF4aW11bTogNw0KKyAgICBkZWZhdWx0
OiAwDQorDQorICBudXZvdG9uLGRtaWMtY2xrLXRocmVzaG9sZDoNCisgICAgZGVzY3JpcHRpb246
IERNSUMgY2xvY2sgc3BlZWQgZXhwZWN0ZWQgdmFsdWUuIFVuaXQgaXMgSHouDQorICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICBkZWZhdWx0OiAz
MDcyMDAwDQorDQoNCg0KDQpZb3UgbWlzcyBudXZvdG9uLGtleV9lbmFibGUuIElmIHRoaXMgaXMg
aW50ZW50aW9uYWwsIG1lbnRpb24gYW5kIHNob3J0bHkNCmV4cGxhaW4gZGV2aWF0aW9ucyBmcm9t
IHB1cmUgY29udmVyc2lvbiBpbiB0aGUgY29tbWl0IG1zZy4NCg0KDQoNCg0KWWVzLCBJIG1pc3Mg
dGhlIG51dm90b24sa2V5X2VuYWJsZS4gSSB3aWxsIGFkZCBpdC4NCg0KDQoNCg0KDQoNCg0KKyAg
JyNzb3VuZC1kYWktY2VsbHMnOg0KKyAgICBjb25zdDogMA0KKw0KK3JlcXVpcmVkOg0KKyAgLSBj
b21wYXRpYmxlDQorICAtIHJlZw0KKw0KK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCisN
CitleGFtcGxlczoNCisgIC0gfA0KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlv
Lmg+DQorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEu
aD4NCisgICAgaTJjIHsNCisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47DQorICAgICAgICBjb2RlY0AxYiB7DQorICAgICAgICAgICAgI3Nv
dW5kLWRhaS1jZWxscyA9IDwwPjsNCisgICAgICAgICAgICBjb21wYXRpYmxlID0gIm51dm90b24s
bmF1ODgyMSI7DQorICAgICAgICAgICAgcmVnID0gPDB4MWI+Ow0KDQoNCg0KY29tcGF0aWJsZSBp
cyBmaXJzdCBwcm9wZXJ0eSwgcmVnIGlzIHNlY29uZC4gVGhlcmVmb3JlIHB1dA0Kc291bmQtZGFp
LWNlbGxzIHNvbWV3aGVyZSBmdXJ0aGVyLg0KDQoNCk9rYXksIEkgd2lsbCBmaXggaXQuDQoNCg0K
DQoNCg0KDQoNCg0KQmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KVGhlIHByaXZpbGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0
aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0
aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlz
IGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVt
YWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBz
dWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGlu
ZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRl
ciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGln
aGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ug
b2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGli
aXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhl
IG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIg
Z2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uDQo=
