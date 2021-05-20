Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5E638B0D3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 16:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959641694;
	Thu, 20 May 2021 16:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959641694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621519252;
	bh=k3E2dB1JhGe5XUAy52usOxowzjK+DQJU6kwU5Xhi03w=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8wqHBlSqtthLrL560G+V09R2uI5HVR1Iz1063jNVC4HMkl+8Bq2CLNDJ0TV9+ei9
	 Peut+HkaiyGx/VQft5SGN6nInimUw0n7K92V/Y8Yu7Cux6Rz7yDo+LflBworOZRRb4
	 pcZdzhBWc5Tr0jOrnMUbYkCoiRdL1S4asUfBnucM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18BBAF800C8;
	Thu, 20 May 2021 15:59:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E1DF80217; Thu, 20 May 2021 15:59:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C93D2F80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 15:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93D2F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="LlBSGK8y"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="V3JLmzkS"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621519153; x=1653055153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k3E2dB1JhGe5XUAy52usOxowzjK+DQJU6kwU5Xhi03w=;
 b=LlBSGK8yyfQV1njYCvWEBRF+ViBJBYk7ELqejjwHyvi6N0SBFfEVbE0i
 Spcal8OQtXRl8QkHG2+d1l2pclOKGAMjQOPBi2yJhAH62Nb5ChQZ0rJht
 pGyEG8fzxNGaK7sTtFcoD3AqY04SUtrfqhfQDTuMrL+eZmNUeJyZfC2LJ
 XTpkDJbh/840gWwg2sRRWi8uwHWO1giAdGO5hQbC2hB6tZHpe0cqi1r5i
 xPD3ol93AkGSUp7gZjZpdwbtjrefRE5R6/QM+MHumy0KDlP5sdZwShepW
 njd6ordIQwjmmUTMZ4Gihfgl2WJh+qVkN5lHR7zlBqIaTvIm9CvWpccNN g==;
IronPort-SDR: AGDWKe6RHcDCKhWumezBf+Tr539xaONwWdjX551hHFwF0RfnLt9XrUWXZEJ6wQUiDZ7002NIB8
 mDs/wOlCsbxc5cSGYZxsG8hU1r9H0kSBS+g8vDL2n2M82dEBAwHKGvNvdwBOiNtTwvN+tlH4aT
 Ksa1UizeharnUE/AlCxAzXsUDEbm/fKj0n0tdGj6ctjAHrl8yRr5c/YqbCTjX2SuiFpdU90oNz
 GjfdpryHeZ+pvVrwP+JHhK3zktyddnQT+LrnrJNPIbs3gibcnDLuK0iaPTzDJAzMASZQBMRqYA
 ZqQ=
X-IronPort-AV: E=Sophos;i="5.82,313,1613458800"; d="scan'208";a="128839751"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 May 2021 06:59:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 20 May 2021 06:59:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 20 May 2021 06:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcEuu+I6njNVA5/i7FzRqx/DiAAvRvJn3c7Eo1Pq5kXD913LHQPEnmWGDbITGtcD+HlO+4L1D4AuNrQmCet7jacSk3jbuN8XjRNuwmJNy4TEbaVl7CKOG0gx863yCPFm8KKcsAkCuK0Vp25ZYZ0FrLVbl0/9dJs5QtakKMM7/5sYqfwAyOCELXNGwXGcFiPfG41Hh2aKPokQ43JUX04+t2yJ+AU/S0CRypm2jldToNqlm46j1AdFw/RiY41/nbGzv+C5a2euSLK31s3EZdTHBp/+jvFTziUQGEfev1KyqVMJXN5F1inZqaiQw+ErCVVpdXKbsqy6maxa3pct9mLGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3E2dB1JhGe5XUAy52usOxowzjK+DQJU6kwU5Xhi03w=;
 b=gx41FGOnPv8fSYiOv0G54JPjEbbnu/ibjXObJ0tVfVQP+cf183X7zGAuybqvdndLCvsj1QBMU5bjNhIxynQs02qrm02lslHsYRRhMBjq3/fuUEs7v3DxtLQKCp1QaXrVBLEbsE0jxVp3TUSWOlQAarb79G8XYXGZyz5ji8gcOgapJb0JOlUcKL82rK218spopjieRnnRyZArhav2jmXmg2zYQpQwZk2lp9wIp1io8B4h/VW5P4Q+F7+0Go6fV3/jNg6XJ6daEqy6UYLrCw+5erLl+crZOBDBxbF+/mlDfBtv4mj1AkpAH6nCr2vwU1GuQDc1enosDMP6DXlkmcTmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3E2dB1JhGe5XUAy52usOxowzjK+DQJU6kwU5Xhi03w=;
 b=V3JLmzkSpSRR+2AfN7s56Xp2Elxu3mIeTNwAknwQsVzDstY6Zq7i3TuzcxsBSt6TlwJFAUK3Hz0LqKcRBx+scO+O9xnU6M27r4BMsXnQiUG6wcv6iNGEQRUZCgwMVSUihB4n9+HqkTdCW75a5UNw1Hm9bkE2KSFWEhBBa7ASeV0=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 13:59:02 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 13:59:02 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <tiwai@suse.de>
