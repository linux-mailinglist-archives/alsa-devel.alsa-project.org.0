Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3D42BA0A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 10:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129551693;
	Wed, 13 Oct 2021 10:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129551693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634113041;
	bh=95m3KnwmwCS/v/U7123irAVjAhl2OtSvPzVirdG7Kzo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAAzjYmqjnzOz7ySpabHg2DvPkzf2kmmpR0PrwiYXU+EY9bnSlDQRSnw8Isc622V4
	 /HMm9l8wf3j6ysGuJ9lifUgQ4u4GT4hNFzB1d38/VWb+QmhNc0I0c3OrHtFbB8r+eQ
	 ymjOAooVNCiFpnksnq9AeeeonNz+rN9KDrvD69T4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78B59F80088;
	Wed, 13 Oct 2021 10:16:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70EECF80269; Wed, 13 Oct 2021 10:16:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332ADF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 10:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 332ADF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="lM7kasRd"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="TmvUGt9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634112957; x=1665648957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=95m3KnwmwCS/v/U7123irAVjAhl2OtSvPzVirdG7Kzo=;
 b=lM7kasRdOyGmVdlJHPTz/z3yyPrUgBgZo7PPxJHTrwD49inWmjbv+IAk
 NLTmKhrqOLCrXVfdCb7uAOaSu79W6IEWKiKGBCGa5zWG4RpbCs5uuj+Rf
 CuRxRx/WHkKYEXaY347snzErYQh1CkJ3UJ40zyEMTjX+4d1a/06aaGgmb
 ckq4tzQhuxRRtuLGTIwGmNk9LLSNeiY+0sMBCKbaofYZX2ZyR5P+TTIar
 f9Eg18ar+rOtoBg8q+OrjBawKEgDQG1uamUq0y8xVk94f2yVSWWoXHHbQ
 j+78d+FwdmFZClsFs0TxGIsDUOsTw5zlSjoVXoQu2vFLU2oKYsgLF111E A==;
