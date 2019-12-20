Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8B127F3F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3BDA15F9;
	Fri, 20 Dec 2019 16:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3BDA15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576855677;
	bh=QjoPwHyzMBOfJVfkOEagRFFRCW+g0LV6+kj6/rinkM8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otNL7latBDD0K/lGQfb4IaqKep4IDXpVOogrr8UbSdFhROQxI5C7Hpl/oaRNe0tHw
	 bDuzSrSfbzyIRdwcDPGVcvgmS05y5RhMy5Logi9W84nk5tVPWzc0M7C+rviB2aKZGj
	 0MeCTMa6m+zIlvTJ5MTJZYUgbmca5+s4VJJrt5Bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A89AF80247;
	Fri, 20 Dec 2019 16:26:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1149FF8015A; Fri, 20 Dec 2019 16:26:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 330A4F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:26:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 330A4F8014C
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iiKAA-0003ev-EU; Fri, 20 Dec 2019 15:25:58 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
Date: Fri, 20 Dec 2019 15:25:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
	samples
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

T24gMjAvMTIvMjAxOSAxNTowMiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDIwLjEyLjIwMTkg
MTc6NTYsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+PiBPbiAyMC8xMi8yMDE5IDE0OjQzLCBEbWl0
cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAyMC4xMi4yMDE5IDE2OjU3LCBKb24gSHVudGVyINC/0LjR
iNC10YI6Cj4+Pj4KPj4+PiBPbiAyMC8xMi8yMDE5IDExOjM4LCBCZW4gRG9va3Mgd3JvdGU6Cj4+
Pj4+IE9uIDIwLzEyLzIwMTkgMTE6MzAsIEpvbiBIdW50ZXIgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4g
T24gMjUvMTEvMjAxOSAxNzoyOCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+IDI1LjEx
LjIwMTkgMjA6MjIsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+Pj4+PiAyNS4xMS4y
MDE5IDEzOjM3LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+IE9uIDIzLzExLzIwMTkg
MjE6MDksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4+PiAxOC4xMC4yMDE5IDE4OjQ4
LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+Pj4+Pj4gRnJvbTogRWR3YXJkIENyYWdnIDxl
ZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGUg
dGVncmEzIGF1ZGlvIGNhbiBzdXBwb3J0IDI0IGFuZCAzMiBiaXQgc2FtcGxlIHNpemVzIHNvIGFk
ZAo+Pj4+Pj4+Pj4+PiB0aGUKPj4+Pj4+Pj4+Pj4gb3B0aW9uIHRvIHRoZSB0ZWdyYTMwX2kyc19o
d19wYXJhbXMgdG8gY29uZmlndXJlIHRoZSBTMjRfTEUgb3IKPj4+Pj4+Pj4+Pj4gUzMyX0xFCj4+
Pj4+Pj4+Pj4+IGZvcm1hdHMgd2hlbiByZXF1ZXN0ZWQuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5jby51
az4KPj4+Pj4+Pj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsuY28udWs6IGZpeHVwIG1lcmdlIG9m
IDI0IGFuZCAzMmJpdF0KPj4+Pj4+Pj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsuY28udWs6IGFk
ZCBwbSBjYWxscyBhcm91bmQgeXRkbSBjb25maWddCj4+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrOiBkcm9wIGRlYnVnIHByaW50aW5nIHRvIGRldl9kYmddCj4+Pj4+Pj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KPj4+
Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+IHNxdWFzaCA1YWVjYTVhMDU1ZmQgQVNvQzogdGVncmE6
IGkyczogcG1fcnVudGltZV9nZXRfc3luYygpIGlzCj4+Pj4+Pj4+Pj4+IG5lZWRlZAo+Pj4+Pj4+
Pj4+PiBpbiB0ZG0gY29kZQo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBBU29DOiB0ZWdyYTogaTJz
OiBwbV9ydW50aW1lX2dldF9zeW5jKCkgaXMgbmVlZGVkIGluIHRkbSBjb2RlCj4+Pj4+Pj4+Pj4+
IC0tLQo+Pj4+Pj4+Pj4+PiAgwqDCoMKgIHNvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jIHwg
MjUgKysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4+Pj4+Pj4+PiAgwqDCoMKgIDEgZmlsZSBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+
Pj4+Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+Pj4+Pj4+PiBpbmRleCA3
M2YwZGRkZWFlZjMuLjA2M2YzNGM4ODJhZiAxMDA2NDQKPj4+Pj4+Pj4+Pj4gLS0tIGEvc291bmQv
c29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+Pj4+Pj4gKysrIGIvc291bmQvc29jL3RlZ3Jh
L3RlZ3JhMzBfaTJzLmMKPj4+Pj4+Pj4+Pj4gQEAgLTEyNyw3ICsxMjcsNyBAQCBzdGF0aWMgaW50
IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4+Pj4+Pj4gc25kX3BjbV9zdWJzdHJl
YW0gKnN1YnN0cmVhbSwKPj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9IGRhaS0+ZGV2Owo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHRlZ3Jh
MzBfaTJzICppMnMgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+Pj4+Pj4+Pj4+PiAg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG1hc2ssIHZhbCwgcmVnOwo+Pj4+Pj4+Pj4+PiAt
wqDCoMKgIGludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xvY2ssIGJpdGNudDsKPj4+
Pj4+Pj4+Pj4gK8KgwqDCoCBpbnQgcmV0LCBzYW1wbGVfc2l6ZSwgc3JhdGUsIGkyc2Nsb2NrLCBi
aXRjbnQsIGF1ZGlvX2JpdHM7Cj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdGVn
cmEzMF9haHViX2NpZl9jb25mIGNpZl9jb25mOwo+Pj4+Pj4+Pj4+PiAgwqDCoMKgIMKgwqDCoMKg
wqAgaWYgKHBhcmFtc19jaGFubmVscyhwYXJhbXMpICE9IDIpCj4+Pj4+Pj4+Pj4+IEBAIC0xMzcs
OCArMTM3LDE5IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+Pj4+
Pj4+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+Pj4+Pj4+PiAgwqDCoMKg
wqDCoMKgwqAgc3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFtcykpIHsKPj4+Pj4+Pj4+Pj4gIMKg
wqDCoMKgwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMTZfTEU6Cj4+Pj4+Pj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMTY7
Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJ
Rl9CSVRTXzE2Owo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6
ZSA9IDE2Owo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+
Pj4+Pj4gK8KgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzI0X0xFOgo+Pj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8yNDsKPj4+Pj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNf
MjQ7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDI0Owo+Pj4+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRS
Vl9QQ01fRk9STUFUX1MzMl9MRToKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IFRF
R1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMzI7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBh
dWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzMyOwo+Pj4+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgc2FtcGxlX3NpemUgPSAzMjsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4+Pj4+Pj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoCB9Cj4+Pj4+Pj4+Pj4+IEBAIC0xNzAsOCArMTgxLDggQEAgc3RhdGljIGludCB0ZWdy
YTMwX2kyc19od19wYXJhbXMoc3RydWN0Cj4+Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpz
dWJzdHJlYW0sCj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBjaWZfY29uZi50aHJlc2hvbGQg
PSAwOwo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYuYXVkaW9fY2hhbm5lbHMg
PSAyOwo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYuY2xpZW50X2NoYW5uZWxz
ID0gMjsKPj4+Pj4+Pj4+Pj4gLcKgwqDCoCBjaWZfY29uZi5hdWRpb19iaXRzID0gVEVHUkEzMF9B
VURJT0NJRl9CSVRTXzE2Owo+Pj4+Pj4+Pj4+PiAtwqDCoMKgIGNpZl9jb25mLmNsaWVudF9iaXRz
ID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGNpZl9jb25m
LmF1ZGlvX2JpdHMgPSBhdWRpb19iaXRzOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGNpZl9jb25mLmNs
aWVudF9iaXRzID0gYXVkaW9fYml0czsKPj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGNpZl9j
b25mLmV4cGFuZCA9IDA7Cj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBjaWZfY29uZi5zdGVy
ZW9fY29udiA9IDA7Cj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBjaWZfY29uZi5yZXBsaWNh
dGUgPSAwOwo+Pj4+Pj4+Pj4+PiBAQCAtMzA2LDE0ICszMTcsMTggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIKPj4+Pj4+Pj4+Pj4gdGVncmEzMF9pMnNfZGFpX3RlbXBs
YXRlID0gewo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWlu
ID0gMiwKPj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9
IDIsCj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BD
TV9SQVRFXzgwMDBfOTYwMDAsCj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9
IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZv
cm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MzMl9MRSB8Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+
Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAg
LmNhcHR1cmUgPSB7Cj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zdHJlYW1f
bmFtZSA9ICJDYXB0dXJlIiwKPj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNo
YW5uZWxzX21pbiA9IDIsCj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFu
bmVsc19tYXggPSAyLAo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAucmF0ZXMg
PSBTTkRSVl9QQ01fUkFURV84MDAwXzk2MDAwLAo+Pj4+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
LmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRf
UzE2X0xFLAo+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgfSwKPj4+Pj4+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+Pj4+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgIC5zeW1tZXRyaWNfcmF0ZXMgPSAxLAo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4gSGVsbG8sCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGlzIHBhdGNoIGJyZWFrcyBh
dWRpbyBvbiBUZWdyYTMwLiBJIGRvbid0IHNlZSBlcnJvcnMKPj4+Pj4+Pj4+PiBhbnl3aGVyZSwg
YnV0Cj4+Pj4+Pj4+Pj4gdGhlcmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlzIHBhdGNo
IGhlbHBzLiBQbGVhc2UgZml4IGl0Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdoYXQgaXMgdGhlIGZh
aWx1cmUgbW9kZT8gSSBjYW4gdHJ5IGFuZCB0YWtlIGEgbG9vayBhdCB0aGlzIHNvbWUKPj4+Pj4+
Pj4+IHRpbWUKPj4+Pj4+Pj4+IHRoaXMgd2VlaywgYnV0IEkgYW0gbm90IHN1cmUgaWYgSSBoYXZl
IGFueSBib2FyZHMgd2l0aCBhbiBhY3R1YWwKPj4+Pj4+Pj4+IHVzZWZ1bAo+Pj4+Pj4+Pj4gYXVk
aW8gb3V0cHV0Pwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgZmFpbHVyZSBtb2RlIGlzIHRoYXQgdGhl
cmUgbm8gc291bmQuIEkgYWxzbyBub3RpY2VkIHRoYXQgdmlkZW8KPj4+Pj4+Pj4gcGxheWJhY2sg
c3R1dHRlcnMgYSBsb3QgaWYgbW92aWUgZmlsZSBoYXMgYXVkaW8gdHJhY2ssIHNlZW1zCj4+Pj4+
Pj4+IHNvbWV0aGluZwo+Pj4+Pj4+PiB0aW1lcyBvdXQgZHVyaW5nIG9mIHRoZSBhdWRpbyBwbGF5
YmFjay4gRm9yIG5vdyBJIGRvbid0IGhhdmUgYW55Cj4+Pj4+Pj4+IG1vcmUgaW5mby4KPj4+Pj4+
Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IE9oLCBJIGRpZG4ndCBzYXkgaG93IHRvIHJlcHJvZHVjZSBpdC4u
IGZvciBleGFtcGxlIHNpbXBseSBwbGF5aW5nCj4+Pj4+Pj4gYmlnX2J1Y2tfYnVubnlfNzIwcF9o
MjY0Lm1vdiBpbiBNUFYgaGFzIHRoZSBhdWRpbyBwcm9ibGVtLgo+Pj4+Pj4+Cj4+Pj4+Pj4gaHR0
cHM6Ly9kb3dubG9hZC5ibGVuZGVyLm9yZy9wZWFjaC9iaWdidWNrYnVubnlfbW92aWVzL2JpZ19i
dWNrX2J1bm55XzcyMHBfaDI2NC5tb3YKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gR2l2
ZW4gdGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2VzIHJlZ21hcCwgaXQgY291bGQgYmUgZ29vZCB0
byBkdW1wIHRoZQo+Pj4+Pj4gSTJTL0FIVUIgcmVnaXN0ZXJzIHdoaWxlIHRoZSBjbGlwIGlmIHBs
YXlpbmcgd2l0aCBhbmQgd2l0aG91dCB0aGlzCj4+Pj4+PiBwYXRjaAo+Pj4+Pj4gdG8gc2VlIHRo
ZSBkaWZmZXJlbmNlcy4gSSBhbSBjdXJpb3VzIGlmIHRoZSBhdWRpbyBpcyBub3cgYmVpbmcKPj4+
Pj4+IHBsYXllZCBhcwo+Pj4+Pj4gMjQgb3IgMzItYml0IGluc3RlYWQgb2YgMTYtYml0IG5vdyB0
aGVzZSBhcmUgYXZhaWxhYmxlLgo+Pj4+Pj4KPj4+Pj4+IFlvdSBjb3VsZCBhbHNvIGR1bXAgdGhl
IGh3X3BhcmFtcyB0byBzZWUgdGhlIGZvcm1hdCB3aGlsZSBwbGF5aW5nIGFzCj4+Pj4+PiB3ZWxs
IC4uLgo+Pj4+Pj4KPj4+Pj4+ICQgL3Byb2MvYXNvdW5kLzxzY2FyZC1uYW1lPi9wY20wcC9zdWIw
L2h3X3BhcmFtcwo+Pj4+Pgo+Pj4+PiBJIHN1cHBvc2UgaXQgaXMgYWxzbyBwb3NzaWJsZSB0aGF0
IHRoZSBjb2RlYyBpc24ndCBwcm9wZXJseSBkb2luZyA+MTYKPj4+Pj4gYml0cyBhbmQgdGhlIGZh
Y3Qgd2Ugbm93IG9mZmVyIDI0IGFuZCAzMiBjb3VsZCBiZSBhbiBpc3N1ZS4gSSd2ZSBub3QKPj4+
Pj4gZ290IGFueXRoaW5nIHdpdGggYW4gYXVkaW8gb3V0cHV0IG9uIGl0IHRoYXQgd291bGQgYmUg
ZWFzeSB0byB0ZXN0Lgo+Pj4+Cj4+Pj4gSSB0aG91Z2h0IEkgaGFkIHRlc3RlZCBvbiBhIEpldHNv
biBUSzEgKFRlZ3JhMTI0KSBidXQgaXQgd2FzIHNvbWV0aW1lCj4+Pj4gYmFjay4gSG93ZXZlciwg
YWRtaXR0ZWRseSBJIG1heSBoYXZlIG9ubHkgZG9uZSBzaW1wbGUgMTYtYml0IHRlc3RpbmcKPj4+
PiB3aXRoIHNwZWFrZXItdGVzdC4KPj4+Pgo+Pj4+IFdlIGRvIHZlcmlmeSB0aGF0IGFsbCBzb3Vu
ZGNhcmRzIGFyZSBkZXRlY3RlZCBhbmQgcmVnaXN0ZXJlZCBhcyBleHBlY3RlZAo+Pj4+IGR1cmlu
ZyBkYWlseSB0ZXN0aW5nLCBidXQgYXQgdGhlIG1vbWVudCB3ZSBkb24ndCBoYXZlIGFueXRoaW5n
IHRoYXQKPj4+PiB2ZXJpZmllcyBhY3R1YWwgcGxheWJhY2suCj4+Pgo+Pj4gUGxlYXNlIHRha2Ug
YSBsb29rIGF0IHRoZSBhdHRhY2hlZCBsb2dzLgo+Pgo+PiBJIHdvbmRlciBpZiB3ZSBhcmUgZmFs
bGluZyBpbnRvIEZJRk8gY29uZmlndXJhdGlvbiBpc3N1ZXMgd2l0aCB0aGUKPj4gbm9uLTE2IGJp
dCBjYXNlLgo+Pgo+PiBDYW4geW91IHRyeSBhZGRpbmcgdGhlIGZvbGxvd2luZyB0d28gcGF0Y2hl
cz8KPiAKPiBJdCBpcyBtdWNoIGJldHRlciBub3chIFRoZXJlIGlzIG5vIGhvcnJpYmxlIG5vaXNl
IGFuZCBubyBzdHV0dGVyaW5nLCBidXQKPiBhdWRpbyBzdGlsbCBoYXMgYSAicm9ib3RpYyIgZWZm
ZWN0LCBsaWtlIGZyZXEgaXNuJ3QgY29ycmVjdC4KCkkgd29uZGVyIGlmIHRoZXJlJ3MgYW4gaXNz
dWUgd2l0aCBGSUZPIHN0b2tpbmc/IEkgc2hvdWxkIGFsc28gcG9zc2libHkKYWRkIHRoZSBjb3Jy
ZWN0bHkgc3RvcCBGSUZPcyBwYXRjaCBhcyB3ZWxsLgoKCi0tIApCZW4gRG9va3MJCQkJaHR0cDov
L3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92
aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
