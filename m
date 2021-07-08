Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E12F3BF6DB
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 10:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2D21612;
	Thu,  8 Jul 2021 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2D21612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625732450;
	bh=kaiYy91aS9+64PsrqN1DBhXW906kYA0Sk07YOSxw57g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NDcwDaDdqihqbZ/ARz52UV5T6UhWeqoTNdC2ImZFTXYGtBImjStMUpgnAwODDS6e8
	 E6R62w0Q4N4M89X6Q/jeTv+Z+fyENaWS9YJSuS6tzYCYzkhe72DJGA0W9xepxnPrDf
	 QVVWs9Dm+qQFVW8sFqmXXDvB4h4bR5L7Von9eFms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2148EF80259;
	Thu,  8 Jul 2021 10:19:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED2F3F80249; Thu,  8 Jul 2021 10:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A42D0F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 10:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A42D0F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="2NMK6mzv"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="CdDe5SW1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625732356; x=1657268356;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kaiYy91aS9+64PsrqN1DBhXW906kYA0Sk07YOSxw57g=;
 b=2NMK6mzvtltyyeuf1mhkeWCOzS5GoDmzpy2zt5pPxiYYF1oWhFPCH9v7
 6p8w/aPauuo6XA3ZGf+/bgE+JEjtWVrS5b7kqFglCQuXGxX5gUm8h6wkg
 RTxakQeZzGlNasSYImQXGodexXBIcce1sd6sGO9TkflNYMBuYunmoyNzx
 kq5e3d01c4vw+qbWJEQt8g4Tpi5IRZDlng602FtvD5VvxHX5S9B09IYWp
 WZ5KLraUjMhmhwipHNhsuB2VJ1OZy1RyjqIc+gCgvIo2AisxHUu/ZYNhR
 fHjMBWWN21QY04Onc5wh00bQis7eF4aut2p74Una3RkDvi4DE1OaBPazg w==;
IronPort-SDR: KyWlK5llewvNZaMPQ798rrUQHQVw1pQMnG6xTlyEDRloy3ib2FqCPwmEqZiXJzmKpGnzOX82OL
 6LhEd1b5TgxGCwf0WxWVvp5z1DMUyVmGnXrQAYsSHay4IInf27LRWBJ8mS5I8H8NkqZPmVJi+V
 tKGYqf5qQU/YLhyLZV9Q8dnxxy1Kywv5yn8BshOSaU/Mby1F1sskVhf3Y5U++74T3/+isQPUAo
 buvXTnKoqY1Yz6J3t/NwxkYKADmvzQeZnxv0C0h1fzJcKdIhWZptzCyctVYJdAZ2VloFZhBitQ
 5Yo=
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="121350934"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jul 2021 01:19:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 01:19:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 8 Jul 2021 01:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MotHUrwgofzZ7bWVYJqHcBEuMHP6xVuGingEUJBcNLlhskyRnBg0kq9YEWpraI4UwGcTwhoWd2opxCydvfe2dEKNJaws/9h337ulojzQFMvKouecaUo9tcqJ6fA2NiaO29lAtAsBpFjofdfUG0PPLF2xzqCqKpJJ9wpIOs2LS78Kyv15bIte8fcw0JvqEFPGDzPTZnH8Rd0KYNth9PzS1S9RDHXquM7oyhcubnjhcrpZ662p5bfOCZ4TSjA+wh5ilcDCWUKhMcHhj4oC2/vRCa3cGpxLzPcCJ8L6n/sKqz6Sc/fpkc92SyWDQpNAdANewHH4j2fqYPcwBcpRcPVS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaiYy91aS9+64PsrqN1DBhXW906kYA0Sk07YOSxw57g=;
 b=ka8HZeA9fmIB53MiS+wlDKd++mFiQAUmnJvoAl0EUdAVSNVMcmvYBT64okl7twqeKdt32+MwSIiubFf3ZQ88XFg+32Yx0Xfs96nTZBA9wytHDvGQyhdf50QpLjURCqXrGzzAl9Drn4j0Bi9uY16b4GenuxvEHBATcivH8vtxziRSnWiAqqAouVkU+1j9uqZBx/ALXWo6w4Ixee1sisly9Pxe8gWSOqtovD8fbG5BexlDPEU8H5TN3tQ1Xd0I7lv1nJc01nycoZycVu6IlOhSNy8bJv1CY9qBhlR1aXAy15K08KDJlTddRkEiHgQJvJrqMrASGzz0cl8xyQDSe+XVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaiYy91aS9+64PsrqN1DBhXW906kYA0Sk07YOSxw57g=;
 b=CdDe5SW17216ZFJlbDKaLwzUonW4oSXXiR3kp42P5npsu71VLOfJ73nvcG7v8KR3mObmnFx8/9nwmsAR47EhxvHV4zYi8wYhbHV2h2glA7xa+/PO9lXAQGOyQhtYXw9ha9Mt5S+0YiYCkpMsFcouLfsWFBafHTM0nhIlubBlZ+0=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB3465.namprd11.prod.outlook.com (2603:10b6:5:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23; Thu, 8 Jul 2021 08:19:07 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 08:19:07 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] ASoC: atmel: ATMEL drivers don't need HAS_DMA
