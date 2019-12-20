Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7AF12811B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 18:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809DE15F9;
	Fri, 20 Dec 2019 18:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809DE15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576861696;
	bh=8HiFa1Rf1nvqxuywME9zMHsUwAXz26kMKvCXCnUGL1Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/EV32lJy6PMhRcZxO/RbGZAo3KaMjdhEfWD0vFtBS+vlgy43SBqZXva52GFDT5ik
	 Eo93JVy58bi//6TQiUBVm6hplDw1IrekWmW0OyexX7OfucMRxcBs0CP/Bks8fDU3mZ
	 ZBav93AlzUWjqFgVxwvSXQ+YKRHioN187zWF8oG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C36A8F80247;
	Fri, 20 Dec 2019 18:06:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 663C4F80247; Fri, 20 Dec 2019 18:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2E11F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 18:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E11F800B5
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iiLjW-0006sv-9a; Fri, 20 Dec 2019 17:06:34 +0000
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
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
Date: Fri, 20 Dec 2019 17:06:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
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

T24gMjAvMTIvMjAxOSAxNjo0MCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDIwLjEyLjIwMTkg
MTg6MjUsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+PiBPbiAyMC8xMi8yMDE5IDE1OjAyLCBEbWl0
cnkgT3NpcGVua28gd3JvdGU6Cj4+PiAyMC4xMi4yMDE5IDE3OjU2LCBCZW4gRG9va3Mg0L/QuNGI
0LXRgjoKPj4+PiBPbiAyMC8xMi8yMDE5IDE0OjQzLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
Pj4+IDIwLjEyLjIwMTkgMTY6NTcsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4+Pj4+Cj4+Pj4+
PiBPbiAyMC8xMi8yMDE5IDExOjM4LCBCZW4gRG9va3Mgd3JvdGU6Cj4+Pj4+Pj4gT24gMjAvMTIv
MjAxOSAxMTozMCwgSm9uIEh1bnRlciB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gT24gMjUvMTEv
MjAxOSAxNzoyOCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+Pj4gMjUuMTEuMjAxOSAy
MDoyMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4gMjUuMTEuMjAxOSAx
MzozNywgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+Pj4+Pj4+IE9uIDIzLzExLzIwMTkgMjE6
MDksIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4+Pj4+Pj4+IDE4LjEwLjIwMTkgMTg6NDgs
IEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4+Pj4+Pj4+IEZyb206IEVkd2FyZCBDcmFnZyA8
ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+
IFRoZSB0ZWdyYTMgYXVkaW8gY2FuIHN1cHBvcnQgMjQgYW5kIDMyIGJpdCBzYW1wbGUgc2l6ZXMg
c28gYWRkCj4+Pj4+Pj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+Pj4+Pj4gb3B0aW9uIHRvIHRoZSB0ZWdy
YTMwX2kyc19od19wYXJhbXMgdG8gY29uZmlndXJlIHRoZSBTMjRfTEUgb3IKPj4+Pj4+Pj4+Pj4+
PiBTMzJfTEUKPj4+Pj4+Pj4+Pj4+PiBmb3JtYXRzIHdoZW4gcmVxdWVzdGVkLgo+Pj4+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIENyYWdnIDxlZHdhcmQuY3Jh
Z2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4+Pj4+Pj4+Pj4+IFtiZW4uZG9va3NAY29kZXRoaW5rLmNv
LnVrOiBmaXh1cCBtZXJnZSBvZiAyNCBhbmQgMzJiaXRdCj4+Pj4+Pj4+Pj4+Pj4gW2Jlbi5kb29r
c0Bjb2RldGhpbmsuY28udWs6IGFkZCBwbSBjYWxscyBhcm91bmQgeXRkbSBjb25maWddCj4+Pj4+
Pj4+Pj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsuY28udWs6IGRyb3AgZGVidWcgcHJpbnRpbmcg
dG8gZGV2X2RiZ10KPj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCZW4gRG9va3MgPGJlbi5k
b29rc0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+Pj4gc3F1
YXNoIDVhZWNhNWEwNTVmZCBBU29DOiB0ZWdyYTogaTJzOiBwbV9ydW50aW1lX2dldF9zeW5jKCkg
aXMKPj4+Pj4+Pj4+Pj4+PiBuZWVkZWQKPj4+Pj4+Pj4+Pj4+PiBpbiB0ZG0gY29kZQo+Pj4+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gQVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9nZXRfc3lu
YygpIGlzIG5lZWRlZCBpbiB0ZG0gY29kZQo+Pj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Pj4+Pj4+
ICDCoMKgwqDCoCBzb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyB8IDI1Cj4+Pj4+Pj4+Pj4+
Pj4gKysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMu
Ywo+Pj4+Pj4+Pj4+Pj4+IGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+Pj4+
Pj4+PiBpbmRleCA3M2YwZGRkZWFlZjMuLjA2M2YzNGM4ODJhZiAxMDA2NDQKPj4+Pj4+Pj4+Pj4+
PiAtLS0gYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+Pj4+Pj4+Pj4+ICsrKyBi
L3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+Pj4+Pj4+Pj4gQEAgLTEyNyw3ICsx
MjcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4+Pj4+
Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGRhaS0+ZGV2Owo+Pj4+Pj4+Pj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0ZWdyYTMwX2kycyAqaTJzID0KPj4+Pj4+Pj4+Pj4+PiBz
bmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBtYXNrLCB2YWwsIHJlZzsKPj4+Pj4+Pj4+Pj4+PiAtwqDCoMKgIGlu
dCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xvY2ssIGJpdGNudDsKPj4+Pj4+Pj4+Pj4+
PiArwqDCoMKgIGludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xvY2ssIGJpdGNudCwg
YXVkaW9fYml0czsKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdGVncmEz
MF9haHViX2NpZl9jb25mIGNpZl9jb25mOwo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCDCoMKgwqDC
oMKgIGlmIChwYXJhbXNfY2hhbm5lbHMocGFyYW1zKSAhPSAyKQo+Pj4+Pj4+Pj4+Pj4+IEBAIC0x
MzcsOCArMTM3LDE5IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+
Pj4+Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+Pj4+Pj4+Pj4g
IMKgwqDCoMKgwqDCoMKgwqAgc3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFtcykpIHsKPj4+Pj4+
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xFOgo+
Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNf
Q1RSTF9CSVRfU0laRV8xNjsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0
cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMTY7Cj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENN
X0ZPUk1BVF9TMjRfTEU6Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IFRFR1JB
MzBfSTJTX0NUUkxfQklUX1NJWkVfMjQ7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1
ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMjQ7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMjQ7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MzMl9M
RToKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9C
SVRfU0laRV8zMjsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYXVkaW9fYml0cyA9IFRF
R1JBMzBfQVVESU9DSUZfQklUU18zMjsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2Ft
cGxlX3NpemUgPSAzMjsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+
Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+PiBAQCAtMTcwLDggKzE4MSw4IEBAIHN0YXRpYyBpbnQg
dGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdAo+Pj4+Pj4+Pj4+Pj4+IHNuZF9wY21fc3Vic3Ry
ZWFtICpzdWJzdHJlYW0sCj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYu
dGhyZXNob2xkID0gMDsKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBjaWZfY29uZi5h
dWRpb19jaGFubmVscyA9IDI7Cj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgY2lmX2Nv
bmYuY2xpZW50X2NoYW5uZWxzID0gMjsKPj4+Pj4+Pj4+Pj4+PiAtwqDCoMKgIGNpZl9jb25mLmF1
ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDC
oCBjaWZfY29uZi5jbGllbnRfYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+
Pj4+Pj4+PiArwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2JpdHMgPSBhdWRpb19iaXRzOwo+Pj4+Pj4+
Pj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuY2xpZW50X2JpdHMgPSBhdWRpb19iaXRzOwo+Pj4+Pj4+
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIGNpZl9jb25mLmV4cGFuZCA9IDA7Cj4+Pj4+Pj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgY2lmX2NvbmYuc3RlcmVvX2NvbnYgPSAwOwo+Pj4+Pj4+Pj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIGNpZl9jb25mLnJlcGxpY2F0ZSA9IDA7Cj4+Pj4+Pj4+Pj4+
Pj4gQEAgLTMwNiwxNCArMzE3LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlf
ZHJpdmVyCj4+Pj4+Pj4+Pj4+Pj4gdGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+Pj4+Pj4+
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+
Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+
Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9S
QVRFXzgwMDBfOTYwMDAsCj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0g
U05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5m
b3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MxNl9M
RSwKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+Pj4+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLnN0cmVhbV9uYW1lID0gIkNhcHR1cmUiLAo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21pbiA9IDIsCj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+Pj4+Pj4+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAs
Cj4+Pj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJ
VF9TMTZfTEUsCj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZf
UENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFNORFJWX1BDTV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4+Pj4+Pj4+
PiAgwqDCoMKgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIC5v
cHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDC
oCAuc3ltbWV0cmljX3JhdGVzID0gMSwKPj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4+IEhlbGxvLAo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFRoaXMgcGF0Y2ggYnJlYWtz
IGF1ZGlvIG9uIFRlZ3JhMzAuIEkgZG9uJ3Qgc2VlIGVycm9ycwo+Pj4+Pj4+Pj4+Pj4gYW55d2hl
cmUsIGJ1dAo+Pj4+Pj4+Pj4+Pj4gdGhlcmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlz
IHBhdGNoIGhlbHBzLiBQbGVhc2UgZml4IGl0Lgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBXaGF0
IGlzIHRoZSBmYWlsdXJlIG1vZGU/IEkgY2FuIHRyeSBhbmQgdGFrZSBhIGxvb2sgYXQgdGhpcyBz
b21lCj4+Pj4+Pj4+Pj4+IHRpbWUKPj4+Pj4+Pj4+Pj4gdGhpcyB3ZWVrLCBidXQgSSBhbSBub3Qg
c3VyZSBpZiBJIGhhdmUgYW55IGJvYXJkcyB3aXRoIGFuIGFjdHVhbAo+Pj4+Pj4+Pj4+PiB1c2Vm
dWwKPj4+Pj4+Pj4+Pj4gYXVkaW8gb3V0cHV0Pwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVGhlIGZh
aWx1cmUgbW9kZSBpcyB0aGF0IHRoZXJlIG5vIHNvdW5kLiBJIGFsc28gbm90aWNlZCB0aGF0IHZp
ZGVvCj4+Pj4+Pj4+Pj4gcGxheWJhY2sgc3R1dHRlcnMgYSBsb3QgaWYgbW92aWUgZmlsZSBoYXMg
YXVkaW8gdHJhY2ssIHNlZW1zCj4+Pj4+Pj4+Pj4gc29tZXRoaW5nCj4+Pj4+Pj4+Pj4gdGltZXMg
b3V0IGR1cmluZyBvZiB0aGUgYXVkaW8gcGxheWJhY2suIEZvciBub3cgSSBkb24ndCBoYXZlIGFu
eQo+Pj4+Pj4+Pj4+IG1vcmUgaW5mby4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9o
LCBJIGRpZG4ndCBzYXkgaG93IHRvIHJlcHJvZHVjZSBpdC4uIGZvciBleGFtcGxlIHNpbXBseSBw
bGF5aW5nCj4+Pj4+Pj4+PiBiaWdfYnVja19idW5ueV83MjBwX2gyNjQubW92IGluIE1QViBoYXMg
dGhlIGF1ZGlvIHByb2JsZW0uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaHR0cHM6Ly9kb3dubG9hZC5i
bGVuZGVyLm9yZy9wZWFjaC9iaWdidWNrYnVubnlfbW92aWVzL2JpZ19idWNrX2J1bm55XzcyMHBf
aDI2NC5tb3YKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4g
R2l2ZW4gdGhhdCB0aGUgYXVkaW8gZHJpdmVycyB1c2VzIHJlZ21hcCwgaXQgY291bGQgYmUgZ29v
ZCB0bwo+Pj4+Pj4+PiBkdW1wIHRoZQo+Pj4+Pj4+PiBJMlMvQUhVQiByZWdpc3RlcnMgd2hpbGUg
dGhlIGNsaXAgaWYgcGxheWluZyB3aXRoIGFuZCB3aXRob3V0IHRoaXMKPj4+Pj4+Pj4gcGF0Y2gK
Pj4+Pj4+Pj4gdG8gc2VlIHRoZSBkaWZmZXJlbmNlcy4gSSBhbSBjdXJpb3VzIGlmIHRoZSBhdWRp
byBpcyBub3cgYmVpbmcKPj4+Pj4+Pj4gcGxheWVkIGFzCj4+Pj4+Pj4+IDI0IG9yIDMyLWJpdCBp
bnN0ZWFkIG9mIDE2LWJpdCBub3cgdGhlc2UgYXJlIGF2YWlsYWJsZS4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gWW91IGNvdWxkIGFsc28gZHVtcCB0aGUgaHdfcGFyYW1zIHRvIHNlZSB0aGUgZm9ybWF0IHdo
aWxlIHBsYXlpbmcgYXMKPj4+Pj4+Pj4gd2VsbCAuLi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gJCAvcHJv
Yy9hc291bmQvPHNjYXJkLW5hbWU+L3BjbTBwL3N1YjAvaHdfcGFyYW1zCj4+Pj4+Pj4KPj4+Pj4+
PiBJIHN1cHBvc2UgaXQgaXMgYWxzbyBwb3NzaWJsZSB0aGF0IHRoZSBjb2RlYyBpc24ndCBwcm9w
ZXJseSBkb2luZyA+MTYKPj4+Pj4+PiBiaXRzIGFuZCB0aGUgZmFjdCB3ZSBub3cgb2ZmZXIgMjQg
YW5kIDMyIGNvdWxkIGJlIGFuIGlzc3VlLiBJJ3ZlIG5vdAo+Pj4+Pj4+IGdvdCBhbnl0aGluZyB3
aXRoIGFuIGF1ZGlvIG91dHB1dCBvbiBpdCB0aGF0IHdvdWxkIGJlIGVhc3kgdG8gdGVzdC4KPj4+
Pj4+Cj4+Pj4+PiBJIHRob3VnaHQgSSBoYWQgdGVzdGVkIG9uIGEgSmV0c29uIFRLMSAoVGVncmEx
MjQpIGJ1dCBpdCB3YXMgc29tZXRpbWUKPj4+Pj4+IGJhY2suIEhvd2V2ZXIsIGFkbWl0dGVkbHkg
SSBtYXkgaGF2ZSBvbmx5IGRvbmUgc2ltcGxlIDE2LWJpdCB0ZXN0aW5nCj4+Pj4+PiB3aXRoIHNw
ZWFrZXItdGVzdC4KPj4+Pj4+Cj4+Pj4+PiBXZSBkbyB2ZXJpZnkgdGhhdCBhbGwgc291bmRjYXJk
cyBhcmUgZGV0ZWN0ZWQgYW5kIHJlZ2lzdGVyZWQgYXMKPj4+Pj4+IGV4cGVjdGVkCj4+Pj4+PiBk
dXJpbmcgZGFpbHkgdGVzdGluZywgYnV0IGF0IHRoZSBtb21lbnQgd2UgZG9uJ3QgaGF2ZSBhbnl0
aGluZyB0aGF0Cj4+Pj4+PiB2ZXJpZmllcyBhY3R1YWwgcGxheWJhY2suCj4+Pj4+Cj4+Pj4+IFBs
ZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUgYXR0YWNoZWQgbG9ncy4KPj4+Pgo+Pj4+IEkgd29uZGVy
IGlmIHdlIGFyZSBmYWxsaW5nIGludG8gRklGTyBjb25maWd1cmF0aW9uIGlzc3VlcyB3aXRoIHRo
ZQo+Pj4+IG5vbi0xNiBiaXQgY2FzZS4KPj4+Pgo+Pj4+IENhbiB5b3UgdHJ5IGFkZGluZyB0aGUg
Zm9sbG93aW5nIHR3byBwYXRjaGVzPwo+Pj4KPj4+IEl0IGlzIG11Y2ggYmV0dGVyIG5vdyEgVGhl
cmUgaXMgbm8gaG9ycmlibGUgbm9pc2UgYW5kIG5vIHN0dXR0ZXJpbmcsIGJ1dAo+Pj4gYXVkaW8g
c3RpbGwgaGFzIGEgInJvYm90aWMiIGVmZmVjdCwgbGlrZSBmcmVxIGlzbid0IGNvcnJlY3QuCj4+
Cj4+IEkgd29uZGVyIGlmIHRoZXJlJ3MgYW4gaXNzdWUgd2l0aCBGSUZPIHN0b2tpbmc/IEkgc2hv
dWxkIGFsc28gcG9zc2libHkKPj4gYWRkIHRoZSBjb3JyZWN0bHkgc3RvcCBGSUZPcyBwYXRjaCBh
cyB3ZWxsLgo+IAo+IEknbGwgYmUgaGFwcHkgdG8gdHJ5IG1vcmUgcGF0Y2hlcy4KPiAKPiBNZWFu
d2hpbGUgc291bmQgb24gdjUuNSsgaXMgYnJva2VuIGFuZCB0aHVzIHRoZSBpbmNvbXBsZXRlIHBh
dGNoZXMKPiBzaG91bGQgYmUgcmV2ZXJ0ZWQuCgpIYXZlIHlvdSBjaGVja2VkIGlmIGp1c3QgcmVt
b3ZpbmcgdGhlIDI0LzMyIGJpdHMgZnJvbSAuZm9ybWF0cyBpbgp0aGUgZGFpIHRlbXBsYXRlIGFu
ZCBzZWUgaWYgdGhlIHByb2JsZW0gY29udGludWVzPyBJIHdpbGwgdHJ5IGFuZApzZWUgaWYgSSBj
YW4gZmluZCB0aGUgY29kZSB0aGF0IGRvZXMgdGhlIGZpZm8gbGV2ZWwgY2hlY2tpbmcgYW5kCnNl
ZSBpZiB0aGUgcHJvYmxlbSBpcyBpbiB0aGUgRklGTyBmaWxsIG9yIHNvbWV0aGluZyBlbHNlIGlu
IHRoZQphdWRpbyBodWIgc2V0dXAuCgoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8vd3d3LmNvZGV0
aGluay5jby51ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3ZpZGluZyBHZW5p
dXMKCmh0dHBzOi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
