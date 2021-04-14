Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D535F6EF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 16:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E229E1673;
	Wed, 14 Apr 2021 16:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E229E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618412396;
	bh=2GlAO67UNsjl4QiMJ3RuI4iduzp2TV+CC43/K4xw2C8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=huTbu8jVu4rR0IRTVrVmiMw/z77AlznP72P1nTxDL+yUs2k59jCuv/Dsonnlz1d70
	 UQH+1qA6xvxgwBh164mgfTYYmHKpzSSgh4zhJhHsCTWEqfSqI6/cmLb2R0Dtr6mSex
	 LrrXlr0fcZHcTQ+7BXDNPRhvkwKkO+/RwKWunNvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6232AF80128;
	Wed, 14 Apr 2021 16:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C65DFF80269; Wed, 14 Apr 2021 16:58:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43F2F800FF
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 16:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43F2F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="TH7udDG6"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="AQWazuZU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618412299; x=1649948299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2GlAO67UNsjl4QiMJ3RuI4iduzp2TV+CC43/K4xw2C8=;
 b=TH7udDG6hYhgpJ6luPQ2N9ZpCrL4qG2dcTgiSUWqvs1rApA9rGPsa1M6
 BJW2V2v275inx9Su2+dKxaBN664CzRRX8oVdbsE92x+2MtR6I7CyjSHWI
 8nI5Mfjq/YvDjRRDHD9wa58xhOPqIXFxnWt+N0jluWl5Eodh1dvtn+RHN
 zMN3oqxqKLfKvOHrMY/y/C3+xE3orb5rb+Zr1af7Q84KLjD3fG2UN1lJp
 XGT1U4INytWHzOTcU24SFhHRnZKHb74HE8zYD5CDyQR5IP0AHUNNc4ZY1
 hND23xzcWl4FqJ4ri0cLtV3YZvoGS34eM9gPIZ2iSW17CkJGvc0r7v+4M A==;
IronPort-SDR: +AdTmOzNP5of4pyThOpL+yqE+oiOQ4sULOQCYJHBDa4+XYafUsKjQ8ciRLGR+EdATINbHWJ2bJ
 d/4qAY5Xpbdm8md/UVNdCthrt8peeT1+0lgFz0PPjz5zgZvkrnu19pldW7u1gK7UeO6VbLTgOs
 3I0EyI1oiNUqhCAhjeypXrbESYv0dLSPTR4OjH3zX4hW5ou/c5kmYMTRKTukKs78wxJV99x4v1
 Z2Ey3q+n8KElTU0KgjOEJSpi6UQ7MRVFINg5PBszyJ/YCbQ5ijUqWq4reSIfPyeE45JOuTyKnU
 Sus=
X-IronPort-AV: E=Sophos;i="5.82,222,1613458800"; d="scan'208";a="113560318"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2021 07:58:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 14 Apr 2021 07:58:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 14 Apr 2021 07:58:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzYoVIZ+qoyQv/vv6JuqeFJW0DZrHuxN9gpklNqs1yuJwFMs4/MjcI63WinVazWubgycz7nmrfTx9TKLQ6wDmCw2nY/nKUT9qIergH8SanMZCqSoibqI2VSykLO/GLp+3xUzfnl/JbBKMAW0viy2oqC2cybyCPyh8VaYWvr+GuGNZZKzovQyM/NOTS3lBY1XFFyR+TafEstW+hsNSmLpIBdQyFZHESYRANBlx6ks82UF7uTlR0zVEKhn7CLqmdkpEgectozwEVndSpG62NTGrVyKIQbWrGq42rwrrSl/fRt2L99u9WY/CPV783ZJi9/dNCOp2rT4HJukKSLDK/tiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GlAO67UNsjl4QiMJ3RuI4iduzp2TV+CC43/K4xw2C8=;
 b=TYXauoViUebP/grKYhH0T6fIDKzZQL0c5qKVh9m0lFVmyzcBqwiq2aIdG0N+luDN09cuNADNDNAEgYQx4K2pxlYjmB0oyoby9UhM8WV0EGMMcGfO7To6xr/iE9wu48JIzmZXa50Pj7E4hbyLeUdyqqMMXF2zsdw7noemreplFagN9u2D03ppRJSjvkPq5kUcnKmamRw6Gg4yZzPZxFXnLQG+9QbCAaXT0G9BUOAR3S4E1zfPnd1BPfUcW10YpsWIjmtH5I65iFFDwG8VZpnnkQ9zCFQmve8ORoVxleypbfEfinRkzRAX/1bwj8il2bzz0qshlOvuuz/wpQXuXhBZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GlAO67UNsjl4QiMJ3RuI4iduzp2TV+CC43/K4xw2C8=;
 b=AQWazuZU+K0c+zGakZEWBM2VZplga//EkZRbEQrkU3VOOnBwPSkXRXswLaAPmbW4U5AVT4X5kgKgdB4kGxHyMNTceYamgBK4CLzg9VONSju77k0PbWKlK5vG2v3ZIKV4+YpyiNBtc6iIrBo96q15bYJTQvfGfdXzVKgb+3R06Jw=