Thread-Topic: [PATCH v3] ASoC: atmel: ATMEL drivers don't need HAS_DMA
Thread-Index: AQHXc3nAapI43oKKzkGOq7eDGPDjAas4vOIA
Date: Thu, 8 Jul 2021 08:19:07 +0000
Message-ID: <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
References: <20210707214752.3831-1-rdunlap@infradead.org>
In-Reply-To: <20210707214752.3831-1-rdunlap@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcc6dbe3-82b8-468f-7a81-08d941e90e82
x-ms-traffictypediagnostic: DM6PR11MB3465:
x-microsoft-antispam-prvs: <DM6PR11MB3465DC0BCB98F0B00CF46DDFE7199@DM6PR11MB3465.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7I6YAWO3/LuQs8OX7IwCGCgHb+37ybxmKfWuNVqpFl4jFvz9IrGHCDoRaGpHTF530fTSBssb6TQ7qnMFB3t8tprKHl6v4fSt3Xo5DWj5YjlwwPlISXI2BmAwewBOyNTqlPhoDIOwzg9LA+q9f4yypM1WNDozfe9L8LYHN9bzgXSEFeOsS6XNA/6CgQKt0PbCScYPocZugn3ybIONh+WAuV07plfMBH59xl6w/Qj83oxps0GEFWd1GVWX4kfNRdefwK3B9oP9031uXTHMMlFvn94CIvCM2+pkr9hHjTsaNvnnfBYOOza3dCLWrI0PtqwLkvhiqUYifyV1A6E2o25ieAhNzB3CLPqMxMZCSV2EPJkNxPZ62k5/o3+knhLdsP3rrUQpYcMkwgcQ63Hg7BHtwy2ydO0M9JBWpRTu6+ovwvXXkCNRJ6sH45Z/JbBVLprQIFMTOeU5NVDrvL33oILGRs5Gbo2hoAZHiPateJcMrSuvyJFHZhWQPhH4kG9ma9uwF+96kAme54m/rD091MKvp48CnMDT25bquoFypz/gjzffuK8Ng/pEorWwjw2+MnG2KhKpbE27cE93fQkgutqBIRSbgHb4stUWp/uvqmqGoyHmP6k4560XmEV3qgGHHn1thUcFqmrXnSshTWJwSYySWMO1CYNCpQA4MheoyJAj86OaMZ81sQBJk9RCj1wpgvDiKkgs1bK90OYTEQKA1fjTFQSZCVzWwJx8C8iCVsY2vH8ErOhogWxT0fPDfpYiSa/Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(376002)(136003)(366004)(6506007)(53546011)(4326008)(26005)(91956017)(66446008)(71200400001)(76116006)(36756003)(186003)(86362001)(478600001)(66946007)(31686004)(66556008)(38100700002)(83380400001)(5660300002)(66574015)(66476007)(110136005)(2906002)(6512007)(2616005)(64756008)(8936002)(8676002)(31696002)(6486002)(122000001)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWdFTk5XZWQ4THZkQmFWNElPbVZUV3cwM3J5c0dFSjRwV3dVSUVzWTBCSDVU?=
 =?utf-8?B?Q3dGbWFQNzh0ZXh5RGhQYzdtMjNjcytqcjlXdWdZUDFnVlhWUHJ5REo4WWUr?=
 =?utf-8?B?UUNBcU0xaENGL2FKWU5SeFBhLzRYaVBaZUZibm1RSHUvYTVOaXFaaXU3QmNw?=
 =?utf-8?B?RXJ1czJOUnFaYm5rTG9WZFc5aW9CcjBGbjJTQlRZeUdiSHBsS2YrOE5Ways2?=
 =?utf-8?B?UVAvZjFScVZyMXVEeXl1eEx0U1hMSi8yZmYzVWsrbkM4akQ0U1VPdllnK2I0?=
 =?utf-8?B?cnR1amlaYi9LRytuRW44OXZ1ZDMyWG03L0hnY3JSTDlabU1pdXF1YXA5ZVgz?=
 =?utf-8?B?TldmVFdHaDg0emxWU0dnSVd2Z1JJZ242NDhwUmZvcW01cTRpdExibU01bFQ4?=
 =?utf-8?B?ZGlqaFNrVlNlTG5SelBvZE92YTBKbUlvcm9NbDJiNUd3OFpQdm1WVHE1TzRO?=
 =?utf-8?B?WmhsbW5rYS9EYXl4U3h0a3RXb24vSVk2c0duWFRuRStSbWJ2T3pXR0FJNkhZ?=
 =?utf-8?B?MENqTzZwbStQYS84TGUzTGY0L0NKRmVUcmQ5YmE5RHd2c0RTaStORXpmc0Jz?=
 =?utf-8?B?RjJqWUJwNnJYT2VvT3R3aURLNHl2VnFTOXV3VC9rQXlTRitUTkg3MDhiMDFy?=
 =?utf-8?B?NzhZU1dUTkgrTVNLelhXSFRnc0dKY3Y3SzFjMEd6am0yK1ZBdFNBdGJwR3Bz?=
 =?utf-8?B?SmJaUzk0SlVnVTdjVnhHYnJaWGZXaEVmTVowUnloQ1Y1MzNsRXlDOFNYdkY1?=
 =?utf-8?B?WjVmeXRsRklocWh5elk3b0ZoalhXcm40VTZiaFdQaEM2SXZTSDY0VXRQRnd5?=
 =?utf-8?B?QTVnWXhtRURJdE04OVgwc0NwcWxReEQ5OFh5Znd6WjVGZS9oc2JNendMUXh5?=
 =?utf-8?B?K0JXczFyUDhpT1MrcGtpNCtZbC9PUW41RGtrK21hR0I1cTkwR3pLa0NPQUxM?=
 =?utf-8?B?YkRQdHBYZWRVQ2J0R3B0dFdBRlRub3lhcnFEN09yNEJpN0xYcUlzdDhUeVNW?=
 =?utf-8?B?cDdsSENFY0VnMFFTRUlWM3hmTW90eTE5SVI5WjNKbGJ5bi9vKzRMMHFTdm5F?=
 =?utf-8?B?Q0VoeDVsa1dhL0JveFBCYXlQSzFMVVJnSjZCZHJHczRWdTl4bkJ0dXU5Zzlx?=
 =?utf-8?B?ZEZld2MvVU9SdXZHSHgyejRXSzJQRURVeEVlV1VhM0I3NG12WXVUb09sckZH?=
 =?utf-8?B?WEFEUXM5ekI2bWVHb1RVeWxqR29IZjdqYjdEdDJVWElrZjVLK2ZPR3JtT3VZ?=
 =?utf-8?B?OWV2dGx1MzdIbVZGcHgyemRUYUZmbWlCNGRBcG9UeVNOV1VzYlZlM2RidDdy?=
 =?utf-8?B?TkZJQlIyeDh5MmdVNG42MVU5eEpwUFREU09QY3U2cXJVMzVJQmg4ZzhNUmFx?=
 =?utf-8?B?Rmk2elFVSXRBTHFFVWNJd0V4UDI2UjRiNkZhQndFY1JCMUYrSHpWalE5SUkr?=
 =?utf-8?B?d0tBbGJNSE45WUllTGIrb1diMis4VzlpTGhJUkNIeXQrbHpOaHRncFVaTlhH?=
 =?utf-8?B?bklDd0NubFYvc2dEbG13UXhBQXNtd0tTSnI3MFMyQm5PYThHRnhpU3AvKzJo?=
 =?utf-8?B?Vnk1bHl0TTE3aUNiRmJFdUV4NWJoUVJzVmFHSGN4MitsQ3pib25GOC9YVlRS?=
 =?utf-8?B?dGlHV2tGbFQxeGxMUENOV0NtUk4weUJvNEtYNi83QTJ3TzRwUERvZHhONkQ1?=
 =?utf-8?B?c0dEcDBTbXE5eHBrNUhHSVoyQnN2US9yYlJsRzk1K0pwSk1WNll4d2hYeDlp?=
 =?utf-8?Q?6P7eqlOfHOoc19U+iA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F35494470898646B4668ADF0A7622B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc6dbe3-82b8-468f-7a81-08d941e90e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 08:19:07.4749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Kov4EVQlPmhjocCSrlGt0UJYlO8tdqA4FRIE9OSo3MbDj1QMAFPRckCZMjURjYL+F2sIXdQagaIimZwQYr0HRVNIA2862YUUpsiYU45ueg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3465
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 alexandre.belloni@free-electrons.com, lgirdwood@gmail.com,
 mirq-linux@rere.qmqm.pl
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

