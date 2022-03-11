Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370A4D60B0
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 12:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0286016CA;
	Fri, 11 Mar 2022 12:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0286016CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646998410;
	bh=lsHz2R3HqtBHk6vdTz83U1DkhGm2i8GQ5WrfNUFIPJg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQ8QinaBReVP20OFwZ/d/UAJAplDo1KhdMIWQAgbe/ez4UHTQZd4hlo6/cwxY4mGx
	 GcdhfLZFTZjMqXbDy7ucHOB4EOhcQT7tmapohpaOhKzqCGqJ89hjp1DicJ2O4YoDKf
	 qGxGEzMgEGHJDqP41TBjUJ0EI9/YJl6dyJlwBw5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AAB1F80238;
	Fri, 11 Mar 2022 12:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33FEF80227; Fri, 11 Mar 2022 12:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC581F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 12:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC581F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="xyBT7hWK"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="acXgk18o"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646998335; x=1678534335;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lsHz2R3HqtBHk6vdTz83U1DkhGm2i8GQ5WrfNUFIPJg=;
 b=xyBT7hWKOwS29SeDv8rh82yKrQn78JcxtVLSYR+A7ODRAdKygRB9RjUb
 d3630JPgnn5MWjVRf2Xydsao+ZifJ3z0QFYe0w63jDzNVM0ji4qWwWBBW
 Azjkd0m5qZxvwo5vUO7+Jw/nmwmXYqhkLvWBABsIx6ukG2KtcXrMk8bnR
 4B0Pp3kHvKEL3b+BBF6UghsWq44mI92HbR64PAmw9MjzzYAMBBJ51QcI1
 mqlrTfe3+qwFyrWADdJrhyki73i2bP9Av9WWSQSJd8VRaYrn00CGJ9ff3
 ROLbzjoJC7mgE8P1CggTGSTJlPLbw5w2UZGKXFskngMlfh3SDW8T8vrUO g==;
X-IronPort-AV: E=Sophos;i="5.90,173,1643698800"; d="scan'208";a="148884114"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2022 04:32:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Mar 2022 04:32:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 11 Mar 2022 04:32:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpryCVCGKPOeweUbSqHYA5dzESmFnxGx1FhZdIJXE1kktDRno/h/e4mJzz+pNx07Singop3lKuG7ntqUIF3fTkEw0R6sT2SfZbt/SRw3bgLMqPQnKGbi+GFLoagKcZ9vOzs3VbEP7nilPP5+vJJGVwwYmjF52mBozVAZmiblK6h1dKDhCChmJSfmiUrJp5D0PwpbnDmAdz72oOf0Kklxg270r5oxXuNz0l4M/X6CHGkeBWuSHMQxnnWN/11HPtXQzkWrIHImyVtWeIKsBub8AW7cgaoJGPqBA48wi7x7trwHdqFtyN0AmiEULqBud29cWtr2o+RNQxyt/NIEgDTE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsHz2R3HqtBHk6vdTz83U1DkhGm2i8GQ5WrfNUFIPJg=;
 b=OtICJaCz7DayBsKtk19ZDVw3wWom50gckfthJY3UnybxGhdBH/AbmiY36XPpIodF2BqNwIojxwlhXwYAyQ96287mVZEs0L8fgq0DyYQFQIUzB5YeWx2f+3R6eVLtuNhpia2uRNP3dhWKZ9edCyfk7wpR/muQh9K4FtH3jMeUReNjzZZcuG3h3G9jcym6O/c+RWDApavowhNZagVj7DhXLpcwNe2YtAR06syOElXBuBeW4TMXQ6vxEbZL5cWnJ37y0WLCr2Qq1E8/GvG5q/U63kd6cwhDCyNe+iIsV8X2ui/2ssPWYXvI1J36BaikmDxO25kHa7J0uRPRNVtCdAtJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsHz2R3HqtBHk6vdTz83U1DkhGm2i8GQ5WrfNUFIPJg=;
 b=acXgk18oOAqWFqbb6ATcuRevQDa5wo5WGLrgx3Jrq9ehN2wnnzBq0JSVdf3+oqp1kBM5F5l1LYNJcM+2SkylQ+46i23rdu513T8zhxjY5+gPDPz4FVin6daLVdy2B7vFuaAn97kBIVCskKsvJfE9ehT/W/Fn07zkxmmIo5ez4m0=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 BY5PR11MB4085.namprd11.prod.outlook.com (2603:10b6:a03:18d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Fri, 11 Mar
 2022 11:32:07 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%4]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 11:32:06 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <Claudiu.Beznea@microchip.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: fix typo
