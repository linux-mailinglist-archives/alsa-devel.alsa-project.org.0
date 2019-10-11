Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4AD481E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 21:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F8AD1671;
	Fri, 11 Oct 2019 21:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F8AD1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570820604;
	bh=x/OPa/ckpuiWluZKlQpVKC2PNYHF80cK8GqAQXy2zVo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKWx7cfraFc4rBuv8jOVHTUUx/5i4XOh3eB+zZmpPTwXMJduirgYb2fkCu9mac3Xl
	 EAh9bN7AotPQBiFcxgkDF/PfxXE/vuxsVGyw32slUDrVPNTYnpCX4JhiWzfXVMS6DO
	 rHPcHzI3TrLbVhKytAa3wBxdcMVVmXbG6DP0E02w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A12DBF802FB;
	Fri, 11 Oct 2019 21:01:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D99BF802BE; Fri, 11 Oct 2019 21:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE90F8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 21:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE90F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sitEUA9X"
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1F1121835
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570820488;
 bh=OXJpfC4PrKGIB0TVKIum4+UlgdgsdznVD/1erJWU1xY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sitEUA9Xp70tHNXunkaCrKAiLXTH7u9wkt+A7nZay4zAp3EJ8q1mN2aUh6XVbppIP
 ZzwO/WumOwbMDhK0fNHHuIntazfkSsV+jB+JNtEAv25Dr5HcpIgoGNEIn2ZAz6L9GG
 1xixVnSUQeLjJ8/c90UTmJGBXvXw0rbCRcAVK6/k=
Received: by mail-qk1-f182.google.com with SMTP id x4so5933511qkx.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 12:01:28 -0700 (PDT)
X-Gm-Message-State: APjAAAWwqD/0kLFUks5wlqUtWJSKpJ6cijWEjvrfx8TB85LAm7qFdAqt
 sm5Gy1FhZ/IUrRkK30B8j4hMYrcCMqS1KXoanw==
X-Google-Smtp-Source: APXvYqw+m3BdPtQ5veiI0zXWmiSbx0T/kyJQQfEG9X2O2adiRL4KqiawWEpCpbUQXOUcM2fbKWxSpRszEnrF7v2Dmi0=
X-Received: by 2002:a37:98c1:: with SMTP id
 a184mr16091935qke.119.1570820487882; 
 Fri, 11 Oct 2019 12:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010074234.7344-2-nuno.sa@analog.com>
 <20191010210850.GA20184@bogus>
