Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D4343448A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 07:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58691694;
	Wed, 20 Oct 2021 07:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58691694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634706640;
	bh=v8BuhoYgCtLvoyN0L57CE7h6N0xufpinf/UrKHJxhME=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RKeVaLLjT6kJ+im1IiYZe2ldjC4h3eKPwUD8GLqV910MFycPyBY+VlwLzzFDkfQye
	 dp/wtILl2lltxf4Nf6hciDHxBS3e3yhBsNH8iUC+RxRX2iZOLAGa46E3N80xLTneyD
	 HFRKgv3hoE6+i7XDKY5Ev3z+UB65LYtSc6+bXAeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD0DF80155;
	Wed, 20 Oct 2021 07:09:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADDE4F80253; Wed, 20 Oct 2021 07:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2090.outbound.protection.outlook.com [40.107.236.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90748F80224
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 07:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90748F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="eBDAgc89"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RheUNrGdaq5hevBk4aEzAeVCew77JY6+u13kM5GFvX+vByR45qCX7Gg/8NuWUuI8GxPq2aFxVai9ylMJChB7h5q8Fse9KqmWHoHB7JySsHQ1hqoOpnmr1mV8Q6p9R8PEPohU2TE1xRVdXdTQbfDcs0HXIpprV92Cfjd09b9LoE696slydP4i7LltkWQaMWCEYeGnghEqLsK7AWKWQ2eRxzA9nG3QYevFJ0HNpzaBt87djiJOZZWUWcMeoS21P871wQX/P+oVmy8QSxXFIIm1OYf1k4cG8C2OUyQEDrqusQes8UpLOWzr4Ses0RzHbwwwx+5UC9QTwNqcCDFrhkGfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8BuhoYgCtLvoyN0L57CE7h6N0xufpinf/UrKHJxhME=;
 b=jMfi5Tt8unid4wXwxkiJ8UM/+OOttFwGHDndSwbAxAyfe5qnyN9FCbx/Mt3U1Z5G7JFlLa0VU++PcWTmbIw9EdYJjRtHJwIbwlO2RDp9YArjH8A9zFSdSDagPa3pRAG99a0MQ3bp7pav3iwDQMMtbBqGLyUOnK9AS1dCvqmpi6+z2mmaNST9d7oCtNN9z6WYLlGgCvUoQ/EJVcbyQ+xAcglEWfkhvHJQjfU0oQQx2YNnZEBonEnLJW8GI4cdiG1qSfuOZzxaUbE+tS6rCYm2VzGCstTvAd5TopLzt2RIkOQYcvE9Ik2JbYErfD7o4Q7L8bZ2UKEuJyr2XsjUgO0BkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8BuhoYgCtLvoyN0L57CE7h6N0xufpinf/UrKHJxhME=;
 b=eBDAgc89rHTKShHNw00osIgUo4q2IwUgKcw7ACsaf/Z+N8kPFsfB/9v6yXplRu25uf+sPYdT4Y3fBmASJ5yAOPGHh8WOmnmLIkokZJAZmWutFEYdIxj5ZdHmFjkcoDGNV+DedWra40Br93HN+oH03udQjTJsGHW/ZprVgnYHRBk=
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 20 Oct
 2021 05:09:11 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 05:09:11 +0000
From: George Song <George.Song@maximintegrated.com>
To: Randy Dunlap <rdunlap@infradead.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [EXTERNAL] Re: [v4] ASoC: max98520: add max98520 audio amplifier
 driver
Thread-Topic: [EXTERNAL] Re: [v4] ASoC: max98520: add max98520 audio amplifier
 driver
Thread-Index: AQHXxMZJ/DXqVgDAh0ytNaangbnP9qvauf6AgACdY2A=
Date: Wed, 20 Oct 2021 05:09:10 +0000
Message-ID: <BYAPR11MB3671C594AC086CCAC41CB1BFF4BE9@BYAPR11MB3671.namprd11.prod.outlook.com>
References: <20211019084914.14622-1-george.song@maximintegrated.com>
 <6c6d2ea5-e138-960b-bb83-fadf5c2996f7@infradead.org>
In-Reply-To: <6c6d2ea5-e138-960b-bb83-fadf5c2996f7@infradead.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec2646c2-09db-46cb-0909-08d99387c0a2
x-ms-traffictypediagnostic: BYAPR11MB3606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB36065694DBB80ECC4BC97AD6F4BE9@BYAPR11MB3606.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wgNSdIrh3w5lf4g66H5ajHDNvvmbY8CbKv1S9zUBjq095WBCCpHf8GzRBCclfSSQEejUvqr84XLKsWY6mrHY/VM3UpgpnRQzul4WlXQTWzxFWzaM3bh744L460klBjXIW9fsbKBcZmVtJg4UzizQHsysjPq+43HRujQnEKb6/46syUbVVjUTdQKTMTokUaOKkGvkjxaSz6HDzV75cUtyK4CIrFveDL+rLD3G2H+tDNG18whPAbgoo+InweqA7Vr2VNW+HjeOkWeW/op1QKL55KC8LQYYtooo+Zf8sbnKaC+4MQ6L4V2os6EvbveIj0r1m+gK5dfz0SQ7MlQ9GZKy9/gyjDQ9r7d/iTjtsy+YUfk6mzUzIJQzaSoepIXfMO9kubSSnnTP1MaZqRvEo6KB/vH1Gsdo6TpMylPhZvupq7t0nz9w08HnuRoupzO9q7O68TYz2OEVFmHYSFbxVzlrLedBoh80qnRG0ALWVxqxBleCj2Afl0Xu2JPZJzbYSpzd5xIHMnm8mc+Hzd9A7MPR2QQEqoqAdQwGGf2BRQCRPxwxR6t2P0PhjcCqcvYR/9EZnkAUqJNzLeLG5gXHaPuRC2Fc38zKlvXWy9sTsAHFApo7Uj0OfKykYXRRMPDu2NyuyvBAVLnpIsyXW1hJljfFvqzHLJZuYctgOXEghvZ9vJLxNFwBn2GoZ3iPSPsHec6Qx7rQQoFJAWfOadEhTldY+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(107886003)(9686003)(66476007)(8936002)(8676002)(4326008)(55016002)(6506007)(64756008)(7696005)(26005)(66556008)(186003)(38100700002)(316002)(110136005)(76116006)(38070700005)(66446008)(71200400001)(33656002)(54906003)(4744005)(66946007)(86362001)(5660300002)(52536014)(2906002)(122000001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K01jaTJ6SU1uWElKMVlkaU9POWxBZXA4NzY4QjJ1TEI3NldCQU1pcHRFcFpY?=
 =?utf-8?B?MnJ6S09Jc1FBMHRmU2VsMG5ORmRuNmNZUWx6aVQrMm5HY1FBcjZnV3Q4Rzlz?=
 =?utf-8?B?bm9TamQyNHB6NFpPUFExTDZjZm5KWTRya0dmeGFrOEppKzA0SVlVaXBiS05X?=
 =?utf-8?B?bTl5UFAvOWpGdExZQnlrOWNKZkhtd215UXhTbWVrbnpnK1lWbjBtYTlzdk80?=
 =?utf-8?B?bnArUWY3aXYzMWpET0EzUjBnM29IeEpLbzB3QmMvSkhJOXcrUEJzUVZ3Z2Nq?=
 =?utf-8?B?Q2JVWVdrSVlLcW9xSEplN3BHRXRGQlkxaTNZY1E3SVM3T2c1UHBGZWk3RDB1?=
 =?utf-8?B?QThhNUd6aFMrN21JYzB3YXFCYWl0enpkM1FsaENxdzBnQU5jYytpdHpyTkxU?=
 =?utf-8?B?bThwYmlNNzNRd25EeG9pZmFzUCtBdCsydVE0THpscUpDNXV5MmJVOHVJR3pS?=
 =?utf-8?B?QUZlaWg4Qjh3RkNReVFRYWdvbk1RUVUyOWxqaWpIRVRQRndLZEZiM245L1gz?=
 =?utf-8?B?MERXemlNU0RhZCtab2pXdjZoSTBIbXlhcUI2T05NRU5meWozZWd4R3poVGJy?=
 =?utf-8?B?blpXd0hIMzlNN0s5OUpnSk9wSnVoaFlWaXhnaXVVU1Jnekp3VzYyYlg1RDI2?=
 =?utf-8?B?VSsxWGE0Y2ZXS1NTQWpCdWhzYWJzd25zUUM5WEtoQ05JTm16eGlFK2k1RTlV?=
 =?utf-8?B?bEZmc20rRVRwMFVqSDlxd25vUW8yRkZxK0toVCthOFBsSTRidDZzckNzOUxM?=
 =?utf-8?B?ais3WlRoRnprcWpEVzdpRzZNbXlGb2FtOElHZlBwdFhsVnU5SVpWWWFRV0hF?=
 =?utf-8?B?eUh6TmZ2WjRsaGkzOEx3dzhPeXF6QVVYZUNkeS9KSERnNFlVd3IvdERCdmxC?=
 =?utf-8?B?aVBrTUNpOFhzTG5sdEU2anFXS015cmxsY2tYNDJYZktmeXhIdjhnNU5UMEEz?=
 =?utf-8?B?eFZNZWxPYzdYbWVTU3R6YlVreE9LQjBlOXlxa2swTE1ZbU4zaTJ4UWNMWXVQ?=
 =?utf-8?B?NXNpdVM1WEM0UWdINDBvSEx4cW5Peld1VklvRmNlc0VSWW1taEFxQ3JjZktR?=
 =?utf-8?B?TjhPTStZVSsraTQ0RTBKc2J2YUFxeDFucTRoa3dPak1YdDR5cEx3dzlVUUxw?=
 =?utf-8?B?aC9CR2FHSHp5em5PQUI4UmlESjB1M2JYekt1S3NSQW11QU1MRjhBaGl0emVZ?=
 =?utf-8?B?a2FsZ1gvLzBjbnAyb29nd1BMY2kycXA3TDZ3Q3QrS2FFTTNUQ1hDdkNIWmRZ?=
 =?utf-8?B?TlFiUVI3aURpRXloUTRUeUh5bnUzTk51VU5FSHhoTlJBaUZhZktaOWdWK2ti?=
 =?utf-8?B?YURMRW9zcGYxZzBnamsycmZYOEdEVk52UzIvUVRITzRVcURoSkhnWEc1SVJB?=
 =?utf-8?B?WEVKT2xsMFVUanRPejVxaE1UU2Q1L09EVUxkSU5MZHhZdWtCRXNraFRhTWxu?=
 =?utf-8?B?d0ovVU5FWmFDSGRsSis1WjRWRjZXMFYwL1h3NXgzclFZbldiVDVlaU14ZnJs?=
 =?utf-8?B?cVl0amFDSzFLdEFzdVlaL3lZMWgxVnF0eWJKbXJTM1JzMTZxeldFVkoyVUVM?=
 =?utf-8?B?bU5TQjJmUzlMTjNKRUxLaXp5RDZUYmlEZ05xeHlkaytyOGttaTlMVUFWRzZF?=
 =?utf-8?B?NjlWcHl5MEhub2c3MVovNXg2Z2RRYTk5TitiL2pXTHZYR1Q3a0g2Mjd4eVVU?=
 =?utf-8?B?V3dUNWxkL21IR0s1SElIVEFFdllDY0J0RHorelYyQ215UUc5V3VTaGhzMVBk?=
 =?utf-8?Q?nVgKQOyeHR3CXfvOS5dbZliEtZ77aG9PcSUs/OX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2646c2-09db-46cb-0909-08d99387c0a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 05:09:10.9639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4bjE751yRoqAbrwcRrQavsr/HFk7x4Qk97sNgAwTeOD/f4aIr/as6O1Y8II5mynRHKzUEp8RuSSqcnzeRSpxyeaM+l7fjcf89U7MnE8jFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Steve Lee <SteveS.Lee@maximintegrated.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "george.song@analog.com" <george.song@analog.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

PiBPbiAxMC8xOS8yMSAxOjQ5IEFNLCBHZW9yZ2UgU29uZyB3cm90ZToNCj4gPiArY29uZmlnIFNO
RF9TT0NfTUFYOTg1MjANCj4gPiArICAgICB0cmlzdGF0ZSAiTWF4aW0gSW50ZWdyYXRlZCBNQVg5
ODUyMCBTcGVha2VyIEFtcGxpZmllciINCj4gPiArICAgICBkZXBlbmRzIG9uIEkyQw0KPiA+ICsg
ICAgIGhlbHANCj4gPiArICAgICAgIEVuYWJsZSBzdXBwb3J0IGZvciBNYXhpbSBJbnRlZ3JhdGVk
IE1BWDk4NTIwIGF1ZGlvDQo+ID4gKyAgICAgICBhbXBsaWZpZXIsIHdoaWNoIGltcGxlbWVudHMg
YSB0cmlwbGVyIGNoYXJnZSBwdW1wDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5eXl5eXl4gY29ycmVjdCBvciB0eXBvPw0KSXRgcyBjb3JyZWN0IGJ5IG91
ciBkYXRhc2hlZXQgZGVzY3JpcHRpb24uDQo+IA0KPiA+ICsgICAgICAgYmFzZWQgYm9vc3QgY29u
dmVydGVyIGFuZCBzdXBwb3J0IHNhbXBsZSByYXRlcyBvZg0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3VwcG9ydHMNCkl0IHdpbGwgYmUgbW9kaWZpZWQgdG8gJ3N1
cHBvcnRzJyBzdHJpbmcuDQo+IA0KPiA+ICsgICAgICAgOEtIeiB0byAxOTJLSHouDQo+IA0KPiAN
Cj4gLS0NCj4gflJhbmR5DQo=
