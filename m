Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F206565342
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE15B1735;
	Mon,  4 Jul 2022 13:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE15B1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656933920;
	bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWZCzRK1mRL8x5Oacjz/NhdFpJniFdBb6qkZkbDr/kxeh1KxrLtyG7X4EWHEB25jB
	 wmQDsCQ1jGnwdawAy+3Dj6jBrjtrjt8tBGMVaFO/DFoP/NGeJiSIMRQlGDhqyVHJxT
	 TG0sQDi9Y95XLs1KePr+Xljrr0SKr7ebv1LFFHPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54126F8053E;
	Mon,  4 Jul 2022 13:23:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B17F80107; Thu, 30 Jun 2022 20:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D56E2F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 20:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D56E2F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="RkVa7xc9"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="RRN4pByO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1656612095; x=1688148095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
 b=RkVa7xc9lRgitdop8b4G1KLpWVCPSD6PomSt+oAZ22A1pnyhHwt15/U+
 IYBlaAReHt0s85RngHNEd/tZOfh2mYtgNiLweUDwGa1cztH+jmcoozdgK
 ezG/zx534/Tn0mjVHBbIX5QWmi4HoZ/ZbkqkEdUVyz/UdXHUWs/vvcCT5
 pVqk14rLK5l3eCUAYwim6/SgtX8LNohvGhDkmg4vgXY7Chv+2dWuCklWc
 n01spRnDQog0L1LPrhV4fnC/ZRIKFZVIOMp1KfDQqsEP5nmIb3Ch++byg
 fgK9hELPAr9wD/cxMs/QQkIKqjAuO/ZGmXffai2FEA9O9oJ6hjyeE+9oC Q==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="170299967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Jun 2022 11:01:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 11:01:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 11:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKUm7j3rRgEyZVV2vPaTm9yRLNIekmFtu+BmFUsYxFygWOsXBd46tppH4me+lIWP5ONTuvg90R+JWfilh1NH6bOlM0AVml62J54uhd6NBFo1+OQ+CZSRmd+X19EVy9Ov/+ScCcRyx9JkbLiY90MwbCoLv3FEAiFR7Rt8FnMTXA/OngcoUmxBuwtqew88JNvnnv5aMnEGFbSx537v/cnA13XRHSWYnJGLvarsJDw/dBamrGOgSHvGqvKxm1o/HGgrr7ZKnzG4aCPwS5dURo0M4gPKdqGK8H2yz9r84RBooAtDEn4Fm+o7AXpuxvzV0ZACuz6W79mn5vzwo2xAeYHMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
 b=kZn9485haBxKCql5Y+yBPCx9HAzoA2vq8s2i/3wyoA59KHyyuL1NCzeprZpirA1b30Vs3WYuchdbneNSuu9DJxflpPSGwydOHOyoABJ1s4Y1bHqPgInUSzoPu60ZhfPPaJaF/v/bfu7ZZkYbNSDWIKPFjWeAGoAMjQ/H9gHlO9XmFzmze1XcKn7TwdRNPXhEDSQqX5U+PNaz2xKC58YS6PQ9W/WGQ73wHvM4jXUby7GNLQBghQK2u1vRS9FnB1vyxfE7kK7z7yBwLqL1b5nlBWHqKMogFw9b2aFLg1zxkleg7z06ChZ/YyHQWnelTIPxD5TsH11VG22JboqoUOM4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH+WKvDYKqG1am5u8c4OGIhHgn9z36ayLZaKt4/GB5g=;
 b=RRN4pByObCKSfSfIm3ZZZstIb5IvXutSOVEBsIjK887eNzJ/AL1Bcsv1NYVrJO65kNiN0U1WjSLx3zszsgSJRGarmoVTw5sn2yioNgNZjkQJJoEQ5mfbnhTzXW6L0mkb5+9oKYwv27RbQo/j2HscHjCKQgUX4czrFzCGaqrd434=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 18:01:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 18:01:09 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hg2HI7nJ4gGEWADL44nKFD2q1oJQgAgAAXtgCAAAIwAA==
