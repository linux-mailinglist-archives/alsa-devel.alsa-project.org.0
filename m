Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685D3BF271
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 01:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6500286F;
	Thu,  8 Jul 2021 01:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6500286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625700428;
	bh=sEqu5RDhdq/owJDyWCGY/yYf8PX3RKV0JlXM9tRmhZI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yl6EE9EXrlRpPpm6tH+EwWhVg5R5SUcTDnT5yAo2aDNZuNxT9LHnjC4Wmb4mK6FI0
	 dOYOIoG6I2cZWVJgMRQAUgK9QwakEvo3X3wgtKtoDMXLoIDyni3eFFfCMHd7ZaAEWv
	 9cOHlOQhFxBjHf1593SWhnLkwwDekFz626lhX8qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6340F8012A;
	Thu,  8 Jul 2021 01:25:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 414E1F80224; Thu,  8 Jul 2021 01:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78813F8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 01:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78813F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="ArLZuotR"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 167K7VnL014890; 
 Wed, 7 Jul 2021 19:25:27 -0400
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2057.outbound.protection.outlook.com [104.47.60.57])
 by mx0c-0054df01.pphosted.com with ESMTP id 39n7vp0knd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 19:25:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeO95hve+GIIUHKdwL5WncOJ8GOJH2OM7qfoTWXzKXNvTTimkgCaQj5dXzbTRW7fq1q9YLnHBb1n1/Mjkf9SiJRpEnhYA64W1stX6AK1HKdyqo0IBvLnjqtOl4k4QFbpmiCdHhk4WtnwX1lK4rL2WqmenVhiVqZ4OV7zQrzxkCGNk+8YDwiAVQRwXZU7ugk+c/tj+G9b1B2/Ifgsyqt6gTmbICenX7Pm5oVuQc0AvlVOky6D/IpaIp6nLhajeWoHSqel9cS2uHkitwk+sGLVDHvB4bab10nT3uKf/ONPGYFlcPG2s4VnvasVG3d9eXSvIXZLxbEbXfVSJ7ZgA9Yl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEqu5RDhdq/owJDyWCGY/yYf8PX3RKV0JlXM9tRmhZI=;
 b=Votdh5vwI5fi79ZP1PAc9IWzyNZqmMe/UOOCXmau+d3lXIjZ43EM+iRSWUC5XHiAJbhmreneXxRHBtLB0CisOipsJ+WVUbDH1NRG0h/3k6gadzNiXsL2AsdcF0cd1odQS49pyLI8uezqKTtgRwIsf071sGOnT1iaIYQ33fCqz5oRtuY1acFqkXg1W5YMED0WgGHpmfeDyFjVzFvHCRNfMP7lOrv5iZMurr5ziCiIOE5m8OsFDXtxQcG2JwBiIiMPEDMshFz+y6RpPucJVxXMetSEcla7zo5tEV17dRjJOLSvtRnyggv6AdddNvcVkVHQMQppg2nCG/sKjJlzOwcS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEqu5RDhdq/owJDyWCGY/yYf8PX3RKV0JlXM9tRmhZI=;
 b=ArLZuotRahCefCcHDWCF9nRr0fdvNQY0fsRh8U+VZe/EUksbeUGFtkzkKpyEETkQ1+Jxk+eJymJ9O/Xpg+IX7uQUL5utQYlmNE4mZ5YJZLr8yojBnRPNjgNgjYy0zA6g7YzMAXs6b542oQbh/9moLhMHy7VZaTdmRWYcWok0RIE=
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::23)
 by YQBPR0101MB0978.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 23:25:25 +0000
Received: from YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007]) by YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::88bb:860e:2f3a:e007%6]) with mapi id 15.20.4308.022; Wed, 7 Jul 2021
 23:25:25 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Topic: Issues using simple-audio-card driver with Xilinx Audio Formatter
