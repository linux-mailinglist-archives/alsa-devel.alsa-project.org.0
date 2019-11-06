Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0DF2249
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 00:06:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F19631669;
	Thu,  7 Nov 2019 00:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F19631669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573081589;
	bh=6KyflWJgdb6yLMvjiaNwN5/GDsRWq8Ju/7dvp3+PVv4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JaIT8XASqkcCqQDMbz1GHjWXtWM4wYzqBgMZFuoHQ46JmK+8lp6QMW1VDUyY0ncWA
	 AxJ978Rp206nmrFCyDNGP21/MAxwccO3LBMqQZX38YWVLzvz7PUKGEhg7iK3fUuJ0m
	 TcBNkPVMHlCWQ7xbb94tO9AwwHphSEox3y94yVgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42AF4F8045F;
	Thu,  7 Nov 2019 00:04:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AD58F803D0; Thu,  7 Nov 2019 00:04:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA598F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 00:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA598F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="egpPzqAT"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="gY9eXOtp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6N4Usa028169; Wed, 6 Nov 2019 17:04:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=PODMain02222019;
 bh=Gs6xCBbzOnKCXbor/8GocfGWM6b8vD+qt8yMYLLg3I0=;
 b=egpPzqATVkO3T6vA1y+YMbtmGyYepEe0033dmeGDTegoAipSwKGNF6bj9dvewKo0l3ef
 kNnEw+WJwOTs8O6gg6FEiI6DRYGLvTWjMSH9CPHJlNDWh2cPTahPFNzUs6HUXq96FY6A
 r9VlACVi3WOppkQ6FtY0lBhl4oB4IgMyeVJxwlKXyazvzn3zwESRUtp5YK30KqXIKqOS
 yiS5etveOHa+W364YNXyU69AoN6YK5X5Hdv/RSmBXlG0eLoxexI123bPld5jzMJnYPrb
 am8db/BdVyEkjEIwtVq5hNItU2JDGlA+bizeyVHGvJ8QehrwOydx6XDmDanTpfR5olbo bA== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=David.Rhodes@cirrus.com
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2054.outbound.protection.outlook.com [104.47.40.54])
 by mx0a-001ae601.pphosted.com with ESMTP id 2w41w68f0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 17:04:30 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLmE8wtuhS1ud6IxNsKHGPIEfwYPkmExyNQiQKauHdNTnKusWypjrU89niP5Lf8p5C44pzDVWusIDnMwV9m1+J1ZS6yWsO/eptVij9Pba8hoStCb8Z5DR0GbIBbyvdFjwC3ZSgZBGoiK7bxvkNtc4NLP/g8agAThJxWjWDpfX7JXIhX8TFboOR7gdVRHbCb9Ig2Aeseb+nsCsCDzQm0lmNPhLTVyLAVZIytZlnLqnHw/2DuhVJ+jpSVUm/wDe1BH+ujN3HfhLmXCKVpS7pGxeuL5sqZhzBROneqImnGAFyHrVN1ObCZORMjjDqKJqcnAnmEroDNGYSOZwg2gygNhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs6xCBbzOnKCXbor/8GocfGWM6b8vD+qt8yMYLLg3I0=;
 b=TUxZH0arHqvk3/yYN7+xDneNZzrBoadYT+mgWB0nxr0CCltrRMzndxIj7QnYyXdNR5zcMWfChwT17O+5ps5n4UdlbGyqmvN2ipR90L2Z64O82yuZ8DLYSufq7H/rvGmvhNJKYK4ZmaP+T+A9vZUHn4DRSCcoA0zG1hbLsXKiStY8uaUBE8Nx4dirI86ciTmcnqgTDmIIS4A0knVXUWQ7ZadS2pUazQSvAahBIJEYoTYPF+qXcov4Zpj2goI4OQUcuEszXB0dz45GVVQ28yhXmXSreR6xgg+CHKMowYvchMUkrszYd6+LkNulCEGM0XfQK8STWrk8QKODUkoFh+S8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gs6xCBbzOnKCXbor/8GocfGWM6b8vD+qt8yMYLLg3I0=;
 b=gY9eXOtpFbOfZdv6ldQTsKMVWYYrvvNbO0Bzbrsi72xPYP3igzhyR8y7/7B+DVlqeNVbwMhHO/qJ4ssB/bTTWoREHoQGF+9aCp7lWZ+UaSclMdUP+u6tmebnF+PNvmZJ5XxJjebH3/RX/Cr7RN++HuOTG69gK8WUuzmP9brbK6s=
