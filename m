Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584E5706EDC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D6381F9;
	Wed, 17 May 2023 18:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D6381F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684342605;
	bh=5RvDUUhul8NdO/67/+echUrAaqiG4E8I8+1BKNeBzpc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T3WC8sQYV9YI/3Q1bSCVXMiIK1E6Le8wR2kX8CgOxdvWXJaoKmXYT3mQ/35DYNJb1
	 gY1ZOecooBOXW5XGVEwvbwN6FbxVFz5yTywnkjsPBG5FGQIfGoTSCfJEiGhbNp1bep
	 79MyK3pvycdwJm+iM02DX/JUBMBaLrzbCi6h7GXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E049F8053D; Wed, 17 May 2023 18:55:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 320D4F8025A;
	Wed, 17 May 2023 18:55:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94242F80272; Wed, 17 May 2023 18:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49D1EF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D1EF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256
 header.s=selector1 header.b=TZPBmmqu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kO15eSTQwqgWfquIDjZCHsHhwWwTD/At3mz0kBeDkK0XSJAZTLIZEmC8kzwsS/qm339pa0EuOo4jp7TF6xnhheQvy86T55hbcropO1eCr8kW8Ac6Ium3hdTK/MT6F3Y0uOSn22FumkmSncBxc54NBZmr4qszPYw7v+McjZsRRWlmlCpmiXncfPvr3wMg5bLeJnJeMr5ycRU8ETHvbhV4ynOUI0I6z7PEhotnWS2Cux2erVo2du3vlFJPwmnbxL6d3xdS5+TqB3LElGuvfvM6K/ierIQuFI9OLvnP58mHtVMyC+co8i+64kfH6WzJ5ROb3xKKD7+XePdmEMcXW0dTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RvDUUhul8NdO/67/+echUrAaqiG4E8I8+1BKNeBzpc=;
 b=K3D6LiAw8xAiKZ6S2mfUQzz6EzP+4Ot4S0vRQBlYLRpRXlhKCtAjCdjFKfUUTjRv3C2ZW+KzcwtbOxi8MdzfHNCvz0E4tjh8WyYUoBKPN9Y6wNX1qSZsX1zLq6SP1uOvTPuLecWxlys6zaWrMhYEaqU92+Cr5PvDp8+ACUX2JuvjHXiRyulctt6Ev6BafzJ2zauYTEjU6J0MQF+2j/zb6pV/Ta9adtECw+WGvG4vhhJ23Bvxzv+Ec2vvInr8ldTBCBMU22NQSD/nHCA5tK1z5+TML9geFrZm9RxXafd6ZGEZWchQuGJ8x7yKql2T776Z1Vp+CFFkYOCFVTlp5oYvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RvDUUhul8NdO/67/+echUrAaqiG4E8I8+1BKNeBzpc=;
 b=TZPBmmquiMo5jNHq5w9QKEiBPr0L6/+Jrnu0u1rA6w3OXaLwEM78eAve788XyC85cyCDDcAaA5Ccbdx3T6FCR6CfFObwGS2zXQt8yMwG+7q3uzJdJ3LPUh02RJAVuV8i3RpNeUtF/2AXtoNk4A/GxdCccI4gH6Ou+MwZW5w0CD+/HO4pQu+kROwfxvOGAlAAHT9wTubguRX+Q/+XdcLkDacS4wQ1teGEdrFqSCCJVl4SeztIij+4PvrQ1MbcndhH6FtosaqTgqGB7GqXvwDF6eJet2i+dQv03qXhrVX5mdPRXQ4uM2/LgP9KXcikRrgsmcSlxY0Bsu6pbdeXvIhu3A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 16:55:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 16:55:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>, Naresh
 Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] ALSA: emu10k1: remove runtime 64-bit divisions
