Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B46D431
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 20:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 876721680;
	Thu, 18 Jul 2019 20:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 876721680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563475839;
	bh=ZkPtDBItWxfaSnjrNvbMQlJkAkwRW311RrhmddJTwTs=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=siVD8W2gzmyXU7B8owdj59v/ZwpLk1TsYPYAPQpITIH78y4VSRxKBuNvipGAn/XvX
	 vHnVyeFsmqMWazXQSMFDE3PtDHZOwmpJdd5AqnAa1qhmY83gnC4T4KInAaQfRsAJXL
	 nUGefQ1q4tdyx751YQxgzHZQIiYDp10bsO1MEsEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3857F800D2;
	Thu, 18 Jul 2019 20:48:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 665A6F8015B; Thu, 18 Jul 2019 20:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82AFFF8015B
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 20:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82AFFF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 11:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; d="scan'208";a="195709952"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.81.172])
 ([10.251.81.172])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2019 11:48:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
 <20190718090240.18432-3-oleksandr.suvorov@toradex.com>
 <9c9ee47c-48bd-7109-9870-8f73be1f1cfa@intel.com>
Message-ID: <a86e4d6b-ed2c-d2f2-2974-6f00dc6ef68a@intel.com>
Date: Thu, 18 Jul 2019 20:48:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9c9ee47c-48bd-7109-9870-8f73be1f1cfa@intel.com>
Content-Language: en-US
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v5 2/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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

T24gMjAxOS0wNy0xOCAyMDo0MiwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+IE9uIDIwMTktMDct
MTggMTE6MDIsIE9sZWtzYW5kciBTdXZvcm92IHdyb3RlOgo+PiArZW51bSB7Cj4+ICvCoMKgwqAg
SFBfUE9XRVJfRVZFTlQsCj4+ICvCoMKgwqAgREFDX1BPV0VSX0VWRU5ULAo+PiArwqDCoMKgIEFE
Q19QT1dFUl9FVkVOVCwKPj4gK8KgwqDCoCBMQVNUX1BPV0VSX0VWRU5UCj4+ICt9Owo+PiArCj4+
ICtzdGF0aWMgdTE2IG11dGVfbWFza1tdID0gewo+PiArwqDCoMKgIFNHVEw1MDAwX0hQX01VVEUs
Cj4+ICvCoMKgwqAgU0dUTDUwMDBfT1VUUFVUU19NVVRFLAo+PiArwqDCoMKgIFNHVEw1MDAwX09V
VFBVVFNfTVVURQo+PiArfTsKPiAKPiBJZiBtdXRlX21hc2tbXSBpcyBvbmx5IHVzZWQgd2l0aGlu
IGNvbW1vbiBoYW5kbGVyLCB5b3UgbWF5IGNvbnNpZGVyIAo+IGRlY2xhcmluZyBjb25zdCBhcnJh
eSB3aXRoaW4gc2FpZCBoYW5kbGVyIGluc3RlYWQgKGRpZCBub3QgY2hlY2sgdGhhdCAKPiBteXNl
bGYpLgo+IE90aGVyd2lzZSwgc2ltcGxlIGNvbW1lbnQgZm9yIHRoZSBzZWNvbmQgX09VVFBVVFNf
TVVURSBzaG91bGQgc3VmZmljZSAtIAo+IGl0cyBub3Qgc2VsZiBleHBsYW5hdG9yeSB3aHkgeW91
IGRvdWJsZWQgdGhhdCBtYXNrLgo+IAo+PiArCj4+IMKgIC8qIHNndGw1MDAwIHByaXZhdGUgc3Ry
dWN0dXJlIGluIGNvZGVjICovCj4+IMKgIHN0cnVjdCBzZ3RsNTAwMF9wcml2IHsKPj4gwqDCoMKg
wqDCoCBpbnQgc3lzY2xrO8KgwqDCoCAvKiBzeXNjbGsgcmF0ZSAqLwo+PiBAQCAtMTM3LDggKzE1
NywxMDkgQEAgc3RydWN0IHNndGw1MDAwX3ByaXYgewo+PiDCoMKgwqDCoMKgIHU4IG1pY2JpYXNf
dm9sdGFnZTsKPj4gwqDCoMKgwqDCoCB1OCBscmNsa19zdHJlbmd0aDsKPj4gwqDCoMKgwqDCoCB1
OCBzY2xrX3N0cmVuZ3RoOwo+PiArwqDCoMKgIHUxNiBtdXRlX3N0YXRlW0xBU1RfUE9XRVJfRVZF
TlRdOwo+PiDCoCB9Owo+IAo+IFdoZW4gSSBzcG9rZSBvZiBMQVNUIGVudW0gY29uc3RhbnQsIEkg
ZGlkIG5vdCByZWFsbHkgaGFkIHRoaXMgc3BlY2lmaWMgCj4gdXNhZ2UgaW4gbWluZC4KPiAKPiAg
RnJvbSBkZXNpZ24gcGVyc3BlY3RpdmUsIF9MQVNUXyBkb2VzIG5vdCBleGlzdCBhbmQgc2hvdWxk
IG5ldmVyIGJlIAo+IHJlZmVycmVkIHRvIGFzICJ0aGUgbmV4dCBvcHRpb24iIGkuZS46IG5ldyBl
bnVtIGNvbnN0YW50Lgo+IFRoYXQgaXMgd2F5IHByZWZlcnJlZCB1c2FnZSBpczoKPiB1MTYgbXV0
ZV9zdGF0ZVtBRENfUE9XRVJfRVZFTlQrMTsKPiAtb3ItCj4gdTE2IG11dGVfc3RhdGVbTEFTVF9Q
T1dFUl9FVkVOVCsxXTsKPiAKPiBNYXliZSBJJ20ganVzdCBiZWluZyByYWRpY2FsIGhlcmUgOikK
PiAKPiBDemFyZWsKCkZvcmdpdmUgbWUgZm9yIGRvdWJsZSBwb3N0aW5nLiBDb21tZW50IGFib3Zl
IGlzIHRhcmdldGVkIHRvd2FyZHM6CgogPj4gK2VudW0gewogPj4gKyAgICBIUF9QT1dFUl9FVkVO
VCwKID4+ICsgICAgREFDX1BPV0VSX0VWRU5ULAogPj4gKyAgICBBRENfUE9XRVJfRVZFTlQsCiA+
PiArICAgIExBU1RfUE9XRVJfRVZFTlQKID4+ICt9OwoKYXMgTEFTVF9QT1dFUl9FVkVOVCBpcyBu
b3QgYXNzaWduZWQgZXhwbGljaXRseSB0byBBRENfUE9XRVJfRVZFTlQgYW5kIAp0aHVzIGdlbmVy
YXRlcyBpbXBsaWNpdCAibmV3IG9wdGlvbiIgb2YgdmFsdWUgMy4KCkN6YXJlawpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
