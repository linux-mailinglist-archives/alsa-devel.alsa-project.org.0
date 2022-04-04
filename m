Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762644F1536
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 14:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0535216FE;
	Mon,  4 Apr 2022 14:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0535216FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649076559;
	bh=+xrcKflQb1ugaq+lTlRvbWfm0cgg7/7p6BrjsOx6JK0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vOlosyEvT+YjUHxak3R8JJPXFvZHRSMO8+TmXE3uxy8kjEGzH6ndUReH76q7aA/xp
	 MxBFOdXz6O+qShHIgfuqYCDcCvqbmttNDJXDsheKXwxGdiPR1sMRhQP6e2auoiP/Hz
	 8zxM8/ULwRIbUBDfk17cc9itK1ghz6oIert1S4Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E564F80431;
	Mon,  4 Apr 2022 14:48:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4991EF8025B; Mon,  4 Apr 2022 14:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FAF8F8012C
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 14:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FAF8F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="kzlsibEx"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="u/BxqOCw"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649076501; x=1680612501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+xrcKflQb1ugaq+lTlRvbWfm0cgg7/7p6BrjsOx6JK0=;
 b=kzlsibEx7Jv0expvUA6m2ilJTruOHaMgdGRtuoIQoHfZsx7OGZxmVS+V
 yhN9erxpbFMoxiD7R1GYua8+YKGnOeZQGFDoYtaP9kGRIszRfDeMLIADe
 MdO+rAQovtbWV4Pp4/Z1NLheTFZlYxYMzy4qMFGJMbh+PhIgthUK3aSvR
 fYApL03SfmzrMssVtk0+LoJZHGrxdX+ScHAT9M57JuLuq+QUTtxHW654o
 fx/E5HgDT/xvJYwoACQjeYVwls/UxX2HrbeMhc0M44SFLegGN/+vhyjIa
 yRSiS6FvcqPvGFyr/d90218x+dtKe0aL10DhcaNs8p1MPZmSbwIp1SQfj Q==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643698800"; d="scan'208";a="158768722"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Apr 2022 05:48:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 4 Apr 2022 05:48:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 4 Apr 2022 05:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meKLa974xYJjChcQlKiSOcFXsxWhysvpe6lV79jdmNVGqFHl2u3Ltu3zA9+aSC9xlT55Opm5b98LgKV9KRhNuXussNue6DsH9aF/X3HeK6r61+/YLy7oZVhlSUQuRFAYEl4xLAhmvAK2TrIdsdLUOAJPsvo5qU4vaVA09J7CVp8uKzdVy14eYnG0A00s/UyRLPmj2nwCmnwFtG2dmPXNmxgErnRPI3yjZnyHVjszkUV3LdyJTLZmck1d4dDKGo77VgWJdUm1WGsDIhRjVwF8tH3Rb8Ej10eLstf29WRCSq9Yf4Ldu4ZeH8y+9FJ217zZUeKwCYC1H6g0C6W/wQ0DKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xrcKflQb1ugaq+lTlRvbWfm0cgg7/7p6BrjsOx6JK0=;
 b=d8bQD+NzKpwHefSNhXL9B/P6/dFr9EuNJ7WTUlvuWm2CkmU5kPVmNFtXS6YHIM1AJGPsFAZuvTgrS0yyZLZV5PdEVpbBCy2FXo8ejW5rhDCvqOSvPrpFkAxAbxVqDKgQSjXOdQbpgQh7NwvCw7V4MIFOrmonfbhhj3K+O5glgx6uNrFlG2VEsjxrv82e2dv+8jrYEkaS9nSDBF96SOvlFJxdZ6eGNOHIrFlGX8XxDwjiACQrQXMHjlz//dFzELK78gb1nL1JUtWvv2T8QG1qPyUhQAzozju5BUES45iv6hiCrleMQ79U/BJxeILURC/YFrEmjuTA/2oPXMvQT+s6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xrcKflQb1ugaq+lTlRvbWfm0cgg7/7p6BrjsOx6JK0=;
 b=u/BxqOCwPKVfGSPCDPSy6rR1OOWV/Yw8C9XtEZ6Ev06EnsMYyYtcsNawIjfdiN/FMTDZa45Qa4mEjomYqYds1Pn0CjI5QE293cwR0+jhDJEwQBORfrr9UsGY8o2877nU9+cKtgvLuXJXGEC0wm5QySorDjai7bnTjniYao/iT7A=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 BN7PR11MB2769.namprd11.prod.outlook.com (2603:10b6:406:b3::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Mon, 4 Apr 2022 12:48:05 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:48:05 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 3/3] ASoC: atmel: Don't squash error codes from
 atmel_ssc_set_audio()
