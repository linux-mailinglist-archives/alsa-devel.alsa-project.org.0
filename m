Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403BF234
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DEEC16CF;
	Tue, 30 Apr 2019 10:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DEEC16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556613896;
	bh=NioCiqFozcTxbI2wyqcDQp4V/Fqo32xmScu0eQS2KO0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hw80I6AVLJL5DvUIku/QyRS9ZJuR/FzUAqj3CnTaqb6sXH+EQu/gSUvBn2EDsZerZ
	 LLwIxno+WGxTz7hejaq0VXIOf4dsjDEE32caPT5u1m2ueTs3NKCTs6FoUsmg5sdPNQ
	 /weeyhuP+FhY5IcHH3bpa0KvCjZ6OxhMUTUNzG7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55AAEF896AA;
	Tue, 30 Apr 2019 10:43:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47AC6F896AA; Tue, 30 Apr 2019 10:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B7E6F80C0D
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 10:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B7E6F80C0D
Received: from [125.35.49.90] (helo=[10.0.0.21])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hLOLw-0002u1-SA; Tue, 30 Apr 2019 08:43:05 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20190430065711.14977-1-hui.wang@canonical.com>
 <s5hh8aghro8.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <b0c859a8-3f7f-2948-2fc8-f657adf3c804@canonical.com>
Date: Tue, 30 Apr 2019 16:42:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hh8aghro8.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/hdmi - Don't report Jack event
 if no need to do that
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

