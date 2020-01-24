Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17603148CBE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 18:08:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E841678;
	Fri, 24 Jan 2020 18:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E841678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579885691;
	bh=hzPMIUDNwcnijeDw0EsJBdZWVkBrrM70Ex0C6dhThqk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTWhAivrEYRMQbCKNLP6PW3hO6ilWNcd/PrhKpk5s2K3YK/JFQ4GjsaHboWpJAZjh
	 Aoi1o1kQkbc+QDxmc4NqsJvaWw54L6hAyYNC2kPM6dXb6xNSIq2Cnzpr+EgFZxFPwN
	 HLj8RO6+AN+ukR3rU+oC/CM/gmJuCxpHjQGCPR2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B3FF800F5;
	Fri, 24 Jan 2020 18:06:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3066CF8020C; Fri, 24 Jan 2020 18:06:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=PRX_BODYSUB_1,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2004CF800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 18:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2004CF800F5
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iv2PR-0005gi-J3; Fri, 24 Jan 2020 17:06:17 +0000
To: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
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
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <fc919f80-46c0-78ef-15a3-ac287ba8ff2e@codethink.co.uk>
Date: Fri, 24 Jan 2020 17:06:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
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

T24gMjQvMDEvMjAyMCAxNjo1MCwgSm9uIEh1bnRlciB3cm90ZToKPiAKPiBPbiAyMy8wMS8yMDIw
IDE5OjM4LCBCZW4gRG9va3Mgd3JvdGU6Cj4+IE9uIDA3LzAxLzIwMjAgMDE6MzksIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPj4+IDA2LjAxLjIwMjAgMjI6MDAsIEJlbiBEb29rcyDQv9C40YjQtdGC
Ogo+Pj4+IE9uIDA1LzAxLzIwMjAgMTA6NTMsIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4KPj4+Pj4K
Pj4+Pj4gT24gMjAyMC0wMS0wNSAwMTo0OCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4g
MDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4gW3NuaXBdCj4+
Pj4+Pj4KPj4+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3RpbmcuCj4+Pj4+Pj4KPj4+
Pj4+PiBTb21lIHNpbXBsZSBkYXRhIHRlc3RzIHNob3cgMTYgYW5kIDMyLWJpdHMgd29yay4KPj4+
Pj4+Pgo+Pj4+Pj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwgaXQgbG9va3Mg
bGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+Pj4+PiAyNCBiaXQgc2FtcGxlcyBpbiAzMiBiaXQg
d29yZHMuIEkgY2FuJ3Qgc2VlIGFueSBwYWNraW5nIG9wdGlvbnMgdG8KPj4+Pj4+PiBkbyAyNCBi
aXQgaW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBzdXBw
b3J0Cj4+Pj4+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pj4+Pj4KPj4+Pj4+PiBNeSBwcmVmZXJl
bmNlIGlzIHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBp
bi4KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxl
YXNlIGNvbmZpcm0gdGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QKPj4+Pj4+IHVzYWJsZSBvbiBUMzA/
Cj4+Pj4+Cj4+Pj4+IElmIHRoZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50byAzMiwg
dGhlbiBJIHRoaW5rIHRoYXQgd291bGQKPj4+Pj4gd29yay4KPj4+Pj4KPj4+Pj4gSSBjYW4gdHJ5
IHRlc3RpbmcgdGhhdCB3aXRoIHJhdyBkYXRhIG9uIE1vbmRheS4KPj4+Pgo+Pj4+IEkgbmVlZCB0
byBjaGVjayBzb21lIHRoaW5ncywgSSBhc3N1bWVkIDI0IHdhcyAyNCBwYWNrZWQgYml0cywgaXQg
bG9va3MKPj4+PiBsaWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJpdHMgc28gd2UgbWF5IGJl
IG9rLiBIb3dldmVyIEkgbmVlZCB0bwo+Pj4+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3aGljaCBh
c3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4+Pj4KPj4+PiBJJ2xs
IGZvbGxvdyB1cCBsYXRlciwKPj4+Cj4+PiBPa2F5LCB0aGUgUzI0XzNMRSBpc24ndCBzdXBwb3J0
ZWQgYnkgUlQ1NjQwIGNvZGVjIGluIG15IGNhc2UuIEkgYnJpZWZseQo+Pj4gbG9va2VkIHRocm91
Z2ggdGhlIFRSTSBkb2MgYW5kIGdvdCBpbXByZXNzaW9uIHRoYXQgQUhVQiBjb3VsZCByZS1wYWNr
Cj4+PiBkYXRhIHN0cmVhbSBpbnRvIHNvbWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQg
bWF5YmUgaXQncyBhIHdyb25nCj4+PiBpbXByZXNzaW9uLgo+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+Cj4+IEkgZGlkIGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmb2xsb3dp
bmc6Cj4+Cj4+ICDCoHNveCAtbiAtYiAxNiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5
bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4gIMKgc294IC1uIC1iIDI0IC1jIDIgLXIgNDQxMDAgL3Rt
cC90bXAud2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAuNQo+PiAgwqBzb3ggLW4gLWIgMzIgLWMg
MiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41Cj4+Cj4+IFRo
ZSAxNiBhbmQgMzIgd29yayBmaW5lLCB0aGUgMjQgaXMgc2hvd2luZyBhIHBsYXliYWNrIG91dHB1
dCBmcmVxCj4+IG9mIDQ0MEh6IGluc3RlYWQgb2YgNTAwSHouLi4gdGhpcyBzdWdnZXN0cyB0aGUg
Y2xvY2sgaXMgb2ZmLCBvciB0aGVyZQo+PiBpcyBzb21ldGhpbmcgZWxzZSB3ZWlyZCBnb2luZyBv
bi4uLgo+IAo+IEkgd2FzIGxvb2tpbmcgYXQgdXNpbmcgc294IHRvIGNyZWF0ZSBzdWNoIGFzIGZp
bGUsIGJ1dCB0aGUgYWJvdmUgY29tbWFuZAo+IGdlbmVyYXRlcyBhIFMyNF8zTEUgZmlsZSBhbmQg
bm90IFMyNF9MRSBmaWxlLiBUaGUgY29kZWMgb24gSmV0c29uLVRLMQo+IHN1cHBvcnRzIFMyNF9M
RSBidXQgZG9lcyBub3Qgc3VwcG9ydCBTMjRfM0xFIGFuZCBzbyBJIGNhbm5vdCB0ZXN0IHRoaXMu
Cj4gQW55d2F5LCB3ZSByZWFsbHkgbmVlZCB0byB0ZXN0IFMyNF9MRSBhbmQgbm90IFMyNF8zTEUg
YmVjYXVzZSB0aGlzIGlzCj4gdGhlIHByb2JsZW0gdGhhdCBEbWl0cnkgaXMgaGF2aW5nLgo+IAo+
IEJlbiBpcyBTMjRfM0xFIHdoYXQgeW91IHJlYWxseSBuZWVkIHRvIHN1cHBvcnQ/CgpJIHdhcyBm
YWlybHkgc3VyZSBpdCB3YXMgc2F5aW5nIFMyNCBmb3JtYXQsIHRoZSBhcGxheSBqdXN0IHByaW50
cwpTMjRfTEUgKGJ1dCBzZWVtcyB0byBoaWRlIHRoZSBpbXBsZW1lbnR0am9uKQoKCgotLSAKQmVu
IERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJ
Q29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVr
L3ByaXZhY3kuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
