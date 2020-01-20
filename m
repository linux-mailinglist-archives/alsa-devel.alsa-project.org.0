Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB9142574
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 09:27:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C891673;
	Mon, 20 Jan 2020 09:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C891673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579508841;
	bh=Pg7rbp7FNPX2pl0BpUJXoxJWdHtzkY3mgLsRIt8IbkA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5PUxBqy32drI32AVGLsrA2BONn+Er97V+IEtm8yDIixWGuKQJ7WDL/Vq9BLC9lPW
	 a04+idSHRZhiHV8CTafTWAoMAAiUMQHMNA6MbQarsElkMxIJ0xxwT3eNvjk66bNGGt
	 cGpLVSGw+oTa5frPhsb8H3BNBt3P51agLKiR2Uoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF08FF8022D;
	Mon, 20 Jan 2020 09:25:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E870F8020C; Mon, 20 Jan 2020 09:25:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EBCFF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 09:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EBCFF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qz04fAbH"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00K8PNjD003167;
 Mon, 20 Jan 2020 02:25:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579508723;
 bh=ZxlEdjcA4zla0J1zMFX4vLrnGWOFr7X8vNReEv5IQnc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qz04fAbHri2+m/I6Vbk2tLv1jojHXOQCq9NBR05uJl8aoZ8VAgzH45gQNgIIJQZtp
 WJol0rqhVgFGiZ62zUDbavWWX5ZZbv1A9mCxtOTRmgwQrb8W5xOzgARgBzo8oqvGqe
 eB/ITgEqArGfIjiHhQZe2KQAkRb+hlOnEtcd+Q7w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00K8PNQI006464
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Jan 2020 02:25:23 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 02:25:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 02:25:22 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00K8PK6h050823;
 Mon, 20 Jan 2020 02:25:21 -0600
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87eevvym6s.wl-kuninori.morimoto.gx@renesas.com>
 <871rrvym3p.wl-kuninori.morimoto.gx@renesas.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <eadad0f8-c083-2a44-7f83-93c6973b9800@ti.com>
Date: Mon, 20 Jan 2020 10:26:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <871rrvym3p.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 09/17] ASoC: ti: omap-mcpdm: move
 .suspend/.resume to component
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