In-Reply-To: <20191010210850.GA20184@bogus>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Oct 2019 14:01:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJu06hW-VRGZ4nFx6TYtf3yVJezUVhCSyTjP+qPmG7+Gw@mail.gmail.com>
Message-ID: <CAL_JsqJu06hW-VRGZ4nFx6TYtf3yVJezUVhCSyTjP+qPmG7+Gw@mail.gmail.com>
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 2/2] dt-bindings: asoc: Add ADAU7118
	documentation
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNDowOCBQTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDA5OjQyOjM0QU0gKzAyMDAs
IE51bm8gU8OhIHdyb3RlOgo+ID4gRG9jdW1lbnQgdGhlIEFEQVU3MTE4IDggY2hhbm5lbCBQRE0g
dG8gSTJTL1RETSBjb252ZXJ0ZXIgZGV2aWNldHJlZQo+ID4gYmluZGluZ3MuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiA+IC0tLQo+ID4gQ2hh
bmdlcyBpbiB2MjoKPiA+ICAqIExpc3QgcmVndWxhdG9ycyBhcyByZXF1aXJlZDsKPiA+Cj4gPiBD
aGFuZ2VzIGluIHYzOgo+ID4gICogU2V0IHRoZSBjb3JyZWN0IGxpY2Vuc2UgZm9yIG5ldyBiaW5k
aW5ncy4KPiA+Cj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sICAgICAg
ICAgIHwgOTAgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5MCBpbnNl
cnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9hZGksYWRhdTcxMTgueWFtbAoKTG9va3MgbGlrZSBNYXJrIGFscmVh
ZHkgYXBwbGllZCB0aGlzLiBQbGVhc2Ugc2VuZCBhIGZvbGxvdy11cCBwYXRjaAphZGRyZXNzaW5n
IG15IGNvbW1lbnRzLgoKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FkaSxhZGF1NzExOC55YW1sCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jZmNlZjYwMmIzZDkKPiA+IC0tLSAvZGV2
L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9h
ZGksYWRhdTcxMTgueWFtbAo+ID4gQEAgLTAsMCArMSw5MCBAQAo+ID4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEu
Mgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQv
YWRpLGFkYXU3MTE4LnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21l
dGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArCj4gPiArdGl0bGU6IEFuYWxvZyBEZXZp
Y2VzIEFEQVU3MTE4IDggQ2hhbm5lbCBQRE0gdG8gSTJTL1RETSBDb252ZXJ0ZXIKPiA+ICsKPiA+
ICttYWludGFpbmVyczoKPiA+ICsgIC0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiA+
ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgQW5hbG9nIERldmljZXMgQURBVTcxMTggOCBD
aGFubmVsIFBETSB0byBJMlMvVERNIENvbnZlcnRlciBvdmVyIEkyQyBvciBIVwo+ID4gKyAgc3Rh
bmRhbG9uZSBtb2RlLgo+ID4gKyAgaHR0cHM6Ly93d3cuYW5hbG9nLmNvbS9tZWRpYS9lbi90ZWNo
bmljYWwtZG9jdW1lbnRhdGlvbi9kYXRhLXNoZWV0cy9BREFVNzExOC5wZGYKPiA+ICsKPiA+ICtw
cm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgZW51bToKPiA+ICsgICAgICAt
IGFkaSxhZGF1NzExOAo+ID4gKwo+ID4gKyAgcmVnOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4g
Kwo+ID4gKyAgIiNzb3VuZC1kYWktY2VsbHMiOgo+ID4gKyAgICBjb25zdDogMAo+ID4gKwo+ID4g
KyAgSU9WREQtc3VwcGx5Ogo+Cj4gVXNlIGxvd2VyY2FzZSBwbGVhc2UuCj4KPiA+ICsgICAgZGVz
Y3JpcHRpb246IERpZ2l0YWwgSW5wdXQvT3V0cHV0IFBvd2VyIFN1cHBseS4KPiA+ICsgICAgJHJl
ZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUiCj4KPiAqLXN1cHBs
eSBhbHJlYWR5IGhhcyBhIHR5cGUsIHNvIGp1c3QgYSBkZXNjcmlwdGlvbiBpcyBlbm91Z2guCj4K
PiA+ICsKPiA+ICsgIERWREQtc3VwcGx5Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjogSW50ZXJuYWwg
Q29yZSBEaWdpdGFsIFBvd2VyIFN1cHBseS4KPiA+ICsgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUiCj4KPiBTYW1lIGhlcmUuCj4KPiA+ICsKPiA+ICsg
IGFkaSxkZWNpbWF0aW9uLXJhdGlvOgo+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAg
IFRoaXMgcHJvcGVydHkgc2V0J3MgdGhlIGRlY2ltYXRpb24gcmF0aW8gb2YgUERNIHRvIFBDTSBh
dWRpbyBkYXRhLgo+ID4gKyAgICBhbGxPZjoKPiA+ICsgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICAgIC0gZW51bTogWzY0LCAzMiwg
MTZdCj4gPiArICAgICAgICBkZWZhdWx0OiA2NAo+ID4gKwo+ID4gKyAgYWRpLHBkbS1jbGstbWFw
Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIFRoZSBBREFVNzExOCBoYXMgdHdv
IFBETSBjbG9ja3MgZm9yIHRoZSBmb3VyIElucHV0cy4gRWFjaCBpbnB1dCBtdXN0IGJlCj4gPiAr
ICAgICAgYXNzaWduZWQgdG8gb25lIG9mIHRoZXNlIHR3byBjbG9ja3MuIFRoaXMgcHJvcGVydHkg
c2V0J3MgdGhlIG1hcHBpbmcKPiA+ICsgICAgICBiZXR3ZWVuIHRoZSBjbG9ja3MgYW5kIHRoZSBp
bnB1dHMuCj4gPiArICAgIGFsbE9mOgo+ID4gKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5Cj4gPiArICAgICAgLSBtaW5JdGVtczogNAo+
ID4gKyAgICAgICAgbWF4SXRlbXM6IDQKPiA+ICsgICAgICAgIGl0ZW1zOgo+ID4gKyAgICAgICAg
ICBtYXhpbXVtOiAxCj4gPiArICAgICAgICBkZWZhdWx0OiBbMCwgMCwgMSwgMV0KPiA+ICsKPiA+
ICtyZXF1aXJlZDoKPiA+ICsgIC0gIiNzb3VuZC1kYWktY2VsbHMiCj4gPiArICAtIGNvbXBhdGli
bGUKPiA+ICsgIC0gSU9WREQtc3VwcGx5Cj4gPiArICAtIERWREQtc3VwcGx5Cj4gPiArCj4gPiAr
ZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgaTJjMCB7Cj4KPiBpMmMgewo+Cj4gPiArICAg
ICAgICAvKiBleGFtcGxlIHdpdGggaTJjIHN1cHBvcnQgKi8KPiA+ICsgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArICAgICAg
ICBzdGF0dXMgPSAib2theSI7Cj4KPiBEb24ndCBzaG93IHN0YXR1cyBpbiBleGFtcGxlcy4KPgo+
ID4gKyAgICAgICAgYWRhdTcxMThfY29kZWM6IGFkYXU3MTE4LWNvZGVjQDE0IHsKPgo+IGF1ZGlv
LWNvZGVjQDE0Cj4KPiA+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhZGksYWRhdTcx
MTgiOwo+ID4gKyAgICAgICAgICAgICAgICByZWcgPSA8MTQ+Owo+ID4gKyAgICAgICAgICAgICAg
ICAjc291bmQtZGFpLWNlbGxzID0gPDA+Owo+ID4gKyAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
b2theSI7Cj4gPiArICAgICAgICAgICAgICAgIElPVkRELXN1cHBseSA9IDwmc3VwcGx5PjsKPiA+
ICsgICAgICAgICAgICAgICAgRFZERC1zdXBwbHkgPSA8JnN1cHBseT47Cj4gPiArICAgICAgICAg
ICAgICAgIGFkaSxwZG0tY2xrLW1hcCA9IDwxIDEgMCAwPjsKPiA+ICsgICAgICAgICAgICAgICAg
YWRpLGRlY2ltYXRpb24tcmF0aW8gPSA8MTY+Owo+ID4gKyAgICAgICAgfTsKPiA+ICsgICAgfTsK
PiA+ICsKPiA+ICsgICAgLyogZXhhbXBsZSB3aXRoIGh3IHN0YW5kYWxvbmUgbW9kZSAqLwo+ID4g
KyAgICBhZGF1NzExOF9jb2RlY19odzogYWRhdTcxMTgtY29kZWMtaHcgewo+ID4gKyAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiYWRpLGFkYXU3MTE4IjsKPiA+ICsgICAgICAgICAgICAjc291bmQt
ZGFpLWNlbGxzID0gPDA+Owo+ID4gKyAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICsg
ICAgICAgICAgICBJT1ZERC1zdXBwbHkgPSA8JnN1cHBseT47Cj4gPiArICAgICAgICAgICAgRFZE
RC1zdXBwbHkgPSA8JnN1cHBseT47Cj4gPiArICAgIH07Cj4gPiAtLQo+ID4gMi4yMy4wCj4gPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
