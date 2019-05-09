Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB3185B0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 09:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8877B1851;
	Thu,  9 May 2019 09:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8877B1851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557385331;
	bh=KyVrQy6FhsdZ8E52S74YvkNU+7/1GI1lOGk/7xMHv3Y=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxuN3XUbd5HMsjp59gpVbmcYzGPLsJ9kMB+Q2g5RRHTaHbZ4uNLB9TfcsxZ88Vi/g
	 NnjicjG/1LwEyZdLrU8iumqdnlXkhXs73bd9TSTiCfNtLRhYqsbvurcmtajN4cC+H2
	 erkjOlEOKsk8KiJXTWtWxUBd28ZDV33EIOuk+YMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C45EF89673;
	Thu,  9 May 2019 09:00:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D87F89674; Thu,  9 May 2019 09:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com
 [208.86.201.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24861F80796
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 09:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24861F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com
 header.b="JTf7PqwB"; 
 dkim=pass (1024-bit key) header.d=cadence.com header.i=@cadence.com
 header.b="BYwd8jKm"
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x496rXej019951; Thu, 9 May 2019 00:00:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=4bEL5zJdxmoR71nTZui40QTwgpvdQzA5yG3DFOkxXQs=;
 b=JTf7PqwBn5M1piXyuX3BZwOkjaX6aMIGwXX/Mi5IVcF5FHvsMe4bTb4X0IaQChYCvvky
 jBl3tXS9vUOXOhWIRrKUM2lvs1HGlDYj7ucxXY3Q9z4OO3YvyoGUPITiZr7WAz67QcJ3
 2wWTYz9ZIJBlMOKKey05z7BKYP9E8DvuVRCYisIzmjIPaLhVbp5+5B9qBPHLclRtwqKL
 ioMlMs/RiygkoibYWGq1oeWsjL6Yj/zvdEj7EMvzbYAcxjdTyqxlbb2EWOPRMdsCWxXd
 ecv+vYEXxPH3nd35tdpGUZ/37wUDYk/fARpct9JBbvQ3uCb9qfCHFfq2/40MvqAAi3vF hA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2051.outbound.protection.outlook.com [104.47.36.51])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2scb0594d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 09 May 2019 00:00:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bEL5zJdxmoR71nTZui40QTwgpvdQzA5yG3DFOkxXQs=;
 b=BYwd8jKmrXkUn+R3sk1X92y8P3+OQyyi6RukK2J/Aip+RaZyw/nlrpEtx054xGgb1SGuYHhH14VNu1lyPHbZUaNZ7CIz8sdei7p4HGp805BAG4qT5LtX35AdJ/BHMQWVhlh+mu9fPOjSrxdwadB0jkD61Ua+nmGYBQSlHzeL/Q4=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2378.namprd07.prod.outlook.com (10.166.194.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Thu, 9 May 2019 07:00:13 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::71b2:7651:1d16:505f]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::71b2:7651:1d16:505f%9]) with mapi id 15.20.1878.019; Thu, 9 May 2019
 07:00:13 +0000
From: Jan Kotas <jank@cadence.com>
To: Vinod Koul <vkoul@kernel.org>
Thread-Topic: [alsa-devel] [PATCH] soundwire: cdns: Fix compilation error on
 arm64
Thread-Index: AQHU6r4tHXqRN20fiUK52juZz07+36Y7d7kAgAHD54CAAU/GAIAkCM4A
Date: Thu, 9 May 2019 07:00:13 +0000
Message-ID: <527C4760-C36A-4F35-9A35-C0A32DE739D1@global.cadence.com>
References: <20190404081221.341-1-jank@cadence.com>
 <20190414094408.GF28103@vkoul-mobl>
 <8ba31402-b507-5060-76be-89a7ddaf7dca@linux.intel.com>
 <F63978EE-8D0E-446C-BDAB-48B7F5FF7D82@global.cadence.com>
