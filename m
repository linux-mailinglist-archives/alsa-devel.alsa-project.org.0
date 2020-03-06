Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A374417C7C3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 22:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 311DD1607;
	Fri,  6 Mar 2020 22:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 311DD1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583529603;
	bh=cFmM3oO5l3SnvlFC1mN18AFrVdm5Ootaj0h7GbOzd9A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwjcKRMhXLZ8lHmWWwtPNpLo7r+76EZcV/3zVyjStekVfoLLMzt73OIFb8B+XSkgc
	 Lu2tkf/PzuY9O+WB+ijvcRmBx4zTYMh1k+NbVH4RXPN8dOvWvuSnO6sMYHb3cExF7e
	 qVbQWvw2SugJ2X55belpYI1LAcMaaTGa9/SnDCdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30079F80126;
	Fri,  6 Mar 2020 22:18:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEF1AF801ED; Fri,  6 Mar 2020 22:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CCFEF80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 22:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CCFEF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="N7kRiGdR"; 
 dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com
 header.i=@cirrus4.onmicrosoft.com header.b="mlzsFQgH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026L1G2C019642; Fri, 6 Mar 2020 15:18:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=PODMain02222019;
 bh=cFmM3oO5l3SnvlFC1mN18AFrVdm5Ootaj0h7GbOzd9A=;
 b=N7kRiGdRIohow2SWqW1sCqr6Q+a4EuBMnqO89ft1QV09TfPqBFdO/zpaZ15CUDc3/7ic
 eI4naEDwBfLGxt3r+JvPTcYzhB2acFyHG92Mm5gETMAZ5ofABS1PDGAC+P2VawmcGTY8
 2RJB+SQ+CuVzRb2iftwQkHeAdrS1jwkqWyemSCh8bSNGEgR1K/EwjLVMlGNrLdz36zEZ
 fBwJQffP7KaairAXFRNH7nP8O3Mt0PbOy70fMuw89zg4autWkD2crAAoCzZlOE0SyicF
 7SsCr9vKagNgjkASCJWVBO2FZRvNYSHI9+ZPi+U9Dsz3dgm019EeoW25rGjx6fvsoYTJ /w== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=David.Rhodes@cirrus.com
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-001ae601.pphosted.com with ESMTP id 2yfp8a3w0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:18:13 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBGk9DVag1SoL24QeTLQzZZDUXONunPPtcV8Tje658fSu2VfVZtU0rCoQYvp8HQ1nCc9ATT2QCdXz5dQTWOmnVzif9kASWoQurEodiVmGTH/u6h1Z8l/bTwkvdGV2IWcw0PfggzumnH4rEuC3i0TeNxHUHr1XUmNTYuQZKAJcvvd7pi5nY+G+tlBoDBtFkFtTk0xJtFeUsQj9m+2cAE0tAmKZIUDT1iK3Qz2XiS49+H2whAAZZjzp0u4hEQOOekOvvVK7GLWKzwwe6vavFmwOJsfSYmbkffWb7YLjz0IA6JMfZj/N6EtEB33eL5OJW41RxMVhwaI2cEvO8y2yoPp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFmM3oO5l3SnvlFC1mN18AFrVdm5Ootaj0h7GbOzd9A=;
 b=LUV79hnCQUTwT+dpYNKVH+OBnRB6p5EYLDs9X1l6uDAViuOUkJFepxXyZPY3q9q7q1yYSL9dMfvi//GHF9LwAcJI342wRtVuvOAFbmTxGQIWpRRULpkBZVkUKpx2HhowV6z5D+AnAg3DT/hXGD6+dn24vl44Y0ZKX4AGE6gEHGhM2nKzbPc6dh+GXL81MUoS/174arMTa+K1rv7ju5v+QZpVuDbpmm4ILi008yo1doV53JUx5Yc5W0YAhvC8VwL4v02yHqoivg86QWFxtU/GxISZCiDuYMDIaAQyEzMCtogL1a1f/HrFkJzRzi9ZgDM8zxg2bIryMrfyMNDuUAnvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFmM3oO5l3SnvlFC1mN18AFrVdm5Ootaj0h7GbOzd9A=;
 b=mlzsFQgHCK2pjVOn0Cq3DJwuWbPdulMsbux6swSq35g0vdvSQgSGhN+1kpWB2kbGnOpMwJsLDRCWVWvrWJlJM/PAb+yYFczBNLugTIbzwM6hl9bfCSX9a6x4vSkFX/wRe0Wtx83ggmHe5AZOfl7JZj2OPysw5Dw17DW4Bs4AXvg=
