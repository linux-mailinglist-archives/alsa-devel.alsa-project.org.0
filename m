Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6DC9B3D6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48E31695;
	Fri, 23 Aug 2019 17:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48E31695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566575338;
	bh=Qw+1vK//fkQbNZmAR7wlW3C8q9rpYFNhE7SUcuJwTUU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vn+5brE/vnDmwxE7cuizxmc0stH2eEEonyOs+p4hg/USH1yEl+najd6dDg3224Bec
	 ZA9T0GI51B+ulkzMlbecpOOtjPFNxXWH40ylA9RKxwKF86Diw+nB1MAZUC9LRVOHtY
	 DyCN0n5J/OmieXoz4n5KEkcqkP4F/Kdw54zGGSwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A51E5F80308;
	Fri, 23 Aug 2019 17:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E455F80306; Fri, 23 Aug 2019 17:47:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F22EF8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F22EF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RL/KWuNX"
Received: by mail-wr1-x444.google.com with SMTP id b16so9042533wrq.9
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nbqUXx9/m3WXheTKytTj56obmJu7LH7aMaefn0f5f54=;
 b=RL/KWuNX1l7JP9hh2eGOxiO3sJPzpPyw3XRXef767G1TNCE/Ra58e8d4bvyzixfwG0
 UGpKWuBGrATOJ5uN3i6nVe7dc33uEt6csPnLaWXltTFjX6WFngqhykDw3KosJwrEQYPt
 pBzwhqrgH3njj7i3q+e2ACZjr5SeVRNntUvYQyPAKrKr9VRz7Q2b1oBfvuIq3qjSJW7e
 EaQu3jIyJzhqfKe7IfG2+QCpM90vLBfMBMWzjN00ERlXSP1DW7idHqLzFYjV9dzOuAvj
 MZmZpYzMhkIfHO8IK4UyVjFo5qIz17HZNPWZ65ksGGWld0hZNEl4HNemCyL7o/aPlrwU
 PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nbqUXx9/m3WXheTKytTj56obmJu7LH7aMaefn0f5f54=;
 b=uLoAPXVHRBEIlPNmRSO9jvfjhmSTXh9SSX/poJXvxCEpCi2YEH/n0tWM5GUAZvwdsm
 ouC3cq6u/uQNMm8Y4b2ShJqdN5WCJy/Sr3Uy4r8MlMwVR9u7n51M2+elZA7RqOZAAw+5
 640BW2t3bN3TlMw20nRxEsg1inpxFpIFyvYKT02qUChSMQptnq9EkrVkFVpe1ViOplqc
 GA+gR7QM8fLj/0WTYzwf7ry30we6+8ndDQXFPf4c9i6ekr5ZJiX/4AXWR3vz2gNuMnNE
 670TFgZbNVtHJ28O9Ednrd1nB9guPKI888cQMM3dWPAfFsVtmJT7BnpgGow72m7xIud1
 ltUg==
X-Gm-Message-State: APjAAAWi6kVBsNEwEOyFh3gnRmclh6twWuHx9a946iY1cvBY6klkvfnr
 /THuzNoaj70ipGbmGk6qp+lPgw==
X-Google-Smtp-Source: APXvYqzjo6E35pjgKTgPRAP5MP9+Ux5v6TxkXFDx/A/Hjfxqz7m838j/G1SxZsO7zwsJFmyDbCHpUw==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr6157158wre.114.1566575226769; 
 Fri, 23 Aug 2019 08:47:06 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id p69sm5047650wme.36.2019.08.23.08.47.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 08:47:06 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, robh+dt@kernel.org, vkoul@kernel.org
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-3-srinivas.kandagatla@linaro.org>
 <2f1b5e2e-4699-1d06-e28e-708d5ed99b6a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <06fb60b4-72e1-5898-8eb9-d9a46efd3b3a@linaro.org>
