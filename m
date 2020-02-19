Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BD164137
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 11:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420CF828;
	Wed, 19 Feb 2020 11:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420CF828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582106816;
	bh=ravth+LkyJ+fveKHVBQ+bL8eB7JFvMwxR0pIxhvVgvE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2s0ZDUyBRv388xHQmQiq4ziFWm1HPgtd1FkD5qgKfOIbNF4nVJhl5tBxiQO7wk1a
	 A8i7TzURj5t3GE0O6MQ7uOza8cwiTHkrH4sCfla1BlKOGegO4i4x/z7h/nL+ggeam0
	 AUg5fJeZgPY4XmZJzWl2MgfsM54tVMP3Hr3vtcJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63783F8015E;
	Wed, 19 Feb 2020 11:05:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACD07F80172; Wed, 19 Feb 2020 11:05:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D0B2F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 11:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0B2F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="pIkSmqtU"
Received: from [100.113.6.75] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 43/CE-62111-4580D4E5;
 Wed, 19 Feb 2020 10:05:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDJsWRWlGSWpSXmKPExsWSoc9lrhvC4Rt
 ncGSmhMWVi4eYLNY0dzBZTH34hM3ixOFGZotvV4Dcy7vmsFns+LeJzeLX/2dMFvc2PGO2uLvu
 L4vFhu9rGR24PTZ8bmLz2DnrLrvHgk2lHov3vGTy2LSqk81j3slAj/VbrrJ4fN4kF8ARxZqZl
 5RfkcCa8fjPCvaC6QIVH+9fZWpg/MPfxcjFwSiwlFlic9sjRgjnGIvE7uNzmSCczYwSv3t/sn
 UxcnKwCJxglti13RQkISQwgUlicsduJgjnLqPEthuLWECq2AQsJCafeMAGkhAROMMocfvUSxY
 Qh1lgBbPE9FPtQA4Hh7BAsMTEFRwgDSICIRL/pjczQdj5EtMeHWSBWKcqsfPTYjCbVyBWYm3j
 d6ht+1glNjQvA2vgFIiTuHvjA9h9jAKyEl8aVzOD2MwC4hK3nswHq5EQEJBYsuc8M4QtKvHy8
 T9WiPpUiZNNNxgh4joSZ68/gbIVJfacWwjVKytxaX43VNxXYl7rajYIW0via88ZFgjbQmJJdy
 vYXxICKhL/DlVChHMkDu1cBtWqJnHjTQfUCTISMz69hxr/g1li3uvgCYwGs5BcPQtoErOApsT
 6XfoQYUWJKd0P2WeBQ0JQ4uTMJywLGFlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmugamZrqJVbp
 Jumlluomp+aVFCUCZfUSy4v1iitzk3NS9PJSSzYxApNgSiHL/x2MW9a+1zvEKMnBpCTKa8nsG
 yfEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvcxK1BOsCg1PbUiLTMHmJBh0hIcPEoivJm/feKEeI
 sLEnOLM9MhUqcYjTkmvJy7iJnjyNyli5iFWPLy81KlxHnXsgFNEgApzSjNgxsEyxSXGGWlhHk
 ZGRgYhHgKUotyM0tQ5V8xinMwKgnz7mAHmsKTmVcCt+8V0ClMQKe8FwY7pSQRISXVwORRfJrb
 LffYn3q3dQnOSjs7aybK/1yfcPiLic6mJaVJ9/hyNG7l1p60mLTe/YpjfcXX+H2VrW3Pt4bUz
 XU8uauEty9DpoB3ubyp/ixZL+YfD89lXbu4Irvz8Sv1iU+eH31pYmF35sgFtv0/l1xqOPouqz
 2oxnn/x4/a0eGcmSZZ5RO2Hku+tyRh46OeX+Hfdp7l2fS8bGLLO08NKSnzffETGra7ZBV0vbz
 8f+KnAMtIgyrmdRdcpDkWCm/8cyhsy4935fPm8R+/Fcqms/DT9VjrN9Ja5dOv5hSWbv/mYzVZ
 29T1RGyrcyKvkG+ko7G68JagzzHWp01CnPfkBwXNvaqx0/jbnH3KnjZK5U2z2pVYijMSDbWYi
 4oTAS8HrMuPBAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-239.messagelabs.com!1582106707!2307183!1