Ck9uIDIwMTkvNC8zMCDkuIvljYgzOjM1LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gVHVlLCAz
MCBBcHIgMjAxOSAwODo1NzoxMSArMDIwMCwKPiBIdWkgV2FuZyB3cm90ZToKPj4gT24gdGhlIG1h
Y2hpbmVzIHdpdGggQU1EIEdQVSBvciBOdmlkaWEgR1BVLCB3ZSBvZnRlbiBtZWV0IHRoaXMgaXNz
dWVzOgo+PiBhZnRlciBzMywgdGhlcmUgYXJlIDQgSERNSS9EUCBhdWRpbyBkZXZpY2VzIGluIHRo
ZSBnbm9tZS1zb3VuZC1zZXR0aW5nCj4+IGV2ZW4gdGhlcmUgaXMgbm8gYW55IG1vbml0b3JzIHBs
dWdnZWQuCj4+Cj4+IFdoZW4gdGhpcyBwcm9ibGVtIGhhcHBlbnMsIHdlIGNoZWNrIHRoZSAvcHJv
Yy9hc291bmQvY2FyZFgvZWxkI04uTSwgd2UKPj4gd2lsbCBmaW5kIHRoZSBtb25pdG9yX3ByZXNl
bnQ9MSwgZWxkX3ZhbGlkPTAuCj4+Cj4+IFRoZSByb290IGNhdXNlIGlzIHNvbWVob3cgdGhlIHBp
bl9zZW5zZSByZXBvcnRzIHRoZSBtb25pdG9yIGlzIHByZXNlbnQKPj4gYW5kIGVsZCBpcyB2YWxp
ZCB3aGVuIHRoZXJlIGlzIG5vIG1vbml0b3IgcGx1Z2dlZC4KPj4KPj4gVGhlIGN1cnJlbnQgZHJp
dmVyIHdpbGwgcmVhZCB0aGUgZWxkIGRhdGEgaWYgdGhlIHBpbl9zZW5zZSByZXBvcnRzIHRoZQo+
PiBlbGQgaXMgdmFsaWQsIGJlY2F1c2Ugb2Ygbm8gbW9uaXRvciBpcyBwbHVnZ2VkLCB0aGVyZSBp
cyBubyB2YWxpZCBlbGQKPj4gZGF0YSwgdGhlbiB0aGUgZWxkLT52YWxpZCBpcyBzZXQgdG8gMC4K
Pj4KPj4gSWYgd2UgZG9uJ3QgbGV0IGRyaXZlciByZXBvcnQgSmFjayBldmVudCB3aGVuIG1vbml0
b3JfcHJlc2VudD0xIHdoaWxlCj4+IGVsZF92YWxpZD0wLCB0aGVyZSB3aWxsIGJlIG5vIHRoaXMg
aXNzdWUuCj4+Cj4+IEFmdGVyIHRoaXMgY2hhbmdlLCB0aGUgZHJpdmVyIG9ubHkgcmVwb3J0cyBK
YWNrIGV2ZW50IHdpdGggb25lIG9mIHRoZQo+PiBiZWxvdyAyIGNvbmRpdG9uczoKPj4gICBlbGQt
Pm1vbml0b3JfcHJlc2VudD0xIGFuZCBlbGQtPmVsZF92YWxpZD0xIChhIHZhbGlkIG1vbml0b3Ig
ZGV0ZWN0KQo+PiAgIGVsZC0+bW9uaXRvcl9wcmVzZW50PTAgKGEgbW9uaXRvciBpcyB1bnBsdWdn
ZWQpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwuY29t
Pgo+IFdlbGwsIGlmIHRoZSBlbGRfdmFsaWQ9MSBpcyBtYW5kYXRvcnksIGJhc2ljYWxseSB3ZSBj
YW4gdXNlIGl0IGFzIHRoZQo+IGNvbmRpdGlvbiBvZiBqYWNrPTEsIGxpa2UgdGhlIHBhdGNoIGJl
bG93LiAgVGhlIHJldHVybiB2YWx1ZSBmcm9tCj4gaGRtaV9wcmVzZW50X3NlbnNlKCkgaW5kaWNh
dGVzIG9ubHkgd2hldGhlciB3ZSBtYXkgc3luYyBqYWNrIHN0YXRlIG9yCj4gbm90LCBhbmQgaXQn
cyBub3QgYWJvdXQgdGhlIGphY2sgc3RhdGUgaXRzZWxmLgo+Cj4KPiB0aGFua3MsCj4KPiBUYWth
c2hpCj4KPiAtLS0KPiAtLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYwo+ICsrKyBiL3Nv
dW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jCj4gQEAgLTE2MjUsNyArMTYyNSw3IEBAIHN0YXRpYyB2
b2lkIHN5bmNfZWxkX3ZpYV9hY29tcChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKPiAgIAlpZiAo
amFjayA9PSBOVUxMKQo+ICAgCQlnb3RvIHVubG9jazsKPiAgIAlzbmRfamFja19yZXBvcnQoamFj
aywKPiAtCQkJZWxkLT5tb25pdG9yX3ByZXNlbnQgPyBTTkRfSkFDS19BVk9VVCA6IDApOwo+ICsJ
CQkoZWxkLT5tb25pdG9yX3ByZXNlbnQgJiYgZWxkLT5lbGRfdmFsaWQpID8gU05EX0pBQ0tfQVZP
VVQgOiAwKTsKPiAgICB1bmxvY2s6Cj4gICAJbXV0ZXhfdW5sb2NrKCZwZXJfcGluLT5sb2NrKTsK
PiAgIH0KCkFsbCBJbnRlbCBtYWNoaW5lcyB3aGljaCBnZXQgZWxkIHZpYSBhY29tcCBkb24ndCBo
YXZlIHRoaXMgaXNzdWUsIHNvIG5vIApuZWVkIHRvIGNoYW5nZSB0aGlzIGZ1bmN0aW9uLgoKRm9y
IHRob3NlIG1hY2hpbmVzICh3aXRoIG52IGdwdSBjYXJkIG9yIGFtZCBncHUgY2FyZCnCoCB3aGlj
aCBuZWVkIHRvIApjYWxsIGhkbWlfcHJlc2VudF9zZW5zZV92aWFfdmVyYnMoKSwgdGhleSBoYXZl
IHRoaXMgaXNzdWUuIGlmIApoZG1pX3ByZXNlbnRfc2Vuc2VfdmlhX3ZlcmJzKCkgcmV0dXJucyB0
cnVlLCB0aGUgaGRtaV9wcmVzZW50X3NlbnNlKCkgCnJldHVybnMgdHJ1ZSwgdGhlbiBzbmRfaGRh
X2phY2tfcmVwb3J0X3N5bmMoKSB3aWxsIGJlIGNhbGxlZC4gU28gaWYgd2UgCndhbnQgdG8gZml4
IHRoaXMgaXNzdWUsIHdlIG5lZWQgdG8gbGV0IGhkbWlfcHJlc2VudF9zZW5zZV92aWFfdmVyYnMo
KSAKbm90IHJldHVybiB0cnVlIG9yIHdlIGNoYW5nZSB0aGUgcmVhZF9waW5fc2Vuc2UoKSBpbiB0
aGUgaGRhX2phY2suYwoKCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