Subject: Re: [RFC PATCH 0/6] soc-pcm: Add separate snd_pcm_runtime for BEs
Thread-Topic: [RFC PATCH 0/6] soc-pcm: Add separate snd_pcm_runtime for BEs
Thread-Index: AQHXTJysN5KAQo2I4E6xdizgPl/axKrq2YQAgAAO0YCAAAlRAIABdbOA
Date: Thu, 20 May 2021 13:59:02 +0000
Message-ID: <2c2661d3-78a8-de55-e976-b87f3658a093@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
 <s5him3eizdf.wl-tiwai@suse.de>
 <056e560e-d06d-23bc-b041-60890fa51e63@microchip.com>
 <s5h4keyivdh.wl-tiwai@suse.de>
In-Reply-To: <s5h4keyivdh.wl-tiwai@suse.de>
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
x-ms-office365-filtering-correlation-id: 9a61e336-7ca1-4db4-ec8a-08d91b976cbe
x-ms-traffictypediagnostic: BY5PR11MB4388:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB438843F1D514A2E7DA8694E4E72A9@BY5PR11MB4388.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JlkBJITzX0EXJdztDM30N3IKoEQxsk2Hiz0BN8s8nKK/cI63hIKl1xBXni+SitPvtfbNps7dqXB7w/D65SPpz5VMUdTaLzX4r3rfPVPCKFyucFLwGBHC10UyPsPD1QaCfFzzonggVz/grIcEkJF9yneDm92nkz+NibM9GCrHQABo5UAHzCsvJOjVGNITLbK8O47qODtALwfFOCSGnDL2BiXWYR2Hod1uoTbNEdaUcsQsI6cKoSkzIcpnH7L6fs+OT/DgdVB9PjXfF1NCX4frZb2XI2bVuBXgitaA9bvRPwotMklRhKldVKPXZAStZgmaTo/Sgmk7yS6Hkkg4lMn689+/IlPbd3YF7x08tFd2l1b0da8oOZxz3+rPyzjl4k4S8qzQUTDF7BqVghYabOYoPLWJWVGn1lMAGmfbBtGFI2oxuixgE3v9n73+TI7MmTzg7LQpnDNoCsL95i9BjpWIQ2T9cZ/kWQ8E61hxGmqGjlNE0N7cAHBLulcGdyPyXCm0EQL7O/25CDorYCpJCkpal26RXXydU+h/YH/L/NwDK8kkq4JAs7dqKKRN+fJODJVTws9rcoOIywW9OPV71MHgH33SdUEMw+jpMO0zUv+b/JAqYBBT1y5pVG0YQCwPGzjxspAnCSlXL0WgKtkXfm1NqA5U0j3DsdoAF6EN92NCcx+8UDiMBUL9a49u9z2pZFrF7iViYfjMADfr+n+jH7IYQI1NegFycQ0GE/mw1/a77uLpsi6pZfus9/omVJC5+pk1jXL+BIW2s5H/8/TLbV08Iw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(346002)(366004)(376002)(2906002)(966005)(2616005)(54906003)(107886003)(71200400001)(26005)(86362001)(76116006)(8676002)(6512007)(316002)(31696002)(91956017)(186003)(4326008)(31686004)(8936002)(66476007)(66556008)(83380400001)(64756008)(66446008)(66946007)(36756003)(5660300002)(122000001)(6916009)(38100700002)(478600001)(53546011)(6486002)(7416002)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a1pONmZKemk0YTBGMUVYWWFWNWRYaFJrSVVvUldwQlB1UGJvK29RUTc3cmxT?=
 =?utf-8?B?OUYzZkcwQ1BUazZFUFdJN3Z1cXpTMTlTZXJhdVQ5STFBUUNhVkF2ZmNsMFlQ?=
 =?utf-8?B?VXZZbkkrS2NzR1YvVmRQQ2lYZ0VKVkVzempqbklGQ0J2VHVyaFFrYTVZTjVH?=
 =?utf-8?B?UUlqOWlBZVZXQWFROW4wcnAwdlk1Zitab2E2d0Y4UWRuSmgwMmhwUWJQYjVr?=
 =?utf-8?B?YVYvVUIwK2tOUWdGZGIrTDFobUtRSVNZS0l4ZTZEeDV0ZTcyRXNsSE5yS0ZO?=
 =?utf-8?B?ZjVYRzVJRWJaa2tRYUtWVUdjbitGcnA1MjBOVjFvOWJUcTBEdmNUWU1YMkRS?=
 =?utf-8?B?dW10VEEwZkplUUZROFRRUkVMdUlZRnJQeXpqeWc1UWJXK2I3T3F4TnpCQXZh?=
 =?utf-8?B?dXlKbHNjVy9jN0FJSkFSeU43ZHdpOEJFSlh3RTRxRzdnNVE5VlR3RFN0a1lD?=
 =?utf-8?B?U3Q1QjBlKzZOYkJNVG52TVY0bzN5cnMzc1puNTgyRmJXYjN0STYxWSt1KzFw?=
 =?utf-8?B?VnllTWNPeDJGUURHc3JaNG5wZXR0U0gwamdkS3NoSTNHL3hmM0FVRlozenZa?=
 =?utf-8?B?STZXa2xNNVlXTFNmOGtqUnltd2RoaUxPSUtRWVFBbEtDL3VubGFSVDUzYzUr?=
 =?utf-8?B?dU5FVDdYMG9LRXA5WGZZbEVRMGQyOGZPazB4NlZUTERycFVzSDlBSlJYbHFm?=
 =?utf-8?B?c3hFMnR2c2JJeWN6ME84aHRadm1OTTRXTi8veTZGTklFdUlsdXRQOEJrWk5G?=
 =?utf-8?B?Mk9EWkR4c25IUU9DV1lFQS9QM1MvWlhuakxWWVpacFZKN2hvRTNCaExlQkxC?=
 =?utf-8?B?cmxiV2xiQzRaRGpjZlFQb0hqSFVWajhYY2dsZWZ6M1BCNHh0aDNsU3VEL3RG?=
 =?utf-8?B?TkM0YU1seEM5bTVMYWVjWVZrcmpMZEhSS0lnVlV0MDg2VUFQM2hmNnFHR25p?=
 =?utf-8?B?S3g1RXNLcmV0azl5TnlmRDVmb0YyblIvSFBqVHEwQXFTY1M2NjdDcWNOYjZz?=
 =?utf-8?B?cUNRdW5ld3pNV0VjYzJpQmsyY3ZrMXpGWkVxM3NvU0k0RHhRaTQ0a3E5dVlw?=
 =?utf-8?B?VHNmR2xPWlQ5aTV4dmtGT3kvT2JsSFRGZzRoR0FpckpZSUcxVjZYejEyWXp1?=
 =?utf-8?B?QXFkd2pod2tNbVhGcHA2KzRmTjhZcTMwTWE1eVIxUEh4UFhvUm9iOXZDWkdZ?=
 =?utf-8?B?OUVpVjNlV20zbUhqQmpQdFRoK2l1M21HUHA5elZqdFRZM2tRRXg1Mm9Gb1VW?=
 =?utf-8?B?WSt6R1podkNFTTdqblFuUWM2S1F2NG1WUXJQREhkd25XUHJxTDFTSGNwZkEx?=
 =?utf-8?B?VGdkdCtSSGwwcittc3E5WkRIcVcwNW11VTJUeU52UENFdm40ZWUvcE0wVkZt?=
 =?utf-8?B?SkxRWVd5b0tjRFNZTEtxc3U1UytKcy95NmJHcG81T3BGRVphNHRtN2t0WGpo?=
 =?utf-8?B?S29ZVERVVlVTeVp0dVBzSVhteHpsK3VTVTM3TVBKU205TWlEVm5MelF3ZUhv?=
 =?utf-8?B?NERySzV1SWtWN21nMkF0M0VaaUVPaG95amcyNTNITjFCYWNISkYwRWZ6ZXdl?=
 =?utf-8?B?Sko5YnhIR0FVRDNZS3pXWEJvWFFRSktkbUhDYnZLRVhVdDk5UmFoUmt1QVRV?=
 =?utf-8?B?ZXdjTHZBbmMyUkpsMVE3RkMvdE5ONkhkZm5ZeW9qNmpGTml5U3d4K1BiWkdF?=
 =?utf-8?B?cDVzZWtaOHVkLzZKVE5RMTI4UmF6c2FGSnZyVlJlbHVxZzAzMllJYkpFQUJq?=
 =?utf-8?Q?7GQo9Wm00wMc0AjsJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1AD3C729261CDC4B84AC7579708F0F03@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a61e336-7ca1-4db4-ec8a-08d91b976cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 13:59:02.6440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWrlDeaQYGISFH7pU1FqpB4CFWxJJQWJY9MyyhjfcQw7eDzlj8Tq7vMR2RSGQacg5x3pl/WDqS3XGs870x85vbiOKkeM+Z0Wai9EGE9b9qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
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