Thread-Topic: [PATCH v1 3/3] ASoC: atmel: Don't squash error codes from
 atmel_ssc_set_audio()
Thread-Index: AQHYQF8cxNPImpJckkitXtYRPQnusazfw7aA
Date: Mon, 4 Apr 2022 12:48:05 +0000
Message-ID: <c89c28a8-f5d3-32da-d676-533c665a64b6@microchip.com>
References: <20220325154241.1600757-1-broonie@kernel.org>
 <20220325154241.1600757-4-broonie@kernel.org>
In-Reply-To: <20220325154241.1600757-4-broonie@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c0c4034-15bf-47ea-fc34-08da16395d05
x-ms-traffictypediagnostic: BN7PR11MB2769:EE_
x-microsoft-antispam-prvs: <BN7PR11MB2769C49B99451366CA7D52B7E7E59@BN7PR11MB2769.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YxMvaxJtnjK3TcffIXnNn3AycUlCBZs9Ne4duYvMmdYAyDe+KOPnwpVv+ijKYVZUeo1eN4/IS70lLz9WTEy9zJ9QNRkmsGK/pL7VeNfxeZo0TyaQ0mmIaQwruylEWiBDqaHAVdv6N9mqCwrc4ZwOeuIGz/zDIctkbj4vEvjQ7yS1mJqwhQ0CEGRSa41tKEQx0tQw1jysiNDB7PAyaf19RA97CJG//hf59NICnvynm3E5L7DgtxNNV8yXCgIYJSxrnFX7lI5zQJxZRp+jU+4jYuQjtncrN2NeBVjZMo2TRjz52A4rMeLCB2swp0RX8HxbCFu8YhPUxwGlai1+yhQkOOYXTSgUotM+3/bxeZuVjEZ9liUg5j9Qle/EywX5wd73HYDIsGMNw5HFZgR3k/BGo/VkXQoy/G6TCu5deXuVRfh7MgGCjPHYes5m1otBIBUHvgC+y3LLBWllMahxD/w4OGxh9Su+KUTDDoTjnGEQMfjknN6mp14mUZPTf8RYuaxbZhS5DBHTh+5a8kTYomJ4TgWPhJPSPrCjfvjH9XyuVM8pqkfl+7mmMUIJWpZc+BUN2G6i7G6Yxl28FKmFKNG4gP+m/RuU/yiN4D64aAxVx9GW3FziLFU6jWYtdEsxRFQUWDJwmniscSrAMKkZmOclLbZWqJZzi1hSKf9GgDW7MoIiGNIu64km7NdDvcpGNAIxLU8XYmeozF8SWiqWZ4g5/cHsKca1TyXmqYrBQrqVWB/YEwxGLpkGpfotgEXntMu17IH+rZcY4vO7LKBBplei5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(83380400001)(186003)(2906002)(31686004)(36756003)(76116006)(316002)(66556008)(66476007)(66446008)(8936002)(64756008)(122000001)(6512007)(38070700005)(5660300002)(508600001)(91956017)(6486002)(53546011)(110136005)(71200400001)(8676002)(4326008)(66946007)(86362001)(6506007)(31696002)(38100700002)(4744005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE9Obmh5L2JYeklhZXpZekJVUTh1VUFaQUFxOVZpNUpUTWkwWHNuVWlOZlM5?=
 =?utf-8?B?TFJhZy9KbGgvd1U2cG45RmNVT3RISVJsbnlpemZxK0NTc0pYWjV1bVoyRnhh?=
 =?utf-8?B?NE5DakZvTTR5T3lHR0s2RmpLZnR1NEZJSWpLTkNzUUhHUWdSdHc2WXUrUHUx?=
 =?utf-8?B?RlprQkppV2l3OHEvL1ZTOVZjSDZWM3Q3RFJYQ0YwMTIwRDRSd09JUmVLRHZX?=
 =?utf-8?B?dTlqZjQwckJiRnVFd3ZaUkhaS3FPaE9Mc1V4alFJRlF4NnMvbGlQQm5BMW1v?=
 =?utf-8?B?dWFsOUEvU1Axc0VxN2JNTmw4TUFsMHNSVTJhVFBTSlVEYlBkMHhnbFl2UjE4?=
 =?utf-8?B?TlBpRkNLWTJpdFpGYVZneHpoOHR0ZzlnenZ1MEpKKysvclBjdm96NVhzZlRj?=
 =?utf-8?B?Q2hFNExyZjI1MjlyUzA2cUxSQkFFTm82cytCN3JOVGtTSGFOdXhXejVaNytZ?=
 =?utf-8?B?N1VOS3Q2bmQ1R0FNZGVwYUw2cDNRaDBWVklkVE1BQVF6YUN2MVRqT0JkTFVO?=
 =?utf-8?B?NldhU2kzcnR0OWkyTkYrNEhtUklKWWk2VGhXaUZYbVhJeGVJbE9UaW1Semhn?=
 =?utf-8?B?bWQyQWptemdLNE03ZmdMYXlzM2ZtYWN2MDd1T2JHcTlvR0lKWmpuUUJ0SUY0?=
 =?utf-8?B?UDQvR0hWUVBjcHh2ZUh3S1IwUUkwblNkY0IxUEttQXliNGJhcXJmdnl0R0hC?=
 =?utf-8?B?YlNjUmNUNHhvaEhpd09UY0xDcktXeWtJcTJIbWQvUDg3T2pOU3hrZGxvS1Zj?=
 =?utf-8?B?NS8vUDR5Qlo2Q1BHMTdzYUkrY0I2b0Y5eGRwL3UyNEFqdG8wS0NNbDdwUExF?=
 =?utf-8?B?NEkrNU9QSWptY3VhdEw2dVBOVmxkUG5UeVJkRjZFbXRSdFRQbi94a3Bkc0NC?=
 =?utf-8?B?czhlazFTMk1jOHlabnRXZW9Rc1JzKzZKODkzQ3lLUFFtbi9pVEtYVVppMjRi?=
 =?utf-8?B?akFOWnYrMDdacC9XbWUrREtUWHV0UEhobzNoaHRMR1czSWE4SlJhNFUrOXFF?=
 =?utf-8?B?Q0R4Rml0c2ZZbThBK0ZSVitFT0paUHg4aXZKVGlNR1hqTTYrd1N0QXo4eVlC?=
 =?utf-8?B?SG1Qd0xiS1JQOTRwTnBLdUQ1WDlLUTFLd1NjYndrYTFYY3pRQmUrcjh1cktz?=
 =?utf-8?B?VWk0KzViRkEvTzAzNFNWeTdZWTROa1pEQ2JDM2szcWpjdGJ2bmNuOEVuMXNV?=
 =?utf-8?B?R2ZkcHBUVDhiRDdHZzd6dFF3VXBzV0ttNUE2Q21rdGVKenJqOXIwb3cvdEp3?=
 =?utf-8?B?MGhPcFZtVVZWN2NmbFJDc2tyTUc1RWpLWUxPVW5nUXpmamVpbnJvdmRBaTlk?=
 =?utf-8?B?TmZXT1BZZ0Nwb3c4alRKUWQrdUt4QWhjbXBaV3VSczRoVk85ZnRYWUxRczI3?=
 =?utf-8?B?RHlIOENsaGxNVWRuNWx6RkFVU25ZaE0xTk5kc2IvdC9IQmVjcjA3M2I2V2dM?=
 =?utf-8?B?aldLMGJCc0g1VEdrcDhsOUJWdVJDOUFjbE9nQ016QTNIRVdvOHVOS1VWSSs4?=
 =?utf-8?B?NkZCVHhpMnVvNGhPV25EMDBBeHZlaWVXaVdOMmhZS3JQL3pkS2grdWhGdXpk?=
 =?utf-8?B?Z2VuWVZUc2RhSGVaV1Y4U0dXRm01bVpRcGUrUEFISzMxVWNKdW0vSXFMSlNp?=
 =?utf-8?B?bkd2M3RqUFhMUXhBY0hMSUNCcGlGMUpYMkY2VTlhdkYwb2pGeVdYNWdHNEFQ?=
 =?utf-8?B?RW1DL3FCVHA2elpWSHdqY0hyQTVLMVhhQTVGQ0NGNlZMTzVBQlVWSm44TWNm?=
 =?utf-8?B?LytYa1VaV3hTbEhRSzI1aDRweEFYdGZsbWR6dmdZQmorRHl0Qkx5Q2doMUh0?=
 =?utf-8?B?VXBpU2JtN29MTjd0dllya0x6U05ZRXQ3N2NRTWVCaTNNbUk2MGs3SDdQZ2Ja?=
 =?utf-8?B?WWtCK2pZR1lSUXM2QnV2ZFVhMTRkWHMrK0xNaERoUVBDcjBwellTMnA4cldw?=
 =?utf-8?B?bU9LRVZIampkd09kRjQwMkVQdTFlaXhEcFNXdmFNdlZIRjRheG5aTVZiMVZU?=
 =?utf-8?B?a2FST0VINnU4WUV4VGs0cHZsUWk4TU9JSE1zTTVscXpUZmZ3c2tMYzZyaGNQ?=
 =?utf-8?B?aU01aWRSSUM4U0NtbWw5ZmYveGI2bnJvNVU2RHJkMm02L1NUVTdDRG1LSU5X?=
 =?utf-8?B?N3NaVTMzVzhnTmRTUFlSMWJxMXdpU3p1UWV1bFAwVWNReFI4Y0ZtYjlPRmZ2?=
 =?utf-8?B?Q2dxbDIzeTMrUHJFZkRDckxTb2QxeSt5OVpzenk2bmFRdU85aE9DaG1qSGtT?=
 =?utf-8?B?SkxrQXcxZUtjSFVpMTgxd05hV0dHQlNnNXYzYVFVQmlLQm82ZzNXUUN1Qkxu?=
 =?utf-8?B?L0sxRlFyenFpK0ljYTluV2lVTmtSMkNRekNlMHhpNEY1aEdzOThZZi80QWI2?=
 =?utf-8?Q?qKA1lLSsnLZbWbnaYcXrdnSAYg5xQUblYcErxM4plViFx?=
