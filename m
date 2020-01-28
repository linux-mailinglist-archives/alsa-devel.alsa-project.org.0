Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD7A14B13F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 10:01:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA56815F2;
	Tue, 28 Jan 2020 10:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA56815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580202073;
	bh=Ftt46ZAVxaoHEgd9ft6xLUjfq3uaiYE93jGmt3E6zXs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHv+AkYkyi0/EOFrMk6FH+Zr2MJ0eR17sVs2oRw4Vs5UnBQ5pEvx5I5jZ1lfmK4/K
	 bn+MN/lG/E6ji9TnRrv+4fA3keMgukEcozcBbgp6+Je84CXLdhEzWmmebRESCnKwa8
	 5TuKOtE4Z19FrL0Tpb/fECNKXwaNrUGWcGyJwTUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BB66F80228;
	Tue, 28 Jan 2020 09:59:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 793D9F801F8; Tue, 28 Jan 2020 09:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.2 required=5.0 tests=PRX_BODYSUB_1,PRX_BODY_30,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D41F6F80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:59:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D41F6F80123
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iwMiG-00013M-Ef; Tue, 28 Jan 2020 08:59:12 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
Date: Tue, 28 Jan 2020 08:59:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1aa6a4bf-10ea-001d-2d35-44494d9554f8@gmail.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

