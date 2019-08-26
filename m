Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16B9D176
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 16:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995C11699;
	Mon, 26 Aug 2019 16:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995C11699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566828805;
	bh=NJgl+uH9CABmZHZtzBAANyZPjXNiphI0mKOk5RubjnA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FdOej3iMr+M+e6dpWV/WXOFZCAauH2IPH9KB1wAuz+qllZuhb+dcPPy6i0kv3JFI7
	 mw6y1rOqGG26YD9nAMqUFTzVo4jaFy++zML1Iqrrzr1q/J+Woui1+ECYgVFC7FgVfZ
	 lbdRrV9ganXhqAsVhsvN9C14AA0FwHEJ1BDiL4fY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F30A0F802BC;
	Mon, 26 Aug 2019 16:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE0E7F80362; Mon, 26 Aug 2019 16:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A7EDF801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A7EDF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="rUKu2DJn"
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: svidrhMCygeEDtMJQSMZBefvMO23PSk4VW49VXNUOfeTxE5lr/lue9Bds34ng9nIDvNZ6Ha2GR
 sj5wkYD2lUrxw+CuNtIxvAWHOX0Dke7F992t52YP8Uh3E1fOOMKD6BEsvKT4s7HrmTRAbjlWB6
 hnk9L3neQZ84EJx67SfAfQC4XXudeiTuAJBWyJKX+mI4S1BUx8jdkGraVaBSU00OfYkXQdbuU+
 2r9n1c+PzoetoCsMF6dcU7WCEiHOWy9x0zCYFaIrQq7V4cugbSmgJyX9fs7z1pCwaz2Mlfrnbk
 QEs=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46602856"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 07:10:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 07:10:42 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 07:10:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGvaOJX5hMcBWDb6/Lh0BitsWJAXBmDr2Y7Gi0VAEaG53CMUk+CUC57vYnz6+BLFLVqf4FmyViHaSkvVWmg4QbYIJAgG9demW7NbnuHvW10MJx77x7Gzjz78dQ53LULo9XLQZk9gY04kbzdklAoqlylv2vUo3dIsHXrQrvk55/MYq/wGVO7rDYmPXahV43YEm5wBUjMhwHvU/a3N0l02ibxMU7yjmxp9pBxINhof9R3zR8mBGxDQl21DSHLZJHk7T1yDJnLJ+0dFMVPKWHLXN6G1HemdP1YoI1S9KmXjTuapeuOJYQdO0PfoRVRVSIckZITpZZdCy2lNtm/Wq/LjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hDbDaui5EIqsXdlALff8M17gd7ptL2GtqRGDP94HrM=;
 b=EPEYRCU0av0q2/Alb/a4OCvgqZ3z8VyKMj+j7KTCDNfUMaNqj24EuiSrQSWecbT21/kO9kba3r76Nf9P1YTLIe+qVFi7ZJ4hTqfmAfFukNwYR0ysLMnKLBSwuLGYGkKuD8drJq5vcDVrKCmuwl+7IudCcrYw9y1SrsHgAG5rTodm5F4GrSOPjqa39vARJaqDc+2XCDtGMBsl1xRxWTktOSvtDQHyNpnKyGNWoViq0rUidTyn4v+oxgvOVdZGe/050tV299Xaq2XU3is+bJTJc55QOPyPFK+2vPPKKToigvZglTDuQ+KcOKwijwjYL17uW0Ffg75b5BlNzGAxRa/rYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hDbDaui5EIqsXdlALff8M17gd7ptL2GtqRGDP94HrM=;
 b=rUKu2DJnsjMT4jCXP0s9yS14uBwCUW2Dd5mFXlGji5bOMWhEM4H2eT4qc9M7dEQLuURXQYGHRe7qQAs5dYfS1JG9AYjUofgxrsi0hWRAaIO6obZcgCBALQzuXBCAyWi5IhIg5UI9B547O/DSScDJUGZ4Lf0b/vKtcs3sG3T7Vbk=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4370.namprd11.prod.outlook.com (52.132.254.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 14:10:41 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 14:10:41 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>
Thread-Topic: [PATCH v2 3/6] ASoC: atmel_ssc_dai: implement left-justified
 data mode
Thread-Index: AQHVWrpP9qpwk706+UeaVUQqPVgiC6cNepKA
Date: Mon, 26 Aug 2019 14:10:41 +0000
Message-ID: <bcb80163-e08a-e46c-6632-10cee3255642@microchip.com>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <44fa6b700421e80778f20ff9ead2b148cf6d2e92.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <44fa6b700421e80778f20ff9ead2b148cf6d2e92.1566677788.git.mirq-linux@rere.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0116.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::18) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3cc0fa2-7b5f-4a20-9b27-08d72a2f2d90
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4370; 
x-ms-traffictypediagnostic: BY5PR11MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4370B1F4D3B69CCDEC899077E7A10@BY5PR11MB4370.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(396003)(136003)(346002)(54534003)(199004)(189003)(66946007)(6512007)(66066001)(478600001)(446003)(6436002)(53936002)(7736002)(71200400001)(71190400001)(305945005)(6246003)(25786009)(5660300002)(2616005)(6486002)(11346002)(4326008)(476003)(31686004)(36756003)(2201001)(54906003)(26005)(486006)(3846002)(31696002)(14454004)(86362001)(66446008)(64756008)(66476007)(6506007)(386003)(66556008)(99286004)(102836004)(2906002)(186003)(110136005)(8676002)(229853002)(2501003)(316002)(81156014)(81166006)(52116002)(76176011)(8936002)(6116002)(7416002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4370;
 H:BY5PR11MB4497.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W9UOY2rO+l8dLeoHfkCy6/WJiCa4oAGJpc3I7aLW8ab7v4xNS86a7Z2NSb3l1Ue5vGpApLRJfgDseGmrplFgu46D12T1uxenwtCWQC4+kd4IrOdDDO1T/9wpxKzR2GNYV9hPXPy5JsPmHM8cMtzdM3tm/gjPcuoanHzhGaf1ax/pFtQ0bI1jDEQ88Xl6t70pSk0KkzC/7AEoDW1VlBLCa4qGDYXOyTl8RCBzoOmtWQGWvcM+d48TeBj9Dfb8CLnMNviH/Ej5iOJslLIgXkEr9IzF1VWiWZ8lsrrS4SiqGU1vumJr7wX+MpTPz+qMjgjj2z4iVkeg8DtxvbwARBk4xuoag+sUO07T8KUxnbktcfrVqFCeYJyf+S3J+7FmovwyDZOTcEHLvBYtBrDajNM9DhptD3Tnp7ZyD16uyw8CPUw=
Content-ID: <409E0DC013CA7F4ABA2EA80681F655D7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3cc0fa2-7b5f-4a20-9b27-08d72a2f2d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 14:10:41.4804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sp/NaeAFaIbhbVqXnRRKXEz0+3FiOhIjKH2Qw74YyI78Kxmc03zKGAdGgFvQNAIPWB+JeGXPX3L+XHMV6YastPSK+at2t7DJBErshW9yYMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4370
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, lgirdwood@gmail.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org, 3chas3@gmail.com,
 robh-dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 3/6] ASoC: atmel_ssc_dai: implement
 left-justified data mode
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

