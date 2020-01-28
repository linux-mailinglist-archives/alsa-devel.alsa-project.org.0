Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69914B4C5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 14:21:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DB21671;
	Tue, 28 Jan 2020 14:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DB21671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580217670;
	bh=6m1BYPsulgdu4hcGZRIOPso4BQsHzD+8OTa9ZZ6VrLk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OTrUwqWDz7d8z5oK5Rqe0v5m0To/nsbVhBOqPAp7E+6b2zYA9dKa19Wjzx2VhBeAG
	 B3X8a5DPfLqiKw9cf5d7G3/xhbJxPI4KBwMcMf1WmJZKEuE+4HIvtH1rAbXV0mptsM
	 wfF54dhP9T6DLJauG7M79PwouRWsH6RuLZmFSigA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDDEF801EB;
	Tue, 28 Jan 2020 14:19:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E71F80150; Tue, 28 Jan 2020 14:19:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_1,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9901F80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 14:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9901F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nCnVatdk"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3034c60000>; Tue, 28 Jan 2020 05:19:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 28 Jan 2020 05:19:21 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 28 Jan 2020 05:19:21 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 13:19:19 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
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
 <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d6bb92e2-16ba-3c00-2f07-e741ecaa5ec8@nvidia.com>
Date: Tue, 28 Jan 2020 13:19:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <62cea895-c1f1-a833-b63c-050642bb8a79@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580217542; bh=oUa9LdAI1ivbq2epdOkAem/h1zKCC704A2LLho61dW4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=nCnVatdk7g3uVV7FNoYGWpOPiP+WEY7EUGI06P6IHlSisHIvExCUmO47UIoGI70w5
 4QHtZzqSLHvEBx1FOTTt9TYkkoXRaVQyRD7asOOglQxJMpnJpc+F4yD9k4A0B7VHlE
 jgMgkjvKFVjwy4u3kBvdL/XQ3+8HXpTcR6julEkc7Lt38tp7CcHr6oeK4P2XmGfwg6
 sStOIJfKm1qXfGIxmR8Sqfkh2VlUE2RRHL7YQxkQsjNiQJ3vl/eW6rv5cRLj/meYrV
 bmysoOfPsFYyFo/W61asJCQz6qCB/4E6V9SKVpRUPRGa2reJ8L2WGAj3KQjBybG2W5
 +cXLameklneCQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDI4LzAxLzIwMjAgMDg6NTksIEJlbiBEb29rcyB3cm90ZToKPiBPbiAyNy8wMS8yMDIwIDE5
OjIzLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDI3LjAxLjIwMjAgMjI6MjAsIERtaXRyeSBP
c2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4gMjQuMDEuMjAyMCAxOTo1MCwgSm9uIEh1bnRlciDQv9C4
0YjQtdGCOgo+Pj4+Cj4+Pj4gT24gMjMvMDEvMjAyMCAxOTozOCwgQmVuIERvb2tzIHdyb3RlOgo+
Pj4+PiBPbiAwNy8wMS8yMDIwIDAxOjM5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4+PiAw
Ni4wMS4yMDIwIDIyOjAwLCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+PiBPbiAwNS8wMS8y
MDIwIDEwOjUzLCBCZW4gRG9va3Mgd3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9u
IDIwMjAtMDEtMDUgMDE6NDgsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4+IDA1LjAx
LjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+IFtzbmlwXQo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gU29tZSBzaW1wbGUgZGF0YSB0ZXN0cyBzaG93IDE2IGFuZCAzMi1iaXRz
IHdvcmsuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGUgMjQgYml0IGNhc2Ugc2VlbXMgdG8gYmUg
d2VpcmQsIGl0IGxvb2tzIGxpa2UgdGhlIDI0LWJpdAo+Pj4+Pj4+Pj4+IGV4cGVjdHMKPj4+Pj4+
Pj4+PiAyNCBiaXQgc2FtcGxlcyBpbiAzMiBiaXQgd29yZHMuIEkgY2FuJ3Qgc2VlIGFueSBwYWNr
aW5nCj4+Pj4+Pj4+Pj4gb3B0aW9ucyB0bwo+Pj4+Pj4+Pj4+IGRvIDI0IGJpdCBpbiAyNCBiaXQs
IHNvIHdlIG1heSBoYXZlIHRvIHJlbW92ZSAyNCBiaXQgc2FtcGxlCj4+Pj4+Pj4+Pj4gc3VwcG9y
dAo+Pj4+Pj4+Pj4+ICh3aGljaCBpcyBhIHNoYW1lKQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gTXkg
cHJlZmVyZW5jZSBpcyB0byByZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAz
Mgo+Pj4+Pj4+Pj4+IGJpdCBpbi4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEludGVy
ZXN0aW5nLi4gSm9uLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCAyNGJpdCBmb3JtYXQK
Pj4+Pj4+Pj4+IGlzbid0Cj4+Pj4+Pj4+PiB1c2FibGUgb24gVDMwPwo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBJZiB0aGVyZSBpcyBhbiBvcHRpb24gb2YgMjQgcGFja2VkIGludG8gMzIsIHRoZW4gSSB0aGlu
ayB0aGF0IHdvdWxkCj4+Pj4+Pj4+IHdvcmsuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgY2FuIHRyeSB0
ZXN0aW5nIHRoYXQgd2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCj4+Pj4+Pj4KPj4+Pj4+PiBJIG5l
ZWQgdG8gY2hlY2sgc29tZSB0aGluZ3MsIEkgYXNzdW1lZCAyNCB3YXMgMjQgcGFja2VkIGJpdHMs
IGl0Cj4+Pj4+Pj4gbG9va3MKPj4+Pj4+PiBsaWtlIHRoZSBkZWZhdWx0IGlzIDI0IGluIDMyIGJp
dHMgc28gd2UgbWF5IGJlIG9rLiBIb3dldmVyIEkgbmVlZCB0bwo+Pj4+Pj4+IHJlLXdyaXRlIG15
IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJpdHMgaW4gMyBieXRlcwo+Pj4+Pj4+
IChTMjRfM0xFKS4KPj4+Pj4+Pgo+Pj4+Pj4+IEknbGwgZm9sbG93IHVwIGxhdGVyLAo+Pj4+Pj4K
Pj4+Pj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMg
aW4gbXkgY2FzZS4gSQo+Pj4+Pj4gYnJpZWZseQo+Pj4+Pj4gbG9va2VkIHRocm91Z2ggdGhlIFRS
TSBkb2MgYW5kIGdvdCBpbXByZXNzaW9uIHRoYXQgQUhVQiBjb3VsZCByZS1wYWNrCj4+Pj4+PiBk
YXRhIHN0cmVhbSBpbnRvIHNvbWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQgbWF5YmUg
aXQncyBhCj4+Pj4+PiB3cm9uZwo+Pj4+Pj4gaW1wcmVzc2lvbi4KPj4+Pj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pgo+Pj4+PiBJIGRpZCBhIHF1aWNrIHRlc3Qgd2l0
aCB0aGUgZm9sbG93aW5nOgo+Pj4+Pgo+Pj4+PiDCoMKgc294IC1uIC1iIDE2IC1jIDIgLXIgNDQx
MDAgL3RtcC90bXAud2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAuNQo+Pj4+PiDCoMKgc294IC1u
IC1iIDI0IC1jIDIgLXIgNDQxMDAgL3RtcC90bXAud2F2wqAgc3ludGggc2luZSA1MDAgdm9sIDAu
NQo+Pj4+PiDCoMKgc294IC1uIC1iIDMyIC1jIDIgLXIgNDQxMDAgL3RtcC90bXAud2F2wqAgc3lu
dGggc2luZSA1MDAgdm9sIDAuNQo+Pj4+Pgo+Pj4+PiBUaGUgMTYgYW5kIDMyIHdvcmsgZmluZSwg
dGhlIDI0IGlzIHNob3dpbmcgYSBwbGF5YmFjayBvdXRwdXQgZnJlcQo+Pj4+PiBvZiA0NDBIeiBp
bnN0ZWFkIG9mIDUwMEh6Li4uIHRoaXMgc3VnZ2VzdHMgdGhlIGNsb2NrIGlzIG9mZiwgb3IgdGhl
cmUKPj4+Pj4gaXMgc29tZXRoaW5nIGVsc2Ugd2VpcmQgZ29pbmcgb24uLi4KPj4+Pgo+Pj4+IEkg
d2FzIGxvb2tpbmcgYXQgdXNpbmcgc294IHRvIGNyZWF0ZSBzdWNoIGFzIGZpbGUsIGJ1dCB0aGUg
YWJvdmUKPj4+PiBjb21tYW5kCj4+Pj4gZ2VuZXJhdGVzIGEgUzI0XzNMRSBmaWxlIGFuZCBub3Qg
UzI0X0xFIGZpbGUuIFRoZSBjb2RlYyBvbiBKZXRzb24tVEsxCj4+Pj4gc3VwcG9ydHMgUzI0X0xF
IGJ1dCBkb2VzIG5vdCBzdXBwb3J0IFMyNF8zTEUgYW5kIHNvIEkgY2Fubm90IHRlc3QgdGhpcy4K
Pj4+PiBBbnl3YXksIHdlIHJlYWxseSBuZWVkIHRvIHRlc3QgUzI0X0xFIGFuZCBub3QgUzI0XzNM
RSBiZWNhdXNlIHRoaXMgaXMKPj4+PiB0aGUgcHJvYmxlbSB0aGF0IERtaXRyeSBpcyBoYXZpbmcu
Cj4+Pj4KPj4+PiBCZW4gaXMgUzI0XzNMRSB3aGF0IHlvdSByZWFsbHkgbmVlZCB0byBzdXBwb3J0
Pwo+Pj4+Cj4+Pj4gRG1pdHJ5LCBkb2VzIHRoZSBmb2xsb3dpbmcgZml4IHlvdXIgcHJvYmxlbT8K
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+
IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+PiBpbmRleCBkYmVkM2M1NDA4ZTcu
LjkyODQ1YzRiNjNmNCAxMDA2NDQKPj4+PiAtLS0gYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9p
MnMuYwo+Pj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4gQEAgLTE0
MCw3ICsxNDAsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+
PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAxNjsKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+PiAtwqDCoMKgwqDCoMKg
IGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6Cj4+Pj4gK8KgwqDCoMKgwqDCoCBjYXNlIFNO
RFJWX1BDTV9GT1JNQVRfUzI0XzNMRToKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzI0Owo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNf
MjQ7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAy
NDsKPj4+PiBAQCAtMzE4LDcgKzMxOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19k
YWlfZHJpdmVyCj4+Pj4gdGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19tYXggPSAyLAo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYw
MDAsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRS
Vl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENN
X0ZNVEJJVF9TMjRfM0xFIHwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoCB9LAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLmNhcHR1cmUgPSB7Cj4+Pj4gQEAg
LTMyNyw3ICszMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+
Pj4+IHRlZ3JhMzBfaTJzX2RhaV90ZW1wbGF0ZSA9IHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJ
VF9TMzJfTEUgfAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0
XzNMRSB8Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
fSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+
Pgo+Pj4+IEpvbgo+Pj4+Cj4+Pgo+Pj4gSXQgc2hvdWxkIHNvbHZlIHRoZSBwcm9ibGVtIGluIG15
IHBhcnRpY3VsYXIgY2FzZSwgYnV0IEknbSBub3Qgc3VyZSB0aGF0Cj4+PiB0aGUgc29sdXRpb24g
aXMgY29ycmVjdC4KPj4+Cj4+PiBUaGUgdjUuNSBrZXJuZWwgaXMgcmVsZWFzZWQgbm93IHdpdGgg
dGhlIGJyb2tlbiBhdWRpbyBhbmQgYXBwYXJlbnRseQo+Pj4gZ2V0dGluZyAyNGJpdCB0byB3b3Jr
IHdvbid0IGJlIHRyaXZpYWwgKGlmIHBvc3NpYmxlIGF0IGFsbCkuIEJlbiwgY291bGQKPj4+IHlv
dSBwbGVhc2Ugc2VuZCBhIHBhdGNoIHRvIGZpeCB2NS41IGJ5IHJlbW92aW5nIHRoZSBTMjQgc3Vw
cG9ydAo+Pj4gYWR2ZXJ0aXNlbWVudCBmcm9tIHRoZSBkcml2ZXI/Cj4+Cj4+IEkgYWxzbyBzdXNw
ZWN0IHRoYXQgczMyIG1heSBuZWVkIHNvbWUgZXh0cmEgcGF0Y2hlcyBhbmQgdGh1cyBjb3VsZCBi
ZQo+PiB3b3J0aHdoaWxlIHRvIHN0b3AgYWR2ZXJ0aXNpbmcgaXQgYXMgd2VsbC4KPiAKPiBBcyBm
YXIgYXMgSSBhbSBhd2FyZSB0aGF0IHdvcmtzIGFuZCB3ZSBjYW4gaGl0IHRoZSBhdWRpbyByYXRl
cyBmb3IgaXQuCgpJIHJhbiBhIHRlc3Qgb24gVGVncmExMjQgSmV0c29uLVRLMSBhbmQgMjQtYml0
IHBsYXliYWNrIHNlZW1zIHRvIHdvcmsgYXMKQmVuIGhhcyBpbmRpY2F0ZWQuIFNvIEkgZG9uJ3Qg
dGhpbmsgaXQgaXMgYnJva2VuLgoKQ2FuIHlvdSB0cnkgQmVuJ3MgdGVzdGNhc2Ugb24gVGVncmEz
MCAoaWUuIGdlbmVyYXRlIGEgdG9uZSB1c2luZyBzb3ggYW5kCnVzZSBhcGxheSB0byBwbGF5KT8K
CkpvbgoKLS0gCm52cHVibGljCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
