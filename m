Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21137497D7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 05:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F78170E;
	Tue, 18 Jun 2019 05:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F78170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560829807;
	bh=x+hN+2BAtb8QRTDd42NPHI8kRVmCQcF2vycaPjEX4q4=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTTt99bY6TplqLpU0YcZOhvpBsRtXBNs2G0SG+vYZ7XNvVEf7CRqlGCgm5J2kBNb2
	 PSPjbOBgCsXmk+fhi9yX8uXp2tAfIH6Own/Euhxb0wH/vo1dxYAPrmUVnOcINy1nUf
	 MJ8Te092MqomthIhc7FBZoiMixBxlHWve54THJ7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3518EF896F4;
	Tue, 18 Jun 2019 05:48:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 147C3F896F4; Tue, 18 Jun 2019 05:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC563F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 05:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC563F89682
Received: from [125.35.49.90] (helo=[10.0.0.24])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hd56S-0006Th-Ns; Tue, 18 Jun 2019 03:48:13 +0000
From: Hui Wang <hui.wang@canonical.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
 <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
 <210f78be-7988-0daf-1563-513a3da0ba06@canonical.com>
Message-ID: <a1ba33bb-d33d-669f-861b-17f2ed1f94b1@canonical.com>
Date: Tue, 18 Jun 2019 11:48:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <210f78be-7988-0daf-1563-513a3da0ba06@canonical.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Curtis Malainey <cujomalainey@google.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
 are detected
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

