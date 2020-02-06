Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDA8154A06
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 18:08:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4869616D1;
	Thu,  6 Feb 2020 18:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4869616D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581008931;
	bh=3/N3AIjmzgenJDIcBLno4kBjkciip1mvoyyWRVx7atQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eT0oeuTk2va1k6YilY0BVM305ztKwf3v6u9a6M4gUZsRkZiLQ7ayskldNLNMpY7ys
	 yNNa3Rdok8R7h92FvkDZcR0VOOSDfuS7lGaomhAr2ZvowlTCxLzKQAFLkvEzuL/9Ep
	 UWZ42q7/kcWw2UYfU82LNN18FfAOJkGaAr6EVWxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C901F80162;
	Thu,  6 Feb 2020 18:07:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D7DF8015B; Thu,  6 Feb 2020 18:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=NO_DNS_FOR_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EF13F80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 18:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF13F80059
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-244-k3KJlLTsOyOEt3BxP61xAA-1; Thu, 06 Feb 2020 17:06:48 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 6 Feb 2020 17:06:47 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 6 Feb 2020 17:06:47 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dmitry Osipenko' <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Thread-Topic: [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S driver
Thread-Index: AQHV3Q7P9u0Xi3sD8kGXpD/1/LgEEKgOY//Q
Date: Thu, 6 Feb 2020 17:06:47 +0000
Message-ID: <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
 <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
In-Reply-To: <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: k3KJlLTsOyOEt3BxP61xAA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "atalambedu@nvidia.com" <atalambedu@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "viswanathl@nvidia.com" <viswanathl@nvidia.com>,
 "sharadg@nvidia.com" <sharadg@nvidia.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "rlokhande@nvidia.com" <rlokhande@nvidia.com>,
 "mkumard@nvidia.com" <mkumard@nvidia.com>,
 "dramesh@nvidia.com" <dramesh@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S
	driver
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

RnJvbTogZiBEbWl0cnkgT3NpcGVua28NCj4gU2VudDogMDYgRmVicnVhcnkgMjAyMCAxNjo1OQ0K
PiANCj4gMzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6DQo+IC4uLg0K
PiA+ICtzdGF0aWMgY29uc3QgaW50IHRlZ3JhMjEwX2NpZl9mbXRbXSA9IHsNCj4gPiArCTAsDQo+
ID4gKwlURUdSQV9BQ0lGX0JJVFNfMTYsDQo+ID4gKwlURUdSQV9BQ0lGX0JJVFNfMzIsDQo+ID4g
K307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3QgaW50IHRlZ3JhMjEwX2kyc19iaXRfZm10W10g
PSB7DQo+ID4gKwkwLA0KPiA+ICsJSTJTX0JJVFNfMTYsDQo+ID4gKwlJMlNfQklUU18zMiwNCj4g
PiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBpbnQgdGVncmEyMTBfaTJzX3NhbXBsZV9z
aXplW10gPSB7DQo+ID4gKwkwLA0KPiA+ICsJMTYsDQo+ID4gKwkzMiwNCj4gPiArfTsNCj4gDQo+
IHN0YXRpYyBjb25zdCAqdW5zaWduZWQqIGludD8NCg0KT3IgZ2V0IHJpZCBvZiB0aGUgdGFibGUg
bG9va3VwcyBjb21wbGV0ZWx5Lg0KQXNzdW1pbmcgdGhlIGluZGV4IGlzIG5ldmVyIHplcm8gdGhl
biB0aGUgdmFsdWUNCmNhbiBiZSBjYWxjdWxhdGVkIGFzIChjb25zdF9hICsgY29uc3RfYiAqIGlu
ZGV4KS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxl
eSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0
aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
