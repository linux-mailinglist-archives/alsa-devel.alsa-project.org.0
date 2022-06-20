Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5B554F7A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA371FEC;
	Wed, 22 Jun 2022 17:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA371FEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912251;
	bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VPlgjmlyi7fvZvfH+BSQteTqZyqxP0ieGmxTg25WvkZlwIqZpuMr/bMeTsse6mtKo
	 OS/guIUIxkKky1G7ukyweEfrp24ltXjsQARux9p93mFO6/p6CnQe4J8mYvG0NtwjBr
	 yVd2en43SI5N13+Je4VaDa+qZ1WkNeC1rw8gcwlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AFEF8067F;
	Wed, 22 Jun 2022 17:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A60EF804DA; Mon, 20 Jun 2022 23:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 367CBF804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 23:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 367CBF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="RiKZQwp+"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="sRiI9D/i"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1655759214; x=1687295214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
 b=RiKZQwp+cNoqFF/C0Vm902jwzI3C9v+fmhSUUuZ1LurxsmwjnbMsPG6z
 3ywBtCz27F5OihfgAkDe88QBSEPVbm6GGtKYcFRCUxlFaAoqSy7GXjk9F
 J9fOIxiVaQ4vrzE0Hnuicgio8k/lp2kSBhHmDpjN8X1GhJby40sjFqjFI
 9bPWmyoWYwQanPSZ9lC9uvfXokVE+KuZUlQvUgA/p6wnAIzVz30hTTq2o
 6oq8U2Puqt0VhpF/jQCzZyONgVfCplW61GTUtS3w+xraAF+EATqxotyAk
 v5RiJsPTvqzB1qB7BN8bWjxep0nfdLn2L8GtyfU1VTOR7/tmoiYduCBv1 w==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="164249685"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jun 2022 14:06:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 14:06:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Jun 2022 14:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noAbmqMXRICSsWnVKpgF95kfDDHvAj4prw9TST8mAXuTHgmtcxDeUs00tWcMhQ3MzwSv1NNMSiT62v+TcEl1nXcs55XDW6wGEzIYyUkdVCKcmRCmCzgstfRXqgE8CENlRJwZ/iivUrT/T3pPjZPElLVt64qG3T8pslzvVAZYXYxPDLWotgsGITTKlrhkUYEkN8h9G5JNfuGL3dt0Jvy1ko0tD1efmBbr07FZVla1vcZ9ClEcaVdfFrkEWKUJFRU1TBYCDmDpnoLe2ZPC2Yf+y4JVh9dL64E3jQ4HYPe/MXqpk6DoL4OVmqmKH3Ri3fhM3UKje/QJW5E3eYeqDqgwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
 b=Zjs2AQzXUIln2SvwqqRa+YbGWkl2dLCZ9G33crkoYCu9xoNCqMbkpfeKAKw7YHKRQycDa4iWz5rmIWgUvjMv4au7egEzSCxoFKVe5Ma3OlUjzBVv0ZhF02RczO4ZWzXR609RbXc5yCPrYcmWVLAaet0UgVCUovJWzvmBpTxw4m1pMpgLHJaq3Pt7utq8QOAMbA32lry1GmJlJdBVlN4XQIdtk6F1IhBnih10LzA0B7XNU7I0PUc1NBUg46XFeyvEccUaRSYzWpfMbYSZ/SjiXsonSZ9vdeP7HVj4krtpd4EYcp7WnpQtNAxmwle5q0yha1XAIY8Epf+pVcHITyLiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU47Hp5v+hggM07/2XdcVUG7C6mJZs/IXzpu6audPMM=;
 b=sRiI9D/i6mfPIkf5HbO6F9TaaedRSrmbG4MrLyn2yLnIte4Tj1J0u8bSi5knPn2/dWCVlPF2kzHGixN0ag2Oun7SkygzTbxPVEvmyIDwiBNlN8Fvf2HcAbfuaUctNyU81kv3UTYyK0YNJH+744yxiq1IZrMm7mfkJX2BNefRsH4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1369.namprd11.prod.outlook.com (2603:10b6:3:c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.15; Mon, 20 Jun 2022 21:06:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Mon, 20 Jun 2022
 21:06:34 +0000
From: <Conor.Dooley@microchip.com>
To: <fancer.lancer@gmail.com>, <mail@conchuod.ie>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361YymsAgAACs4A=
Date: Mon, 20 Jun 2022 21:06:34 +0000
Message-ID: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
In-Reply-To: <20220620205654.g7fyipwytbww5757@mobilestation>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98191401-a40b-4860-4048-08da5300c1cd
x-ms-traffictypediagnostic: DM5PR11MB1369:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1369CCDAD4E9F13B1565018D98B09@DM5PR11MB1369.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NGAIfuk63a/wCOaZyZHFf2quYMtxaAK935xqNhKBmlh1fs5bQJ58C3ozKq/haLipMqFbvnzQEVqW2w9qw0whgf8q2qHKjcNKASXBpweAPlStMbF/bl/l4bPGQ0LfsZLBItCSCSvpe48GCFY93wL3AgnEeoKX11biJJsi8mmBUHAoRlKN+R0PnAM9AKS82QDepaKptOZdeCfuNKdbd/g/46MlGe0Zg4SK6SIxD8nYCAbwG3DwYflLOKGi4bPKi5J9M/8hOS0FJWvP4IgmBMg5UnleGM42IdsehHHeoPRiMqFnfqRaTHcCq4WHHcSK+SFvm/a8w5GpsyykGQxfmNewS7NftdqV4EmDhvyZNqkS66D7HHMNWNuED2jZ/6e1wYL7Kj0lpK5a41QTlVFSM/SHRFP2/ViW3UJrtXQIZ2CDJaEyMMSZgUmOzlsVM84MaCBcdDP2YVwHmWjXEq8iFPOhhEJ8YDjuriiHSeukoHA3GblyfEbzyll/eMfxJzhW/i5raj099j1K81fCMCkZ4EX/b3LUZeblEiA8iNW5+/35Dj5x7OiqaoHVNXVojK0eC5u00zGAWgUifqwwAjhdgMj9vnItlbj5TvVaVVV1eEkiwdHnrKftyc8xLKhQnTk58ZruYmJtHeZJZrBAsInKdFcdcxaupM8vPJTUcodISptLexRVtiY9IM58aYhAIzXM/h7f4vD9mIoosmGMJPH6rr2s/HMUFXpltw4dcC6MUUGSUuM4ju0F433/CKKkC1g2BDhkP5/rKwU+IPGz1O8P1XzMvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(346002)(136003)(376002)(396003)(53546011)(6506007)(2616005)(86362001)(38100700002)(41300700001)(31686004)(26005)(6512007)(36756003)(7406005)(7416002)(5660300002)(8936002)(64756008)(15650500001)(6486002)(31696002)(2906002)(66556008)(110136005)(38070700005)(66446008)(54906003)(122000001)(66476007)(71200400001)(478600001)(8676002)(4326008)(186003)(91956017)(76116006)(66946007)(83380400001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUdXQ2NNeFNXeDRrWC8zSUQybE5VMStsUWxSd2YwV3RvRVkxaDY5YWp6b1dT?=
 =?utf-8?B?cFZ3UGt5RWtNUTduZG5xZnNBOUlkc3Qwd1B4NVo1V0RlYmVvR0ZJQXg1LzNX?=
 =?utf-8?B?dDFZd0xuRTNuZFpBclpIbXMvMDV4SlQwc21hbmg1RFpJUEp5Z1E2UFBTbEs3?=
 =?utf-8?B?Nk1wVHhlbzY1TGNYTGRlZ0xrK3dTeFFhMkJFVlBlU0N5REVXMHRJTUZGNDU0?=
 =?utf-8?B?VGNsb3hLL2dNWXBQUUdCckRGalNxRG42TG85ZlREbjlJcFlBSWQzVmVVTGNK?=
 =?utf-8?B?TlpBVVpLSnJCZnYxSHdUR0F4ZVhwTktET3dpd0xHZjFqQmc0ckp3ZDlyL1RQ?=
 =?utf-8?B?QVBtbkZCMWh2RGFJOEN4bjV3VkU2cHJmUFM3UmcxNTh5REhZVzYxMHFVYUhx?=
 =?utf-8?B?TG9aMUhBWFE5V0RmZXk3dHdHem1kT0UvMzBuYlVrVWJIZGt1MFZPQXpWdmFy?=
 =?utf-8?B?MDNMRUFYOWRsWlVNemRDcHZ3THdWQjEvYloyTUliUW5jTjQ4dnFYRjJKeXpH?=
 =?utf-8?B?YWM2VjIvbG5OUHc2anQ5SjBrUTE5bmRXRG9rMU83RTNZQ1JOcUZtekptY2ZX?=
 =?utf-8?B?TnRiUjlxY1UvOGRYR25FWkMxNTZMR1hMelA5T0l5SWlkbit0cktkb0I0ZFor?=
 =?utf-8?B?M0tNVXJLclY2ckpDV3F5UUVzWVgxMmRzQ3R5Mnp3NzhBK1g0Wi9tUlZNbVpN?=
 =?utf-8?B?Y1A1N2lldjdxOTZwUEMyeWJ0cThvT3AzTHJqYXF3amNzQm81SlZSS201Ri9y?=
 =?utf-8?B?REU3bkI3UWFrM1V5SUlhTWgyVE9HekpUdkNOTWc4Vk9VSmt2TEhjL1hxVWV4?=
 =?utf-8?B?UXNwNnlnc3VEVjFRVVl2cWd0a2l4bktWK3dNVTFLazFGR1d6eFUvNUlHdjJu?=
 =?utf-8?B?a29Vd0ozNmpIMEVyODNxdTRJckxyVW9Uak45UWJKS3FiaGhDdkRycGtYYlBZ?=
 =?utf-8?B?QTRDM0ZSR0Q2LzJ4OXdnSVZNamJFZ2JCYUcvejZQWkZkeE40T1doc1VkN3J6?=
 =?utf-8?B?L3k3ZzR2TmlpcXdPYnIxb29TK1dJRWxsc2c0RWpXM0JycGMxbmh5YVkxenFZ?=
 =?utf-8?B?N3Ayakx3eityZThQaXpySXdKdXJTQ2Mra0JqVHVCWVFHNmdDWTEzdzlvZkx1?=
 =?utf-8?B?NFp5a2VlUkdoa3BtN1lvekJDSlFheElGN3NvMFljMU5GbHd3bkhuell5bHpS?=
 =?utf-8?B?ZG9uY0dpdXR0Y3QrdysyVnVJVEFyODc3TlNEUzlBYWxweVRvNmpIMkF6RGJ4?=
 =?utf-8?B?dVlzZ3VaNDdaUzJwa0JlNDQ3bVpaaDkxMDBsV05BTE40cDhUUk16eExPU09X?=
 =?utf-8?B?KzhhQlhEM0RDV2lFK21hNFNhZkNRYTBtYXRYSDU5WUZ1ZVo5cTRHSkh0SFdl?=
 =?utf-8?B?Mi9FYm1oVGxnR3htYzdGSU9Pc0xERFNUYXNBNU1aVFd6TlorZzlMZEpKYUlP?=
 =?utf-8?B?dUZvdkZIQjdDSFR5cVNCN3ozY1hwc0FTYUlXQmdSbTJyY2VWRUlDcTFPNDhR?=
 =?utf-8?B?M1ZGbzJvTXpFdERoVU00bW5zb3h6bG8zN0EzWUZmVElFS21ONyswdnh1a1Vj?=
 =?utf-8?B?UWRieHFqMC9FaFVhM3pZOG80aHN5RG9tOWdibUFJZ01pZWo3ZnNRWTZBamE3?=
 =?utf-8?B?S3ZxRWtiQWsvMGlmQU9mMUIyczJ4SlFxK25xOFpyYWNQVmpqKytJVHdxQndN?=
 =?utf-8?B?MThvYnhBbkM2aHBEem1QUStscUx6QnM0ckVtZGM0eklHUUtWbDJvNVhWeUFp?=
 =?utf-8?B?aDc3OWx2R3VXRWhLQVRjTVoxS0JGQTBlMU1rK0locnRVeVhoRHg2blhFOTVt?=
 =?utf-8?B?QXBZb2U5bHNwT1ZEYWswcEJuRlcxcDlIcWh4WE9uNzRVOVVQR3NZd2Q5TnV5?=
 =?utf-8?B?OUlVajFGT0xyWlVuQmVxT2l3dGdacXg4cUQvOE9pS1RjYktxbnQzOVlKUDh5?=
 =?utf-8?B?N3lPUWFGNXBWaUZIUVUwZ2d1RmRjWkFjcEhldFp6R29wSldsajJlZkxRS1hh?=
 =?utf-8?B?R0d0aTdtbHlzTU45dUkvK0NPRVN1aEFhRldHUE1tUFlmOU9vNlU0Tm9LNDJk?=
 =?utf-8?B?bEIyUWVQL3RnM3NsekNuUlluUTRNcW9WQVdrODJ4czNhS1VIY0tQR0IxVS96?=
 =?utf-8?B?dDNRbjhDSnNpN2N4ZzlyQzQ3MkdnQmtVYXpHaFFyODRycFV5R3QzSjhGWTZL?=
 =?utf-8?B?cWdBanF5NFlublo1VUVYOWNXRHkrUjdDQTFjNTVmMG5CSlRGTzBLS09XZjJK?=
 =?utf-8?B?MmQ0bS85UldIVk9IZ1I1M0QzZTZ0TytwTVp3NXpGdTVpK2ZwaENuT0sydmxh?=
 =?utf-8?B?VE1NaTVxZ1Y5azROcE0wTlJUL3Vycmc5T1doVXJVdzd4enpjYTFtQU9UWXhL?=
 =?utf-8?Q?3OtIZlEhAggXJfIA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3E4481921BBFB47A8FB3B3E0FA84B98@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98191401-a40b-4860-4048-08da5300c1cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 21:06:34.2593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robQqOLeTa72v7tn1QTiZ2ZLKcqQIOr6Cbc8j/N27Cw8pUHKiuFXXW9dKXV1zq9HKET4ihaQe2lYzmExHqbc34yH6/5SA5kbDXnmi7wVjoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1369
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, daniel@ffwll.ch, dmaengine@vger.kernel.org,
 masahiroy@kernel.org
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

T24gMjAvMDYvMjAyMiAyMTo1NiwgU2VyZ2UgU2VtaW4gd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gU2F0LCBKdW4gMTgsIDIwMjIgYXQgMDE6MzA6
MjhQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBzbnBzLGR3Yy1zc2ktMS4wMWEgaGFz
IGEgc2luZ2xlIHVzZXIgLSB0aGUgQ2FuYWFuIGsyMTAsIHdoaWNoIHVzZXMgYQ0KPj4gd2lkdGgg
b2YgNCBmb3Igc3BpLXtyLHR9eC1idXMtd2lkdGguIFVwZGF0ZSB0aGUgYmluZGluZyB0byByZWZs
ZWN0DQo+PiB0aGlzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAuLi4vYmluZGluZ3Mvc3BpL3NucHMs
ZHctYXBiLXNzaS55YW1sICAgICAgICAgfCA0OCArKysrKysrKysrKysrKy0tLS0tDQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NucHMsZHct
YXBiLXNzaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zbnBz
LGR3LWFwYi1zc2kueWFtbA0KPj4gaW5kZXggZTI1ZDQ0YzIxOGYyLi5mMmI5ZTNmMDYyY2QgMTAw
NjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NucHMs
ZHctYXBiLXNzaS55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3NucHMsZHctYXBiLXNzaS55YW1sDQo+PiBAQCAtMTM1LDE5ICsxMzUsNDEgQEAgcHJv
cGVydGllczoNCj4+ICAgICAgICBvZiB0aGUgZGVzaWdud2FyZSBjb250cm9sbGVyLCBhbmQgdGhl
IHVwcGVyIGxpbWl0IGlzIGFsc28gc3ViamVjdCB0bw0KPj4gICAgICAgIGNvbnRyb2xsZXIgY29u
ZmlndXJhdGlvbi4NCj4+DQo+PiAtcGF0dGVyblByb3BlcnRpZXM6DQo+PiAtICAiXi4qQFswLTlh
LWZdKyQiOg0KPj4gLSAgICB0eXBlOiBvYmplY3QNCj4+IC0gICAgcHJvcGVydGllczoNCj4+IC0g
ICAgICByZWc6DQo+PiAtICAgICAgICBtaW5pbXVtOiAwDQo+PiAtICAgICAgICBtYXhpbXVtOiAz
DQo+PiAtDQo+PiAtICAgICAgc3BpLXJ4LWJ1cy13aWR0aDoNCj4+IC0gICAgICAgIGNvbnN0OiAx
DQo+PiAtDQo+PiAtICAgICAgc3BpLXR4LWJ1cy13aWR0aDoNCj4+IC0gICAgICAgIGNvbnN0OiAx
DQo+PiAraWY6DQo+PiArICBwcm9wZXJ0aWVzOg0KPj4gKyAgICBjb21wYXRpYmxlOg0KPj4gKyAg
ICAgIGNvbnRhaW5zOg0KPj4gKyAgICAgICAgY29uc3Q6IHNucHMsZHdjLXNzaS0xLjAxYQ0KPj4g
Kw0KPj4gK3RoZW46DQo+PiArICBwYXR0ZXJuUHJvcGVydGllczoNCj4+ICsgICAgIl4uKkBbMC05
YS1mXSskIjoNCj4+ICsgICAgICB0eXBlOiBvYmplY3QNCj4+ICsgICAgICBwcm9wZXJ0aWVzOg0K
Pj4gKyAgICAgICAgcmVnOg0KPj4gKyAgICAgICAgICBtaW5pbXVtOiAwDQo+PiArICAgICAgICAg
IG1heGltdW06IDMNCj4+ICsNCj4+ICsgICAgICAgIHNwaS1yeC1idXMtd2lkdGg6DQo+PiArICAg
ICAgICAgIGNvbnN0OiA0DQo+PiArDQo+PiArICAgICAgICBzcGktdHgtYnVzLXdpZHRoOg0KPj4g
KyAgICAgICAgICBjb25zdDogNA0KPj4gKw0KPj4gK2Vsc2U6DQo+PiArICBwYXR0ZXJuUHJvcGVy
dGllczoNCj4+ICsgICAgIl4uKkBbMC05YS1mXSskIjoNCj4+ICsgICAgICB0eXBlOiBvYmplY3QN
Cj4+ICsgICAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgcmVnOg0KPj4gKyAgICAgICAgICBt
aW5pbXVtOiAwDQo+PiArICAgICAgICAgIG1heGltdW06IDMNCj4+ICsNCj4+ICsgICAgICAgIHNw
aS1yeC1idXMtd2lkdGg6DQo+PiArICAgICAgICAgIGNvbnN0OiAxDQo+PiArDQo+PiArICAgICAg
ICBzcGktdHgtYnVzLXdpZHRoOg0KPj4gKyAgICAgICAgICBjb25zdDogMQ0KPiANCj4gWW91IGNh
biBqdXN0IHVzZSBhIG1vcmUgcmVsYXhlZCBjb25zdHJhaW50ICJlbnVtOiBbMSAyIDQgOF0iIGhl
cmUNCg0KOCB0b28/IHN1cmUuDQoNCj4gaXJyZXNwZWN0aXZlIGZyb20gdGhlIGNvbXBhdGlibGUg
c3RyaW5nLiBUaGUgbW9kZXJuIERXIEFQQiBTU0kNCj4gY29udHJvbGxlcnMgb2Ygdi40LiogYW5k
IG5ld2VyIGFsc28gc3VwcG9ydCB0aGUgZW5oYW5jZWQgU1BJIE1vZGVzIHRvbw0KPiAoRHVhbCwg
UXVhZCBhbmQgT2N0YWwpLiBTaW5jZSB0aGUgSVAtY29yZSB2ZXJzaW9uIGlzIGF1dG8tZGV0ZWN0
ZWQgYXQNCj4gcnVuLXRpbWUgdGhlcmUgaXMgbm8gd2F5IHRvIGNyZWF0ZSBhIERULXNjaGVtYSBj
b3JyZWN0bHkgY29uc3RyYWluaW5nDQo+IHRoZSBSeC9UeCBTUEkgYnVzIHdpZHRocy4gU28gbGV0
J3Mga2VlcCB0aGUNCj4gY29tcGF0aWJsZS1zdHJpbmctaW5kZXBlbmRlbnQgInBhdHRlcm5Qcm9w
ZXJ0aWVzIiBoZXJlIGJ1dCBqdXN0IGV4dGVuZA0KPiB0aGUgc2V0IG9mIGFjY2VwdGFibGUgInNw
aS1yeC1idXMtd2lkdGgiIGFuZCAic3BpLXR4LWJ1cy13aWR0aCINCj4gcHJvcGVydGllcyB2YWx1
ZXMuDQoNClNHVE0hDQoNCj4gDQo+IE5vdGUgdGhlIERXIEFQQiBTU0kvQUhCIFNTSSBkcml2ZXIg
Y3VycmVudGx5IGRvZXNuJ3Qgc3VwcG9ydCB0aGUNCj4gZW5oYW5jZWQgU1BJIG1vZGVzLiBTbyBJ
IGFtIG5vdCBzdXJlIHdoZXRoZXIgdGhlIG11bHRpLWxpbmVzIFJ4L1R4IFNQSQ0KPiBidXMgaW5k
ZWVkIHdvcmtzIGZvciBDYW5hYW4gSzIxMCBBSEIgU1NJIGNvbnRyb2xsZXIuIEFGQUlDUyBmcm9t
IHRoZQ0KPiBEVyBBUEIgU1NJIHY0LjAxYSBtYW51YWwgdGhlIEVuaGFuY2VkIFNQSSBtb2RlIG5l
ZWRzIHRvIGJlIHByb3Blcmx5DQo+IGFjdGl2YXRlZCBieSBtZWFucyBvZiB0aGUgY29ycmVzcG9u
ZGluZyBDU1IuIFNvIG1vc3QgbGlrZWx5IHRoZSBEVyBBSEINCj4gU1NJIGNvbnRyb2xsZXJzIG5l
ZWQgc29tZSBzcGVjaWZpYyBzZXR1cHMgdG9vLg0KDQpobW0sIHdlbGwgSSdsbCBsZWF2ZSB0aGF0
IHVwIHRvIHBlb3BsZSB0aGF0IGhhdmUgQ2FuYWFuIGhhcmR3YXJlIQ0KVGhhbmtzLA0KQ29ub3Iu
DQoNCj4gDQo+IC1TZXJnZXkNCj4gDQo+Pg0KPj4gIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UNCj4+DQo+PiAtLQ0KPj4gMi4zNi4xDQo+Pg0KDQo=