X-Originating-IP: [104.47.10.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5845 invoked from network); 19 Feb 2020 10:05:08 -0000
Received: from mail-db5eur03lp2055.outbound.protection.outlook.com (HELO
 EUR03-DB5-obe.outbound.protection.outlook.com) (104.47.10.55)
 by server-3.tower-239.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Feb 2020 10:05:08 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbeYvTelu8NtpIZ0aD3Cvr+k2sBQ8IEfhQZeBUPeFfCEiW2uk5ZPdHEW1gp8d5Tda1ureh1uHqVG4XzK+jCWBBRv1lsUQQGVv04ySKIh1ycLnosSMZZ0AsyemxbGaWy3iDPT6kBIE8vqVcu8ohSTPNautEjX1BKWbhXG3vYZUenTmedy5Tol2n8O5ashw1VKtj83Te1BsbEw4nnlS/aASrJHXh+EG3m39e5DIOKbxFBTtbeDOFGtc6M8utNjug3gMIg+m8PxVNKA+ImDoSVagP1tvSF1qI/sfz73XLe2Fv0ORCS7koQ1+FAeQ2ktlIyWDIaIG5Qqb/RrPjtszPkyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ravth+LkyJ+fveKHVBQ+bL8eB7JFvMwxR0pIxhvVgvE=;
 b=FRHLa6V3Guoi9vuaKvW2n9iq1wP6+cXLgDp3ydVLQ8/RGcr41/XuspPBIEnaAGXIfEibXojLDHXEN30fAf3lT3PpBWtHGaNRV8P3+9A7/1cPw1GYOYWAWfx5NmOcmDncvoRf7Iz+jhxodwKGNNj8klX/YiWYlQ/PzmXgUtijaOy2t+cqDmh3AG/FoIdTa1wSPeLyWkFbQAuKamVtRYeHx67zuOCFU/VJbPAvViR4kpDVKScga4OlD8Lz70tXUko51mifu2LGZbxuyOSKsuFXPukB3KETnbegYDJOYvGbYPw5VIn4A59rpCu198moEfAR9NpmRUUkysIC96JYWvdWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ravth+LkyJ+fveKHVBQ+bL8eB7JFvMwxR0pIxhvVgvE=;
 b=pIkSmqtUGLiz9rCxRVvPKrIvkn0uodPxEt9iH6w0CkoTmpyptiEURguSSQyQsJ42NLZpIpt1zzl6mAvdGoQR1vaQPRtl2T7/uCA7ZDz6kkrYAGTcrFIEdUlflNF8yt/VIrCAPmqYmy1aLtFN7hQeiY3j8sqLfylpecp+AUQ4zVg=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB3432.EURPRD10.PROD.OUTLOOK.COM (10.255.34.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Wed, 19 Feb 2020 10:05:04 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::993f:cdb5:bb05:b01%7]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 10:05:04 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: "Lu, Brent" <brent.lu@intel.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>
Subject: RE: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
Thread-Topic: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
Thread-Index: AQHV3+t05QGFzNuez06VZ5VdF8K2kqgUfAmAgAFKeYCAAGrTgIAARPoAgAAJp4CAAAclgIAAAzgAgADQubCACrf3gIAAPT6g
Date: Wed, 19 Feb 2020 10:05:04 +0000
Message-ID: <AM6PR10MB2263A832CF4B0947091A0DB380100@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
 <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
 <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
 <2eeca7fe-aec9-c680-5d61-930de18b952b@linux.intel.com>
 <CAFQqKeXK3OG7KXaHGUuC75sxWrdf11xJooC7XsDCOyd6KUgPTQ@mail.gmail.com>
 <c9dbcdd8-b943-94a6-581f-7bbebe8c6d25@linux.intel.com>
 <AM6PR10MB22630C79D08CE74878A6A096801B0@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB2670FA720AB341183478A00B97100@SN6PR11MB2670.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB2670FA720AB341183478A00B97100@SN6PR11MB2670.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0e90fd2-4250-4428-eb60-08d7b52330bb
