Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1A4D34F5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 17:55:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A73401708;
	Wed,  9 Mar 2022 17:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A73401708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646844919;
	bh=G1bxJYJjdpOMIN9t5kCC7s1P+jSUFkfrs8BPxS710Wc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uPlLhOkM4ymfMfbkEsW9q+yIvPKEyM5v9VQzkYJbdnaa0SyL4xJOdkXgT9CuDFHrB
	 M+U118WulqjLKO2G93rWhwtYLJD//kVTUw1l9DhRNo8w+DQl2Dbs2n0NuFxJ513t5Z
	 FjjekQWohGGZmLpZsbq66rCBCIPztwRey+fghBO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7588F80236;
	Wed,  9 Mar 2022 17:54:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D3BDF8016C; Wed,  9 Mar 2022 17:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86FD9F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 17:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FD9F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="fEvKzVUZ"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="PrnMEfgb"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646844846; x=1678380846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=G1bxJYJjdpOMIN9t5kCC7s1P+jSUFkfrs8BPxS710Wc=;
 b=fEvKzVUZjZwgoUsLbsWK/UWzSXH25g3//QFoSiM9OnB9KlLH12Jv/Ttu
 Sj1aYlCLyZgvIpJCT0nm85oFT8JbL6GU6toq3+qePBDBHEB9riulK1AAF
 0bt5bmd8ANBgWR/FDRLeFccUI0P4GLFp8HjKvXc/+Wdr5irbl8ts2fFvc
 MS1TKapuW2jO70BVlxDWy2+Le+z1fYGnt7xnM9P1ArICKLdN/MMF5MwYY
 OtlglhLZfG9+f6dmlkt8PXC7pjPQjiFJOV6ZdlRtl0gbp8xEfwl05q9Kj
 +6n33+12hF72B3/V2/PY4IASzR1KwZfaysVgNgX4Y7yMyCxzWctj/H88t Q==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="148646595"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 09:53:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 09:53:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 9 Mar 2022 09:53:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIl2VVBrPGeLYh/QaUiQjwK6ZZVz0HlM7tIJrI5Z5VZo0FsyQYm7cDEZtNqgh76uZ2FaXAUfw6bfK0K+WV62/9EDkGeK6PU3J40vID43DFdw9HzdOl7nC3wdTPvLz7oQnC3G7UismX21wOZfMd+mK82tQP/5sBQ/RQ/gFhGF8A1EMwtXwg0BwBUOHXUjBGdAMerAurORLBSWbcGJv1TSytnyapaSeVrVqWx8TOzp4sAE8clKeNnfqzkyG28GyIVVwcTw737jSBst+ZjgnqEncJJZFMoQP5xCc2HoDMGBr65dHD0lPPq2RczqDqChCfktRyJRnJ29tBzh811pGlCOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1bxJYJjdpOMIN9t5kCC7s1P+jSUFkfrs8BPxS710Wc=;
 b=iROAJBanC45D/SWeAo+sO49yz6Obw4ls4pYaIblmPKIx3baFTEyItnCYerZgRLBYm+VXe+VyQDwqmaeecjkLlZybmoaSXNyEC0XzFSZZUf6qQoCKEOwfVeWsAgdaFZQ54ata8yXo3DBlQk3cfPmZKAh9WV9hX59sjma/CeBubp0yLfe4qk59ZcY+EBACJEd5SPPKZKRvs+gIfo5FkytY92MV+OpYuqW3AE7q9pZMHdcv+meHhO4ZIrWo64Cm6rTYA1nK5l6QINK8I571LHcEKq5vPMlJyvtqlPjq1r3RfkKkTNLFVMFSDmNQaShm3BWguy7/tjkC7QX6yHehykiQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1bxJYJjdpOMIN9t5kCC7s1P+jSUFkfrs8BPxS710Wc=;
 b=PrnMEfgb7/A3DBvPhTja5P+vE2+1fJAvBm+yBDfMF3E66MkN88z5I8hOS7iDWXfTGblADzKoOgpOnmUAID29a+mB0o72iIhZSACGPI9lp8JhKIcGXyXFXCX9ZafQxgsEYwFPsqWgE8q2Lo4gh/BeQLQnSCLlgD7QpYK81bvqTX4=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB3852.namprd11.prod.outlook.com (2603:10b6:5:13a::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.21; Wed, 9 Mar 2022 16:53:46 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 16:53:46 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <colin.i.king@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Claudiu.Beznea@microchip.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH][next] ASoC: atmel: mchp-pdmc: Fix spelling mistake
 "microchopnes" -> "microphones"
Thread-Topic: [PATCH][next] ASoC: atmel: mchp-pdmc: Fix spelling mistake
 "microchopnes" -> "microphones"