T24gMTkuMDUuMjAyMSAxODo0MSwgVGFrYXNoaSBJd2FpIHdyb3RlOg0KPiBPbiBXZWQsIDE5IE1h
eSAyMDIxIDE3OjA4OjEwICswMjAwLA0KPiA8Q29kcmluLkNpdWJvdGFyaXVAbWljcm9jaGlwLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gT24gMTkuMDUuMjAyMSAxNzoxNSwgVGFrYXNoaSBJd2FpIHdyb3Rl
Og0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+DQo+Pj4gT24gV2Vk
LCAxOSBNYXkgMjAyMSAxMjo0ODozNiArMDIwMCwNCj4+PiBDb2RyaW4gQ2l1Ym90YXJpdSB3cm90
ZToNCj4+Pj4NCj4+Pj4gVGhpcyBwYXRjaHNldCBhZGRzIGEgZGlmZmVyZW50IHNuZF9wY21fcnVu
dGltZSBpbiB0aGUgQkUncyBzdWJzdHJlYW0sDQo+Pj4+IHJlcGxhY2luZyB0aGUgRkUncyBzbmRf
cGNtX3J1bnRpbWUuIFdpdGggYSBkaWZmZXJlbnQgc3RydWN0dXJlLCB0aGUgQkUNCj4+Pj4gSFcg
Y2FwYWJpbGl0aWVzIGFuZCBjb25zdHJhaW50cyB3aWxsIG5vIGxvbmdlciBtZXJnZSB3aXRoIHRo
ZSBGRSBvbmVzLg0KPj4+PiBUaGlzIGFsbG93cyBmb3IgZXJyb3IgZGV0ZWN0aW9uIGlmIHRoZSBi
ZV9od19wYXJhbXNfZml4dXAoKSBhcHBsaWVzIEhXDQo+Pj4+IHBhcmFtZXRlcnMgbm90IHN1cHBv
cnRlZCBieSB0aGUgQkUgREFJcy4gQWxzbywgaXQgY2FsY3VsYXRlcyB2YWx1ZXMNCj4+Pj4gbmVl
ZGVkIGZvciBtZW0tdG8tZGV2L2Rldi10by1tZW0gRE1BIHRyYW5zZmVycywgc3VjaCBhcyBidWZm
ZXIgc2l6ZSBhbmQNCj4+Pj4gcGVyaW9kIHNpemUsIGlmIG5lZWRlZC4NCj4+Pj4NCj4+Pj4gVGhl
IGZpcnN0IDQgcGF0Y2hlcyBhcmUgcHJlcGFyYXRvcnkgcGF0Y2hlcywgdGhhdCBqdXN0IGdyb3Vw
IGFuZCBleHBvcnQNCj4+Pj4gZnVuY3Rpb25zIHVzZWQgdG8gYWxsb2NhdGUgYW5kIGluaXRpYWxp
emUgdGhlIHNuZF9wY21fcnVudGltZS4gQWxzbywgdGhlDQo+Pj4+IGZ1bmN0aW9ucyB0aGF0IHNl
dCBhbmQgYXBwbHkgdGhlIEhXIGNvbnN0cmFpbnRzIGFyZSBleHBvcnRlZC4NCj4+Pj4gVGhlIDV0
aCBwYXRjaCBkb2VzIChhbG1vc3QpIGV2ZXJ5dGhpbmcgbmVlZCB0byBjcmVhdGUgdGhlIG5ldyBz
bmRfcGNtX3J1bnRpbWUNCj4+Pj4gZm9yIEJFcywgd2hpY2ggaW5jbHVkZXMgYWxsb2NhdGlvbiwg
aW5pdGlhbGl6aW5nIHRoZSBIVyBjYXBhYmlsaXRpZXMsDQo+Pj4+IEhXIGNvbnN0cmFpbnRzIGFu
ZCBIVyBwYXJhbWV0ZXJzLiBUaGUgQkUgSFcgcGFyYW1ldGVycyBhcmUgbm8gbG9uZ2VyDQo+Pj4+
IGNvcGllZCBmcm9tIHRoZSBGRS4gVGhleSBhcmUgcmVjYWxjdWxhdGVkLCBiYXNlZCBvbiBIVyBj
YXBhYmlsaXRpZXMsDQo+Pj4+IGNvbnN0cmFpbnRzIGFuZCB0aGUgYmVfaHdfcGFyYW1zX2ZpeHVw
KCkgY2FsbGJhY2suDQo+Pj4+IFRoZSA2dGggYW5kIGxhc3QgcGF0Y2ggYmFzaWNhbGx5IGFkZHMg
c3VwcG9ydCBmb3IgdGhlIFBDTSBnZW5lcmljDQo+Pj4+IGRtYWVuZ2luZSB0byBiZSB1c2VkIGFz
IGEgcGxhdGZvcm0gZHJpdmVyIGZvciBCRSBEQUkgbGlua3MuIEl0IGFsbG9jYXRlcw0KPj4+PiBh
IGJ1ZmZlciwgbmVlZGVkIGJ5IHRoZSBETUEgdHJhbnNmZXJzIHRoYXQgZG8gbm90IHN1cHBvcnQg
ZGV2LXRvLWRldg0KPj4+PiB0cmFuc2ZlcnMgYmV0d2VlbiBGRSBhbmQgQkUgREFJcy4NCj4+Pj4N
Cj4+Pj4gVGhpcyBpcyBhIHN1cGVyc2V0IG9mDQo+Pj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRldmVsLzIwMjEtTWFyY2gvMTgyNjMwLmh0bWwNCj4+
Pj4gd2hpY2ggb25seSBoYW5kbGVzIHRoZSBCRSBIVyBjb25zdHJhaW50cy4gVGhpcyBwYXRjaHNl
dCBhaW1zIHRvIGJlIG1vcmUNCj4+Pj4gY29tcGxldGUsIGRlZmluaW5nIGEgYSBzbmRfcGNtX3J1
bnRpbWUgYmV0d2VlbiBlYWNoIEZFIGFuZCBCRSBhbmQgY2FuDQo+Pj4+IGJlIHVzZWQgYmV0d2Vl
biBhbnkgREFJIGxpbmsgY29ubmVjdGlvbi4gSSBhbSBzdXJlIEkgYW0gbm90IGhhbmRsaW5nIGFs
bA0KPj4+PiB0aGUgbmVlZGVkIG1lbWJlcnMgb2Ygc25kX3BjbV9ydW50aW1lIChzdWNoIGFzIGhh
bmRsaW5nDQo+Pj4+IHN0cnVjdCBzbmRfcGNtX21tYXBfc3RhdHVzICpzdGF0dXMpLCBidXQgSSB3
b3VsZCBsaWtlIHRvIGhhdmUgeW91cg0KPj4+PiBmZWVkYmFjayByZWdhcmRpbmcgdGhpcyBpZGVh
Lg0KPj4+DQo+Pj4gSSdtIGFsc28gY29uY2VybmVkIGFib3V0IHRoZSBoYW5kbGluZyBvZiBvdGhl
ciBmaWVsZHMgaW4gcnVudGltZQ0KPj4+IG9iamVjdCwgbWF5YmUgYWxsb2NhdGluZyBhIGNvbXBs
ZXRlIHJ1bnRpbWUgb2JqZWN0IGZvciBlYWNoIEJFIGlzIGFuDQo+Pj4gb3ZlcmtpbGwgYW5kIGZy
YWdpbGUuICBDb3VsZCBpdCBiZSByYXRoZXIgb25seSBod19jb25zdHJhaW50cyB0byBiZQ0KPj4+
IHVuaXF1ZSBmb3IgZWFjaCBCRSwgaW5zdGVhZD8NCj4+DQo+PiBJIHRyaWVkIHdpdGggb25seSB0
aGUgaHcgY29uc3RyYWludHMgaW4gdGhlIHByZXZpb3VzIHBhdGNoc2V0IGFuZCBpdCdzDQo+PiBk
aWZmaWN1bHQgdG8gaGFuZGxlIHRoZSBzbmRfcGNtX2h3X3J1bGVfYWRkKCkgY2FsbHMsIHdpdGhv
dXQgY2hhbmdpbmcNCj4+IHRoZSBmdW5jdGlvbidzIGRlY2xhcmF0aW9uLiBUaGlzIHNvbHV0aW9u
IHJlcXVpcmVzIG5vIGNoYW5nZXMgdG8NCj4+IGNvbnN0cmFpbnRzIEFQSSwgbm9yIHRvIHRoZWly
ICdjbGllbnRzJy4gSSBhZ3JlZSB0aGF0IGhhbmRsaW5nIGFsbCB0aGUNCj4+IHJ1bnRpbWUgZmll
bGRzIG1pZ2h0IGJlIG92ZXItY29tcGxpY2F0ZWQuIEZyb20gd2hhdCBJIHNlZSwgdGhlIHNjYXJ5
DQo+PiBvbmVzIGFyZSB1c2VkIHRvIGRlc2NyaWJlIHRoZSBidWZmZXIgYW5kIHRoZSBzdGF0dXMg
b2YgdGhlIHRyYW5zZmVycy4gSQ0KPj4gZG8gbm90IHRoaW5rIHRoZXJlIGFyZSBCRXMgdGhhdCB1
c2UgdGhlc2UgdmFsdWVzIGF0IHRoaXMgbW9tZW50ICh0aGUgRkUNCj4+IG9uZXMpLiBJIHRoaW5r
IHRoYXQgdGhlIEhXIHBhcmFtcywgcHJpdmF0ZSBzZWN0aW9uLCBoYXJkd2FyZSBkZXNjcmlwdGlv
bg0KPj4gYW5kIG1heWJlIERNQSBtZW1iZXJzIChhdCBsZWFzdCBpbiBteSBjYXNlKSBhcmUgbW9z
dGx5IG5lZWRlZCBieSBCRXMuDQo+IA0KPiBPSywgSSdsbCBjaGVjayB5b3VyIHByZXZpb3VzIHNl
cmllcyBhZ2FpbiwgYnV0IG15IGd1dCBmZWVsaW5nIGlzIGZvcg0KPiBwdXJzdWl0IHRvIHRoZSBo
d19jb25zdHJhaW50cyBoYWNrcy4gIGUuZy4gd2UgbWF5IHNwbGl0DQo+IHNuZF9wY21faHdfY29u
c3RyYWludHMgYW5kIHNuZF9wY21faHdfcnVsZSwgdG9vLCBpZiB0aGF0IG1hdHRlcnMuDQoNClNv
bWV0aGluZyBsaWtlIGFkZGluZyBzbmRfcGNtX2h3X3J1bGUgZGlyZWN0bHkgdW5kZXINCnNuZF9w
Y21fcnVudGltZSwgdG8gc3RvcmUgdGhlIEJFIGNvbnN0cmFpbnRzPyBJdCBjb3VsZCB3b3JrLCBi
dXQgSSB0aGluayANCndlIHNob3VsZCBhbHNvIGJlIGFibGUgdG8gcmVtb3ZlIHJ1bGVzLCBpZiBv
bmUgQkUgZ2V0cyBkaXNjb25uZWN0ZWQuIA0KVGhpcyBtZWFucyB0aGF0IHdlIHdpbGwgbmVlZCBh
IHdheSB0byBpZGVudGlmeSBvciBzZXBhcmF0ZSB0aGVtLCBmb3IgDQplYWNoIEJFLCByaWdodD8N
Cg0KPiANCj4+PiBBbHNvLCB0aGUgbGFzdCBwYXRjaCBhbGxvd3Mgb25seSBJUkFNIHR5cGUsIHdo
aWNoIHNvdW5kcyBhbHJlYWR5DQo+Pj4gZG91YnRmdWwuICBUaGUgZG1hZW5naW5lIGNvZGUgc2hv
dWxkIGJlIGdlbmVyaWMuDQo+Pg0KPj4gZG1hZW5naW5lLCB3aGVuIHVzZWQgd2l0aCBub3JtYWwg
UENNLCBwcmVhbGxvY2F0ZXMgb25seSBJUkFNIGJ1ZmZlcnMNCj4+IFsxXS4gVGhpcyBCRSBidWZm
ZXIgd291bGQgb25seSBiZSBuZWVkZWQgaWYgRE1BIGRldi10by1tZW0gb3IgbWVtLXRvLWRldg0K
Pj4gdHJhbnNmZXJzIGFyZSBuZWVkZWQsIGJldHdlZW4gRkUgYW5kIEJFLiBJIGFncmVlIHRoYXQg
aXQgY291bGQgYmUNCj4+IGhhbmRsZWQgZGlmZmVyZW50bHksIEkgYWRkZWQgaXQgaGVyZSBtb3N0
bHkgdG8gZXhwcmVzcyBteSBnb2FsLCB3aGljaCBpcw0KPj4gdG8gdXNlIHRoZSBnZW5lcmljIGRt
YWVuZ2luZSBmb3IgQkVzLiBNeSBETUEgaGFzIG5vIGRldi10by1kZXYgRE1BDQo+PiBjYXBhYmls
aXR5LCBzbyBJIG5lZWQgYSBidWZmZXIgdG8gbW92ZSB0aGUgZGF0YSBiZXR3ZWVuIEZFIGFuZCBC
RS4NCj4gDQo+IEFoLCByaWdodCwgSSBvdmVybG9va2VkIHRoYXQgcGFydC4uLiAgSXQncyBjb25m
dXNpbmcuICBNYXliZSBpdCdzIGluDQo+IHRoYXQgc3R5bGUganVzdCBiZWNhdXNlIGl0IGZhbGxz
IGJhY2sgdG8gU05EUlZfRE1BX1RZUEVfREVWPw0KPiBJdCdzIGFub3RoZXIgZGlzY3Vzc2lvbiwg
aW4gYW55d2F5Lg0KDQpSaWdodCwgaXQgZmFsbHMgYmFjayB0byBTTkRSVl9ETUFfVFlQRV9ERVYu
IFsxXQ0KDQpUaGFua3MgYW5kIGJlc3QgcmVnYXJkcywNCkNvZHJpbg0KDQpbMV0gDQpodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMy1yYzIvc291cmNlL3NvdW5kL2NvcmUvbWVt
YWxsb2MuYyNMMTU0DQo=