CgpPbiAyMC8wMS8yMDIwIDMuMDQsIEt1bmlub3JpIE1vcmltb3RvIHdyb3RlOgo+IEZyb206IEt1
bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPiAKPiBU
aGVyZSBpcyBubyBiaWcgZGlmZmVyZW5jZSBhdCBpbXBsZW1lbnRhdGlvbiBmb3IgLnN1c3BlbmQv
LnJlc3VtZQo+IGJldHdlZW4gREFJIGRyaXZlciBhbmQgQ29tcG9uZW50IGRyaXZlci4KPiBCdXQg
YmVjYXVzZSBzb21lIGRyaXZlciBpcyB1c2luZyBEQUkgdmVyc2lvbiwgdGh1cyBBTFNBIFNvQyBu
ZWVkcwo+IHRvIGtlZXAgc3VwcG9ydGluZyBpdCwgaGVuY2UsIGZyYW1ld29yayBiZWNvbWluZyB2
ZXJib3NlLgo+IElmIHdlIGNhbiBzd2l0Y2ggYWxsIERBSSBkcml2ZXIgLnN1c3BlbmQvLnJlc3Vt
ZSB0byBDb21wb25lbnQgZHJpdmVyLAo+IHdlIGNhbiByZW1vdmUgdmVyYm9zZSBjb2RlIGZyb20g
QUxTQSBTb0MuCj4gCj4gRHJpdmVyIGlzIGdldHRpbmcgaXRzIHByaXZhdGUgZGF0YSB2aWEgZGFp
LT5kZXYuCj4gQnV0IGRhaS0+ZGV2IGFuZCBjb21wb25lbnQtPmRldiBhcmUgc2FtZSBkZXYsIHRo
dXMsIHdlIGNhbiBjb252ZXJ0Cj4gdGhlc2UuIEZvciBzYW1lIHJlYXNvbiwgd2UgY2FuIGNvbnZl
cnQgZGFpLT5hY3RpdmUgdG8KPiBjb21wb25lbnQtPmFjdGl2ZSBpZiBuZWNlc3NhcnkuCj4gCj4g
VGhpcyBwYXRjaCBtb3ZlcyBEQUkgZHJpdmVyIC5zdXNwZW5kLy5yZXN1bWUgdG8gQ29tcG9uZW50
IGRyaXZlcgoKQWNrZWQtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+
Cgo+IFNpZ25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5n
eEByZW5lc2FzLmNvbT4KPiAtLS0KPiAgc291bmQvc29jL3RpL29tYXAtbWNwZG0uYyB8IDE2ICsr
KysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RpL29tYXAtbWNwZG0uYyBiL3Nv
dW5kL3NvYy90aS9vbWFwLW1jcGRtLmMKPiBpbmRleCBiOGM4MjkwLi5hNzI2Y2Q3IDEwMDY0NAo+
IC0tLSBhL3NvdW5kL3NvYy90aS9vbWFwLW1jcGRtLmMKPiArKysgYi9zb3VuZC9zb2MvdGkvb21h
cC1tY3BkbS5jCj4gQEAgLTQ1OCwxMSArNDU4LDExIEBAIHN0YXRpYyBpbnQgb21hcF9tY3BkbV9y
ZW1vdmUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4gIH0KPiAgCj4gICNpZmRlZiBDT05GSUdf
UE1fU0xFRVAKPiAtc3RhdGljIGludCBvbWFwX21jcGRtX3N1c3BlbmQoc3RydWN0IHNuZF9zb2Nf
ZGFpICpkYWkpCj4gK3N0YXRpYyBpbnQgb21hcF9tY3BkbV9zdXNwZW5kKHN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50KQo+ICB7Cj4gLQlzdHJ1Y3Qgb21hcF9tY3BkbSAqbWNwZG0g
PSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+ICsJc3RydWN0IG9tYXBfbWNwZG0gKm1j
cGRtID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsKPiAgCj4gLQlp
ZiAoZGFpLT5hY3RpdmUpIHsKPiArCWlmIChjb21wb25lbnQtPmFjdGl2ZSkgewo+ICAJCW9tYXBf
bWNwZG1fc3RvcChtY3BkbSk7Cj4gIAkJb21hcF9tY3BkbV9jbG9zZV9zdHJlYW1zKG1jcGRtKTsK
PiAgCX0KPiBAQCAtNDc2LDE1ICs0NzYsMTUgQEAgc3RhdGljIGludCBvbWFwX21jcGRtX3N1c3Bl
bmQoc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3Rh
dGljIGludCBvbWFwX21jcGRtX3Jlc3VtZShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKPiArc3Rh
dGljIGludCBvbWFwX21jcGRtX3Jlc3VtZShzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBv
bmVudCkKPiAgewo+IC0Jc3RydWN0IG9tYXBfbWNwZG0gKm1jcGRtID0gc25kX3NvY19kYWlfZ2V0
X2RydmRhdGEoZGFpKTsKPiArCXN0cnVjdCBvbWFwX21jcGRtICptY3BkbSA9IHNuZF9zb2NfY29t
cG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7Cj4gIAo+ICAJaWYgKG1jcGRtLT5wbV9hY3Rp
dmVfY291bnQpIHsKPiAgCQl3aGlsZSAobWNwZG0tPnBtX2FjdGl2ZV9jb3VudC0tKQo+ICAJCQlw
bV9ydW50aW1lX2dldF9zeW5jKG1jcGRtLT5kZXYpOwo+ICAKPiAtCQlpZiAoZGFpLT5hY3RpdmUp
IHsKPiArCQlpZiAoY29tcG9uZW50LT5hY3RpdmUpIHsKPiAgCQkJb21hcF9tY3BkbV9vcGVuX3N0
cmVhbXMobWNwZG0pOwo+ICAJCQlvbWFwX21jcGRtX3N0YXJ0KG1jcGRtKTsKPiAgCQl9Cj4gQEAg
LTUwNCw4ICs1MDQsNiBAQCBzdGF0aWMgaW50IG9tYXBfbWNwZG1fcmVzdW1lKHN0cnVjdCBzbmRf
c29jX2RhaSAqZGFpKQo+ICBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBvbWFwX21j
cGRtX2RhaSA9IHsKPiAgCS5wcm9iZSA9IG9tYXBfbWNwZG1fcHJvYmUsCj4gIAkucmVtb3ZlID0g
b21hcF9tY3BkbV9yZW1vdmUsCj4gLQkuc3VzcGVuZCA9IG9tYXBfbWNwZG1fc3VzcGVuZCwKPiAt
CS5yZXN1bWUgPSBvbWFwX21jcGRtX3Jlc3VtZSwKPiAgCS5wcm9iZV9vcmRlciA9IFNORF9TT0Nf
Q09NUF9PUkRFUl9MQVRFLAo+ICAJLnJlbW92ZV9vcmRlciA9IFNORF9TT0NfQ09NUF9PUkRFUl9F
QVJMWSwKPiAgCS5wbGF5YmFjayA9IHsKPiBAQCAtNTI3LDYgKzUyNSw4IEBAIHN0YXRpYyBzdHJ1
Y3Qgc25kX3NvY19kYWlfZHJpdmVyIG9tYXBfbWNwZG1fZGFpID0gewo+ICAKPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudF9kcml2ZXIgb21hcF9tY3BkbV9jb21wb25lbnQg
PSB7Cj4gIAkubmFtZQkJPSAib21hcC1tY3BkbSIsCj4gKwkuc3VzcGVuZAk9IG9tYXBfbWNwZG1f
c3VzcGVuZCwKPiArCS5yZXN1bWUJCT0gb21hcF9tY3BkbV9yZXN1bWUsCj4gIH07Cj4gIAo+ICB2
b2lkIG9tYXBfbWNwZG1fY29uZmlndXJlX2RuX29mZnNldHMoc3RydWN0IHNuZF9zb2NfcGNtX3J1
bnRpbWUgKnJ0ZCwKPiAKCi0gUMOpdGVyCgpUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQ
b3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2
MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
