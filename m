Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF142BBB6
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 11:35:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C139168F;
	Wed, 13 Oct 2021 11:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C139168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634117722;
	bh=vzcvJnUuW5WHea0Oi+r8wX1+z4ESW7UTAiV9cfjBDpU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEbmVFPiGk9pvg2spWFAv9ijn/PMDtIw7mR5oj3qdsWHiE6tvpwmONBJ/tdhA6EP0
	 H9JHfUy3HOGL6ttGFujDY6cKK7/PbxXSzf6Sf6zwuZunCXKWpKA/1idJZLNIHVNKcX
	 V8zeicQgunPwd3BKjt9EKqPO362NSUKI81Mq4MO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA4CBF8028D;
	Wed, 13 Oct 2021 11:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 466A2F80269; Wed, 13 Oct 2021 11:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96B0CF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 11:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B0CF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="gCAFfbvj"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="npBR9yjn"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634117639; x=1665653639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vzcvJnUuW5WHea0Oi+r8wX1+z4ESW7UTAiV9cfjBDpU=;
 b=gCAFfbvjefDVOc2CWj19dIW13qM6Un0nAOKpv3Z4peYnBZURhH6Wd0ZJ
 8lNRVFuw1wxVMSxb2XBDZ6eOEFjsny9FYEzCH5uhAU2E3bDzEPpYZMaLc
 YulKDHVmM849gyw09xFKW0HzAd74yO0pSwY+UsNr1Jb26n3EyC++SeIcw
 f6oJBH3YsfYOke6F2O7JaOu/S/isPUNSXhLszDYpy6LG4eJOTYS4tEnQA
 VMbWnHFnlvQorxm3WLs7Gw6ZOMkvDOLC/JkiPrX+0+O/ikr4Pp/YhK52m
 dDgS9SrpKw4fGjh3BSR3kGLpdVXt6owUeNQk+LoFVdzyZJ65Zq0UElTGu w==;
IronPort-SDR: XNTdg8E2R2hEwM59TYZEDIqOSInAi+QF0HQE/V3wUK4AsxIDqVeLp7vtWd7BcPwNu8swbGHV4r
 wualK2alucGsTJUwfPmOtg1D0+9vbCASiqQHr8C5wy1Yfk2IZSjlsv2CclpDbhKanEe+t5OV+u
 mB3FNF1xFzVFy9rjLz0bOkjrw/7OI08aRyxcloRzxZogTQRZQ6GFLZSIKRMBH7h4R5c33X6EoK
 dzogSBmaxQIsFGcryzbFrdqOsNV9UwBocBh6JUNOiWynDnh38AIH7eyiJrpGiTFGAU7zT9DUHD
 KvR4gFrU3pzX9y2kIU1Smjwp
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="135357403"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Oct 2021 02:33:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 13 Oct 2021 02:33:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 13 Oct 2021 02:33:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyghbVYHJMwwglmNnCC7nNawGWeGt/dRLqzoMindQHHiWAH2Pgd7JwzmwkVKwx/9Uwnww1hqH77Yc5qv+CKgiNrhpAeU1jY1bObn5xteoTfJOmf9q9vf5TcAi6LFZJFTWIXVTL/81qpXUdEAZQuIEYalveOe5bDmhr1CryffvydgPydMjaEucqKWT8eOtlcdOAoJPY3h6wKYHkVD50GQWe45+mwtsrDIICL/pqPPaAb7EIKCc5D9KBT7RCCoikWevOuteDuYNNPlAdlXqHLQGMuUd0nS+BhbdNQhlHjsLzJ8mJfLhNetCF3+hWWYnb+KZ7NGy/5L8C0l93Uig+qsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzcvJnUuW5WHea0Oi+r8wX1+z4ESW7UTAiV9cfjBDpU=;
 b=Y+/zE/lrljRx/v+MZI++wu2GIB4SWhfKbgze9p8++9Jr5rLbmL7J+cB5+NA/6Vw9+rGCZmKfDxOr/utlGh2bfP2zdpwxcdUDXg5fsIDyLlM6kDa3DUS4fyLBX0qJwQ31QQx/luMLjv7711jhui4Ca555mL4QMlLFuG1MbmSHKaUU9gVL18ZoubfsgEKzP1wMwOby41RgqKlvQOgMcCptDiU8KONQ/2MwtI4ZQSLbTHs9Lu/jjjHO7bUDwDSZw+EvjgcE+j8vgWNNyxdKYo+Ow28rI9jrDXBe8F1DBBT2Nj8DSRSlQ2jxqZ9wbQ7EObPt61MfLjtgmccGPNzG5jdukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzcvJnUuW5WHea0Oi+r8wX1+z4ESW7UTAiV9cfjBDpU=;
 b=npBR9yjn4tJJa++lG/NpeufGXqyPBz0LD38Mtc0j8C53Ckqaw9ueoleDwrulzGWAofG8hBwbFdfDIa7FTdXpY+c3RhLv06ZPajQRzu0bR6s5dNfwmEPm7IBG+04Mj3K5CeyEMo7PvM3J94al6DDz7l/OS10LsPvQ+7vGWxJDCoY=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB2955.namprd11.prod.outlook.com (2603:10b6:5:65::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Wed, 13 Oct 2021 09:33:51 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::50fa:94b5:51bc:6409%9]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 09:33:51 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <geert@linux-m68k.org>
