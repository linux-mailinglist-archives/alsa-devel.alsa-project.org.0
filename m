Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB623C2806
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 19:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1501654;
	Fri,  9 Jul 2021 19:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1501654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625850449;
	bh=BRwVmuFXvPImgDabh+bGejwFeV0wKHbd8nihVefnoTA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FV8FDvxyF31xJtmoXbcA0Rac/XIWr93A3cV92MJoMKp+RC8sIMbRZiFW6t/HeeBlv
	 SlCH+yXP9GtDD3dr1yZI0cbQA6DPkGtV9gPKPLxaON8aAFLQ1T/OLo3R8feGHZA1fw
	 XCTKaCwOt4VwZ8LjLdUxYKl4cqGQ3eoaKqD2GgdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28041F8012A;
	Fri,  9 Jul 2021 19:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB588F80224; Fri,  9 Jul 2021 19:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_18,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com
 [67.231.150.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96403F80107
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 19:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96403F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="pRur+NIn"
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 169BDBxL014653; 
 Fri, 9 Jul 2021 13:05:49 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2055.outbound.protection.outlook.com [104.47.60.55])
 by mx0c-0054df01.pphosted.com with ESMTP id 39pej389dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 13:05:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsLXQh1Q4m2upC7Z6j2+VuZy+2iPuVyXX3yCyyO7ZYpA+mEKTe/kenbjXCXn3aRPmpBfQL757Y2aBl3vzvAvUv5MD4wKCq+3zA08An2gVB5mmHzcHfcDv6OV4E//TF1TLhl7TTxMQnm2AJALfn1xeyysFAhb28P33KhONnUmNznAYD3IrYbEmYYiypn3KilRbuzNjh28qh2Pb6L0JSy4FM2a5mjbuZHAlLEDH7hRqvrBwQ+j41urXq5xkFTsHQo0798vVCOqyVIQQqUwmgBnTuLiSON0L2Hk3n/GDGFscqBzK7jmFhlXXcFF67+mVBw/ZeBwe4DenN+KmkLPqjRXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRwVmuFXvPImgDabh+bGejwFeV0wKHbd8nihVefnoTA=;
 b=XcIFvymMuKVceTwqn0wzcwKRotTmEHxI7wR4fEuGamOjD7em1YMiTDPcicYUeBEwMe+K8CQ2eQP53FbgyU6bJFZwROowuTQX1BmssfwA91Cub+Ou4zVxWzKkhg9kfFBMqg9hKIM3ct71eL71gF/QaK+fhcRe87SXHG8xVJhnpKasyNErDAqC0GV7iaeff5/LR/K8U4hTmQWKDczRJGhuIqOLOJTyQYFFD+HB4naCJkeCDeORjM4IbYGMd3wRYnjNa9+YNW40ajb3Bg+XNtoaJHFD5UUFJBdrzFQtsckQcGspmvr+mafMy8uU7WPnoHUbZA5ZQENGugf8jeT/tsh/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRwVmuFXvPImgDabh+bGejwFeV0wKHbd8nihVefnoTA=;
 b=pRur+NIn9/7lQYtzlpoqAzrZkRabAtDeOU4wua1Yq2YUaUQgkeBQAreMGhCnm/hwCmcO/1TazIK521fGQ39ncPPHQ+xU6uQL99t3NrAY5dGLrfmFTxD+KqA9krL26seXU8/ZyHD0NZDHaIrLF8nzDi8pMZYbRmD2zQvYN5T/C0g=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by YQXPR0101MB1525.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:24::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Fri, 9 Jul
 2021 17:05:48 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%6]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 17:05:48 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Topic: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Index: AQHXcsWHzh5VPmqBUEq1W5dwLNaiPKs2tqGAgAFyjACAAAU+gIABWLsAgABTeYCAAL6XAIAASpGA
Date: Fri, 9 Jul 2021 17:05:47 +0000
Message-ID: <129f46987f79328edba109a800b522c6ddfec99e.camel@calian.com>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
 <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
 <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
 <2cccca32d53e1d832df67d070bac9ca998a931c6.camel@calian.com>
 <87bl7cl20y.wl-kuninori.morimoto.gx@renesas.com>
 <20210709123854.GA4112@sirena.org.uk>
