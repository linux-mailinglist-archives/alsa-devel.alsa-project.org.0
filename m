Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB13BEC6F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B104A83D;
	Wed,  7 Jul 2021 18:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B104A83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625676135;
	bh=CxZPECGTEs3ZHrVKv/DpkTDK67H4Ajq6W2Jp6NVzmNA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkdiCcy5rpcalzyAh/cmGSSIKRhJyf5RdVMp59VSDUJbPXBOUeoar2Hw/2qjMsfnK
	 cC15Lm0kS3bRf9Iv30Smjfk9g2ML9YtDWnYyI51OyiuolpNpPGmACXtXRuZRzmErzT
	 phJGSNYxXrYwqEqp2KcjDmtSas/OI7mUIuRn3lRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2480FF8012F;
	Wed,  7 Jul 2021 18:40:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE637F80224; Wed,  7 Jul 2021 18:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23925F8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23925F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="eTLGZNOg"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="QJT7FjQL"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625676044; x=1657212044;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CxZPECGTEs3ZHrVKv/DpkTDK67H4Ajq6W2Jp6NVzmNA=;
 b=eTLGZNOgbb90cLOVQyGmZxpW/4x8Iqzovvdimnz4+HTOLLHT0DlXNzNR
 FAUzl/Bo2EyjcO5vEzqQvcaZsrQmUv+wAwEr8F/D3zNmMDPH5dXIOyZoM
 kf2qMDIKRQYu5M2RLdvAjeOLYDBJmlFzrERep5KB2Zjok1S84SVNnhGHZ
 oxdoZKMjWN3GpZLUT7uBHR6Lu5JkmBhzhCyye2sPA0QcistxLiLj0Abes
 kL/CiGGa5LmS5ihzKYjEVgnUrTWg+IWKj2Ff1wu4B6JT0Kn7Ti7XpiO2y
 eIPjGjhh4mg81OPEXtwO3jfnFo7KfqAIfQYi3it3wh9GLLD6DKVVokdB3 A==;
IronPort-SDR: 7mqThZz2PlRu+Ze5nuGrs5bV6eB57nKDzeXQF1QjD2aNlSu866qb29T1WSvOlp2sbKZzxjh8+b
 BUGgkchRZ09aZ4GDnGISYDh9pmIhuZ3J6AaZJ/RXTfsQaIupVKUE8KBGBjpUKeZfklFZV8Osjt
 3R2w+T3mNgcGb8BzlCxoZFvVpQmF58KPyFsSRoQunWSVskkKC0P+j255jTsEy/45pyE+b2o8EN
 SXMt6e7Z/s6aeugVrdgUbDr70apRSjwR/q24UOUa4XdzANMeTdFOJAVjQV46OrlVvgA1Wve2Vf
 KeI=
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="127973799"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Jul 2021 09:40:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 09:40:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 7 Jul 2021 09:40:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPONQwJucKKg9UGJeCWZaORK5JtMrqaJMe70vMJ9no9sHR9azNCBQpnexIApfsTsdJGSoC+EKnTvbSS+pyVFEfh9oCDSA56cuFGpHpz0Gr5OiEG3IjI8bIKHKKL5zKot7xYu4kW9OGKdw/uN49e/I8+XBUDWCyX6ahvttf/aW5KCq873Y6ILmTSYQPwc5yBhbsRxpCKH8KIYFwBcc2knuQxWcuO6Zs3f0xa7cFimV0GLD4IX1A12o5D84DDjcBqi3glRwjNyz1SEJg8m86OZ2G6KNhSr8xWr+2IpsODGFisncpFELxnyiSkyNxjEhAKCaJ1pXQ2kbibVnKEMunTawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxZPECGTEs3ZHrVKv/DpkTDK67H4Ajq6W2Jp6NVzmNA=;
 b=lEpEs9EnhNyaRFvkUk2nYr0b6XNfjWOi0sJEu47nWZODn5Ay9VOo5IaMlo0ChvAtLbWrFWW1JCXOHIxmXEIjox5yWSBqUwHmJZNlFZQJkYV15KqFkz8/uOrlD5KfBtcrtzWD3ngk0E59F7y7yPyucx1hKvUtfxuywIQmMj5P2Batp5THiFo3D42ZY83vWNQdo+1LGOrhokjpNNBE02IBP0DEEfGqQcfa7kFri0jcLn+gnU5F5AYpenuJbtEoA+THmPmnZNecg/3hQgHLpJleIlHeeo/L7Bw/rFMFrOI0YYCuY9CQDl7tss4urY1u+DsLutnfj92WvF0VdxN0mUoJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxZPECGTEs3ZHrVKv/DpkTDK67H4Ajq6W2Jp6NVzmNA=;
 b=QJT7FjQLWU13r81D7/xMRa/GYYU0VEuhqXA9UgPNHw3BazfJdyKwsamGHb4OvcHz/P2UhwIAaJewEN61fechCMrFUjECvh+lG35gD2kRbFekJpdHTrLGX5PKr5cpQJlogxvE99QqC2da/x5rHk/iUtVlxDGhYNzsQ9U9momNsh0=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB4300.namprd11.prod.outlook.com (2603:10b6:5:1dc::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.26; Wed, 7 Jul 2021 16:40:35 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::44ef:d8cf:6e86:2cd5%4]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 16:40:34 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Thread-Topic: [PATCH v2] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Thread-Index: AQHXbGJA/QwXKUiM2kuYODR7cZ2cO6s3xNgA