In-Reply-To: <F63978EE-8D0E-446C-BDAB-48B7F5FF7D82@global.cadence.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a30b47dd-ec9b-493e-3a33-08d6d44bfc1e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY1PR07MB2378; 
x-ms-traffictypediagnostic: CY1PR07MB2378:
x-microsoft-antispam-prvs: <CY1PR07MB23788498500B3324A755AC2AD0330@CY1PR07MB2378.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(136003)(366004)(346002)(199004)(189003)(36092001)(6486002)(486006)(6506007)(4326008)(54906003)(8936002)(66446008)(64756008)(82746002)(66476007)(53546011)(305945005)(6436002)(66066001)(478600001)(66556008)(91956017)(6512007)(76116006)(25786009)(229853002)(6916009)(73956011)(476003)(68736007)(7736002)(33656002)(256004)(14444005)(316002)(11346002)(5660300002)(446003)(81166006)(81156014)(86362001)(76176011)(66946007)(6116002)(3846002)(8676002)(53936002)(2906002)(186003)(14454004)(6246003)(99286004)(26005)(83716004)(102836004)(107886003)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2378;
 H:CY1PR07MB2521.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AcqP8sYNK4Dmp7Nc/7PN7VaBkuMJRFVfRxSDtiiyyMaPIfKkgeOFWmZNSmJfhq7Wo6T45ttbXinphbkfT3oAtPrkC0oFRDF/eNB4q9MoDVt0vTwtJJBBlTfzbWoQhW4X1dh13TCPwRml+iqRzEwJbB4BUvh674ruUZ9OQ/Xp0eTPqigCJkWTSRpTUxALC7nUsvdxX7AroZk2So7SK7SsPDAGP5Fv7x6ZLVREJu80XRqf1a6HH4SVl33DrhfE8nRKCTLwml2xnDPNzC0h/jzbSvq6S+X9zjffWsGICSiWmMPHijJZQtPJ13rX5WqewAEUxRNd0CQSmFIG6Q4YgoDafSqD6C/MdzkhwTIr4WzcUoST2tvirmSB9LQsZ22ibG5GIHorlv8aH7To7aQguAN6+UorebA4j/D4VYKc6iHxv4Q=
Content-ID: <FAFBD122F43A8441845D891B0074781E@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30b47dd-ec9b-493e-3a33-08d6d44bfc1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 07:00:13.4867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2378
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp
 include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090045
Cc: Jan Kotas <jank@cadence.com>,
 "sanyog.r.kale@intel.com" <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] soundwire: cdns: Fix compilation error on
 arm64
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

