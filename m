Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D34CF9A5
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:10:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43C116E4;
	Mon,  7 Mar 2022 11:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43C116E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646647827;
	bh=THwEtvqwulAP1xU54RtB6qSaOR5I0M6GFXdMT0mM2+I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlDRNTSht4tWc3HDh5JrngIHqGdeNEiv4PmbmxsbVN5q0FafrJ1L4Qd8iUVzaa7y6
	 /mye7bq39FfmCn0lr2h1LSrmZh1QCLN0tQJSNR8Eq3DWV1til9zN2wgzyjaQscinh3
	 i0ACmnKxmrsc6areFO9D29ycy7KyA0YXfkRm6coA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 392E4F80159;
	Mon,  7 Mar 2022 11:09:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4E48F8013F; Mon,  7 Mar 2022 11:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA72F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA72F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="wcSoK99P"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="KhNkK8wC"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646647757; x=1678183757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=THwEtvqwulAP1xU54RtB6qSaOR5I0M6GFXdMT0mM2+I=;
 b=wcSoK99PmIolqGScI6YfljFuzHj1tC/JkPmhKRR8wJlvQKksnYpn+3Nh
 uH0DNTYyHFUkLxLPC9dWlvKP4lltnxlajaCzsh+0FdFW8jtqQG0dZkUtU
 OKchXZS+6tkRWEUcQDQnAyv3U1M8rofJkLtDJgbpIz0AiD0v1aWARRde4
 5NTeEPcMnJXdKMmoRXUJdIf385qU18IsAXE8/gOnRgxrlql0m2A8GsC88
 eUBPwJv+hH538XauLyWfs8e72TAHSkeO3iLKqOdL3Od/8AtETtKYXM8db
 jp2zksZjfCCVwChupGwIG83AwNJ8aJSkGrLJdAulA0kwmwcizI7xwGBKz w==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="155475580"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 03:09:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 03:09:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 03:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoS7YXXIQ5lnfMBJot+HTIQaJjSz9oXtw2/+Crt4BKQgvmQOU1c3yQHTjLHs6HT3Z6KruC6jOyJZajETsvAc2gyVyWoHeFxvXmNr/XdSqUy6+A8B5KCErbWnrUQTC9XK2zbbtmD5+kAkPiHEB7nS9zXXUzX2K2WUm8K8lRG33LH7q0zQnasmjtZYGY9G0O3e+OMNC1AyBf7MZLoQW0Y6+BNRAXVReonfXy+j/jnZXMEcqw6tx0DVdHVXyUHh1SG1IW+zmPoXKvXLUY712uzFjkPsCiVa0jiMME0m5e9nndnMP6JNJBHFSz7rmWKJlvKxb5Hq9RKAMG7D3k1qp+sv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THwEtvqwulAP1xU54RtB6qSaOR5I0M6GFXdMT0mM2+I=;
 b=LEmGs6SR91ZVrvlEJcufiHa5fn1NbvYFQ//CqIAMqS2/yUEMB0xaaUzLnNDL8NXmt9v6QTgtsUA/LPbRTd3jWVJc2lemO34pWtjRFvJWgD9RPiXd6XnW5OAq70+9ln9meY/OQQ6BFGEVAHTXZdj0pPLNAHhKW8w//AN+8HhXdwEl2+4K2AsN4QUJsLVO+GMrMADHnnqhGUcp6epmHsyGVqcRq28JG8nuFHGkotSHVgjKwPpek/lxsHF7Mkc8YRrjJtogdR7sp/7yK/RoYJS+CKx8sRT6K9wFLk9YMbi6E/RH30FFrSxuIK/QnAlyz3w/SROLLpVegz03IeY0T2p7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THwEtvqwulAP1xU54RtB6qSaOR5I0M6GFXdMT0mM2+I=;
 b=KhNkK8wCvAmB/BNdce1SYGRS6QQjZgDDT0ixJu+vIbUpTEvhOs3ndY3ywfBYpPZGvNyR3F25A6bABx8heAnKpu+1L+FfVnW9/nkirNQRJaNByhKaTMpVXnJmSYDXHHNGz3V/HWZns1A4eB9ZMamDMJU7/QW/YEH4Eue2JzYpxhw=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM6PR11MB3020.namprd11.prod.outlook.com (2603:10b6:5:69::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Mon, 7 Mar 2022 10:09:11 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 10:09:10 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/6] ASoC: add DT bindings for Microchip PDMC