In-Reply-To: <20210709123854.GA4112@sirena.org.uk>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ee73a69-81f0-4986-4092-08d942fbcc53
x-ms-traffictypediagnostic: YQXPR0101MB1525:
x-microsoft-antispam-prvs: <YQXPR0101MB1525093416E1437F11287D60EC189@YQXPR0101MB1525.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AkBjOg/OasIxMW9SHzabLlAGFVmEpfQ5z7ECzbnzxtUuy19pOHdPzhqYd4KU/WsZ4+T8RYMgtv0SIRIX4S6TQv9sHL9CARw1ep1FGJMSWfi/RXLo78L5yIiL8tkeZhDHn+8vHJm170KRxP2FLyfh8ycdO0y+ov3fEXekS7UU/7I3/LLbCKIesw/O5MYwrybQlDoG+Rcwuq1ju6b/SSMQL9QkxlfgaAy7aZCCskGS183nNhwwSggVTpG7rmRRKBe5JX1tgrGf5P56VQmqwK//fraaShCYBWopa6KS65aG9fMCbifIImjZJsQEjNf3GX8ctGyIalSr/Ui4Hk10vf29CdH/JJL7xR6ki0YZJ4rnkjArwsB5s15ty8ZtfPbLoDzvI6AhRE6vetW/ZFN+tkPfiCfzAmX3MOhmXAJdpq4mHsyAEpveqoCqpJhvcnwjpWMUqnne/5Y97Q32mgKqhWFMj4wVuE6ofNHcKEPYCmbK2LQguEWyZbR6FKXE0xubLq+YNqRrApzqbHd59wo6dGBPE6kKTuQcm60EufKE9bfh3h88GaSZ5BmsKh4W8aoRbEV/U16axvM6P+spUUTXJGxzXKiFw010jd1NjNdRZA+cBTAPTfYwF6Hv34YzLtOehiKDyiENt6zCG9qwvUSWQneUrH1i3L2d7kWAHan6irbQzhj+Tvfw+TENtTnCiOTefY1OUJR+PuX2YZ/5Vn6eodTxHa0M8Bpl+vEZmCAO8pq6Mk4+mZrx/1EtDfKEYLobebOmKQKMdUjgZx0Eli45++1rY2dZdKfHrPJVG6j908OA/ogRoBWYnLqN7kLp/SWQHSK9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39840400004)(2906002)(478600001)(91956017)(86362001)(186003)(83380400001)(26005)(66946007)(6486002)(76116006)(8936002)(6512007)(2616005)(110136005)(15974865002)(38100700002)(8676002)(66446008)(36756003)(64756008)(122000001)(5660300002)(54906003)(44832011)(71200400001)(66476007)(66556008)(4326008)(6506007)(316002)(99106002)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1hzQlVTUndLODV0aGluSnltWDE1ZElORjdPcHNWWEQ0OUxiVkRpM1JZYTh3?=
 =?utf-8?B?bnVYcm5qTHd3b2lCWWltUW5TSVpHL04ybmh3QlZNS01tdFlCcGhWTUdZRFc0?=
 =?utf-8?B?SkF5enU3OW1qQ3R0MW03Um5SQ3E0SW0rRUhzYjdYdVlsalFnZ0IxS2IrYTU4?=
 =?utf-8?B?Yk1xdlFVOHB5VG55T3pUUFlnSzBpb1RhQWdrVjV5L0M2VDgvSFFzMlVEZFhm?=
 =?utf-8?B?dUR0b01JUWJLbmo5MFp3MDJUaFZRYmlIdlZ3aDhOVFJaWmdVMFhWaXR3azFH?=
 =?utf-8?B?V1NPNlJvdXl5UkFEVzNpRWxsSEdvRWFxYk81Y2htdjJObk9XMW5QTm1OSFdN?=
 =?utf-8?B?THpVdzM0UjVKb1J0Q3BTNkNSdENqRXh0Q2cwR1dsWGY5T2RZakFXem1YYy9w?=
 =?utf-8?B?Ulk2Vlo0TmFlZC8yUFg1bXJIM2orOVVTREloTUhHU0xtQS9xaE1INkpzZEJh?=
 =?utf-8?B?c3JCbFVvQWh6SFU3T0tYVk9kQ1UrWXd1VmQ5Qk9DdlhzNXlLcGJmK3FPZzJ6?=
 =?utf-8?B?MktGSjE2N1JPSDRPSzk5MUZsMXJXcjZrYVNocWc4VzJaU09ud1d4cWFHN0Zj?=
 =?utf-8?B?Q3VSQmx2dWw3dzQ0OTVUMW4rNGZxSjB0c0ZOQ013MzgrWU93MjJsYUErZnFC?=
 =?utf-8?B?dGpQR2pPVGVoYzA5bjltQjEvejhmeVFmbldESkFUVGo2Q0hGYVJHY2lXMkZu?=
 =?utf-8?B?OWNrR08xNkc4WklCV2JQZjJ1VWMzY0tKZU1qR1VIVExGZ0MxVjFKU3k5RUtC?=
 =?utf-8?B?UGQyREV2a3RUL25JUjJWa3NXMjNSSDhVWWd2UkNzOEYzalpVcGpkZDJaUkVT?=
 =?utf-8?B?L3ZzZFVtVGYzZmcybFJabUxFcEtyVDFVdTdrRmFoYVRVTTVKYWdNMG93WG5y?=
 =?utf-8?B?SzMwZk5hRDk0MWVOaTZRMkx5akVtSVQyNThIV3gva0daNHlPZnRuRWNFNmFi?=
 =?utf-8?B?N1JwaHF2QlJGWUhScGFYd0pQbEtZTkRTWmxWd0dHUFVReWh2WlVwRStTZndj?=
 =?utf-8?B?UkpoMG9rUzZIUXIwVWxnME1WTWY2SzM1YTFaY2FjeXBoOHRkUHdqR3ozSnNZ?=
 =?utf-8?B?K29WV2Ztb1J5ODdCQUZSVDhXTUJDZ0Vkakx0WW80YzR3WFcwRTgxejVPa2dB?=
 =?utf-8?B?TTNKZ1FZcVVMRXhmR25SZGoweEUrT2ZvOWFMalVveWt0Y294QXAzN29DNVQx?=
 =?utf-8?B?dXNXdk1QWm5WREtrWHQ1TTYyOTZPUWFxSFkyS1JkOExiaUQ1d3BPUm1lYlZO?=
 =?utf-8?B?S2hPN0pGQVpZaE5salgrc3JYTjJOU2w4N244S2FYelVCWjUvRWR4Ump5cnVr?=
 =?utf-8?B?UzdPNGxVUmZrY0E1b2ZqTFlvZUxpb0xxTG5ERzQyc2Z1QjFkNlBKbS80VUcr?=
 =?utf-8?B?TThDVnlJaSsyMHhmcGNpQ2UrUHJzVFErbERhVWtwOThRU096blBVNVRjT0pU?=
 =?utf-8?B?QnIxZXVWT29ERllLOXVpRjl3WGFtSGF4L0NHYWJkdVZ3MjlVWDYxbTJMV0R2?=
 =?utf-8?B?WVF1czF6eUJIM1dQdTl0bnlxTTY2LzdwZVgvZTcvdG0zcWZsSXhCV1VIbGUy?=
 =?utf-8?B?ZktxTWwrSDM4QXcvM3pCdkVlQ3pjY0ZlTUROWUVYQmxMeGVoa0c1RTIweEZV?=
 =?utf-8?B?WkhyRFVnc2w3MVptU3hkUEhnMys3RGZibFRQNDBLNTBDQW05M0hyaGY5bW45?=
 =?utf-8?B?K2NLNU1yTG9jam91VDJFSlJoU29CeVpBMEFLcEJwSVpGeHFDUGRoL1QxRnF5?=
 =?utf-8?Q?/YB3h2BBI/VCuCzQV62QpYsK8+Go4XT6mNYHhyi?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <61DD80A8E53D8146949926F4D14AB8CF@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee73a69-81f0-4986-4092-08d942fbcc53
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2021 17:05:47.9777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbAkt0jryJThl0VnH5/j+lAtKVVBcCM3pX2M42Z8NMVat04SLjzxq7kU+O6Zz48ydDA+jF0ujLOH/DxxKiszDOH78u6AodjD2kDsIFlmKic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR0101MB1525
X-Proofpoint-GUID: KCMy29kqT-aYd6zWyF5WHa83KRAUw5-w
X-Proofpoint-ORIG-GUID: KCMy29kqT-aYd6zWyF5WHa83KRAUw5-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-09_10,2021-07-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090085
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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

