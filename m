Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1038F3C4
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 21:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DBFB1614;
	Mon, 24 May 2021 21:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DBFB1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621884902;
	bh=qhrmrcVD60wNMZ4W2u3kEwwuQsJxK6akaSScGlv8V9s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uStoxZeewjW82EYg3vRbFpB+IsRBCxW0IWTCtG8m6JDm92w+d35832mv4DnN/60c/
	 0E8D4Eg6Gc36u/sJrNsiW2gDt1CtCdrd/0+0U0aFOYf0dfKp3QEpmAclvdB+zI0C1k
	 7hZsq3MiTie/TTwiWVIPQQ01Kjl53uZQlnInXKt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4CCAF8022D;
	Mon, 24 May 2021 21:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F5C2F8022B; Mon, 24 May 2021 21:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74859F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 21:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74859F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="M1hHFu+m"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="rW8IujEk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621884805; x=1653420805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qhrmrcVD60wNMZ4W2u3kEwwuQsJxK6akaSScGlv8V9s=;
 b=M1hHFu+mKlhREqrSIPpfpXX5CT1TC88ALFRx+3DRjygc5ksvYS6jRgJN
 OvQ2er98wsNoAqW4zb/aakwIx63m/1e9V5GfzkjkxSAw41r8eTpF//yUM
 tvJsuTYjt/2swjmklHyGFpsOqUY0nu5FG///o50ldXS6OX+UVg0ffQ4r3
 ihFjyeygqri0I4DA9FH87mCop6OIEcywNNmLPPoljHYGbvRi8QDLa2kLk
 0V1R0KoOkeNAyd7tXLXQbPcEDpdwlfiuqFrG0BmUMISruIkaStmylvxa2
 6tfPvH8WmENpsNEEumjvgNCu9oS3K5OhLWG/h6oKbY4LuzoxwZZFJPs0g w==;
IronPort-SDR: loIUF6jDxAewrd8HTh3f7YrCVvosFHxR8chgGwPx47DJnXAkh03j28mMpjC7EEomI5hCcuOwyw
 XRszxYFukbA88Gmulou2C+iFpKaDUwTajXSF6KBa/tsKQN9njxuc3C5bb8tpQFPuZxfruWi6RC
 dxUHDJdND1hFvdDjNiZ6RHV5UL/epzEnRqoq2/8Tm5gSYIPh8zhGlSqrgGJns+dkC4yiJo/M8O
 a0tZOLrRzf1eE0FjSjN9VSCA/+sM2YhKRxkhmUYypHK7PbjF+RMspaIRwxkE2IRIzU5OxAQMVN
 GNc=
X-IronPort-AV: E=Sophos;i="5.82,325,1613458800"; d="scan'208";a="56670539"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 May 2021 12:33:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 12:33:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 24 May 2021 12:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b43JFPKF3OjhD1Uajbq/kR3xPq1l6xFrKXvnt4dJ1eq066mfbJ7Q5GW2LJgQxVeIb50K+tzti7QAWOoxQAYH+WzPLKBSWQUzD1jcB5RkzKzUzgVCLC62fji4tjek7cjV5WEpOhRtq/tU/1O640hgKpCNe++b8RI+puqa6H0mp2nSpiiG8agOgde3685uN50tMnPXB9HuCwRMmSk0HrlOP9MJajEpJHrU+ohTZX4jAO72cehWNf3U9HEp71nuY3NAkicgRLnFyjoNOXpxzN7spycfp82e3/w1+sHdg5Ca3WCC0OBluG9ofi/R123nh5hVte2l2JNy0k8hr6jPoIidgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhrmrcVD60wNMZ4W2u3kEwwuQsJxK6akaSScGlv8V9s=;
 b=JHZl/PbaqR0nkglHgSrI6E//Rv7zfbxd908k6BcKHq/ArNcvLbH9IsrF4U8tyStAmBzHyWDXueNUuARFnWLlF4YGBExv78XpEa2PgK2tp/YFanp4Eat+FJpol8n9aW/V5LMVEzmAj9IpobFqUIXTlb04t+hlcE8UU2BLvZuhHDRGxNKNz8p+XS8meD+DhipvV1pPVsUFL/ppQGv1kR72zRrWFzGs3UPRY3CCEI4scmTYOsSToseh1dP6hVHCzxRO1ewdJ2oWBYhM4TVyb1LfZkYhqfmAssYQJnUi+5jVkGs1m1qPdwy1agRN9qwMZhjuaGL+fOsBRfsh+Lqw2AomOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhrmrcVD60wNMZ4W2u3kEwwuQsJxK6akaSScGlv8V9s=;
 b=rW8IujEkVcQU5AEhNIjuUlyu3PHy2Z4A3vodS2BcPQhAzCDz1ctoMLnJTnoLNVXNmW524lj7RkNCU9wIsDQv9/B6oxplk6DjF2r32rsPSBHmuV1Cwp2hah86F2V26c5xnOfWTlOmjRHbuouqCso1kG2l9B6ithpanNNKtCvquNA=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 19:33:16 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 19:33:16 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <tiwai@suse.de>
