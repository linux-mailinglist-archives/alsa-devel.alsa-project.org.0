Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC3BF5CF
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 17:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845E11760;
	Thu, 26 Sep 2019 17:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845E11760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569511439;
	bh=yDFbsctLoxT0IS253iRl6gn+DU27iw0ni6QO6tVynB0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AkbLcv+LWEc7PhU0Sj+/AlbXoZIW6ewpxxcdiNkRPwxlmXCn6KVGmDJrrMWT7tKl+
	 gS6fjZ2ffYbJP7Q25dKmjbOGmoVKkp6JECDw8vFLnVYx2HRheoZNyRI9bPEAERIsPd
	 U7wXgRYCxqQx4sZ//3a5AvU4lAEkK/9VE77gcP3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB1FF8045F;
	Thu, 26 Sep 2019 17:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D484EF80213; Thu, 26 Sep 2019 17:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAACBF80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 17:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAACBF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="aUKEqIJc"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8QFGXbi014169; Thu, 26 Sep 2019 11:22:04 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2058.outbound.protection.outlook.com [104.47.46.58])
 by mx0a-00128a01.pphosted.com with ESMTP id 2v6hjwytg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 11:22:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ig0Ukfb+LQM4TGyzt79r9Q0ylWT7iiv/7dIQiIzIJiTfCCUdg8TkZ2X89KmkMjy3imb9PNhlRrzxylwLPuZFihMsdOlzC8dhXe6kapkpVuMScTsyhAAdgxAi3rCUangi8prn9DeCQUSCEpWsE7V2UGb0GL50OwRwIVlsKmIKdp78wx3CHOGqRtgfztI1gMbgLNxM9HJDjqAb/WP51YgG1IhQ83xHhK0U4eFX2nVDJu4owThpnRIx7tgxOXJabl+SD++hhbSFS54xAH7E+D1rkQmsCMawlD0IU01/F02jfs1r5LhyXfCLx4czfr8YvPUDAfNqhY/H/wgamnKyDgK+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsfy4RQ656s8DjjApo3LjNRl2Q+2aB5uHudTEZll3Nk=;
 b=K20Yp55skO6DIH7Wsme4CIiGCuRqFF+hxBZzEhnMhLWPzAKPdVYPlR6HNYDO5TgTskb0C9oGIWHquchVwU7NQu/66zYLh510pnxIY1deZiaZER0w0Vf6AScy9hr6V73IU+q//dizu1b7MFLpia+zMFYRbPSwm4gJ25cuYL6D6KuIlDQV9yiVf/aIZjfRuzEVvlUS0ZMjGBPZfUwJ9+cqm8VDIthf+ZNUMDGUkrax71hKtg88tLSETrJBh9xx2d+V45S8pZjQhXCigAu9kOVtVbfAY/kORUvMRGbmyihAUCcjxRHKGT9GXJKybSjzzGBDYCRUDT7B4YAoWhCWSfOYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bsfy4RQ656s8DjjApo3LjNRl2Q+2aB5uHudTEZll3Nk=;
 b=aUKEqIJcf6vViC9xbP8+J/fMi2SM3xKfKRFhi37wSxCsIbfjfp3rYt8YCrPidsKcvfYYV8P33XGEkXbDbka7k52J0xs0DyObZRr5aQ2tOfLFocEFyZBCBAPnknd/PlFGDnerzhAwLRTslyHWaLMrY2uzqVZQE3BGhBjEqhOvxfE=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB4736.namprd03.prod.outlook.com (20.179.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 15:21:59 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::9db6:a133:7d27:643]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::9db6:a133:7d27:643%4]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 15:21:58 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [PATCH 1/2] ASOC: Add ADAU7118 8 Channel PDM-to-I2S/TDM
 Converter driver
