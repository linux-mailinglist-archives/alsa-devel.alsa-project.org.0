Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6642C4D0062
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 14:47:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE01E16F8;
	Mon,  7 Mar 2022 14:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE01E16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646660842;
	bh=/Q0vuBB691Vma08yqS6omjZ6pYs7AnBPTMS7e68uArg=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MeGtu/DwQOg+Uyu4AewtylvQ0vjGZebd8Eislcge/WwISKlQAkzZfLC5kSVBkYAJJ
	 be66GIlD8QxarGarONnCNPue47V3C7RTt4pxVFU5DZ9LWycA1tFVuR86HeAXjtNnO9
	 G6GCWKx4BBo2FUSIet1HryZ2JH/qZq4JrtnVpesU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 407BCF80159;
	Mon,  7 Mar 2022 14:46:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83BC4F80132; Mon,  7 Mar 2022 14:46:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7D08F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 14:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7D08F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="fV++qHl6"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="SIPRPonk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646660766; x=1678196766;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/Q0vuBB691Vma08yqS6omjZ6pYs7AnBPTMS7e68uArg=;
 b=fV++qHl6HY3MBKhT48eCrGDwHqObppUaZeJ3uuuTlgzH36ZxsKLGfRHZ
 PWtc13nMWopd6COpb5+ID1T+dwk3l+J4e830NiiNu/oOoeICjtC/tvwUk
 1yuwk1NT6kwZllGWbvtci7bqX42iD2wyTLkOuyKBVYPKqAyCZvKwMeKt6
 Bqs/flrWPS0RzwgkJG9ER1BX/0vUSNl5vtXN7e/rEFSikHX7XhdpXpEZ8
 HCIY2awo8+cXXMEZ9R6YSMo5xopAeHFi8cJ9r+qu8Upz3M6ltFJpiEsK3
 YzLK8pYS+Q63xG3aHBkuWuY3B6o7ULbgBmbGPlQFwd9kAU5Cfqru0mMEu Q==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; d="scan'208";a="151097736"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 06:46:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 06:46:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 7 Mar 2022 06:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtgW3+tKqkB4j3/MuW+JSa4nxzwHiwQpJoNS2k4KRUODTvoshstGA6PAR99hf8DBTULdqdwhZ6FbK7I+eFbXT4jue0hLOfCmpanTk1vtNr1uo47OBimdcKAOZGFmA91JbUHMZ39GGkRQt2XmQaT2nFGqOgv0fbUWOUiNcyrfo/ALijnS9FxpsIJ9YYwl1ZWkfs9WxtTE0JFeGKg3z3/P06eRkEhwXHPSYqA+OW7ToQZiwaOJYQ4aNPdBTMk8koOlmviWefsPDSi5IOCXc1pFtvC55+ca6dEz/LE522YubPjW8tKp/V1wvDpm2tX5jSLoRYOU2tkAPh1zBPRumVJYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Q0vuBB691Vma08yqS6omjZ6pYs7AnBPTMS7e68uArg=;
 b=hTccLOMFIIbR1/IlvG1tFSwvcuMcqF8aj2CimRqXduoCmiFizR3nm3ug/jB3s1T9mJYhb/iuAJfLubcNaDrij12A+0ELY+vs0gOVpwl4xqUnVYNw2fYU/LxadolPrJgk5xBUb5one97ZA+HB0tgmPgjhseMB6vKEIxEd1nCgmZyddK/NjAJXn5/zKKDYF53bYeQpQ5OLA0YiFuE5ZG/fe7XjLMKMcHxqJ6xD0DqsSz8trya+oPn2ijkVnG2UlB9pVMZrS/y35CAsoj6F+2f5sAgMQ8TvwHP8Oriiuw6gSQ0gU/18y9rQBzA+VaVXOTDbVfAWVoVvWLhLEJsqlj2AfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Q0vuBB691Vma08yqS6omjZ6pYs7AnBPTMS7e68uArg=;
 b=SIPRPonkppxOXGIPsQRt9i6vOKaddyNQiUnLgHJp5JN62lCnAlqopQMTDNnsLw07h7U7Q/VMkUqetoVOUPXzc2fYaRMVP8LAR8ub70n2xk8x5N8BSfV3rONi2PZWttgCBu7kZIOjYPa6+Ra4ju2p25scDtWe2Fa1ZXv1x55T5oM=
