Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4682CC8B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 18:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC931834;
	Tue, 28 May 2019 18:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC931834
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559062149;
	bh=+v5dRJbFMzgVIgJy/x+x+dZvSijCWow03gb3CVvTJh0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MQKaAcChRqJ+5k3o7XyfzeALYwG9Ozu15iff2B+swT2iKYMLiIXzinge/D/k2llMq
	 tTeeCYwnnkn0kNU5SqJz2Yaes1duoH6busak5lqaOHpJAdWZB64UidCXl3oMTGDJWY
	 LbvQwQ2xuJg+aIx7YU4QSQJV5FIoMx+7B+aF2CRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21CFCF89719;
	Tue, 28 May 2019 18:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 841BCF8971D; Tue, 28 May 2019 18:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76834F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76834F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 09:47:12 -0700
X-ExtLoop1: 1
Received: from ngnagark-mobl.amr.corp.intel.com (HELO [10.254.104.129])
 ([10.254.104.129])
 by orsmga007.jf.intel.com with ESMTP; 28 May 2019 09:47:11 -0700
To: =?UTF-8?B?VGFtw6FzIEtvdsOhY3M=?= <kepszlok@gmail.com>,
 alsa-devel@alsa-project.org
References: <CAOz7CXoOS3rA5uWVQgs+6LGephq0sNoPfom=sq0pjHsJEWGsKg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9749e4f4-fd52-e0a7-1a74-683e9acef3ee@linux.intel.com>
Date: Tue, 28 May 2019 11:47:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOz7CXoOS3rA5uWVQgs+6LGephq0sNoPfom=sq0pjHsJEWGsKg@mail.gmail.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: Baytrail: add quirk for Aegex
 10 (RU2) tablet
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