x-ms-traffictypediagnostic: AM6PR10MB3432:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB34320B988377E57B471699FBA7100@AM6PR10MB3432.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(189003)(81156014)(86362001)(53546011)(55016002)(26005)(6506007)(7416002)(9686003)(71200400001)(110136005)(5660300002)(81166006)(498600001)(186003)(8676002)(54906003)(8936002)(2906002)(55236004)(4326008)(76116006)(52536014)(66556008)(66446008)(64756008)(66476007)(33656002)(66946007)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR10MB3432;
 H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ni4udFefZWMiaXa71/ntN6w6EQtSRsUuqyx6ixZihVCvjC/9zPWzdq2UzA463oyRCWIxVv67sX+Y72hC7shmScnMxgx0ilST4pE7BE8295cqLnepBsAzYBkplWsKPV8f84NtnuQgtVPyhjOIlveC7xWyG9GPdziCqaBMItoeups12bLry6hQ8FWmhYYd+4jI5wHH9LzoFcc+p3VOOkTr2uBEqnAMY23ScslLmq4d8ATXX7Kp19d63CSWXXh08Za2I1WMyiM9ULMH7Vqj7cnURNrEi3PXsFPR94Qyg+gwyX0UrvA1cMtTiKLOZHTriM04AiKtmOKG1QSXR25Mg4UdukQPX56O7CNZ4s+bz8RojPrqtGVAm6M35tzBeh3atfFCY/GIRmwiaNiuekRHWOU0esifaymX/bpnkemA3VLbGByoop3i+UE1tYD30cheIWDd
x-ms-exchange-antispam-messagedata: UgDodlp0h4nGNZM2bwpAaJVqUUjYo2uE9VtFClcJUberNq5sBsMIWLdIbkichxKdXj3K3+lwqBJyMgrWriGyZRwSJQVzUNl5q1siK1FkLTU8Y650Jr1QF5ixZt4mECpIJ5GGWlM34yBQJTEuSkhgSg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e90fd2-4250-4428-eb60-08d7b52330bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 10:05:04.1349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpySvhoH9Feur8kw1Xw+DSYMchqyXatiiiyQuqnEd4UW/aSDVrbPWpxurxxm1G4d/AM4Kfsvu5PzNK4A4nnxKHmJvEg6/Aosxw2R2O6SIqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3432
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "cychiang@google.com" <cychiang@google.com>
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