Received: from DM8PR11MB5687.namprd11.prod.outlook.com (2603:10b6:8:22::7) by
 DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Mon, 7 Mar 2022 13:45:48 +0000
Received: from DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f]) by DM8PR11MB5687.namprd11.prod.outlook.com
 ([fe80::fc32:96a4:933f:194f%4]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 13:45:48 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <linmq006@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <Claudiu.Beznea@microchip.com>,
 <florian.meier@koalo.de>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: atmel: Fix error handling in snd_proto_probe
Thread-Topic: [PATCH] ASoC: atmel: Fix error handling in snd_proto_probe
Thread-Index: AQHYMiP4bPe/zaBAxUSeZ+WVHeCX7ayz7wUA
Date: Mon, 7 Mar 2022 13:45:48 +0000
Message-ID: <582c39ac-3099-d54f-5de3-d54a4ace0a04@microchip.com>
References: <20220307130415.5720-1-linmq006@gmail.com>
In-Reply-To: <20220307130415.5720-1-linmq006@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a420c58-bd6a-430b-272d-08da0040c99b
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_
x-microsoft-antispam-prvs: <DM8PR11MB5592A43B030E9EE5E4CD8270E7089@DM8PR11MB5592.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KmNgpxRX8zu8uogsVC/rDiKWavlhpbu557tRjQUiy6RCsbtTeq52IQnvRUG9G38GjEsB6hrmefTiaJi0mRQmaXwY3+UDUkgrCH5R3/soXBEf5Tc2lfjyGpuFYg0234ULvX/5y6OKMcDYDhqqpuQfH2E82KBtHHuWVc07BjeXBkVUrjCY47mE4IOytlNk8ROb8j8ha8NsI8qoW4oD7x7UxRByvXYy09BS637S3CQkoTdgol/TqIlg0ByYjMZh8+xgMs65QlybnsRaRtWBa7siYdCck2PaKmqLI78EBKgcDJvCRkNHll6q9d1IJtnE71oS7jaZiD4OYCRIhrwGITD/ng7lSRdtQ3avMAzw5L8Cwb/BIX2pdfe0cFeh0OuW9PLOZTTDWg96QQ8OjVviYZIRPpj6AxLE0cuXyU7rhhvv211lXV78z56D9RAPPCQ7T59cqIg2nG6xMonFNtbrKkHuo0T4fDXk7XLZrHRF+hCFqWTtY14kSf2sf49IdO3va9/l3EYgfc/mSOSc8Jzqy2aFu2/jAAZ6s40QCcNLw/GT5gbqowmXtlhkJD9eec2Z8E7zZUbPDSkc+BcIXHe/+PFelCWliSGrnqd40cFEgP381vuj1Ev71tGHY8PHW7Oi8hdXRdRgzRgNWzOqF9GJqbobq6nEeNtPZ+igG9Yp/JTTFBFHlSrnaHYcsnb0rxntW5NJHYzu2KWPgHxQjvzxgTWSoorwFG+u9hszRmrfUSaNMLdxnogI5XW8ep6oX+tcedc+e4g0goTcuYdWNL2p+/PAtKxdk81e0bbKR6YcqC/6cL4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5687.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6506007)(186003)(26005)(6512007)(38100700002)(2906002)(36756003)(31686004)(4744005)(7416002)(2616005)(122000001)(921005)(8936002)(110136005)(76116006)(5660300002)(66446008)(64756008)(38070700005)(31696002)(86362001)(91956017)(508600001)(71200400001)(8676002)(66556008)(66946007)(66476007)(83380400001)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlNVRTZsTUYxcG9xSTYybExNeDVnejlpWUlJeTBuVEZabWhmZVBsbnZ6b1R3?=
 =?utf-8?B?VzFMU3MxSk92OGxMbzJqY0c3WldwcitHVS8zR256dHpYdUFNbkJvb2VnRE9T?=
 =?utf-8?B?TWliYmdwUDBmK2VlRmVIYUNWbGdlNzVxd3dtT2dvbEVCSkJrbWtNUTVnTGJx?=
 =?utf-8?B?OW95ZW16cFkwYTZIWW9udnNSdXE4WVhuR3pZcHFiK0trTFFoNnZiWlB2QWtB?=
 =?utf-8?B?SGdVR3ViYitWcXFDN0dWZFVhYnhiTTY1YVpGeHZtOUtHcDg3TTlJc2xJNkxy?=
 =?utf-8?B?MWJuWlhmK0xjY2M5YlZlM3hZVGUxMllUTktkQXp4MWRnY28ybzQ4TEpkR1hi?=
 =?utf-8?B?WXhqMElLM29LK3FyNUMyT1JLTmpSTHZhWW1yYlpETUpBbWZSaldiby96bnhX?=
 =?utf-8?B?Y09qRXE0Ly95d255bVlKNFN0WjhIdVdvbjFsQXZRQ3VQRDVVRVN4RmZYQnlK?=
 =?utf-8?B?dXdsb0FEWXgwcUIxM2FnbGE1SUFhNHJMUDMxMmZYZ1BRYnlrQzl5eTdIRVpT?=
 =?utf-8?B?MDg5U1p1QXNLdVdZK0M1cVZxb2NzbW5FY1NSSktMNzlqZHpUY2lORGJycGxv?=
 =?utf-8?B?Ky9HNTUvT1M0UHBjc0ZMRkw5Z3JBL3Z5S2dxSEZMQzFUV1MwdmJIMlp5WWZD?=
 =?utf-8?B?UkF1VTIrc1F2SXltNm1TOGQ0M1dPOGZBQThJT1JVa1krRWFEMTdYT3NSSEdn?=
 =?utf-8?B?NWpVcHkvejVMYkpjNThsTlc1bFcxc25KWWR6WmlZT1E5NWRVRUd1R05wcFZz?=
 =?utf-8?B?ZFhHVkpJaGVuQjVlR3FwcFVkei9kUThCdVRYWHF4VUxEa3M4UGNMc3dsdWho?=
 =?utf-8?B?alVBeHcyeEx2LzJWZ1dsb1o0QUVVZEJwSlBKemZYanR6QzBoZ1lMMFgwZUlG?=
 =?utf-8?B?SkJsN1pNZ05GcEl1ckVqNEJwdjZBZTBzdGJ2ajBPdStiZFFCS3V2NkhndXUz?=
 =?utf-8?B?VHlqbVp4dURtR3VMamFQMzlhcVc1WmFVL0RrWWNwVEhuNEsrZmRsWGdSOGdQ?=
 =?utf-8?B?SzNFeHBKL05vZGtmbXpTcU92NGpRMGJrWFMxRm1tY1FWeTJGK3BHR3c2aVZq?=
 =?utf-8?B?K09iamROeGNaUlczblFvU1U1eWQ1WEpUQzlpeUY2aElYT1NEL0UzR3BsVTNP?=
 =?utf-8?B?MWkvR2t3SXhxWWwxcUlteFBRdEt6NGlqWXllMDRENm9LNW5VZHlkZHl6Ni9z?=
 =?utf-8?B?THBJcGs4djZ3WmdMajFYaTV2eGZic1orWFg0T1FHQTJPcjVPT0lkV1VuQm9i?=
 =?utf-8?B?MlZ0ZzNyY2ZsWmRONWVVbDVJL2pQRW1FeTdJS0lVY3BkbmN1UG1UbUJUUWpB?=
 =?utf-8?B?aWRQWDFDcE9LeEgrNzRrNnNxNVI4S3ZrSVBLc2NRdDdhUlEyQjg4VStTNzQx?=
 =?utf-8?B?dVZWSDkvYWJ0Tk5hUlYyT2pQYlNPZ1RCZDZmcEhibVdMTUdsNm1XblZzTU0r?=
 =?utf-8?B?MHRqdFVrTjFINHVtcHByYys3RXptWlEvaHNGYXA4Q2NJVlltM2JEYWZCYlZS?=
 =?utf-8?B?ZGs3eUJXUnBtMCs3OWhZSVBkV3plT3Rhd2wybEdkWmVQdXgwMTRqcmFGK0Vj?=
 =?utf-8?B?b1BGTWNINWY1TGtRTjhpT3phYXh4dTJIajQwQWFxem5FbENyNnQ1eVJCSkUy?=
 =?utf-8?B?U21IcW1iNlZ4U3dqMThOaTQ4VjFRenoxQTJWeEw1V3hUQTdoazNlbHNZcGY2?=
 =?utf-8?B?SjVBVnJNdmdRdHRiNTN2ZHJ6Wi9GYm9EQmd5Q0NlekhsZHBwSnd6U0FHV3N1?=
 =?utf-8?B?WHFSR3VxWTd3a1BIWXJGT0t3UmNTV0d5cmlkd0lSL0c2c24wRTZlWFlnQjlr?=
 =?utf-8?B?OHFRaGpnK0ozM3VYNWNPckZjRlpzS1J6SVJ4VFJYUE1QQXVMUUNsVFRpL1Ni?=
 =?utf-8?B?am1lbDRKV0RyTHJ0VnQvbFpiay9MOVJ0U0lNOXEvWU9aS2JIR0RGWWpzVzE1?=
 =?utf-8?B?MGt0aVlINldWUmR1Y0xTSWl4NFdxMENnTmJkZ3Z3MFRJSk1aOWZIS2U2bkxq?=
 =?utf-8?B?MXprS3Z1L3c2L2JPcjBPNnFwbHZxWnFpdnMwd21WQjBOK2VENlVScHpQbHNF?=
 =?utf-8?B?N0h1dy9mSTloRGVxSXh6aDZsaHFoVVJZdFFjRWFMa1RuS2swclIzWGRaVXdZ?=
 =?utf-8?B?M2xVNThzdDg2cEFYOG9MZVV3V2ZrZ2NIaGw3MHVBUHNXWWZUQ3REWXVqam15?=
 =?utf-8?B?SXZqYVNiKzdYdXhQdnRBYTFWMkw1aVpIcVJ1SXBmNTJSSzVCRnIyNXljZlJu?=
 =?utf-8?B?Q2t4bnBhNHA5TnNCTStOMHN2Z3V3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBE0439F7867B94F8511AC397E3CA974@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a420c58-bd6a-430b-272d-08da0040c99b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 13:45:48.6017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q450nlBtT4Z0Y9npGGXqQkFRKfPUavqbW873RpInXXpxK/FxVe6vqK5L2lns5FrA8f2bJn+zoVXtoQPnJKA7WJL2UfrEb2c33MrEmfwOHCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5592
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

