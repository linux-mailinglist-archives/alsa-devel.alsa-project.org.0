Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 008FF1245B2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 12:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 971D8839;
	Wed, 18 Dec 2019 12:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 971D8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576668170;
	bh=Ml+y6uDuJZWy8S6kGD01iyqpDH2XNS/MEJrvlMXVRWY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEVbKtG/lbt1Tb/0lugIYsD6uIBfo96fJbPEtE9jEYnDF36g8zecLudcSzC8mEZ6K
	 TSAdVRnItXqaB5K0GnyUBqdyNO8uJffnsMC4Sf96KsPBr2H5FNmG0bTolgKnyEHSj6
	 alTK8Dn9yamN7iV7lpUE3joHvVwF1tvOQfiiLb4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D09CF80247;
	Wed, 18 Dec 2019 12:21:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6FAF8022C; Wed, 18 Dec 2019 12:21:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E5E8F80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 12:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5E8F80059
Received: from [37.162.94.155] (port=27596 helo=[192.168.43.3])
 by hostingweb31.netsons.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1ihXNz-00B31J-Q6; Wed, 18 Dec 2019 12:20:59 +0100
To: Daniel Mack <daniel@zonque.org>, Lee Jones <lee.jones@linaro.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org> <20191217133952.GJ18955@dell>
 <ce6e0b19-ec40-c17b-cee6-05eca52d5df3@zonque.org>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e288a6e1-a967-d7cd-72fc-d190819953e3@lucaceresoli.net>
Date: Wed, 18 Dec 2019 12:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ce6e0b19-ec40-c17b-cee6-05eca52d5df3@zonque.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-i2c@vger.kernel.org, pascal.huerst@gmail.com, linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
	transceivers
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

SGkgRGFuaWVsLAoKT24gMTcvMTIvMTkgMjA6MjQsIERhbmllbCBNYWNrIHdyb3RlOgo+Pj4gKysr
IGIvZHJpdmVycy9tZmQvYWQyNDJ4LWJ1cy5jCj4+PiBAQCAtMCwwICsxLDQyIEBACj4+PiArLy8g
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+Pj4gKwo+Pj4gKyNpbmNsdWRl
IDxsaW51eC9pMmMuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+Pj4gKyNpbmNsdWRl
IDxsaW51eC9tZmQvYWQyNDJ4Lmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+Pj4g
KyNpbmNsdWRlIDxsaW51eC9vZi5oPgo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQgYWQyNDJ4X2J1c19p
MmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+Pj4gK3sKPj4+ICvC
oMKgwqAgZGV2X3NldF9kcnZkYXRhKCZpMmMtPmRldiwgaTJjKTsKPj4+ICvCoMKgwqAgaTJjX3Nl
dF9jbGllbnRkYXRhKGkyYywgJmkyYy0+ZGV2KTsKPj4KPj4gUGxlYXNlIGV4cGxhaW4gdG8gbWUg
d2hhdCB5b3UgdGhpbmsgaXMgaGFwcGVuaW5nIGhlcmUuCj4+Cj4+PiArwqDCoMKgIHJldHVybiAw
Owo+Pj4gK30KPj4KPj4gV2hhdCBkb2VzIHRoaXMgZHJpdmVyIGRvP8KgIFNlZW1zIGtpbmRhIHBv
aW50bGVzcz8KPiAKPiBBcyBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBsb2csIHRoZXNlIGRldmlj
ZXMgZXhwb3NlIHR3byBhZGRyZXNzZXMgb24KPiB0aGUgaTJjIGJ1cywgYW5kIGVhY2ggb2Ygd2hp
Y2ggZXhpc3RzIGZvciBhIGRpc3RpbmN0IHB1cnBvc2UuIFRoZQo+IHByaW1hcnkgb25lIGlzIHVz
ZWQgdG8gYWNjZXNzIHJlZ2lzdGVycyBvbiB0aGUgbWFzdGVyIG5vZGUgaXRzZWxmLCB0aGUKPiBz
ZWNvbmQgb25lIGlzIHByb3h5aW5nIHRyYWZmaWMgdG8gcmVtb3RlIG5vZGVzLgo+IAo+IE5vdywg
dGhlIHF1ZXN0aW9uIGlzIGhvdyB0byBzdXBwb3J0IHRoYXQsIGFuZCB0aGUgYXBwcm9hY2ggY2hv
c2VuIGhlcmUKPiBpcyB0byBoYXZlIGEgZHVtbXkgZHJpdmVyIHNpdHRpbmcgb24gdGhlIDJuZCBh
ZGRyZXNzLCBhbmQgdG8gcmVhY2ggb3V0Cj4gdG8gaXQgdmlhIGEgRFQgcGhhbmRsZSBmcm9tIHRo
ZSBtYXN0ZXIgbm9kZS4gSSBkb24ndCBsaWtlIHRoYXQgbXVjaAo+IGVpdGhlciwgYnV0IEknbSBu
b3QgYXdhcmUgb2YgYSBjbGVhbmVyIHdheSB0byBiaW5kIHR3byBhZGRyZXNzZXMgd2l0aAo+IG9u
ZSBkcml2ZXIuIElmIHRoZXJlIGlzIGFueSwgSSdkIGJlIGhhcHB5IHRvIGNoYW5nZSB0aGF0LgoK
SGF2ZSBhIGxvb2sgYXQgaTJjX25ld19kdW1teV9kZXZpY2UoKSwgcGVyaGFwcyBpdCBpcyB3aGF0
IHlvdSBuZWVkIGhlcmUuCgotLSAKTHVjYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
