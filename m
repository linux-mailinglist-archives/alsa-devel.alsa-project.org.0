Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4F14B13C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 10:00:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F41B165D;
	Tue, 28 Jan 2020 09:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F41B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580202030;
	bh=EQo82SD7JzsMigzWI7qnt5ryatHn+e8KPKMhpUlWbEM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVLQIEgcd7UItjs/RWi2gxvEh7oRxtcPMoxO10zYv3SxTGdS+prIot4BcASPVdZe4
	 lVdRJ7ksP87viOZGagYhok5lbExS1xIy7w7lZBeKWVYlVTDQoOyFwZGqWtnzF8RaBn
	 iGkvEVxXBGeMf9NDxBLpN02IqvxrRHYoklJpwxTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49636F80082;
	Tue, 28 Jan 2020 09:58:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1047F80150; Tue, 28 Jan 2020 09:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.2 required=5.0 tests=PRX_BODYSUB_1,PRX_BODY_30,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from imap3.hz.codethink.co.uk (imap3.hz.codethink.co.uk [176.9.8.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5766DF80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 09:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5766DF80082
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iwMhf-00011g-Ho; Tue, 28 Jan 2020 08:58:35 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <db8a46bd-bb53-831f-0041-e9e4ddb6a1ea@codethink.co.uk>
Date: Tue, 28 Jan 2020 08:58:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
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

T24gMjcvMDEvMjAyMCAxOToyMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI0LjAxLjIwMjAg
MTk6NTAsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4KPj4gT24gMjMvMDEvMjAyMCAxOTozOCwg
QmVuIERvb2tzIHdyb3RlOgo+Pj4gT24gMDcvMDEvMjAyMCAwMTozOSwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+Pj4+IDA2LjAxLjIwMjAgMjI6MDAsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+
PiBPbiAwNS8wMS8yMDIwIDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4KPj4+
Pj4+IE9uIDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+PiAw
NS4wMS4yMDIwIDAzOjA0LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4gW3NuaXBdCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IEkndmUganVzdCBnb25lIHRocm91Z2ggdGVzdGluZy4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRzIHdvcmsu
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwgaXQg
bG9va3MgbGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+Pj4+Pj4gMjQgYml0IHNhbXBsZXMgaW4g
MzIgYml0IHdvcmRzLiBJIGNhbid0IHNlZSBhbnkgcGFja2luZyBvcHRpb25zIHRvCj4+Pj4+Pj4+
IGRvIDI0IGJpdCBpbiAyNCBiaXQsIHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2Ft
cGxlIHN1cHBvcnQKPj4+Pj4+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IE15IHByZWZlcmVuY2UgaXMgdG8gcmVtb3ZlIHRoZSAyNC1iaXQgc3VwcG9ydCBhbmQga2VlcCB0
aGUgMzIgYml0IGluLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSW50ZXJlc3RpbmcuLiBKb24s
IGNvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IDI0Yml0IGZvcm1hdCBpc24ndAo+Pj4+Pj4+
IHVzYWJsZSBvbiBUMzA/Cj4+Pj4+Pgo+Pj4+Pj4gSWYgdGhlcmUgaXMgYW4gb3B0aW9uIG9mIDI0
IHBhY2tlZCBpbnRvIDMyLCB0aGVuIEkgdGhpbmsgdGhhdCB3b3VsZAo+Pj4+Pj4gd29yay4KPj4+
Pj4+Cj4+Pj4+PiBJIGNhbiB0cnkgdGVzdGluZyB0aGF0IHdpdGggcmF3IGRhdGEgb24gTW9uZGF5
Lgo+Pj4+Pgo+Pj4+PiBJIG5lZWQgdG8gY2hlY2sgc29tZSB0aGluZ3MsIEkgYXNzdW1lZCAyNCB3
YXMgMjQgcGFja2VkIGJpdHMsIGl0IGxvb2tzCj4+Pj4+IGxpa2UgdGhlIGRlZmF1bHQgaXMgMjQg
aW4gMzIgYml0cyBzbyB3ZSBtYXkgYmUgb2suIEhvd2V2ZXIgSSBuZWVkIHRvCj4+Pj4+IHJlLXdy
aXRlIG15IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcyAo
UzI0XzNMRSkuCj4+Pj4+Cj4+Pj4+IEknbGwgZm9sbG93IHVwIGxhdGVyLAo+Pj4+Cj4+Pj4gT2th
eSwgdGhlIFMyNF8zTEUgaXNuJ3Qgc3VwcG9ydGVkIGJ5IFJUNTY0MCBjb2RlYyBpbiBteSBjYXNl
LiBJIGJyaWVmbHkKPj4+PiBsb29rZWQgdGhyb3VnaCB0aGUgVFJNIGRvYyBhbmQgZ290IGltcHJl
c3Npb24gdGhhdCBBSFVCIGNvdWxkIHJlLXBhY2sKPj4+PiBkYXRhIHN0cmVhbSBpbnRvIHNvbWV0
aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQgbWF5YmUgaXQncyBhIHdyb25nCj4+Pj4gaW1w
cmVzc2lvbi4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Cj4+PiBJ
IGRpZCBhIHF1aWNrIHRlc3Qgd2l0aCB0aGUgZm9sbG93aW5nOgo+Pj4KPj4+ICDCoHNveCAtbiAt
YiAxNiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUK
Pj4+ICDCoHNveCAtbiAtYiAyNCAtYyAyIC1yIDQ0MTAwIC90bXAvdG1wLndhdsKgIHN5bnRoIHNp
bmUgNTAwIHZvbCAwLjUKPj4+ICDCoHNveCAtbiAtYiAzMiAtYyAyIC1yIDQ0MTAwIC90bXAvdG1w
LndhdsKgIHN5bnRoIHNpbmUgNTAwIHZvbCAwLjUKPj4+Cj4+PiBUaGUgMTYgYW5kIDMyIHdvcmsg
ZmluZSwgdGhlIDI0IGlzIHNob3dpbmcgYSBwbGF5YmFjayBvdXRwdXQgZnJlcQo+Pj4gb2YgNDQw
SHogaW5zdGVhZCBvZiA1MDBIei4uLiB0aGlzIHN1Z2dlc3RzIHRoZSBjbG9jayBpcyBvZmYsIG9y
IHRoZXJlCj4+PiBpcyBzb21ldGhpbmcgZWxzZSB3ZWlyZCBnb2luZyBvbi4uLgo+Pgo+PiBJIHdh
cyBsb29raW5nIGF0IHVzaW5nIHNveCB0byBjcmVhdGUgc3VjaCBhcyBmaWxlLCBidXQgdGhlIGFi
b3ZlIGNvbW1hbmQKPj4gZ2VuZXJhdGVzIGEgUzI0XzNMRSBmaWxlIGFuZCBub3QgUzI0X0xFIGZp
bGUuIFRoZSBjb2RlYyBvbiBKZXRzb24tVEsxCj4+IHN1cHBvcnRzIFMyNF9MRSBidXQgZG9lcyBu
b3Qgc3VwcG9ydCBTMjRfM0xFIGFuZCBzbyBJIGNhbm5vdCB0ZXN0IHRoaXMuCj4+IEFueXdheSwg
d2UgcmVhbGx5IG5lZWQgdG8gdGVzdCBTMjRfTEUgYW5kIG5vdCBTMjRfM0xFIGJlY2F1c2UgdGhp
cyBpcwo+PiB0aGUgcHJvYmxlbSB0aGF0IERtaXRyeSBpcyBoYXZpbmcuCj4+Cj4+IEJlbiBpcyBT
MjRfM0xFIHdoYXQgeW91IHJlYWxseSBuZWVkIHRvIHN1cHBvcnQ/Cj4+Cj4+IERtaXRyeSwgZG9l
cyB0aGUgZm9sbG93aW5nIGZpeCB5b3VyIHByb2JsZW0/Cj4+Cj4+IGRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5j
Cj4+IGluZGV4IGRiZWQzYzU0MDhlNy4uOTI4NDVjNGI2M2Y0IDEwMDY0NAo+PiAtLS0gYS9zb3Vu
ZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+PiArKysgYi9zb3VuZC9zb2MvdGVncmEvdGVncmEz
MF9pMnMuYwo+PiBAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdf
cGFyYW1zKHN0cnVjdAo+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiAgICAgICAg
ICAgICAgICAgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+ICAgICAg
ICAgICAgICAgICAgc2FtcGxlX3NpemUgPSAxNjsKPj4gICAgICAgICAgICAgICAgICBicmVhazsK
Pj4gLSAgICAgICBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzI0X0xFOgo+PiArICAgICAgIGNhc2Ug
U05EUlZfUENNX0ZPUk1BVF9TMjRfM0xFOgo+PiAgICAgICAgICAgICAgICAgIHZhbCA9IFRFR1JB
MzBfSTJTX0NUUkxfQklUX1NJWkVfMjQ7Cj4+ICAgICAgICAgICAgICAgICAgYXVkaW9fYml0cyA9
IFRFR1JBMzBfQVVESU9DSUZfQklUU18yNDsKPj4gICAgICAgICAgICAgICAgICBzYW1wbGVfc2l6
ZSA9IDI0Owo+PiBAQCAtMzE4LDcgKzMxOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3Nv
Y19kYWlfZHJpdmVyCj4+IHRlZ3JhMzBfaTJzX2RhaV90ZW1wbGF0ZSA9IHsKPj4gICAgICAgICAg
ICAgICAgICAuY2hhbm5lbHNfbWF4ID0gMiwKPj4gICAgICAgICAgICAgICAgICAucmF0ZXMgPSBT
TkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+PiAgICAgICAgICAgICAgICAgIC5mb3JtYXRzID0g
U05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICBT
TkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFNO
RFJWX1BDTV9GTVRCSVRfUzI0XzNMRSB8Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
TkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4gICAgICAgICAgfSwKPj4gICAgICAgICAgLmNhcHR1
cmUgPSB7Cj4+IEBAIC0zMjcsNyArMzI3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29j
X2RhaV9kcml2ZXIKPj4gdGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+PiAgICAgICAgICAg
ICAgICAgIC5jaGFubmVsc19tYXggPSAyLAo+PiAgICAgICAgICAgICAgICAgIC5yYXRlcyA9IFNO
RFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+ICAgICAgICAgICAgICAgICAgLmZvcm1hdHMgPSBT
TkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIFNO
RFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgU05E
UlZfUENNX0ZNVEJJVF9TMjRfM0xFIHwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNO
RFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+PiAgICAgICAgICB9LAo+PiAgICAgICAgICAub3BzID0g
JnRlZ3JhMzBfaTJzX2RhaV9vcHMsCj4+Cj4+IEpvbgo+Pgo+IAo+IEl0IHNob3VsZCBzb2x2ZSB0
aGUgcHJvYmxlbSBpbiBteSBwYXJ0aWN1bGFyIGNhc2UsIGJ1dCBJJ20gbm90IHN1cmUgdGhhdAo+
IHRoZSBzb2x1dGlvbiBpcyBjb3JyZWN0Lgo+IAo+IFRoZSB2NS41IGtlcm5lbCBpcyByZWxlYXNl
ZCBub3cgd2l0aCB0aGUgYnJva2VuIGF1ZGlvIGFuZCBhcHBhcmVudGx5Cj4gZ2V0dGluZyAyNGJp
dCB0byB3b3JrIHdvbid0IGJlIHRyaXZpYWwgKGlmIHBvc3NpYmxlIGF0IGFsbCkuIEJlbiwgY291
bGQKPiB5b3UgcGxlYXNlIHNlbmQgYSBwYXRjaCB0byBmaXggdjUuNSBieSByZW1vdmluZyB0aGUg
UzI0IHN1cHBvcnQKPiBhZHZlcnRpc2VtZW50IGZyb20gdGhlIGRyaXZlcj8KClRoYXQgbWlnaHQg
YmUgdGhlIGJlc3QgZm9yIHRoZSBtb21lbnQuCgpBcyBmYXIgYXMgbXkgdGVzdGluZyBzbyBmYXIg
aXMgdGhhdCBqdXN0IHRoZSBhdWRpbyByYXRlIGlzIG9mZgouCkl0IG1pZ2h0IGJlIHdvcnRoIHB1
dHRpbmcgaXQgaW4gYXMgYSBjb25maWcgb3B0aW9uIG9yIHJ1biB0aW1lCmNvbW1hbmQgb3B0aW9u
PwoKCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBF
bmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2Rl
dGhpbmsuY28udWsvcHJpdmFjeS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
