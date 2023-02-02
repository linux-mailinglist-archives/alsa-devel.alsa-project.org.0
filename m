Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692BF6884EA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 17:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6CAF4E;
	Thu,  2 Feb 2023 17:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6CAF4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675357085;
	bh=kVhVdF0ZCI5RjJ6UuxM7/0xSXTEiq6D1NrVeoYgM76c=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u++AHVMGkz3yXA+RvflwAriUGucEJAQf3Hz8/9SWnuy6D5gWIvRXpRulMvz+e+KnO
	 XGFPXVKFzbx6cKz5Omv85vh/Tqmcm/pM7y1RoWCe+Hn7MFQclGoJHpHFXRHQaCd6YX
	 nDNbK3hKtW7atJ0wAU3uNo9Ga1/PCwxI2eqlY5VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB8FEF804DF;
	Thu,  2 Feb 2023 17:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DD90F804C2; Thu,  2 Feb 2023 17:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB5CF800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 17:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB5CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=microchip.com
 header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=VGSgV89w; 
 dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=d3E4UpdC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1675357018; x=1706893018;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kVhVdF0ZCI5RjJ6UuxM7/0xSXTEiq6D1NrVeoYgM76c=;
 b=VGSgV89wHn+M71VIMAuIv94MXb+v2O6RHS8DTT9Rs+mBwCCRX1sUlry/
 paoCfnkb0Icyce+LjCCKuWPXXAComJbte+lk8TxR+MBvbklbToyguxr0C
 cr9LdEmjNgMjF1fM0UvdhxbkeZ+HJmhBvURf8376mJe9CeSv5zQrkuO9e
 t/xkux9WXdFonQEenS4fZ+jaTaoAT5Yw2RtFFFdMpZwj6sQnrnyT2YEnA
 +BHI34gUyJeC0R8rsUE6iuOwz/mC4+XZw0WwWFo4dGHK/rCCP5WW2YCtD
 BaPiaQyE3ddx20GTOagKfSfWJiyxcxX9J5dvBuWNaHnHOJNwdSqTpdB50 w==;
X-IronPort-AV: E=Sophos;i="5.97,268,1669100400"; d="scan'208";a="199106348"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Feb 2023 09:56:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 09:56:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 09:56:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzLqNe49Lp00K/5y8DnXVMm1PElcb0WB71HgZhIfPE1HoN/2lrh58l+FdtMHNPvW8TB+wm2zx01jP/hemhqZl6PLdZxVMl7RpOr6v4I0bq9wUx0DCN0CfdeazRiT/1WUnlLafttODKklO+tITpNY2sMSxtexYWvvhGbk5WE8wQ94DWiyJ0nIzjgYtRvXG0ecS+Y+SQnsBaYEA4otGS7CK2KoSLAZT25tsTcudpntYkuHjfR7zRgKUrVHJ3mmJa7ZRc/TZspYTGicS1EqAC1F3wthSUHlpCIMV9mfINnQSCIHcKXUPoi4iIOG5eVx4h+T4AgqvxEnobGYkCyunli3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVhVdF0ZCI5RjJ6UuxM7/0xSXTEiq6D1NrVeoYgM76c=;
 b=PDyDXx33k/keZbSVexqdzxgVaK9lJ7/eAwz5MWfWPptwDBcp8BQOw1NIQrhJ0hxoMhvr9kR3ThJRciOLZ4xQLZtNjz3pTaNX/LD4/9doQ6FWFdqfeiC7F5zAUk+aO1v3L1QXtdXJ508D1PEz1ZTcNgUyU95LtgDUI5Yac668emM/Xf5YtmZiTas5h+BLfEwWHtXZl7RQ3uV3nUqN/+Bvu+sp1e8rIJemQ5Le7tP5WZ3lkoRRbRZGgeumHmKsrS6HkTu8sY272EcRinvX8CSXiUgBgZA8yIJeNHO3wrqPoy1/ZQ8PMgqWviKNB1OURJTV+LOJkxCkLekTK1E9Dkw2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVhVdF0ZCI5RjJ6UuxM7/0xSXTEiq6D1NrVeoYgM76c=;
 b=d3E4UpdCaQXNiEVll3d5FIk9h6dv0DIFUCdOIMdow8TPXt+5sNc0N1pYdeMyaTf0THa6cFtGy2VODpHP1LHk8Xyn+ntuLwxXyRKGypESfdsp9v1HmCDXDyBA/+2AmszZ+G7XSKRBV4Y9h0LJtEIYFNC9JBlq6ko8rpUjRh38v3k=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BL1PR11MB5333.namprd11.prod.outlook.com (2603:10b6:208:309::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 16:56:51 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::2177:8dce:88bf:bec5%9]) with mapi id 15.20.6043.039; Thu, 2 Feb 2023
 16:56:51 +0000