Thread-Topic: [PATCH 2/6] ASoC: add DT bindings for Microchip PDMC
Thread-Index: AQHYL/Q80blLxhzU8EasY6BR2ADNqayxWd2AgAJdAQA=
Date: Mon, 7 Mar 2022 10:09:10 +0000
Message-ID: <92ba07cb-ab42-41b9-d988-d4318a7de728@microchip.com>
References: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
 <20220304181756.1894561-3-codrin.ciubotariu@microchip.com>
 <9e6bfc9b-63d0-d4b3-90af-4bf06cdb27f2@canonical.com>
In-Reply-To: <9e6bfc9b-63d0-d4b3-90af-4bf06cdb27f2@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f60f039-7b22-40c9-a083-08da00228663
x-ms-traffictypediagnostic: DM6PR11MB3020:EE_
x-microsoft-antispam-prvs: <DM6PR11MB302012429D6C98DC8EDEE07FE7089@DM6PR11MB3020.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hzEYM6GvuqiR3Hd4iqsTvhlM42X0gSYA8YUL41Sh4CCOOWEK3QJaz7baTaDcblJE+Pr4DngSFMIVk1wzaMU6zfJZg0B4jQQudWn4ibq/DdlFIPzCFpD2O4129k/Nz39xAZs+++buvjVrTEiTI7gV+h8bsdNzVpGDCLW/jm2LDOOfKxTpu5FOI2jyqSt8cyOgdZ2LDFqnBfwR8v6B69XUVKrUQ94Uh2Gi0bTiXT25t+wHyg3knljSwK5uX88H5scZMlYNaUrDs+UfqpgADYjHyoJRKrynKcw24CBeffCi8I29r/lVBGrTtnGbgplIwY/vFpYH9kVPE2AQ5oHuqYRO2gvPMcLGmJEV/Esu8rZ0l1Fid6sOqALhJCAyxzNfiAbIjxLCpEnk0exqJs9C8ZKfKxYgWPKzeeHOg6dW8Fh6rEieypJtF5V/G21moQWEspZA6MCGKROTTGyiEQSdh83ReppxtdyNsGWZgWKW8jQReEVZ7aJItDDrh4dkJZpWPfzBXvFkMaQUmKOTfVxxDjHSSLGFzjo5KZR7nTYOpVX4cSRos/V75Q999SD4Imp4FLvAFYmkHrxYAV+aE2Y+PtgdMhueaGwKFTU5MjC4rT3IvW2xcNfZt6mFTlBNzZ92m633N4lfdqePPoRqP3jh+6VgBT+ac3cmhVvcVmnGHIEqLbFHnBjqBYIv2cfDE21HkfeNgU4rl3TWNv15uv0Wn4G0Qe/RDCaOS+DWNW7E+/3WeHrHxPPBPU4pF6BmVFaoUavPULadKzgran9Dj10YkyH6tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(110136005)(38070700005)(38100700002)(36756003)(54906003)(66556008)(66446008)(31686004)(316002)(71200400001)(2616005)(66946007)(4744005)(7416002)(5660300002)(86362001)(508600001)(6506007)(8936002)(53546011)(6512007)(186003)(26005)(107886003)(2906002)(66476007)(31696002)(64756008)(91956017)(4326008)(76116006)(8676002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjY3bnl2dDdUQVB4ZWVHVjI0SHNQekdOZTNTNjBwZjFiSGNnUW9FSEgrV2VU?=
 =?utf-8?B?a0lIZFQwcVpHOHBRYlpEZUVid1NRVFVRdE5DRzQ2akVINnlPN3k1MzIwT0tW?=
 =?utf-8?B?SnNrWGdvWUtlMTIySmNwU1NKeHBUZzdydGlTSDVxVkxRZUtOeUUxbVd2MDFO?=
 =?utf-8?B?SmNLeVZOdnIycmhYcVNmb25UQ0RFMitPeDBoaUFBTTB0WUZsMitMN25OWUZq?=
 =?utf-8?B?MFpwblV5WG96ZlZzQUJjV3Fjcm9QYUY0eEcrNDZZQWlva2FuTFU5YzRTUTlM?=
 =?utf-8?B?VFdxMXdZUkJlamxETjVkK2dyckk5UEt6THd6aTJmUnkwSE1jNSt6U0M5d2pB?=
 =?utf-8?B?L0lDTWhDYm9Cb3R5YVk2M21QVU5KVmxjblkyaWhrUW9HV2JIaCtpZ2ZmaEk0?=
 =?utf-8?B?TU1MbjZhMFUrUE8wTFlkNHdYUmIxN2twRFVEa0IrRnI2T21hckU3TC9oSzBD?=
 =?utf-8?B?bjVvN1kvOUFSRWk0REJVS2RoREI0b05hVzdLN2lvaEdMUVVsSTBUSmFKL2Jl?=
 =?utf-8?B?MjliUDhFVGh0YlRkM2wyZldUb0txdGZ0MlNvTnN0NDFRRUp4aUduM2MxS3Js?=
 =?utf-8?B?eUJFckR4TFY0MTBEWU9MNEhLeTFvZkFTZlNzM05tRHRHbWxsRFJ6SmRsWld5?=
 =?utf-8?B?TWh6Wk1USmZZTURPWCtsZjBxNlpjZEozTXRuR29xUlFudGJNWUUxREFyc1Rl?=
 =?utf-8?B?R3NIYXpkVGhiVVhOSmZsREQ3ZktxamlSWFptSm8rQisvNjBIQXZkRHpJT2xG?=
 =?utf-8?B?WGczUWF6LzJkVVYwQ00rYXcvcUgvL205WndOMGxJeVdQbTh6NU5HRmk5bExs?=
 =?utf-8?B?cStDdU5oQ1FkZzFIVlppeFAwTkVOYlJMczJaa3Vla3JuZkU0MDlyZ2JvVU1Y?=
 =?utf-8?B?M1o0ZWNYM0tZeVA4ZDZ1dmRQZDlOREZmdEx5TExTMnBmdnZpMEpOSkphVmVt?=
 =?utf-8?B?VHdKRmZucVVGRlZiVXpOR21iYURwMGM3RXkxNE9jY0FsZUZCSEd0WkhWck5p?=
 =?utf-8?B?T1lNeUNndjJGRjcwWmxGalB2VTErd3RUeGxGbm51WnkwZ3NXL3dCVnJya1Mr?=
 =?utf-8?B?ajlnQ3dEYTlNb0ppOUhPNjd5ZHdYZU5xR0FBZFc3YWdvUFBHWjVreS91YW5Z?=
 =?utf-8?B?dmNoOEc3dlRxSzFyRENZL2k3M0k3QXhydEVIa3hmYlc1ajdHRmNkQnA1ZlNQ?=
 =?utf-8?B?R21VSi9kRjNTcm93ZDFPV2Y1algvdSt1V04zdzFiVFVPLzc1UFd1dTVvanNr?=
 =?utf-8?B?aTNsK1FQUTljSWV3U1VqZkdHK0N0bFFVZXg4NTBFRGNJZzFlWUs0VzlXU3dr?=
 =?utf-8?B?QnVQL2Q5WXJrSURPSnFBWHpQTG9QTUg5MER2amVuTkRscFViM0NhNk44Y3ht?=
 =?utf-8?B?NGM2T2FsNldibFFsblJwdGVGMitMTko4SWtDZFBadEduK0hKOWVwR2lSZXZs?=
 =?utf-8?B?TUxhbGNsSVk3OVNpVVB6WW9Hbys4Qkh4MjVaenF4WlZyOU5iblMzRk1pRU4r?=
 =?utf-8?B?b3lrNzhEMWhubDdvK01pZGJrbkFyVk9xVHZhcDJyU1JBNFEzS0YwVklGdkVR?=
 =?utf-8?B?K2J0Wmt5UFpMSXRualhPRmZSQTlGeTBoZDF5NmRXcFVKVGtUeDROYXFSZTBH?=
 =?utf-8?B?MThxTVJwVFAxM05ZaUYxUHZjZVZJNG5uR1dHTFZEbnBRREF4TmtIL2FLcDZ5?=
 =?utf-8?B?OHRBQlZVMTRpRldQNjl4djlqemQ2Yzd1RW5ybDBkYnQraUZ4SGJlSGhSSVFi?=
 =?utf-8?B?dCthV3BkOHlyVzVFUk90VTZreGlrbUtsYnRDUWo4dzZtMU5rdUNIemdPNnVP?=
 =?utf-8?B?aWpZbTAyM0oxaTFRbUJ3K0p0RDhiMTFwTG90aXBwQkh1QWQ4eUp0Vk95a1R1?=
 =?utf-8?B?Q1NkSkpKUDZXTWRoT1Y2blNWWlE0NmFOVkRWVGRFQUtmek1UdFdWTzFoOWRs?=
 =?utf-8?B?TzJ4dHZ2SEh1dGxUNGJEdkZQUEdpTzVzSGlSR2FzMTgrTy9RUGF6MTR4MUZ5?=
 =?utf-8?B?dGF3cE9LYnQ3d1FMWm5aZkdSQ1JsKzN4UFBOWTVRazFHT0ZMSWRDelZyK2o2?=
 =?utf-8?B?OEZYa0ZUWndGOXFlTSt1TUFHZG9saUlKVUJmdHBlQjVxWjRBdkJxeXBoSXFE?=
 =?utf-8?B?YzlXUWxaekhoRlkvWWtWbzNDaXpqZkU3UE5xa0ZXcUVjUEtWYjBmMVNvQzNG?=
 =?utf-8?B?QUYzS2dRcG5WYjBDRmNKSEtNRElCMlN1eWFHOXVyMHZ1NjMvaXRYQU8vdHUy?=
 =?utf-8?B?UWhCMC91OHpRTzRBNkd4TTJSeUFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37203E75CF4DCF4BB05D22F3412B5037@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f60f039-7b22-40c9-a083-08da00228663
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 10:09:10.9117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9fWq3sq4epuNvhkfNK+1ygNNtePq502TD2t1T0548KvHbvl0iWKqZG8tWDPO248Mpr75sYWR7RcE/WeIEVbMJngKKA+UjL1Ov5Umvji+dew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3020
Cc: lars@metafoo.de, Nicolas.Ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

T24gMDYuMDMuMjAyMiAwMDowMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gDQo+IE9u
IDA0LzAzLzIwMjIgMTk6MTcsIENvZHJpbiBDaXVib3Rhcml1IHdyb3RlOg0KPj4gVGhpcyBwYXRj
aCBhZGRzIERUIGJpbmRpbmdzIGZvciB0aGUgbmV3IE1pY3JvY2hpcCBQRE1DIGVtYmVkZGVkIGlu
DQo+PiBzYW1hN2c1IFNvQ3MuDQoNCi4uLnNuaXAuLi4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
S3J6eXN6dG9mDQoNCkhpIEtyenlzenRvZiwNCg0KSSBqdXN0IHNlbnQgdjIgd2lsbCB3aXRoIChJ
IGhvcGUpIGFsbCB5b3UgY29tbWVudHMgYWRkcmVzc2VkLiBUaGFuayB5b3UgDQpmb3IgeW91ciBy
ZXZpZXdzIQ0KDQpCZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCg==