Date: Thu, 30 Jun 2022 18:01:09 +0000
Message-ID: <d0634053-d882-fcb5-fd56-32dfbcf4d5ba@microchip.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon> <20220630175318.g2zmu6ek7l5iakve@bogus>
In-Reply-To: <20220630175318.g2zmu6ek7l5iakve@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e50f926-2088-458f-4dd4-08da5ac282e4
x-ms-traffictypediagnostic: LV2PR11MB6000:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: osmu58+T5CZW3TuALITDJ9e/SSCtSSiFF0gN3tiPlwCp+XJChTCuh+KdmzXMsgJOWHQum+LCNyz8UqunOzjZxaEr/ogi8oCInRAQmIuGRjBHKSq5fstgt0CsfxTSSvXnUk+SvC3k3QjIpL08gZFRea2CFvQNO3G9D96eR5sXQD77pkfzE+wqAEvhyqZdWf+Tk0XD6snHMneYuK+6jox+ZGrvVAVuUfHZSLJvkSm6zvyVBGzxQZanyXaTdXM2mMmCi70/afO9TZ8nAXKM9CLTcYjChZWyuEP8h5VOL/BEtL39jARcz8ohmAmOcIht3MNeStLgfpqzdaFXwmisInbaUituAH6p+hFLURPUz9SLbZX3cPBBp51H6m4hnrAFbPqotIpDB7HMCUEyWShFAyhdyOSMsbdbZ6UMw9FI3MFBJAx4KCqkO16Hy5MepV9Kv4tIF/HVPOv5SDzifinaW1C2wan2KbuQvnuepDu/WHj/qRqshHzwFFoOUPb1pak6lBz/MRTuh/ICFjdkvTQ1QP6SbW3o0SypkqJvhYJWrOcFBzZREh3Zh19ilqooZTr25Z/9AkCVT0PX3LyMa3sQAN+gWN2PnRd28IoQZWYHBGiTd/DXhdEyYHRn0b4wyY0UilXVoRlPZ6vDVS/h+9OPe8raxtenWBsLPMv2BuDH+cRUzaU7i/K8prAmBhrKFwQVmYCi9M1o8+6YmeWKbSVMvERTguFN63YzgR8pA82cVy59i7o2P8SyauwxAtrDuSXS6DhDP2F22oaj7Pfh2y//KIVteB/fdP113j8Q4kJJ2jEhFxlbsBtrtn2oMygza44i8TT4UkFZ4x4ZtAhpvHvmafV2PrIDbR3pYLJmxkEC+cw6U3fRNoKPquUdykT17xULxQTZs0E4IPK1NHqu1WlGLDtNLHu8Xq+zI8Bu+a08FVX6RWoy1cj05QxVz6suK8r2RgWs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(396003)(376002)(346002)(366004)(26005)(6486002)(2616005)(38100700002)(6506007)(122000001)(36756003)(38070700005)(41300700001)(6512007)(86362001)(478600001)(2906002)(54906003)(966005)(53546011)(110136005)(8676002)(7406005)(83380400001)(66556008)(31686004)(4326008)(66446008)(76116006)(66476007)(64756008)(91956017)(7416002)(31696002)(66946007)(5660300002)(186003)(8936002)(316002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFVZUmxaVEtQVVJkdXlkY1dRTTA5NEdnWkw5M1NuNnp1V0k3Q1lWd3EyTzll?=
 =?utf-8?B?MVRIWWxXUzZsUVBLaWU5NE01a01rbWNWYSszUXp5TlF4TS8ySFhJZ1VET0xt?=
 =?utf-8?B?VHduQTFDUGZaeVFobklmZXNHeXpLdDcreS9qK0ttRVFGcGF6aEYwQjF2a1B5?=
 =?utf-8?B?MVN1Tm4rRENobkFqd0YxOFJnaHdaRnVEZE5hVC9YQVcxNG1oc2o3aWV1dVIz?=
 =?utf-8?B?cGNOcnJvVmVIc0hGYysyVUNyZzVoOGR1NC9yeS9udnhxTHJoYWF6cEtVOGh0?=
 =?utf-8?B?NUFEV2ZPbVJXSEt4cUJSQ0h4YTF6Qk5CZHJ2TGZQQnN3cmF0clQ0WDhsVmhn?=
 =?utf-8?B?VEdhZVRDdzZZS3VBWkt6WkkrODhLSDYrVFgrNGpNTmxRYldCOEt0WkNVUUsw?=
 =?utf-8?B?Rjh3ODR6S0lsQTlSMTZCTWpZODZSWTBtQVlqMlcxZnRWRGFQcHcvTTdpS0NC?=
 =?utf-8?B?WjJWODZ3R3l1aUttZVJCOUUvdGN1eHFyRkhNamtodHlzaUgzVHJZWUZWZ09E?=
 =?utf-8?B?a1JlUUhNZFVWUG5BQ3lsMUdsa1BiOE9VNkNOYW1jMzBiK1Z1RW9GME9NcTZN?=
 =?utf-8?B?ME9YaHU0aUpBUytLSWRBdHRnQmlkOGhXeEgxL1J3WDlPU2dSL2ppdk5kZ0xk?=
 =?utf-8?B?NjJnbzdzbW1lbnBuUnZkTzdqRGRBODhqQnhQd3BlQmNkNEpTenIycEVNVzE3?=
 =?utf-8?B?N094M3VOMUZsMU1CNUhNWGV2cFRrbHBPM1h0bHFsMmw4MHNNeWV1aklCN0xp?=
 =?utf-8?B?RC9JeVZvUlBkdmdHWEdGKzRXNU5WQXdhWVcyMnE5TUxocXdnOEhyYzdtTTBU?=
 =?utf-8?B?WkNrY2ZKMGkxZVhCaVl6S3k5Y1REYlAvcjk0QXhoRkVnSjJSY3ZKbjRZc2tG?=
 =?utf-8?B?TDZRczBNL3RKUkhRN0NoNzNJanRHZ0pybkM3aHY2ajk1MngxelBxbXhNN2VJ?=
 =?utf-8?B?Y1p5aEtxM2RMMk45UmtSdmtMaW9FNnY1V28xZTNKT280emxWQkJXUnZ6Vmsw?=
 =?utf-8?B?WWpkbGdzK3JhTldBNlp6cVBUVGpCQ3ZGVnZFMm5oMjZaM2RydVJPMFBiNUFv?=
 =?utf-8?B?d3JCdXh2Q1lmS29ndk5JcUFTVlFqd3Z0by8wNVYxR1Q2K0ZweCtxa3BZa25i?=
 =?utf-8?B?Tm1HeWlUVTczdkY2NmI3a2pJeERBenlaVXFnZTQ2Yzc4TTh0ZlBxcC9ZWVF3?=
 =?utf-8?B?WXU2SkYyL2ROcWgyRzV6MXNrNSs5UlBTRTZNaGpyMFZGWFdUWHdISnR2Qlds?=
 =?utf-8?B?Q001ejBScDN3T29LNzlkUkpVUTNMM2hqSVdTRnRhZS94dUF4dDZ0cG1zNHFG?=
 =?utf-8?B?cDRsbGJJR3Z0cWVHaVNTUUhYRjVFTFBXbjRtZGlrNG5WcU1DWU55MXBJZUxv?=
 =?utf-8?B?R2dOLzhMd1VLUThGY24zUnlqTmZWbG9nbXNLbGNrNzN0TG5henVrTHBMMEtN?=
 =?utf-8?B?eHZUVUc4R3pIZEROb2p2bTBPZmVFNHhlU1pTNnh6U2tEeU5JUk1IbmJZc25R?=
 =?utf-8?B?cGZOaFJOL3hnZHBwRHFjTHhQdTI2cDZrSGdNbjgwMUNFSFBrM0dnMDZhRkZW?=
 =?utf-8?B?bEoydzFid3ZZejNQOGZacDVJVHo0SGxHb3VBOXM0NWVQVUl0djVLdER0eGVP?=
 =?utf-8?B?L2JXNmZiQ1dYZmQwQmNFZkZxK01Hb3d3NVBiT0phQVFldU5RTDVrTVdOcEx6?=
 =?utf-8?B?VGJEYVdRRmR0NUtFZkVzN3dIdFQyb2RVUXRNVkNyelc5V0ovaGpJSXNiTW1s?=
 =?utf-8?B?MUZYRTNUdGVLdmRkcUNZeDA4Q09TbktQcGdaRjdObFl2dkNrUUFPTGNkSnRy?=
 =?utf-8?B?UUJKSlh5aks0REFxVURKb3h2SkxtVk5CWGpJTHB3YnhNNUFxaktkSURsZ05U?=
 =?utf-8?B?ejZsUjdQTnQzbnRaa0J6MldCbmdPK0tLVkM5TWlBalVjdjlsTU5GMUxpekFj?=
 =?utf-8?B?R2l3Z0JCMGRrRFNSVmlIOG50WVRQaEg5ZjNlQnhRY1hXSHNOY0FoS3d2NkJx?=
 =?utf-8?B?VXk3ejdjdFFYOVFkSk1RdnBZWlBlUFdNNzhydlhsRnBCUUlzNFlIVkJQODF1?=
 =?utf-8?B?bVJiUTE5ZmRIUGlaejdOOUw2ZUpHc1huMHBQQ043SlhzYTRUdDFjK3hzZzA0?=
 =?utf-8?B?Q3Y0Q1gvU1NtbHVaOFhDYzlOanl0YjVPand3OXA0bFZVVXlXZ2ZqdEh5aXc2?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01CA2EDD691DAA4885E338DD187AE053@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e50f926-2088-458f-4dd4-08da5ac282e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 18:01:09.1877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNYbpwNphhB0q+2iB/jZHHCa7H8JphKUDeGhs8b2xrNGtJHG7csvNzxqa/1UgrTGiOaNcYmGQ9FbanYPBmgYSEtygMzGpxU9k8SCpvgdP5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