From: <Claudiu.Beznea@microchip.com>
To: <nathan@kernel.org>, <codrin.ciubotariu@microchip.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: Fix uninitialized use of mr in
 mchp_spdifrx_hw_params()
Thread-Topic: [PATCH] ASoC: mchp-spdifrx: Fix uninitialized use of mr in
 mchp_spdifrx_hw_params()
Thread-Index: AQHZNydYnc78N6T48UKNuqOE0GGsNg==
Date: Thu, 2 Feb 2023 16:56:50 +0000
Message-ID: <81a494c9-3197-579f-8f26-363a77803825@microchip.com>
References: <20230202-mchp-spdifrx-fix-uninit-mr-v1-1-629a045d7a2f@kernel.org>
In-Reply-To: <20230202-mchp-spdifrx-fix-uninit-mr-v1-1-629a045d7a2f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|BL1PR11MB5333:EE_
x-ms-office365-filtering-correlation-id: bad86382-8990-4e2b-c7b3-08db053e7acf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +KnDrvZSsBZ7aaELjLTvj7QlYLD7Vt5aM/UBLKqxsIC7xPD63bopSEdThI4Z9CCRktcHjBcrRPxF5zDo2jDt4F99HxrOJmRU29hxKCjTam3vhdwksWBUiqmWZUGdJOUxXG7B00e/v31Ea8wgfq/ugofHFrEZvxKVPbBWchDRYV88KMtPLf4KW7MwyzlIryJ+IYFHdLlbLSC2ZEkm6RwgYvCpgipWRyxb41EgETPplP9duNM6Q929vdBDHdrXObl7VwvbwfIlkbHvm2K8LSdFuftIrZ4pENLnmNeQVmNRlO+tUa8htyJoO15UowfHiu/MiaauUhdv/bokOGEh313aP0VzxrPCFpm51nSlvtF+NJQCPU8wXClRVx6Z6o4ZcRYAgvEsWXoEecAKMl/Wz3jHXLSEky5g4RdpP/SFLeAWMAStadTSm2VgTl4d8Hg0jaUiBG0sftNSkOq7Cz44O+HVHrMHmzVV+XUv8aclqWf/BynQWBakrB00iGDjhrrnUIy2mCz1t2i2aW6Vfy1evbr9ovhddTMxhD/fa5AcYdJkvL//AjHyb+FoUGqqSv+ifoOqKNwsoKCEcs60XDDZNnbZrUO71YVWFlcmua13inBwnKL36F4A48YLXwANRa35ifdYR3rrCpBMHFEXUPGE2ZVmXNpp+kFRNWAvJ0tIXeadBqgBC63N8OZX1VNV7KSBMgQRFdXlzCNHM0pih1QhTBZlb6h5C0TmAahhtLRKOxtjjTMFepM96t36iuKzf1uOTe4zhfKuOrN5UID4zfeNKA1hMTtj82/F1DV6Pm39i4fdUXg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199018)(76116006)(91956017)(186003)(38070700005)(38100700002)(8676002)(122000001)(316002)(110136005)(54906003)(5660300002)(2906002)(8936002)(6506007)(66556008)(7416002)(64756008)(4326008)(66946007)(41300700001)(66476007)(66446008)(36756003)(83380400001)(53546011)(26005)(6512007)(71200400001)(31696002)(966005)(6486002)(478600001)(86362001)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXVZY3NJc2crVDVDcEFadFFGNHhwQmtXdGo3WUN3V0xtZkh6ci9IaTF2WUZE?=
 =?utf-8?B?Z3F3SDZGWXZKK1ZPNkxia1R0d1BVVzdySGJkS1I0ZmxwaUhFaEowaDI2VkVx?=
 =?utf-8?B?SU5SMTRBZG1tcXhXa1E0MEJra1gzU1FlWm00NC85RHJGUk9JNkkzQ3MvK0t3?=
 =?utf-8?B?QlpZay9xa3pHSEEzbEZtV1lzQlFUQ0kwcDJTWGRBRW9xOFJ2TGFtOWpHVk9p?=
 =?utf-8?B?dDhsT2JNZWkvODlnb295VTdRbTYyRkZPRkFidGttS0hrOHFCMUo0a0ZhTTlL?=
 =?utf-8?B?Z0gweWlsQmZOTWtobFlJdTZBRDltRVRyNVRzZm5OK3hzZXVUU2hqa21uUU04?=
 =?utf-8?B?ZVJQSnRvQ2lJUDVhaHdETE5IQUZWdWVkY2hDQ0ZSYndGL3N5Vm9wdmNDWDQ5?=
 =?utf-8?B?Ly9nZVh5YkJ6SVNtc2s3OWZlQUF0Mm9OY0tLU2VJYjFOWTQzQ1Z6Y0s3R05v?=
 =?utf-8?B?RHkwaUcwUGRhYkJ5K3dvZ0VYQXY2eU0xQTJkcVhSVm1ISXBoZHY1d3p6QVpn?=
 =?utf-8?B?aU4rQmlRZUdPMUx3N3pjZzBCcHIxTkRaWTB3M21ldFNUQkNhbzhZeUFDUjRl?=
 =?utf-8?B?TE4vT0FTUVBySUVHQXpMVU9qdDBiMis5cHVWQk1WNWdWRGlXQThSYmtCeDFS?=
 =?utf-8?B?TFBYVURFcVdPSXJLVjc5WVhJdzYwTVZoc3pRL1c0UlhFaTJQZUNJUzh1T3JR?=
 =?utf-8?B?MnB5VjBrejhCSVdZQzJvMDZrTzdaU2RwSm9BSC9wZnNuc3RKUERuSXNueWQv?=
 =?utf-8?B?QXlnYWV5bDk4WmlLa0ZlcXRDb2xrbHBPVzJUMWRKUjBxdnNJRW53T2h1OFNj?=
 =?utf-8?B?elY0ZGcyaDltUFVLcFhNakYxaUcxSEpsZnlzaVdqR0tyZnNrQzNzZFRvS2pV?=
 =?utf-8?B?K0ZhQ3NPRTJnSjcxUmVRbFZaT3g1WUdaSzNlK1VNZ0dSY0FMZTMwYkZqTEZi?=
 =?utf-8?B?U3BndDZvd0xkZitkNzVBcUFvdElaVmc1NjFKYUNPRm9EUERJbVJuNi9CRkZ6?=
 =?utf-8?B?QTJ1TnE2TkZIbGZwWnpGUE1kU0xiT3JaeWI4aVZ1UUE0UEdqTDAxcEtIbHRX?=
 =?utf-8?B?aDN3enpRVXVrSmFvaFNFZHlsMThMVldNSkdubzZXNEI5Z2haYW5mRnhQallF?=
 =?utf-8?B?SXY5ekFiQzQ5bWsyYUhEY25XbUhWSUdJd2ZDUU1NZ1Y0bEVoYzJhTUZXTEUz?=
 =?utf-8?B?UU5FQUdiVlQzc0k5UVVYZUc1NmFmOUxOMExKVWxOSkt6ejhTMVp2eXIwYVdp?=
 =?utf-8?B?QksrYlErc05ZOW5Vb3N5VEExZmx6NXBxN2VIUUNwaWhPd2lYM3k1RHRWeTBy?=
 =?utf-8?B?Q1ZnV3YxaytpQ3NYOGhzaWFiQUt1ejFrWkVpSHlEWTE3M0laaDlneGxuUWdW?=
 =?utf-8?B?akFlN0xUaEhQNUs5M0x6L3BtclRjcSsveFJLUlU4dzVRUFBmMWVnWC8yNHc2?=
 =?utf-8?B?SUZrSFlacURIbXZQNFhFVkp5SkI4Q1htR0tJdnZ3eVhyZDlsUEpWYWRmWHBZ?=
 =?utf-8?B?Y1pxM3I4K3A4VFg2Y2ttWkV1SnBFZ0JSMElzQk1OSVgvWDFEeXFia21jQ2VL?=
 =?utf-8?B?dzJ3ck8ybzdxV1BUeGJqRUcxcU4xclZiVVI3dUVaNCtyeHNwbDNjdXV6Yy9Z?=
 =?utf-8?B?cTZQZ2V1bVpXTURwWTI2TmRCTjdWZStyTWhEUkYyUzVFdkJLOWVXVzM1Qk92?=
 =?utf-8?B?M3lCYmh3bmkvaEIzcEF2M3ZuOTB0Q3BTeUpPdEltY3pvM3VHUm50V3dzZDVP?=
 =?utf-8?B?czJBeVVjOVFmYXJhdmJCY2VJTUZnUC9aN2RZeGlGVjI1UTV3S2FGYWwyTmV4?=
 =?utf-8?B?eDBiZWVzWDVTdHZtOHNhODNHUnVkSWROdnBtc3l4ZURjTnorelRmdmhrbjRM?=
 =?utf-8?B?Zmp2VTVQZVhPcDhSWXdSbkpCUXg3YkZTdnI5aHQ4MmgybXhvWFFhaVE3M2hU?=
 =?utf-8?B?TVp4bEFYdXBVU1JBZXh2bEUySDlKN3h2UjJYaWtUMnN3WTh5UUhHUzJUaXhp?=
 =?utf-8?B?TFhWOVM2MStaRjhzdURlR1FvWlUzVHZZYnM5ZUxVWTlEUDRsM204WXhYUmxK?=
 =?utf-8?B?Y2V1bkFWSjBhdy9UVzdOVmJtdmhMcmI2ZHdTVjhKeDV6bGM3VmlsQlJZenBN?=
 =?utf-8?B?enljVFZUeGk4K3d4ZUFSUkJNWUZJNHFzQm4yRm1DbVZzemhwb3RrVUdTUEFi?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFB03ABEEB5D0248A1E79F9CBAC6D12F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad86382-8990-4e2b-c7b3-08db053e7acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 16:56:50.9293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yJjfswGnAVT9X/cfZ68FPz3cWaL2IND9rnorrzlwxNtH35V0cwwj+O5ARFrH2TvLpwWchmrs7VbV+kWknkgsYrXEtyE58KWmQ4x1ZGTrlP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5333
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org, trix@redhat.com,
 llvm@lists.linux.dev, ndesaulniers@google.com, Nicolas.Ferre@microchip.com,
 patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMDIuMDIuMjAyMyAxODozNCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQ2xhbmcgd2FybnM6DQo+IA0KPiAgIC4u