CgpPbiA1LzI0LzE5IDEyOjAzIFBNLCBUYW3DoXMgS292w6FjcyB3cm90ZToKPiBUaGlzIHRhYmxl
dCBoYXMgYW4gaW5jb3JyZWN0IGFjcGkgaWRlbnRpZmllciwgd2hpY2ggaXMgd2h5IGl0IGlzIHRy
eWluZyB0bwo+IGxvYWQgdGhlIFJUNTY0MCBkcml2ZXIgaW5zdGVhZCBvZiB0aGUgUlQ1NzYyIGRy
aXZlci4gVGhlIFJUNTY0MCBkcml2ZXIsIG9uCj4gdGhlIG90aGVyIGhhbmQsIGNoZWNrcyB0aGUg
aGFyZHdhcmUgSUQsIHNvIG5vIGRyaXZlcnMgYXJlIGxvYWRlZCBkdXJpbmcKPiBib290Lgo+IFRo
aXMgZml4IHJlc29sdmVzIHRvIGxvYWQgdGhlIFJUNTY3MiBkcml2ZXIgb24gdGhpcyB0YWJsZXQg
ZHVyaW5nIGJvb3QuIEl0Cj4gYWxzbyBwcm92aWRlcyB0aGUgY29ycmVjdCBJTyBjb25maWd1cmF0
aW9uLCBsaWtlIHRoZSBqYWNrIGRldGVjdCBtb2RlIDMsCj4gZm9yIDEuOFYgcHVsbHVwLgo+IEkg
d291bGQgbGlrZSB0byB0aGFuayBQaWVycmUtTG91aXMgQm9zc2FydCBmb3IgaGVscGluZyB3aXRo
IHRoaXMgcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogS292w6FjcyBUYW3DoXMgPGtlcHN6bG9r
QGdtYWlsLmNvbT4KCgpUaGFua3MgZm9yIHRoZSBjaGFuZ2VzIFRhbWFzLgpJIGNvdWxkIG5vdCBh
cHBseSB0aGlzIHBhdGNoLCBzb21lIHNvcnQgb2YgZW1haWwgdXVlbmNvZGUgZXJyb3I/IHNlZSAK
YWxzbyBjb21tZW50cyBiZWxvdy4gSWYgeW91IGNhbiB1cGRhdGUgdGhpcyBwYXRjaCBhbmQgcHJv
dmlkZSBhIHYyIGl0J2QgCmJlIGdyZWF0LgpBbHNvIGFsd2F5cyBDYzogbWFpbnRhaW5lcnMgKE1h
cmsgQnJvd24gYW5kIFRha2FzaGkgSXdhaSwgYWRkZWQgdG8gdGhpcyAKdGhyZWFkKSBpZiB5b3Ug
d2FudCBhIHBhdGNoIHRvIGJlIGFwcGxpZWQuCi1QaWVycmUKCj4gLS0tCj4gZGlmZiAtLWdpdCBh
L29yaS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1hY3BpLWludGVsLWJ5dC1tYXRjaC5jCj4g
Yi9uZXcvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwo+
IGluZGV4IGZlODEyYTkuLmU1NDk5NTAgMTAwNjQ0Cj4gLS0tIGEvb3JpL3NvdW5kL3NvYy9pbnRl
bC9jb21tb24vc29jLWFjcGktaW50ZWwtYnl0LW1hdGNoLmMKPiArKysgYi9uZXcvc291bmQvc29j
L2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwo+IEBAIC0xLDQgKzEsNCBA
QAo+IC0vKgo+ICvvu78vKgoKbm8gbmVlZCBmb3IgY2hhbmdlIGhlcmUuCgo+ICAgICogc29jLWFw
Y2ktaW50ZWwtYnl0LW1hdGNoLmMgLSB0YWJsZXMgYW5kIHN1cHBvcnQgZm9yIEJZVCBBQ1BJCj4g
ZW51bWVyYXRpb24uCj4gICAgKgo+ICAgICogQ29weXJpZ2h0IChjKSAyMDE3LCBJbnRlbCBDb3Jw
b3JhdGlvbi4KPiBAQCAtMjIsNiArMjIsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBieXRfbWFj
aGluZV9pZDsKPiAKPiAgICNkZWZpbmUgQllUX1RISU5LUEFEXzEwICAxCj4gICAjZGVmaW5lIEJZ
VF9QT1ZfUDEwMDZXICAgMgo+ICsjZGVmaW5lIEJZVF9BRUdFWF8xMCAgICAgMwo+IAo+ICAgc3Rh
dGljIGludCBieXRfdGhpbmtwYWQxMF9xdWlya19jYihjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9p
ZCAqaWQpCj4gICB7Cj4gQEAgLTM1LDYgKzM2LDEyIEBAIHN0YXRpYyBpbnQgYnl0X3Bvdl9wMTAw
NndfcXVpcmtfY2IoY29uc3Qgc3RydWN0Cj4gZG1pX3N5c3RlbV9pZCAqaWQpCj4gICAgcmV0dXJu
IDE7Cj4gICB9Cj4gCj4gK3N0YXRpYyBpbnQgYnl0X2FlZ2V4MTBfcXVpcmtfY2IoY29uc3Qgc3Ry
dWN0IGRtaV9zeXN0ZW1faWQgKmlkKQo+ICt7Cj4gKyBieXRfbWFjaGluZV9pZCA9IEJZVF9BRUdF
WF8xMDsKPiArIHJldHVybiAxOwo+ICt9CgppbmRlbnRhdGlvbiBpc3N1ZXM/Cgo+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90YWJsZVtdID0gewo+ICAgIHsKPiAgICAu
Y2FsbGJhY2sgPSBieXRfdGhpbmtwYWQxMF9xdWlya19jYiwKPiBAQCAtNzUsNiArODIsMTQgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90YWJsZVtdID0gewo+ICAgIERN
SV9FWEFDVF9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjBFNTciKSwKPiAgICB9LAo+ICAgIH0sCj4g
KyB7Cj4gKyAvKiBBZWdleCAxMCB0YWJsZXQgKFJVMikgKi8KPiArIC5jYWxsYmFjayA9IGJ5dF9h
ZWdleDEwX3F1aXJrX2NiLAo+ICsgLm1hdGNoZXMgPSB7Cj4gKyBETUlfTUFUQ0goRE1JX1NZU19W
RU5ET1IsICJBRUdFWCIpLAo+ICsgRE1JX01BVENIKERNSV9QUk9EVUNUX1ZFUlNJT04sICJSVTIi
KSwKPiArIH0sCj4gKyB9LAoKaW5kZW50YXRpb24gYW5kIGtlcm5lbCBzdHlsZT8KCj4gICAgeyB9
Cj4gICB9Owo+IAo+IEBAIC05Niw2ICsxMTEsMTUgQEAgc3RhdGljIHN0cnVjdCBzbmRfc29jX2Fj
cGlfbWFjaCBieXRfcG92X3AxMDA2dyA9IHsKPiAgICAuc29mX3RwbGdfZmlsZW5hbWUgPSAic29m
LWJ5dC1ydDU2NTEudHBsZyIsCj4gICB9Owo+IAo+ICtzdGF0aWMgc3RydWN0IHNuZF9zb2NfYWNw
aV9tYWNoIGJ5dF9hZWdleF8xMCA9IHsKPiArIC5pZCA9ICIxMEVDNTY0MCIsCj4gKyAuZHJ2X25h
bWUgPSAiY2h0LWJzdy1ydDU2NzIiLAo+ICsgLmZ3X2ZpbGVuYW1lID0gImludGVsL2Z3X3NzdF8w
ZjI4LmJpbiIsCj4gKyAuYm9hcmQgPSAiY2h0LWJzdyIsCj4gKyAuc29mX2Z3X2ZpbGVuYW1lID0g
ImludGVsL3NvZi1ieXQucmkiLAo+ICsgLnNvZl90cGxnX2ZpbGVuYW1lID0gImludGVsL3NvZi1i
eXQtcnQ1NjcwLnRwbGciLAoKdGhlIGludGVsLyBwcmVmaXggaXMgbm8gbG9uZ2VyIHVzZWQgZm9y
IFNPRi4KCgpBbHNvIHNpbmNlIHlvdSBhcmUgdXNpbmcgZXhhY3RseSB0aGUgc2FtZSBxdWlyayBh
cyBmb3IgQllUX1RISU5LUEFEXzEwIAp5b3UgY291bGQgdXNlIGEgY29tbW9uIHN0cnVjdHVyZSBp
bnN0ZWFkIG9mIGEgZHVwbGljYXRlZCBvbmUuCgo+ICt9Owo+ICsKPiAgIHN0YXRpYyBzdHJ1Y3Qg
c25kX3NvY19hY3BpX21hY2ggKmJ5dF9xdWlyayh2b2lkICphcmcpCj4gICB7Cj4gICAgc3RydWN0
IHNuZF9zb2NfYWNwaV9tYWNoICptYWNoID0gYXJnOwo+IEBAIC0xMDcsNiArMTMxLDggQEAgc3Rh
dGljIHN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCAqYnl0X3F1aXJrKHZvaWQgKmFyZwo+ICAgIHJl
dHVybiAmYnl0X3RoaW5rcGFkXzEwOwo+ICAgIGNhc2UgQllUX1BPVl9QMTAwNlc6Cj4gICAgcmV0
dXJuICZieXRfcG92X3AxMDA2dzsKPiArIGNhc2UgQllUX0FFR0VYXzEwOgo+ICsgcmV0dXJuICZi
eXRfYWVnZXhfMTA7CgppbmRlbnRhdGlvbj8KCj4gICAgZGVmYXVsdDoKPiAgICByZXR1cm4gbWFj
aDsKPiAgICB9Cj4gCj4gZGlmZiAtLWdpdCBhL29yaS9zb3VuZC9zb2MvY29kZWNzL3J0NTY3MC5j
IGIvbmV3L3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMKPiBpbmRleCA5YTAzNzEwLi4zN2NjZTA0
IDEwMDY0NAo+IC0tLSBhL29yaS9zb3VuZC9zb2MvY29kZWNzL3J0NTY3MC5jCj4gKysrIGIvbmV3
L3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLyoKPiAr77u/
LyoKCm5vIG5lZWQgZm9yIGNoYW5nZSBoZXJlCgo+ICAgICogcnQ1NjcwLmMgIC0tICBSVDU2NzAg
QUxTQSBTb0MgYXVkaW8gY29kZWMgZHJpdmVyCj4gICAgKgo+ICAgICogQ29weXJpZ2h0IDIwMTQg
UmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnAuCj4gQEAgLTI4ODIsNiArMjg4MiwxOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQKPiBkbWlfcGxhdGZvcm1faW50ZWxfcXVpcmtz
W10gPSB7Cj4gICAgUlQ1NjcwX0RFVl9HUElPIHwKPiAgICBSVDU2NzBfSkRfTU9ERTMpLAo+ICAg
IH0sCj4gKyB7Cj4gKyAuY2FsbGJhY2sgPSBydDU2NzBfcXVpcmtfY2IsCj4gKyAuaWRlbnQgPSAi
QWVnZXggMTAgdGFibGV0IChSVTIpIiwKPiArIC5tYXRjaGVzID0gewo+ICsgRE1JX01BVENIKERN
SV9TWVNfVkVORE9SLCAiQUVHRVgiKSwKPiArIERNSV9NQVRDSChETUlfUFJPRFVDVF9WRVJTSU9O
LCAiUlUyIiksCj4gKyB9LAo+ICsgLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcgKikoUlQ1
NjcwX0RNSUNfRU4gfAo+ICsgUlQ1NjcwX0RNSUMyX0lOUiB8Cj4gKyBSVDU2NzBfREVWX0dQSU8g
fAo+ICsgUlQ1NjcwX0pEX01PREUzKSwKPiArIH0sCj4gICAge30KPiAgIH07Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1haWxp
bmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
