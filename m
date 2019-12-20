Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66AA1279B2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 11:59:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562A01654;
	Fri, 20 Dec 2019 11:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562A01654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576839542;
	bh=8fI0ToS+9CwwAfr0Bmocdl+UoyRZWOsZPcx0hOedYwc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KVmEFmF5uyampBsZtsM+opeKKkCqQa5/esHLRFkV5RLScmtpkkz9IzhvgaEO22E8m
	 tA3G+NUXncTo6cAwc4L2H+mmPvwBsP18VeMY4GbaVrN9Z+y15mnuLpwvo212IO1rdw
	 AkBpRm9tfHCQYoATeECNDBXqBNGJIBxK6eAat0BU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A82ABF80247;
	Fri, 20 Dec 2019 11:57:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C48CF8015A; Fri, 20 Dec 2019 11:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 388A4F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 11:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 388A4F800B5
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iiFxp-0003pW-8D; Fri, 20 Dec 2019 10:56:57 +0000
To: Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <eec79f8c-2ed2-3bc8-e923-ea78be0c12a9@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <634ca912-f9bb-beb7-2c8c-190ad150e41c@codethink.co.uk>
Date: Fri, 20 Dec 2019 10:56:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eec79f8c-2ed2-3bc8-e923-ea78be0c12a9@gmail.com>
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

