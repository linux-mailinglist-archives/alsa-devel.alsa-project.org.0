Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220076117
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 10:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F142D2005;
	Fri, 26 Jul 2019 10:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F142D2005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564130678;
	bh=0S0nvWy9NxfOlmA3PPRBL+fHMdLXkhoPdGC+zFMgRU8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CaJe3n3pofL1SHwjk7Yq9xCVBf24vim7P4bcEU2EhKj4ym5OKeWxNrIbrJJ1V8An7
	 ve9sKY4Z5XbcLEG/53HuOD/JMCv2E0ML4MOhXWJGQPKR0tJb+0FmxqH2EtoBGAn1+H
	 z4TLAzGrieyy8hH6lOynq+ljIhJX90sQzhEWKoBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 092FFF803D5;
	Fri, 26 Jul 2019 10:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1BC9F80393; Fri, 26 Jul 2019 10:42:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54355F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 10:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54355F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 01:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="321983090"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 01:42:41 -0700
Date: Fri, 26 Jul 2019 10:42:40 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Jan Kotas <jank@cadence.com>
Message-ID: <20190726084239.GG16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <20190726073931.GE16003@ubuntu>
 <716D5D19-D494-4F4E-9180-24CB5A575648@global.cadence.com>
 <20190726082258.GF16003@ubuntu>
 <F31F0D1F-63E2-4ABF-9B38-10D55E773F11@global.cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F31F0D1F-63E2-4ABF-9B38-10D55E773F11@global.cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 "slawomir.blauciak@intel.com" <slawomir.blauciak@intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDg6MzM6MzVBTSArMDAwMCwgSmFuIEtvdGFzIHdyb3Rl