T24gMDcuMDMuMjAyMiAxNTowNCwgTWlhb3FpYW4gTGluIHdyb3RlOg0KPiBAQCAtMTM2LDE4ICsx
MzgsMjEgQEAgc3RhdGljIGludCBzbmRfcHJvdG9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gICAgICAgICAgICAgICAgICBkYWlfZm10IHw9IHNuZF9zb2NfZGFpZm10X3Bh
cnNlX2Nsb2NrX3Byb3ZpZGVyX2FzX2ZsYWcobnAsIE5VTEwpOw0KPiAgICAgICAgICB9DQo+IA0K
PiAtICAgICAgIG9mX25vZGVfcHV0KGJpdGNsa21hc3Rlcik7DQo+IC0gICAgICAgb2Zfbm9kZV9w
dXQoZnJhbWVtYXN0ZXIpOw0KPiAtICAgICAgIGRhaS0+ZGFpX2ZtdCA9IGRhaV9mbXQ7DQo+IA0K
PiAtICAgICAgIG9mX25vZGVfcHV0KGNvZGVjX25wKTsNCj4gLSAgICAgICBvZl9ub2RlX3B1dChj
cHVfbnApOw0KPiArICAgICAgIGRhaS0+ZGFpX2ZtdCA9IGRhaV9mbXQ7DQoNCmxvb2tzIGxpa2Ug
dGhlcmUgaXMgYW4gZXh0cmEgbGluZSB0aGF0IHJlbWFpbnMgaGVyZQ0KDQpXaXRoIHRoaXMgYWRk
cmVzc2VkLCB5b3UgY2FuIGFkZDoNCg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxj
b2RyaW4uY2l1Ym90YXJpdUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3MhDQo=