SGVsbG8sDQoNCklzIHRoZXJlIGEgcmVhc29uIGZvciBub3QgYWNjZXB0aW5nIHRoaXMgcGF0Y2g/
DQpEbyB5b3Ugd2FudCBtZSB0byBjaGFuZ2UgYW55dGhpbmcgaW4gdjI/DQoNClJlZ2FyZHMsDQpK
YW4NCg0KPiBPbiAxNiBBcHIgMjAxOSwgYXQgMTA6NDMsIEphbiBLb3RhcyA8amFua0BjYWRlbmNl
LmNvbT4gd3JvdGU6DQo+IA0KPj4gT24gMTQgQXByIDIwMTksIGF0IDExOjQ0LCBWaW5vZCBLb3Vs
IDx2a291bEBrZXJuZWwub3JnPiB3cm90ZToNCj4+IA0KPj4gDQo+PiBPbiAwNC0wNC0xOSwgMDk6
MTIsIEphbiBLb3RhcyB3cm90ZToNCj4+PiBPbiBhcm02NCB0aGUgY2FkZW5jZV9tYXN0ZXIuYyBm
aWxlIGRvZXNuJ3QgY29tcGlsZS4NCj4+PiANCj4+PiByZWFkbCBhbmQgd3JpdGVsIGFyZSB1bmRl
ZmluZWQuDQo+Pj4gVGhpcyBwYXRjaCBmaXhlcyB0aGF0IGJ5IGluY2x1ZGluZyBpby5oLg0KPj4g
DQo+PiBBbmQgSSBjYW50IHZlcmlmeSB0aGF0IHdpdGhvdXQgaGFja2luZyBrY29uZmlnIHRvIGZv
cmNlIGNvbXBpbGUgdGhlIGxpYi4NCj4gDQo+IEnigJltIHdvcmtpbmcgb24gYSBuZXcgZHJpdmVy
IHdoaWNoIHVzZXMgdGhlIFNPVU5EV0lSRV9DQURFTkNFOg0KPiBIZXJl4oCZcyBhIGRpZmYgb2Yg
dGhlIEtjb25maWcsIGl04oCZcyBhIHZlcnkgZWFybHkgc3RhZ2UuDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb3VuZHdpcmUvS2NvbmZpZyBiL2RyaXZlcnMvc291bmR3aXJlL0tjb25maWcN
Cj4gaW5kZXggMTljOGVmYjlhLi45MGQ1NjllMDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc291
bmR3aXJlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9zb3VuZHdpcmUvS2NvbmZpZw0KPiBAQCAt
MzQsNCArMzQsMTAgQEAgY29uZmlnIFNPVU5EV0lSRV9JTlRFTA0KPiAgICAgIGVuYWJsZSB0aGlz
IGNvbmZpZyBvcHRpb24gdG8gZ2V0IHRoZSBTb3VuZFdpcmUgc3VwcG9ydCBmb3IgdGhhdA0KPiAg
ICAgIGRldmljZS4NCj4gDQo+ICtjb25maWcgU09VTkRXSVJFX0NBREVOQ0VfUExBVEZPUk0NCj4g
KyAgIHRyaXN0YXRlICJTb3VuZFdpcmUgQ2FkZW5jZSBQbGF0Zm9ybSBkcml2ZXIiDQo+ICsgICBz
ZWxlY3QgU09VTkRXSVJFX0NBREVOQ0UNCj4gKyAgIHNlbGVjdCBTT1VORFdJUkVfQlVTDQo+ICsg
ICBoZWxwDQo+ICsgICAgIFNvdW5kV2lyZSBDYWRlbmNlIFBsYXRmb3JtIGRyaXZlcnMuDQo+IGVu
ZGlmDQo+IA0KPiBJIGhhdmVu4oCZdCBtb2RpZmllZCBhbnkgb2YgdGhlIGV4aXN0aW5nIGxpbmVz
LiANCj4gU09VTkRXSVJFX0NBREVOQ0UgZG9lc27igJl0IGRlcGVuZCBvbiBhbnl0aGluZywgZXhj
ZXB0IFNPVU5EV0lSRSwNCj4gc28gaXQgc2hvdWxkIHdvcmssIHdoZW4gc2VsZWN0ZWQuDQo+IA0K
Pj4gT24gMTUgQXByIDIwMTksIGF0IDE0OjQxLCBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJl
LWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4+IA0KPj4gDQo+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5jIGIvZHJpdmVycy9z
b3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYw0KPj4+PiBpbmRleCBjYjZhMzMxZjQuLjBiNWJjYzIw
OSAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuYw0K
Pj4+PiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5jDQo+Pj4+IEBAIC05
LDYgKzksNyBAQA0KPj4+PiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4+Pj4gI2luY2x1ZGUg
PGxpbnV4L2RldmljZS5oPg0KPj4+PiAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+Pj4+
ICsjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4+PiBXaHkgbm90IGFkZCBhc20vaW8uaCB3aGljaCBp
cyB0aGUgaGVhZGVyIHRoYXQgYWN0dWFsbHkgZGVmaW5lcw0KPj4+IHJlYWRsL3dyaXRlbD8NCj4+
IA0KPj4gVGhlIHZhc3QgbWFqb3JpdHkgb2Yga2VybmVsIGNvZGUgdXNlcyBsaW51eC9pby5oLg0K
Pj4gV2UgdXNlIGxpbnV4L2lvLmggZm9yIFNPRiBhcyB3ZWxsLg0KPiANCj4gSSB1c2UgbGludXgv
aW8uaCBpbiBteSBvdGhlciBkcml2ZXJzIHRvby4NCj4gDQo+PiANCj4+Pj4gI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPg0KPj4+PiAjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+DQo+
Pj4+ICNpbmNsdWRlIDxsaW51eC9zb3VuZHdpcmUvc2R3X3JlZ2lzdGVycy5oPg0KPj4+PiAtLSAN
Cj4+Pj4gMi4xNS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
