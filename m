Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7ED919C02
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 02:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD25E1933;
	Thu, 27 Jun 2024 02:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD25E1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719449137;
	bh=0JryT4YA1DrtyAnbCxqtkGlaHBFyQguCpzskjxllASM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lJvoL1yrbEldetwYJUzyRRAU73p7IENnwlh99ahfbIk8OjKlSg3JRsXcGwDeLFPOg
	 E1MGIhyDCxGdVth2kxPjSFOx19scmUES6XFwK7BCxro+SNmSt3wv9pHZuNozDx2dys
	 zHIzXuMH+7NOaAuXK/7UtGd1orpecKSvKvzYVSrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38658F80588; Thu, 27 Jun 2024 02:45:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1934DF805AF;
	Thu, 27 Jun 2024 02:45:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4996EF80423; Thu, 27 Jun 2024 02:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62C98F800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 02:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62C98F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=gv41sKyC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8kB6xAQcdoOLSnY6yhUUXLYbeE3fiK3sEYcEXYBFSKt8aLMiYdAhpK2p4deZBYxz3HIkT91TzfZtnMkrEqlVYWFWk8HtHYoKApsEVPFqaZxz7pNw/ItmH900rVD0C4IQmZy6XCL1IG57SexH87KcAm9n/DCpca6UqL/Nbsr8tZqYqnNr2BnW20rUPv6yF8k1AE/PWr3FRPjo8eFkEGGhyqQDVy5pY65J+QGyCpMVplrhQLbPYCeZESJcZwE1xDITKMUqTYAnUP/1GVPH+YaxjgNhHciTOtv+DX/WfWqxbNKBx0X7bVym7WmrFkPcUrbBUefJFFdoQxMFxVMV5pTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GioBg8iFHg2oSsqCZKw+ulKdW7ZJd4S/xk5QMOOjdu0=;
 b=FH7M6NVWhrMTOTteZotu35F3aZO/wMkJwiV/E36y86m2dw9rRYgPZgNlpZQmNRFD5xTxC4MaUat0IzWJenBGyT7Pd9CIiJ6NESWkToRP7mefkkm+PuMXx4k6qCINtbmIwOyJdmU3ra6Ds0jtfQQGMDAW5B+bnhqA446Pt6GggWSEnqXwyDcDjFzqkrFADI+KbwfJtVe4yjjm7GdrIkGnbKNH3qFJWiBxiZi4wPve7pmAdsn3cu3v2FmaI3QA3tdygl7wnJATeHSNuANtkEGcoaiAmTaSNE1oppR8ZvTiBQRkrtG2RDhyWu+La7UdYCjqDEt6RKU7HkEbmjaKCnVnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GioBg8iFHg2oSsqCZKw+ulKdW7ZJd4S/xk5QMOOjdu0=;
 b=gv41sKyCJ3Pj7mbBVWfV/n+c4IVmIMa/Z8NL+EG7LxUDIkCDUgCwuKHgR6Ov9SCa8eyYeO9IHn8AG+d6nDdfb4RyecU6mgxUwSj1lyzotTdi51T1jkQPs/JWfy3eY47h9lm2H540y/u7yw4dkfw4JJSon9bkbPIn9Ii9rI7juV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from TYZPR03MB7241.apcprd03.prod.outlook.com (2603:1096:400:289::12)
 by TYZPR03MB6493.apcprd03.prod.outlook.com (2603:1096:400:1ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 00:44:42 +0000
Received: from TYZPR03MB7241.apcprd03.prod.outlook.com
 ([fe80::9e4c:d25e:d8a8:f65f]) by TYZPR03MB7241.apcprd03.prod.outlook.com
 ([fe80::9e4c:d25e:d8a8:f65f%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 00:44:42 +0000
Message-ID: <30267661-fec3-ec5c-4973-8b2013f14056@nuvoton.com>
Date: Thu, 27 Jun 2024 08:44:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] ASoC: codecs: nau8824: Add master clock handling
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lin <ctlin0@nuvoton.com>,
 Seven Lee <wtli@nuvoton.com>, Wallace Lin <sjlin0@nuvoton.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20240626145931.25122-1-fido_max@inbox.ru>
 <20240626145931.25122-2-fido_max@inbox.ru>
From: AS50 KCHSU0 <kchsu0@nuvoton.com>
In-Reply-To: <20240626145931.25122-2-fido_max@inbox.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To TYZPR03MB7241.apcprd03.prod.outlook.com
 (2603:1096:400:289::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7241:EE_|TYZPR03MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa4ee1d-0658-40cf-6f85-08dc96425509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzFFYXhHSktSeUE5ejdTaHZXT0dUemJ6WWl0ODRNbnpRRlJEdlJIQ3pGaTVt?=
 =?utf-8?B?WVdlOGNZY1FlL01RUUJOc1ZrMVB0eElZUkFyR3BacDF5eklLaFQ3VjNLaGlI?=
 =?utf-8?B?MjcxUXdMUzBCYmtKZm5oWDdpVXNuRlNpR29YUHIwaDlxYWhpUjdLaVBQWDFH?=
 =?utf-8?B?a2pqbGtNb1pQaUprYU04b1p1Z0Z2VGZjckJEWHU0aC9LakR5eWFZWGptYXI0?=
 =?utf-8?B?SEJKR0F5dmdVaDNqUWQwbFh4VU0xSmdrdGJvTFFhM2JMcFRJMEtQeXZrYnUx?=
 =?utf-8?B?eVpEMFpuL1pGREtkcTBVaGZjSFltZjJIN3BOWGIvQTRoY0MrUkdaUFlEOUFz?=
 =?utf-8?B?OFhUUUdOVnZaajQwWTVySTRJdWtueE9nbzRRa1hrWXllT0t0S1lyeTN0TEJl?=
 =?utf-8?B?bk9nZ1I3R1lJZXpOQWRnMUs1eDlxU1Zta2ZGZExORFlyTlVwRGgxdDdkbU1K?=
 =?utf-8?B?TjQ0K2N5WFJEY1JYbTdrakE2dnZHckRjOVNURHIxRXRXbklzOXRYS09uVDVP?=
 =?utf-8?B?NjMwalJNb2VnMStNQmFPYnFRTlpWalA5SVhWTllwRVZPazZ6d1dMejMzRzdT?=
 =?utf-8?B?UHRKV2lwR3ZGaHRFU3R4d3Z6ZzExdVJDc1AvYTlQdCt6UXlvZE9BUHVaTUxy?=
 =?utf-8?B?WmFMRkpCZVgyOFVyMnNkTVRYL3cwWFF5enNCSkxielZxQlpncmtpb1FObkRK?=
 =?utf-8?B?UGtZRE41N0MrVWhpMnpIM0NELzdjMkZ5dmxsdUJTbFhTVktIdEpxRys1UUhy?=
 =?utf-8?B?Q2YvK2pLRWttTUN0LysvSkZ6aENNS1VYUXUxQm81emc3eFJwZU1ZRHNjaUlC?=
 =?utf-8?B?cWhqMDVZYko4OTZHaDFRRW9QbUhKL2pkZ2R3bk1EcWR0S3lUOVhXSGJqemZM?=
 =?utf-8?B?RWlQWEh5dHRzSnpNN2JUSGFmTFV2SHkyUjVJWXNSOE1EYVN3S0RIN3pvVm5s?=
 =?utf-8?B?TGtiWHRmbXBnUE8xNm9uOEpvMURBbVJQcmZCLzNINDIvZHJEd0dnbjg4azZo?=
 =?utf-8?B?aE5rRmVDZDZ0MGhiWmNSVjNBZGlpcG0ra0QyMXlGeTVSc0lBT1kvLzVJSjh1?=
 =?utf-8?B?cjJjSHoweThEOUR4U0VJdkxlZHcxU1pNUWhYd1JSMzk3Ui9OVnNtSVhUTWNs?=
 =?utf-8?B?LzE4c3pKL1QrWDVZdmFGTUlZQW1FWmFhN0xHcERNRVFUUDhLRzNkSm1nUnFv?=
 =?utf-8?B?ckJBQkFtRTdjWmF4SHVTRnBhd042TlROalBlaTMySUxVMlZGc04rbU83U05D?=
 =?utf-8?B?OXNPQi9jaVBEbWpjQlBsWmpaZlNXZHNqNUVTLzhkUDQ2em1OT05JcUh2dmw5?=
 =?utf-8?B?R3Z2bzI5M2tpZXV0UUYxQ2NSajNiU1d1U2Y5VVFCcGplU3MvcTJld3ZtelJ1?=
 =?utf-8?B?TC85NElBOGVxMmhRc3RIRUdTWERjZUw0REtXaTVqUkVVT0I1UWZEYjlkbmxv?=
 =?utf-8?B?SVJ5SUYxQWhSc1BoMXJUMFJnbVVLMXpEeTJ0TFdQUFBHRlRlN2lyZUFjUSt4?=
 =?utf-8?B?S0c0MlpERlYwNXZaWDVIQVB2T0lodHcrdXBXcFM2Tk1Gamh6NjVaRW1BSUtX?=
 =?utf-8?B?U1lVcFVyWlprOFpjYW9xUDBBaS9seTBQcG12TlNLQ3dPSmUybVdlSDVXSkxW?=
 =?utf-8?B?NE9LTFZZY1liMW83cU9ZWFBra0pNWkwrano3S0RDV2FPYkF6UCtpMSs5ZlRn?=
 =?utf-8?B?bEdTQmh0VUVmU2Y1U2p5VGZlTlR3dm1nUnVLQUwrVzJBTkowU3k1cFJKTUwz?=
 =?utf-8?B?azVYS203c3BZbjNjdXVnd2ZSblRoZUxHeVhLSS9DdVc0Qi9mNm16c0Zmamll?=
 =?utf-8?B?VmFWVDE1WTdsejRBWlhWRFExSEFtdHluVEdQN2ErUVJFQzRnaXQzd1V2aEZC?=
 =?utf-8?Q?eTSIP48/xckn+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7241.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFR6WlBuSnRLM3Fzd1FDdkxDQ1cxS204bllPcU9jVHZrcVNwRWlES1NUaVhB?=
 =?utf-8?B?YXQyblZrU2NNOFFDL3oxL2RxRGVyRHluWEJndlZSQmM1Y3ovYlI1QlpwKzhQ?=
 =?utf-8?B?RnNjWitzK2V6RHV5dmk4NHZ1MXhJbFI0ODV5eVdKcVh4M3o2aEtDV09randv?=
 =?utf-8?B?VlZmem1JblhXMnRBTndzZjJyTVJlVlBkTzJ0bDFZNVF3TXNFZEd2OURRdUFW?=
 =?utf-8?B?eVVlM21vdEhqMXpUVWJ5QjlZSGNEZ3dRZ0Q4K1FLc1FMK3A3NDlTQjNqMTVC?=
 =?utf-8?B?MnVaZnlHMEJuVXlSa0hmS2ZNQ2hoa3BsZ1Mzb2ZDaXJYdjd6MXFKRTMxUnkx?=
 =?utf-8?B?NWt6WFMxKzZzM0ZsSElDSE9JU0VSd2p4VWFFcE1GcHVTZnVmRFRSRVhUKy8r?=
 =?utf-8?B?Uk1QQlFKMDY0Y2N0RlJMc0lkTUxTV0ozM1RpWVdmNGplb1RIQVZQYktiQlNt?=
 =?utf-8?B?Y2p5UmNtaDdIaGovdGVrQUdvMFRvTjRxRHdJY0VwSTRJKzJ6bGNRK3hhSGxh?=
 =?utf-8?B?N0pKY2dtU1hyS1hnbFNZZ2lpaEtSREN1RS9CTFNkQ0hSL2R6SXVNWU1OcFNZ?=
 =?utf-8?B?RlNQb2FxN1JrS0owYnY1azdybGxDVEpkcVg0SC9WdC84Zjl0bnJGbi9xUEJT?=
 =?utf-8?B?akxMWXFYY0xGL3hkaHlFRWN5MkYzdzNQM0kwR1NEVGZlZFR1TUdRdEZYQmQ3?=
 =?utf-8?B?SnlrelZMR2Jzbk5kWGVhYVVCMFo1aE92bkYwUklpVU5nenRZTUZ6QzJ4MlBm?=
 =?utf-8?B?UTlGVitWWGJrZnV6QXZsNnY1VWhXYzB0dUp6ZE5BRjY2bENBYXVDVXNqZWk4?=
 =?utf-8?B?V3UzY3F2a2UwK0FxMFdSVWYxaDRWVi9YL2FDVVgrVUJST0xCZ29Na2xWQlZo?=
 =?utf-8?B?bjB1TFRwQXhKOW1kNFBnMEJSUW1DRWZNNjFSYUl2RVNRTE0xZEd0V1ZTV0Nw?=
 =?utf-8?B?dGx0ZmwyeURDQ2oxRE92SjBQZW5rRGZBcEJaYk5MdU5SK2Ixbk40dE5TTGtv?=
 =?utf-8?B?dVprd3lISGcrL2o2RnpEV1k3OXB6bU1DbnNYN2thQmhIMzU4MURNc09MWDRN?=
 =?utf-8?B?RTRYbHdDR0ZOaXE2dWhIUmYrMysza1ByVE1tcm55ejd6ZkZKSWV2cW1wR2ZQ?=
 =?utf-8?B?K0hIZ3hWU0tmOWdWZGMrMEVPcXo4UHY0SHlUY2pzYldJTnlVZTg4S0ZUNDJq?=
 =?utf-8?B?cldDei9tV2NQMEY0Nkg3QUx1TzdOLzNiY1FlTlpOT1E2aGwralhscTl3azhn?=
 =?utf-8?B?eUJ5emhiNWdPaVBCVXF5R1k0ZmtLWDJxRi80TjJlbUZRUmw0N05NU2tSY3Iy?=
 =?utf-8?B?Z1VxTzVKVUZxQ0s5alJ5Zy90dWtSUTh5dDU1SDRKRzUzV1BremFiZmlEUFg0?=
 =?utf-8?B?bmY1dWpjMXpkQ3FmQ2E2KzFyU1NYd0V2Nml0dGxYRDZJTXFCM1ZwUHZUYVZB?=
 =?utf-8?B?VGhZL1I0UHZ0NXZUV05LcFlwSXJnQTlWTDRHaW0wVDVMaStiT1U4YWp4WFhR?=
 =?utf-8?B?UnI4V0NMV0MvN0xqT212VkVIdzhzS3REczY0WjRGZWdyaHZiVE5QT2dhQ3lV?=
 =?utf-8?B?YjNZb3NvMmExUkdLd2wvanM5bFJrd1V0YUNzZXhaYzQ3UjlzY1AzLzlnWEdr?=
 =?utf-8?B?TmQrYXhqc1hIb2tIRWo3WERUc2hOVzZGbUVvakFHOWk1M3p0a3VGWFBEWmts?=
 =?utf-8?B?Ym1GSFRKTk1icTZGbGM2cWVqeUhsY2h3WlRXUnJFVWhPQkVUKzdXNGpLUUdX?=
 =?utf-8?B?elNiM0t6ZncxbVdDc0RhRS8vNk53SVFZaHpzT0xOMWRTYmIxQ0NPSGRBN3Zh?=
 =?utf-8?B?cXViV1phZnNBZ3k5MGhSRGlaMUdrclBiNjdZNFRsRm5XWDJZNHovR1VvS2VT?=
 =?utf-8?B?Y3oyeDF5NzFtOTRKVUlrNnREWFo2eEd3ZXRvOFdwNGVRL09HaVF3eWNoVGlE?=
 =?utf-8?B?ZzlXNjZwUEZ1SW1pSXVLVDFVVS85Z0tsRG5pVUFQTG9lK2hNUThJeE1qZGdW?=
 =?utf-8?B?ZE9kTmRKWWpoWlJySndvVC96YmNYWDFQd0p6S2NnVjhiNzNKOFJBMDFkRlBk?=
 =?utf-8?B?TW41NUpVS1BCQUlQVVNQUFpQNTh4YmRyK2JwdDROL1RpeGVJTjdaK0s2MHdy?=
 =?utf-8?Q?HZdKqzOpdbJiKDzOPGfpOS3Xh?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cfa4ee1d-0658-40cf-6f85-08dc96425509
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7241.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 00:44:42.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u6TIj+dLPLqLJVHvG/buUj5VMimavqW5AFjlOLEocR0/XaAnvfa4/KMvdAtZxrYKXFEFGC9U/pPgxQQge1wRcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6493
Message-ID-Hash: SVCCNT4FWUBYIE6EYMMKB3LKAUBQTM6D
X-Message-ID-Hash: SVCCNT4FWUBYIE6EYMMKB3LKAUBQTM6D
X-MailFrom: KCHSU0@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVCCNT4FWUBYIE6EYMMKB3LKAUBQTM6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 6/26/2024 10:59 PM, Maxim Kochetkov wrote:
> CAUTION - External Email: Do not click links or open attachments unless y=
ou acknowledge the sender and content.
>
>
> Use master clock "mclk" if provided through device tree.
>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>   sound/soc/codecs/nau8824.c | 21 +++++++++++++++++++--
>   sound/soc/codecs/nau8824.h |  1 +
>   2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
> index f92b95b21cae..c66b0a5a7448 100644
> --- a/sound/soc/codecs/nau8824.c
> +++ b/sound/soc/codecs/nau8824.c
> @@ -520,8 +520,15 @@ static int system_clock_control(struct snd_soc_dapm_=
widget *w,
>                  } else {
>                          nau8824_config_sysclk(nau8824, NAU8824_CLK_DIS, =
0);
>                  }
> +
> +               if (!IS_ERR(nau8824->mclk))
> +                       clk_disable_unprepare(nau8824->mclk);
>          } else {
>                  dev_dbg(nau8824->dev, "system clock control : POWER ON\n=
");
> +
> +               if (!IS_ERR(nau8824->mclk))
> +                       clk_prepare_enable(nau8824->mclk);
> +
>                  /* Check the clock source setting is proper or not
>                   * no matter the source is from FLL or MCLK.
>                   */
> @@ -563,16 +570,22 @@ static int dmic_clock_control(struct snd_soc_dapm_w=
idget *w,
>          struct snd_soc_component *component =3D snd_soc_dapm_to_componen=
t(w->dapm);
>          struct nau8824 *nau8824 =3D snd_soc_component_get_drvdata(compon=
ent);
>          int src;
> +       unsigned int freq;
> +
> +       if (!IS_ERR(nau8824->mclk))
> +               freq =3D clk_get_rate(nau8824->mclk);
> +       else
> +               freq =3D nau8824->fs * 256;
>
>          /* The DMIC clock is gotten from system clock (256fs) divided by
>           * DMIC_SRC (1, 2, 4, 8, 16, 32). The clock has to be equal or
>           * less than 3.072 MHz.
>           */
>          for (src =3D 0; src < 5; src++) {
> -               if ((0x1 << (8 - src)) * nau8824->fs <=3D DMIC_CLK)
> +               if (freq / (0x1 << src) <=3D DMIC_CLK)
>                          break;
>          }
> -       dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, nau8824->=
fs * 256);
> +       dev_dbg(nau8824->dev, "dmic src %d for mclk %d\n", src, freq);
>          regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
>                  NAU8824_CLK_DMIC_SRC_MASK, (src << NAU8824_CLK_DMIC_SRC_=
SFT));
>
> @@ -1510,6 +1523,10 @@ static int nau8824_component_probe(struct snd_soc_=
component *component)
>
>          nau8824->dapm =3D dapm;
>
> +       nau8824->mclk =3D devm_clk_get(component->dev, "mclk");
> +       if (PTR_ERR(nau8824->mclk) =3D=3D -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +
>          return 0;
>   }

Would it be better to move the retrieval of mclk property to the
function nau8824_read_device_properties? All properties can be read
together.


> diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
> index 5fcfc43dfc85..d8e19515133c 100644
> --- a/sound/soc/codecs/nau8824.h
> +++ b/sound/soc/codecs/nau8824.h
> @@ -434,6 +434,7 @@ struct nau8824 {
>          struct snd_soc_jack *jack;
>          struct work_struct jdet_work;
>          struct semaphore jd_sem;
> +       struct clk *mclk;
>          int fs;
>          int irq;
>          int resume_lock;
> --
> 2.45.2
>
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