Received: from BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 14:58:10 +0000
Received: from BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0]) by BYAPR11MB3254.namprd11.prod.outlook.com
 ([fe80::6c10:a3fe:3cd1:54c0%4]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 14:58:10 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Topic: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Thread-Index: AQHXH9nLKm9Vc1LsR0iPwMHUtMwvV6qRfMkAgAAiRQCAIp5ogA==
Date: Wed, 14 Apr 2021 14:58:10 +0000
Message-ID: <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
In-Reply-To: <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [2a02:2f0f:910b:600:d5a1:afd1:5bc9:56fd]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5525ac6-49b6-4072-ab03-08d8ff55b8a3
x-ms-traffictypediagnostic: BY5PR11MB4008:
x-microsoft-antispam-prvs: <BY5PR11MB4008BFA563F2FFC19AEDB577E74E9@BY5PR11MB4008.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8NbVjd+fqZA3cCcp0OkZBoOQ9tbJqsCcfof6lytQ1uzUbCqY6t7BejwlQ1PtMltViZrmj3qu2AIyfXBU2eR6LbNh/6amMpU3Y8ynOz/QUNGc5s1CkHszpBhZM+nE3Kz1HpwuejS1bkniTbz7BrlUnq6iBrAujKQTIyb2awP8SiwSRbAG6O994ODS1HF76xKRjI1/b3od+u8/AjyMhnktfELIgKhDF4ZStW/LY8gO2D1hq556aJ/kFInwobMXc6pqsEYdk7nkSwTvKb3E6NLxH6Ps14WcJjHnhfrPdMzYbvO2EweyUnNXMIQx0sADUuhRe2smQqlQykcQEF3v3fpqSJFAz2Mc5fyfQjQGZhlXqR8z2zxJbFHzrRSP/Lk3WpQoGjaN1cuKWXww7Tl/7o00+N0kDyOtp9mqT2F2oGEmB28iRpElzsWTBBDSLWPbixBaHgCB8It/9eXk+bmdSVzZSb+GB+UEd2Ne73PyBOEE/u0citZJOcmgR+PmbwgG8zBgo8iJuBwN5EZWhEixhbkW7/yIeSkSX98+qEupbR4qfKn4e1sOCjvOMvsMEOPWa/4ebD+Ad7WD0CSeSnhYH2JMOPIdYsYVM6mHysdnqjJnm7k9a7Us+q7MwZEd+2APu4zFw3V0KtEN9+oMLnR8gNJqPA44iI+CmX72I6AsxerXmgKURfF7NNmNx2h/sPN5z0G2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(5660300002)(6486002)(6506007)(186003)(71200400001)(122000001)(38100700002)(83380400001)(31686004)(2906002)(6512007)(86362001)(478600001)(64756008)(66556008)(2616005)(66446008)(66476007)(8936002)(66946007)(8676002)(316002)(4326008)(91956017)(76116006)(36756003)(54906003)(53546011)(110136005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QVR1TklGMVNYVzVSR3VzeUFJR0pBOFJDWEg4WHUvaUU5d0M2M29EejczbC9w?=
 =?utf-8?B?Rm9rZTlVSlJod2NEMjVSMXFXaHhjTmwzY0QyaUZtcmx2ZDJreit0eTFISm1S?=
 =?utf-8?B?eUFvUEJUZ0RxeE1sNmNPa1dLMEQwMlVLdE1lUTNiajNyamVzS3U3NFZlUTEz?=
 =?utf-8?B?eGk4OFdYOVQyNTJvUjhPUW1hRHdULzhNdVRWMXJVN1c4SGxHUlM3eCtDemxq?=
 =?utf-8?B?bUFUSkZVRmdmVTdVZE9UYnZMd0pzZ1JGS2tHVEh5RjIwbEoyTFB2ZDFPa2Fo?=
 =?utf-8?B?Nm8reTRQWDkxZVZBVjIzVExMeVZnY0RBSWNUdldPcTBLZWg5ZVNZT0tzNWw3?=
 =?utf-8?B?T3pRR21OcG91b214OFhyeWEza3Z4NmdCSnc4M1VDT1VXOTNleFBxeGhwOVpr?=
 =?utf-8?B?UHByckRGV0Q2TXZtcDJUdUcweGsvUXF6TTBjbnNYVmZiMmh6N0ZnVWg0TzE2?=
 =?utf-8?B?WHJLTzFXNnd2a29qblYxUmxTSnVtbVhTU2MrbkpCQjAzWndZbHdlZmc2dFQ4?=
 =?utf-8?B?M2pVWGxBUE9OTlV3cldhc3UwaG9Gb0J2VFpGVUZZUmpHUjcxQWIvNUQwUzdV?=
 =?utf-8?B?cDVzdEo0djRpT3hXWTFQVlhQMVFIMHVucitNMHRhYW9wYis5SFp3cERTL2Yz?=
 =?utf-8?B?V0NaQ0hRWnpaMjQvWWlIUWhrczdrbXA1cXFqbE42RlV1a3R5U3ptVVlmQS8z?=
 =?utf-8?B?YWMrVXk1ZUhjb3I5UjVQTGdTNmtxWmtIeHhlTTR5NjFVN3Uvamc2LytPT3Vs?=
 =?utf-8?B?eU01VlVwM2JuZkZ3TTIyTUlhOURXckFrbnpvRWNXZzBSMjNxenVQK3dyZDMx?=
 =?utf-8?B?Ulh4TWlaN1FpaEJSc3JnaWpkeG9VbHg0bXBNZGUxQVJDS0lXblFpZVlSdWU1?=
 =?utf-8?B?TVFjS0JRTFBvQnV5Vmw2eGd5djZVZnNaQ3JWR1BpckQ5N21pUWNJcU50d0VL?=
 =?utf-8?B?SXRYSlNqT0tnSEZvd0lva0FRZkVRSUxRbTY4VFlnTndtVW8wcVNMNzNKNWZp?=
 =?utf-8?B?UytOelltRUtEMmtZRGhWaEU2QytmeGJQY2U5OXM2YnBCMzliNHEvOXUzOFNO?=
 =?utf-8?B?K0dRdnU1Y0t6czhxVmMzRTJna0ZRTnc1SUx2OFIrZHhubXFsdE5zMmcyQ1dT?=
 =?utf-8?B?RFpTZVJFcWRTNi9pKzE3STluQ0J1cXdIQlFQdkFCd24xcWFDU1VpY0dXditt?=
 =?utf-8?B?anV3N3VicDBjUEpsQjhVRzNVTFM1bkdoQkZWME90Q01JWC8rZS9kbG1rbktt?=
 =?utf-8?B?dTROR1ZIM3c0QnlralR4Y3VkNGJEN3pxV0pYTlhZWitNMzk4WHZyS3M2S2ty?=
 =?utf-8?B?QTg3VVN3bEhIcjZ0ZGxjSW5UYVpqRVo2eXJ3clU3WXJQSGpXellxSDh5TWFT?=
 =?utf-8?B?ZVhwNDI1VXNrcjVOSzJ5WDlHd0I4bmxZclByemVCWGxOOHhLa3NsNEw3OVdM?=
 =?utf-8?B?WUFaeU95SFU4cnRxWWlKZVljZHZOOVZENVR2WVdvekRrNHI2aHlCUG94dWVC?=
 =?utf-8?B?WDdiNS9kTkxUOEJSUWdnNkJtS3R5MnF1a1U1elFyUDRSUzFKandZamt4bjA4?=
 =?utf-8?B?MlRRN0M1Ni9pYmRleXBZSWtObXZmUkMwVjE3K1hGaERrZXBpc2p5LzZiMzRo?=
 =?utf-8?B?dnpwellzKzVsdFlVQVkxZzNnWG50eG9WMjg3RHZqRjVqNElQNWhWU0VIbTlU?=
 =?utf-8?B?T1J0d2Q3THFxYXBYdjdtOW15cmhtd3ArQUFpMG9qeVF6aDhqL1NyQldmNkQw?=
 =?utf-8?B?N1dJc1BudklZcE9DN2ZZUmlhK09aTGk4clJydVVqTlZnaUkyUUNRUS90WVNX?=
 =?utf-8?Q?KmacI7Z9LDHzuRTlHZ63RJZjWxz1le2bkKSKo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF7E4F005594324BA057A664600E58AC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5525ac6-49b6-4072-ab03-08d8ff55b8a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 14:58:10.7272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gJdDeHvzHYABvl0Xka8tHxeJmDu0Daq5o3rm8pvzSewn3cbor5Bo/kbv6Rta80nJKh1BUmgQsz7XBkDCliXMtBJk0+BP+YkON4lLWiA7ZBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
Cc: lgirdwood@gmail.com, tiwai@suse.com, broonie@kernel.org,
 gustavoars@kernel.org, mirq-linux@rere.qmqm.pl
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

T24gMjMuMDMuMjAyMSAxNjoxOCwgQ29kcmluLkNpdWJvdGFyaXVAbWljcm9jaGlwLmNvbSB3cm90
ZToNCj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAyMy4wMy4y
MDIxIDE0OjE1LCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6DQo+PiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUNCj4+DQo+PiBEbmUgMjMuIDAzLiAyMSB2IDEyOjQzIENvZHJpbiBDaXVi
b3Rhcml1IG5hcHNhbChhKToNCj4+DQo+Pj4gVG8gYWNoaWV2ZSB0aGlzLCB0aGUgZmlyc3QgdGhp
bmcgbmVlZGVkIGlzIHRvIGRldGVjdCB3aGV0aGVyIGEgSFcNCj4+PiBjb25zdHJhaW50IHJ1bGUg
aXMgZW5mb3JjZWQgYnkgYSBGRSBvciBhIEJFIERBSS4gVGhpcyBtZWFucyB0aGF0DQo+Pj4gc25k
X3BjbV9od19ydWxlX2FkZCgpIG5lZWRzIHRvIGJlIGFibGUgdG8gZGlmZmVyZW50aWF0ZSBiZXR3
ZWVuIHRoZSB0d28NCj4+PiB0eXBlIG9mIERBSXMuIEZvciB0aGlzLCB0aGUgcnVudGltZSBwb2lu
dGVyIHRvIHN0cnVjdCBzbmRfcGNtX3J1bnRpbWUgaXMNCj4+PiByZXBsYWNlZCB3aXRoIGEgcG9p
bnRlciB0byBzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0sIHRvIGJlIGFibGUgdG8gcmVhY2gNCj4+
PiBzdWJzdHJlYW0tPnBjbS0+aW50ZXJuYWwgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIEZFIGFu
ZCBCRSBEQUlzLg0KPj4NCj4+IFRoaW5rIGFib3V0IG90aGVyIG5vdC1zby1pbnZhc2l2ZSBzb2x1
dGlvbi4gV2hhdCBhYm91dCB0byB1c2UNCj4+ICdydW50aW1lLT5wcml2YXRlX2RhdGEnIChzdHJ1
Y3Qgc25kX3NvY19wY21fcnVudGltZSAqKSB0byBkZXRlcm1pbmUgRkUgLyBCRT8NCj4+DQo+IA0K
PiBJIHRoaW5rIHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICogaXMgcGxhY2VkIGluDQo+IHN1
YnN0cmVhbS0+cHJpdmF0ZV9kYXRhLCB3aGlsZSBydW50aW1lLT5wcml2YXRlX2RhdGEgaXMgdXNl
ZCBtb3JlIGJ5IHRoZQ0KPiBwbGF0Zm9ybSBkcml2ZXJzLiBydW50aW1lLT50cmlnZ2VyX21hc3Rl
ciBjb3VsZCBiZSBhbiBpZGVhLCBidXQgaXQgbG9va3MNCj4gbGlrZSBpdCdzIGluaXRpYWxpemVk
IGp1c3QgYmVmb3JlIHRoZSB0cmlnZ2VyIGNhbGxiYWNrIGlzIGNhbGxlZCwgd2F5DQo+IGFmdGVy
IHRoZSBjb25zdHJhaW50IHJ1bGVzIGFyZSBhZGRlZCBhbmQgSSBhbSBub3Qgc3VyZSBpdCBjYW4g
YmUNCj4gaW5pdGlhbGl6ZWQgZWFybGllci4uLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBDb2Ry
aW4NCj4gDQoNCkhvdyBhYm91dCB1c2luZyBhIGRpZmZlcmVudCBBUEkgZm9yIEFTb0Mgb25seSwg
c2luY2UgdGhhdCdzIHRoZSBwbGFjZSBvZiANCkRQQ00uIE9ubHkgZHJpdmVycyB0aGF0IGRvIG5v
dCBpbnZvbHZlIERTUHMgd291bGQgaGF2ZSB0byB0byBiZSBjaGFuZ2VkIA0KdG8gY2FsbCB0aGUg
bmV3IHNuZF9wY21faHdfcnVsZV9hZGQoKSB2YXJpYW50Lg0KQW5vdGhlciBzb2x1dGlvbiB3b3Vs
ZCBiZSB0byBoYXZlIGEgZGlmZmVyZW50IHNuZF9zb2NfcGNtX3J1bnRpbWUgZm9yIEJFIA0KaW50
ZXJmYWNlcyAod2l0aCBhIG5ldyBod19jb25zdHJhaW50cyBtZW1iZXIgb2YgY291cnNlKS4gV2hh
dCBkbyB5b3UgdGhpbms/DQoNClRoYW5rcyENCkNvZHJpbg0K