Thread-Index: AQHVdHwnuZC+jeXkTkSa4PP7eqv8Xqc+E2uA
Date: Thu, 26 Sep 2019 15:21:58 +0000
Message-ID: <60a5da0f9481048b3dd34a1115fa9b0af874f3c5.camel@analog.com>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926150721.GT2036@sirena.org.uk>
In-Reply-To: <20190926150721.GT2036@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 451de886-f4f7-4067-9861-08d742954605
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB4736:
x-microsoft-antispam-prvs: <MN2PR03MB4736BA2BA022451C0DB8C4D799860@MN2PR03MB4736.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(6246003)(71200400001)(71190400001)(316002)(6436002)(6486002)(76176011)(6506007)(486006)(99286004)(8936002)(5640700003)(2906002)(54906003)(6512007)(8676002)(3846002)(6116002)(476003)(256004)(2616005)(36756003)(81156014)(1730700003)(102836004)(229853002)(81166006)(26005)(66066001)(11346002)(64756008)(66446008)(66946007)(66476007)(66556008)(76116006)(2351001)(6916009)(5660300002)(186003)(25786009)(2501003)(478600001)(305945005)(446003)(14454004)(7736002)(4744005)(4326008)(118296001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR03MB4736;
 H:MN2PR03MB5117.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: enC+zSvdP0FVIc/ZAmhU71Kh2WYfZMOTtkd984yXvmjWojXNrMBHRQq6gTvsKn5Sb6EIq96rzFNaLFVOpMzb4rpi8+6AIJR4ZlsisLZVUCaIkrwF+DSRVp4+yONqwIGNoNRnYb+jBjGxzWB18RBRg4d1P6QRDD7CxeT9w5brRZqIO0RMYFvSytTlqcIQuZYMMSVE7EC1r//+WBJgQcShSQ8WJM6eOBzi5lrah+HINNEQ4n/cn4Q219QZUx16/Qw9Hoe6r1kxCWqJMISytWPXYwIjEkllVLHqQ5nwY1HIllIcK+/tMh62CNI7E/eOeT7u9N3/j3cJKCIvfF96qNBHOCY+Z7Sj9UJTHv6sbS00NQzThvdCbaMf5dSGjMe1tuCfZEu/aaZPeNKd8nK0CEvylozibPRuj18oRFBBmZQcQ/0=
x-ms-exchange-transport-forked: True
Content-ID: <74D9096DF0FC844495049A7CB60BA939@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451de886-f4f7-4067-9861-08d742954605
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 15:21:58.6785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wGJn5weU/rRxiIzejzm16R67wIBEGquUHQ+aLpjZkb8dv0hnz0D5cHsT0dIfDyaB3v1qAvLAChcP4uoOIMjIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4736
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_07:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909260140
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVGh1LCAyMDE5LTA5LTI2IGF0IDA4OjA3IC0wNzAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBb
RXh0ZXJuYWxdDQo+IA0KPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAwOToxNzowNkFNICswMjAw
LCBOdW5vIFPDoSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIDgg
Y2hhbm5lbCBQRE0tdG8tSTJTL1RETSBjb252ZXJ0ZXIuDQo+ID4gVGhlDQo+ID4gQURBVTcxMTgg
Y29udmVydHMgZm91ciBzdGVyZW8gcHVsc2UgZGVuc2l0eSBtb2R1bGF0aW9uIChQRE0pDQo+ID4g
Yml0c3RyZWFtcw0KPiA+IGludG8gb25lIHB1bHNlIGNvZGUgbW9kdWxhdGlvbiAoUENNKSBvdXRw
dXQgc3RyZWFtLiBUaGUgc291cmNlIGZvcg0KPiA+IHRoZSBQRE0NCj4gDQo+IFRoaXMgaXMgdGhl
IHRoaXJkIGNvcHkgb2YgdGhpcyBJJ3ZlIGdvdCBpbiB0aGUgcGFzdCAyNCBob3VycyAtDQo+IHRo
ZXJlJ3Mgbm8gdmVyc2lvbmluZyBvciBhbnl0aGluZyBzbyB3aGF0J3MgZ29pbmcgb24/DQoNClRo
YXQgd2FzIG15IGJhZC4gVGhlIGZpcnN0IHBhdGNoIEkgY29tcGxldGVseSBmb3Jnb3QgdG8gYWRk
IHRoZQ0KZGV2aWNldHJlZSBtYWlsaW5nIGxpc3QgYW5kIHJldmlld2Vycy4gVGhlbiwgSSBoYWQg
c29tZSBpc3N1ZXMgaW4NCnN1YnNjcmliaW5nIG15IHdvcmtpbmcgZW1haWwgd2l0aCB0aGUgYWxz
YSBtYWlsaW5nIGxpc3QgdGhhdCBnb3QgZml4ZWQNCnRoaXMgbW9ybmluZy4gRWl0aGVyIHdheSwg
aXQgd2FzIG15IG1lc3MgYW5kIEkgYXBvbG9naXplIGZvciB0aGUgbm9pc2UuDQpJdCdzIGFsbCB0
aGUgc2FtZSB2MSBwYXRjaCAoSSBzaG91bGQgcHJvYmFibHkgaGF2ZSB1c2VkIFJFU0VORCkuDQoN
Ck51bm8gU8OhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