Thread-Index: AQHXcsWHzh5VPmqBUEq1W5dwLNaiPKs2tqGAgAFyjAA=
Date: Wed, 7 Jul 2021 23:25:25 +0000
Message-ID: <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 782a0d67-cdaa-47e9-ea43-08d9419e7fba
x-ms-traffictypediagnostic: YQBPR0101MB0978:
x-microsoft-antispam-prvs: <YQBPR0101MB097885CA0E989D0FA9F43905EC1A9@YQBPR0101MB0978.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dy6gzN1hCkTDZ8fMCT5gfc0/vpGbwswKSY6jymq/Cg1WHJiK/y1NZCUt964sL/SoEzwMiTVeO0RZE+TRSX0RA8BDSt6ViHXAhELfiq99U1JAdEzhUhJ+2EhSTsUWIhVFV4ITDgO+443jj4gsLIH2hbA/3pHS+QTJpDLpH50UOyvBak7l88rCKPyXPkykSS6ibIVe8xzUAphWlRSDmkshsAuYqxnRpXkynBSay0joNSDtqS/6hWHfWK9/6yx5f4008Jft0riDg8+bicxWhEkwI6+LbsmvYgvC2v4j0rQwSyYeGjUMXd8X4RfgDl6+rNmwGI5WzbQRkInSLr72MWsJkGPsL/xSUISIVNdzi+W83R815poKiYvrsOdCkONtWYChH85XPVUiyY+nYluPtQuho0sZtyoAMBOAh1bAIIbyxtRLN5c4CBBDfTeRJdjNCe5RjR3GJNAAeOyu2kGc7pWRyh8fywfT7cWSRDx+CkhPfSlU97WE2z2m7D93LDK+dedRNd8GPb1KbHp+e0kZOTaRdTGTWL/qQn3bTSz/un0dN8Wx6Bgxw0XNFIrPk/Mrtogy/B4b2JEVSJZzudFQvuaPKmSrNEqickxnwDIOZD1iH/1peaFZeHl/ugl+uTs36pMzdM5pomv63z3PzdmFN58jjwYlKwjQdO1LgRY1D3wlZnC+MSAg1YhtH1AKH/aP8bzoHNAhnK2kwWg4jLiGaFQiqSYwaVkQGe3Ew6w0UG80MJAmNrY3phb8jE2Tr8kznfJTLwi3J7rUiGG21aXir+fz7BvJV3LHBQ+iqjLUTsSMTQ5qo/t46qJMnxC2iirUa55Unp/AP7QWdg/y5vYoDVK+Jg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(39840400004)(136003)(8676002)(6506007)(122000001)(478600001)(4326008)(38100700002)(6916009)(316002)(66556008)(91956017)(66946007)(66446008)(76116006)(15974865002)(6486002)(66476007)(83380400001)(71200400001)(8936002)(186003)(64756008)(36756003)(44832011)(54906003)(86362001)(2906002)(6512007)(2616005)(5660300002)(26005)(99106002)(309714004)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d01RZTU1SGpjbzZURWQxTDJrakN3eXBHZ1hVSExHQUZzZndaYmxSREZPWXJq?=
 =?utf-8?B?aEtVb1RmOUFUcmNpc3N4UU5IaU1aOGRUb3NwS3pvd3E4VGZkd0pqZGxTenVW?=
 =?utf-8?B?alJFYS9tcS8zcmpCSkovZHpuY2czVlc3M0FGVWtvekhMbVBpT1lzYi96eTVT?=
 =?utf-8?B?a0xMSUZpNkR5V09mUy8wTHBwR1J6UmZuNXJZOW9aTCt5QVd5d1hkbnBFeTdl?=
 =?utf-8?B?TE03dU1lRllkY0ZGaHdvMUk0c0VacU8vajVhVURYSXJDRGcrUGZYMVZKL2pE?=
 =?utf-8?B?a0o2Z2puUmVTd1pCbzAraU1KS250SXZySXNvZ0hqZlNOeU1mMjdYd3E3cklz?=
 =?utf-8?B?MTVhR092N3p1aDZqUW5ZVjhqRkRUU2RibzUwRnlZOGhJL25vaXNJNnBxYmlw?=
 =?utf-8?B?RXB5MUh0eElPQ3laVUhkQmttRmJISUZKMVB3cllpd0tJVDNBejFNK3VIMkVP?=
 =?utf-8?B?QWVuVVh3VDMwVldkNnpRR3paZThNem4vRFVzQTBubUI1SlMrUUZwQmtxdW1M?=
 =?utf-8?B?cFdoMVkyam5nTTRoc1lVMjAwODA3M2NYZnQ1TnMvVGI3UVA0OEZJSnUzWllW?=
 =?utf-8?B?d1F1enlIY3VLVUVtWlVsV0xhZDF4MzFITS84K1E4NkV3SEN4RW9nRWc1czA4?=
 =?utf-8?B?OHNLcHU5RDdWSVZDTjlxNmlrQlUzVmxBQ1AzdEJPZkpMb1lBRWRYeHJXV25u?=
 =?utf-8?B?OTNkMjFpMTVkNG05RTlEbUROa2JVU2oxcnV1bncxbHFDS0hzSWVTWDJqamZl?=
 =?utf-8?B?VnQ1UHpVUlNVVEluaHBqdStlUzArZTc4UFloQ2tEL2djcHE4S0lXM1FINFM4?=
 =?utf-8?B?YXJPa0V4ZzRJK3NkWFJpVGpVN0UxT2pUOTd6M0ovOUtYTWxSYU83Z05JdmZX?=
 =?utf-8?B?VWhZYVcxWXMwSE5zV00wWTd1cXFXeDB6bUNVSUZXNWprL2YvbG5aUkxjekRO?=
 =?utf-8?B?WXZ4enFRTlNpWUVnMEdSWFpWNktySWVwbmpRWGRtVnlvUFFWaTZPVThvTWMr?=
 =?utf-8?B?SDdacDB4VlI5dTE5ZmFyL1lMM2dPNkQ1OXpJVnpwazhkc1UyaklhbzYzNGww?=
 =?utf-8?B?NnN1WDF3WFlVYjltMHJSNTZBUndZUWJJd05VQWY5NHBhcVcra2N3TXhGb2w4?=
 =?utf-8?B?SWtRazBxUTk1WW9LT2lROWl6L2pRTmg2RlBTbEs4dUJ5V3p5ZGZvMUsxZTZv?=
 =?utf-8?B?cG1WM2YyMC9FaWNyNEdKdFpzUGtKaHZja0svK2xWNmFPN2lOemkva21VY0lm?=
 =?utf-8?B?WFhoVHBMYUtmZ0x3Z0hRZXNzam5RL2hMQmR2eXNqSSszVFNxSDFxQ1VLR3dP?=
 =?utf-8?B?MnVienc5czVnbi9URjZUeGpIbmpTVVBKUkt3b2REd05IYWFHZFRYdG8vRHpD?=
 =?utf-8?B?Y0pjeFY1b0xRd1VhbUw5VldEV3VRNjJUWmN6VEUxMWRQYWY3WXVvWEo0eWEv?=
 =?utf-8?B?RHA0dENxNXVoU0VuQitiVCtrVkdWVExOcWFWWHlkY3VTMzJmcjA1RVJWQ0Ri?=
 =?utf-8?B?UkIyRkhsMnFVd0w1NDJDOVVhc0ZrZDMvMVo2bEtUU0VnTTlIV1R6eDhNaklF?=
 =?utf-8?B?Z2hvaDE1Vzg5dm5nYXJXc0dJdHIxMjZwbXNGeGdvUVRaUVpPTGZYcDlmTndx?=
 =?utf-8?B?K0xidXJBaDB3cnRqcmZFWERZSmtNa0xlTXhWVTF5NWVvNVNibHVpdFpsQllY?=
 =?utf-8?B?d2hwakhqK3lkVTJhYkRMdkV3ZnVUckt6V0JrVGpiV1pzeklzNjlzaUFNbWgv?=
 =?utf-8?Q?p0n66HHz96dDuGRD1Gv5adB0Ubc/bhRkI30qMOv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B30137D51CC0F64CB296DDF54BC646FF@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB5049.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 782a0d67-cdaa-47e9-ea43-08d9419e7fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 23:25:25.1308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zt5tasvEazwAMdLPs4zfP7I+b5HQSBTlpshEY+Xm4LKgoL+eY2fCDGcrQxt7o14+UftMjghCuHf3xfxaiUYz72rDVv7ZzbBXX+a5Z1hc/F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB0978