x-ms-exchange-antispam-messagedata-1: BsWIY3E6Z6UHI/YDp+c/HItgL1YeC3N7CRE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CCA9779B849D940A633488878C6609E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0c4034-15bf-47ea-fc34-08da16395d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2022 12:48:05.5029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wz8GX4RBybmzyiq6TKEBa1Bed7ItOBwWwpiiiRlxBZbwzIPYeZfTo3DgP4nAIc4Teq184qLMCWbpdH9msozwqlF1PA5+XfqTnYuwV0Uqm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2769
Cc: alsa-devel@alsa-project.org
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

T24gMjUuMDMuMjAyMiAxNzo0MiwgTWFyayBCcm93biB3cm90ZToNCj4gVGhlIEFUOTFTQU05RzIw
LUVLIGF1ZGlvIGRyaXZlciBpcyByZXBsYWNpbmcgYW55IGVycm9yIGNvZGUgcmV0dXJuZWQgYnkN
Cj4gYXRtZWxfc3NjX3NldF9hdWRpbygpIHdpdGggLUVJTlZBTCB3aGljaCBjb3VsZCBiZSB1bmhl
bHBmdWwgZm9yIGRlYnVnZ2luZy4NCj4gUGFzcyB0aHJvdWdoIHRoZSBlcnJvciBjb2RlLCBhbmQg
aW5jbHVkZSBpdCBpbiB0aGUgbG9nIG1lc3NhZ2Ugd2UgcHJpbnQgZm9yDQo+IGdvb2QgbWVhc3Vy
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4N
Cg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNy
b2NoaXAuY29tPg0KDQpUaGFua3MhDQo=