Subject: Re: [RFC PATCH 0/6] soc-pcm: Add separate snd_pcm_runtime for BEs
Thread-Topic: [RFC PATCH 0/6] soc-pcm: Add separate snd_pcm_runtime for BEs
Thread-Index: AQHXTJysN5KAQo2I4E6xdizgPl/axKrq2YQAgAAO0YCAAAlRAIABdbOAgAGZ3gCABQzXgA==
Date: Mon, 24 May 2021 19:33:15 +0000
Message-ID: <e4687b9d-6515-aa5f-5321-dca6d728e075@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
 <s5him3eizdf.wl-tiwai@suse.de>
 <056e560e-d06d-23bc-b041-60890fa51e63@microchip.com>
 <s5h4keyivdh.wl-tiwai@suse.de>
 <2c2661d3-78a8-de55-e976-b87f3658a093@microchip.com>
 <s5hr1i0f9jb.wl-tiwai@suse.de>
In-Reply-To: <s5hr1i0f9jb.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.119.88.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bc4f81b-bdc3-4976-7837-08d91eeac710
x-ms-traffictypediagnostic: SJ0PR11MB4816:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4816E2DA38EC992B6E69E5A0E7269@SJ0PR11MB4816.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Py9qm6n2QOa2xHiUXveUpSighl7Z/tNCWgdJxMqWgeJhSMTZN7ZderR8E/kcSZ6PZWHA7r1t7Z0Ms4LKcHWL0A2yVho48ca/L9qSAK95bGP+hP/kZlZXYn5KIskC/3F8L7/8lHdmcfxNuADOrg4gMHqPi+ciW/1nzUQNdYZ8QtZKqxh5YBq7diPffEbWmPjpv3trJC/NxBQd47ixzCNE5uc8Tz8A2sDOKrqaOYd+rU9ydsdurQkin9Fjieu3FAi4oo6Dep8sqQPU4hMoWd0ZDWHbctKX1S+inZ1c760GMz4Pk2AMJKarBrsQx+euMAFm9j8vcBbxBGfYfBzWyshpgbqFXtOLqkDW7xEit7WQt+mgDFkpzFsvgpu75dDI96RYRB/82lpm9bGgv7bamtAOfuECNWxK/uQAKlkJLO+WXb7SYZVFMJjnQjKMIeNpJO2SHemEqPv8T8HIwtOg7VDmibP4Kypi0pWNSb2Xjl+1D8vULHtbzMjfZal2d38ZLz/tYin2J9GlLtLUeI1H9S2/8WZiSMm/yuMikbSBUcdC08aXVvjjktOAkh+Lih4KjValzcTRfisXl3OjLBftFthJ78Vb/gbhPUS2ji83Kj+YMb6v4OMUdNF8CkNnvxZ9+fR9qV9VL4TNxC9tPt7FKVRX3JKtB9LcnFkbpzNpNRy3ty5AvPmPEDuIjocrQcytTeDTEU6gdSBWbMFRO34q3Rv819sdLnkgrYe4i6e7lvDzodC11rV7Xuvry3sdPtSJyjuSDG8RgiKrq6F0MzkirwZcRiq5a7SrnFfqedTZitvpmXnDgi9ly2oD2rU8F+Tpw6mN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39850400004)(136003)(346002)(376002)(66446008)(66476007)(66556008)(64756008)(2906002)(2616005)(66946007)(966005)(76116006)(186003)(36756003)(83380400001)(91956017)(86362001)(5660300002)(478600001)(4326008)(6916009)(8676002)(31696002)(6512007)(71200400001)(53546011)(316002)(7416002)(38100700002)(122000001)(26005)(8936002)(6506007)(107886003)(54906003)(31686004)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TXJGY1R1OTNlOVlST2xuKzRDYlllbkZreTA0NkN2ckVML1RpOTJtMDRmNFV0?=
 =?utf-8?B?ZWxNMXd6TTVaZjY1YWtETC9ONk9NTjV6anlOT1FwV1JONmJTN3ZmMHFBczR5?=
 =?utf-8?B?UTZrMnpPNUF1UCtMYjNzSHAyKzUwRkdTSTl2SjZ2RmVxMk9HRXNXUXB6UXpZ?=
 =?utf-8?B?YWlHdUQ1VXR0UzdaSE1XQzRiOG5Xbzc2ZUhiNWdFM0Vub1FUM1lhdmFpQ0FD?=
 =?utf-8?B?Q3UzN1Bia3hOUGxhZGVUNkR0bE5HendPdG9QeitzcWszTkp1MU5YU01ycC9R?=
 =?utf-8?B?YTZjOSt2WFFDOVBSMnpGOWZTYXAwN2tPMGh5dmtWRkwzV2ljMVdlT1VEeXkr?=
 =?utf-8?B?RG1kTVhpVnN1YlRiMW5SbWpMc1E5V3BETjdsOEs2ek54VVRoeXFxN3QrTmhr?=
 =?utf-8?B?Q3JjNXRPRG5YYXJnUENjdE5LZndETlVybGwxN1c1a0RDTnV4Mm1QbHJnQklU?=
 =?utf-8?B?T3F6RFNVemNUeC9Oem44Ykh6K1hCd1UzRkpiSy8zMVU0dy9oS0dPaFN0bEgv?=
 =?utf-8?B?UmJPenR0QUVMMi9ySHZJSlhsQjVhbFRQeG10bWRTV2hTMEVIS2JISWpTcVF4?=
 =?utf-8?B?SnVDTytDWm5pbkwvQmRrK1dzb0ZxK3N0WGZETjlpenNySzJYRTZMQmt0VEJG?=
 =?utf-8?B?Tk9uR1FlanJtMVZKK05jSmlEMVl5a21zc0dGNDNsQ2pLOXNrcC9qQThQV0Rp?=
 =?utf-8?B?Yzl1UlhsRWd0RTlvVWpxUHRqU0hkV1VVYUFqWFcrcnN4MDRUYkxLZjBqSlo5?=
 =?utf-8?B?ZVoxTHVLdUpzb1lYNHAwdzBIVE9rZHNpL3c0Q3FMaVNoQ2VUQWNMWlplbXJa?=
 =?utf-8?B?RnAvVVMyVnNpMjZkN2U4aXl1YURFc0lYYnVmeXBVL0xtazZSSWZJdFh3NTd5?=
 =?utf-8?B?cUQvSHVCMExaZ3laQjRBMmR5cktlUWFsM2dUeEZ3Z2FJT21STGtmMHRUWG9q?=
 =?utf-8?B?VFFkL0ZjS1ZYeCtML2M1Rk5PZjZINld0YVpncWZwbitFUmV3UFAyT1pNaEJm?=
 =?utf-8?B?YVBoL2hKcG8wT3B2bXdpR3hrU1RFVFphcUFBWkcrQkZEeTZSUXN1MjJVWlFR?=
 =?utf-8?B?UStrdVlFTmNRNzBuS2ZlYXI4TkZWMnp3ZTQ0eFN3V1lKWWQvVzl3ejIzWmdL?=
 =?utf-8?B?Z1JaNU9wT3oxSUxYQ3FxZDdiS2JOZE9meGg4ZGF6eFE0cWRvM1JMQk1MZEZX?=
 =?utf-8?B?SzVUdkVYV1czblRxQTZKOUQ2NmFrK0o4QnpHbjZaQ1VSWFJBMzhvVHFnRnp2?=
 =?utf-8?B?NEhtazdYWlMrYW5BNlFvRVhNYlJ6OHZMNEJBNWJMVDFVWXJ1bmtDcTlEVXNT?=
 =?utf-8?B?Y1F0TXJPOWdUTmpnT0hraDRud1lJRGZpVFJxRXo1ZDJDVTV2Qis1MjNCQ1RM?=
 =?utf-8?B?M1h0RG11ZXhVN0k2ejZ5TkVIZGMzMW1rZHRaRjBUT0RBVTRzNThzNDk1OHJs?=
 =?utf-8?B?a2p1RU1EQkdtQ092U3N3L2hHcExIa1hPeWtORGlkTytXbkJZMzhBWVJGUkxk?=
 =?utf-8?B?bDdYWDBTOGgybW9ZaXVXK1J5b25FdURKak0yQ0ovMVVwRjlUZVdIVDYxZHYr?=
 =?utf-8?B?TExoYmZmSmpQaHBoUFFnVWFBODFWbGNzY2NnWjFvTVN4M2JpaUJwaDhkRHBG?=
 =?utf-8?B?OCtxV2RER0lTekRKTm9zZzRDNkt3RHRDbjlrZHFqaS9XWUt3Q0FtM3BzMzVp?=
 =?utf-8?B?QlFBWTgrdmZud05hbS9ZQnZXaCtLdnd5dVFUamcrV0VVMEpwT0xYejY4VENY?=
 =?utf-8?Q?O5ZwCTzNpQfkcqCnqw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94FA55DAD2270A46B61495CFFBD43D3B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc4f81b-bdc3-4976-7837-08d91eeac710
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 19:33:15.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1h5kffGDD9rccagUyrQUbGxJULdi5Ow8b4fOYKocLzdWXMii43+MBtoSSglJxeIxjeVX/CEIVo3toPdrSoZEjVtfMtkK+k5jX94k0uu5Z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org,
 joe@perches.com, Cristian.Birsan@microchip.com
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

