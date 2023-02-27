Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8366A3E55
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 10:29:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5AE82C;
	Mon, 27 Feb 2023 10:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5AE82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677490190;
	bh=WlEpFevOI/MA1ySYZP5eNKIc7B0tGeUheOdHbS0K0jg=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iuvp2qxX7iDnlM7SvcR2UmUzyAuGUkJVjtc/ukp2u6OQJihT0qasvCiKQACq1x9OU
	 VTw8B6M7u/ME6CFXob869JWOhSpktOCf4fTBVDTLn0ppy+tQ9zX7YCVDnsTLmGdwwW
	 RwTfD2TAzjqWED1M9Ikvsa07RWsO2J0EAta1rx3Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E0F9F8049C;
	Mon, 27 Feb 2023 10:28:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E293F804B1; Mon, 27 Feb 2023 10:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A177AF80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 10:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A177AF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=URXhSOyU;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=ULvWIWvj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677490127; x=1709026127;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WlEpFevOI/MA1ySYZP5eNKIc7B0tGeUheOdHbS0K0jg=;
  b=URXhSOyUWQe/mq/oa0mONsNI3JNUp+gyovKpP/+Wxq0FD7eoYetnVp+v
   FLfPFXkAf4u/4sm0pmCMQtKTCpXRL0a3avn4IwzHUKz87BYhRv9OG0JNj
   tmoc9BEw7jS1gc2/SHXPz3oEAdFPG2IcKUAv8vO+WAuo2+Yjse8prbTIr
   4kPN2LrbOhqJ0yaQ1Ioq5rmHFXRg1dzlrXfmDB4DEMMrr6OXzsCiEBKed
   0zdeNnww8nfpFjUQTmH0LLbt0YWFs5K6NkCnWnSzRnupXGF/zh6zytpla
   Ck9g/jsEuMRbwcWIXkuKGbTI6KH17e8rcpmMgNSl36R8/2x4527ISz2cd
   w==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669100400";
   d="scan'208";a="198885611"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Feb 2023 02:28:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 02:28:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 02:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIvdVLWWCIdb18VczY97Lh1a/bDMCawSR4z+F4Z9hz5KzJa5Ff58UbVjDvfolzjI+oQjjQGBibwdHbuoAkj19PS0PcsLrwlB/JCndMRMPOBcEvAJOUnT0KSqyvp/tr66nmXkZiVwEtTfZ0KkzSn0Szyqkt+au9naRMREvNNkVenLbRY54jgMinWykFGjYV+l0wtrJ3i/BZUtWdEK0mVYXkX2Axdwn6+3KvufgaYBThYAOdrlFQAKkFxAvUT/nAPu5sRkBzH4jHscWJZJaAaMtooMCBBNYJ+ZttdbyXxxI8WK3CuTE3b2ZnxY1DGBf5y3gq8CsI/ZkXuWkYSh0EAqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlEpFevOI/MA1ySYZP5eNKIc7B0tGeUheOdHbS0K0jg=;
 b=YqCGyqiBw1ygzRov27pB2Qavmlv4QGnq/F4/6Cd+E1zIoFihmRlTSlOlembLnsUCsRbEFgNEuxEM6khwcIcDwuEXskrr4zVBTzK7RxbdmQAjNOK8CT7+dR+92hWOImU7Ds09hPNKTtL+DhighqKvH3oWOlJ66nDE45hrkx2xg67rLEoB+/Wz/J49Dub1KBJ+5ZPl24U92lThRHnk5ZC6OJ0TJcJ1oyWShauf1cujUrJds4ZFzxVQ8+k7VW1vUHnCvgMbBCIfuxZ7f+JCTQSik/imy/gzVDaMGx/xLTWOgVXvLgwTWR8JAtVLnUA3Y6dEdmkHUhLvc/jEPCqRSp6U5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlEpFevOI/MA1ySYZP5eNKIc7B0tGeUheOdHbS0K0jg=;
 b=ULvWIWvjLC/JLsnilWLUeQqQa7cj824+VQDHF2St1v5fYk8hFj2DDH6RfFuMGqAC+Qo8FT0YaSf//oRnYeQYfLW2yEMN9TLqol79tVdSO85QaKnDcT6R52iulNKggeUrpJztK+Z6uQlhJ/Vb4j5Ei99Le9pwIboB5TL5pWY0KGg=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 09:28:32 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 09:28:32 +0000
From: <Claudiu.Beznea@microchip.com>
To: <broonie@kernel.org>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ASoC: sam9g20ek: Disable capture unless building with
 microphone input
Thread-Topic: [PATCH] ASoC: sam9g20ek: Disable capture unless building with
 microphone input