Date: Wed, 7 Jul 2021 16:40:34 +0000
Message-ID: <5613542b-a530-ebd8-11c6-ea515cb3f8a9@microchip.com>
References: <20210628211158.30273-1-rdunlap@infradead.org>
In-Reply-To: <20210628211158.30273-1-rdunlap@infradead.org>
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
x-ms-office365-filtering-correlation-id: 79e115fb-4219-4f8e-6e5a-08d94165f191
x-ms-traffictypediagnostic: DM6PR11MB4300:
x-microsoft-antispam-prvs: <DM6PR11MB4300F142B6821DF72E30D192E71A9@DM6PR11MB4300.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YEymRi6qFbws11M5PP0aK+E9DJtw+PGseS7QH/Q7A4bFWkRXcRiCGfrmpKgwb/vFpnqjv2569A748bfrPhPQ+oDEjDuhTlTeii6+Ot/nE56Y9OcAuFUuptgSQQcDUEuZrhvu581hdVH+RKo5x809f5gdWMVYj52sTRDDy4N9VfN0xlbITTQcQSp5Ui77ARR8eQiICG3R/Kvp96kVQtYsXVRiNpvjbDW/RQbJZOobXfmVu0v33jhGM/O7bhjk/bX/echiL1vLU0gxpMZu/daqTTEe3HkufTPiTxSfk/TdmriBX/7c3ALhA+Y+wWiib42oME9b7cLpvX+ppEncXUnv/uJ5aBJONxUC1fltKen9qkeBqbTyr/lmHjHAVICXKkcHAPYpV5eYAZ8pJcYCkavWw2EoONlNm0rZ01zxuy/Svkl9kxM10reNXxHjNaoi2QTFUVRRj6SEsmrFtVYUXfjA7jV64AiicBK6FcOLBZlnph9C5hLZSro/hB0dctKjXQNJj27K7rj0Esje7iKdESll3FSe3KKUBYb4ZpczEPRRUWo/j4fKiF/XTM2B8XozSUsxeb6M+XY+G9F2yjsku2xLZcec45O6krmJyyIv3EIM66TEC54prYdfpQ28HDza2bvKiaCGbM7oqB/+DaYrpU+JLPxN2tIWrkzv64O6k+JvTsD6MNoSiY8OTS1q2SbYkRbkb2uqOd5ehjwHMq/AQMxKReTPblNy4acbztwRgAueYvM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(39860400002)(346002)(366004)(26005)(53546011)(6506007)(71200400001)(66556008)(478600001)(4326008)(186003)(64756008)(36756003)(2906002)(6512007)(76116006)(66946007)(31686004)(54906003)(8936002)(8676002)(66476007)(122000001)(31696002)(91956017)(110136005)(38100700002)(316002)(6486002)(83380400001)(5660300002)(2616005)(66446008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1UyR1c0aDlNYnBJRU93QjZzQlVOOGlNQmNHSE14RHpwUlZJMDVVN0FLREps?=
 =?utf-8?B?aXltR1NOWW94M2U3K2lLRmRQWE94dnlFbmE1Rlp0TUNQMHdiMEZVYVllSVV4?=
 =?utf-8?B?MnBQSVNkS00vVnNJZWtJNXdTcWs1dHp3MkxRSGduOWc4cWVTK0VVcnpwZWpJ?=
 =?utf-8?B?NnJKU0dLUU5vQkxNcE5tSEJvd0FXelBFQTBuY0cwbitjMHJRSXA1a2NuKzEy?=
 =?utf-8?B?SGN1clYyajZYRzBzdUVJV05MVFRsUWh4SkNjbWRLQzg3ZE5RM2NNU0VWUUx2?=
 =?utf-8?B?N1RveW54ZHdHVkkvVXEveXZYcjFKRUNnU01qWngwOU5Yc0wvYjZ3QXZyMFN5?=
 =?utf-8?B?cjltWVp3TVRSS0hWaU8zL2RZODlscDhReXZFRVlHOWR4bUJoWW1vaVliVFha?=
 =?utf-8?B?ei9qOW9QNnNyZ1E5N1Q1eUx5aEEwdGlRbGtpTW92ODlvVmthamFsaWg4U1NS?=
 =?utf-8?B?Y1U3TlJRanhPWmtuUmF4M251VytabXppY1kvTDhaZ2dRbmRBWUhSdzJuQ3VU?=
 =?utf-8?B?bkErUlg0ZmxNK3AvaVNMLzhvQnJDSy9CL1RiNEtUN0pVYlN2eWtjVm9xZmx1?=
 =?utf-8?B?L1JtdWhHSDlzMXJWd3dpRWJvYWlwaStCRndVZVF4MjF3aHNuRmd1c2VWVTYv?=
 =?utf-8?B?cTZqazR0V21PL2RlL1BRTDFGdHdqZ2RRMHo4bHRBNjdBQmprL29meG1WM1RV?=
 =?utf-8?B?SUVObGlVSDRMVG1CNGlkMlJMR2ZkNXBaMkNSbFYvU1F0RnVacklLYk0zZWNp?=
 =?utf-8?B?RUhkWENoWStoUDA4VURzL25WK09hNDF2RklsRGdCaHhoMndkOEdxOWZmTWJ3?=
 =?utf-8?B?a0I1VXpzUFJ4YlR2cjdkUjJ4RXEwWVFhellscnZ0SkdJak1yRkRnSTNQTUlC?=
 =?utf-8?B?anhFRU14dENoMGRqWmFRUlVCa29VcGlZYko3cndmZTNsdFJ3T3NKdks2cmlQ?=
 =?utf-8?B?cGlhT2pmSm50L09wS3lHN0czMmp2NFAxNlA1T3AxVDZ0ZVIxL2gvVTF5V1cr?=
 =?utf-8?B?TmM4d1NuUkM4Rk8vclZSSFh3aVVtNTJqVWlvdjdZUytRcFlLZmppMWNaY1ZM?=
 =?utf-8?B?QmtWRkVuSGxFalZuRXQvQmpxbU1YdEZzQnZlaGJBV0ZhNUFuekRENTg1bTdM?=
 =?utf-8?B?V2VudjNNb2FWcFNWOHhOeVozeTM1b0IrSDB4Tlh6RkVPejNHMjY1b2VrQm84?=
 =?utf-8?B?cG5rR0U4Zlg3clZJMU1naTlsc3dTTXZPYUJSOTc2NmVQZDJwaS9iOTJ3cXNS?=
 =?utf-8?B?b0ovNjByam9ySVNtbGxobUU2NEo0bDJPejQ5MnFQSzVKS3JiZGcwSExFb3JI?=
 =?utf-8?B?bkRxcHIzNkhDKzhPbTVEOHJTcnJvdk1hY1Z0VTd0WEs0NmlaMnlWaE41Nlpm?=
 =?utf-8?B?Y2ZFcGsxY1VCMlQ0M0pldFpzWXdyMlgyL01rTzhnTzdFeUpQQ3pja2krTWJm?=
 =?utf-8?B?ajZLZjFxMDBKb1U3eTRRMHIzUUdwUGJwbERGOHpwcyt4MWNEbEtOMEpwV2FW?=
 =?utf-8?B?M3NpNEd4UTBQdEVTTjJrMTVRcE5kOVRvWDNodVBSUUhQNU1EcXJlV0QvQ3Yv?=
 =?utf-8?B?ZStObzFnTWdMWUZHSFgwQ3ZYdzFtM0VDclN4dEFIYkQzMHNGSTM1b1pqbjZW?=
 =?utf-8?B?aExQQmliaThGM2RwNm1ndVNqQW9qNXRKVEtEVHJvWnp2cEtKK2pMczVNSTBp?=
 =?utf-8?B?YjFXTWpsdUFaOFhpTzk2NExYcUR4aTIvTGNHQWVhZnBHYjJZNDN5WTBFc3VH?=
 =?utf-8?Q?j27fMlL06LpLCa7kEA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F2F5C138853094DA251159B05794CF8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e115fb-4219-4f8e-6e5a-08d94165f191
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 16:40:34.9022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWw6SIj6IHB4P7aSpFdH4QO72kDOZZBGphCbOnr/k8uYqKr4JRPK7iQsAA9fLuzsrO8oPCoNyC2wZQJfJHUVPx+bZv0ohfln0knFyS09oDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4300
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

T24gMjkuMDYuMjAyMSAwMDoxMSwgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIGEgY29uZmlnIChzdWNoIGFzIGFyY2gvc2gv
KSB3aGljaCBkb2VzIG5vdCBzZXQgSEFTX0RNQSB3aGVuIE1NVQ0KPiBpcyBub3Qgc2V0LCBzZXZl
cmFsIEFUTUVMIEFTb0MgZHJpdmVycyBzZWxlY3Qgc3ltYm9scyB0aGF0IGNhdXNlDQo+IGtjb25m
aWcgd2FybmluZ3MuIFRoZXJlIGlzIG9uZSAiZGVwZW5kcyBvbiBIQVNfRE1BIiBoZXJlIGJ1dCBz
ZXZlcmFsDQo+IG1vcmUgYXJlIG5lZWRlZCB0byBwcmV2ZW50IGtjb25maWcgd2FybmluZ3Mgc2lu
Y2UgJ3NlbGVjdCcgZG9lcyBub3QNCj4gcmVjb2duaXplIGFueSBkZXBlbmRlbmNpZXMuDQo+IA0K
PiBGaXggdGhlIGZvbGxvd2luZyBrY29uZmlnIHdhcm5pbmdzOg0KPiANCj4gV0FSTklORzogdW5t
ZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgU05EX0FUTUVMX1NPQ19QREMNCj4g
ICAgRGVwZW5kcyBvbiBbbl06IFNPVU5EIFs9bV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJiBTTkRf
U09DIFs9bV0gJiYgU05EX0FUTUVMX1NPQyBbPW1dICYmIEhBU19ETUEgWz1uXQ0KPiAgICBTZWxl
Y3RlZCBieSBbbV06DQo+ICAgIC0gU05EX0FUTUVMX1NPQ19TU0MgWz1tXSAmJiBTT1VORCBbPW1d
ICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dICYmIFNORF9BVE1FTF9TT0MgWz1t
XQ0KPiAgICAtIFNORF9BVE1FTF9TT0NfU1NDX1BEQyBbPW1dICYmIFNPVU5EIFs9bV0gJiYgIVVN
TCAmJiBTTkQgWz1tXSAmJiBTTkRfU09DIFs9bV0gJiYgU05EX0FUTUVMX1NPQyBbPW1dICYmIEFU
TUVMX1NTQyBbPW1dDQo+IA0KPiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRl
dGVjdGVkIGZvciBTTkRfQVRNRUxfU09DX1NTQ19QREMNCj4gICAgRGVwZW5kcyBvbiBbbl06IFNP
VU5EIFs9bV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJiBTTkRfU09DIFs9bV0gJiYgU05EX0FUTUVM
X1NPQyBbPW1dICYmIEFUTUVMX1NTQyBbPW1dICYmIEhBU19ETUEgWz1uXQ0KPiAgICBTZWxlY3Rl
ZCBieSBbbV06DQo+ICAgIC0gU05EX0FUOTFfU09DX1NBTTlHMjBfV004NzMxIFs9bV0gJiYgU09V
TkQgWz1tXSAmJiAhVU1MICYmIFNORCBbPW1dICYmIFNORF9TT0MgWz1tXSAmJiBTTkRfQVRNRUxf
U09DIFs9bV0gJiYgKEFSQ0hfQVQ5MSB8fCBDT01QSUxFX1RFU1QgWz15XSkgJiYgQVRNRUxfU1ND
IFs9bV0gJiYgU05EX1NPQ19JMkNfQU5EX1NQSSBbPW1dDQo+IA0KPiBXQVJOSU5HOiB1bm1ldCBk
aXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBTTkRfQVRNRUxfU09DX1NTQw0KPiAgICBE
ZXBlbmRzIG9uIFtuXTogU09VTkQgWz1tXSAmJiAhVU1MICYmIFNORCBbPW1dICYmIFNORF9TT0Mg
Wz1tXSAmJiBTTkRfQVRNRUxfU09DIFs9bV0gJiYgSEFTX0RNQSBbPW5dDQo+ICAgIFNlbGVjdGVk
IGJ5IFttXToNCj4gICAgLSBTTkRfQVRNRUxfU09DX1NTQ19ETUEgWz1tXSAmJiBTT1VORCBbPW1d
ICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dICYmIFNORF9BVE1FTF9TT0MgWz1t
XSAmJiBBVE1FTF9TU0MgWz1tXQ0KPiANCj4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVu
Y2llcyBkZXRlY3RlZCBmb3IgU05EX0FUTUVMX1NPQ19TU0NfRE1BDQo+ICAgIERlcGVuZHMgb24g
W25dOiBTT1VORCBbPW1dICYmICFVTUwgJiYgU05EIFs9bV0gJiYgU05EX1NPQyBbPW1dICYmIFNO
RF9BVE1FTF9TT0MgWz1tXSAmJiBBVE1FTF9TU0MgWz1tXSAmJiBIQVNfRE1BIFs9bl0NCj4gICAg
U2VsZWN0ZWQgYnkgW21dOg0KPiAgICAtIFNORF9BVE1FTF9TT0NfV004OTA0IFs9bV0gJiYgU09V
TkQgWz1tXSAmJiAhVU1MICYmIFNORCBbPW1dICYmIFNORF9TT0MgWz1tXSAmJiBTTkRfQVRNRUxf
U09DIFs9bV0gJiYgKEFSQ0hfQVQ5MSB8fCBDT01QSUxFX1RFU1QgWz15XSkgJiYgQVRNRUxfU1ND
IFs9bV0gJiYgSTJDIFs9bV0NCj4gICAgLSBTTkRfQVQ5MV9TT0NfU0FNOVg1X1dNODczMSBbPW1d
ICYmIFNPVU5EIFs9bV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJiBTTkRfU09DIFs9bV0gJiYgU05E
X0FUTUVMX1NPQyBbPW1dICYmIChBUkNIX0FUOTEgfHwgQ09NUElMRV9URVNUIFs9eV0pICYmIEFU
TUVMX1NTQyBbPW1dICYmIFNORF9TT0NfSTJDX0FORF9TUEkgWz1tXQ0KDQpIaSBSYW5keSwNCg0K
U29ycnkgYWJvdXQgbXkgZGVsYXllZCByZXNwb25zZS4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0
ZXIgdG8ganVzdCANCnJlbW92ZSBIQVNfRE1BIGZyb20gU05EX0FUTUVMX1NPQ19QREMsIHNpbmNl
IGl0IHNlZW1zIHRvIGNvbXBpbGUgZmluZSANCndpdGhvdXQgaXQuIFRoaXMgc2hvdWxkIGZpeCBh
bGwgdGhlIHByb2JsZW1zLi4uDQoNClRoYW5rcyBhbmQgYmVzdCByZWdhcmRzLA0KQ29kcmluDQo=