T24gMjEuMDUuMjAyMSAxNzoyNiwgVGFrYXNoaSBJd2FpIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgMjAgTWF5IDIwMjEgMTU6NTk6MDIg
KzAyMDAsDQo+IDxDb2RyaW4uQ2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+DQo+
PiBPbiAxOS4wNS4yMDIxIDE4OjQxLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+Pj4gT24gV2VkLCAx
OSBNYXkgMjAyMSAxNzowODoxMCArMDIwMCwNCj4+PiA8Q29kcmluLkNpdWJvdGFyaXVAbWljcm9j
aGlwLmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+IE9uIDE5LjA1LjIwMjEgMTc6MTUsIFRha2FzaGkg
SXdhaSB3cm90ZToNCj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Ig
b3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+
Pj4NCj4+Pj4+IE9uIFdlZCwgMTkgTWF5IDIwMjEgMTI6NDg6MzYgKzAyMDAsDQo+Pj4+PiBDb2Ry
aW4gQ2l1Ym90YXJpdSB3cm90ZToNCj4+Pj4+Pg0KPj4+Pj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyBh
IGRpZmZlcmVudCBzbmRfcGNtX3J1bnRpbWUgaW4gdGhlIEJFJ3Mgc3Vic3RyZWFtLA0KPj4+Pj4+
IHJlcGxhY2luZyB0aGUgRkUncyBzbmRfcGNtX3J1bnRpbWUuIFdpdGggYSBkaWZmZXJlbnQgc3Ry
dWN0dXJlLCB0aGUgQkUNCj4+Pj4+PiBIVyBjYXBhYmlsaXRpZXMgYW5kIGNvbnN0cmFpbnRzIHdp
bGwgbm8gbG9uZ2VyIG1lcmdlIHdpdGggdGhlIEZFIG9uZXMuDQo+Pj4+Pj4gVGhpcyBhbGxvd3Mg
Zm9yIGVycm9yIGRldGVjdGlvbiBpZiB0aGUgYmVfaHdfcGFyYW1zX2ZpeHVwKCkgYXBwbGllcyBI
Vw0KPj4+Pj4+IHBhcmFtZXRlcnMgbm90IHN1cHBvcnRlZCBieSB0aGUgQkUgREFJcy4gQWxzbywg
aXQgY2FsY3VsYXRlcyB2YWx1ZXMNCj4+Pj4+PiBuZWVkZWQgZm9yIG1lbS10by1kZXYvZGV2LXRv
LW1lbSBETUEgdHJhbnNmZXJzLCBzdWNoIGFzIGJ1ZmZlciBzaXplIGFuZA0KPj4+Pj4+IHBlcmlv
ZCBzaXplLCBpZiBuZWVkZWQuDQo+Pj4+Pj4NCj4+Pj4+PiBUaGUgZmlyc3QgNCBwYXRjaGVzIGFy
ZSBwcmVwYXJhdG9yeSBwYXRjaGVzLCB0aGF0IGp1c3QgZ3JvdXAgYW5kIGV4cG9ydA0KPj4+Pj4+
IGZ1bmN0aW9ucyB1c2VkIHRvIGFsbG9jYXRlIGFuZCBpbml0aWFsaXplIHRoZSBzbmRfcGNtX3J1
bnRpbWUuIEFsc28sIHRoZQ0KPj4+Pj4+IGZ1bmN0aW9ucyB0aGF0IHNldCBhbmQgYXBwbHkgdGhl
IEhXIGNvbnN0cmFpbnRzIGFyZSBleHBvcnRlZC4NCj4+Pj4+PiBUaGUgNXRoIHBhdGNoIGRvZXMg
KGFsbW9zdCkgZXZlcnl0aGluZyBuZWVkIHRvIGNyZWF0ZSB0aGUgbmV3IHNuZF9wY21fcnVudGlt
ZQ0KPj4+Pj4+IGZvciBCRXMsIHdoaWNoIGluY2x1ZGVzIGFsbG9jYXRpb24sIGluaXRpYWxpemlu
ZyB0aGUgSFcgY2FwYWJpbGl0aWVzLA0KPj4+Pj4+IEhXIGNvbnN0cmFpbnRzIGFuZCBIVyBwYXJh
bWV0ZXJzLiBUaGUgQkUgSFcgcGFyYW1ldGVycyBhcmUgbm8gbG9uZ2VyDQo+Pj4+Pj4gY29waWVk
IGZyb20gdGhlIEZFLiBUaGV5IGFyZSByZWNhbGN1bGF0ZWQsIGJhc2VkIG9uIEhXIGNhcGFiaWxp
dGllcywNCj4+Pj4+PiBjb25zdHJhaW50cyBhbmQgdGhlIGJlX2h3X3BhcmFtc19maXh1cCgpIGNh
bGxiYWNrLg0KPj4+Pj4+IFRoZSA2dGggYW5kIGxhc3QgcGF0Y2ggYmFzaWNhbGx5IGFkZHMgc3Vw
cG9ydCBmb3IgdGhlIFBDTSBnZW5lcmljDQo+Pj4+Pj4gZG1hZW5naW5lIHRvIGJlIHVzZWQgYXMg
YSBwbGF0Zm9ybSBkcml2ZXIgZm9yIEJFIERBSSBsaW5rcy4gSXQgYWxsb2NhdGVzDQo+Pj4+Pj4g
YSBidWZmZXIsIG5lZWRlZCBieSB0aGUgRE1BIHRyYW5zZmVycyB0aGF0IGRvIG5vdCBzdXBwb3J0
IGRldi10by1kZXYNCj4+Pj4+PiB0cmFuc2ZlcnMgYmV0d2VlbiBGRSBhbmQgQkUgREFJcy4NCj4+
Pj4+Pg0KPj4+Pj4+IFRoaXMgaXMgYSBzdXBlcnNldCBvZg0KPj4+Pj4+IGh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRldmVsLzIwMjEtTWFyY2gvMTgyNjMw
Lmh0bWwNCj4+Pj4+PiB3aGljaCBvbmx5IGhhbmRsZXMgdGhlIEJFIEhXIGNvbnN0cmFpbnRzLiBU
aGlzIHBhdGNoc2V0IGFpbXMgdG8gYmUgbW9yZQ0KPj4+Pj4+IGNvbXBsZXRlLCBkZWZpbmluZyBh
IGEgc25kX3BjbV9ydW50aW1lIGJldHdlZW4gZWFjaCBGRSBhbmQgQkUgYW5kIGNhbg0KPj4+Pj4+
IGJlIHVzZWQgYmV0d2VlbiBhbnkgREFJIGxpbmsgY29ubmVjdGlvbi4gSSBhbSBzdXJlIEkgYW0g
bm90IGhhbmRsaW5nIGFsbA0KPj4+Pj4+IHRoZSBuZWVkZWQgbWVtYmVycyBvZiBzbmRfcGNtX3J1
bnRpbWUgKHN1Y2ggYXMgaGFuZGxpbmcNCj4+Pj4+PiBzdHJ1Y3Qgc25kX3BjbV9tbWFwX3N0YXR1
cyAqc3RhdHVzKSwgYnV0IEkgd291bGQgbGlrZSB0byBoYXZlIHlvdXINCj4+Pj4+PiBmZWVkYmFj
ayByZWdhcmRpbmcgdGhpcyBpZGVhLg0KPj4+Pj4NCj4+Pj4+IEknbSBhbHNvIGNvbmNlcm5lZCBh
Ym91dCB0aGUgaGFuZGxpbmcgb2Ygb3RoZXIgZmllbGRzIGluIHJ1bnRpbWUNCj4+Pj4+IG9iamVj
dCwgbWF5YmUgYWxsb2NhdGluZyBhIGNvbXBsZXRlIHJ1bnRpbWUgb2JqZWN0IGZvciBlYWNoIEJF
IGlzIGFuDQo+Pj4+PiBvdmVya2lsbCBhbmQgZnJhZ2lsZS4gIENvdWxkIGl0IGJlIHJhdGhlciBv
bmx5IGh3X2NvbnN0cmFpbnRzIHRvIGJlDQo+Pj4+PiB1bmlxdWUgZm9yIGVhY2ggQkUsIGluc3Rl
YWQ/DQo+Pj4+DQo+Pj4+IEkgdHJpZWQgd2l0aCBvbmx5IHRoZSBodyBjb25zdHJhaW50cyBpbiB0
aGUgcHJldmlvdXMgcGF0Y2hzZXQgYW5kIGl0J3MNCj4+Pj4gZGlmZmljdWx0IHRvIGhhbmRsZSB0
aGUgc25kX3BjbV9od19ydWxlX2FkZCgpIGNhbGxzLCB3aXRob3V0IGNoYW5naW5nDQo+Pj4+IHRo
ZSBmdW5jdGlvbidzIGRlY2xhcmF0aW9uLiBUaGlzIHNvbHV0aW9uIHJlcXVpcmVzIG5vIGNoYW5n
ZXMgdG8NCj4+Pj4gY29uc3RyYWludHMgQVBJLCBub3IgdG8gdGhlaXIgJ2NsaWVudHMnLiBJIGFn
cmVlIHRoYXQgaGFuZGxpbmcgYWxsIHRoZQ0KPj4+PiBydW50aW1lIGZpZWxkcyBtaWdodCBiZSBv
dmVyLWNvbXBsaWNhdGVkLiBGcm9tIHdoYXQgSSBzZWUsIHRoZSBzY2FyeQ0KPj4+PiBvbmVzIGFy
ZSB1c2VkIHRvIGRlc2NyaWJlIHRoZSBidWZmZXIgYW5kIHRoZSBzdGF0dXMgb2YgdGhlIHRyYW5z
ZmVycy4gSQ0KPj4+PiBkbyBub3QgdGhpbmsgdGhlcmUgYXJlIEJFcyB0aGF0IHVzZSB0aGVzZSB2
YWx1ZXMgYXQgdGhpcyBtb21lbnQgKHRoZSBGRQ0KPj4+PiBvbmVzKS4gSSB0aGluayB0aGF0IHRo
ZSBIVyBwYXJhbXMsIHByaXZhdGUgc2VjdGlvbiwgaGFyZHdhcmUgZGVzY3JpcHRpb24NCj4+Pj4g
YW5kIG1heWJlIERNQSBtZW1iZXJzIChhdCBsZWFzdCBpbiBteSBjYXNlKSBhcmUgbW9zdGx5IG5l
ZWRlZCBieSBCRXMuDQo+Pj4NCj4+PiBPSywgSSdsbCBjaGVjayB5b3VyIHByZXZpb3VzIHNlcmll
cyBhZ2FpbiwgYnV0IG15IGd1dCBmZWVsaW5nIGlzIGZvcg0KPj4+IHB1cnN1aXQgdG8gdGhlIGh3
X2NvbnN0cmFpbnRzIGhhY2tzLiAgZS5nLiB3ZSBtYXkgc3BsaXQNCj4+PiBzbmRfcGNtX2h3X2Nv
bnN0cmFpbnRzIGFuZCBzbmRfcGNtX2h3X3J1bGUsIHRvbywgaWYgdGhhdCBtYXR0ZXJzLg0KPj4N
Cj4+IFNvbWV0aGluZyBsaWtlIGFkZGluZyBzbmRfcGNtX2h3X3J1bGUgZGlyZWN0bHkgdW5kZXIN
Cj4+IHNuZF9wY21fcnVudGltZSwgdG8gc3RvcmUgdGhlIEJFIGNvbnN0cmFpbnRzPyBJdCBjb3Vs
ZCB3b3JrLCBidXQgSSB0aGluaw0KPj4gd2Ugc2hvdWxkIGFsc28gYmUgYWJsZSB0byByZW1vdmUg
cnVsZXMsIGlmIG9uZSBCRSBnZXRzIGRpc2Nvbm5lY3RlZC4NCj4+IFRoaXMgbWVhbnMgdGhhdCB3
ZSB3aWxsIG5lZWQgYSB3YXkgdG8gaWRlbnRpZnkgb3Igc2VwYXJhdGUgdGhlbSwgZm9yDQo+PiBl
YWNoIEJFLCByaWdodD8NCj4gDQo+IFdlbGwsIGlmIGVhY2ggQkUgbmVlZHMgYSBkaWZmZXJlbnQg
c2V0IG9mIGh3IGNvbnN0cmFpbnQgcnVsZXMsIGl0DQo+IG5lZWRzIGl0cyBvd24gdW5pcXVlIGNv
cGllcyBpbnN0ZWFkIG9mIHNoYXJpbmcgdGhlIHJ1bGVzLiAgSXMgaXQgeW91cg0KPiByZXF1aXJl
bWVudD8NCg0KWWVzLCBJIGFtIHRoaW5raW5nIHRoYXQgdGhlIGNvbnN0cmFpbnRzIHNob3VsZCBi
ZSBncm91cGVkIGZvciBvbmUgQkUsIA0Kc2luY2UgdGhlIEhXIHBhcmFtZXRlcnMgYXJlIHRoZSBz
YW1lIGZvciBhbGwgdGhlIERBSXMoQ1BVcyBhbmQgY29kZWNzKSANCmluIGEgQkUuDQpBbHNvLCBJ
IHRoaW5rIHRoYXQgdGhlIHNlcGFyYXRpb24gb2Ygc25kX3BjbV9oYXJkd2FyZSBpcyBpbXBvcnRh
bnQuIEZyb20gDQp3aGF0IEkgdW5kZXJzdGFuZCBub3csIHRoZSBCRSBDUFVzIHNuZF9zb2NfcGNt
X3N0cmVhbSBzdHJ1Y3R1cmVzIGFyZSANCmlnbm9yZWQgZW50aXJlbHkgYW5kIHRoZSBjb2RlY3Mg
c25kX3NvY19wY21fc3RyZWFtIHN0cnVjdHVyZXMgYXJlIA0KY29uc2lkZXJlZCBvbmx5IGlmIGZl
LT5kYWlfbGluay0+ZHBjbV9tZXJnZWRfKiBmbGFncyBhcmUgc2V0IFsxXS4gVGhpcyANCm1lYW5z
IHRoYXQgYmVfaHdfcGFyYW1zX2ZpeHVwKCkgY2FsbGJhY2sgKEJFIEhXIHBhcmFtcykgaXMgbm90
IGFmZmVjdGVkIA0KYnkgdGhlIEJFIGRyaXZlcnMnIHNuZF9zb2NfcGNtX3N0cmVhbS4gV2UgYXJl
IHJlbHlpbmcgb24gdGhlIGZhY3QgdGhhdCANCmRldmVsb3BlcnMga25vdyB3aGF0IGNhcGFiaWxp
dGllcyB0aGUgQkUgREFJcyBoYXZlLCBpbiBvcmRlciB0byBzZXQgDQpiZV9od19wYXJhbXNfZml4
dXAuIEV2ZW4gdGhvdWdoIEhXIGNhcGFiaWxpdGllcyBhcmUgc3ViamVjdCB0byBjaGFuZ2UgaWYg
DQpIVyBidWdzIGFyZSBkaXNjb3ZlcmVkLi4uIEFtIEkgbWFraW5nIHNlbnNlPw0KSSBzdGlsbCBw
cmVmZXIgdGhlIHNlcGFyYXRlIHNuZF9wY21fcnVudGltZSwgc2luY2UsIGZvciBteSBjYXNlLCBJ
IGFtIA0KYWJsZSB0byBzZXQgZGlmZmVyZW50IHJ1bnRpbWUtPihyYXRlLCBjaGFubmVscywgc3Vi
Zm9ybWF0LCBmcmFtZV9iaXRzLCANCnNhbXBsZV9iaXRzLCBwZXJpb2QvYnVmZmVyX3NpemUsIGV0
Yy4pIGFuZCBsYXRlciB1c2UgYnl0ZXNfdG9fKiBhbmQgDQoqX3RvX2J5dGVzKCkgY2FsbGJhY2tz
IGZyZWVseSwgYnV0IGlmIHRoaXMgc3RlcCBpcyB0b28gYmlnLCBtYXliZSB3ZSBjYW4gDQpzcGxp
dCBpdCB1cCBhbmQgc3RhcnQgd2l0aCBzb21ldGhpbmcgd2UgY2FuIGFsbCBhZ3JlZSBvbiB0aGUg
SFcgY29uc3RyYWludHMuDQoNClRoYW5rIHlvdSBmb3IgeW91ciB0aW1lIQ0KDQpCZXN0IHJlZ2Fy
ZHMsDQpDb2RyaW4NCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUu
MTMtcmMzL3NvdXJjZS9zb3VuZC9zb2Mvc29jLXBjbS5jI0wxNzY4DQo=