IronPort-SDR: whFJKnvvdRSR7UvY6k92qb/BQYtHLevfl2ugBqal400wwUYMWkdk8EgWPCNhh6kT4rE3rjPd74
 sW3f3EcfCl32hvqpqZ/+dvs5m5rfZ1/sRN26O9xRNW7hMHym+0kN+fvmoQXJm/zQzEwR2q8ZsH
 NaC8T4OCDrIhBRpgYOM5ja5QGEoeMtWcK5P4SO8mFvWtdbcr9fFOXZ0RqiDqw4Q6Q5NzA64bz7
 bBsRUKukT1NPJwg4ad7nZ0ir29bpDbG/5273bVZAOmsoyp7Sw2xFaIqhHAmcBb+xleESq5Fqz8
 RdaWBxrbszTnirledMmR/ENw
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="132822699"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Oct 2021 01:15:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 01:15:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 13 Oct 2021 01:15:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btWKK6EhPbLOCvMWJDbwPT8JOOfezYeyRES2AXbsYJzTnqHu8QTCirg/4Ojz72W+hlVFIyyH7k/oZV5lYGV1F66qDM6/R+tcO3Sv+he8lsbWKBgf1dCMQjGyc/b61yvJtIJfZvUKM8sTqJjUSox/+zRYSsLlgWSYj24XBv1sF8dSP3IuVO7xTfNf8LmMp2nbVw+PysSnG24TSQUctcbJt//1N3P794YA4dBvxu/MrQQrfHyhcdntLoL8Z0Dc2r3sKbQh22O3P7s2ZiFQsWXOuNFfsZ0R118sOusXsBD3RazePtxDMubspUd2LZAsOxhvXyW3bDyVhB6/sYEDBb4TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95m3KnwmwCS/v/U7123irAVjAhl2OtSvPzVirdG7Kzo=;
 b=eIJSCXdyN+xCBY6FMpmhVG5BcIXtPLG8yb3fzEt4Pk8PNDM3LNwqY1LJT+WcR/PExqdL4t+A2NeKQNHRU5NfjZHTEzRW1encbVvuqpTRS9WoC0P1edhGMljOGs/3/bOIsBHQzcIKsfNCPOvnK73uMByE65jDC7O997003qKYkzBxieav5th1/DT8UdcDGXOxMYqARqeFxPfnEiFVcQFBEqoOa4GPKo3KLIrsrHoAUqaIO7xMvgjEbsCcQn3X+P6kgn6aOTaX2xBPgsZbyaC8CU8VJ+exFnoRLGn3xzytLvFgOiLULzecxEixiu1t929H2baLzujPvpIbtTl7lf63Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95m3KnwmwCS/v/U7123irAVjAhl2OtSvPzVirdG7Kzo=;
 b=TmvUGt9YtwLatax6HQ+PA+rvQ8PyGNhlnhwH+z7vWw5wu6mPQ1GW9tmagU2fcMqFV4T20CUrrxtE3cEZ3fqTPnq29HeNw0KgZThzcNrQKDXgmctrCQqY8hGSMzQyJBTLwQydG6R/wJRaWwKRgqQXV13vLO3umCr3jKQNVztytf0=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM4PR11MB5470.namprd11.prod.outlook.com (2603:10b6:5:39c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19; Wed, 13 Oct 2021 08:15:46 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 08:15:46 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: atmel: add COMPILE_TEST for SND_ATMEL_SOC_PDC
Thread-Topic: [PATCH] ASoC: atmel: add COMPILE_TEST for SND_ATMEL_SOC_PDC
Thread-Index: AQHXuANXAhRXehsB4E643JcWeyvgl6vQpQUA
Date: Wed, 13 Oct 2021 08:15:46 +0000
Message-ID: <96c810cb-f7e3-d9ff-9713-7ec007ebb599@microchip.com>
References: <20211003030357.32456-1-rdunlap@infradead.org>
In-Reply-To: <20211003030357.32456-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528c7caa-c805-4f83-b546-08d98e21a8be
x-ms-traffictypediagnostic: DM4PR11MB5470:
x-microsoft-antispam-prvs: <DM4PR11MB5470B5F3B1F1F58F9CED5B47E7B79@DM4PR11MB5470.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jR3LFcS1so2l2vNZFIXD8QehENaN7Mb/XWQ+W+QFCi6MdcG2dq/+6Cgsikr1TVryyD2IbUsFVYSubOeTgN51GBL2iT55iHuOxTRnjLJal1phIxA1tq+2jgL+TLvfqwKyBgNDMs/1bnt1fBrh9y7oCREQoh3+uyhQMQuHcljhtl35enmJfahVo+K5OyTzvG8RfnPalw5qcZ1XNJ4/Cg4l5mzrc9YqbdtKV4Bfto582//1z3O07W0QQg+dV/pSIN+7KpazZnp+qGVfsAeoSgPFQQrJPw/an654QtKJ+qNGud4mrhigHZNOG+X6l+O6Fxgmq9egOddz8XDaaX8YmYEA2XHwT5Dl+85t0YwDD8xuCsMiEwZS58ATeIXOEXYsyVQXxzCNBAEvxaiFaunqPY82fjVzbd/X3HKGvOzyjchQSDygVjkxEh4vIXbp1/RoF36W1HqrpYQE1Xi6mKDiBkXKdQaodHx2hlS1+mGpkiG1HEMLhw0BGmxkAmmutRw8X9qrl/M1owUBWl+oJhxGdhZspqX04qsrolAdwDt0bc1iizXGFmgcJ1oztnwhu9k13GZl+OsxvkZpRqosB94vj2s+tmwMZX7I+t5Mt2jt2SQpCXP/dRVTPC6qMl5GVEfw304imPYW/i/jE6/AGHJf9VRwaZNIrFiog/ugJ4BJLh9TWTspKIOQw9tOieZLrVghVubwyYQLjVlrQYK1we9E/2p7aZTlNK2lOqdC21FAW+V4UTUIgpuN7Ce6vN4ZpRkMIVlPjjJdIscqi3gqnTvlXGzb6fxQtEjYWj3yD6Dtg/CCfAWPkNACPwQj1YnKmppsmBT7GzPRg1O/kOukRPGJvWe2CHQGsjXIF9wnwDzoqFE1GHQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(66946007)(66446008)(4744005)(66556008)(8676002)(66476007)(54906003)(76116006)(110136005)(122000001)(64756008)(2906002)(4326008)(31686004)(508600001)(31696002)(2616005)(5660300002)(8936002)(38100700002)(6486002)(36756003)(91956017)(6512007)(316002)(6506007)(86362001)(186003)(38070700005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFEyS3VuNGdTMFhGUUlWSmR0aEZCL2U2Vm1IRE5aaTdDK3l6UThwbk9ReWRW?=
 =?utf-8?B?Q0paaFlvZzYvQTVVbG9SZHNkS1Ixd0tXa0srdlFzQTYrOFhubk1mUCtWUEJ0?=
 =?utf-8?B?UXJ6QVREWDY3QlZBVzRueHNCTXpRU3gwaGwva2ltZnY2OG1ySi82b0pvcHNU?=
 =?utf-8?B?TVo1MmFncWpURE0zamVYY0VEVmVrazlKS3RPb1RTUGxVMEVYa2pTRjI5RVRv?=
 =?utf-8?B?b1VQcnFlYkNXNE9ScnZTNlRSTWw5bk9iUGdqeUp1SGdac2xLTHNwWGZMdUlX?=
 =?utf-8?B?Vmx0RnVlbkwxdGJvQTIzRmNJVzhKWkxDeDhyamdRM3Roa3FUci9KUU1CZVU1?=
 =?utf-8?B?RndSbDY2WmRuRDRsclo2cFFLRmZlcTM4NU9ON2w3NDJKVlVSZlR2QlhiLzRx?=
 =?utf-8?B?bCtIRkZsZHloSGg4UzAreGVRbmgwb040Z1V6Qm80YzlPQmkwczlDNTVZWmRG?=
 =?utf-8?B?QVIycHdLa0NYNTdFNkZjemJBd2lMb2lrYmtRWElCUzNHN1ZLblVaMUoyZlhx?=
 =?utf-8?B?V015WXVvTWdFZVFKTzR2M1Zrb0x4WXVMMWluU0ZmN25FTFZWNTl0ZFNzOEJN?=
 =?utf-8?B?dzEwVnBZZGxhUFFjNU82UGN0K1JrOXFDSHl2Sk0wUWRvejd4Yzc2MVZyNnBs?=
 =?utf-8?B?UHA0ekpsa0lOZUxPM2JMcmJhTXBWOTJxaW9ONW5VaEFGT216KzNJeTZ3YWJO?=
 =?utf-8?B?b2dDWEQ4SUFYK0VYSldzTVRTUXlsWk1aaHI0VjUrUGdueEh0UU9EUEJTTS9z?=
 =?utf-8?B?MDM5UWpVa3BJdDJXVDRIVGtjeDRzS1NRTlNKZ1U5bVMxZklOQnViaHRCUHI2?=
 =?utf-8?B?cUxhb3hBV0Vqa2xCMHpsQVlsWFdPdzBuaFdERFBMc0o1cXdIeHBJNUYrYWQ2?=
 =?utf-8?B?Q2grNlZlM3hSZk5zYnJ4c1dEVk5zOHJMQmhsVEViWnlra2E5OGdRVkNvdmJB?=
 =?utf-8?B?d2Y4dmV2UVpPUHNqL1piY0E0b2IyTjNrNERYNnNzK1ZLbmJqWUEwMjBJcWJt?=
 =?utf-8?B?bHhYRFg0b1R6R0cwckJSbnF6OGtha3lzSkkzQ29BcWJjY3pZcTl0cm0zVDJu?=
 =?utf-8?B?U3piMGM5WnBWMWhTdGI1RTR0aFJXeG9EY3pHTnlhOElIa1ROdzdyUjl5bDVw?=
 =?utf-8?B?QnlIZ0w2S25tdzN1cjBWRUZIeWlCY3NmY3FLWUJKd2VkYm9MajBhMFZtNndK?=
 =?utf-8?B?TWl6STRqaHkrT3N3TmlpTEhPdloranhhMTZWdWI4THZFTG41Z3IvRWZoaHY5?=
 =?utf-8?B?RXdFRm1kWlRDVUlMQmtReGNLVHB3S1ROb0xUbnBWUXFYT01xUUM3a3Nicjhq?=
 =?utf-8?B?cFcwM0lIbTh2dGhPS0dyN3lFVkNlNlBLWStYZjJjN3dNdnhQNVBtVDVoZVdC?=
 =?utf-8?B?V2xBVExxNWQ0TmVOUkpqNGtEN0UrSmNyOXZyVEZYaHA1SjFpd2dTUTAvc2ZG?=
 =?utf-8?B?cFRQU1VIcS9PVzVqRlllemlVdXh1M3lUWW90K3hwTm0zMGlFNW9RcDNuMEdp?=
 =?utf-8?B?cmRHeVAwd1Evb3A5L2hsL0tmOW5FaFhxUkw4U1pIZXVabWJoVS9RQmhaS2Zw?=
 =?utf-8?B?cENsa0wveEg5bm5xWXBkeGN4VUtTUy9PZXEwTVBkU05DMG9zQWd2TDMrOVVE?=
 =?utf-8?B?U3owTDNDRCtDNWpYWkkyejEyZlpPdWhKeFVWcm5GZUwwQkRCOHR0aVF2RDQv?=
 =?utf-8?B?ZHR6QmlHQ2RNRERQU2F1Z0lBQlZmZVRBamxUYy9vYnVDcmFCSXZpQUlseU9p?=
 =?utf-8?B?aUlmR1pjeUpjeGplTGozSzNzUm4wZXZFdHR4NzM0MXBpVlllNUNkN25aTkUy?=
 =?utf-8?B?UlU2bU5PREErNlZDa0Q4UTZXblczOVpzTElET3pLcmFlRHV0QnEwb1ZJQkRC?=
 =?utf-8?Q?WvJPf5nqA+rgY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <347E9A158C2F8840B69024BD73F1D972@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528c7caa-c805-4f83-b546-08d98e21a8be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 08:15:46.5203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5y3gYhm64ZItxl5JxjaX1qhZcsPTNaHlayETX2X4WfRpZb2+Cuz3EXE+/gp50rmlSK/zyXf4yxEQRSroykaUgQ7pvo1xnb2UAk7zk1MQFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5470
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, geert@linux-m68k.org,
 lgirdwood@gmail.com
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

T24gMDMuMTAuMjAyMSAwNjowMywgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiBHZWVydCBwb2ludGVk
IG91dCB0aGF0IHNpbmNlIHNvdW5kL3NvYyBoYXMgdGhlIHNvY19kdW1teV9kcml2ZXIgZm9yDQo+
IE5PX0RNQSBwbGF0Zm9ybXMsIGl0IGlzIHBvc3NpYmxlIChkZXNpcmFibGUpIHRvIGhhdmUgZHJp
dmVycyB0aGF0DQo+IGRlcGVuZCBvbiBIQVNfRE1BIHRvIGFsdGVybmF0ZWx5IGRlcGVuZCBvbiBD
T01QSUxFX1RFU1QuDQo+IA0KPiBUaGlzIG1lYW5zIHRoYXQgU05EX0FUTUVMX1NPQ19QREMgY2Fu
IGRlcGVuZCBvbiBIQVNfRE1BIHx8IENPTVBJRV9URVNULg0KPiANCj4gRml4ZXM6IDZjNWM2NTlk
ZmUzZiAoIkFTb0M6IGF0bWVsOiBBVE1FTCBkcml2ZXJzIGRvbid0IG5lZWQgSEFTX0RNQSIpDQo+
IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiBT
dWdnZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+
IENjOiBMaWFtIEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPg0KPiBDYzogTWFyayBCcm93
biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
DQo+IENjOiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9jaGlwLmNv
bT4NCj4gLS0tDQo+ICAgc291bmQvc29jL2F0bWVsL0tjb25maWcgfCAgICAxICsNCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IC0tLSBsaW51eC1uZXh0LTIwMjExMDAx
Lm9yaWcvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4gKysrIGxpbnV4LW5leHQtMjAyMTEwMDEv
c291bmQvc29jL2F0bWVsL0tjb25maWcNCj4gQEAgLTExLDYgKzExLDcgQEAgaWYgU05EX0FUTUVM
X1NPQw0KPiANCj4gICBjb25maWcgU05EX0FUTUVMX1NPQ19QREMNCj4gICAgICAgICAgYm9vbA0K
PiArICAgICAgIGRlcGVuZHMgb24gSEFTX0RNQSB8fCBDT01QSUxFX1RFU1QNCg0KU05EX0FUTUVM
X1NPQ19QREMgY29tcGlsZXMgZmluZSB3aXRob3V0IEhBU19ETUEsIHNvIEkgZG9uJ3QgdW5kZXJz
dGFuZCANCnRoZSBuZWVkIGZvciB0aGlzLi4uDQo=
