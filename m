Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1912771B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 09:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 401F71654;
	Fri, 20 Dec 2019 09:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 401F71654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576830367;
	bh=bmKfLF4d0nXfO09SaxtuL4h2uHv10hNzevBgi5jsDbc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOkf/6HnktVvqLoLoAoLxXR112KWx3rryw8h1Ch/iCvT90kr8J6PS9qgvZYcYSK6M
	 mYkUjgVRMDMQe+ChU10kol90BSyreVWBU5UjwblDWTY40dnuc0zJ0FlDPbn+Q78UuE
	 aWaFcLE/1FMJ7s4xfsx9SwBmBixh2Rw6OK1s9p5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48EEF8015A;
	Fri, 20 Dec 2019 09:24:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8BF0F8015A; Fri, 20 Dec 2019 09:24:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by alsa1.perex.cz (Postfix) with ESMTP id 35AADF8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 09:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35AADF8014C
Received: from [172.18.79.212] (unknown [46.183.103.17])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 0C27D2829C2;
 Fri, 20 Dec 2019 08:17:44 +0000 (UTC)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
 <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
 <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
 <ff0e2420-a2c6-17e7-2761-f6544e2c0cb7@linux.intel.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <fedbdec3-1c44-a72f-3810-30bc7f672601@zonque.org>
Date: Fri, 20 Dec 2019 09:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ff0e2420-a2c6-17e7-2761-f6544e2c0cb7@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, lars@metafoo.de, pascal.huerst@gmail.com
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
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