Subject: Re: [PATCH] ASoC: atmel: add COMPILE_TEST for SND_ATMEL_SOC_PDC
Thread-Topic: [PATCH] ASoC: atmel: add COMPILE_TEST for SND_ATMEL_SOC_PDC
Thread-Index: AQHXuANXAhRXehsB4E643JcWeyvgl6vQpQUAgAAG8YCAAA7eAA==
Date: Wed, 13 Oct 2021 09:33:50 +0000
Message-ID: <b3546e6c-face-31ad-af40-0599c7d5c714@microchip.com>
References: <20211003030357.32456-1-rdunlap@infradead.org>
 <96c810cb-f7e3-d9ff-9713-7ec007ebb599@microchip.com>
 <CAMuHMdUyo-sFzo3CA9WwycZFp=pVYLJeJfEWRT48EVhSZGL3rw@mail.gmail.com>
In-Reply-To: <CAMuHMdUyo-sFzo3CA9WwycZFp=pVYLJeJfEWRT48EVhSZGL3rw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b740412-f504-4958-52b4-08d98e2c90e3
x-ms-traffictypediagnostic: DM6PR11MB2955:
x-microsoft-antispam-prvs: <DM6PR11MB2955B3C3F709B88A5B973C45E7B79@DM6PR11MB2955.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gf7Rd9rbWSfHQecHt1l5KDC5bCNZFTvtlyuJqmBJiFChWE+wBMkPuqPDRKdGqZ1hXO5eiOU9kB/ZhhAKZmyzJFbhR+NbaN4wvjt88bTE1cndL1keC7hUrIz7oqzPhyFVR4NnbFL215KvkAdn6XYMJBvzyLl2FBSWToXXWBROtfZNgFW2y9plPVLO7nXiN4XiWVSTpXCSGSD2MARSNenazwE5pzDaluKk7h+RWXyOEQKrLbECms1UCBaQLJ7k6rsgceQuz0yBK2AWDhYE9I/KoYzph0UQKxj7QdlxYT3kNmiK3zTQZT2xmXWco+/K8Dnby43GMfQ2MpmyqNZFIdm5MO9cs5sD2c1EffAWkpSJ7JKvt2QQ1HrANyxm2MhCjR8WXKC3oNTwdIPQuoniYdHiU8fEL402leTEL7DzEYF81iPW7y6wayzfJebcRtO3nIY/27csNbhZuS/n9/uiO3m/ctOLsEiEsLE/rY2RrgLMvNKHCk/iZbY+X9BVyYjP9uozLZb0REl9BnNdpFxWtdKtABImY3VwbwxK+HvHtPAd/vt7KWLlYbmPheWcuwVO/hogFbw118J/TaS6ZyN1g4FUe/jMeqhrKFMAJVPQxcNeRbxopGy79xFE/ps5d0jISnDJCAw7K/ZVEVYpLVrWiVAHbGHJqRL5xoS7PKJRCPU8PLAjFnbn3JZHnbUipedeVndqMSUoJkNg3v7bttS8N17bJ0ELN2chNq45f28y8FCPCTSbFcCNUS2/jXKk6XtfI4CpSEW5OT86su+ZKJE8UiYrJ8gHGNmyAGT9FZeQXbnOHP+GrEnvXxLs2+X2foD78Mo2pFqCiSQG9lqHN8hDQ/Ybkn1IQoxPqtVXfrmnD1CD/5Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(71200400001)(6512007)(316002)(53546011)(31696002)(6506007)(76116006)(2906002)(31686004)(8676002)(54906003)(4326008)(5660300002)(6486002)(6916009)(186003)(122000001)(8936002)(508600001)(36756003)(2616005)(66476007)(91956017)(66556008)(66446008)(38070700005)(66946007)(64756008)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTlocVhHK25nL1R6Q00rcTJqZEFMeUJ4MXc1ZUlkaDBpZmtiNk9MdzcyQkZ3?=
 =?utf-8?B?bU82ZW41YlYyNU1OZ0xJVlVINGZKZndsUC9Rb2hDN2RLZGwvWThJYnZsRXZj?=
 =?utf-8?B?V1lYVWxHMTkzb2NMM2NUY3lGRm1udmFMY1VFSXJucHpwaUxQZkUyUFUxREkx?=
 =?utf-8?B?SzJCZDJZQ3JFVzdLYTdsU3NxQThobHdYV3p2bTRIVXpDNlZZVVV3NjkrOXkr?=
 =?utf-8?B?ZC92OVQ5OGs3Vk1EWWR1aTVkLzhkWVh5aTNweUNuMThudExOYXg0a3pUaVFD?=
 =?utf-8?B?ZzhtVnNHeU9XNjNvMzQ3eWZzTCtwY3Q2SmtFRFdQeFNwTGRENFQxWnljczRN?=
 =?utf-8?B?RFMrcEtWekpGK3hkY1pRVDRnekZVcURLekpReTRFOG92M1puRGp0Z1M3QlZw?=
 =?utf-8?B?NE1aSEZkVUhlNTlZcDd5V2JHZkMwMkxFYnlxUWRJSERqcCt3RjBoajlmQm5Z?=
 =?utf-8?B?QlZVQXBGT1BJbC9RTkY1VDZ6ajkzcC9SUStIUnR2RnRnWUdCbHhMeStLUHk1?=
 =?utf-8?B?WHBSZWg3dnJwUk1xS083T29MTE5JUnhnWmVjeENuNE1zOU5SamNOcjZwQWx6?=
 =?utf-8?B?N3NRYkhzZkxnS1hUQ1pLb1JYQXBERFBkZXJOM2hCT3RqK3hZdXRjcG5VOHds?=
 =?utf-8?B?cjliS0Vnd1R3NTIxOEY0aFVzSnBBeDljanpWRFN4SXFEMjU0MXBDUUE4VGtB?=
 =?utf-8?B?dC84Y0V2UklaSmNJOVYyempkQUx5SElSbU9QYndISGIxUDl1YzRoQzlRMUFY?=
 =?utf-8?B?Um9nNVhaRnV5NlFhR3pCS1lQTVlLaElDdkpkdi9WNytOY0RUdlVONkI4akV5?=
 =?utf-8?B?cWRKRDV2aWx1bXBHTERoejNVUjJZaXh4a0lLM1M4MGI0dlVFeTB0Tm9xZ2wx?=
 =?utf-8?B?NWxZYUhGa1hDZTY2SkZmNVpSendpQWdMeXRqRTRwVnNvSW5BTEZiS3Jsanho?=
 =?utf-8?B?aXl0c1J0RkRWOWNXRmlHdXBLUzFrbGVocWlJcm5aRG1iK3NhYXB2T0VSZ2Rt?=
 =?utf-8?B?MEUzVmFEdThTZ0FiQytuSWd2VUFZbkhXQ1M1Q0lmMnZ5eS9WVkdUU3ZZelVS?=
 =?utf-8?B?eVgvYWZFRkhBTlMxVUl4Y2F6bzdSN09Ob0s0N0RES0ljNlFSYllOL25Lc2xI?=
 =?utf-8?B?aXpkMVNTM1RKTVFrK2k5QnlrR0xySzdBS1Vrd2tuMC9raVRnWWp3U3Ryd20r?=
 =?utf-8?B?cDlxVmJ3U2k1VHM4bVEvc2c3bS9TL3g1S3IrWnhuMFgzZG5nUDEvS1dDQUU5?=
 =?utf-8?B?aE9WTkVNVEQ4aDYzQXZNVW43ei9kcFV2d25uY0E0Qy9UZnJya3lMSmdqUTNs?=
 =?utf-8?B?RjZNVnhGSUxYK3RxcTdtMVpIOFIvck1zK2tSNC9Bd1FBMjMwNmRJTWxTTXlC?=
 =?utf-8?B?eTNXMlV4Q0drVHV6SHdmMTkrQ1VMdTd5ZkZ1TmFodU5GS2VSUGJkZW5BdmZ1?=
 =?utf-8?B?TXhTR1JUVGNxeFBKem1yOVNjTlZGRlFBMjdCcXF4ekpSOHkrdUlHUmY2U3Vx?=
 =?utf-8?B?eVNzWm9lOVdnV3RGdEpiN0VyTy9hbWR3YXRXN1huc0Vza3hrMm5TWTVrYW9Z?=
 =?utf-8?B?U3JxZU11Z1dKNVVaQjczRG8wVWk3cXIveGZLRTNTOU1XOUlGQVd6TjV1ai93?=
 =?utf-8?B?TUdkR2dPcm45M21QQ0xTMWYzNnJjc24rL04wMmhhR1hVMXJXcFlKRVFNRDRo?=
 =?utf-8?B?eEFwbFNsWEpDOENnS0w4bU5GNldIeEhjVW5XOUJIeStLa1F5VnhjMStsMVYz?=
 =?utf-8?B?dzQzUC9Za2JDQjFHR2k1Lzl5ZFhTbTFuL0N1eXovdlFXNUhxQVZDVkxpcThk?=
 =?utf-8?B?d0tIbEJ1dzZxQlE5Z1FUVVQ1NFNHN0t1NVBPSUVEdGxMTERGUmxVZXpFY2V0?=
 =?utf-8?Q?r+SdDarjw42cs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2667A6FAE6FA8843B85A4EE39D2EDE5E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b740412-f504-4958-52b4-08d98e2c90e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 09:33:50.9142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jW1RMr1NOEpOtjIvosWtfr2WKXR1cNd5RSe674jWgWFA1MuMuPL4G46zEsHjhFw/OJ4e7NOjavdaaML4C/oQflpy+fop1pOBUpFrblmjpo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2955