T24gMjcvMDEvMjAyMCAxOToyMywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI3LjAxLjIwMjAg
MjI6MjAsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+PiAyNC4wMS4yMDIwIDE5OjUwLCBK
b24gSHVudGVyINC/0LjRiNC10YI6Cj4+Pgo+Pj4gT24gMjMvMDEvMjAyMCAxOTozOCwgQmVuIERv
b2tzIHdyb3RlOgo+Pj4+IE9uIDA3LzAxLzIwMjAgMDE6MzksIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4+Pj4gMDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+PiBP
biAwNS8wMS8yMDIwIDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+
Pj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4g
MDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+PiBbc25pcF0K
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3RpbmcuCj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRz
IHdvcmsuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdl
aXJkLCBpdCBsb29rcyBsaWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+Pj4+Pj4gMjQgYml0IHNh
bXBsZXMgaW4gMzIgYml0IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRv
Cj4+Pj4+Pj4+PiBkbyAyNCBiaXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUg
MjQgYml0IHNhbXBsZSBzdXBwb3J0Cj4+Pj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+
Pj4+Cj4+Pj4+Pj4+PiBNeSBwcmVmZXJlbmNlIGlzIHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBv
cnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBpbi4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IElu
dGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCAyNGJpdCBmb3Jt
YXQgaXNuJ3QKPj4+Pj4+Pj4gdXNhYmxlIG9uIFQzMD8KPj4+Pj4+Pgo+Pj4+Pj4+IElmIHRoZXJl
IGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50byAzMiwgdGhlbiBJIHRoaW5rIHRoYXQgd291
bGQKPj4+Pj4+PiB3b3JrLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBjYW4gdHJ5IHRlc3RpbmcgdGhhdCB3
aXRoIHJhdyBkYXRhIG9uIE1vbmRheS4KPj4+Pj4+Cj4+Pj4+PiBJIG5lZWQgdG8gY2hlY2sgc29t
ZSB0aGluZ3MsIEkgYXNzdW1lZCAyNCB3YXMgMjQgcGFja2VkIGJpdHMsIGl0IGxvb2tzCj4+Pj4+
PiBsaWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJpdHMgc28gd2UgbWF5IGJlIG9rLiBIb3dl
dmVyIEkgbmVlZCB0bwo+Pj4+Pj4gcmUtd3JpdGUgbXkgdGVzdCBjYXNlIHdoaWNoIGFzc3VtZWQg
aXQgd2FzIDI0Yml0cyBpbiAzIGJ5dGVzIChTMjRfM0xFKS4KPj4+Pj4+Cj4+Pj4+PiBJJ2xsIGZv
bGxvdyB1cCBsYXRlciwKPj4+Pj4KPj4+Pj4gT2theSwgdGhlIFMyNF8zTEUgaXNuJ3Qgc3VwcG9y
dGVkIGJ5IFJUNTY0MCBjb2RlYyBpbiBteSBjYXNlLiBJIGJyaWVmbHkKPj4+Pj4gbG9va2VkIHRo
cm91Z2ggdGhlIFRSTSBkb2MgYW5kIGdvdCBpbXByZXNzaW9uIHRoYXQgQUhVQiBjb3VsZCByZS1w
YWNrCj4+Pj4+IGRhdGEgc3RyZWFtIGludG8gc29tZXRoaW5nIHRoYXQgY29kZWMgc3VwcG9ydHMs
IGJ1dCBtYXliZSBpdCdzIGEgd3JvbmcKPj4+Pj4gaW1wcmVzc2lvbi4KPj4+Pj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4KPj4+PiBJIGRpZCBhIHF1aWNrIHRlc3Qgd2l0
aCB0aGUgZm9sbG93aW5nOgo+Pj4+Cj4+Pj4gIMKgc294IC1uIC1iIDE2IC1jIDIgLXIgNDQxMDAg
L3RtcC90bXAud2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAuNQo+Pj4+ICDCoHNveCAtbiAtYiAy
NCAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4+
PiAgwqBzb3ggLW4gLWIgMzIgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5l
IDUwMCB2b2wgMC41Cj4+Pj4KPj4+PiBUaGUgMTYgYW5kIDMyIHdvcmsgZmluZSwgdGhlIDI0IGlz
IHNob3dpbmcgYSBwbGF5YmFjayBvdXRwdXQgZnJlcQo+Pj4+IG9mIDQ0MEh6IGluc3RlYWQgb2Yg
NTAwSHouLi4gdGhpcyBzdWdnZXN0cyB0aGUgY2xvY2sgaXMgb2ZmLCBvciB0aGVyZQo+Pj4+IGlz
IHNvbWV0aGluZyBlbHNlIHdlaXJkIGdvaW5nIG9uLi4uCj4+Pgo+Pj4gSSB3YXMgbG9va2luZyBh
dCB1c2luZyBzb3ggdG8gY3JlYXRlIHN1Y2ggYXMgZmlsZSwgYnV0IHRoZSBhYm92ZSBjb21tYW5k
Cj4+PiBnZW5lcmF0ZXMgYSBTMjRfM0xFIGZpbGUgYW5kIG5vdCBTMjRfTEUgZmlsZS4gVGhlIGNv
ZGVjIG9uIEpldHNvbi1USzEKPj4+IHN1cHBvcnRzIFMyNF9MRSBidXQgZG9lcyBub3Qgc3VwcG9y
dCBTMjRfM0xFIGFuZCBzbyBJIGNhbm5vdCB0ZXN0IHRoaXMuCj4+PiBBbnl3YXksIHdlIHJlYWxs
eSBuZWVkIHRvIHRlc3QgUzI0X0xFIGFuZCBub3QgUzI0XzNMRSBiZWNhdXNlIHRoaXMgaXMKPj4+
IHRoZSBwcm9ibGVtIHRoYXQgRG1pdHJ5IGlzIGhhdmluZy4KPj4+Cj4+PiBCZW4gaXMgUzI0XzNM
RSB3aGF0IHlvdSByZWFsbHkgbmVlZCB0byBzdXBwb3J0Pwo+Pj4KPj4+IERtaXRyeSwgZG9lcyB0
aGUgZm9sbG93aW5nIGZpeCB5b3VyIHByb2JsZW0/Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMK
Pj4+IGluZGV4IGRiZWQzYzU0MDhlNy4uOTI4NDVjNGI2M2Y0IDEwMDY0NAo+Pj4gLS0tIGEvc291
bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdy
YTMwX2kycy5jCj4+PiBAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNf
aHdfcGFyYW1zKHN0cnVjdAo+Pj4gc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKPj4+ICAg
ICAgICAgICAgICAgICAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+
ICAgICAgICAgICAgICAgICAgc2FtcGxlX3NpemUgPSAxNjsKPj4+ICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4+PiAtICAgICAgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6Cj4+PiArICAg
ICAgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfM0xFOgo+Pj4gICAgICAgICAgICAgICAgICB2
YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzI0Owo+Pj4gICAgICAgICAgICAgICAgICBh
dWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzI0Owo+Pj4gICAgICAgICAgICAgICAg
ICBzYW1wbGVfc2l6ZSA9IDI0Owo+Pj4gQEAgLTMxOCw3ICszMTgsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+Pj4gdGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0g
ewo+Pj4gICAgICAgICAgICAgICAgICAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+ICAgICAgICAgICAg
ICAgICAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+ICAgICAgICAgICAg
ICAgICAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUgfAo+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4gICAgICAgICAg
fSwKPj4+ICAgICAgICAgIC5jYXB0dXJlID0gewo+Pj4gQEAgLTMyNyw3ICszMjcsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+Pj4gdGVncmEzMF9pMnNfZGFpX3Rl
bXBsYXRlID0gewo+Pj4gICAgICAgICAgICAgICAgICAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+ICAg
ICAgICAgICAgICAgICAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKPj4+ICAg
ICAgICAgICAgICAgICAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF8zTEUgfAo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4g
ICAgICAgICAgfSwKPj4+ICAgICAgICAgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+
Cj4+PiBKb24KPj4+Cj4+Cj4+IEl0IHNob3VsZCBzb2x2ZSB0aGUgcHJvYmxlbSBpbiBteSBwYXJ0
aWN1bGFyIGNhc2UsIGJ1dCBJJ20gbm90IHN1cmUgdGhhdAo+PiB0aGUgc29sdXRpb24gaXMgY29y
cmVjdC4KPj4KPj4gVGhlIHY1LjUga2VybmVsIGlzIHJlbGVhc2VkIG5vdyB3aXRoIHRoZSBicm9r
ZW4gYXVkaW8gYW5kIGFwcGFyZW50bHkKPj4gZ2V0dGluZyAyNGJpdCB0byB3b3JrIHdvbid0IGJl
IHRyaXZpYWwgKGlmIHBvc3NpYmxlIGF0IGFsbCkuIEJlbiwgY291bGQKPj4geW91IHBsZWFzZSBz
ZW5kIGEgcGF0Y2ggdG8gZml4IHY1LjUgYnkgcmVtb3ZpbmcgdGhlIFMyNCBzdXBwb3J0Cj4+IGFk
dmVydGlzZW1lbnQgZnJvbSB0aGUgZHJpdmVyPwo+IAo+IEkgYWxzbyBzdXNwZWN0IHRoYXQgczMy
IG1heSBuZWVkIHNvbWUgZXh0cmEgcGF0Y2hlcyBhbmQgdGh1cyBjb3VsZCBiZQo+IHdvcnRod2hp
bGUgdG8gc3RvcCBhZHZlcnRpc2luZyBpdCBhcyB3ZWxsLgoKQXMgZmFyIGFzIEkgYW0gYXdhcmUg
dGhhdCB3b3JrcyBhbmQgd2UgY2FuIGhpdCB0aGUgYXVkaW8gcmF0ZXMgZm9yIGl0LgoKCi0tIApC
ZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJ
CQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28u
dWsvcHJpdmFjeS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