T24gRnJpLCAyMDIxLTA3LTA5IGF0IDEzOjM4ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBGcmksIEp1bCAwOSwgMjAyMSBhdCAxMDoxNjo0NUFNICswOTAwLCBLdW5pbm9yaSBNb3JpbW90
byB3cm90ZToNCj4gDQo+ID4gPiBTbyB0aGUgbmV4dCBpc3N1ZSBJJ20gbm93IGZhY2luZyBpcyB0
aGF0IHRoZSBNQ0xLIHRvIFNDTEsgZGl2aWRlciBpcyBub3QNCj4gPiA+IGJlaW5nDQo+ID4gPiBz
ZXQgcHJvcGVybHkgaW4gZWl0aGVyIHRoZSBBdWRpbyBGb3JtYXR0ZXIgKE1NMlMgRnMgTXVsdGlw
bGllciByZWdpc3RlcikNCj4gPiA+IG9yIGluDQo+ID4gPiB0aGUgSTJTIFRyYW5zbWl0dGVyIChJ
MlMgVGltaW5nIENvbnRyb2wgcmVnaXN0ZXIpLiBUaGUgeGxueF9pMnMgZHJpdmVyDQo+ID4gPiBo
YXMgYQ0KPiA+ID4gc2V0X2Nsa2RpdiBmdW5jdGlvbiBkZWZpbmVkIGluIGl0cyBzbmRfc29jX2Rh
aV9vcHMgc3RydWN0dXJlLCBob3dldmVyDQo+ID4gPiB0aGF0DQo+ID4gPiBkb2Vzbid0IGFwcGVh
ciB0byBiZSBnZXR0aW5nIGNhbGxlZC4gQW5kIHRoZSB4bG54X2Zvcm1hdHRlcl9wY20gZHJpdmVy
DQo+ID4gPiBkb2Vzbid0DQo+ID4gPiBzZWVtIHRvIGhhdmUgYW55IGNvZGUgdG8gc2V0IFhMTlhf
QVVEX0ZTX01VTFRJUExJRVIgYXQgYWxsLg0KPiA+ID4gSW4gdGhpcyBjYXNlIEkgaGF2ZSBhIHNh
bXBsZSByYXRlIHRvIE1DTEsgZGl2aWRlciBvZiAyNTYsIHNvIGl0IGxvb2tzDQo+ID4gPiBsaWtl
IEkNCj4gPiA+IHNob3VsZCBhZGQgbWNsay1mcyA9IDwyNTY+IGludG8gdGhlIGRhaS1saW5rIG5v
ZGVzIGluIHRoZSBkZXZpY2UgdHJlZSwNCj4gPiA+IGJ1dA0KPiA+ID4gdGhlcmUgd2lsbCBuZWVk
IHRvIGJlIHNvbWUgY29kZSBhZGRlZCB0byB0aGUgeGxueF9mb3JtYXR0ZXJfcGNtIHRvIGRvDQo+
ID4gPiBzb21ldGhpbmcNCj4gPiA+IHdpdGggdGhhdCBpbmZvcm1hdGlvbj8gQW5kIHRoZW4gc2hv
dWxkIHRoYXQgZHJpdmVyIGhhdmUgY29kZSB0byB0cmlnZ2VyDQo+ID4gPiB0aGUNCj4gPiA+IGNh
bGwgdG8gc2V0X2Nsa2RpdiBvbiB0aGUgQ1BVIERBSSBhcyB3ZWxsPw0KPiA+IEhtbS4uLiBjbG9j
ayBpcyBvbmUgb2YgZGlmZmljdWx0IHBvaW50IHRvIGJlIGdlbmVyaWMsIEkgZ3Vlc3MuDQo+ID4g
YXVkaW8tZ3JhcGggLyBhdWRpby1ncmFwaDIgaGFzIGN1c3RvbWl6ZSBmZWF0dXJlIGluIHN1Y2gg
Y2FzZSwNCj4gPiBidXQgc2ltcGxlLWNhcmQgZG9lc24ndC4NCj4gPiAJLSBjcmVhdGUgZ2VuZXJp
YyBjbG9jayBoYW5kbGluZyB3YXkgb24gc2ltcGxlLWNhcmQgPw0KPiA+IAktIGFkZCBjdXN0b21p
emUgZmVhdHVyZSB0byBzaW1wbGUtY2FyZCA/DQo+ID4gCS0gc3dpdGNoIHRvIGF1ZGlvLWdyYXBo
IC8gYXVkaW8tZ3JhcGgyLCBhbmQgdXNlIGN1c3RvbWl6ZSBmZWF0dXJlID8NCj4gPiBUaGFuayB5
b3UgZm9yIHlvdXIgaGVscCAhIQ0KPiANCj4gRm9yIHNvbWV0aGluZyBsaWtlIHRoaXMgSSB0aGlu
ayB0aGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIGZpZ3VyZSBvdXQNCj4gdGhlIHJhdGlvIGJh
c2VkIG9uIHRoZSBjb25maWd1cmVkIE1DTEsgYW5kIHNhbXBsZSByYXRlLiAgRm9yIHRoZSBtb3N0
DQo+IHBhcnQgc2V0X2Nsa2RpdigpIHNob3VsZCBiZSBhIGxlZ2FjeSB0aGluZywgaXQncyB2ZXJ5
IG1hbnVhbCBhbmQgaGFyZCB0bw0KPiBzZWUgd2h5IGEgc3lzdGVtIHdvdWxkIGRvIHNvbWV0aGlu
ZyBkaWZmZXJlbnQgdG8gdGhlIG9idmlvdXMgcmF0aW8NCj4gdXN1YWxseS4NCg0KUG9zc2libHkg
dGhlIEkyUyB0cmFuc21pdHRlciBzaG91bGQgYmUgaW1wbGVtZW50aW5nIHNldF9zeXNjbGsgcmF0
aGVyIHRoYW4NCnNldF9jbGtkaXYgdGhlbj8gc2ltcGxlLWF1ZGlvLWNhcmQgc2VlbXMgbGlrZSBp
dCB3b3VsZCBhbHJlYWR5IHByb3BhZ2F0ZSB0aGF0DQp0aHJvdWdoIGludG8gdGhlIENQVSBEQUkg
aW4gYXNvY19zaW1wbGVfaHdfcGFyYW1zIGFuZCB0aGVuIGl0IGNvdWxkIGZpZ3VyZSBvdXQNCnRo
ZSByaWdodCBkaXZpZGVyIHZhbHVlIHRvIHVzZS4NCg0KVGhlIHRyaWNreSBwYXJ0IGlzIHRoYXQg
dGhlIEF1ZGlvIEZvcm1hdHRlciAodXNlZCBhcyB0aGUgInBsYXQiIGNvbXBvbmVudCBoZXJlKQ0K
YWxzbyBuZWVkcyB0byBrbm93IHdoYXQgdGhlIG1jbGstZnMgdmFsdWUgaXMuIChJIHJlYWxseSBk
b24ndCBrbm93IHdoeSBpdA0KY2FyZXMsIEkgd291bGQgdGhpbmsgaXQgd291bGQganVzdCBwdXNo
IGRhdGEgdG8gdGhlIG91dHB1dCBzdHJlYW0gYXMgZmFzdCBhcyBpdA0Kd2FzIGFjY2VwdGVkLCBi
dXQgaW5kZWVkIGl0IGRvZXMgaGF2ZSBhIHJlZ2lzdGVyIHRvIHNldCB0aGUgc2FtcGxlIHJhdGUg
dG8gTUNMSw0KZGl2aWRlciwgYW5kIGlmIGl0J3Mgbm90IHNldCBwcm9wZXJseSB0aGUgSTJTIHRy
YW5zbWl0dGVyIGRvd25zdHJlYW0gc2VlbXMgdG8NCmNvbnN0YW50bHkgZ2V0IHVuZGVycnVucy4p
IEknbSBub3Qgc3VyZSBpZiB0aGVyZSdzIGFueSBtZWNoYW5pc20gZm9yIGl0IHRvDQpkZXRlcm1p
bmUgdGhlIHZhbHVlIHJpZ2h0IG5vdywgb3IgaWYgc29tZXRoaW5nIG5ldyB3b3VsZCBuZWVkIHRv
IGJlIGFkZGVkPw0KDQpPdXIgYWN0dWFsIHByb2R1Y3QgdXNpbmcgdGhpcyBYaWxpbnggbG9naWMg
aXMgb25seSB1c2luZyBjYXB0dXJlIGZ1bmN0aW9uYWxpdHkNCi0gdGhlIHBsYXliYWNrIHNpZGUg
KHdoaWNoIGlzIHdoZXJlIHRoZXNlIGlzc3VlcyBjb21lIGluKSBpcyBqdXN0IGJlaW5nIHVzZWQg
YXMNCmEgbG9vcGJhY2sgdG8gdGhlIGNhcHR1cmUgc2lkZSBmb3IgdGVzdGluZyBwdXJwb3NlcyAt
IGJ1dCBJIGNhbiBwb2tlIGF0IHRoaXMNCmZ1cnRoZXIgaWYgdGhlcmUncyBzb21lIHNwYXJlIHRp
bWUuLg0KDQotLSANClJvYmVydCBIYW5jb2NrDQpTZW5pb3IgSGFyZHdhcmUgRGVzaWduZXIsIENh
bGlhbiBBZHZhbmNlZCBUZWNobm9sb2dpZXMNCnd3dy5jYWxpYW4uY29tDQo=