T24gMTkgRmVicnVhcnkgMjAyMCAwNTo1NywgTHUsIEJyZW50IHdyb3RlOg0KDQo+ID4gQW0gbm90
IGdvaW5nIHRvIG1ha2UgbXlzZWxmIHBvcHVsYXIgaGVyZS4gSXQncyBNQ0xLIGFuZCBGU1lOQyAo
b3IgV0NMSyBhcw0KPiA+IGl0J3MgdGVybWVkIGZvciBvdXIgZGV2aWNlKSB0aGF0IGlzIHJlcXVp
cmVkIGZvciBTUk0gdG8gbG9jayBpbiB0aGUgUExMLg0KPiA+DQo+ID4gU28gZmFyIEkndmUgbm90
IGZvdW5kIGEgd2F5IGluIHRoZSBjb2RlYyBkcml2ZXIgdG8gYmUgYWJsZSB0byBnZXQgYXJvdW5k
IHRoaXMuDQo+ID4gSSBzcGVudCBhIHZlcnkgbG9uZyB0aW1lIHdpdGggU2F0aHlhIGluIHRoZSBl
YXJseSBkYXlzIChBcG9sbG8gTGFrZSkgbG9va2luZyBhdA0KPiA+IG9wdGlvbnMgYnV0IG5vdGhp
bmcgd291bGQgZml0IHdoaWNoIGlzIHdoeSBJIGhhdmUgdGhlIHNvbHV0aW9uIHRoYXQncyBpbiBw
bGFjZQ0KPiA+IHJpZ2h0IG5vdy4gV2UgY291bGQgcHJvYmFibHkgcmVkdWNlIHRoZSBudW1iZXIg
b2YgcmVjaGVja3MgYmVmb3JlDQo+ID4gdGltZW91dCBpbiB0aGUgZHJpdmVyIGJ1dCB0aGF0J3Mg
cmVhbGx5IGp1c3QgcGFwZXJpbmcgb3ZlciB0aGUgY3JhY2sgYW5kIHRoZXJlJ3MNCj4gPiBzdGls
bCB0aGUgcG9zc2liaWxpdHkgb2Ygbm9pc2UgbGF0ZXIgd2hlbiBTUk0gZmluYWxseSBkb2VzIGxv
Y2suDQo+IA0KPiBIaSBBZGFtLA0KPiANCj4gRm9yIEdvb2dsZSBDVFMgcmVxdWlyZW1lbnQgKDIw
MG1zIGNvbGQgb3V0cHV0IGxhdGVuY3kpLCB3ZSBwbGFuIHRvIHVwbG9hZCBhDQo+IHBhdGNoIHdo
aWNoIHJlZHVjZXMgdGhlIHJlY2hlY2sgbnVtYmVyIHRvIDQgYW5kIGludGVydmFsIHRvIDIwbXMg
c28gdGhlIHRvdGFsDQo+IGRlbGF5IGhlcmUgd291bGQgYmUgODBtcyBmb3Igb3VyIHBsYXRmb3Jt
LiBXZSB0aGluayB0aGUgdGltZSBpcyBzdGlsbCBzdWZmaWNpZW50DQo+IGZvciBvdGhlciBwbGF0
Zm9ybXMgdG8gZ2VuZXJhdGUgYSBzdGFibGUgV0NMSyBhbmQgZm9yIHRoZSBjb2RlYyBTUk0gdG8g
bG9jayBidXQNCj4gc3RpbGwgbmVlZHMgeW91ciBjb25maXJtYXRpb24uIEhvdyBkbyB5b3UgdGhp
bms/DQoNCkhpIEJyZW50LA0KDQpJJ20gY29uY2VybmVkIHRoYXQganVzdCBzZXR0aW5nIGEgdGlt
ZW91dCB0byBzdWl0IHRoZSBHb29nbGUgQ1RTIHJlcXVpcmVtZW50DQppc24ndCBuZWNlc3Nhcmls
eSBzdWl0YWJsZSBmb3IgYWxsIHRhcmdldHMsIGFuZCB0aGlzIGRvZXNuJ3QgYWN0dWFsbHkgZml4
IHRoZQ0KcmVhbCBwcm9ibGVtIGhlcmUuDQoNCkhvdyBsb25nIGRvIHlvdSBkZXRlcm1pbmUgcGxh
dGZvcm1zIHdpbGwgdGFrZSB0byBnZW5lcmF0ZSBhIHN0YWJsZSBXQ0xLPyBEbyB3ZQ0KaGF2ZSBh
biBpZGVhIG9mIGhvdyBsb25nIHRoYXQgbWlnaHQgYmUgaW4gYSB3b3JzdCBjYXNlIHNjZW5hcmlv
PyBJZiBzbyB0aGVuIHdlDQpjYW4gbG9vayBhdCBhZGp1c3RpbmcgdGhpcyBkb3duLCBidXQgSSdk
IGxpa2UgdG8gYmUgY2xlYXIuDQoNCj4gDQo+IA0KPiBSZWdhcmRzLA0KPiBCcmVudA0K