Received: from BY5PR19MB3538.namprd19.prod.outlook.com (2603:10b6:a03:1bf::28)
 by BY5PR19MB3350.namprd19.prod.outlook.com (2603:10b6:a03:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Fri, 6 Mar
 2020 21:18:10 +0000
Received: from BY5PR19MB3538.namprd19.prod.outlook.com
 ([fe80::1153:a153:f112:43e1]) by BY5PR19MB3538.namprd19.prod.outlook.com
 ([fe80::1153:a153:f112:43e1%5]) with mapi id 15.20.2793.013; Fri, 6 Mar 2020
 21:18:10 +0000
From: "Rhodes, David" <David.Rhodes@cirrus.com>
To: "Schulman, James" <James.Schulman@cirrus.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Thread-Topic: [PATCH] MAINTAINERS: Update Cirrus Logic codec driver maintainers
Thread-Index: AQHV8/uvTLLDbdTF00mNe25R2BUq/qg7rOuA
Date: Fri, 6 Mar 2020 21:18:10 +0000
Message-ID: <33FB8674-6779-437E-B647-BA651C121A77@cirrus.com>
References: <alpine.DEB.2.21.2003061508150.32557@james-tower>
In-Reply-To: <alpine.DEB.2.21.2003061508150.32557@james-tower>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [141.131.2.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f732c407-103d-472d-1e0a-08d7c213df96
x-ms-traffictypediagnostic: BY5PR19MB3350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB3350DE5853168689984F3ED1EEE30@BY5PR19MB3350.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(189003)(199004)(4326008)(26005)(54906003)(110136005)(316002)(81166006)(81156014)(8676002)(76116006)(91956017)(107886003)(66476007)(66946007)(66446008)(64756008)(66556008)(15650500001)(71200400001)(86362001)(478600001)(6512007)(6506007)(2906002)(186003)(2616005)(6486002)(8936002)(5660300002)(4744005)(33656002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR19MB3350;
 H:BY5PR19MB3538.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cirrus.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oj1eX8Nif0/AtjjZQ+dtHPhaJRd4kzN+nzjp4Wcxm3OVHwLv03MLu7B1YiZ1xH6Ksc+2mdcyvD0UK61cQm1M2xcfQVxdFMeK2pDOJeVfNZGRSY61J1Q10UL2CzXBUXmFk8EJKtC34PhvZhrdmxV3hb1hXuzPYtH0kktlAX3RuvDcAlu5yUYXyK8VoB5hYOpu5wsttRiGM6vUQ/h9FXnYUwqjNdo3H1LKr9aoRNKlWW+Y6PCCj1ViylcR/wz9xNg/CHn1ox71MEPk87QwZDi0C3GlEqiNt7mloFiUwO7yzI7YBDRFjsAOiUzgCIrK7BEpjb2IzkhIc/b5U+/S2ZZaSrEptGxl0NJskVLmMFiwOnESbYDh4ewh8lx5Sg5ZCueW9l6mLyOOIWKXiWE8erTGS8wM2M5O9TjqicH9+PK2TGPeygnUF54V2f42wNkXcXwR
x-ms-exchange-antispam-messagedata: /bCjZ7x8dViYlQmKBNYcdbtFQv4TUsz/SmRvFuGXL/PbA5cj7V84QTxXNSfRKMtIVjsz6BlM3zSLGIgAvQLF63VFZB71AzFdh5mJaVazt5syamxeF4NYyx/RelIY1373jxsUEPi1Z+sdXF92Z5C/Hw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AFAA74F5678F94F890C7BA7CAADCD57@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f732c407-103d-472d-1e0a-08d7c213df96
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 21:18:10.5680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMjfab4YyF8OcMuimRcmc0OpqrIx8N+G3FZyiP+jZ0/mcNA/rD0HocKuCwhddnn0n/VMney3b121/ABjttxRdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3350
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 include:_spf1.cirrus.com include:_spf2.cirrus.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003060123
Cc: "Austin, Brian" <Brian.Austin@cirrus.com>, "Handrigan,
 Paul" <Paul.Handrigan@cirrus.com>
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

QWNrZWQtYnk6IERhdmlkIFJob2RlcyA8ZGF2aWQucmhvZGVzQGNpcnJ1cy5jb20+DQoNClRoYW5r
cywNCkRhdmlkDQoNCu+7v09uIDMvNi8yMCwgMzoxMCBQTSwgIlNjaHVsbWFuLCBKYW1lcyIgPEph
bWVzLlNjaHVsbWFuQGNpcnJ1cy5jb20+IHdyb3RlOg0KDQogICAgQnJpYW4gJiBQYXVsIGFyZSBu
byBsb25nZXIgYWN0aXZlIGF1ZGlvIGNvZGVjIGRyaXZlcg0KICAgIG1haW50YWluZXJzLiBVcGRh
dGUgbGlzdCB0byByZWZsZWN0IG15c2VsZiBhbmQgRGF2aWQNCiAgICBSaG9kZXMgYXMgdGhlIGFj
dGl2ZSBtYWludGFpbmVycy4NCiAgICANCiAgICBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBTY2h1bG1h
biA8amFtZXMuc2NodWxtYW5AY2lycnVzLmNvbT4NCiAgICAtLS0NCiAgICAgICBNQUlOVEFJTkVS
UyB8IDQgKystLQ0KICAgICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQogICAgDQogICAgZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMNCiAgICBpbmRleCA2MTU4YTE0M2ExM2UuLjA1Mzc5ZjhiYzhlMSAxMDA2NDQNCiAgICAtLS0g
YS9NQUlOVEFJTkVSUw0KICAgICsrKyBiL01BSU5UQUlORVJTDQogICAgQEAgLTQwMjEsOCArNDAy
MSw4IEBAIEY6DQogICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2dv
b2dsZSxjcm9zLWVjLWNvZGVjLnR4dA0KICAgICAgIEY6ICAgICAgc291bmQvc29jL2NvZGVjcy9j
cm9zX2VjX2NvZGVjLioNCiAgICANCiAgICAgICBDSVJSVVMgTE9HSUMgQVVESU8gQ09ERUMgRFJJ
VkVSUw0KICAgIC1NOiAgICAgQnJpYW4gQXVzdGluIDxicmlhbi5hdXN0aW5AY2lycnVzLmNvbT4N
CiAgICAtTTogICAgIFBhdWwgSGFuZHJpZ2FuIDxQYXVsLkhhbmRyaWdhbkBjaXJydXMuY29tPg0K
ICAgICtNOiAgICAgSmFtZXMgU2NodWxtYW4gPGphbWVzLnNjaHVsbWFuQGNpcnJ1cy5jb20+DQog
ICAgK006ICAgICBEYXZpZCBSaG9kZXMgPGRhdmlkLnJob2Rlc0BjaXJydXMuY29tPg0KICAgICAg
IEw6ICAgICAgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnIChtb2RlcmF0ZWQgZm9yIG5vbi1z
dWJzY3JpYmVycykNCiAgICAgICBTOiAgICAgIE1haW50YWluZWQNCiAgICAgICBGOiAgICAgIHNv
dW5kL3NvYy9jb2RlY3MvY3MqDQogICAgLS0NCiAgICAyLjE3LjENCg0K