T24gMDguMDcuMjAyMSAwMDo0NywgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIGEgY29uZmlnIChzdWNoIGFzIGFyY2gvc2gv
KSB3aGljaCBkb2VzIG5vdCBzZXQgSEFTX0RNQSB3aGVuIE1NVQ0KPiBpcyBub3Qgc2V0LCBzZXZl
cmFsIEFUTUVMIEFTb0MgZHJpdmVycyBzZWxlY3Qgc3ltYm9scyB0aGF0IGNhdXNlDQo+IGtjb25m
aWcgd2FybmluZ3MuIFRoZXJlIGlzIG9uZSAiZGVwZW5kcyBvbiBIQVNfRE1BIiB3aGljaCBpcyBu
byBsb25nZXINCj4gbmVlZGVkLiBEcm9wcGluZyBpdCBlbGltaW5hdGVzIHRoZSBrY29uZmlnIHdh
cm5pbmdzIGFuZCBzdGlsbCBidWlsZHMNCj4gd2l0aCBubyBwcm9ibGVtcyByZXBvcnRlZC4NCj4g
DQo+IEZpeCB0aGUgZm9sbG93aW5nIGtjb25maWcgd2FybmluZ3M6DQo+IA0KPiBXQVJOSU5HOiB1
bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBTTkRfQVRNRUxfU09DX1BEQw0K
PiAgICBEZXBlbmRzIG9uIFtuXTogU09VTkQgWz1tXSAmJiAhVU1MICYmIFNORCBbPW1dICYmIFNO
RF9TT0MgWz1tXSAmJiBTTkRfQVRNRUxfU09DIFs9bV0gJiYgSEFTX0RNQSBbPW5dDQo+ICAgIFNl
bGVjdGVkIGJ5IFttXToNCj4gICAgLSBTTkRfQVRNRUxfU09DX1NTQyBbPW1dICYmIFNPVU5EIFs9
bV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJiBTTkRfU09DIFs9bV0gJiYgU05EX0FUTUVMX1NPQyBb
PW1dDQo+ICAgIC0gU05EX0FUTUVMX1NPQ19TU0NfUERDIFs9bV0gJiYgU09VTkQgWz1tXSAmJiAh
VU1MICYmIFNORCBbPW1dICYmIFNORF9TT0MgWz1tXSAmJiBTTkRfQVRNRUxfU09DIFs9bV0gJiYg
QVRNRUxfU1NDIFs9bV0NCj4gDQo+IFdBUk5JTkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMg
ZGV0ZWN0ZWQgZm9yIFNORF9BVE1FTF9TT0NfU1NDX1BEQw0KPiAgICBEZXBlbmRzIG9uIFtuXTog
U09VTkQgWz1tXSAmJiAhVU1MICYmIFNORCBbPW1dICYmIFNORF9TT0MgWz1tXSAmJiBTTkRfQVRN
RUxfU09DIFs9bV0gJiYgQVRNRUxfU1NDIFs9bV0gJiYgSEFTX0RNQSBbPW5dDQo+ICAgIFNlbGVj
dGVkIGJ5IFttXToNCj4gICAgLSBTTkRfQVQ5MV9TT0NfU0FNOUcyMF9XTTg3MzEgWz1tXSAmJiBT
T1VORCBbPW1dICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dICYmIFNORF9BVE1F
TF9TT0MgWz1tXSAmJiAoQVJDSF9BVDkxIHx8IENPTVBJTEVfVEVTVCBbPXldKSAmJiBBVE1FTF9T
U0MgWz1tXSAmJiBTTkRfU09DX0kyQ19BTkRfU1BJIFs9bV0NCj4gDQo+IFdBUk5JTkc6IHVubWV0
IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIFNORF9BVE1FTF9TT0NfU1NDDQo+ICAg
IERlcGVuZHMgb24gW25dOiBTT1VORCBbPW1dICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NP
QyBbPW1dICYmIFNORF9BVE1FTF9TT0MgWz1tXSAmJiBIQVNfRE1BIFs9bl0NCj4gICAgU2VsZWN0
ZWQgYnkgW21dOg0KPiAgICAtIFNORF9BVE1FTF9TT0NfU1NDX0RNQSBbPW1dICYmIFNPVU5EIFs9
bV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJiBTTkRfU09DIFs9bV0gJiYgU05EX0FUTUVMX1NPQyBb
PW1dICYmIEFUTUVMX1NTQyBbPW1dDQo+IA0KPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5k
ZW5jaWVzIGRldGVjdGVkIGZvciBTTkRfQVRNRUxfU09DX1NTQ19ETUENCj4gICAgRGVwZW5kcyBv
biBbbl06IFNPVU5EIFs9bV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJiBTTkRfU09DIFs9bV0gJiYg
U05EX0FUTUVMX1NPQyBbPW1dICYmIEFUTUVMX1NTQyBbPW1dICYmIEhBU19ETUEgWz1uXQ0KPiAg
ICBTZWxlY3RlZCBieSBbbV06DQo+ICAgIC0gU05EX0FUTUVMX1NPQ19XTTg5MDQgWz1tXSAmJiBT
T1VORCBbPW1dICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dICYmIFNORF9BVE1F
TF9TT0MgWz1tXSAmJiAoQVJDSF9BVDkxIHx8IENPTVBJTEVfVEVTVCBbPXldKSAmJiBBVE1FTF9T
U0MgWz1tXSAmJiBJMkMgWz1tXQ0KPiAgICAtIFNORF9BVDkxX1NPQ19TQU05WDVfV004NzMxIFs9
bV0gJiYgU09VTkQgWz1tXSAmJiAhVU1MICYmIFNORCBbPW1dICYmIFNORF9TT0MgWz1tXSAmJiBT
TkRfQVRNRUxfU09DIFs9bV0gJiYgKEFSQ0hfQVQ5MSB8fCBDT01QSUxFX1RFU1QgWz15XSkgJiYg
QVRNRUxfU1NDIFs9bV0gJiYgU05EX1NPQ19JMkNfQU5EX1NQSSBbPW1dDQo+IA0KPiBGaXhlczog
Mzk1MWU0YWFlMmNlICgiQVNvQzogYXRtZWwtcGNtOiBkbWEgc3VwcG9ydCBiYXNlZCBvbiBwY20g
ZG1hZW5naW5lIikNCj4gRml4ZXM6IDE4MjkxNDEwNTU3ZiAoIkFTb0M6IGF0bWVsOiBlbmFibGUg
U09DX1NTQ19QREMgYW5kIFNPQ19TU0NfRE1BIGluIEtjb25maWciKQ0KPiBGaXhlczogMDYxOTgx
ZmY4Y2M4ICgiQVNvQzogYXRtZWw6IHByb3Blcmx5IHNlbGVjdCBkbWEgZHJpdmVyIHN0YXRlIikN
Cg0KSSBhbSBub3Qgc3VyZSBhYm91dCB0aGVzZSBmaXhlcyB0YWdzLiBBcyBBbGV4YW5kcmUgbWVu
dGlvbmVkLCBpdCBsb29rcyANCmxpa2UgdGhlIHJlYXNvbiBmb3IgSEFTX0RNQSBpbiB0aGUgZmly
c3QgcGxhY2Ugd2FzIHRoZSBDT01QSUxFX1RFU1Qgd2l0aCANCm0zMnIgYXJjaC4gSSBkaWcgYSBi
aXQsIGFuZCwgaWYgYW55LCBJIHRoaW5rIHdlIHNob3VsZCB1c2U6DQpGaXhlczogZWIxNzcyNmIw
MGIzICgibTMycjogYWRkIHNpbXBsZSBkbWEiKQ0Kc2luY2UgdGhpcyBjb21taXQgYWRkcyBkdW1t
eSBETUEgc3VwcG9ydCBmb3IgbTMyciBhbmQgc2VlbXMgdG8gZml4IHRoZSANCkhBU19ETUEgZGVw
ZW5kZW5jeS4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4NCj4gQ2M6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNy
b2NoaXAuY29tPg0KPiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IENjOiBMaWFt
IEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPg0KPiBDYzogTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPg0KPiBDYzogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5x
bXFtLnBsPg0KDQpPdGhlciB0aGFuIHRoYXQ6DQpSZXZpZXdlZC1ieTogQ29kcmluIENpdWJvdGFy
aXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hpcC5jb20+DQoNClRoYW5rcyENCkNvZHJpbg0K