X-Proofpoint-GUID: usrLbMknEtEjBaoHEYLASMgex2N93mVm
X-Proofpoint-ORIG-GUID: usrLbMknEtEjBaoHEYLASMgex2N93mVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-07_11,2021-07-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070133
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
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

T24gV2VkLCAyMDIxLTA3LTA3IGF0IDEwOjE5ICswOTAwLCBLdW5pbm9yaSBNb3JpbW90byB3cm90
ZToNCj4gSGkgUm9iZXJ0DQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwb3J0aW5nDQo+IA0K
PiA+IGFzb2Mtc2ltcGxlLWNhcmQgaXJ4cy1hdWRpbzogcGFyc2UgZXJyb3IgLTIyDQo+ID4gYXNv
Yy1zaW1wbGUtY2FyZDogcHJvYmUgb2YgaXJ4cy1hdWRpbyBmYWlsZWQgd2l0aCBlcnJvciAtMjIN
Cj4gKHNuaXApDQo+ID4gSW5zaWRlIHNuZF9zb2NfZ2V0X2RhaV9uYW1lLCBzbmRfc29jX2NvbXBv
bmVudF9vZl94bGF0ZV9kYWlfbmFtZSBpcyBjYWxsZWQNCj4gPiBhbmQNCj4gPiByZXR1cm5zIC1F
Tk9UU1VQUCwgc28gd2UgZmFsbCBpbnRvIHRoZSBpZiBibG9jayBhbmQgZW5kIHVwIGZhaWxpbmcg
b3V0DQo+ID4gaGVyZToNCj4gPiANCj4gPiAJCQlpZiAoaWQgPCAwIHx8IGlkID49IHBvcy0+bnVt
X2RhaSkgew0KPiA+IAkJCQlyZXQgPSAtRUlOVkFMOw0KPiA+IAkJCQljb250aW51ZTsNCj4gPiAJ
CQl9DQo+IA0KPiBQbGF0Zm9ybSBzdXBwb3J0IHdhcyBhZGRlZCB0byBzaW1wbGUtYXVkaW8tY2Fy
ZCBieSBzb21lb25lIChJIGZvcmdvdCBkZXRhaWwpLA0KPiBhbmQgSSBoYXZlIG5ldmVyIHVzZSBp
dCB1bmZvcnR1bmF0ZWx5Lg0KPiBCdXQgaW4gbXkgcXVpY2sgY2hlY2ssIHRoZSBwdXJwb3NlIG9m
IGFzb2Nfc2ltcGxlX3BhcnNlX3BsYXRmb3JtKCkgaXMNCj4gc2V0dXAgZGxjLT5vZl9ub2RlDQo+
IA0KPiAJYXNvY19zaW1wbGVfcGFyc2VfZGFpKC4uLikNCj4gCXsNCj4gCQkuLi4NCj4gPT4JCWRs
Yy0+b2Zfbm9kZSA9IGFyZ3MubnA7DQo+IAkJLi4uDQo+IAl9DQo+IA0KPiBhbmQgaXQgd2lsbCBi
ZSBjaGVja2VkIGF0IGFzb2Nfc2ltcGxlX2Nhbm9uaWNhbGl6ZV9wbGF0Zm9ybSgpDQo+IA0KPiAJ
YXNvY19zaW1wbGVfY2Fub25pY2FsaXplX3BsYXRmb3JtKC4uLikNCj4gCXsNCj4gCQkvKiBBc3N1
bWVzIHBsYXRmb3JtID09IGNwdSAqLw0KPiA9PgkJaWYgKCFkYWlfbGluay0+cGxhdGZvcm1zLT5v
Zl9ub2RlKQ0KPiA9PgkJCWRhaV9saW5rLT5wbGF0Zm9ybXMtPm9mX25vZGUgPSBkYWlfbGluay0+
Y3B1cy0+b2Zfbm9kZTsNCj4gCQkuLi4NCj4gCX0NCj4gDQo+IGFuZCB3aWxsIGJlIHVzZWQgYXQg
c29jLWNvcmUNCj4gDQo+IChBKQlzb2NfZGFpX2xpbmtfc2FuaXR5X2NoZWNrKC4uLikNCj4gCXsN
Cj4gCQkuLi4NCj4gCQlmb3JfZWFjaF9saW5rX3BsYXRmb3JtcyhsaW5rLCBpLCBwbGF0Zm9ybSkg
ew0KPiA9PgkJCWlmICghIXBsYXRmb3JtLT5uYW1lID09ICEhcGxhdGZvcm0tPm9mX25vZGUpIHsN
Cj4gCQkuLi4NCj4gCX0NCj4gDQo+IAlzbmRfc29jX2FkZF9wY21fcnVudGltZSguLi4pDQo+IAl7
DQo+IAkJLi4uDQo+IChBKQkJcmV0ID0gc29jX2RhaV9saW5rX3Nhbml0eV9jaGVjaygpOw0KPiAJ
CS4uLg0KPiANCj4gCQlmb3JfZWFjaF9saW5rX2NwdXMoZGFpX2xpbmssIGksIGNwdSkgew0KPiAo
WCkJCQlhc29jX3J0ZF90b19jcHUocnRkLCBpKSA9IHNuZF9zb2NfZmluZF9kYWkoY3B1KTsNCj4g
CQkJLi4uDQo+IAkJfQ0KPiANCj4gCQlmb3JfZWFjaF9saW5rX2NvZGVjcyhkYWlfbGluaywgaSwg
Y29kZWMpIHsNCj4gKFgpCQkJYXNvY19ydGRfdG9fY29kZWMocnRkLCBpKSA9IHNuZF9zb2NfZmlu
ZF9kYWkoY29kZWMpOw0KPiAJCQkuLi4NCj4gCQl9DQo+IA0KPiAJCWZvcl9lYWNoX2xpbmtfcGxh
dGZvcm1zKGRhaV9saW5rLCBpLCBwbGF0Zm9ybSkgew0KPiAoWSkJCQlmb3JfZWFjaF9jb21wb25l
bnQoY29tcG9uZW50KSB7DQo+ID0+CQkJCWlmICghc25kX3NvY19pc19tYXRjaGluZ19jb21wb25l
bnQocGxhdGZvcm0sDQo+IGNvbXBvbmVudCkpDQo+IAkJLi4uDQo+IAl9DQo+IA0KPiBCdXQsIGF0
IHNuZF9zb2NfYWRkX3BjbV9ydW50aW1lKCksDQo+IENQVS9Db2RlYyBuZWVkcyBvZl9ub2RlIGFu
ZCBEQUkgbmFtZSAoPSBYKQ0KPiBQbGF0Zm9ybSAgbmVlZHMgb2Zfbm9kZSAgICAgICAgICAgICAg
KD0gWSkNCj4gDQo+IFNvIG1heWJlIChJIGRpZG4ndCBjb25maXJtKSBmb3IgcGxhdGZvcm0sDQo+
IGFzb2Nfc2ltcGxlX3BhcnNlX2RhaSgpIGRvbid0IG5lZWQgdG8gY2FsbCBzbmRfc29jX29mX2dl
dF9kYWlfbmFtZSgpID8NCg0KSSB0aGluayB5b3UncmUgcHJvYmFibHkgcmlnaHQgLSBJIG1hZGUg
YSBjaGFuZ2UgdG8gYmFzaWNhbGx5IGlnbm9yZSBhIGZhaWx1cmUgb2YNCnNuZF9zb2Nfb2ZfZ2V0
X2RhaV9uYW1lIGluIHRoZSBwbGF0Zm9ybSBjYXNlIGFuZCB0aGUgZHJpdmVyIHNlZW1zIHRvIHBy
b2JlIE9LLg0KUG9zc2libHkgaXQgc2hvdWxkIGp1c3Qgc2tpcCB0aGUgY2FsbCBlbnRpcmVseSBh
bmQgbm90IGV2ZW4gdHJ5IHRvIHBvcHVsYXRlIHRoZQ0KbmFtZSBmb3IgcGxhdGZvcm0gaWYgaXQn
cyBuZXZlciBuZWVkZWQ/DQoNCkkgaGF2ZSBzb21lIG90aGVyIGlzc3VlcyB0byB3b3JrIHRocm91
Z2ggdG8gdHJ5IGFuZCBnZXQgYSB3b3JraW5nIHNldHVwLCBidXQNCm9uY2UgSSBnZXQgdGhpbmdz
IHdvcmtpbmcgaW4gbXkgdGVzdCBzZXR1cCBJIGNhbiBwdXQgYSBwYXRjaCB0b2dldGhlci4NCg0K
LS0gDQpSb2JlcnQgSGFuY29jaw0KU2VuaW9yIEhhcmR3YXJlIERlc2lnbmVyLCBDYWxpYW4gQWR2
YW5jZWQgVGVjaG5vbG9naWVzDQp3d3cuY2FsaWFuLmNvbQ0K
