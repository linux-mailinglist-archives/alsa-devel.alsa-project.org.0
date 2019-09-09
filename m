Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 773DDAD453
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 09:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAEF41667;
	Mon,  9 Sep 2019 09:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAEF41667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568015856;
	bh=4HJpPzVvVLn9og17BYHttpQ9mOqMbwNBjAf3BwSoPeE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IDdmQt5R0FMydvFGefO9EXW5WzPLevkh3KsvtdbFjbk8pSOg7wWmWcKxc1VsdFOWv
	 G8EdBA51gr8qfYZgE2hifvSbkIKAbah8V/sZXVCzwcJpfPjlpv3HOgLs75cIH11R9c
	 gG+fYGFAQ/MpLkI+4eSvS+WNjYcYHfGw+R6qXfK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF777F804CF;
	Mon,  9 Sep 2019 09:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8B71F804CF; Mon,  9 Sep 2019 09:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC08EF800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 09:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC08EF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RqUHQX48"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x897tePC068928;
 Mon, 9 Sep 2019 02:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568015740;
 bh=4gtl3Y2OCPlIejYIKw1ZRCQ3sVSq/SmbtVtVLnTa+VM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RqUHQX48Yyx5d5yO0UEcnyD0G5BP4XbkWYkx636AqUxIVHIYC2gGJwpBQDTjFG2Eo
 Dt+Iif2wrGaNHI/6uaO/Bv59DgSTdUOE7iePQPK6+mw3jkbCb7daDK3mA5Kxey8bCf
 jeedjaGxXfMkgClfI315aPQFyT2TjuEINGr34a4A=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x897tebQ088026
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Sep 2019 02:55:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 02:55:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 02:55:40 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x897tcfj091610;
 Mon, 9 Sep 2019 02:55:38 -0500
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>
References: <20190907111650.15440-1-jmkrzyszt@gmail.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <1a93e50f-b9da-a473-e60a-90fa490586ad@ti.com>
Date: Mon, 9 Sep 2019 10:56:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190907111650.15440-1-jmkrzyszt@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Tony Lindgren <tony@atomide.com>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: ams-delta: Take control over
 audio mute GPIO pins
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