Cc: broonie@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
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

T24gMTMuMTAuMjAyMSAxMTo0MCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBDb2Ry
aW4sDQo+IA0KPiBPbiBXZWQsIE9jdCAxMywgMjAyMSBhdCAxMDoxNSBBTSA8Q29kcmluLkNpdWJv
dGFyaXVAbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+PiBPbiAwMy4xMC4yMDIxIDA2OjAzLCBSYW5k
eSBEdW5sYXAgd3JvdGU6DQo+Pj4gR2VlcnQgcG9pbnRlZCBvdXQgdGhhdCBzaW5jZSBzb3VuZC9z
b2MgaGFzIHRoZSBzb2NfZHVtbXlfZHJpdmVyIGZvcg0KPj4+IE5PX0RNQSBwbGF0Zm9ybXMsIGl0
IGlzIHBvc3NpYmxlIChkZXNpcmFibGUpIHRvIGhhdmUgZHJpdmVycyB0aGF0DQo+Pj4gZGVwZW5k
IG9uIEhBU19ETUEgdG8gYWx0ZXJuYXRlbHkgZGVwZW5kIG9uIENPTVBJTEVfVEVTVC4NCj4+Pg0K
Pj4+IFRoaXMgbWVhbnMgdGhhdCBTTkRfQVRNRUxfU09DX1BEQyBjYW4gZGVwZW5kIG9uIEhBU19E
TUEgfHwgQ09NUElFX1RFU1QuDQo+Pj4NCj4+PiBGaXhlczogNmM1YzY1OWRmZTNmICgiQVNvQzog
YXRtZWw6IEFUTUVMIGRyaXZlcnMgZG9uJ3QgbmVlZCBIQVNfRE1BIikNCj4+PiBTaWduZWQtb2Zm
LWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4+PiBTdWdnZXN0ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+Pj4gQ2M6IExp
YW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+DQo+Pj4gQ2M6IE1hcmsgQnJvd24gPGJy
b29uaWVAa2VybmVsLm9yZz4NCj4+PiBDYzogYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+
Pj4gQ2M6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29t
Pg0KPj4+IC0tLQ0KPj4+ICAgIHNvdW5kL3NvYy9hdG1lbC9LY29uZmlnIHwgICAgMSArDQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pj4NCj4+PiAtLS0gbGludXgtbmV4
dC0yMDIxMTAwMS5vcmlnL3NvdW5kL3NvYy9hdG1lbC9LY29uZmlnDQo+Pj4gKysrIGxpbnV4LW5l
eHQtMjAyMTEwMDEvc291bmQvc29jL2F0bWVsL0tjb25maWcNCj4+PiBAQCAtMTEsNiArMTEsNyBA
QCBpZiBTTkRfQVRNRUxfU09DDQo+Pj4NCj4+PiAgICBjb25maWcgU05EX0FUTUVMX1NPQ19QREMN
Cj4+PiAgICAgICAgICAgYm9vbA0KPj4+ICsgICAgICAgZGVwZW5kcyBvbiBIQVNfRE1BIHx8IENP
TVBJTEVfVEVTVA0KPj4NCj4+IFNORF9BVE1FTF9TT0NfUERDIGNvbXBpbGVzIGZpbmUgd2l0aG91
dCBIQVNfRE1BLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQNCj4+IHRoZSBuZWVkIGZvciB0aGlzLi4u
DQo+IA0KPiBEb2VzIGl0IHdvcmsgd2l0aG91dCBETUEgc3VwcG9ydD8NCj4gSWYgbm90LCBpdCBk
b2Vzbid0IG1ha2UgbXVjaCBzZW5zZSB0byBvZmZlciB0aGlzIG9wdGlvbiB0byB0aGUgdXNlciwg
dW5sZXNzDQo+IHRoZSB1c2VyIGlzIGNvbXBpbGUtdGVzdGluZy4NCg0KaXQgaXMgdXNpbmcgYSBQ
ZXJpcGhlcmFsIERNQSBjb250cm9sbGVyLCB0aGF0IGlzIG1hcHBlZCBpbiBTU0MncyBhZGRyZXNz
IA0Kc3BhY2UgYW5kIGlzIG5vdCB1c2luZyB0aGUgRE1BIGVuZ2luZS4gSSBzZWUgdGhhdCBIQVNf
RE1BIGlzIG5lZWRlZCBmb3IgDQp0aGUgRE1BIG1hcHBpbmcgQVBJLCB3aGljaCB3ZSB1c2UsIHNv
IEkgZ3Vlc3Mgd2UgZG8gZGVwZW5kIG9uIGl0LiBUaGF0IA0KYmVpbmcgc2FpZDoNCg0KUmV2aWV3
ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29t
Pg0KDQpUaGFua3MhDQo=
