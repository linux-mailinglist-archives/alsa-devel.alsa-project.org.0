Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195491AF848
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1B7844;
	Sun, 19 Apr 2020 09:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1B7844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282271;
	bh=tf6k8UiUF91tEeL+ESgwJkofkGNXgeST1Y9hoH8EFIk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YIBJdifcU7pM6PN+W5Q9LgSMY3D6eQYRn1IwvMVI62ytPO1QEnGCAz7i8hVFQLqbU
	 dzif1wBXRRRwlWyX7MnDrb660TeoJWroaSmRCX2v9BwSCNE3hm4wNRHgJ4HLIKCloH
	 F52UdMKc2/F1v2SXwt3RwhWendJWb5oQKxMHSHHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 091B6F802DD;
	Sun, 19 Apr 2020 09:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B17F8014E; Sun, 19 Apr 2020 00:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2104.outbound.protection.outlook.com [40.107.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F344F80122
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F344F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hammerspace.com header.i=@hammerspace.com
 header.b="YtCz3A71"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaU1rtw5UIeMsemTjUJGal3pMDL2sD1lxwdCgk7YlRB3ktqU8og9OoU+gr2h+Km8otKXEU2Th11hhyST3an9U9kDENznQIboDEfURYpY28fbb9UC8YYMOEZaEpNp9fA5mdBBTivHFd++VnGigFiK3UXI0Ur4t99V3BID4xK9IvqvWvAcLScuZ7KlJ2OIuZSndjLPbLIfwf42HWoeIO5rvnPSl3gZJb/XCZc8IhwQEdQIANOKZiFtyfck5WoGOAVLuLPECu3UgT/pl99QeT6ysIj4jdiievB9Ky11wLIduOKY7XIWxJlQScQUCrlG9CnlF1xNLv+ZR1ce5Z+0ibeL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf6k8UiUF91tEeL+ESgwJkofkGNXgeST1Y9hoH8EFIk=;
 b=HCzQVki/zspOyF3Rw7yl/8+6bgUfYAPBqjCBzLnqStDKwMVVEb/wAN6zqEhYfdR51mEx18OEefKFLEeK/6XVWyFctifMRjj7AHTdTnIQSHZFnEHqPHqtvsGPJgug3U2EEMuJbet8AOuZCpbfmoW3eY1pEglLOb4W/Ki/FUhm3/lUgutOX9a/aOERgZs13Q2VJHd+xeJlOewSzr6xhzbxzjwkBlOqNOeNCR5duAOrcDyR2QNk80clWDylrh3caH46zGSxXMs1TSmsmguDE4VT9//kmzMxprVzQDrMF0b3kRhzRQJFylMAU6L0y2T4mAckM2yZSEvcR9DGpO6lQWJdNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf6k8UiUF91tEeL+ESgwJkofkGNXgeST1Y9hoH8EFIk=;
 b=YtCz3A71P0PlpBXlmhNnc4INAkTEhXHkJUdCf/Xu42nz5/XBec9BCvZX+VeCmWmJaMhX4Mqyz+R5xE4Tiu0wYVUVbFU7nuYIs2MgqG1htAgYsP3BAnZdQRv/JXAKMXnJHktv6nDlNHyvPmDNkrS+rUtZFTtgu6y47nTkUO9vYYM=
Received: from CH2PR13MB3398.namprd13.prod.outlook.com (2603:10b6:610:2a::33)
 by CH2PR13MB3334.namprd13.prod.outlook.com (2603:10b6:610:21::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.6; Sat, 18 Apr
 2020 22:28:26 +0000
Received: from CH2PR13MB3398.namprd13.prod.outlook.com
 ([fe80::49f6:ce9b:9803:2493]) by CH2PR13MB3398.namprd13.prod.outlook.com
 ([fe80::49f6:ce9b:9803:2493%6]) with mapi id 15.20.2937.011; Sat, 18 Apr 2020
 22:28:26 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "rdunlap@infradead.org" <rdunlap@infradead.org>, "chuck.lever@oracle.com"
 <chuck.lever@oracle.com>
Subject: Re: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
Thread-Topic: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
Thread-Index: AQHWFbEP0e9587rMVEWxlvMyiTLI2qh/N8yAgAA+KYA=
Date: Sat, 18 Apr 2020 22:28:26 +0000
Message-ID: <d2e2f7967804446a825ec0ff61095e6640b5a968.camel@hammerspace.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-7-rdunlap@infradead.org>
 <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
In-Reply-To: <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87b62349-59c4-4528-827b-08d7e3e7d014
x-ms-traffictypediagnostic: CH2PR13MB3334:
x-microsoft-antispam-prvs: <CH2PR13MB33349235201C4669E7BCEEFEB8D60@CH2PR13MB3334.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0377802854
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR13MB3398.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(39830400003)(136003)(346002)(396003)(2616005)(186003)(8936002)(36756003)(5660300002)(71200400001)(53546011)(4326008)(6486002)(478600001)(2906002)(6506007)(66446008)(64756008)(66476007)(91956017)(76116006)(66556008)(66946007)(6512007)(7416002)(8676002)(54906003)(81156014)(86362001)(316002)(110136005)(26005)(32563001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pNCcbmGlBVYvw43dC1NQJFe3Mm3SE305pmt1weh7TuURiDiVAJBqbq6pcyE8648EF+lIlSONJXB+xxvPejNGgtwxF5xCzQ9FPP3CaCqFdCxlzyHohrltEPkpE98ubXdk03GLeHTy/0C2JysLNRfrJJvxPVuCyJ5IcRSaLOgK5LHZ3CiCjpYAjrjLuUvb4nZ08+0X0HHb7tHrGv7t/qU/t04Nu3zrgu6iFU3C7i2aJ66FSTCXtQP+V/TiVv3ncl/Ymp0GEbRcDsSLnypKJdDLTv6JKvIKQ2B/0/4le642eUMhJjgSTWpmahJbbziXpWuKcrCc/pU6m7rese/HFGhYlPrg+sT0ITFQ25GiyvqOmUDycImNhmDTjgLE8tLjsVg9nIzl7oxE8YZ+0ZnpHdNCPitMjunFMEmw5hcBRK90TSyx245koSwDlgbfAaAEMLRcfT8RNBSxM84SYQOu2ZDMIwNz2HL/QMJG5BVtFP2XHDbzACDtCdadn1hpesHhaj0z
x-ms-exchange-antispam-messagedata: H7EG29HdCK7hvq2QpFrcIdkVKyD+pRh1kxM8wFvvDcyhv0+Lr8hw/a10e1Lsk5FOfeOtfopIPJ73NZymS/e5aQjE7aqYbPx/8MRmSsNWPI87OuyEMXjt65cFRIwt9C1gkoi8r8L27y/rPolzDKu2rGDgWCXS7fbnPoHEmI7dPxTwGh1D2NI8qu8qq23Z+50N9gXC/gYE8jsInmc7qxzC9FcquDqphaIrwv+OF71FhPMwkJO8H0NPeAyzqYydemTMMMywi4yHha3IGJjZuEvt/ThpMF+iSuPNjNYuEHhGcWBpi+2P1figWROaASvmpI6krxQJdAFPyfHB6etNlPga5pk7+Rs1mjU+LaNBuFWKJaLEGZ1+zxOD6Tw7dS2zYjH7KpxAh0pYSBLcGpNGHFFCx/0l3Jj/6L/PV+XkzYCrIUTPH95vevmwDtePVtBdWe/GBI4+DoVPIrMWHldMlI0vSFxFNg8GdCPMf2MOp1Wx2c822j1ek57yE/Smc3wZ5qw+6IdnK0J3T6UbOWdA8grnVtKE+uAlyIy/LQAomtCFDWNCyioDBeWrx9EqSTi1csmBL83+APDZCRIAFVSAJfuBQhpsSpqWxyVrezCCasYH5wmUhDb9AcTcalI75LUyY0CpybB2QWgteXa6IExp3TloQYXNpVUXjjUB0cMsgmqfRRyPeuj2rCCu1o5b23hZU2CPO27yrgjPlfBuUdwwloQVa9bTVExlwM5DOEcIaHEaaaDX/YNyephOZ2PY6g04bFxYNkw6euva6uCcIdjQEIC5NahGgEowrwa1EQ86widYWGQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <944F6214C5B1864FB8065FC3B4C133A1@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b62349-59c4-4528-827b-08d7e3e7d014
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2020 22:28:26.2491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yqju0mSsWyrnAZNi3JygvnuCUt3iUOsrwDgQ1ORbFHCk875fbJ1ECG8+xj6+x6ogbYQCnuPxH3wdpVQWrInflg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3334
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "zzy@zzywysm.com" <zzy@zzywysm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "dave.jiang@intel.com" <dave.jiang@intel.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
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

T24gU2F0LCAyMDIwLTA0LTE4IGF0IDE0OjQ1IC0wNDAwLCBDaHVjayBMZXZlciB3cm90ZToNCj4g
PiBPbiBBcHIgMTgsIDIwMjAsIGF0IDI6NDEgUE0sIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPg0KPiA+IHdyb3RlOg0KPiA+IA0KPiA+IEZpeCBnY2MgZW1wdHktYm9keSB3YXJu
aW5nIHdoZW4gLVdleHRyYSBpcyB1c2VkOg0KPiA+IA0KPiA+IC4uL2ZzL25mc2QvbmZzNHN0YXRl
LmM6Mzg5ODozOiB3YXJuaW5nOiBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1wdHkNCj4gPiBib2R5
IGluIGFuIOKAmGVsc2XigJkgc3RhdGVtZW50IFstV2VtcHR5LWJvZHldDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+ID4gQ2M6
IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4gPiBDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4gPiBDYzogIkouIEJy
dWNlIEZpZWxkcyIgPGJmaWVsZHNAZmllbGRzZXMub3JnPg0KPiA+IENjOiBDaHVjayBMZXZlciA8
Y2h1Y2subGV2ZXJAb3JhY2xlLmNvbT4NCj4gPiBDYzogbGludXgtbmZzQHZnZXIua2VybmVsLm9y
Zw0KPiANCj4gSSBoYXZlIGEgcGF0Y2ggaW4gbXkgcXVldWUgdGhhdCBhZGRyZXNzZXMgdGhpcyBw
YXJ0aWN1bGFyIHdhcm5pbmcsDQo+IGJ1dCB5b3VyIGNoYW5nZSB3b3JrcyBmb3IgbWUgdG9vLg0K
PiANCj4gQWNrZWQtYnk6IENodWNrIExldmVyIDxjaHVjay5sZXZlckBvcmFjbGUuY29tPg0KPiAN
Cj4gVW5sZXNzIEJydWNlIG9iamVjdHMuDQo+IA0KPiANCj4gPiAtLS0NCj4gPiBmcy9uZnNkL25m
czRzdGF0ZS5jIHwgICAgMyArKy0NCj4gPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gLS0tIGxpbnV4LW5leHQtMjAyMDA0MTcub3JpZy9m
cy9uZnNkL25mczRzdGF0ZS5jDQo+ID4gKysrIGxpbnV4LW5leHQtMjAyMDA0MTcvZnMvbmZzZC9u
ZnM0c3RhdGUuYw0KPiA+IEBAIC0zNCw2ICszNCw3IEBADQo+ID4gDQo+ID4gI2luY2x1ZGUgPGxp
bnV4L2ZpbGUuaD4NCj4gPiAjaW5jbHVkZSA8bGludXgvZnMuaD4NCj4gPiArI2luY2x1ZGUgPGxp
bnV4L2tlcm5lbC5oPg0KPiA+ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gI2luY2x1ZGUg
PGxpbnV4L25hbWVpLmg+DQo+ID4gI2luY2x1ZGUgPGxpbnV4L3N3YXAuaD4NCj4gPiBAQCAtMzg5
NSw3ICszODk2LDcgQEAgbmZzZDRfc2V0Y2xpZW50aWQoc3RydWN0IHN2Y19ycXN0ICpycXN0cA0K
PiA+IAkJY29weV9jbGlkKG5ldywgY29uZik7DQo+ID4gCQlnZW5fY29uZmlybShuZXcsIG5uKTsN
Cj4gPiAJfSBlbHNlIC8qIGNhc2UgNCAobmV3IGNsaWVudCkgb3IgY2FzZXMgMiwgMyAoY2xpZW50
IHJlYm9vdCk6ICovDQo+ID4gLQkJOw0KPiA+ICsJCWRvX2VtcHR5KCk7DQoNClVyZ2guLi4gVGhp
cyBpcyBqdXN0IGZvciBkb2N1bWVudGF0aW9uIHB1cnBvc2VzIGFueXdheSwgc28gd2h5IG5vdCBq
dXN0DQp0dXJuIGl0IGFsbCBpbnRvIGEgY29tbWVudCBieSBtb3ZpbmcgdGhlICdlbHNlJyBpbnRv
IHRoZSBjb21tZW50IGZpZWxkPw0KDQppLmUuDQoJfSAvKiBlbHNlIGNhc2UgNCAoLi4uLiAqLw0K
DQoJbmV3LT5jbF9taW5vcnZlcnNpb24gPSAwOw0KPiA+IAlnZW5fY2FsbGJhY2sobmV3LCBzZXRj
bGlkLCBycXN0cCk7DQo+ID4gCWFkZF90b191bmNvbmZpcm1lZChuZXcpOw0KPiANCj4gLS0NCj4g
Q2h1Y2sgTGV2ZXINCj4gDQo+IA0KDQotLSANClRyb25kIE15a2xlYnVzdA0KTGludXggTkZTIGNs
aWVudCBtYWludGFpbmVyLCBIYW1tZXJzcGFjZQ0KdHJvbmQubXlrbGVidXN0QGhhbW1lcnNwYWNl
LmNvbQ0KDQoNCg==