Ogo+IAo+IAo+ID4gT24gMjYgSnVsIDIwMTksIGF0IDEwOjIyLCBHdWVubmFkaSBMaWFraG92ZXRz
a2kgPGd1ZW5uYWRpLmxpYWtob3ZldHNraUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gCj4g
PiBFWFRFUk5BTCBNQUlMCj4gPiAKPiA+IAo+ID4gSGkgSmFuLAo+ID4gCj4gPiBPbiBGcmksIEp1
bCAyNiwgMjAxOSBhdCAwNzo0NzowNEFNICswMDAwLCBKYW4gS290YXMgd3JvdGU6Cj4gPj4gSGVs
bG8sCj4gPj4gCj4gPj4gSSB3aGlsZSBiYWNrIEkgcHJvcG9zZWQgYSBwYXRjaCBmb3IgdGhpcywg
YnV0IGl0IHdlbnQgbm93aGVyZS4KPiA+PiAKPiA+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zw
b2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX3BhdGNod29yay5rZXJuZWwub3JnX3BhdGNoXzEw
ODg3NDA1XyZkPUR3SUJBZyZjPWFVcTk4M0wycHVlMkZxS0ZvUDZQR0hNSlF5b0o3a2wzczNHWi1f
aGFYcVkmcj1nN0dBUUVOVlh4X1JRZHlYSEluUE1nJm09aV8wUzM1OWhGSVZxTmd2M2ZSNV9NTnpE
T0hQOTl0cmRYc3paLUZNaVFFRSZzPWRka3RGWllsZVBoLWJDN2tYZW9LV3Q0UW9tdXB6SEFUSzRG
TFk0b1NXS0EmZT0gCj4gPj4gTWF5YmUgc29tZXRoaW5nIHNpbWlsYXIgY2FuIGJlIGltcGxlbWVu
dGVkPwo+ID4gCj4gPiBZZXMsIEkgd2FzIHRoaW5raW5nIGFib3V0IGNoZWNraW50IC1FQUNDRVNT
IHRvbywgYnV0IHRoZW4gSSBub3RpY2VkIHRoaXMgY29kZQo+ID4gaW4gcnBtX3Jlc3VtZSgpOgo+
ID4gCj4gPiAJZWxzZSBpZiAoZGV2LT5wb3dlci5kaXNhYmxlX2RlcHRoID09IDEgJiYgZGV2LT5w
b3dlci5pc19zdXNwZW5kZWQKPiA+IAkgICAgJiYgZGV2LT5wb3dlci5ydW50aW1lX3N0YXR1cyA9
PSBSUE1fQUNUSVZFKQo+ID4gCQlyZXR2YWwgPSAxOwo+ID4gCj4gPiBpLmUuIGlmIFJULVBNIGlz
IGRpc2FibGVkIG9uIHRoZSBkZXZpY2UgKGJ1dCBvbmx5IGV4YWN0bHkgb25jZT8uLikgYW5kIGl0
J3MKPiA+IGFjdGl2ZSBhbmQgdGhlIGRldmljZSBpcyBzdXNwZW5kZWQgZm9yIGEgc3lzdGVtIHN1
c3BlbmQsIHRoZSBmdW5jdGlvbiB3aWxsCj4gPiByZXR1cm4gMS4gSSBkb24ndCB1bmRlcnN0YW5k
IHRoZSBsb2dpYyBvZiB0aGlzIGNvZGUsIGJ1dCBpdCBzZWVtcyB0byBtZSBpdAo+ID4gY291bGQg
YnJlYWsgdGhlIC1FQUNDRVNTIGNoZWNrPwo+ID4gCj4gCj4gSGksCj4gCj4gSW4gc3VjaCBjYXNl
IHJldCA8IDAgd2lsbCBub3QgYmUgdHJ1ZSwgd2hpY2ggSSB0aGluayBpcyBmaW5lLAo+IGlmIEni
gJltIHVuZGVyc3RhbmRpbmcgeW91IGNvcnJlY3RseS4KClllcywgaWYgd2UganVzdCBoYXZlIHRv
IGRpc3Rpbmd1aXNoIGEgc2luZ2xlIGNhc2UgIlJULVBNIGlzIGVuYWJsZWQgYW5kIGl0IGZhaWxl
ZC4iCldoaWNoIGlzIGluZGVlZCB0aGUgY2FzZSBoZXJlLCBpdCBzZWVtcy4gSG93ZXZlciBpZiB3
ZSB3YW50IHRvIGNoZWNrIHdoZXRoZXIgUlQtUE0KaXMgZGlzYWJsZWQgYWZ0ZXIgYSBjYWxsIHRv
LCBzYXksIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSwgdGhlbiBqdXN0IGNoZWNraW5nCi1FQUNDRVNT
IGlzbid0IGFsd2F5cyBlbm91Z2ggLSB0aGVyZSBjYW4gYmUgY2FzZXMgd2hlbiBSVC1QTSBpcyBk
aXNhYmxlZCBhbmQgdGhlCnJldHVybiBjb2RlIGlzIDEuIEJ1dCB5ZXMsIGp1c3QgZm9yIGNoZWNr
aW5nIGZvciBmYWlsdXJlcywgbGlrZSBoZXJlLCBpdCBzaG91bGQgYmUKZmluZS4KClRoYW5rcwpH
dWVubmFkaQoKPiA+PiBKYW4KPiA+PiAKPiA+Pj4gT24gMjYgSnVsIDIwMTksIGF0IDA5OjM5LCBH
dWVubmFkaSBMaWFraG92ZXRza2kgPGd1ZW5uYWRpLmxpYWtob3ZldHNraUBsaW51eC5pbnRlbC5j
b20+IHdyb3RlOgo+ID4+PiAKPiA+Pj4gRVhURVJOQUwgTUFJTAo+ID4+PiAKPiA+Pj4gCj4gPj4+
IEhpIFBpZXJyZSwKPiA+Pj4gCj4gPj4+IEkgbWlnaHQgYmUgd3JvbmcgYnV0IHRoaXMgZG9lc24n
dCBzZWVtIHJpZ2h0IHRvIG1lLiAoU3VwcG9zZWRseSkgYWxsIFJULVBNCj4gPj4+IGZ1bmN0aW9u
cyBjaGVjayBmb3IgImVuYWJsZWQiIGludGVybmFsbHkuIFRoZSBvbmx5IHRoaW5nIHRoYXQgY2Fu
IGhhcHBlbiBpcwo+ID4+PiB0aGF0IGlmIFJULVBNIGlzbid0IGVuYWJsZWQgc29tZSBvZiB0aG9z
ZSBmdW5jdGlvbnMgd2lsbCByZXR1cm4gYW4gZXJyb3IuCj4gPj4+IFNvLCBpbiB0aG9zZSBjYXNl
cyB3aGVyZSB0aGUgcmV0dXJuIHZhbHVlIG9mIFJULVBNIGZ1bmN0aW9ucyBpc24ndCBjaGVja2Vk
LAo+ID4+PiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRvIGRvIGFueXRoaW5nLiBXaGVyZSBpdCBp
cyBjaGVja2VkIG1heWJlIGRvCj4gPj4+IAo+ID4+PiArCWlmIChyZXQgPCAwICYmIHBtX3J1bnRp
bWVfZW5hYmxlZChzbGF2ZS0+YnVzLT5kZXYpKQo+ID4+PiAKPiA+Pj4gVGhhbmtzCj4gPj4+IEd1
ZW5uYWRpCj4gPj4+IAo+ID4+PiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAwNjo0MDowOVBNIC0w
NTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiA+Pj4+IE5vdCBhbGwgcGxhdGZvcm1z
IHN1cHBvcnQgcnVudGltZV9wbSBmb3Igbm93LCBsZXQncyB1c2UgcnVudGltZV9wbQo+ID4+Pj4g
b25seSB3aGVuIGVuYWJsZWQuCj4gPj4+PiAKPiA+Pj4+IFN1Z2dlc3RlZC1ieTogU3Jpbml2YXMg
S2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+ID4+Pj4gU2lnbmVk
LW9mZi1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4
LmludGVsLmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMgfCAy
NSArKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPj4+PiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+Pj4+IAo+ID4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc291bmR3aXJlL2J1cy5jIGIvZHJpdmVycy9zb3VuZHdpcmUvYnVzLmMKPiA+Pj4+IGlu
ZGV4IDVhZDQxMDlkYzcyZi4uMGE0NWRjNTcxM2RmIDEwMDY0NAo+ID4+Pj4gLS0tIGEvZHJpdmVy
cy9zb3VuZHdpcmUvYnVzLmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMvc291bmR3aXJlL2J1cy5jCj4g
Pj4+PiBAQCAtMzMyLDEyICszMzIsMTYgQEAgaW50IHNkd19ucmVhZChzdHJ1Y3Qgc2R3X3NsYXZl
ICpzbGF2ZSwgdTMyIGFkZHIsIHNpemVfdCBjb3VudCwgdTggKnZhbCkKPiA+Pj4+IAlpZiAocmV0
IDwgMCkKPiA+Pj4+IAkJcmV0dXJuIHJldDsKPiA+Pj4+IAo+ID4+Pj4gLQlyZXQgPSBwbV9ydW50
aW1lX2dldF9zeW5jKHNsYXZlLT5idXMtPmRldik7Cj4gPj4+PiAtCWlmIChyZXQgPCAwKQo+ID4+
Pj4gLQkJcmV0dXJuIHJldDsKPiA+Pj4+ICsJaWYgKHBtX3J1bnRpbWVfZW5hYmxlZChzbGF2ZS0+
YnVzLT5kZXYpKSB7Cj4gPj4+PiArCQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHNsYXZlLT5i
dXMtPmRldik7Cj4gPj4+PiArCQlpZiAocmV0IDwgMCkKPiA+Pj4+ICsJCQlyZXR1cm4gcmV0Owo+
ID4+Pj4gKwl9Cj4gPj4+PiAKPiA+Pj4+IAlyZXQgPSBzZHdfdHJhbnNmZXIoc2xhdmUtPmJ1cywg
Jm1zZyk7Cj4gPj4+PiAtCXBtX3J1bnRpbWVfcHV0KHNsYXZlLT5idXMtPmRldik7Cj4gPj4+PiAr
Cj4gPj4+PiArCWlmIChwbV9ydW50aW1lX2VuYWJsZWQoc2xhdmUtPmJ1cy0+ZGV2KSkKPiA+Pj4+
ICsJCXBtX3J1bnRpbWVfcHV0KHNsYXZlLT5idXMtPmRldik7Cj4gPj4+PiAKPiA+Pj4+IAlyZXR1
cm4gcmV0Owo+ID4+Pj4gfQo+ID4+Pj4gQEAgLTM1OSwxMyArMzYzLDE2IEBAIGludCBzZHdfbndy
aXRlKHN0cnVjdCBzZHdfc2xhdmUgKnNsYXZlLCB1MzIgYWRkciwgc2l6ZV90IGNvdW50LCB1OCAq
dmFsKQo+ID4+Pj4gCQkJICAgc2xhdmUtPmRldl9udW0sIFNEV19NU0dfRkxBR19XUklURSwgdmFs
KTsKPiA+Pj4+IAlpZiAocmV0IDwgMCkKPiA+Pj4+IAkJcmV0dXJuIHJldDsKPiA+Pj4+IC0KPiA+
Pj4+IC0JcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhzbGF2ZS0+YnVzLT5kZXYpOwo+ID4+Pj4g
LQlpZiAocmV0IDwgMCkKPiA+Pj4+IC0JCXJldHVybiByZXQ7Cj4gPj4+PiArCWlmIChwbV9ydW50
aW1lX2VuYWJsZWQoc2xhdmUtPmJ1cy0+ZGV2KSkgewo+ID4+Pj4gKwkJcmV0ID0gcG1fcnVudGlt
ZV9nZXRfc3luYyhzbGF2ZS0+YnVzLT5kZXYpOwo+ID4+Pj4gKwkJaWYgKHJldCA8IDApCj4gPj4+
PiArCQkJcmV0dXJuIHJldDsKPiA+Pj4+ICsJfQo+ID4+Pj4gCj4gPj4+PiAJcmV0ID0gc2R3X3Ry
YW5zZmVyKHNsYXZlLT5idXMsICZtc2cpOwo+ID4+Pj4gLQlwbV9ydW50aW1lX3B1dChzbGF2ZS0+
YnVzLT5kZXYpOwo+ID4+Pj4gKwo+ID4+Pj4gKwlpZiAocG1fcnVudGltZV9lbmFibGVkKHNsYXZl
LT5idXMtPmRldikpCj4gPj4+PiArCQlwbV9ydW50aW1lX3B1dChzbGF2ZS0+YnVzLT5kZXYpOwo+
ID4+Pj4gCj4gPj4+PiAJcmV0dXJuIHJldDsKPiA+Pj4+IH0KPiA+Pj4+IC0tIAo+ID4+Pj4gMi4y
MC4xCj4gPj4+PiAKPiA+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPj4+PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+Pj4gQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCj4gPj4+PiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5j
b20vdjIvdXJsP3U9aHR0cHMtM0FfX21haWxtYW4uYWxzYS0yRHByb2plY3Qub3JnX21haWxtYW5f
bGlzdGluZm9fYWxzYS0yRGRldmVsJmQ9RHdJQkFnJmM9YVVxOTgzTDJwdWUyRnFLRm9QNlBHSE1K
UXlvSjdrbDNzM0daLV9oYVhxWSZyPWc3R0FRRU5WWHhfUlFkeVhISW5QTWcmbT12RVRHUUxTUGVH
YjdLX1pzWHY0VGwzVkZmZFh6eXVtbVREZ2E5N296SmNnJnM9TGlXNFNUb2g1VTB6aG5rb3g1NG9S
aEoxdTN2Rk5iQkI5bm16UkR1Q0RqSSZlPQo+ID4+IAo+ID4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiA+PiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiA+PiBodHRwczovL3VybGRlZmVuc2Uu
cHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX21haWxtYW4uYWxzYS0yRHByb2plY3Qu
b3JnX21haWxtYW5fbGlzdGluZm9fYWxzYS0yRGRldmVsJmQ9RHdJQkFnJmM9YVVxOTgzTDJwdWUy
RnFLRm9QNlBHSE1KUXlvSjdrbDNzM0daLV9oYVhxWSZyPWc3R0FRRU5WWHhfUlFkeVhISW5QTWcm
bT1pXzBTMzU5aEZJVnFOZ3YzZlI1X01OekRPSFA5OXRyZFhzelotRk1pUUVFJnM9UnhQSHhLZkkz
djZGa2g3cXpLanE4c05pLTVRTW9ZOFhmeU1EU3F1QTM4byZlPSAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