Date: Fri, 23 Aug 2019 16:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2f1b5e2e-4699-1d06-e28e-708d5ed99b6a@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v4 2/4] soundwire: core: add device
 tree support for slave devices
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAyMy8wOC8yMDE5IDE2OjQ0LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
PiBPbiA4LzIyLzE5IDY6MzcgUE0sIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6Cj4+IFRoaXMg
cGF0Y2ggYWRkcyBzdXBwb3J0IHRvIHBhcnNpbmcgZGV2aWNlIHRyZWUgYmFzZWQKPj4gU291bmRX
aXJlIHNsYXZlIGRldmljZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNyaW5pdmFzIEthbmRhZ2F0
bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPj4gLS0tCj4+IMKgIGRyaXZlcnMv
c291bmR3aXJlL2J1cy5jwqDCoCB8wqAgMiArKwo+PiDCoCBkcml2ZXJzL3NvdW5kd2lyZS9idXMu
aMKgwqAgfMKgIDEgKwo+PiDCoCBkcml2ZXJzL3NvdW5kd2lyZS9zbGF2ZS5jIHwgNTIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb3VuZHdpcmUvYnVz
LmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9idXMuYwo+PiBpbmRleCA0OWY2NGIyMTE1YjkuLmMyZWFl
YjVjMzhlZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMKPj4gKysrIGIv
ZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMKPj4gQEAgLTc3LDYgKzc3LDggQEAgaW50IHNkd19hZGRf
YnVzX21hc3RlcihzdHJ1Y3Qgc2R3X2J1cyAqYnVzKQo+PiDCoMKgwqDCoMKgwqAgKi8KPj4gwqDC
oMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfQUNQSSkgJiYgQUNQSV9IQU5ETEUoYnVzLT5k
ZXYpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc2R3X2FjcGlfZmluZF9zbGF2ZXMoYnVz
KTsKPj4gK8KgwqDCoCBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19PRikgJiYgYnVzLT5kZXYt
Pm9mX25vZGUpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBzZHdfb2ZfZmluZF9zbGF2ZXMoYnVz
KTsKPj4gwqDCoMKgwqDCoCBlbHNlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PVFNV
UFA7IC8qIE5vIEFDUEkvRFQgc28gZXJyb3Igb3V0ICovCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3NvdW5kd2lyZS9idXMuaCBiL2RyaXZlcnMvc291bmR3aXJlL2J1cy5oCj4+IGluZGV4IDMwNDhj
YTE1M2YyMi4uZWU0NmJlZmVkYmQxIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9i
dXMuaAo+PiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9idXMuaAo+PiBAQCAtMTUsNiArMTUsNyBA
QCBzdGF0aWMgaW5saW5lIGludCBzZHdfYWNwaV9maW5kX3NsYXZlcyhzdHJ1Y3QgCj4+IHNkd19i
dXMgKmJ1cykKPj4gwqAgfQo+PiDCoCAjZW5kaWYKPj4gK2ludCBzZHdfb2ZfZmluZF9zbGF2ZXMo
c3RydWN0IHNkd19idXMgKmJ1cyk7Cj4+IMKgIHZvaWQgc2R3X2V4dHJhY3Rfc2xhdmVfaWQoc3Ry
dWN0IHNkd19idXMgKmJ1cywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU2NCBh
ZGRyLCBzdHJ1Y3Qgc2R3X3NsYXZlX2lkICppZCk7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
dW5kd2lyZS9zbGF2ZS5jIGIvZHJpdmVycy9zb3VuZHdpcmUvc2xhdmUuYwo+PiBpbmRleCBmMzlh
NTgxNWUyNWQuLjNlZjI2NWQyZWU4OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUv
c2xhdmUuYwo+PiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9zbGF2ZS5jCj4+IEBAIC0yLDYgKzIs
NyBAQAo+PiDCoCAvLyBDb3B5cmlnaHQoYykgMjAxNS0xNyBJbnRlbCBDb3Jwb3JhdGlvbi4KPj4g
wqAgI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+PiDC
oCAjaW5jbHVkZSA8bGludXgvc291bmR3aXJlL3Nkdy5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgv
c291bmR3aXJlL3Nkd190eXBlLmg+Cj4+IMKgICNpbmNsdWRlICJidXMuaCIKPj4gQEAgLTM1LDYg
KzM2LDcgQEAgc3RhdGljIGludCBzZHdfc2xhdmVfYWRkKHN0cnVjdCBzZHdfYnVzICpidXMsCj4+
IMKgwqDCoMKgwqAgc2xhdmUtPmRldi5yZWxlYXNlID0gc2R3X3NsYXZlX3JlbGVhc2U7Cj4+IMKg
wqDCoMKgwqAgc2xhdmUtPmRldi5idXMgPSAmc2R3X2J1c190eXBlOwo+PiArwqDCoMKgIHNsYXZl
LT5kZXYub2Zfbm9kZSA9IG9mX25vZGVfZ2V0KHRvX29mX25vZGUoZndub2RlKSk7Cj4+IMKgwqDC
oMKgwqAgc2xhdmUtPmJ1cyA9IGJ1czsKPj4gwqDCoMKgwqDCoCBzbGF2ZS0+c3RhdHVzID0gU0RX
X1NMQVZFX1VOQVRUQUNIRUQ7Cj4+IMKgwqDCoMKgwqAgc2xhdmUtPmRldl9udW0gPSAwOwo+PiBA
QCAtMTEyLDMgKzExNCw1MyBAQCBpbnQgc2R3X2FjcGlfZmluZF9zbGF2ZXMoc3RydWN0IHNkd19i
dXMgKmJ1cykKPj4gwqAgfQo+PiDCoCAjZW5kaWYKPj4gKwo+PiArLyoKPj4gKyAqIHNkd19vZl9m
aW5kX3NsYXZlcygpIC0gRmluZCBTbGF2ZSBkZXZpY2VzIGluIG1hc3RlciBkZXZpY2UgdHJlZSBu
b2RlCj4+ICsgKiBAYnVzOiBTRFcgYnVzIGluc3RhbmNlCj4+ICsgKgo+PiArICogU2NhbnMgTWFz
dGVyIERUIG5vZGUgZm9yIFNEVyBjaGlsZCBTbGF2ZSBkZXZpY2VzIGFuZCByZWdpc3RlcnMgaXQu
Cj4+ICsgKi8KPj4gK2ludCBzZHdfb2ZfZmluZF9zbGF2ZXMoc3RydWN0IHNkd19idXMgKmJ1cykK
Pj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBidXMtPmRldjsKPj4gK8KgwqDC
oCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7Cj4+ICsKPj4gK8KgwqDCoCBmb3JfZWFjaF9jaGls
ZF9vZl9ub2RlKGJ1cy0+ZGV2LT5vZl9ub2RlLCBub2RlKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
bnQgbGlua19pZCwgc2R3X3ZlcnNpb24sIHJldCwgbGVuOwo+PiArwqDCoMKgwqDCoMKgwqAgY29u
c3QgY2hhciAqY29tcGF0ID0gTlVMTDsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBzZHdfc2xh
dmVfaWQgaWQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb25zdCBfX2JlMzIgKmFkZHI7Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoMKgIGNvbXBhdCA9IG9mX2dldF9wcm9wZXJ0eShub2RlLCAiY29tcGF0aWJs
ZSIsIE5VTEwpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFjb21wYXQpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBzc2Nh
bmYoY29tcGF0LCAic2R3JTAxeCUwNGh4JTA0aHglMDJoaHgiLCAmc2R3X3ZlcnNpb24sCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmaWQubWZnX2lkLCAmaWQucGFydF9pZCwg
JmlkLmNsYXNzX2lkKTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCAhPSA0KSB7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiSW52YWxpZCBjb21wYXRpYmxl
IHN0cmluZyBmb3VuZCAlc1xuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b21wYXQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gK8KgwqDCoMKg
wqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgYWRkciA9IG9mX2dldF9wcm9wZXJ0eShu
b2RlLCAicmVnIiwgJmxlbik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWFkZHIgfHwgKGxlbiA8
IDIgKiBzaXplb2YodTMyKSkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihk
ZXYsICJJbnZhbGlkIEluc3RhbmNlIGFuZCBMaW5rIElEXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGludWU7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoMKg
wqDCoMKgIGlkLnVuaXF1ZV9pZCA9IGJlMzJfdG9fY3B1cChhZGRyKyspOwo+PiArwqDCoMKgwqDC
oMKgwqAgbGlua19pZCA9IGJlMzJfdG9fY3B1cChhZGRyKTsKPiAKPiBTbyBoZXJlIHRoZSBsaW5r
IElEIGlzIG9idmlvdXNseSBub3QgaW4gdGhlIGFkZHJlc3MsIHNvIHlvdSBhcmUgbm90IAo+IHVz
aW5nIHRoZSBNSVBJIHNwZWMgYXMgd2UgZGlzY3Vzc2VkIGluaXRpYWxseT8KCk5vLCBSb2IgcmVq
ZWN0ZWQgdGhhdCBhcHByb2FjaCAoaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOC8yMi80OTAp
IAp3aXRoIHRoZSBmYWN0IHRoYXQgY29tcGF0aWJsZSBzdHJpbmcgc2hvdWxkIGJlIGNvbnN0YW50
IGZvciBlYWNoIGluc3RhbmNlLgoKLS1zcmluaQo+IAo+PiArwqDCoMKgwqDCoMKgwqAgaWQuc2R3
X3ZlcnNpb24gPSBzZHdfdmVyc2lvbjsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgLyogQ2hlY2sg
Zm9yIGxpbmtfaWQgbWF0Y2ggKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChsaW5rX2lkICE9IGJ1
cy0+bGlua19pZCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoMKgIHNkd19zbGF2ZV9hZGQoYnVzLCAmaWQsIG9mX2Z3bm9kZV9oYW5kbGUo
bm9kZSkpOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