Thread-Index: AQHZSo3bmIg7E2B8WkuEhV2zQY4+Ig==
Date: Mon, 27 Feb 2023 09:28:32 +0000
Message-ID: <854275af-1212-c236-50b0-44efb6fab4fc@microchip.com>
References: <20230225-asoc-sam9g20ek-v1-1-9baeb4893142@kernel.org>
In-Reply-To: <20230225-asoc-sam9g20ek-v1-1-9baeb4893142@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|SA2PR11MB5066:EE_
x-ms-office365-filtering-correlation-id: cb2bc001-aecd-41ae-d437-08db18a4fe32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C/soPnI404OYM0w3H9nHgpeKWjDqSf7MvI6UYT/Hlz8lz/apm1iPAKlYxBjQGKS6cnh+Q046ubBHhAwYt925Qp9hBKJWhWCkFsiFhJ8HuZUNwR5QApAgs+jvFjhU1xr5lTn4nOxD8gUI80vM2lyiPpDf1d47XZ1cdoMTpsDzxnYhf7q2EawB0IC3RY3jX6/AFiJeWRMAx6YsjDYg2wzyVx7+NNmLB9+7VPl5lpPxwC1WXUhUQE+koeJcxmI7qHVva+ksaxmjl55NE2sFBpbjAMscNcZ/Pwe6K5uB1YTHwEaaWRO1LmmVy2y7akQzcu6rYZfC25DGF3nPhOuH6h0FhJzA75HHgOTOt1pLzh8a+d0qIBwcTsJYXH0f/b4VUPrs74edq1By/aaVUG0eVZqH97NwEJFeFi1mrLm/fKsn9um2sHOeXSaIslVeHviEq96RIRbijuHOxBv85hNONNT3DXP3V186he29JUqja9BfJEwRQ7pbR241QJHq92BFAzfBlr9ROhAu/4fWFIlHLGAzYvb3UjPz+aT6D7uDOgNCSgHAxGf5+HjAlkOGrY28Ycay5l4cmqUkgTzkIGuCAlEZcwzMJT6ygMVB20I8PddvEQnrBIoYciJC79rDCIEgv7QT2JuV1N2TXhf8+YNsmBEERgMog7/SZOtZ9w1RbD26oS74oeS2kW6ZXD0cM56+FJQvV/A3mrLkhJ7gXWf/W8OOHA/WJc67Dl1fprB4GIzOgICh4nOLzmEZ5UZIeg2PgMkHsUEFWA16AseZdbqmb5kO4g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(31686004)(83380400001)(316002)(54906003)(110136005)(36756003)(4326008)(122000001)(64756008)(66446008)(66476007)(66556008)(38100700002)(8676002)(478600001)(53546011)(6506007)(2616005)(91956017)(6512007)(186003)(26005)(71200400001)(6486002)(5660300002)(31696002)(66946007)(76116006)(8936002)(86362001)(2906002)(41300700001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NzgzUjJuN2tRNlpSSy8yS3lwUVI1WlhDOTNmdnJ6ZUw3US9wdGJjcU5LNnpG?=
 =?utf-8?B?MFJDUWVYcDZrajJBcDdwS1FpS09WSUh1dVNDSmp0VmtwK2lqK2FBeW9WbzM1?=
 =?utf-8?B?ZmZoOVJLczRTcVNvUXVBMFlXaVZ1UCtxMEM2UjJCamtmcnZGNC9IQmlxa1JV?=
 =?utf-8?B?bjBYM1NVdXFvYm5TeGtlK3dRWlpGcFJTSXcvSDNCRUQ3RU9CS01IWEFNTUR0?=
 =?utf-8?B?Q3Vtb1hGUnRiWWdCQ3JyMGhvT0Q1RHJCdFYxQWw5U0tRWnA4MjBCQ05zNDZ6?=
 =?utf-8?B?bVp0RWpLaitaMEYwai8zTjU3QnZpbmd2cEYrN3VUV2hPekgxM1VVWURjOFFG?=
 =?utf-8?B?N2JBSUVBUXkzazdaZHZiQ1FINEV2aTl4c0NKdXVXUGNUYWhlTHQwbWF6UkYw?=
 =?utf-8?B?UjZyMURpbGZBRkNPbS96TWQ3T2tGTDk5cXp0UGtwbXRVcGdzaVhQd3dKZElh?=
 =?utf-8?B?aE5wcjVFN0JJRVQxdXNKOGR5NWI5UXdVUVJSUmZPaDdnU29yTWJDRm1aQUlU?=
 =?utf-8?B?UFVaM3pKYXNFRWZ2OFJ4Yk1hd1h5cjFsRzNkUFVsckNYQ0RkZHlnRC9SRkVv?=
 =?utf-8?B?bzBkUlRkeERBNENoKzdmRlJzSmZNYjF6Tm9FZWwwbFZzM3pSa3l3emJ3VjNr?=
 =?utf-8?B?MjJVUkFuMTA1SHBrQmZOMVZhd3QwK1gycGZNcVlqTTNGNDNnOUJKamJTdHQv?=
 =?utf-8?B?OXZmQ2p4a1ZXZUM0bzZZeDRhZHlDbzFMSXJEZm5qMC9uaXFSRThJZkhrency?=
 =?utf-8?B?SUhhdmdGN0hJNlB5MVZzeDk3YmZIZ1BYR1pXVnd4MTZjZlZPQkwrWkN2Vmg5?=
 =?utf-8?B?dGdTTUM4aThiWElKR1lzUVhyWWxvdW9JUDFXVjg5dkpiY0wzdVl2YmU3WW43?=
 =?utf-8?B?ZDhZMThpckdOdGJpR3BlVEMySWJCV2pIWUthY2VWUm1EdTdNK1VtVS8wQXA4?=
 =?utf-8?B?TTh0ZzRVR2Zla3d0djZaWnlCVCtON0lMZDFIUTQ5QU9MOFJnR2t2WTB6Z211?=
 =?utf-8?B?em4wd2d3OXlCcVBBVTBXTHd6bXNLMGsrcDFMOVRzOUJ4QUpsSGF3Vk9EWEEw?=
 =?utf-8?B?amkzOHNmSHNsUUp1bEh6aVROcVZaUTZkdTRpd3BWR3ZFQ00yV2crdVVqWGpV?=
 =?utf-8?B?NHpEc3c0SlZnYnI3THJDOEM5QkRUWkpZNzdSWHJuNTdDV1BGTVI2UjRyb1dI?=
 =?utf-8?B?THRseDZBVnNOczhJcnhoVWV6OEdQSlJ6aGxWWXQrK04vdUJINnRKYWhUMVN0?=
 =?utf-8?B?Qk5xYktKOHRtUTVwaVdpeWFvMUtOUTlKeE9Xa1JsRytSVm9uQjZITnlyVFZa?=
 =?utf-8?B?azBuV1FHTE11TmdNK205TWlxOExxN0hxcVpVVEpGemFUVE05UVQwdDhGWWJ0?=
 =?utf-8?B?enFFL1d1V3dMcFNObVNmTDFTVjFsMUhXOWY2eXhuUWxuUTg0MFBoazZXT1Y3?=
 =?utf-8?B?a21VRCsrRk1pQW5VZEg2Z1RkbVFpc0h4WXNxUUtJbnN0UFAvT0dOd08rQW9H?=
 =?utf-8?B?amRlaEk1MGlIU1hGNXA5Vy9jMXIrNGUyMVV3KzdpWStPTjV6OE1mR1Ztczg1?=
 =?utf-8?B?WVJNaUVoN2NSdVRoR3NEZi81a2NuV2M4dVk0QmJrY0M1ckh5U1hVTSsydVdm?=
 =?utf-8?B?b3hXNjlXbi9JQldvY2k0Wnc4TXY5dG9wMEN1M0d4UUdrS3lHd0U1VVhTTmdt?=
 =?utf-8?B?TlY1Wk96WHVqSWZFWG9TWHZrU1J5V3F5aGdBRGV1anRQN1JPY0czQWNhejZL?=
 =?utf-8?B?M1EvTzhtWjkwQVUvN2hLY1U4V0xVdXNJV0ZVbTVrZERVb2FmMFh2M3NEY3ZD?=
 =?utf-8?B?UmZDMDZUMVFDN3gxamtQVzVLMm0xTFp6V05WaG0xVlpVTUF0TEE0bXZkQWM0?=
 =?utf-8?B?M1NYbWZBd3JKb29tOERZWTlBcHRDOGdMamhWT2NDa2xBYlJadXRCUFQzVXFx?=
 =?utf-8?B?YmZjQWZ6L0VsVkVJcGxnNk82aTlzdG41ZXF3Qk9jdFdkNEltdnpsYWc5UWs3?=
 =?utf-8?B?MU11RDVoVmc2dG4rbmV4YzgweGxsaW1qSjg4eStHdEhRbkprOUJQeVZ0Uk5F?=
 =?utf-8?B?OW9sS1IvaWRpcjgzQkMxVTROR3BSbHUwREJ0djdzVDQ2QktLK21tYmhJZE1L?=
 =?utf-8?B?TEVuWEhQcEhCNE0zSysvWVF5QVhZeStEam1WeUJQSGY1RG1sbEd3RklwVDBi?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <100B0829FB8AA3458E58FA4F8B373E63@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb2bc001-aecd-41ae-d437-08db18a4fe32
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 09:28:32.1348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Kqw1qGQ6ykWpqUIqC8RTSv9d2hoAmYwqYzALnqaZnNofjMbsf0qhp+O5049KVLqxeSNp+cirtnb32UH5f3BKmeedgczSDqKS+XCWDvrvrYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
Message-ID-Hash: AXQQPNIS65IMB4VU6FBGJHGGXWYSLL6V
X-Message-ID-Hash: AXQQPNIS65IMB4VU6FBGJHGGXWYSLL6V
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXQQPNIS65IMB4VU6FBGJHGGXWYSLL6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjUuMDIuMjAyMyAyMzo0OCwgTWFyayBCcm93biB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBXaXRob3V0IG1vZGlmaWNhdGlvbiB0aGUgQVQ5MVNB
TTlHMjAtRUsgaGFzIG5vIGNhcHR1cmUgc3VwcG9ydCwgbm9uZSBvZiB0aGUNCj4gaW5wdXRzIG9m
IHRoZSBDT0RFQyBhcmUgd2lyZWQgdG8gYW55dGhpbmcgdG8gdXNlZnVsIGFuZCB0aGVyZSBhcmUg
bm8gcGF0aHMNCj4gc3VwcG9ydGluZyBsb29wYmFjay4gU2luY2UgdGhlIGF1ZGlvIGlzIGNsb2Nr
ZWQgZnJvbSB0aGUgQ09ERUMgYW5kIHRoZSBEQVBNDQo+IGlucHV0cyBhcmUgbWFya2VkIGFzIHVu
dXNhYmxlIHRoaXMgbWVhbnMgdGhhdCBjYXB0dXJlIHdpbGwgZmFpbCB0byB0cmFuc2Zlcg0KPiBh
bnkgZGF0YSBhcyB0aGUgQURDIHBhdGggY2FuJ3QgYmUgcG93ZXJlZCB1cC4NCj4gDQo+IEZsYWcg
dGhpcyBpbiB0aGUgZGV2aWNlIGRlc2NyaXB0aW9uIHNvIGFwcHMgZG9uJ3Qgc2VlIHVudXNhYmxl
IGNhcHR1cmUNCj4gc3VwcG9ydCwgZ3VhcmRlZCB3aXRoIHRoZSBleGlzdGluZyBvcHRpb25hbCBk
ZWZpbmUgZm9yIG1pYyBpbnB1dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJy
b29uaWVAa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYUBtaWNyb2NoaXAuY29tPg0KDQoNCj4gLS0tDQo+ICBzb3VuZC9zb2MvYXRtZWwvc2Ft
OWcyMF93bTg3MzEuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL3NhbTlnMjBfd204NzMxLmMgYi9z
b3VuZC9zb2MvYXRtZWwvc2FtOWcyMF93bTg3MzEuYw0KPiBpbmRleCAxNDMwNjQyYzg0MzMuLjc4
NWI5ZDAxZDhhZiAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2F0bWVsL3NhbTlnMjBfd204NzMx
LmMNCj4gKysrIGIvc291bmQvc29jL2F0bWVsL3NhbTlnMjBfd204NzMxLmMNCj4gQEAgLTk4LDYg
Kzk4LDkgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rIGF0OTFzYW05ZzIwZWtfZGFp
ID0gew0KPiAgICAgICAgIC5pbml0ID0gYXQ5MXNhbTlnMjBla193bTg3MzFfaW5pdCwNCj4gICAg
ICAgICAuZGFpX2ZtdCA9IFNORF9TT0NfREFJRk1UX0kyUyB8IFNORF9TT0NfREFJRk1UX05CX05G
IHwNCj4gICAgICAgICAgICAgICAgICAgIFNORF9TT0NfREFJRk1UX0NCUF9DRlAsDQo+ICsjaWZu
ZGVmIEVOQUJMRV9NSUNfSU5QVVQNCj4gKyAgICAgICAucGxheWJhY2tfb25seSA9IHRydWUsDQo+
ICsjZW5kaWYNCj4gICAgICAgICBTTkRfU09DX0RBSUxJTktfUkVHKHBjbSksDQo+ICB9Ow0KPiAN
Cj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogY2FjODVlNDYxNmIxY2Y0YTkwODQ0Yjk1MmI0OWI5
Y2JjNDU2MjUzMA0KPiBjaGFuZ2UtaWQ6IDIwMjMwMjI1LWFzb2Mtc2FtOWcyMGVrLWY0ZTc3NTIw
NWQ4Yw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+DQo+IA0KDQo=