Thread-Topic: [PATCH] ASoC: mchp-spdifrx: fix typo
Thread-Index: AQHYNTr4npTSTRUpnk2/d/bzh/aVWay6DM8A
Date: Fri, 11 Mar 2022 11:32:06 +0000
Message-ID: <c014b95d-abbc-ddad-4604-73af2f52f9b6@microchip.com>
References: <20220311112818.1482372-1-claudiu.beznea@microchip.com>
In-Reply-To: <20220311112818.1482372-1-claudiu.beznea@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bae076b9-54e8-4de3-11aa-08da0352c5ed
x-ms-traffictypediagnostic: BY5PR11MB4085:EE_
x-microsoft-antispam-prvs: <BY5PR11MB408564FD35F8D2B091E513D5E70C9@BY5PR11MB4085.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BC4loz+YCiwtCAIk7eVCF+aAViL1Z5Af5QNYniS6sTgLFbSFTDlj5j2hgR4wk6AChii13lDQUhSkfROViHJnPE3mzJIlhlzA1824WEzs2S28EcbanZ7//9r+l90M6RrBtryRSBWr73Nojk4Sg5sABb1V2B4PvlpPNJSxpMv9fsbkr0UVI32zVTekSiTaCKNfecp4PWVWmoBOa545UJIghahC57VGfvhFKBh8C9Cq7JRJpw3x2T3iWFXRHBLsJjz6HYNvLS6Z5asFEAeEikY06ajw5O9QTc2NOrJma/Q8MYuOApawtx78ZspTtp0plTQpTRzlLaiyxNUjSWoQ8qKYMieAS5EjOHzTjpQXVld5wGXSyo9xuXeIQGuZ6c7pfr0geFzcYhs7fDQSwY/OZztWVax4+rPYsunTaMcM+w8Iy0eveCfoPrr4jLejYtJ1INoIzTKjPa7hfarrKFPb3na7l8G3nh4VNsSeVDaT/CJSsstqXGlW0plnQC0+ylm2So9OL5+nkeHYOMSqwaiIxVLWI84IwPVuBXzoKionz7Zt3HMDjeX88dKgnhdFm8FMzWtf9qyir5WevMIuQltlpT6ghyM6Vzy/aC2AwBUjbtQ2ZsuobuV+KsxypdttMmWCXbnaVdfPjFo9uW8t0W5B9xIaksnyne6f6UEhwHqfSdsXpQVcleTyp4IR4Y9j1KLnDw5TLfUTmfONDaELvbsaeFPsES2iMmAWSBO2VM1j61cGiPhpZFD5G26WbszWxwxi9+XBBB6EbodSjM8SR+4df/Ofiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(8936002)(5660300002)(2906002)(2616005)(6506007)(64756008)(53546011)(38100700002)(83380400001)(558084003)(316002)(26005)(91956017)(66556008)(76116006)(66946007)(66446008)(8676002)(508600001)(122000001)(66476007)(31686004)(6486002)(4326008)(71200400001)(54906003)(6636002)(110136005)(186003)(31696002)(86362001)(38070700005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1hZQzNFSzV6dW4ySEh3WTJmNWVGU1dXUUYxUS9WUGxMRExaNVVHU296WGZn?=
 =?utf-8?B?TkdVNTRNbUdWaEdjZlNjbHhPczBibVJEcTFCM2lDNnBwcmtHZy9DSHVDK09z?=
 =?utf-8?B?eWE2bU00eTRIV3RLMjJlZnJRZHlGZmdTdDJOQmFVWWxEcGRHU1V4RHlqNzZx?=
 =?utf-8?B?MjNtOFptRVZoUGNiQ2kvbWF0SElyN1IrZVpEL3pmejNKTFJqVlZ6cllUMnZk?=
 =?utf-8?B?WHlReko4TThlQlplU3VaQUlialVVRWcxN2w1ZHZEVXpUSmYvZXdyV1VxTjN0?=
 =?utf-8?B?RFBiTGlzYnFpOGc3VUlGSkVQbkJNTk40ZXkramQrenpCMUZaZUpDaCs0RGVh?=
 =?utf-8?B?TmxVN1VBa1FuOGduT0FnR2ZqQXJMZ2lpUXdBc0FDRmRTcGVXajJyMmpJeDFD?=
 =?utf-8?B?VW5ITU9oNXdmRjE2YWo0ZU5MMnV1aVNjNmlpODRka2xVQ1psbW1ucllLZ1FX?=
 =?utf-8?B?Vk1iY0NKV0VYQWFadW1VVUt5bU9VOW1IbHR6OTMrZTdOOXlYK0J6VUFBSVZU?=
 =?utf-8?B?TFNFakR2WUlmUXh4ZUQ5b3BEYW45dW9nRjhRSzdyOUdUNkRlYWFIdi9BeFZM?=
 =?utf-8?B?MVpZTlhkVXc1QnBRTGpQbU55dzF4OXRVSUxFbkdOdHgyYU42NEY0aEw5OG0z?=
 =?utf-8?B?c0QvS0dwbUhGQ3JiZThIR21ocjNjZ0YyTUl6QUx5K0xFNjlIeVlmb1hZUGVO?=
 =?utf-8?B?UWx1SFptS1cybHVwM2xuUXhaNG13YTBvcDlPRFBGemRrUHJ4VExtT0Ixd0lr?=
 =?utf-8?B?N2ZiaWZ0bVBZL0dWWjNRY1V5bVJQSndDcW9PY1BwVlBpc2djZ2hWamFLZU9X?=
 =?utf-8?B?UHVFT0RFTDhBZ1ZtR0hxQ01sTG5LSjgreVdGSE5kRTRld2dyUTd0NE94ZjBu?=
 =?utf-8?B?RTZWRTQzMEEwTG5NcTVVa2M1em1vcmplN1lHY3lmSyszeFp1TGNKUDlZd0VP?=
 =?utf-8?B?OEMvck9rSk5jNFJSTDV0S1dveFNsdkRuOGpaRlhLNElENlF3TGp1Z1VCa0Vt?=
 =?utf-8?B?Z1VubXEvMG1pWXVMWnQybEQ1NXJYZjF6KzFJeVBCYXcxUFNpQ0hEb0pGZ3Nv?=
 =?utf-8?B?TWxiUVNrendpcVNYYTY3RDc1a21QZ3lTTVJlaDArTllFb2FvYTZWdVdQL3Vv?=
 =?utf-8?B?dXZDb21xVWF3UjAraHFWbk5STC9lb1RYZ2RuZVZ3czIyNWE1VnRGUWEvWW0v?=
 =?utf-8?B?c3VxRmxBVTJadkZrWEE3N3ZzbCtjYU15ejNMRTllcnlIMFlYMFJIWWk5MWRM?=
 =?utf-8?B?OTFlMmVvTTJQN0tqTm85OWttMGlKc1JzTWdxbU1Pd3VRTVhyNVZ6MjUzYVZq?=
 =?utf-8?B?RGgxV2xjWjUvS0VqTGwzd0hzR3AyUDR6T1A4cUk1SGJjMEdKK2J5enBkcXVa?=
 =?utf-8?B?ZW94cmJPWHg2MDNCbElMUmlXc3FXblY1KytBaWIvQVZBdy9INnJxWlRsVlFB?=
 =?utf-8?B?M0QwRFV5TTYzSmF5UWRqczR2YXpneGNUeE42VTlIWnBaaWxjbEVtbEs4RWlD?=
 =?utf-8?B?ZXkxTTBwTXFYNHdJamc5YzZjaTlWMytuM1p6NGlkN2dzVEdxNExmVVM3M0Ra?=
 =?utf-8?B?bUwzMFR5bnVjTEtUKzQvVlVoUlp4c0hyWkxsRFRraVdhaGRCTkFXMHIwUWdP?=
 =?utf-8?B?cnJtUmo3Vkk2ekVMemh2dnIzUHNTZnd4Tmc0NzNSZXI1bW5uQStyM096Z3RI?=
 =?utf-8?B?Nm9vNjI4TEtMQnRWdmxnc0FCZmpPS2thTDE5OU0yRzB5UDYwNTdUdVNjamhM?=
 =?utf-8?B?TzY2Qk5VT0ptQ2pXM1J5V2tIakV6SnE4Kytmb3dhb1kzckVBSzc0cVF6ZERW?=
 =?utf-8?B?R3JLR2FEdG9wSURwTEd1akFFUWNHZWVaT2NWUHlkbmJMS1JVNFQ0dkg2WUFC?=
 =?utf-8?B?OEc5SnZTak9GMERncU5CZGtDTms2dDd4dG1YQk5nQ1djaUdtMllRaEIyeHFB?=
 =?utf-8?B?aXVmMjJCVExlTTJaUFExV1V3dm0vVFNTU1dyNXFTdjZEcmliSHdOU3ZEODJL?=
 =?utf-8?B?SDcrc1lwakt3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CFB5CBAFE976B449CE0435F208D98E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae076b9-54e8-4de3-11aa-08da0352c5ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 11:32:06.8571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSxgGohoc01dM/mdl/ULvq+K73Uhs4FBTxXZD1qECxMAA27SIruiats0l88iTkU66scicMkZrl+vAfaPTyehMwH2qJ98hLcUZkI/o6u/4zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4085
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

T24gMTEuMDMuMjAyMiAxMzoyOCwgQ2xhdWRpdSBCZXpuZWEgd3JvdGU6DQo+IEZpeCB0eXBvIGlu
IGxvZyBkZXNjcmliaW5nIGZhaWx1cmUgb2YgZGV2bV9zbmRfZG1hZW5naW5lX3BjbV9yZWdpc3Rl
cigpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVh
QG1pY3JvY2hpcC5jb20+DQoNClJldmlld2VkLWJ5OiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmlu
LmNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbT4NCg==