PiBFbmFibGUgc3VwcG9ydCBmb3IgbGVmdC1qdXN0aWZpZWQgZGF0YSBtb2RlIGZvciBTU0MtY29k
ZWMgbGluay4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJxLWxp
bnV4QHJlcmUucW1xbS5wbD4NCj4gDQo+IC0tLQ0KPiAgIHYyOiByZWJhc2VkDQoNCkkgbm90aWNl
ZCB5b3UgYWxzbyBhZGRlZCBhIGRlc2NyaXB0aW9uIGFuZCB5b3UgcmVtb3ZlZCB0d28gY29tbWVu
dHMgZnJvbSANCnYxLiBQbGVhc2UgaW5jbHVkZSBhbGwgdGhlIGNoYW5nZXMgaW4gdGhlIGNoYW5n
ZWxvZy4NCkkgYWxyZWFkeSBhZGRlZCBteSAnUmV2aWV3ZWQtYnknIGluIHYxLCBidXQgc2luY2Ug
dGhlcmUgYXJlIHNvbWUgbW9yZSANCmNoYW5nZXMgZnJvbSB0aGUgcHJldmlvdXMgdmVyc2lvbjoN
Cg0KUmV2aWV3ZWQtYnk6IENvZHJpbiBDaXVib3Rhcml1IDxjb2RyaW4uY2l1Ym90YXJpdUBtaWNy
b2NoaXAuY29tPg0KDQpUaGFua3MgYW5kIGJlc3QgcmVnYXJkcywNCkNvZHJpbg0KDQo+IA0KPiAt
LS0NCj4gICBzb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jIHwgOSArKysrKysrKysNCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291
bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYyBiL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2Nf
ZGFpLmMNCj4gaW5kZXggN2RjNmVjOWI4YzdhLi40OGU5ZWVmMzRjMGYgMTAwNjQ0DQo+IC0tLSBh
L3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMNCj4gKysrIGIvc291bmQvc29jL2F0bWVs
L2F0bWVsX3NzY19kYWkuYw0KPiBAQCAtNTY0LDYgKzU2NCwxNSBAQCBzdGF0aWMgaW50IGF0bWVs
X3NzY19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sDQo+ICAg
DQo+ICAgCXN3aXRjaCAoc3NjX3AtPmRhaWZtdCAmIFNORF9TT0NfREFJRk1UX0ZPUk1BVF9NQVNL
KSB7DQo+ICAgDQo+ICsJY2FzZSBTTkRfU09DX0RBSUZNVF9MRUZUX0o6DQo+ICsJCWZzX29zeW5j
ID0gU1NDX0ZTT1NfUE9TSVRJVkU7DQo+ICsJCWZzX2VkZ2UgPSBTU0NfU1RBUlRfUklTSU5HX1JG
Ow0KPiArDQo+ICsJCXJjbXIgPQkgIFNTQ19CRihSQ01SX1NUVERMWSwgMCk7DQo+ICsJCXRjbXIg
PQkgIFNTQ19CRihUQ01SX1NUVERMWSwgMCk7DQo+ICsNCj4gKwkJYnJlYWs7DQo+ICsNCj4gICAJ
Y2FzZSBTTkRfU09DX0RBSUZNVF9JMlM6DQo+ICAgCQlmc19vc3luYyA9IFNTQ19GU09TX05FR0FU
SVZFOw0KPiAgIAkJZnNfZWRnZSA9IFNTQ19TVEFSVF9GQUxMSU5HX1JGOw0KPiANCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