SGkgUGllcnJlLAoKW3JlZHVjaW5nIHRoZSByZWNpcGllbnQgbGlzdCBBTFNBIHBlb3BsZV0KCk9u
IDEyLzE4LzE5IDQ6MzIgUE0sIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+IE9uIDEyLzE4
LzE5IDM6NDkgQU0sIERhbmllbCBNYWNrIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMTIvMTcvMTkg
ODoyOCBQTSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+PiBPbiAxMi85LzE5IDEyOjM1
IFBNLCBEYW5pZWwgTWFjayB3cm90ZToKPj4KPj4+PiArwqDCoMKgIGlmICghYWQyNDJ4X25vZGVf
aXNfbWFzdGVyKHByaXYtPm5vZGUpICYmCj4+Pj4gK8KgwqDCoMKgwqDCoCAoKGZvcm1hdCAmIFNO
RF9TT0NfREFJRk1UX01BU1RFUl9NQVNLKSAhPQo+Pj4+IFNORF9TT0NfREFJRk1UX0NCTV9DRk0p
KSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoY29tcG9uZW50LT5kZXYsICJzbGF2ZSBu
b2RlIG11c3QgYmUgY2xvY2sgbWFzdGVyXG4iKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4+Pj4gK8KgwqDCoCB9Cj4+Pgo+Pj4gSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcg
dGhhdCB0aGUgbWFzdGVyIG5vZGUgcHJvdmlkZXMgdGhlIGNsb2NrIHRvIHRoZQo+Pj4gYnVzLCBz
byBub3Qgc3VyZSBob3cgaXQgY291bGQgYmUgYSBjbG9jayBzbGF2ZSwgYW5kIGNvbnZlcnNlbHkg
aG93IGEKPj4+IHNsYXZlIG5vZGUgY291bGQgcHJvdmlkZSBhIGNsb2NrIHRvIHRoZSBidXM/Cj4+
Cj4+IFRoZSBzbGF2ZSBub2RlcyByZWNlaXZlIHRoZSBBMkIgY2xvY2sgZnJvbSB0aGUgbWFzdGVy
IG5vZGUgYW5kIHRoZW4KPj4gcHJvZHVjZSBkaWdpdGFsIGF1ZGlvIG91dHB1dCB0aGF0IGlzIHNl
bnQgdG8gb3RoZXIgY29tcG9uZW50cyBzdWNoIGFzCj4+IGNvZGVjcy4gSGVuY2UsIGluIEFTb0Mg
dGVybXMsIHRoZXkgYXJlIHRoZSBjbG9jayBtYXN0ZXIuCj4+Cj4+IExpa2V3aXNlLCBhcyB0aGUg
bWFzdGVyIG5vZGUgaXMgcmVjZWl2aW5nIGl0cyBjbG9jayBmcm9tIG90aGVyCj4+IGNvbXBvbmVu
dHMsIGl0IGhhcyB0byBiZSBhIGNsb2NrIHNsYXZlIGluIHRoZSBhdWRpbyBuZXR3b3JrLgo+Pgo+
PiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KPiAKPiBZb3VyIHNsYXZlIG5vZGUgYWN0cyBhcyBhIGJy
aWRnZSB0aGVuLCBidXQgaXQgc2VlbXMgeW91IGRvbid0IG1vZGVsIHRoZQo+IGJ1cy1mYWNpbmcg
aW50ZXJmYWNlLCB3aGljaCBoYXMgdG8gZm9sbG93IHRoZSBtYXN0ZXIgY2xvY2suIE9yIGRvIHlv
dT8KClllcywgdGhlIGRyaXZlciBjdXJyZW50bHkgb25seSBtb2RlbHMgdGhlIFNPQy1mYWNpbmcg
c2lkZSwgYW5kIHRoYXQKZm9sbG93cyB0aGUgJ3JldmVyc2UnIGNsb2NraW5nIHNjaGVtZToKCiog
VGhlIG1hc3RlciBub2RlIGFsd2F5cyByZWNlaXZlcyB0aGUgY2xvY2sgb24gdGhlIFNPQy1mYWNp
bmcgc2lkZSwgYW5kCnByb2R1Y2VzIHRoZSBjbG9jayBvbiB0aGUgYnVzLWZhY2luZyBzaWRlLgoq
IFRoZSBzbGF2ZSBub2RlIGFsd2F5cyByZWNlaXZlcyB0aGUgY2xvY2sgb24gdGhlIGJ1cy1mYWNp
bmcgc2lkZSwgYW5kCnByb2R1Y2VzIHRoZSBjbG9jayBvbiB0aGUgU09DLWZhY2luZyBzaWRlLgoK
SSBjdXJyZW50bHkgZG9uJ3Qgc2VlIGEgcmVhc29uIGZvciBtb2RlbGxpbmcgdGhlIGJ1cy1mYWNp
bmcgc2lkZSBpbiB0aGUKQVNvQyB0b3BvbG9neSBhdCBhbGwsIGJ1dCBvZiBjb3Vyc2UgdGhhdCBj
b3VsZCBiZSBhZGRlZC4KCkJ1dCBmb3IgdGhlIFNPQy1mYWNpbmcgc2lkZSBvbiAqc2xhdmUqIG5v
ZGVzLCB0aGUgY3VycmVudGx5IGltcGxlbWVudGVkCmxvZ2ljIHNob3VsZCBiZSBjb3JyZWN0LCBu
bz8gRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGFkZCB0aGUKYnVzLXNpZGUgYXMgd2Vs
bD8KCj4gTGlrZXdpc2UgdGhlIG1hc3RlciBoYXMgYW4gJ1NPQy1mYWNpbmcnIGludGVyZmFjZSBh
bmQgYSBidXMtZmFjaW5nCj4gaW50ZXJmYWNlLiBpdCAqY291bGQqIGJlIG1hc3RlciBvbiBib3Ro
IGlmIEFTUkMgd2FzIHN1cHBvcnRlZC4gVGhlIHBvaW50Cj4gaXMgdGhhdCB0aGUgYnVzLWZhY2lu
ZyBpbnRlcmZhY2UgaXMgbm90IGNsb2NrIHNsYXZlLgoKVGhhdCdzIHJpZ2h0LCBJIG5lZWQgdG8g
bG9vayBpbnRvIHRoZSBtb2RlcyBmb3IgdGhlIG1hc3RlciBub2RlIGFnYWluLgpNYXliZSB0aGUg
Y2hlY2sgbmVlZHMgdG8gYmUgcmVsYXhlZCBvbiB0aGF0IGVuZC4KCgpUaGFua3MsCkRhbmllbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