L3NvdW5kL3NvYy9hdG1lbC9tY2hwLXNwZGlmcnguYzo0NTU6MzogZXJyb3I6IHZhcmlhYmxlICdt
cicgaXMgdW5pbml0aWFsaXplZCB3aGVuIHVzZWQgaGVyZSBbLVdlcnJvciwtV3VuaW5pdGlhbGl6
ZWRdDQo+ICAgICAgICAgICAgICAgICAgIG1yIHw9IFNQRElGUlhfTVJfRU5ESUFOX0JJRzsNCj4g
ICAgICAgICAgICAgICAgICAgXn4NCj4gICAuLi9zb3VuZC9zb2MvYXRtZWwvbWNocC1zcGRpZnJ4
LmM6NDMyOjg6IG5vdGU6IGluaXRpYWxpemUgdGhlIHZhcmlhYmxlICdtcicgdG8gc2lsZW5jZSB0
aGlzIHdhcm5pbmcNCj4gICAgICAgICAgIHUzMiBtcjsNCj4gICAgICAgICAgICAgICAgIF4NCj4g
ICAgICAgICAgICAgICAgICA9IDANCj4gICAxIGVycm9yIGdlbmVyYXRlZC4NCj4gDQo+IFplcm8g
aW5pdGlhbGl6ZSBtciBzbyB0aGF0IHRoZXNlIGJpdHdpc2UgT1IgYW5kIGFzc2lnbm1lbnQgb3Bl
cmF0aW9uDQo+IHdvcmtzIHVuY29uZGl0aW9uYWxseS4NCj4gDQo+IEZpeGVzOiBmYTA5ZmE2MDM4
NWEgKCJBU29DOiBtY2hwLXNwZGlmcng6IGZpeCBjb250cm9scyB3aGljaCByZWx5IG9uIHJzciBy
ZWdpc3RlciIpDQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzE3OTcNCj4gU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6
bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9hdG1lbC9tY2hwLXNw
ZGlmcnguYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hdG1lbC9tY2hwLXNwZGlmcngu
YyBiL3NvdW5kL3NvYy9hdG1lbC9tY2hwLXNwZGlmcnguYw0KPiBpbmRleCA1MjZkZDNhMTc0NzEu
LmViMGMwZWY0NTQxZSAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2F0bWVsL21jaHAtc3BkaWZy
eC5jDQo+ICsrKyBiL3NvdW5kL3NvYy9hdG1lbC9tY2hwLXNwZGlmcnguYw0KPiBAQCAtNDI5LDcg
KzQyOSw3IEBAIHN0YXRpYyBpbnQgbWNocF9zcGRpZnJ4X2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3Bj
bV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpKQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBtY2hw
X3NwZGlmcnhfZGV2ICpkZXYgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOw0KPiAtICAg
ICAgIHUzMiBtcjsNCj4gKyAgICAgICB1MzIgbXIgPSAwOw0KPiAgICAgICAgIGludCByZXQ7DQo+
IA0KPiAgICAgICAgIGRldl9kYmcoZGV2LT5kZXYsICIlcygpIHJhdGU9JXUgZm9ybWF0PSUjeCB3
aWR0aD0ldSBjaGFubmVscz0ldVxuIiwNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMWQ3OGYx
OWQ5MGQxOTMyYzgzZDhjOTZjNmY4NmZiYjA2YzA1ZTI5YQ0KPiBjaGFuZ2UtaWQ6IDIwMjMwMjAy
LW1jaHAtc3BkaWZyeC1maXgtdW5pbml0LW1yLTgwNTI4ZjIwMjRjOQ0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiAtLQ0KPiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+DQo+IA0K
DQo=
