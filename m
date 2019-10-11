Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34272D39CA
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 09:05:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7AAD1673;
	Fri, 11 Oct 2019 09:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7AAD1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570777514;
	bh=BYXY+bT1nBH/Oc4xFpJo6pmRxy/zKAg8Jk3X0mkdnAY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovng7JwxrNT6LwxJ0yxzYSuJZChBgO7/SYodg5621CVhIl0iyN+i7vW/EYTjejfvQ
	 TNmP4WjsAxiyZuSS/v4a6+hBC2QZ2MWotTtun1ldbXmf02dtfp0Q4FMvFPIcYMRsCj
	 cEqnZ63fih11+Tb43eTa5pCigwiqXZnCzDS/Fr88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E625CF802BD;
	Fri, 11 Oct 2019 09:03:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01C2BF802BE; Fri, 11 Oct 2019 09:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41025F800E3
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 09:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41025F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="CWJyxmUs"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9B734Ur009997; Fri, 11 Oct 2019 03:03:17 -0400
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2055.outbound.protection.outlook.com [104.47.45.55])
 by mx0a-00128a01.pphosted.com with ESMTP id 2ver39td90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2019 03:03:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OR8ayu1glhKNAg589MjaFPxux4iCVOs+zkEnPCxmz5EbLD+lJqmE0YRp/53oI7qlxp/FtVX8H74zSTm0aJjQUbhv19KZZ1Xitp9ZX1R+9xkdjEYqAwdPvQ0TC81QBb+I5vCDJ3XQSxRcb7DLI1KD3J9qCBwkPY41HLEzSHwBZTX/CsqXfgspIBEL92BoQ3qc3HMu+zm5eDFRXo6nNZRNN1yHxafTrjNxFrHKTk1juFS9zBtyXmxUM6lKQOgMmpYiFWedW1bHdavaD7Jxt/2UdVegrXU3BsUEwpRBL1WbPUW+nc+7zw55HavGK/L+52KL/eMKAchdr4alY8E4Q/arTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbIRLNm9cEA2+89aKCRR3F7FTPC1xt4p3yNevb09Gbk=;
 b=RiUzo5IlOjoGoHneVvcXBX2Kx9M5+/t23eAm1LJemNC2i9nYSPqbWdU3zoGBszQ2Uo2/9hndohdAhzZ8+vxvGv1q5HKBkkrNAxSmG8fPRJ097B9/Zk6IbP5iRQlssinw9vj0bZf68JtmGxyT6nT62Ejcr7gqVR8EGuEw8HP6He8azITagY/x7sOshNQnYz/VtUd5j0S135ji9ovjbzOtEExayPksrq6J8mA4W9K4IO23CiAJw2X32tE+cf/ftZHJbZO8E3TuWkRDCIt8iZHklYqNsrw+0oagYrayGu52oAyKSH+G3jOfUNVceaS9uOfLuM7XOZcyJ4jAUWRxf+gLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbIRLNm9cEA2+89aKCRR3F7FTPC1xt4p3yNevb09Gbk=;
 b=CWJyxmUsXTQ/8ZB9HYX3dVKNLQmgUNNtGzG6tJErVRusPLmA+GJZo6YDAD9HR8G5ZRfK4Un3ZBkGskY6araBrKEqmj94KIf/9QKzJarOTSTRiywRWSlmBZ2h39dfsEhRyzDw0nJAg3/CialI0X4GQpyxQDL9/WaW6y+bwc4HoEo=
