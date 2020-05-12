Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD51CFEC0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 21:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21AC516DB;
	Tue, 12 May 2020 21:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21AC516DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589313389;
	bh=bHJ8qBGl1HtVpAViaqa/OU64ywCodqTcKedu6f0v+kE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TanESvbFp8v8iY3MywEJbYgF8+YSXDA8SJzWl+rUb9HO81FjRUN/BfpIvOxHflBrl
	 rsEUDrDBECwqURT3b2J33aFKc/93BZiZ/NoSupQanIiEjqfeTO9xrCrdTLY0eT+1rF
	 2zRsIVkH0QqVi6nSJUZgTMJfLEqw5al4L65AyIEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 193AAF80158;
	Tue, 12 May 2020 21:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E3A3F8014C; Tue, 12 May 2020 21:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F985F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 21:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F985F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="0anGIcvo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbLELbRn3gSMPRQJheBzNsZNPZ4JbTAMtvtBl1vWIT6mIjedI01cuEHUCRBc4yRMtAaEdO3wfhK/WTxz6QS6QWb9T41yz7KG0HZF4qgC+6Sq/CddvN1pJUPOscDEWU25AecDMb1Otj70FYnKp+X5ht1gJ58rZ3QctTB8mlDiYeYAO5wYOtZ9tZXKpjQe2MkcVRnHF3zq+ZaZaBmwQM8xntBrSmYQ/j4jpJZxOhQcNIqx/j4ovLvOoQEKIyHIwcUnxnh0+nm4sRzam8VyoiiUNH8VlhP+qsWohBGTDdvN0BJViBuOYcgeT9lP/jtWCeV27C38q1x4CkP9W42MZnzBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHJ8qBGl1HtVpAViaqa/OU64ywCodqTcKedu6f0v+kE=;
 b=YL+SwM0ts9kDn3D27pQoehRRnITLHGwsb4Z4PI2N2aDgUk8IPralsqJi6JqEWiaT4nQ6JADzQY137GwU4oP4JslOxrjWfnXEpg5rTcX+JF9wGmGrzTvcsrO0QtkzaWTivmW3eYx4n2dmCULcb4W2BvBtjrbA1I+rWfe09aiFMyZ/0XFHQpr+DhuHaC0lLeOXYgPbrTDN+FG8xQyoFkXBCVSAU2rRugNUAGUWjqk9+nVT7Tv1LZ4liSbjb8FVBMARv8WkaeqZOv6WzE+ZIvNFE5AgaA5/BDDdvg49Q2EHpuRcK+79vRWJL5nw8aQC1alxdDd4CsIr1riRAF0Qi1pjzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHJ8qBGl1HtVpAViaqa/OU64ywCodqTcKedu6f0v+kE=;
 b=0anGIcvo0Ql9C4Ucvkd2sN44yDieKColLIyOKuNJJ6HwI/jusR9X/PcWWYsSBNpfssTN5wxaQxodIyUdIuVkZQgT5PSfuFyjfoPQrWIAvn8dIrG7Gsz2Q4uNTNoE+JyMAfUtJJshEffodkPD+qSKQkTV1mNyJCtxiaAxUHTvLDQ=