Thread-Index: AQHYM9SadTAEADrffUavYDImKC5Uaqy3RNIA
Date: Wed, 9 Mar 2022 16:53:46 +0000
Message-ID: <5438f75c-607c-f6a1-e403-bc07444d2ec4@microchip.com>
References: <20220309164116.178685-1-colin.i.king@gmail.com>
In-Reply-To: <20220309164116.178685-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cafb27f-8069-499c-5e75-08da01ed60be
x-ms-traffictypediagnostic: DM6PR11MB3852:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3852692635C90F967042B5B1E70A9@DM6PR11MB3852.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NTl50PGhtPW1FAaAiNZPmF1AQCWPe6aknoNvCNjoaOnl1Vyj4FLCi2PU911dQJuPbcpCDP7LWgeMEIESwa7hDQ2+P//szM5KZOphqhRoCsCR+I43CxXNegkGslwC+HV7qEw/VM5VEp2llxgzzIsMZyf45uziHkXGOmosT/IltZ1GTSk3sP8y/av1ZxgjM530BftAoiZbNjXnP0oXS+9tz5nd6+h3xcDUtkY18HLpYR7m9mK5p0aBCzMsFScapfmEpnBlbAX/b0yDGXlRKQaMULmQA4pk9DrCPkMvCLcsSZlUU/sbUuspPfY3ZqCjLqjkjV9oOZWohlT0/Cc9Ly91FepHgk/Pk1Uqehqnu7A3QfBl7tJH2sGt6lZUzINOioa5w6TIgIiSapTlqhuNBAfs54RYFkh6Fedaztu8QmmBPAtrdqgdAJz9c59UtyZFU+DH/b0WfH1+u85nHuejJC048X4avrTebHjp87uf8lP64J50QZgUZHWO5J1ZxvEDSDg1IJycdqF4VksqHoUCdsfkvvdheKACsANaEAUMvT6k2kX2RQ4bK6utIAmyBJCAQ7u96gy67PBgxppJ6W7xqAGXslzCiN4GfD5xtYiFCSUjHbJ7UgBHGB3rU8xrJNgVveArFPM3TXfAWzaEuu7RWB7DU31hfzxvOlOigrV1aZ7m8FvbtG3ZXHexBLokbnuUTcZBcW8xOQJz3TO4rOar7PGrayuHkZPwlvAuF145cpeVh+sR5CaBC8oplB1liyEgoA1y/gtpGlz7M6uPAOH3KhtSQEs0U0xnqKP5udiUBNSy0j0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(921005)(83380400001)(6486002)(54906003)(5660300002)(110136005)(71200400001)(7416002)(76116006)(8676002)(4326008)(8936002)(66446008)(66556008)(64756008)(66476007)(66946007)(316002)(91956017)(2616005)(26005)(186003)(508600001)(6512007)(53546011)(2906002)(38070700005)(31696002)(6506007)(86362001)(36756003)(31686004)(558084003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MklwL1NicWdOeURVQWp3K3QvdkpMNWdLKzNqb0dWampTSXFXQkpEVjBzUTZW?=
 =?utf-8?B?QlRhaGtBOVRaNll5eEdTYkhJK1l3eGNUMnBWWDFZeTQzU3k3Q1d3bk91anQ1?=
 =?utf-8?B?WXRQZUtLazB6M3BDYXNjOFpDamx1QS9wMnV5QUVqLzA3Vk9QK0hkcEUzd0Fk?=
 =?utf-8?B?VkF6NVFBWGttL2ZDQWVTM1piQ3VRS1pLNytIM2lsNDFja01MUE1XelcxWUZU?=
 =?utf-8?B?RDBiZUJ2TDN5eDd4ZzNTYmJMd29XYzBmQ241dmwra2pJQXA3cUMwVzQ5VzlF?=
 =?utf-8?B?WXUwUDJaS2dzbEU0SzN5ekJwcXJnbzdRREMweWtiK2lXQkRxV3lTRjZqWGtF?=
 =?utf-8?B?bDBlWWUwZW9lenY0RU56MlBoQkNjUi9XVUJVRS9TNzFaNmdiVlc2cmw3a3hW?=
 =?utf-8?B?VmVPMXdkNlVTRW4rTmtoSG5jVlU4NTJZRTFFMzQzSlJFL2NrWWc3MmlQNTBR?=
 =?utf-8?B?aFRZRy93VzZ4aE4yeHJzaWpOdFRLRlRaeTRna3Q4OTVlaDhUdm4rWmNZMUZh?=
 =?utf-8?B?akdJZDFVR3NyZmZGZDBlOHRlYXN2ZzJsWk84YkNSTWtLZHN0UEUwZDdwSDlI?=
 =?utf-8?B?cjQ1Nm5KclZiRkNUOHMrTDVPZ2lLOVBCemUwcWU1SmIwVlA5RVNtd3l4SmQ2?=
 =?utf-8?B?YmdVSXhOOGViOEduNVpYNGxVK1ltcUFwYWY5YTFCTGhLWDNRUlBJS2tCMGdI?=
 =?utf-8?B?NGx6NVZGaUFBUkZERDVXTmdBTGxLdUVhWXcwN0xTb2JBUE5oM2QxUk9hVzB2?=
 =?utf-8?B?dERGcXBCaW5xVG50YTNycnR6a1k2a0J3emlHeTFmOWgreE5VTk1pZzhiTGtR?=
 =?utf-8?B?THkvamhtZC9xdlY3STFoY1F3NVN0cTRrd2dCRlgzdWd5SEJjQW1JWUFQSkNx?=
 =?utf-8?B?TDhLVi9uMFhPWnZ6UmsvNTE1aDJKdlNkdWV0N0NaaWc2WnlhelZ4N1dEelVB?=
 =?utf-8?B?RHhVS1BVZTMvUXExdEdjMGcxT3hONWhKL3JFMDZpR1FxYWo3S3B0WFlRNkpq?=
 =?utf-8?B?TnJGd2IvT3AvS3o5alQ2ays3NjJQQXZpT0EweHBBNCs5c2dXdkY3S1VWTEtm?=
 =?utf-8?B?Z0ZjZUVNdEZiVzdJNi9qYy8yN3JiVTQvZlVpcFZER1p1K0xUMkRTOE8zMUdl?=
 =?utf-8?B?OXcrU3JJV29XcXBkZ1IwelVwdmEvcFU5WU5kNWRwQmlJVWlGaW54amZLUHNX?=
 =?utf-8?B?bTJIemd1M2lyNlBIeGtyUEE0c2c5dC9XY1ZvMXg1WHlOUmlNc1hFRTBSYjhE?=
 =?utf-8?B?N2NBdlg1cmxKY1ZGeUpqV0dSZTkyV09zMjhac1BQM2xEWnJFMlVTTm9NZ0xq?=
 =?utf-8?B?eDc2NGUrZVVYZEVaVEVJYnlYZXg2NmFkUXBBMzRzREU3WXR6eXdiUktSeWYx?=
 =?utf-8?B?V094aXJkMkp5OEREWHpqbkhxNzRjN054NnU4cnVqVzZ5bnUzOEpQU2RtOUti?=
 =?utf-8?B?OXJxUlU5UExmSmVLUVJxOUpZS21UQVJkcVBuNEt4bXhPanp3WHNyaWU2MkpE?=
 =?utf-8?B?KzRYbTNHcXJYSnB3V2p4U2Z3OU9NOHBQNitlVzJvNGh0bmY5WC9wNWFlZ3p1?=
 =?utf-8?B?S0hyTW5nVDhCcGF3Nks0a0wxVTU1WmZ5akk3eFpDUm9lcDVhTkppbVUzc1lS?=
 =?utf-8?B?dmVPOHlrQjZKRjhHWTAyUW90ZjNZMVI2bUt5aU9yekFJSnYyeVpOQ09VQU55?=
 =?utf-8?B?K3JPY2lvYTZBdVBySFpRc21WYUxTWklsM2M0Q2ZMeEpHckg0N3pZN0dxNmtv?=
 =?utf-8?B?aGhQekZLZlpLMVpNQUh3S2dubnFqc2x4R1R6T1ZpekZnSmdqRTc5VVZxTUpU?=
 =?utf-8?B?VDh1VVFWNWJBMVE4ZGs4QkVoWk1mcGd0RkNFK2pCbktyamRBQVhlOXJsemVn?=
 =?utf-8?B?NEtjQVh2WjZWOGhNOHdHL0JhNUZJRGMyVFZBcGRpbmJCbktYRzI0TDBwWFMy?=
 =?utf-8?B?Ym5LMTZqMDJSNWFoTjlSaVovZHlHTG10MlR5NFpLWkhYQkYyblliaXBtSE1T?=
 =?utf-8?B?ZXBLWjJERnBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCAC9BAA75825A4B86F647C3C3DEE5E7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cafb27f-8069-499c-5e75-08da01ed60be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 16:53:46.7218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zHR/SvegeQRbuhiAllaX8iEld8iDEwDe5SaK01R6ggDEWfp0L7JdlSKFGmQuM3adgZmHBtpfxKjoGbq450SVlX8xPe4lahUaLA3BX1XcAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3852
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gMDkuMDMuMjAyMiAxODo0MSwgQ29saW4gSWFuIEtpbmcgd3JvdGU6DQo+IFRoZXJlIGlzIGEg
c3BlbGxpbmcgbWlzdGFrZSBpbiBhIGRldl9pbmZvIG1lc3NhZ2UuIEZpeCBpdC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogQ29kcmluIENpdWJvdGFyaXUgPGNvZHJpbi5jaXVib3Rhcml1QG1pY3JvY2hp
cC5jb20+DQoNClRoYW5rcyENCg==