Received: from SN6PR1901MB2046.namprd19.prod.outlook.com (52.132.120.147) by
 SN6PR1901MB2048.namprd19.prod.outlook.com (52.132.120.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Wed, 6 Nov 2019 23:04:22 +0000
Received: from SN6PR1901MB2046.namprd19.prod.outlook.com
 ([fe80::f08b:feed:9059:54f6]) by SN6PR1901MB2046.namprd19.prod.outlook.com
 ([fe80::f08b:feed:9059:54f6%5]) with mapi id 15.20.2430.020; Wed, 6 Nov 2019
 23:04:22 +0000
From: "Rhodes, David" <David.Rhodes@cirrus.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoC: wm_adsp: Expose mixer control API
Thread-Index: AQHVkCGAPW5RMQNCLEK062E7Vb1u9qd6/tqAgANpWYA=
Date: Wed, 6 Nov 2019 23:04:22 +0000
Message-ID: <97DE711A-5CB9-4D57-A192-4B96C7C241E0@cirrus.com>
References: <1572550603-21560-1-git-send-email-david.rhodes@cirrus.com>
 <20191104125831.GD5238@sirena.co.uk>
In-Reply-To: <20191104125831.GD5238@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.131.2.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba098e1d-59cb-45fc-1ef3-08d7630da970
x-ms-traffictypediagnostic: SN6PR1901MB2048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR1901MB204874E53F4058CD02EA0180EE790@SN6PR1901MB2048.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(54534003)(199004)(189003)(51914003)(81166006)(107886003)(305945005)(8936002)(4326008)(5660300002)(8676002)(86362001)(66066001)(36756003)(6116002)(91956017)(66946007)(14454004)(66446008)(316002)(64756008)(3846002)(76116006)(54906003)(229853002)(66476007)(71190400001)(71200400001)(66556008)(256004)(33656002)(446003)(186003)(6916009)(6436002)(81156014)(486006)(99286004)(6246003)(11346002)(6486002)(2616005)(476003)(6506007)(2906002)(76176011)(26005)(7736002)(25786009)(102836004)(478600001)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR1901MB2048;
 H:SN6PR1901MB2046.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cirrus.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j3zZkTp9Wk0nRNVa9wpKf0bf+OE9o82pFuuNM0gY3lc3NB6nhW/3JLvK4A4NiJicR6HJmInqAe/Rlq5wdy7whRnz16arqK/xekVCtNo6+H/T+T0AkoWvdAa+1G1UjRDiwo/mazck61DXm991gaICBLyRxjap760Dz0DzU5IdfFU3JJqcPWVQWNnMqkWMouy10TiqZvD7+1mTStBDeNGWe4eawSHKf9Bjej6YBxosTIo9/g3BmmKjG8hiaxqRIZCzvVa8Hg79hkTDu/CAn9+imoD2kWNJv/Vhz/9a0mH1414QiErb2+M2S2fgsmnd57wYbV7cz0+sdn7fr8aTTj40czAh6qMB3cuonMItTyb452s0frvsF9s5Dpeto/+hyLIrz3aiRCaQUrabvIg4/gZ0YTS0q36gMAr0zaWsTRTdlaoN/hIk0km+R2mn9HhtsdKA
Content-ID: <76E73437290A8944B1FAA627D1FDCB12@namprd19.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba098e1d-59cb-45fc-1ef3-08d7630da970
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 23:04:22.3487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wXfph7tRPgRS8kOt7q6CpI9fbZtThwyBxECSUnYqH9cPuv3ZJNoqu6IifJmchLQzaCPMT5jtVAJs3zWt4CQ1+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1901MB2048
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:107.20.210.250 ip4:52.1.14.157 ip4:141.131.128.20 ip4:141.131.3.20
 ip4:213.128.236.230 ip4:87.246.98.25 ip4:87.246.78.26 ip4:87.246.76.56
 ip4:87.246.98.35 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911060222
Cc: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Xu, Li" <Li.Xu@cirrus.com>
Subject: Re: [alsa-devel] [EXTERNAL] Re: [PATCH] ASoC: wm_adsp: Expose mixer
	control API
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IEl0IGlzIG5vdCBjbGVhciB3aHkgd2Ugb25seSBs
b29rIHRoaW5ncyB1cCBieSBzdWJuYW1lLiAgV2hhdCdzIHdyb25nDQo+IHdpdGggdGhlIHJlc3Qg
b2YgdGhlIG5hbWU/DQoNClRoZSByZWFzb24gd2UgdXNlIHRoZSBzdWJuYW1lIGZvciBsb29rdXAg
aXMgYmVjYXVzZSB0aGUgc3VibmFtZSBwb3J0aW9uIG9mIHRoZSBuYW1lIGNhbiBiZSB0cnVuY2F0
ZWQgd2hlbiB0aGUgbGVuZ3RoIG9mIHRoZSBzdWJuYW1lICsgcHJlZml4ZXMgZXhjZWVkcyB0aGUg
bWF4aW11bS4NCkhvd2V2ZXIsIHlvdSByYWlzZSBhIGdvb2QgcG9pbnQgdGhhdCB0aGUgc2FtZSBz
dWJuYW1lIGJ5IGl0c2VsZiBtYXkgbm90IGJlIGEgdW5pcXVlIGlkZW50aWZpZXIsIGFuZCB0aGUg
c2FtZSBzdWJuYW1lIGNvdWxkIGJlIGFzc29jaWF0ZWQgd2l0aCBtb3JlIHRoYW4gb25lIGFsZ29y
aXRobS4NCg0KSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uIGFmdGVyIGludGVybmFsIHJl
dmlldy4NCg0KVGhhbmtzLA0KRGF2aWQNCg0K77u/T24gMTEvNC8xOSwgNjo1OCBBTSwgIk1hcmsg
QnJvd24iIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOg0KDQogICAgT24gVGh1LCBPY3QgMzEs
IDIwMTkgYXQgMDI6MzY6NDNQTSAtMDUwMCwgRGF2aWQgUmhvZGVzIHdyb3RlOg0KICAgIA0KICAg
ID4gRnJvbTogTGkgWHUgPGxpLnh1QGNpcnJ1cy5jb20+DQogICAgDQogICAgPiBFeHBvc2UgbWl4
ZXIgY29udHJvbCBBUEkgZm9yIHJlYWRpbmcgYW5kIHdyaXRpbmcuDQogICAgPiBUaGUgZXhwb3Nl
ZCBBUEkgY2FuIGJlIHVzZWQgYnkgY29kZWMgZHJpdmVyIGZvcg0KICAgID4gaW50ZXJhY3Rpbmcg
d2l0aCBtaXhlciBjb250cm9sIGluIGtlcm5lbCBzcGFjZS4NCiAgICA+IFRoaXMgYWxsb3dzIGNv
ZGVjIGRyaXZlciB0byBpbXBsZW1lbnQgbW9yZSBpbnZvbHZlZA0KICAgID4gaW50ZXJhY3Rpb25z
IHdpdGggRFNQIGZpcm13YXJlLCBzdWNoIGFzIEZhc3QgVXNlDQogICAgPiBDYXNlIFN3aXRjaGlu
Zy4NCiAgICANCiAgICBJdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHNvbWV3aGVyZSBpbiB0aGUgY2hh
bmdlbG9nIHlvdSBtb3JlIGV4cGxpY2l0bHkNCiAgICBzYWlkIHRoYXQgdGhpcyB3YXMgYW4gaW4t
a2VybmVsIEFQSSwgaXQgaXNuJ3QgdmVyeSBjbGVhciB3aGF0IHRoZSBBUEkNCiAgICB5b3UncmUg
YWRkaW5nIGlzIHN1cHBvc2VkIHRvIGJlLg0KICAgIA0KICAgIFRoZSBmb3JtYXR0aW5nIGhlcmUg
aXMgYWxzbyBhIGJpdCB3ZWlyZCwgdGhlIGxpbmVzIGFyZSB2ZXJ5IHNob3J0Lg0KICAgIA0KICAg
ID4gKy8qDQogICAgPiArICogRmluZCB3bV9jb2VmZl9jdGwgd2l0aCBpbnB1dCBuYW1lIGFzIGl0
cyBzdWJuYW1lDQogICAgPiArICogSWYgbm90IGZvdW5kLCByZXR1cm4gTlVMTA0KICAgID4gKyAq
Lw0KICAgID4gK3N0YXRpYyBzdHJ1Y3Qgd21fY29lZmZfY3RsICp3bV9hZHNwX2dldF9jdGwoc3Ry
dWN0IHdtX2Fkc3AgKmRzcCwNCiAgICA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpDQogICAgDQogICAgSXQgaXMgbm90IGNsZWFy
IHdoeSB3ZSBvbmx5IGxvb2sgdGhpbmdzIHVwIGJ5IHN1Ym5hbWUuICBXaGF0J3Mgd3JvbmcNCiAg
ICB3aXRoIHRoZSByZXN0IG9mIHRoZSBuYW1lPw0KICAgIA0KICAgID4gK2ludCB3bV9hZHNwX3dy
aXRlX2N0bChzdHJ1Y3Qgd21fYWRzcCAqZHNwLCBjb25zdCBjaGFyICpuYW1lLCBjb25zdCB2b2lk
ICpidWYsDQogICAgPiArCQkgICAgICBzaXplX3QgbGVuKQ0KICAgID4gK3sNCiAgICA+ICsJc3Ry
dWN0IHdtX2NvZWZmX2N0bCAqY3RsOw0KICAgID4gKw0KICAgID4gKwljdGwgPSB3bV9hZHNwX2dl
dF9jdGwoZHNwLCBuYW1lKTsNCiAgICA+ICsJaWYgKCFjdGwpDQogICAgPiArCQlyZXR1cm4gLUVJ
TlZBTDsNCiAgICA+ICsNCiAgICA+ICsJaWYgKGxlbiA+IGN0bC0+bGVuKQ0KICAgID4gKwkJcmV0
dXJuIC1FSU5WQUw7DQogICAgPiArDQogICAgPiArCXJldHVybiB3bV9jb2VmZl93cml0ZV9jb250
cm9sKGN0bCwgYnVmLCBsZW4pOw0KICAgID4gK30NCiAgICA+ICtFWFBPUlRfU1lNQk9MX0dQTCh3
bV9hZHNwX3dyaXRlX2N0bCk7DQogICAgDQogICAgVGhlcmUgc2hvdWxkIGJlIGEgc25kX2N0bF9u
b3RpZnkoKSBzb21ld2hlcmUgaW4gdGhlIHdyaXRlIHBhdGggdG8gdGVsbA0KICAgIHVzZXJzcGFj
ZSB0aGF0IHRoZSB2YWx1ZSBjaGFuZ2VkLg0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
