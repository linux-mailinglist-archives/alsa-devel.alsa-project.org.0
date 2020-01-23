Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75C14737B
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 23:01:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4011670;
	Thu, 23 Jan 2020 23:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4011670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579816882;
	bh=FfF9ERDarhUGPh07nBjzCiXEmSkQCqiPhnnnOUjxBqQ=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beCw4MDzLc5z+NJI1APCzVH32ZqplWaLU5HNhn/lED9cojASoEoBDHFoBhTt/om14
	 ZDrpUzHzyyhTvpG7EdwO95GkURwakTRmJamSbm0gipuOirmUZvHCjRy8upnxwRwF3v
	 vjkdFw92WSxELybcMelzEQjuBeKpI7Xny/VtH6No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD40FF801EC;
	Thu, 23 Jan 2020 22:59:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A591BF801D9; Thu, 23 Jan 2020 22:59:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=PRX_BODYSUB_1,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C11F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 22:59:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C11F800E7
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iukVU-0005du-1B; Thu, 23 Jan 2020 21:59:20 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
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
Organization: Codethink Limited.
Message-ID: <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
Date: Thu, 23 Jan 2020 21:59:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>
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

T24gMjMvMDEvMjAyMCAxOTozOCwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDA3LzAxLzIwMjAgMDE6
MzksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDYuMDEuMjAyMCAyMjowMCwgQmVuIERvb2tz
INC/0LjRiNC10YI6Cj4+PiBPbiAwNS8wMS8yMDIwIDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+
Pj4KPj4+Pgo+Pj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToK
Pj4+Pj4gMDUuMDEuMjAyMCAwMzowNCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+PiBbc25p
cF0KPj4+Pj4+Cj4+Pj4+PiBJJ3ZlIGp1c3QgZ29uZSB0aHJvdWdoIHRlc3RpbmcuCj4+Pj4+Pgo+
Pj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRzIHdvcmsuCj4+
Pj4+Pgo+Pj4+Pj4gVGhlIDI0IGJpdCBjYXNlIHNlZW1zIHRvIGJlIHdlaXJkLCBpdCBsb29rcyBs
aWtlIHRoZSAyNC1iaXQgZXhwZWN0cwo+Pj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4gMzIgYml0IHdv
cmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4+PiBkbyAyNCBiaXQg
aW4gMjQgYml0LCBzbyB3ZSBtYXkgaGF2ZSB0byByZW1vdmUgMjQgYml0IHNhbXBsZSBzdXBwb3J0
Cj4+Pj4+PiAod2hpY2ggaXMgYSBzaGFtZSkKPj4+Pj4+Cj4+Pj4+PiBNeSBwcmVmZXJlbmNlIGlz
IHRvIHJlbW92ZSB0aGUgMjQtYml0IHN1cHBvcnQgYW5kIGtlZXAgdGhlIDMyIGJpdCBpbi4KPj4+
Pj4+Cj4+Pj4+Cj4+Pj4+IEludGVyZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZp
cm0gdGhhdCAyNGJpdCBmb3JtYXQgaXNuJ3QKPj4+Pj4gdXNhYmxlIG9uIFQzMD8KPj4+Pgo+Pj4+
IElmIHRoZXJlIGlzIGFuIG9wdGlvbiBvZiAyNCBwYWNrZWQgaW50byAzMiwgdGhlbiBJIHRoaW5r
IHRoYXQgd291bGQgCj4+Pj4gd29yay4KPj4+Pgo+Pj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQg
d2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCj4+Pgo+Pj4gSSBuZWVkIHRvIGNoZWNrIHNvbWUgdGhp
bmdzLCBJIGFzc3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBpdCBsb29rcwo+Pj4gbGlrZSB0
aGUgZGVmYXVsdCBpcyAyNCBpbiAzMiBiaXRzIHNvIHdlIG1heSBiZSBvay4gSG93ZXZlciBJIG5l
ZWQgdG8KPj4+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJp
dHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4+Pgo+Pj4gSSdsbCBmb2xsb3cgdXAgbGF0ZXIsCj4+
Cj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4g
bXkgY2FzZS4gSSBicmllZmx5Cj4+IGxvb2tlZCB0aHJvdWdoIHRoZSBUUk0gZG9jIGFuZCBnb3Qg
aW1wcmVzc2lvbiB0aGF0IEFIVUIgY291bGQgcmUtcGFjawo+PiBkYXRhIHN0cmVhbSBpbnRvIHNv
bWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQgbWF5YmUgaXQncyBhIHdyb25nCj4+IGlt
cHJlc3Npb24uCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IAo+IEkgZGlk
IGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmb2xsb3dpbmc6Cj4gCj4gIMKgc294IC1uIC1iIDE2IC1j
IDIgLXIgNDQxMDAgL3RtcC90bXAud2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAuNQo+ICDCoHNv
eCAtbiAtYiAyNCAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNpbmUgNTAwIHZv
bCAwLjUKPiAgwqBzb3ggLW4gLWIgMzIgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50
aCBzaW5lIDUwMCB2b2wgMC41Cj4gCj4gVGhlIDE2IGFuZCAzMiB3b3JrIGZpbmUsIHRoZSAyNCBp
cyBzaG93aW5nIGEgcGxheWJhY2sgb3V0cHV0IGZyZXEKPiBvZiA0NDBIeiBpbnN0ZWFkIG9mIDUw
MEh6Li4uIHRoaXMgc3VnZ2VzdHMgdGhlIGNsb2NrIGlzIG9mZiwgb3IgdGhlcmUKPiBpcyBzb21l
dGhpbmcgZWxzZSB3ZWlyZCBnb2luZyBvbi4uLgo+IAoKSSBzaG91bGQgaGF2ZSBjaGVja2VkIHBs
bF9hX291dDAgcmF0ZSwgZm9yIDI0Yml0IDJjaCwgSSBnZXQKcGxsX2Ffb3V0IGF0IHdoaWNoIG1h
a2VzOgoKMTEyODk2MDAvKDI0KjIqNDQxMDApID0gNS4zMzMzMzMzMzMzCgpGb3Igc29tZSByZWFz
b24gdGhlIFBMTCBjYW4ndCBnZXQgYSBkZWNlbnQgZGl2aXNvciBmb3IgdGhpcy4KCi0tIApCZW4g
RG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlD
b2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsv
cHJpdmFjeS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