Received: from DM6PR03MB5116.namprd03.prod.outlook.com (10.141.160.208) by
 DM6PR03MB4361.namprd03.prod.outlook.com (20.178.24.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 07:03:15 +0000
Received: from DM6PR03MB5116.namprd03.prod.outlook.com
 ([fe80::9459:e78f:c095:e8f3]) by DM6PR03MB5116.namprd03.prod.outlook.com
 ([fe80::9459:e78f:c095:e8f3%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 07:03:15 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel PDM-to-I2S/TDM
 Converter driver
Thread-Index: AQHVf3PV7U74waHrAk2W214BfzRKcKdT+YGAgAAIiICAAQMXAA==
Date: Fri, 11 Oct 2019 07:03:15 +0000
Message-ID: <944157fe22c59a997e86287ff9cd686be91ac0df.camel@analog.com>
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010140512.GT2036@sirena.org.uk>
 <eace751502e84651d4bc727b59464f7cfbbebbd5.camel@analog.com>
 <20191010153623.GD4741@sirena.org.uk>
In-Reply-To: <20191010153623.GD4741@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d64ad585-b294-4563-4797-08d74e1916a2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR03MB4361:
x-microsoft-antispam-prvs: <DM6PR03MB4361D3C776DF2265BE247CC099970@DM6PR03MB4361.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(366004)(189003)(199004)(91956017)(2906002)(256004)(476003)(6512007)(76116006)(66446008)(76176011)(66556008)(66476007)(81156014)(81166006)(2501003)(64756008)(3846002)(486006)(66946007)(8936002)(54906003)(6116002)(8676002)(4326008)(1730700003)(99286004)(26005)(186003)(102836004)(316002)(6506007)(66066001)(36756003)(6486002)(71190400001)(2351001)(25786009)(6246003)(6436002)(446003)(71200400001)(6916009)(118296001)(229853002)(478600001)(2616005)(305945005)(5660300002)(5640700003)(14454004)(86362001)(4001150100001)(11346002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR03MB4361;
 H:DM6PR03MB5116.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RqwUnrWvkDUBVke8qxyA9/C+ymeK35/c799K9flWRdnOZ40GHAxj0Dee4MemOowlTDZTKy0qdSk94ZVQdRPWklNXGX1JqhqJ2NnyYXHagnu9VGMSbrY8nrqijzZBgg8QpSB/TgXgOjdxScKNOjrEvUnoxD+j18B+aqTeOf/FDPrHE1C4j0JIm64CarqBQGEW5hQ3HWS4HGp3FLUuJE/roGdYn6ScHaSrjCQ3Q0SHHOKh4gd01De6eoYl4Wx6hMZjhfNVptTlKFa0aSpX93PFN6L3L7Bf8mjbCfN4aHt7IYuO1YvcwHbWx0YSCD7L0bsOFB16YwmbupnhYhKhgfsmega+01ARM8/nJ9KADmAGTr671AypCnvpRN73cIEkx1WgBnL+EhmOzHPaWoR3S5JruCjPUP6wPaGpg/9Z7xUHpZY=
x-ms-exchange-transport-forked: True
Content-ID: <889624787611C244ABD41E62A3C6D110@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64ad585-b294-4563-4797-08d74e1916a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 07:03:15.5306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1MjLRQKBp3Vc5q8yKjJd9mIvKXA7KjZT1ZQOWYp7PX1ZDctJAAfiZhM+bl/1FSZEI3pWZF6QDQA3rIWQPMxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4361
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_04:2019-10-10,2019-10-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910110066
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASOC: Add ADAU7118 8 Channel
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

T24gVGh1LCAyMDE5LTEwLTEwIGF0IDE2OjM2ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiAN
Cj4gT24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDM6MDU6MjRQTSArMDAwMCwgU2EsIE51bm8gd3Jv
dGU6DQo+ID4gT24gVGh1LCAyMDE5LTEwLTEwIGF0IDE1OjA1ICswMTAwLCBNYXJrIEJyb3duIHdy
b3RlOg0KPiA+ID4gWW91IGNvdWxkIHVzZSByZWd1bGF0b3JfYnVsa19lbmFibGUoKSBoZXJlIChh
bmQgc2ltaWxhcmx5IG9uDQo+ID4gPiBkaXNhYmxlKSBidXQgaXQgZG9lc24ndCBmdW5kYW1lbnRh
bGx5IG1hdHRlciAtIHRoZXkgZG8gZ3VhcmFudGVlDQo+ID4gPiB0aGF0IHRoZXknbGwgZG8gdGhp
bmdzIGluIHNlcXVlbmNlLCB0aG91Z2ggdGhleSBkb24ndCB3YWl0IGZvcg0KPiA+ID4gdGhlIHJh
bXAgdG8gY29tcGxldGUgYmVmb3JlIGtpY2tpbmcgb2ZmIHRoZSBuZXh0IGVuYWJsZSBpbiB0aGUN
Cj4gPiA+IHNlcXVlbmNlIHdoaWNoIGNhbiBiZSBhbiBpc3N1ZSBmb3Igc29tZSBoYXJkd2FyZS4N
Cj4gPiBZZXMsIHJlZ3VsYXRvcl9idWxrX2VuYWJsZSgpIGNvdWxkIGZpdC4gVGhlIG9ubHkgdGhp
bmcgdGhhdCB3b3JyaWVzDQo+ID4gbWUNCj4gPiBpcyB0aGF0IHdlIG9ubHkgY2hlY2sgZm9yIGVy
cm9ycyByZXR1cm5lZCBmcm9tIHJlZ3VsYXRvcl9lbmFibGUoKQ0KPiA+IGFmdGVyDQo+ID4gYWxs
IGFzeW5jIHdvcmsgaXMgZG9uZSAod2hpY2ggaXMgcHJvYmFibHkgd2hhdCB5b3UgbWVhbiBieSAi
dGhleQ0KPiA+IGRvbid0DQo+ID4gd2FpdCBmb3IgdGhlIHJhbXAgdG8gY29tcGxldGUgYmVmb3Jl
IGtpY2tpbmcgb2ZmIHRoZSBuZXh0DQo+ID4gZW5hYmxlLi4uIikNCj4gPiB3aGljaCBjb3VsZCBs
ZWF2ZSB1cyB3aXRoIERWREQgYXBwbGllZCB3aXRob3V0IElPVkREIGZvciBhIHNob3J0DQo+ID4g
YW1vdW50DQo+ID4gb2YgdGltZS4gSSdtIG5vdCBzdXJlIHRoaXMgd291bGQgYmUgYSByZWFsbHkg
aXNzdWUgYW5kIHRoYXQgd291bGQNCj4gPiBkYW1hZ2UgdGhlIEhXLCBidXQgZnJvbSB3aGF0IEkg
Y2FuIHRlbGwgZnJvbSB0aGUgZGF0YXNoZWV0LCBJdCdzDQo+ID4gbm90DQo+ID4gYWR2aXNlZCB0
byBhcHBseSBEVkREIHdpdGhvdXQgSU9WREQuDQo+IA0KPiBZZWFoLCBleGFjdGx5LiAgT1RPSCB0
aGluZ3MgbGlrZSB0aGF0IChlc3BlY2lhbGx5IGZvciBicmllZiB0aW1lDQo+IHBlcmlvZHMpIGFy
ZSBtdWNoIG1vcmUgbGlrZWx5IHRvIHJlc3VsdCBpbiB0aGUgY2hpcCBiZWluZyBpbiBzb21lDQo+
IHdlaXJkIHN0YXRlIG9uIGluaXQgd2hpY2ggd29uJ3QgbWF0dGVyIGlmIHdlIGltbWVkaWF0ZWx5
IHBvd2VyDQo+IG9mZiB0aGFuIGFueXRoaW5nIGVsc2UuICBMaWtlIEkgc2F5IGl0J3Mgbm90IGEg
cmVxdWlyZW1lbnQgdG8gdXNlDQo+IGJ1bGsgb3BlcmF0aW9ucy4NCg0KWWVhaCwgdGhhdCdzIHBy
b2JhYmx5IHJpZ2h0LiBJIGNhbiBhbHNvIGRvIHNvbWUgaW50ZXJuYWwgcXVlcnlpbmcgdG8NCnVu
ZGVyc3RhbmQgaWYgdGhpcyBjb3VsZCByZWFsbHkgZGFtYWdlIHRoZSBwYXJ0LiBJZiBub3QgYW5k
IHNpbmNlIEkNCmhhdmUgdG8gcHJlcGFyZSBhIHY0IGVpdGhlciB3YXkgKGZvciBkdCBiaW5kaW5n
cyksIEkgd2lsbCB1c2UNCnJlZ3VsYXRvcl9idWxrX2VuYWJsZSgpLg0KDQpOdW5vIFPDoQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