Thread-Topic: [PATCH] ALSA: emu10k1: remove runtime 64-bit divisions
Thread-Index: AQHZiN9ZOwyrnt8aRUOTYkG7KkDCkq9ervyA
Date: Wed, 17 May 2023 16:55:22 +0000
Message-ID: <7ad9d0b7-44b4-b27e-0f43-653f67785236@csgroup.eu>
References: <20230517164800.3650699-1-oswald.buddenhagen@gmx.de>
In-Reply-To: <20230517164800.3650699-1-oswald.buddenhagen@gmx.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3009:EE_
x-ms-office365-filtering-correlation-id: ed2ac987-fa6c-4ea7-6bbf-08db56f78149
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 G3/PteMvayiUwdm1grW5e5oCqX+5akaHY7CxxXC8ejN+AsH4zLYHsdLUpkbsdEcqeWkXLsQ8fjijuIYvRZvQUgG3g+FJGjb0o+GZw8ow7J0vRkcV28qNq5YSbgFWq0/dEupJLb1ZNX0iTlvL99yFGYqoAQMdbdI29abF1TNxgcimHCUgBGSXQ3mVtEq5hkCSnGardq6yp3bbvpz34reMpEA2Y7BY9c7DaRl0YiGdOiB7jo4K+DtJHSHWzxcfxDuDzBm+7GtvjGrmtRXpt/6A9lEowHJmkdgT3k64t9h/GDMVxof1Mh6uu50XtJp+ufDFN+6tOV1b0rARMuitcAL++lZ9QFL1r8oL9vglAUZLCuctDQyeLdjxOBvua5jehOCA5sQLHpDR42eiayPUOXLYGyTannJXj7ENmyG0kcUSYRXBoNz07JqdmOy3iGlfW/iKKBNy2cvBMqc5MCBAQ2h1fdvpDcQRQk2oy9F2BmLFsc0YCL4a9VVtBy/8knGtuhLAyqnr/Cr11vrXHXK1Viy+JtWbC4k7yUcfN62LN2gHs3HaYn1l6R7pjn3t/kC3cn+5MumFz9I7s/ED8G+fk/r4ghKkZqaGdgQV65Hn/gZj6SecBNpj3xSuS6skLVvstSirYgKZkoF1Exg/G5+GZQd7GN7LmtQ+lzztNnW2S8ibvkikSs+0GEQ8qA6VwQOp1abn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(8936002)(8676002)(5660300002)(44832011)(83380400001)(186003)(26005)(6512007)(6506007)(122000001)(86362001)(31696002)(2616005)(38100700002)(38070700005)(41300700001)(71200400001)(76116006)(6486002)(66946007)(66476007)(316002)(66556008)(66446008)(91956017)(36756003)(4326008)(478600001)(64756008)(54906003)(110136005)(2906002)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WEpjdjBCYjRhU2tXV3JtL0VhV3grRXVBeEQwUC9sNkNPdVdPVlkzSzNyOUVG?=
 =?utf-8?B?N2F6Q0g2Lzd6SjlRZWV6Qnl2K2srRFVvQW5PV2twd2RLVDF4K3liZ3ZneTZV?=
 =?utf-8?B?RXRmRmNVUzZ0S01SR3l5MU9VWVV2TFRwNmt0dklaRjJSend4R1VjUk1LTS9C?=
 =?utf-8?B?RUhvRGppRlZZNWJYWUhqODFsa3A4ZUVOZVJzc1FHcHoxTlFnVTl3QThIZEgr?=
 =?utf-8?B?RVRZRlVIeWFDVjVqbjg0MVdZT0ZJMUdUN2VSeUE4bHZKc09Wd3VNUk5samtw?=
 =?utf-8?B?UGtHbXZSWjVya3F5WGlMOHF6WTdiNzU4SnpiRlc0QlZJSGhhQUN3SGdONG1Y?=
 =?utf-8?B?TW5SLytxOHYwL3d6V0FzN0pZcm4wWDYzK3VURmxyWmgrYXkrNFQ5SzViL0Jq?=
 =?utf-8?B?TWRWK2pRVDJRS3ZBNWQ2djhtOU5kem5NOEZYSDR3aWU5MFVxbFM0UUFnZldh?=
 =?utf-8?B?elAyLzdtUnFDNzM3YWlQVWZMc1NDWk5WWElnSHp2bUVOd294Zi9ad1ROcUlF?=
 =?utf-8?B?ZCsxSXArZ0lOMGFyeVYyV2JyaEpqNTJuMzI5THYzYUlYR2ZZRSsyMFhMQlNv?=
 =?utf-8?B?K1RiQ3NxS1JUVVUrd1JiaU9FQWFWZlF5K25NUkkzZ2RaVisrc29HUFVGS3Q4?=
 =?utf-8?B?bmxtOGtTL1RCVWUvZHVRM3M5M0xyRzFUczBRUllSVmY3OWx0d0tYeGF1ekE0?=
 =?utf-8?B?bFhsVjNCVDZ3cjBJaWp2cjRCUEZ0VVExdnd1bVludkI5WmFZTmhna2VkSFJY?=
 =?utf-8?B?bDFJaDdiMkxCNEF1N0lCR09obEYxR2dSZjBjTHVoeEVvcFBqWTdFVVR2SGto?=
 =?utf-8?B?WWxDZ1pSRk04U3BQakx3MHVtaXVRUlVCOEhpWWxQNzI3a2sxTGtEZlVXZUxH?=
 =?utf-8?B?Sjd5MDJHNHlNWnV6U3Zkc255RXYwUmRKVjF0U0NzU3JYcHpRaVAvOTFMdVZu?=
 =?utf-8?B?L0NlcTR5RHk4UCtkanczUXBHNHZJNWlCYkhVa3h1YytiZ0tmTEVjd2NJa1V0?=
 =?utf-8?B?Y2NrYlc0bmV4d3dhTjNnTlcxUFZsOStZQ1Y0SjNhRjBULzRvWWFmUWk4K3Nu?=
 =?utf-8?B?ZWpRaExYc3NvdStvUVZZajFQdk83d2Y5QU1BTGYzUXduUjRTekltRVlJUUZL?=
 =?utf-8?B?NFRadEY2ejJjYnRBY2dycVdObDZIOUUwM04vVXJMbE4xbnA0Nm1pREFwejFI?=
 =?utf-8?B?SFFsUUI2bGR3RC8wVjRyRzBWblZ5N2VBVWFvcDFVcWgzcFlWbEpWOXdaSStx?=
 =?utf-8?B?bVhDNkh0MSt0UDYraDlLbUh3eElNRGRGWHN5UlNlZlNDUEVpUVpuMGlVRTQx?=
 =?utf-8?B?K1l2NGt2bjFBTlBoQTgzc2pJUU1iODM0Z3pKdDJXSG5kT3cwNTd6Y3RpTEly?=
 =?utf-8?B?ZDRjYno2U0RYY054cWdnakJGV0FFWFZkWFV0T0Q5SUw2RjQ3V3lxamtnL0F5?=
 =?utf-8?B?b25GVlA1SnhUeUdqMkR2YXNORklLSzNMUWNRZ1FmU29zTDlXemdZalZUMmw2?=
 =?utf-8?B?WmZndThHZk9JK3V3N0ZDSEpWR3kxa2JnSXYzMGpHZTh5N2Npc3VWOGlWd1h3?=
 =?utf-8?B?WkNlYU9UMm1NZFBZTmJ4a3pNQTJQVXNmYUhZRUtKK21LVk9Ray9sQVpPSVcy?=
 =?utf-8?B?b1Ardk5KN3daUU5sYXZBUFpTeUVobEo2TDU3MVVMNnMySExqaHVQRFBaQ0l1?=
 =?utf-8?B?clF2UGFZNGtqVTRGZEpzRkFzYXdsZFhzV3JCWmM2T29JMTZJcG5wNFhCRmRh?=
 =?utf-8?B?a2cwRloyb2RZdVE0UjdzWlEzYThBWFNSTjZhd1FtOTZKL1VSQnJ5aGltZmZ4?=
 =?utf-8?B?eGM0RlV6aEJ4MnFSR3dEYkFpZnBrc21DTDlsbHlQSFBpbnJyYnBiMmd6bmdm?=
 =?utf-8?B?YjRGKzBWdjVmOGlaY3R3bWliU29scG5iSGc3Qm5Ca0xQeEtpaXdoNUFMYjh5?=
 =?utf-8?B?VVJEMjNYelVidHRtcXpHbEZta0VoVzd1RjF6M0oySS9RMWNycmVMY1BhZFBw?=
 =?utf-8?B?SEVENURWU250SEFMUUdYUzlmbGVCbmhkSklRUC9JQVEwN2p5aVQ1MEtUOFZ6?=
 =?utf-8?B?QTlmVmdOTlRnRUdTMWhUaTlpUDVNYTg1cUdwRFA5Tm9iZ3NsS2I4eEgreG9B?=
 =?utf-8?B?akovb3JvVGNESVBlR1JiZkpSNW15ZndxRnpvd3RnUjEyMk0rdU1sU1lQWUJ2?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AF3627BDD0A0240B48568BCB6C1DF11@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed2ac987-fa6c-4ea7-6bbf-08db56f78149
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 16:55:22.8544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 igrUWhIG0A2lOaGlH1ZDdJbpwDelMMlg8jFd/6rbPV8U7VwqC2Sxmb2UkLhIXGoPkjwLzqCl2JcVmgFuECpgHuD6uw8MwYngXZSUSlsAbu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3009
Message-ID-Hash: V6UEU2ZQPM5Z42ESJLODAG2DHM2TJRXD
X-Message-ID-Hash: V6UEU2ZQPM5Z42ESJLODAG2DHM2TJRXD
X-MailFrom: christophe.leroy@csgroup.eu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6UEU2ZQPM5Z42ESJLODAG2DHM2TJRXD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCkxlIDE3LzA1LzIwMjMgw6AgMTg6NDgsIE9zd2FsZCBCdWRkZW5oYWdlbiBhIMOpY3JpdMKg
Og0KPiAzMi1iaXQgcGxhdGZvcm1zIGRvbid0IGxpa2UgdGhlc2UuIEFzIHdlJ3JlIGFjdHVhbGx5
IGRlYWxpbmcgd2l0aA0KPiBjb25zdGFudHMsIGZhY3RvciBvdXQgdGhlIGNhbGN1bGF0aW9ucyBh
bmQgcGFzcyB0aGVtIGluIGFzIGFkZGl0aW9uYWwNCj4gYXJndW1lbnRzLiBUbyBrZWVwIHRoZSBj
YWxsIHNpdGVzIGNsZWFuLCB3cmFwIHRoZSBhY3R1YWwgZnVuY3Rpb25zIGluDQo+IG1hY3JvcyB3
aGljaCBnZW5lcmF0ZSB0aGUgYXJndW1lbnRzLg0KPiANCj4gRml4ZXM6IGJiNWNlYjQzYjdiZiAo
IkFMU0E6IGVtdTEwazE6IGZpeCBub24temVybyBtaXhlciBjb250cm9sIGRlZmF1bHRzIGluIGhp
Z2hyZXMgbW9kZSIpDQo+IEZpeGVzOiAxMjk4YmM5NzhhZmIgKCJBTFNBOiBlbXUxMGsxOiBlbmFi
bGUgYml0LWV4YWN0IHBsYXliYWNrLCBwYXJ0IDE6IERTUCBhdHRlbnVhdGlvbiIpDQo+IFNpZ25l
ZC1vZmYtYnk6IE9zd2FsZCBCdWRkZW5oYWdlbiA8b3N3YWxkLmJ1ZGRlbmhhZ2VuQGdteC5kZT4N
Cg0KUmVwb3J0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxrZnRAbGlu
YXJvLm9yZz4NClJlcG9ydGVkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gDQo+IC0tLQ0KPiANCj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQ2M6IE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gu
a2FtYm9qdUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBzb3VuZC9wY2kvZW11MTBrMS9lbXVmeC5j
IHwgMTggKysrKysrKysrKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2VtdTEw
azEvZW11ZnguYyBiL3NvdW5kL3BjaS9lbXUxMGsxL2VtdWZ4LmMNCj4gaW5kZXggZjY0YjJiNGVi
MzQ4Li5lOTg1NWQzN2ZhNWMgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3BjaS9lbXUxMGsxL2VtdWZ4
LmMNCj4gKysrIGIvc291bmQvcGNpL2VtdTEwazEvZW11ZnguYw0KPiBAQCAtMTE0NCw1MCArMTE0
NCw1NiBAQCBzdGF0aWMgaW50IHNuZF9lbXUxMGsxX2lwY21fcGVlayhzdHJ1Y3Qgc25kX2VtdTEw
azEgKmVtdSwNCj4gICAjZGVmaW5lIFNORF9FTVUxMEsxX1BMQVlCQUNLX0NIQU5ORUxTCTgNCj4g
ICAjZGVmaW5lIFNORF9FTVUxMEsxX0NBUFRVUkVfQ0hBTk5FTFMJNA0KPiAgIA0KPiArI2RlZmlu
ZSBIUl9WQUwodikgKCh2KSAqIDB4ODAwMDAwMDBMTCAvIDEwMCAtIDEpDQo+ICsNCj4gICBzdGF0
aWMgdm9pZA0KPiAtc25kX2VtdTEwazFfaW5pdF9tb25vX2NvbnRyb2woc3RydWN0IHNuZF9lbXUx
MGsxX2Z4ODAxMF9jb250cm9sX2dwciAqY3RsLA0KPiAtCQkJICAgICAgIGNvbnN0IGNoYXIgKm5h
bWUsIGludCBncHIsIGludCBkZWZ2YWwpDQo+ICtzbmRfZW11MTBrMV9pbml0X21vbm9fY29udHJv
bDIoc3RydWN0IHNuZF9lbXUxMGsxX2Z4ODAxMF9jb250cm9sX2dwciAqY3RsLA0KPiArCQkJICAg
ICAgIGNvbnN0IGNoYXIgKm5hbWUsIGludCBncHIsIGludCBkZWZ2YWwsIGludCBkZWZ2YWxfaHIp
DQo+ICAgew0KPiAgIAljdGwtPmlkLmlmYWNlID0gKF9fZm9yY2UgaW50KVNORFJWX0NUTF9FTEVN
X0lGQUNFX01JWEVSOw0KPiAgIAlzdHJjcHkoY3RsLT5pZC5uYW1lLCBuYW1lKTsNCj4gICAJY3Rs
LT52Y291bnQgPSBjdGwtPmNvdW50ID0gMTsNCj4gICAJaWYgKGhpZ2hfcmVzX2dwcl92b2x1bWUp
IHsNCj4gICAJCWN0bC0+bWluID0gLTE7DQo+ICAgCQljdGwtPm1heCA9IDB4N2ZmZmZmZmY7DQo+
ICAgCQljdGwtPnRsdiA9IHNuZF9lbXUxMGsxX2RiX2xpbmVhcjsNCj4gICAJCWN0bC0+dHJhbnNs
YXRpb24gPSBFTVUxMEsxX0dQUl9UUkFOU0xBVElPTl9ORUdBVEU7DQo+IC0JCWRlZnZhbCA9IGRl
ZnZhbCAqIDB4ODAwMDAwMDBMTCAvIDEwMCAtIDE7DQo+ICsJCWRlZnZhbCA9IGRlZnZhbF9ocjsN
Cj4gICAJfSBlbHNlIHsNCj4gICAJCWN0bC0+bWluID0gMDsNCj4gICAJCWN0bC0+bWF4ID0gMTAw
Ow0KPiAgIAkJY3RsLT50bHYgPSBzbmRfZW11MTBrMV9kYl9zY2FsZTE7DQo+ICAgCQljdGwtPnRy
YW5zbGF0aW9uID0gRU1VMTBLMV9HUFJfVFJBTlNMQVRJT05fTkVHX1RBQkxFMTAwOw0KPiAgIAl9
DQo+ICAgCWN0bC0+Z3ByWzBdID0gZ3ByICsgMDsgY3RsLT52YWx1ZVswXSA9IGRlZnZhbDsNCj4g
ICB9DQo+ICsjZGVmaW5lIHNuZF9lbXUxMGsxX2luaXRfbW9ub19jb250cm9sKGN0bCwgbmFtZSwg
Z3ByLCBkZWZ2YWwpIFwNCj4gKwlzbmRfZW11MTBrMV9pbml0X21vbm9fY29udHJvbDIoY3RsLCBu
YW1lLCBncHIsIGRlZnZhbCwgSFJfVkFMKGRlZnZhbCkpDQo+ICAgDQo+ICAgc3RhdGljIHZvaWQN
Cj4gLXNuZF9lbXUxMGsxX2luaXRfc3RlcmVvX2NvbnRyb2woc3RydWN0IHNuZF9lbXUxMGsxX2Z4
ODAxMF9jb250cm9sX2dwciAqY3RsLA0KPiAtCQkJCSBjb25zdCBjaGFyICpuYW1lLCBpbnQgZ3By
LCBpbnQgZGVmdmFsKQ0KPiArc25kX2VtdTEwazFfaW5pdF9zdGVyZW9fY29udHJvbDIoc3RydWN0
IHNuZF9lbXUxMGsxX2Z4ODAxMF9jb250cm9sX2dwciAqY3RsLA0KPiArCQkJCSBjb25zdCBjaGFy
ICpuYW1lLCBpbnQgZ3ByLCBpbnQgZGVmdmFsLCBpbnQgZGVmdmFsX2hyKQ0KPiAgIHsNCj4gICAJ
Y3RsLT5pZC5pZmFjZSA9IChfX2ZvcmNlIGludClTTkRSVl9DVExfRUxFTV9JRkFDRV9NSVhFUjsN
Cj4gICAJc3RyY3B5KGN0bC0+aWQubmFtZSwgbmFtZSk7DQo+ICAgCWN0bC0+dmNvdW50ID0gY3Rs
LT5jb3VudCA9IDI7DQo+ICAgCWlmIChoaWdoX3Jlc19ncHJfdm9sdW1lKSB7DQo+ICAgCQljdGwt
Pm1pbiA9IC0xOw0KPiAgIAkJY3RsLT5tYXggPSAweDdmZmZmZmZmOw0KPiAgIAkJY3RsLT50bHYg
PSBzbmRfZW11MTBrMV9kYl9saW5lYXI7DQo+ICAgCQljdGwtPnRyYW5zbGF0aW9uID0gRU1VMTBL
MV9HUFJfVFJBTlNMQVRJT05fTkVHQVRFOw0KPiAtCQlkZWZ2YWwgPSBkZWZ2YWwgKiAweDgwMDAw
MDAwTEwgLyAxMDAgLSAxOw0KPiArCQlkZWZ2YWwgPSBkZWZ2YWxfaHI7DQo+ICAgCX0gZWxzZSB7
DQo+ICAgCQljdGwtPm1pbiA9IDA7DQo+ICAgCQljdGwtPm1heCA9IDEwMDsNCj4gICAJCWN0bC0+
dGx2ID0gc25kX2VtdTEwazFfZGJfc2NhbGUxOw0KPiAgIAkJY3RsLT50cmFuc2xhdGlvbiA9IEVN
VTEwSzFfR1BSX1RSQU5TTEFUSU9OX05FR19UQUJMRTEwMDsNCj4gICAJfQ0KPiAgIAljdGwtPmdw
clswXSA9IGdwciArIDA7IGN0bC0+dmFsdWVbMF0gPSBkZWZ2YWw7DQo+ICAgCWN0bC0+Z3ByWzFd
ID0gZ3ByICsgMTsgY3RsLT52YWx1ZVsxXSA9IGRlZnZhbDsNCj4gICB9DQo+ICsjZGVmaW5lIHNu
ZF9lbXUxMGsxX2luaXRfc3RlcmVvX2NvbnRyb2woY3RsLCBuYW1lLCBncHIsIGRlZnZhbCkgXA0K
PiArCXNuZF9lbXUxMGsxX2luaXRfc3RlcmVvX2NvbnRyb2wyKGN0bCwgbmFtZSwgZ3ByLCBkZWZ2
YWwsIEhSX1ZBTChkZWZ2YWwpKQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkDQo+ICAgc25kX2VtdTEw
azFfaW5pdF9tb25vX29ub2ZmX2NvbnRyb2woc3RydWN0IHNuZF9lbXUxMGsxX2Z4ODAxMF9jb250
cm9sX2dwciAqY3RsLA0K