T24gMTkvMTIvMjAxOSAyMToyMSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDI1LjExLjIwMTkg
MjA6MjgsIERtaXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+PiAyNS4xMS4yMDE5IDIwOjIyLCBE
bWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoKPj4+IDI1LjExLjIwMTkgMTM6MzcsIEJlbiBEb29r
cyDQv9C40YjQtdGCOgo+Pj4+IE9uIDIzLzExLzIwMTkgMjE6MDksIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+Pj4gMTguMTAuMjAxOSAxODo0OCwgQmVuIERvb2tzINC/0LjRiNC10YI6Cj4+Pj4+
PiBGcm9tOiBFZHdhcmQgQ3JhZ2cgPGVkd2FyZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4+
Pgo+Pj4+Pj4gVGhlIHRlZ3JhMyBhdWRpbyBjYW4gc3VwcG9ydCAyNCBhbmQgMzIgYml0IHNhbXBs
ZSBzaXplcyBzbyBhZGQgdGhlCj4+Pj4+PiBvcHRpb24gdG8gdGhlIHRlZ3JhMzBfaTJzX2h3X3Bh
cmFtcyB0byBjb25maWd1cmUgdGhlIFMyNF9MRSBvciBTMzJfTEUKPj4+Pj4+IGZvcm1hdHMgd2hl
biByZXF1ZXN0ZWQuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIENyYWdnIDxl
ZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+Pj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhpbmsu
Y28udWs6IGZpeHVwIG1lcmdlIG9mIDI0IGFuZCAzMmJpdF0KPj4+Pj4+IFtiZW4uZG9va3NAY29k
ZXRoaW5rLmNvLnVrOiBhZGQgcG0gY2FsbHMgYXJvdW5kIHl0ZG0gY29uZmlnXQo+Pj4+Pj4gW2Jl
bi5kb29rc0Bjb2RldGhpbmsuY28udWs6IGRyb3AgZGVidWcgcHJpbnRpbmcgdG8gZGV2X2RiZ10K
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51
az4KPj4+Pj4+IC0tLQo+Pj4+Pj4gc3F1YXNoIDVhZWNhNWEwNTVmZCBBU29DOiB0ZWdyYTogaTJz
OiBwbV9ydW50aW1lX2dldF9zeW5jKCkgaXMgbmVlZGVkCj4+Pj4+PiBpbiB0ZG0gY29kZQo+Pj4+
Pj4KPj4+Pj4+IEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBpcyBuZWVk
ZWQgaW4gdGRtIGNvZGUKPj4+Pj4+IC0tLQo+Pj4+Pj4gIMKgIHNvdW5kL3NvYy90ZWdyYS90ZWdy
YTMwX2kycy5jIHwgMjUgKysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4+Pj4gIMKgIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+Pj4gYi9zb3Vu
ZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+Pj4gaW5kZXggNzNmMGRkZGVhZWYzLi4wNjNm
MzRjODgyYWYgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMu
Ywo+Pj4+Pj4gKysrIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKPj4+Pj4+IEBAIC0x
MjcsNyArMTI3LDcgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0Cj4+
Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+Pj4gIMKgwqDCoMKgwqAgc3Ry
dWN0IGRldmljZSAqZGV2ID0gZGFpLT5kZXY7Cj4+Pj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgdGVn
cmEzMF9pMnMgKmkycyA9IHNuZF9zb2NfZGFpX2dldF9kcnZkYXRhKGRhaSk7Cj4+Pj4+PiAgwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgbWFzaywgdmFsLCByZWc7Cj4+Pj4+PiAtwqDCoMKgIGludCBy
ZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJzY2xvY2ssIGJpdGNudDsKPj4+Pj4+ICvCoMKgwqAg
aW50IHJldCwgc2FtcGxlX3NpemUsIHNyYXRlLCBpMnNjbG9jaywgYml0Y250LCBhdWRpb19iaXRz
Owo+Pj4+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IHRlZ3JhMzBfYWh1Yl9jaWZfY29uZiBjaWZfY29u
ZjsKPj4+Pj4+ICDCoCDCoMKgwqDCoMKgIGlmIChwYXJhbXNfY2hhbm5lbHMocGFyYW1zKSAhPSAy
KQo+Pj4+Pj4gQEAgLTEzNyw4ICsxMzcsMTkgQEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19w
YXJhbXMoc3RydWN0Cj4+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+Pj4+Pj4g
IMKgwqDCoMKgwqAgc3dpdGNoIChwYXJhbXNfZm9ybWF0KHBhcmFtcykpIHsKPj4+Pj4+ICDCoMKg
wqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMTZfTEU6Cj4+Pj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMTY7Cj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgYXVkaW9fYml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAxNjsKPj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgYnJlYWs7Cj4+Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1BVF9TMjRfTEU6
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8y
NDsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9C
SVRTXzI0Owo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMjQ7Cj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+PiArwqDCoMKgIGNhc2UgU05EUlZfUENNX0ZPUk1B
VF9TMzJfTEU6Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9C
SVRfU0laRV8zMjsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9B
VURJT0NJRl9CSVRTXzMyOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNhbXBsZV9zaXplID0gMzI7
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+PiAgwqDCoMKgwqDCoCBkZWZhdWx0
Ogo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+ICDCoMKg
wqDCoMKgIH0KPj4+Pj4+IEBAIC0xNzAsOCArMTgxLDggQEAgc3RhdGljIGludCB0ZWdyYTMwX2ky
c19od19wYXJhbXMoc3RydWN0Cj4+Pj4+PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+
Pj4+Pj4gIMKgwqDCoMKgwqAgY2lmX2NvbmYudGhyZXNob2xkID0gMDsKPj4+Pj4+ICDCoMKgwqDC
oMKgIGNpZl9jb25mLmF1ZGlvX2NoYW5uZWxzID0gMjsKPj4+Pj4+ICDCoMKgwqDCoMKgIGNpZl9j
b25mLmNsaWVudF9jaGFubmVscyA9IDI7Cj4+Pj4+PiAtwqDCoMKgIGNpZl9jb25mLmF1ZGlvX2Jp
dHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4+PiAtwqDCoMKgIGNpZl9jb25mLmNs
aWVudF9iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+Pj4+Pj4gK8KgwqDCoCBjaWZf
Y29uZi5hdWRpb19iaXRzID0gYXVkaW9fYml0czsKPj4+Pj4+ICvCoMKgwqAgY2lmX2NvbmYuY2xp
ZW50X2JpdHMgPSBhdWRpb19iaXRzOwo+Pj4+Pj4gIMKgwqDCoMKgwqAgY2lmX2NvbmYuZXhwYW5k
ID0gMDsKPj4+Pj4+ICDCoMKgwqDCoMKgIGNpZl9jb25mLnN0ZXJlb19jb252ID0gMDsKPj4+Pj4+
ICDCoMKgwqDCoMKgIGNpZl9jb25mLnJlcGxpY2F0ZSA9IDA7Cj4+Pj4+PiBAQCAtMzA2LDE0ICsz
MTcsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIKPj4+Pj4+IHRl
Z3JhMzBfaTJzX2RhaV90ZW1wbGF0ZSA9IHsKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgLmNo
YW5uZWxzX21pbiA9IDIsCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19tYXgg
PSAyLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAucmF0ZXMgPSBTTkRSVl9QQ01fUkFURV84
MDAwXzk2MDAwLAo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZN
VEJJVF9TMTZfTEUsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01f
Rk1UQklUX1MzMl9MRSB8Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTTkRS
Vl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBTTkRSVl9QQ01fRk1UQklUX1MxNl9MRSwKPj4+Pj4+ICDCoMKgwqDCoMKgIH0sCj4+Pj4+PiAg
wqDCoMKgwqDCoCAuY2FwdHVyZSA9IHsKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgLnN0cmVh
bV9uYW1lID0gIkNhcHR1cmUiLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNf
bWluID0gMiwKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIsCj4+
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYw
MDAsCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklUX1Mx
Nl9MRSwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRf
UzMyX0xFIHwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BDTV9G
TVRCSVRfUzI0X0xFIHwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJW
X1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+Pj4gIMKgwqDCoMKgwqAgfSwKPj4+Pj4+ICDCoMKgwqDC
oMKgIC5vcHMgPSAmdGVncmEzMF9pMnNfZGFpX29wcywKPj4+Pj4+ICDCoMKgwqDCoMKgIC5zeW1t
ZXRyaWNfcmF0ZXMgPSAxLAo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gSGVsbG8sCj4+Pj4+Cj4+Pj4+IFRo
aXMgcGF0Y2ggYnJlYWtzIGF1ZGlvIG9uIFRlZ3JhMzAuIEkgZG9uJ3Qgc2VlIGVycm9ycyBhbnl3
aGVyZSwgYnV0Cj4+Pj4+IHRoZXJlIGlzIG5vIGF1ZGlvIGFuZCByZXZlcnRpbmcgdGhpcyBwYXRj
aCBoZWxwcy4gUGxlYXNlIGZpeCBpdC4KPj4+Pgo+Pj4+IFdoYXQgaXMgdGhlIGZhaWx1cmUgbW9k
ZT8gSSBjYW4gdHJ5IGFuZCB0YWtlIGEgbG9vayBhdCB0aGlzIHNvbWUgdGltZQo+Pj4+IHRoaXMg
d2VlaywgYnV0IEkgYW0gbm90IHN1cmUgaWYgSSBoYXZlIGFueSBib2FyZHMgd2l0aCBhbiBhY3R1
YWwgdXNlZnVsCj4+Pj4gYXVkaW8gb3V0cHV0Pwo+Pj4KPj4+IFRoZSBmYWlsdXJlIG1vZGUgaXMg
dGhhdCB0aGVyZSBubyBzb3VuZC4gSSBhbHNvIG5vdGljZWQgdGhhdCB2aWRlbwo+Pj4gcGxheWJh
Y2sgc3R1dHRlcnMgYSBsb3QgaWYgbW92aWUgZmlsZSBoYXMgYXVkaW8gdHJhY2ssIHNlZW1zIHNv
bWV0aGluZwo+Pj4gdGltZXMgb3V0IGR1cmluZyBvZiB0aGUgYXVkaW8gcGxheWJhY2suIEZvciBu
b3cgSSBkb24ndCBoYXZlIGFueSBtb3JlIGluZm8uCj4+Pgo+Pgo+PiBPaCwgSSBkaWRuJ3Qgc2F5
IGhvdyB0byByZXByb2R1Y2UgaXQuLiBmb3IgZXhhbXBsZSBzaW1wbHkgcGxheWluZwo+PiBiaWdf
YnVja19idW5ueV83MjBwX2gyNjQubW92IGluIE1QViBoYXMgdGhlIGF1ZGlvIHByb2JsZW0uCj4+
Cj4+IGh0dHBzOi8vZG93bmxvYWQuYmxlbmRlci5vcmcvcGVhY2gvYmlnYnVja2J1bm55X21vdmll
cy9iaWdfYnVja19idW5ueV83MjBwX2gyNjQubW92Cj4+Cj4gCj4gSGVsbG8gQmVuLAo+IAo+IERv
IHlvdSBoYXZlIGFueSB1cGRhdGVzPyBJIGp1c3QgcmUtY2hlY2sgd2hldGhlciBwcm9ibGVtIHBl
cnNpc3RzIGFuZAo+IGl0J3Mgc3RpbGwgdGhlcmUgdXNpbmcgYSByZWNlbnQgbGludXgtbmV4dC4K
PiAKPiBJbnRlcmVzdGluZ2x5LCBJIGNhbiBoZWFyIHNvbWUgc291bmQgbm93LCBidXQgaXQncyB2
ZXJ5IGRpc3RvcnRlZC4KPiAKPiBJZiB5b3UgZG9uJ3QgaGF2ZSBhIHNvbHV0aW9uLCB0aGVuIHdo
YXQgYWJvdXQgdG8gcmV2ZXJ0IHRoZSBwYXRjaGVzIGZvcgo+IG5vdyBhbmQgdHJ5IGFnYWluIGxh
dGVyIG9uPwoKSSB3aWxsIHRyeSBhbmQgaGF2ZSBhIGxvb2sgbGF0ZXIsIEkgaGFkIGNvbXBsZXRl
bHkgZm9yZ290dGVuIHRoZXNlIGhhZApiZWVuIG1lcmdlZC4KCgotLSAKQmVuIERvb2tzCQkJCWh0
dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0g
UHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRt
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