CgpPbiAwNy8wOS8yMDE5IDE0LjE2LCBKYW51c3ogS3J6eXN6dG9maWsgd3JvdGU6Cj4gU2luY2Ug
Y29tbWl0IDExMzdjZWVlNzZiYSAoIkFSTTogT01BUDE6IGFtcy1kZWx0YTogRG9uJ3QgcmVxdWVz
dCB1bnVzZWQKPiBHUElPcyIpLCBvbi1ib2FyZCBhdWRpbyBoYXMgYXBwZWFyZWQgbXV0ZWQuICBJ
dCBoYXMgYmVlbiBkaXNjb3ZlcmVkIHRoYXQKPiBiZWxpZXZlZCB0byBiZSB1bnVzZWQgR1BJTyBw
aW5zICJob29rZmxhc2gxIiBhbmQgImhvb2tmbGFzaDIiIG5lZWQgdG8gYmUKPiBzZXQgbG93IGZv
ciBhdWRpYmxlIHNvdW5kIGluIGhhbmRzZnJlZSBhbmQgaGFuZHNldCBtb2RlIHJlc3BlY3RpdmVs
eS4KPiAKPiBBY2NvcmRpbmcgdG8gQW1zdHJhZCBFMyB3aWtpLCB0aGUgcHVycG9zZSBvZiBib3Ro
IHBpbnMgaGFzbid0IGJlZW4KPiBjbGVhcmx5IGlkZW50aWZpZWQuICBPcmlnaW5hbCBBbXN0cmFk
IHNvZnR3YXJlIHVzZWQgdG8gcHJvZHVjZSBhIGhpZ2gKPiBwdWxzZSBvbiB0aGVtIHdoZW4gdGhl
IHBob25lIHdhcyB0YWtlbiBvZmYgaG9vayBvciByZWNhbGwgd2FzIHByZXNzZWQuCj4gV2l0aCB0
aGUgY3VycmVudCBmaW5kaW5ncywgd2UgY2FuIGFzc3VtZSB0aGUgcGlucyBwcm92aWRlIGEga2lu
ZCBvZgo+IGF1ZGlvIG11dGUgZnVuY3Rpb24sIHNlcGFyYXRlbHkgZm9yIGhhbmRzZXQgYW5kIGhh
bmRzZnJlZSBvcGVyYXRpb24KPiBtb2Rlcy4KPiAKPiBDb21taXQgMmFmZGI0YzQxZDc4ICgiQVJN
OiBPTUFQMTogYW1zLWRlbHRhOiBGaXggYXVkaW8gcGVybWFuZW50bHkKPiBtdXRlZCIpIGF0dGVt
cHRlZCB0byBmaXggdGhlIGlzc3VlIHRlbXBvcmFyaWx5IGJ5IGhvZ2dpbmcgdGhlIEdQSU8gcGlu
Cj4gImhvb2tmbGFzaDEiIHJlbmFtZWQgdG8gImF1ZGlvX211dGUiLCBob3dldmVyIHRoZSBmaXgg
b2NjdXJyZWQKPiBpbmNvbXBsZXRlIGFzIGl0IHJlc3RvcmVkIGF1ZGlibGUgc291bmQgb25seSBm
b3IgaGFuZHNmcmVlIG1vZGUuCj4gCj4gU3RvcCBob2dnaW5nIHRoYXQgcGluLCByZW5hbWUgdGhl
IHBpbnMgdG8gImhhbmRzZnJlZV9tdXRlIiBhbmQKPiAiaGFuZHNldF9tdXRlIiByZXNwZWN0aXZl
bHkgYW5kIGltcGxlbWVudCBhcHByb3ByaWF0ZSBEQVBNIGV2ZW50Cj4gY2FsbGJhY2tzIGZvciAi
U3BlYWtlciIgYW5kICJFYXJwaWVjZSIgREFQTSB3aWRnZXRzLgoKUmV2aWV3ZWQtYnk6IFBldGVy
IFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+Cgo+IEZpeGVzOiAxMTM3Y2VlZTc2YmEg
KCJBUk06IE9NQVAxOiBhbXMtZGVsdGE6IERvbid0IHJlcXVlc3QgdW51c2VkIEdQSU9zIikKPiBT
aWduZWQtb2ZmLWJ5OiBKYW51c3ogS3J6eXN6dG9maWsgPGpta3J6eXN6dEBnbWFpbC5jb20+Cj4g
LS0tCj4gIGFyY2gvYXJtL21hY2gtb21hcDEvYm9hcmQtYW1zLWRlbHRhLmMgfCAxMCArKysrKy0t
LS0KPiAgc291bmQvc29jL3RpL2Ftcy1kZWx0YS5jICAgICAgICAgICAgICB8IDMxICsrKysrKysr
KysrKysrKysrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtb21hcDEvYm9h
cmQtYW1zLWRlbHRhLmMgYi9hcmNoL2FybS9tYWNoLW9tYXAxL2JvYXJkLWFtcy1kZWx0YS5jCj4g
aW5kZXggZTQ3YTZmYmNmZDZlLi5hMmFhN2ExMmIzNzQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0v
bWFjaC1vbWFwMS9ib2FyZC1hbXMtZGVsdGEuYwo+ICsrKyBiL2FyY2gvYXJtL21hY2gtb21hcDEv
Ym9hcmQtYW1zLWRlbHRhLmMKPiBAQCAtMjQ2LDggKzI0Niw4IEBAIHN0YXRpYyBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlIGxhdGNoMl9ncGlvX2RldmljZSA9IHsKPiAgI2RlZmluZSBMQVRDSDJfUElO
X1NDQVJEX0NNRFZDQwkJMTEKPiAgI2RlZmluZSBMQVRDSDJfUElOX01PREVNX05SRVNFVAkJMTIK
PiAgI2RlZmluZSBMQVRDSDJfUElOX01PREVNX0NPREVDCQkxMwo+IC0jZGVmaW5lIExBVENIMl9Q
SU5fQVVESU9fTVVURQkJMTQKPiAtI2RlZmluZSBMQVRDSDJfUElOX0hPT0tGTEFTSAkJMTUKPiAr
I2RlZmluZSBMQVRDSDJfUElOX0hBTkRTRlJFRV9NVVRFCTE0Cj4gKyNkZWZpbmUgTEFUQ0gyX1BJ
Tl9IQU5EU0VUX01VVEUJCTE1Cj4gIAo+ICBzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9jb25zdW1l
cl9zdXBwbHkgbW9kZW1fbnJlc2V0X2NvbnN1bWVyc1tdID0gewo+ICAJUkVHVUxBVE9SX1NVUFBM
WSgiUkVTRVQjIiwgInNlcmlhbDgyNTAuMSIpLAo+IEBAIC00NzYsNiArNDc2LDEwIEBAIHN0YXRp
YyBzdHJ1Y3QgZ3Bpb2RfbG9va3VwX3RhYmxlIGFtc19kZWx0YV9hdWRpb19ncGlvX3RhYmxlID0g
ewo+ICAJCQkgICAgImhvb2tfc3dpdGNoIiwgMCksCj4gIAkJR1BJT19MT09LVVAoTEFUQ0gyX0xB
QkVMLCBMQVRDSDJfUElOX01PREVNX0NPREVDLAo+ICAJCQkgICAgIm1vZGVtX2NvZGVjIiwgMCks
Cj4gKwkJR1BJT19MT09LVVAoTEFUQ0gyX0xBQkVMLCBMQVRDSDJfUElOX0hBTkRTRlJFRV9NVVRF
LAo+ICsJCQkgICAgImhhbmRzZnJlZV9tdXRlIiwgMCksCj4gKwkJR1BJT19MT09LVVAoTEFUQ0gy
X0xBQkVMLCBMQVRDSDJfUElOX0hBTkRTRVRfTVVURSwKPiArCQkJICAgICJoYW5kc2V0X211dGUi
LCAwKSwKPiAgCQl7IH0sCj4gIAl9LAo+ICB9Owo+IEBAIC01OTAsOCArNTk0LDYgQEAgc3RhdGlj
IGludCBncGlvY2hpcF9tYXRjaF9ieV9sYWJlbChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB2b2lk
ICpkYXRhKQo+ICBzdGF0aWMgc3RydWN0IGdwaW9kX2hvZyBhbXNfZGVsdGFfZ3Bpb19ob2dzW10g
PSB7Cj4gIAlHUElPX0hPRyhMQVRDSDJfTEFCRUwsIExBVENIMl9QSU5fS0VZQlJEX0RBVEFPVVQs
ICJrZXlicmRfZGF0YW91dCIsCj4gIAkJIEdQSU9fQUNUSVZFX0hJR0gsIEdQSU9EX09VVF9MT1cp
LAo+IC0JR1BJT19IT0coTEFUQ0gyX0xBQkVMLCBMQVRDSDJfUElOX0FVRElPX01VVEUsICJhdWRp
b19tdXRlIiwKPiAtCQkgR1BJT19BQ1RJVkVfSElHSCwgR1BJT0RfT1VUX0xPVyksCj4gIAl7fSwK
PiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9hbXMtZGVsdGEuYyBiL3NvdW5k
L3NvYy90aS9hbXMtZGVsdGEuYwo+IGluZGV4IGRlZThmYzcwYTY0Zi4uOGUyZmI4MWFkMDVjIDEw
MDY0NAo+IC0tLSBhL3NvdW5kL3NvYy90aS9hbXMtZGVsdGEuYwo+ICsrKyBiL3NvdW5kL3NvYy90
aS9hbXMtZGVsdGEuYwo+IEBAIC0yMywxNCArMjMsMzEgQEAKPiAgI2luY2x1ZGUgIm9tYXAtbWNi
c3AuaCIKPiAgI2luY2x1ZGUgIi4uL2NvZGVjcy9jeDIwNDQyLmgiCj4gIAo+ICtzdGF0aWMgc3Ry
dWN0IGdwaW9fZGVzYyAqaGFuZHNldF9tdXRlOwo+ICtzdGF0aWMgc3RydWN0IGdwaW9fZGVzYyAq
aGFuZHNmcmVlX211dGU7Cj4gKwo+ICtzdGF0aWMgaW50IGFtc19kZWx0YV9ldmVudF9oYW5kc2V0
KHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LAo+ICsJCQkJICAgc3RydWN0IHNuZF9rY29u
dHJvbCAqaywgaW50IGV2ZW50KQo+ICt7Cj4gKwlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoaGFu
ZHNldF9tdXRlLCAhU05EX1NPQ19EQVBNX0VWRU5UX09OKGV2ZW50KSk7Cj4gKwlyZXR1cm4gMDsK
PiArfQo+ICsKPiArc3RhdGljIGludCBhbXNfZGVsdGFfZXZlbnRfaGFuZHNmcmVlKHN0cnVjdCBz
bmRfc29jX2RhcG1fd2lkZ2V0ICp3LAo+ICsJCQkJICAgICBzdHJ1Y3Qgc25kX2tjb250cm9sICpr
LCBpbnQgZXZlbnQpCj4gK3sKPiArCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChoYW5kc2ZyZWVf
bXV0ZSwgIVNORF9TT0NfREFQTV9FVkVOVF9PTihldmVudCkpOwo+ICsJcmV0dXJuIDA7Cj4gK30K
PiArCj4gIC8qIEJvYXJkIHNwZWNpZmljIERBUE0gd2lkZ2V0cyAqLwo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgYW1zX2RlbHRhX2RhcG1fd2lkZ2V0c1tdID0gewo+
ICAJLyogSGFuZHNldCAqLwo+ICAJU05EX1NPQ19EQVBNX01JQygiTW91dGhwaWVjZSIsIE5VTEwp
LAo+IC0JU05EX1NPQ19EQVBNX0hQKCJFYXJwaWVjZSIsIE5VTEwpLAo+ICsJU05EX1NPQ19EQVBN
X0hQKCJFYXJwaWVjZSIsIGFtc19kZWx0YV9ldmVudF9oYW5kc2V0KSwKPiAgCS8qIEhhbmRzZnJl
ZS9TcGVha2VycGhvbmUgKi8KPiAgCVNORF9TT0NfREFQTV9NSUMoIk1pY3JvcGhvbmUiLCBOVUxM
KSwKPiAtCVNORF9TT0NfREFQTV9TUEsoIlNwZWFrZXIiLCBOVUxMKSwKPiArCVNORF9TT0NfREFQ
TV9TUEsoIlNwZWFrZXIiLCBhbXNfZGVsdGFfZXZlbnRfaGFuZHNmcmVlKSwKPiAgfTsKPiAgCj4g
IC8qIEhvdyB0aGV5IGFyZSBjb25uZWN0ZWQgdG8gY29kZWMgcGlucyAqLwo+IEBAIC01NDIsNiAr
NTU5LDE2IEBAIHN0YXRpYyBpbnQgYW1zX2RlbHRhX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIAo+ICAJY2FyZC0+ZGV2ID0gJnBkZXYtPmRldjsKPiAgCj4gKwloYW5kc2V0
X211dGUgPSBkZXZtX2dwaW9kX2dldChjYXJkLT5kZXYsICJoYW5kc2V0X211dGUiLAo+ICsJCQkJ
ICAgICAgR1BJT0RfT1VUX0hJR0gpOwo+ICsJaWYgKElTX0VSUihoYW5kc2V0X211dGUpKQo+ICsJ
CXJldHVybiBQVFJfRVJSKGhhbmRzZXRfbXV0ZSk7Cj4gKwo+ICsJaGFuZHNmcmVlX211dGUgPSBk
ZXZtX2dwaW9kX2dldChjYXJkLT5kZXYsICJoYW5kc2ZyZWVfbXV0ZSIsCj4gKwkJCQkJR1BJT0Rf
T1VUX0hJR0gpOwo+ICsJaWYgKElTX0VSUihoYW5kc2ZyZWVfbXV0ZSkpCj4gKwkJcmV0dXJuIFBU
Ul9FUlIoaGFuZHNmcmVlX211dGUpOwo+ICsKPiAgCXJldCA9IHNuZF9zb2NfcmVnaXN0ZXJfY2Fy
ZChjYXJkKTsKPiAgCWlmIChyZXQpIHsKPiAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJzbmRfc29j
X3JlZ2lzdGVyX2NhcmQgZmFpbGVkICglZClcbiIsIHJldCk7Cj4gCgotIFDDqXRlcgoKVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
ClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
