Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B02A24D
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 03:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF67173C;
	Sat, 25 May 2019 03:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF67173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558748642;
	bh=VZNm7fojnzVtFv7h7VdtQ8iJ7r2syYTsywsWCHYILrk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zbboj88DYoAtmSrnPjS5tETgd5dsfmgirlJrU26RRRDMhORwOM+cVXOI2KEb3RuZ7
	 Vgk4SWzXYf4lzwRj5GSMev1en3C57w0GcZ0jnPRdz4ElcPu3LwaQZvQnbqv992VfHl
	 FPTzsWX+74nRnhCTZ9wEqAolGpeWBB538EKRbnEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA837F89674;
	Sat, 25 May 2019 03:42:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAACBF89674; Sat, 25 May 2019 03:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07702F806F7
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 03:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07702F806F7
Received: from [111.196.77.193] (helo=[192.168.1.104])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hULg6-0001bM-G0; Sat, 25 May 2019 01:40:54 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
 <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
 <CAD8Lp47qCbPh+aZjr0pjzZAcBXqRbMU+5Y_HPy7jrJhUgsD3Tg@mail.gmail.com>
 <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <210f78be-7988-0daf-1563-513a3da0ba06@canonical.com>
Date: Sat, 25 May 2019 09:40:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <72729168-214a-264d-c704-f718d7cfde4b@linux.intel.com>
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

Ck9uIDIwMTkvNS8yNSDkuIrljYgxMjoxMiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4K
Pgo+IE9uIDUvMjQvMTkgMTA6NDUgQU0sIERhbmllbCBEcmFrZSB3cm90ZToKPj4gVGhhbmtzIGZv
ciB0aGUgcGF0Y2hlcyEKPj4KPj4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgNzoyNiBBTSBQaWVy
cmUtTG91aXMgQm9zc2FydAo+PiA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPj4+IEkgYW0gbm90IHN1cmUgaWYgaXQncyBhIGdvb2QgaWRlYSB0byBlbmFibGUg
dGhpcyBieSBkZWZhdWx0LCB0aGUKPj4+IGV4cGVyaWVuY2Ugb2YgdGhlIGZpcnN0IHJvdW5kIHNo
b3dlZCBpdCdzIHJpc2t5IHRvIG1ha2UgYXNzdW1wdGlvbnMgb24KPj4+IHdoYXQgQklPUyB2ZW5k
b3JzIGltcGxlbWVudGVkLgo+Pgo+PiBDYW4geW91IGNsYXJpZnkgd2hhdCB5b3UgbWVhbiBoZXJl
LCBhcmUgeW91IHNheWluZyB5b3UgZG9uJ3Qgd2FudCB0bwo+PiBlbmFibGUgdGhpcyBuZXcgRE1J
QyBoYXJkd2FyZSBzdXBwb3J0IGJ5IGRlZmF1bHQ/Cj4KPiBOby4gV2hhdCBJIGFtIHNheWluZyBp
cyB0aGF0Cj4gYSkgdGhlIGxlZ2FjeSBIRGF1ZGlvIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IERN
SUNzCj4gYikgdGhlIGRlY2lzaW9uIHRvIGFib3J0IHRoZSBIRGF1ZGlvIGxlZ2FjeSBkcml2ZXIg
cHJvYmUgc2hvdWxkIG5vdCBiZSAKPiB0aGUgZGVmYXVsdCwgc2luY2UgaXQgZGVwZW5kcyBvbiBC
SU9TIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHdyb25nIAo+IGFuZCBvbiB3aGljaCBJIGhhdmUg
Knplcm8qIGNvbnRyb2wuCj4KPiBUaGVyZSBhcmUgNCBjYXNlcyByZWFsbHk6Cj4KPiAxLiBETUlD
cyBhdHRhY2hlZCB0byBQQ0ggYW5kIEJJT1MvTkhMVCByZXBvcnRzIERNSUNTIC0+IGFib3J0IEhE
YXVkaW8gCj4gbGVnYWN5IHByb2JlCj4gMi4gTm8gRE1JQ3MgYXR0YWNoZWQgdG8gUENIIGFuZCBC
SU9TL05ITFQgZG9lcyBub3QgcmVwb3J0IERNSUNzIC0+IAo+IGNvbnRpbnVlIHByb2JlIGFuZCB1
c2UgSERBdWRpbyBsZWdhY3kuCj4gMy4gRE1JQ3MgYXR0YWNoZWQgdG8gUENIIGFuZCBCSU9TL05I
TFQgZG9lcyBub3QgcmVwb3J0IERNSUNzIC0+IGJyb2tlbiAKPiBjb25maWcsIHdlIHdpbGwgbmVl
ZCBhbiBvcHRpb24gdG8gYWJvcnQgdGhlIHByb2JlIGJ5IGZvcmNlIGFuZCBpZ25vcmUgCj4gdGhl
IEJJT1MgaWYgeW91IGNhcmUgYWJvdXQgYXVkaW8gY2FwdHVyZS4KPiA0LiBubyBETUlDcyBhdHRh
Y2hlZCB0byBQQ0ggYW5kIEJJT1MvTkhMVCByZXBvcnRzIERNSUNzIC0+IGJyb2tlbiAKPiBjb25m
aWcsIHdlIG5lZWQgYW4gb3B0aW9uIHRvIGlnbm9yZSB0aGUgQklPUyBhbmQgY29udGludWUgdGhl
IHByb2JlLgoKR290IGl0LMKgIHdlIHdpbGwgZG8gYSB0ZXN0IG9uIGEgY291cGxlIG9mIG1hY2hp
bmVzLCBsZXQgdXMgc2VlIGlmIHdlIGNhbiAKbWVldCAzIGFuZCA0IGluIHJlYWxpdHkuCgo+Cj4g
RG9lcyB0aGlzIGhlbHA/Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
