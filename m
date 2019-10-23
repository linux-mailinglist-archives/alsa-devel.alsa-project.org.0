Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57236E1F11
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 17:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1021658;
	Wed, 23 Oct 2019 17:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1021658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571843992;
	bh=Oj8Rf/T1jwZwj36tNce/LjNaNHtBdn+wiC5T8GNfYiQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWXIFODZ3OF+ivO14d/3THrC6DhOi7OR7TfU2ykPv4sn9OkQSvUmAdDkiQFfWom51
	 uoIItu/u6eHw9AhWXMDRm2NKA1k3hP99rEZCJHfyNEGTU1I6eVa9K45CcKq5v4vzmz
	 hbgll667QejMJ3F9pEFd7yzvJMt5+t7tQ+wkPVBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 228AFF80321;
	Wed, 23 Oct 2019 17:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D12F80368; Wed, 23 Oct 2019 17:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092000024.outbound.protection.outlook.com [40.92.0.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 663C7F802DF
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 17:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 663C7F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com
 header.b="oqCY38qA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP5INpgLS/8CAeRco00h+EC/YB4kmU1eHr0LIBDeI8ldifE6aPcx657Rkyls7mJDvySP+8WX8+QellP8CwLGAmGPxHALWrY4205Hk5N67XPUHQAv3Ft/4pskMlQxIcMgPlpDnoI7rRs7Gl9psPgf/dMs+8v6Fzbqz7JtxWJ8qCmOIYbqbe1dT8ldTTOWfd30ipZ3CNYWH+p2k4nWg5G58OsFHBOLtNKM8v21EYZaZeYjQqNbkwH+10N/ryUra1FFunZkl2T22DvE6/jFHwOgilP05J//uI97LiimGljuhMBOtpycjJ23SnS/Kb2M/wsWsX8yQD2n0w13VgsrPGf5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlQlHMmghlHDsiKKJ2e3gMtEIDokU5zgkrn5hFZoMN0=;
 b=J1VcGEXlGHdvJkshP23UTm6V2TnFbvUK7WZSXwlQtaxXkuARjRTp0y3qO66jBYrH12xmnqYbHt422ivZMtHPzFqlEKSs8L+BSAdmsQEg6QjKOrt40X0rdEVDUOEq1GTUdnN8W+CJGof9XZwK26B2KXfTf+37/fcVyhJMvyqzwsadX/kygFRThyEU3y352VE9jJs/ueIavV7wVnBKJ2oalTfIVG9IzMMD7LNILwCl1Tcf5GlVHYZr05mXlVDM0la7xL9YXdfO8ohNR1YcmWNK6gDHi0dLBCOUAvVXgGyCpR+8S1J3gJXhS3ZZ6kFDo9ZHL+1kNRBjNLbOt+HOdHKRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlQlHMmghlHDsiKKJ2e3gMtEIDokU5zgkrn5hFZoMN0=;
 b=oqCY38qAN1H10whsXRaoReQ0iHSJp43ksm9+UwNwbpBXBi9WzoW0Nyh+pXpTk5Zy6GoijrjniZD39yvWFv/ml8xrLAOK3ucx6Xo3vOKYi8SDdwsbj5maikmaiEMQuQQI7ki/tGJK9Hr39qUeBwPc2Pnny0ssBKwHzX72AiKFO7o01QNlOjTkgawc5LsVoHu3W5EXkowU2tiQUTC2ojiT6gP6DCfTqzStNJxukmZionqtD+2y+GkuUWdgKP2ZXf76/0kNBeIaLTysxnllcEHbGZMLKSsnNVexVxLIlLt/yKCbcEbKH87dlT8lTuB8K62xEn2jc+aJho6GVZofv/uohA==
Received: from BY2NAM01FT032.eop-nam01.prod.protection.outlook.com
 (10.152.68.56) by BY2NAM01HT058.eop-nam01.prod.protection.outlook.com
 (10.152.69.141) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16; Wed, 23 Oct
 2019 15:17:57 +0000
Received: from BY5PR12MB3699.namprd12.prod.outlook.com (10.152.68.52) by
 BY2NAM01FT032.mail.protection.outlook.com (10.152.69.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16 via Frontend Transport; Wed, 23 Oct 2019 15:17:57 +0000
Received: from BY5PR12MB3699.namprd12.prod.outlook.com
 ([fe80::d1f8:8629:7310:e845]) by BY5PR12MB3699.namprd12.prod.outlook.com
 ([fe80::d1f8:8629:7310:e845%4]) with mapi id 15.20.2367.025; Wed, 23 Oct 2019
 15:17:57 +0000
From: Lihua Yao <ylhuajnu@outlook.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Thread-Topic: [PATCH 00/36] ARM: samsung platform cleanup
Thread-Index: AQHViaNOwtgFIwFiP02oYWU3zucI06doO1MAgAAbYIA=
Date: Wed, 23 Oct 2019 15:17:57 +0000
Message-ID: <BY5PR12MB3699C846E761F257D0FB1373C46B0@BY5PR12MB3699.namprd12.prod.outlook.com>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191023131049.GG11048@pi3>
 <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1v2-+geD+JbNP-t418ZjntQNSte4rt8c7N6sJdpb3+DQ@mail.gmail.com>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To BY5PR12MB3699.namprd12.prod.outlook.com
 (2603:10b6:a03:195::16)
x-incomingtopheadermarker: OriginalChecksum:529384D5AD68C306DF64A868DA26EEA0698BB72E32CBD6FA2DDBDBD00DCF79F6;
 UpperCasedChecksum:E47105BD3F66D6E35B3665A0B168C4E695D84CA981A4137EAC92B67D33179E2A;
 SizeAsReceived:8870; Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [FB4ZodDWkjklu+6rjx/UXq/8gBhMyUPd]
x-microsoft-original-message-id: <346ede3a-182c-d83e-8eef-58816e04f928@outlook.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: BY2NAM01HT058:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pbWrxofQMKSHrBj86AWl/NUo98gQEdUNXvtvwjvPbinwQAriOtoSBOIbPWSS1od6QsundSbV1jD5pglDPnK9/ls2hHOvQCCrUCwkE9/VNhOdu7wSyzZWSY8Avz/Gm04m7ubxePG+/M5da2O/OH61jgAf2PXe6q7CAOm1Mmh9xKp6iovz7cW8bm1aU1an5AaB
x-ms-exchange-transport-forked: True
Content-ID: <DCE39A5A7726614091BE95843816F1DC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d8ea68-88ea-4531-2790-08d757cc2f30
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 15:17:57.5792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM01HT058
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "moderated
 list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "open list:HID
 CORE LAYER" <linux-input@vger.kernel.org>,
 =?utf-8?B?UGF3ZcWCIENobWllbA==?= <pawel.mikolaj.chmiel@gmail.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Linux PM list <linux-pm@vger.kernel.org>, Lihua Yao <ylhuajnu@163.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 USB list <linux-usb@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/36] ARM: samsung platform cleanup
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

SGkgQXJuZCwgS3J6eXN6dG9mLA0KDQpPbiAyMy8xMC8yMDE5IDk6MzkgUE0sIEFybmQgQmVyZ21h
bm4gd3JvdGU6DQo+IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDM6MTEgUE0gS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToNCj4+IE9uIFRodSwgT2N0IDEwLCAyMDE5
IGF0IDEwOjI4OjAyUE0gKzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4gVGhlIGNvbnRl
bnRzIGFyZSBhdmFpbGFibGUgZm9yIHRlc3RpbmcgaW4NCj4+Pg0KPj4+IGdpdDovL2tlcm5lbC5v
cmc6L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hcm5kL3BsYXlncm91bmQuZ2l0IHMzYy1tdWx0
aXBsYXRmb3JtDQo+PiBXaGVuIHNlbmRpbmcgdjIsIGNhbiB5b3UgQ2M6DQo+Pg0KPj4gUGF3ZcWC
IENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29tPg0KPj4gTGlodWEgWWFvIDx5
bGh1YWpudUBvdXRsb29rLmNvbT4NCj4+IChvciBMaWh1YSBZYW8gPHlsaHVham51QDE2My5jb20+
IGlmIG91dGxvb2suY29tIGJvdW5jZXMpDQoNCllvdSBjb3VsZCByZWFjaCBtZSBieSBlLW1haWwg
dG8gTGlodWEgWWFvIDxsaWh1YS55YW9AZ214LmNvbT4uDQoNCk5laXRoZXIgMTYzLmNvbSBub3Ig
b3V0bG9vay5jb20gZS1tYWlsIHNlcnZlciBjb29wZXJhdGVzIHdlbGwgd2l0aA0KDQp2Z2VyLmtl
cm5lbC5vcmcgbWFpbCBsaXN0Lg0KDQo+PiBTZXJnaW8gUHJhZG8gPHNlcmdpby5wcmFkb0BlLWxh
YndvcmtzLmNvbT4NCj4+IFN5bHdlc3RlciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNv
bT4NCj4+DQo+PiBUaGVzZSBhcmUgZm9sa3Mgd2hpY2ggdG8gbXkga25vd2xlZGdlIGhhZCB3b3Jr
aW5nIFMzQyBhbmQgUzVQIGJvYXJkcw0KPj4gc28gbWF5YmUgdGhleSBjb3VsZCBwcm92aWRlIHRl
c3RpbmcuDQo+IE9rLCB3aWxsIGRvLiBJJ3ZlIHVwbG9hZGVkIHRoZSBtb2RpZmllZCB2ZXJzaW9u
IGJhc2VkIG9uIHlvdXIgY29tbWVudHMgdG8NCj4gdGhlIGFib3ZlIFVSTCBmb3Igbm93Lg0KPg0K
PiBJJ2xsIHByb2JhYmx5IGdpdmUgaXQgYSBsaXR0bGUgbW9yZSB0aW1lIGJlZm9yZSByZXNlbmRp
bmcsIGJ1dCB0aGV5DQo+IGNvdWxkIGFscmVhZHkNCj4gc3RhcnQgdGVzdGluZyB0aGF0IHZlcnNp
b24uDQoNCk5pY2XvvIHCoCBTYWRseSBJIGFtIG9uIHZvY2F0aW9uIGFuZCB3aWxsIHRlc3QgaXQg
dW50aWwgTm92IDE1Lg0KDQpCZXN0IFJlZ2FyZHMNCg0KTGlodWENCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