X-Mailman-Approved-At: Mon, 04 Jul 2022 13:23:02 +0200
Cc: alsa-devel@alsa-project.org, airlied@linux.ie, palmer@rivosinc.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 fancer.lancer@gmail.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, palmer@dabbelt.com, daniel@ffwll.ch,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
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

T24gMzAvMDYvMjAyMiAxODo1MywgU3VkZWVwIEhvbGxhIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgSnVuIDMwLCAyMDIyIGF0IDA0OjI4
OjI2UE0gKzAwMDAsIE5pa2xhcyBDYXNzZWwgd3JvdGU6DQo+PiBPbiBXZWQsIEp1biAyOSwgMjAy
MiBhdCAwNzo0MzoyOVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+Pj4gRnJvbTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+Pg0KPj4+IEhleSBhbGws
DQo+Pj4gVGhpcyBzZXJpZXMgc2hvdWxkIHJpZCB1cyBvZiBkdGJzX2NoZWNrIGVycm9ycyBmb3Ig
dGhlIFJJU0MtViBDYW5hYW4gazIxMA0KPj4+IGJhc2VkIGJvYXJkcy4gVG8gbWFrZSBrZWVwaW5n
IGl0IHRoYXQgd2F5IGEgbGl0dGxlIGVhc2llciwgSSBjaGFuZ2VkIHRoZQ0KPj4+IENhbmFhbiBk
ZXZpY2V0cmVlIE1ha2VmaWxlIHNvIHRoYXQgaXQgd291bGQgYnVpbGQgYWxsIG9mIHRoZSBkZXZp
Y2V0cmVlcw0KPj4+IGluIHRoZSBkaXJlY3RvcnkgaWYgU09DX0NBTkFBTi4NCj4+Pg0KPj4+IEkg
KkRPIE5PVCogaGF2ZSBhbnkgQ2FuYWFuIGhhcmR3YXJlIHNvIEkgaGF2ZSBub3QgdGVzdGVkIGFu
eSBvZiB0aGlzIGluDQo+Pj4gYWN0aW9uLiBTaW5jZSBJIHNlbnQgdjEsIEkgdHJpZWQgdG8gYnV5
IHNvbWUgc2luY2UgaXQncyBjaGVhcCAtIGJ1dCBjb3VsZA0KPj4+IG91dCBvZiB0aGUgbGltaXRl
ZCBzdG9ja2lzdHMgbm9uZSBzZWVtZWQgdG8gd2FudCB0byBkZWxpdmVyIHRvIElyZWxhbmQgOigN
Cj4+PiBJIGJhc2VkIHRoZSBzZXJpZXMgb24gbmV4dC0yMDIyMDYxNy4NCj4+Pg0KPj4NCj4+IEkg
Zmlyc3QgdHJpZWQgdG8gYXBwbHkgeW91ciBzZXJpZXMgb24gdG9wIG9mIG5leHQtMjAyMjA2MzAs
DQo+PiBidXQgd2FzIGdyZWV0ZWQgYnkgYSBidW5jaCBvZiBkaWZmZXJlbnQgd2FybmluZ3Mgb24g
Ym9vdCwNCj4+IGluY2x1ZGluZyBlbmRsZXNzIFJDVSBzdGFsbCB3YXJuaW5ncy4NCj4+IEhvd2V2
ZXIsIGV2ZW4gd2hlbiBib290aW5nIG5leHQtMjAyMjA2MzAgd2l0aG91dCB5b3VyIHBhdGNoZXMs
DQo+PiBJIGdvdCB0aGUgc2FtZSB3YXJuaW5ncyBhbmQgUkNVIHN0YWxsLg0KPj4NCj4gDQo+IElz
IGl0IHBvc3NpYmxlIHRvIHNoYXJlIHRoZSBib290IGxvZ3MgcGxlYXNlID8NCj4gQ29ub3IgaXMg
aGF2aW5nIGlzc3VlcyB3aXRoIG15IGFyY2hfdG9wb2xvZ3kvY2FjaGVpbmZvIHVwZGF0ZXMgaW4g
LW5leHQuDQo+IEkgd291bGQgbGlrZSB0byBrbm93IGlmIHlvdXIgaXNzdWUgaXMgcmVsYXRlZCB0
byB0aGF0IG9yIG5vdCA/DQo+IA0KPj4gU28gSSB0ZXN0ZWQgeW91ciBzZXJpZXMgb24gdG9wIG9m
IHY1LjE5LXJjNCArDQo+PiBjb21taXQgMDM5N2Q1MGY0Y2FkICgic3BpOiBkdC1iaW5kaW5nczog
TW92ZSAncngtc2FtcGxlLWRlbGF5LW5zJyB0bw0KPj4gc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFt
bCIpIGNoZXJyeS1waWNrZWQsDQo+PiAoaW4gb3JkZXIgdG8gYXZvaWQgY29uZmxpY3RzIHdoZW4g
YXBwbHlpbmcgeW91ciBzZXJpZXMsKQ0KPj4gYW5kIHRoZSBib2FyZCB3YXMgd29ya2luZyBhcyBp
bnRlbmRlZCwgbm8gd2FybmluZ3Mgb3IgUkNVIHN0YWxscy4NCj4+DQo+IA0KPiBJZiBwb3NzaWJs
ZSBjYW4geW91IGdpdmUgdGhpcyBicmFuY2hbMV0gYSB0cnkgd2hlcmUgbXkgY2hhbmdlcyBhcmUg
YW5kIGRvZXNuJ3QNCj4gaGF2ZSBhbnkgb3RoZXIgY2hhbmdlcyBmcm9tIC1uZXh0LiBTb3JyeSB0
byBib3RoZXIgeW91Lg0KPiANCj4gQ29ub3Igc2VlbSB0byBoYXZlIGlzc3VlIHdpdGggdGhpcyBj
b21taXRbMl0sIHNvIGlmIHlvdSBnZXQgaXNzdWVzIHRyeSB0bw0KPiBjaGVjayBpZiBbM10gd29y
a3MuDQoNCkZXSVcsIG15IHByb2JsZW1zIHdpdGggdGhhdCBhcmUgbm90IG9uIGNhbmFhbiBody4N
ClRoYW5rcywNCkNvbm9yLg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBTdWRlZXANCj4gDQo+IFsxXSBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3N1ZGVlcC5ob2xsYS9jL2FlODVhYmYyODRlNw0KPiBbMl0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9zdWRlZXAuaG9sbGEvYy8xNTViZDg0NWQxN2INCj4gWzNd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvc3VkZWVwLmhvbGxhL2MvMDA5Mjk3ZDI5ZmFhDQoNCg==