Ck9uIDIwMTkvNS8yNSDkuIrljYg5OjQwLCBIdWkgV2FuZyB3cm90ZToKPgo+IE9uIDIwMTkvNS8y
NSDkuIrljYgxMjoxMiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDUv
MjQvMTkgMTA6NDUgQU0sIERhbmllbCBEcmFrZSB3cm90ZToKPj4+IFRoYW5rcyBmb3IgdGhlIHBh
dGNoZXMhCj4+Pgo+Pj4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgNzoyNiBBTSBQaWVycmUtTG91
aXMgQm9zc2FydAo+Pj4gPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4+Pj4gSSBhbSBub3Qgc3VyZSBpZiBpdCdzIGEgZ29vZCBpZGVhIHRvIGVuYWJsZSB0aGlz
IGJ5IGRlZmF1bHQsIHRoZQo+Pj4+IGV4cGVyaWVuY2Ugb2YgdGhlIGZpcnN0IHJvdW5kIHNob3dl
ZCBpdCdzIHJpc2t5IHRvIG1ha2UgYXNzdW1wdGlvbnMgb24KPj4+PiB3aGF0IEJJT1MgdmVuZG9y
cyBpbXBsZW1lbnRlZC4KPj4+Cj4+PiBDYW4geW91IGNsYXJpZnkgd2hhdCB5b3UgbWVhbiBoZXJl
LCBhcmUgeW91IHNheWluZyB5b3UgZG9uJ3Qgd2FudCB0bwo+Pj4gZW5hYmxlIHRoaXMgbmV3IERN
SUMgaGFyZHdhcmUgc3VwcG9ydCBieSBkZWZhdWx0Pwo+Pgo+PiBOby4gV2hhdCBJIGFtIHNheWlu
ZyBpcyB0aGF0Cj4+IGEpIHRoZSBsZWdhY3kgSERhdWRpbyBkcml2ZXIgZG9lcyBub3Qgc3VwcG9y
dCBETUlDcwo+PiBiKSB0aGUgZGVjaXNpb24gdG8gYWJvcnQgdGhlIEhEYXVkaW8gbGVnYWN5IGRy
aXZlciBwcm9iZSBzaG91bGQgbm90IAo+PiBiZSB0aGUgZGVmYXVsdCwgc2luY2UgaXQgZGVwZW5k
cyBvbiBCSU9TIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIAo+PiB3cm9uZyBhbmQgb24gd2hpY2gg
SSBoYXZlICp6ZXJvKiBjb250cm9sLgo+Pgo+PiBUaGVyZSBhcmUgNCBjYXNlcyByZWFsbHk6Cj4+
Cj4+IDEuIERNSUNzIGF0dGFjaGVkIHRvIFBDSCBhbmQgQklPUy9OSExUIHJlcG9ydHMgRE1JQ1Mg
LT4gYWJvcnQgSERhdWRpbyAKPj4gbGVnYWN5IHByb2JlCj4+IDIuIE5vIERNSUNzIGF0dGFjaGVk
IHRvIFBDSCBhbmQgQklPUy9OSExUIGRvZXMgbm90IHJlcG9ydCBETUlDcyAtPiAKPj4gY29udGlu
dWUgcHJvYmUgYW5kIHVzZSBIREF1ZGlvIGxlZ2FjeS4KPj4gMy4gRE1JQ3MgYXR0YWNoZWQgdG8g
UENIIGFuZCBCSU9TL05ITFQgZG9lcyBub3QgcmVwb3J0IERNSUNzIC0+IAo+PiBicm9rZW4gY29u
ZmlnLCB3ZSB3aWxsIG5lZWQgYW4gb3B0aW9uIHRvIGFib3J0IHRoZSBwcm9iZSBieSBmb3JjZSBh
bmQgCj4+IGlnbm9yZSB0aGUgQklPUyBpZiB5b3UgY2FyZSBhYm91dCBhdWRpbyBjYXB0dXJlLgo+
PiA0LiBubyBETUlDcyBhdHRhY2hlZCB0byBQQ0ggYW5kIEJJT1MvTkhMVCByZXBvcnRzIERNSUNz
IC0+IGJyb2tlbiAKPj4gY29uZmlnLCB3ZSBuZWVkIGFuIG9wdGlvbiB0byBpZ25vcmUgdGhlIEJJ
T1MgYW5kIGNvbnRpbnVlIHRoZSBwcm9iZS4KPgo+IEdvdCBpdCzCoCB3ZSB3aWxsIGRvIGEgdGVz
dCBvbiBhIGNvdXBsZSBvZiBtYWNoaW5lcywgbGV0IHVzIHNlZSBpZiB3ZSAKPiBjYW4gbWVldCAz
IGFuZCA0IGluIHJlYWxpdHkuCgpJIGJhY2twb3J0ZWQgdGhlc2UgNiBwYXRjaGVzIHRvIG91ciA1
LjAga2VybmVsIHdpdGggdGhlIHNvZiBkcml2ZXIgaW4gCml0LCBhbmQgdGVzdGVkIG9uIDMgbWFj
aGluZXMgd2hpY2ggaGF2ZSBkbWljIGNvbm5lY3RlZCB0byBQQ0ggKGF1ZGlvIApjb250cm9sbGVy
IHBjaWlkIDB4OWRjOCksIHdpdGhvdXQgdGhlc2UgNiBwYXRjaGVzLCBJIG5lZWQgdG8gYmxhY2ts
aXN0IApzbmRfaGRhX2ludGVsLmtvIGFuZCBzbmRfc29jX3NrbC5rbyB0byBtYWtlIHRoZSBzb2Yg
ZHJpdmVyIHdvcmssIGFmdGVyIApiYWNrcG9ydGluZyB0aGVzZSA2IHBhdGNoZXMsIEkgZG9uJ3Qg
bmVlZCB0byBibGFja2xpc3Qgc25kX2hkYV9pbnRlbC5rbywgCmJ1dCBzdGlsbCBuZWVkIHRvIGJs
YWNrbGlzdCBzbmRfc29jX3NrbC5rbywgb3RoZXJ3aXNlIHRoZSBzb2YgZHJpdmVyIApkb2Vzbid0
IHdvcmsuCgpBbmQgSSBhbHNvIHRlc3RlZCB0aGVzZSA2IHBhdGNoZXMgb24gMyBtYWNoaW5lcyB3
aXRob3V0IGRtaWMsIEkgZG9uJ3QgCm5lZWQgdG8gYmxhY2tsaXN0IGFueXRoaW5nLCB0aGUgYXVk
aW8gd29ya3Mgd2VsbCB2aWEgbGVnYWN5IGhkYXVkaW8uCgpTbyBmb3IgY29leGlzdGVuY2XCoCBv
ZiBzb2Nfc2tsIGFuZCBzb2Nfc29mIGRyaXZlcnMsIGRvIHdlIGhhdmUgYW55IHBsYW4/CgpUaGFu
a3MsCgpIdWkuCgoKPgo+Pgo+PiBEb2VzIHRoaXMgaGVscD8KPj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