Received: from BYAPR12MB2632.namprd12.prod.outlook.com (2603:10b6:a03:6c::21)
 by BYASPR01MB2.namprd12.prod.outlook.com (2603:10b6:a02:ce::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 12 May
 2020 19:54:34 +0000
Received: from BYAPR12MB2632.namprd12.prod.outlook.com
 ([fe80::841b:f259:b250:1e55]) by BYAPR12MB2632.namprd12.prod.outlook.com
 ([fe80::841b:f259:b250:1e55%6]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 19:54:34 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Topic: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Index: AQHWJ9oDqvYojRTkQ06RJWLof66Ai6ijd1eAgAEATACAABlAgIAAS1zA
Date: Tue, 12 May 2020 19:54:34 +0000
Message-ID: <BYAPR12MB2632FF6DE6FBA71764F40E1197BE0@BYAPR12MB2632.namprd12.prod.outlook.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-10-alexander.deucher@amd.com>
 <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
 <CADnq5_NHzg5dVhbx9ZqNDgVZVWfGaUteVtxLRORCXVM6UOP1nQ@mail.gmail.com>
 <565ebd07-e515-c84c-f4c5-7997dbac308b@linux.intel.com>
In-Reply-To: <565ebd07-e515-c84c-f4c5-7997dbac308b@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-05-12T19:46:17Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=2939ac1d-11fa-4add-b2dc-0000ffe9970e;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-05-12T19:54:30Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 27dc46e7-9593-4a44-b2d1-0000b5fa02c0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.158.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 80b666d3-4c2e-4cfd-659d-08d7f6ae4b49
x-ms-traffictypediagnostic: BYASPR01MB2:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYASPR01MB282D44D79E1C0F1299ABA97BE0@BYASPR01MB2.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V1VlMOs4d5DaLu8hmqB2+yMk0oca7ETgWwq3OewjNh4Yi5zwXqWXIHSJwWblMcG+n2LdZz91mIQqfxd0/Dj9RbCcMZjTmSc92nkG42ZnWGhiyRcAlQKnIepy8j5C/NcsR/7NR1Cs1b3GUzaGLcIaz6B+We78bAimhW9TuVjjOeeabKMBVTsKZQbkFS4PvtrwX+HUhm3lKg4mGYV+wfeYXGyIrMinpoUFBBQ4shVghEASghnh4AVzUNgckaZRvDfvBpdVNSos4TwTPGMRBbPbDSgGC0sb/f7iOdn76WRCWrJKw3zDvqKTk9MTTiTgMEmuQg1cn5YsTAjqTu6g3Ku+w7BtJsK885N4FVbTEMzJqHH30azx93JqImw3XoespTqByCZcuFZFaegRDESgxxllg6aGLT7Iqb494B//l9zUObKwwRwQSvnQJIgs85WCN12kv1Y0+NujIXhSHObXnH5IUMSJ+YyW/Cb2ckAyLQDiuom9WBUxOcZzUm2siWzJi93/vyfrxe8vuNHi4sCSrMwmYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2632.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(33430700001)(55016002)(66946007)(66446008)(5660300002)(110136005)(2906002)(76116006)(86362001)(66476007)(316002)(66556008)(8676002)(64756008)(8936002)(26005)(6506007)(53546011)(4326008)(7696005)(186003)(71200400001)(478600001)(9686003)(33656002)(52536014)(54906003)(33440700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: UYQkP41Mp/azXIZ7zGcvEO0SrHCsh2Mui35vp1lskWpvBL/hwOc4hYbPZutNYLVzIj0Pk+h0xTHxvNgKgOoJxf108TBo8BRFKnEoj6Ctq7N/ZUa4kHmlpemzZnrUdvntlEw/ZgtMkWJ37vuEK/tFKYU8sSHci2zyVB3QA5WfJ60djVVItbrFi/C4OUa8mZRpsk08rgRO+CC5MgG/rPGRpv6PL0mZWd2S7Y6xmC0GGETACJT0xiQXia8GTUy9WB7sKGVvFpGgW0G69M4MdcuJH4awhhmWX75ULbhf401Jt6akozLJSRaSR3juOffYNCIKJ0ZfK3b2f51VNTiFuOYxP8kxgxsS1U67+Gw0k571qFgfIS7MN86oQkFL6rsRz9ziFzqxpIylZadfrp57IxUCJkXvScm9RXDpWbqRZv0wJFCov3kkBY6bPU8ABq7zy0gNuSTtJ4pYD2Suj/isveZIUTIrfKA6wHxtBF8s8PenfkfimE7aqDwgujiqp40bX4TA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b666d3-4c2e-4cfd-659d-08d7f6ae4b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 19:54:34.2858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxGvVCspa+q4s3po4x2e15joQlAnnIk78r1MLGElhJaJ8Iv2auM7nfL3zEhxX7tTXnNLpf1sjQ1VfzL6hPWAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB2
Cc: Takashi Iwai <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVl
c2RheSwgTWF5IDEyLCAyMDIwIDg6NDYgUE0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPg0KPiBDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPjsgRGV1Y2hl
ciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgYWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnOyBNYXJrIEJyb3duDQo+IDxicm9vbmllQGtlcm5lbC5vcmc+OyBNdWt1
bmRhLCBWaWplbmRhciA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA5LzE0XSBBU29DOiBhbWQ6IGFkZCBSZW5vaXIgQUNQIFBDSSBkcml2ZXIgUE0g
b3BzDQo+IA0KPiANCj4gDQo+IE9uIDUvMTIvMjAgODo0NiBBTSwgQWxleCBEZXVjaGVyIHdyb3Rl
Og0KPiA+IE9uIE1vbiwgTWF5IDExLCAyMDIwIGF0IDY6MzcgUE0gUGllcnJlLUxvdWlzIEJvc3Nh
cnQNCj4gPiA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4g
Pj4NCj4gPj4NCj4gPj4+IEBAIC0yMzMsNiArMjM0LDExIEBAIHN0YXRpYyBpbnQgc25kX3JuX2Fj
cF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpLA0KPiA+Pj4gICAgICAgICAgICAgICAgcmV0ID0g
UFRSX0VSUihhZGF0YS0+cGRldik7DQo+ID4+PiAgICAgICAgICAgICAgICBnb3RvIHVucmVnaXN0
ZXJfZGV2czsNCj4gPj4+ICAgICAgICB9DQo+ID4+PiArICAgICBwbV9ydW50aW1lX3NldF9hdXRv
c3VzcGVuZF9kZWxheSgmcGNpLT5kZXYsDQo+IEFDUF9TVVNQRU5EX0RFTEFZX01TKTsNCj4gPj4+
ICsgICAgIHBtX3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKCZwY2ktPmRldik7DQo+ID4+PiArICAg
ICBwbV9ydW50aW1lX2FsbG93KCZwY2ktPmRldik7DQo+ID4+PiArICAgICBwbV9ydW50aW1lX21h
cmtfbGFzdF9idXN5KCZwY2ktPmRldik7DQo+ID4+PiArICAgICBwbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZCgmcGNpLT5kZXYpOw0KPiA+Pg0KPiA+PiB1c3VhbGx5IHRoZXJlIGlzIGEgcG1fcnVu
dGltZV9wdXRfbm9pZGxlKCkgaGVyZT8NCj4gPg0KPiA+IEknbSBub3Qgc3VyZS4NCj4gPg0KPiA+
Pg0KPiA+PiBbLi4uXQ0KPiA+Pg0KPiA+Pj4gICAgc3RhdGljIHZvaWQgc25kX3JuX2FjcF9yZW1v
dmUoc3RydWN0IHBjaV9kZXYgKnBjaSkNCj4gPj4+ICAgIHsNCj4gPj4+ICAgICAgICBzdHJ1Y3Qg
YWNwX2Rldl9kYXRhICphZGF0YTsNCj4gPj4+IEBAIC0yNjAsNiArMzAyLDkgQEAgc3RhdGljIHZv
aWQgc25kX3JuX2FjcF9yZW1vdmUoc3RydWN0IHBjaV9kZXYNCj4gKnBjaSkNCj4gPj4+ICAgICAg
ICByZXQgPSBybl9hY3BfZGVpbml0KGFkYXRhLT5hY3BfYmFzZSk7DQo+ID4+PiAgICAgICAgaWYg
KHJldCkNCj4gPj4+ICAgICAgICAgICAgICAgIGRldl9lcnIoJnBjaS0+ZGV2LCAiQUNQIGRlLWlu
aXQgZmFpbGVkXG4iKTsNCj4gPj4+ICsgICAgIHBtX3J1bnRpbWVfcHV0X25vaWRsZSgmcGNpLT5k
ZXYpOw0KPiA+Pj4gKyAgICAgcG1fcnVudGltZV9nZXRfc3luYygmcGNpLT5kZXYpOw0KPiA+Pj4g
KyAgICAgcG1fcnVudGltZV9mb3JiaWQoJnBjaS0+ZGV2KTsNCj4gPj4NCj4gPj4gZG9pbmcgYSBw
dXRfbm9pZGxlKCkgZm9sbG93ZWQgYnkgYSBnZXRfc3luYygpIGFuZCBpbW1lZGlhdGVseSBmb3Ji
aWQoKQ0KPiA+PiBpcyB2ZXJ5IG9kZCBhdCBiZXN0Lg0KPiA+PiBJc24ndCB0aGUgcmVjb21tZW5k
YXRpb24gdG8gY2FsbCBnZXRfbm9yZXN1bWUoKSBoZXJlPw0KPiA+Pg0KPiA+DQo+ID4gSSdtIG5v
dCBzdXJlIGhlcmUgZWl0aGVyLiAgSXMgdGhlcmUgc29tZSBkZWZpbml0aXZlIGRvY3VtZW50YXRp
b24gb24NCj4gPiB3aGF0IGV4YWN0IHNlcXVlbmNlcyBhcmUgc3VwcG9zZWQgdG8gYmUgdXNlZCBp
biBkcml2ZXJzPyAgQSBxdWljaw0KPiA+IGJyb3dzZSB0aHJvdWdoIGRyaXZlcnMgdGhhdCBpbXBs
ZW1lbnQgcnVudGltZSBwbSBzZWVtcyB0byBzaG93IGEgbG90DQo+ID4gb2YgdmFyaWF0aW9uLiAg
VGhpcyBzZXF1ZW5jZSB3b3Jrcy4gIEknbSBub3Qgc3VyZSBpZiBpdCdzIG9wdGltYWwgb3INCj4g
PiBub3QuDQo+IA0KPiBXZSBiYXNlZCBvdXIgc2VxdWVuY2Ugb24gdGhlIGNvbW1lbnRzIGluIGRy
aXZlcnMvcGNpL3BjaS1kcml2ZXIuYw0KPiANCj4gLyoNCj4gICAqIFVuYm91bmQgUENJIGRldmlj
ZXMgYXJlIGFsd2F5cyBwdXQgaW4gRDAsIHJlZ2FyZGxlc3Mgb2YNCj4gICAqIHJ1bnRpbWUgUE0g
c3RhdHVzLiAgRHVyaW5nIHByb2JlLCB0aGUgZGV2aWNlIGlzIHNldCB0bw0KPiAgICogYWN0aXZl
IGFuZCB0aGUgdXNhZ2UgY291bnQgaXMgaW5jcmVtZW50ZWQuICBJZiB0aGUgZHJpdmVyDQo+ICAg
KiBzdXBwb3J0cyBydW50aW1lIFBNLCBpdCBzaG91bGQgY2FsbCBwbV9ydW50aW1lX3B1dF9ub2lk
bGUoKSwNCj4gICAqIG9yIGFueSBvdGhlciBydW50aW1lIFBNIGhlbHBlciBmdW5jdGlvbiBkZWNy
ZW1lbnRpbmcgdGhlIHVzYWdlDQo+ICAgKiBjb3VudCwgaW4gaXRzIHByb2JlIHJvdXRpbmUgYW5k
IHBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKCkgaW4NCj4gICAqIGl0cyByZW1vdmUgcm91dGluZS4N
Cj4gICAqLw0KDQpJZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5LCBiZWxvdyBzaG91bGQgYmUgIHRo
ZSBjb3JyZWN0IHNlcXVlbmNlIHJpdGUgPw0KDQphY3AgcGNpIGRyaXZlciBwcm9iZSBzZXF1ZW5j
ZToNCg0KcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoJnBjaS0+ZGV2LCBBQ1BfU1VT
UEVORF9ERUxBWV9NUyk7DQpwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZCgmcGNpLT5kZXYpOw0K
cG1fcnVudGltZV9wdXRfbm9pZGxlKCZwY2ktPmRldik7DQpwbV9ydW50aW1lX2FsbG93KCZwY2kt
PmRldik7CQ0KCQ0KYWNwIHBjaSBkcml2ZXIgcmVtb3ZlIHNlcXVlbmNlOg0KDQpwbV9ydW50aW1l
X2dldF9ub3Jlc3VtZSgmcGNpLT5kZXYpOw0KcG1fcnVudGltZV9kaXNhYmxlKCZwY2ktPmRldik7
DQoNCkkgaGF2ZSBzdGlsbCBoYXZlIGEgZG91YnQuIA0KRG8gd2UgbmVlZCB0byBjYWxsIHBtX3J1
bnRpbWVfZGlzYWJsZSgpIGV4cGxpY2l0bHkgIGluIHRoaXMgY2FzZSA/DQoNCg==
