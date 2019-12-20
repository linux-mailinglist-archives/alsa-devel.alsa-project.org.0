Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D40127A1D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 12:40:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EE8E165D;
	Fri, 20 Dec 2019 12:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EE8E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576842011;
	bh=LJVLmRV3jY0ZqhPzda8HXN9+t1uIWCNkMeRE/fhGgHg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSDHBTy4R5OBKgdbtIhDDtwR/qr2GHq/u2+CLK2JgU66FIUIqW/5/vyS9HGvnnQk4
	 2wPmSSdA5EFdZM60qm0khvxmsW30qXoWjbZQ/TFVuk8RtFMcT3H11KGMKml75xbDsf
	 hK6QH1lnGnlxuZQ4TpcuYgDjWr6ZTXEfQ87jgOq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5622F8014C;
	Fri, 20 Dec 2019 12:38:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B8CF8015A; Fri, 20 Dec 2019 12:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCDC4F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 12:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCDC4F800B5
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1iiGbf-00059E-FE; Fri, 20 Dec 2019 11:38:07 +0000
To: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
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
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
Date: Fri, 20 Dec 2019 11:38:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
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

T24gMjAvMTIvMjAxOSAxMTozMCwgSm9uIEh1bnRlciB3cm90ZToKPiAKPiBPbiAyNS8xMS8yMDE5
IDE3OjI4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDI1LjExLjIwMTkgMjA6MjIsIERtaXRy
eSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4gMjUuMTEuMjAxOSAxMzozNywgQmVuIERvb2tzINC/
0LjRiNC10YI6Cj4+Pj4gT24gMjMvMTEvMjAxOSAyMTowOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3Rl
Ogo+Pj4+PiAxOC4xMC4yMDE5IDE4OjQ4LCBCZW4gRG9va3Mg0L/QuNGI0LXRgjoKPj4+Pj4+IEZy
b206IEVkd2FyZCBDcmFnZyA8ZWR3YXJkLmNyYWdnQGNvZGV0aGluay5jby51az4KPj4+Pj4+Cj4+
Pj4+PiBUaGUgdGVncmEzIGF1ZGlvIGNhbiBzdXBwb3J0IDI0IGFuZCAzMiBiaXQgc2FtcGxlIHNp
emVzIHNvIGFkZCB0aGUKPj4+Pj4+IG9wdGlvbiB0byB0aGUgdGVncmEzMF9pMnNfaHdfcGFyYW1z
IHRvIGNvbmZpZ3VyZSB0aGUgUzI0X0xFIG9yIFMzMl9MRQo+Pj4+Pj4gZm9ybWF0cyB3aGVuIHJl
cXVlc3RlZC4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgQ3JhZ2cgPGVkd2Fy
ZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Pj4+PiBbYmVuLmRvb2tzQGNvZGV0aGluay5jby51
azogZml4dXAgbWVyZ2Ugb2YgMjQgYW5kIDMyYml0XQo+Pj4+Pj4gW2Jlbi5kb29rc0Bjb2RldGhp
bmsuY28udWs6IGFkZCBwbSBjYWxscyBhcm91bmQgeXRkbSBjb25maWddCj4+Pj4+PiBbYmVuLmRv
b2tzQGNvZGV0aGluay5jby51azogZHJvcCBkZWJ1ZyBwcmludGluZyB0byBkZXZfZGJnXQo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+
Pj4+Pj4gLS0tCj4+Pj4+PiBzcXVhc2ggNWFlY2E1YTA1NWZkIEFTb0M6IHRlZ3JhOiBpMnM6IHBt
X3J1bnRpbWVfZ2V0X3N5bmMoKSBpcyBuZWVkZWQKPj4+Pj4+IGluIHRkbSBjb2RlCj4+Pj4+Pgo+
Pj4+Pj4gQVNvQzogdGVncmE6IGkyczogcG1fcnVudGltZV9nZXRfc3luYygpIGlzIG5lZWRlZCBp
biB0ZG0gY29kZQo+Pj4+Pj4gLS0tCj4+Pj4+PiAgwqAgc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBf
aTJzLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+Pj4+PiAgwqAgMSBmaWxlIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+PiBiL3NvdW5kL3Nv
Yy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+Pj4+PiBpbmRleCA3M2YwZGRkZWFlZjMuLjA2M2YzNGM4
ODJhZiAxMDA2NDQKPj4+Pj4+IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYTMwX2kycy5jCj4+
Pj4+PiArKysgYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+Pj4+Pj4gQEAgLTEyNyw3
ICsxMjcsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4+
IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSBkYWktPmRldjsKPj4+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCB0ZWdyYTMw
X2kycyAqaTJzID0gc25kX3NvY19kYWlfZ2V0X2RydmRhdGEoZGFpKTsKPj4+Pj4+ICDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBtYXNrLCB2YWwsIHJlZzsKPj4+Pj4+IC3CoMKgwqAgaW50IHJldCwg
c2FtcGxlX3NpemUsIHNyYXRlLCBpMnNjbG9jaywgYml0Y250Owo+Pj4+Pj4gK8KgwqDCoCBpbnQg
cmV0LCBzYW1wbGVfc2l6ZSwgc3JhdGUsIGkyc2Nsb2NrLCBiaXRjbnQsIGF1ZGlvX2JpdHM7Cj4+
Pj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgdGVncmEzMF9haHViX2NpZl9jb25mIGNpZl9jb25mOwo+
Pj4+Pj4gIMKgIMKgwqDCoMKgwqAgaWYgKHBhcmFtc19jaGFubmVscyhwYXJhbXMpICE9IDIpCj4+
Pj4+PiBAQCAtMTM3LDggKzEzNywxOSBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFt
cyhzdHJ1Y3QKPj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+PiAgwqDC
oMKgwqDCoCBzd2l0Y2ggKHBhcmFtc19mb3JtYXQocGFyYW1zKSkgewo+Pj4+Pj4gIMKgwqDCoMKg
wqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MxNl9MRToKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqAgdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8xNjsKPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+Pj4+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoCBzYW1wbGVfc2l6ZSA9IDE2Owo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1MyNF9MRToKPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzI0Owo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNf
MjQ7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAyNDsKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+ICvCoMKgwqAgY2FzZSBTTkRSVl9QQ01fRk9STUFUX1Mz
Ml9MRToKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB2YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9T
SVpFXzMyOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGF1ZGlvX2JpdHMgPSBURUdSQTMwX0FVRElP
Q0lGX0JJVFNfMzI7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc2FtcGxlX3NpemUgPSAzMjsKPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+Pj4+ICDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4gIMKgwqDCoMKg
wqAgfQo+Pj4+Pj4gQEAgLTE3MCw4ICsxODEsOCBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3
X3BhcmFtcyhzdHJ1Y3QKPj4+Pj4+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sCj4+Pj4+
PiAgwqDCoMKgwqDCoCBjaWZfY29uZi50aHJlc2hvbGQgPSAwOwo+Pj4+Pj4gIMKgwqDCoMKgwqAg
Y2lmX2NvbmYuYXVkaW9fY2hhbm5lbHMgPSAyOwo+Pj4+Pj4gIMKgwqDCoMKgwqAgY2lmX2NvbmYu
Y2xpZW50X2NoYW5uZWxzID0gMjsKPj4+Pj4+IC3CoMKgwqAgY2lmX2NvbmYuYXVkaW9fYml0cyA9
IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4+Pj4+IC3CoMKgwqAgY2lmX2NvbmYuY2xpZW50
X2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7Cj4+Pj4+PiArwqDCoMKgIGNpZl9jb25m
LmF1ZGlvX2JpdHMgPSBhdWRpb19iaXRzOwo+Pj4+Pj4gK8KgwqDCoCBjaWZfY29uZi5jbGllbnRf
Yml0cyA9IGF1ZGlvX2JpdHM7Cj4+Pj4+PiAgwqDCoMKgwqDCoCBjaWZfY29uZi5leHBhbmQgPSAw
Owo+Pj4+Pj4gIMKgwqDCoMKgwqAgY2lmX2NvbmYuc3RlcmVvX2NvbnYgPSAwOwo+Pj4+Pj4gIMKg
wqDCoMKgwqAgY2lmX2NvbmYucmVwbGljYXRlID0gMDsKPj4+Pj4+IEBAIC0zMDYsMTQgKzMxNywx
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgo+Pj4+Pj4gdGVncmEz
MF9pMnNfZGFpX3RlbXBsYXRlID0gewo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5l
bHNfbWluID0gMiwKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgLmNoYW5uZWxzX21heCA9IDIs
Cj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBf
OTYwMDAsCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgLmZvcm1hdHMgPSBTTkRSVl9QQ01fRk1UQklU
X1MxNl9MRSwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRC
SVRfUzMyX0xFIHwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNORFJWX1BD
TV9GTVRCSVRfUzI0X0xFIHwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNO
RFJWX1BDTV9GTVRCSVRfUzE2X0xFLAo+Pj4+Pj4gIMKgwqDCoMKgwqAgfSwKPj4+Pj4+ICDCoMKg
wqDCoMKgIC5jYXB0dXJlID0gewo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RyZWFtX25h
bWUgPSAiQ2FwdHVyZSIsCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC5jaGFubmVsc19taW4g
PSAyLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAuY2hhbm5lbHNfbWF4ID0gMiwKPj4+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwK
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCAuZm9ybWF0cyA9IFNORFJWX1BDTV9GTVRCSVRfUzE2X0xF
LAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJf
TEUgfAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENNX0ZNVEJJ
VF9TMjRfTEUgfAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU05EUlZfUENN
X0ZNVEJJVF9TMTZfTEUsCj4+Pj4+PiAgwqDCoMKgwqDCoCB9LAo+Pj4+Pj4gIMKgwqDCoMKgwqAg
Lm9wcyA9ICZ0ZWdyYTMwX2kyc19kYWlfb3BzLAo+Pj4+Pj4gIMKgwqDCoMKgwqAgLnN5bW1ldHJp
Y19yYXRlcyA9IDEsCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBIZWxsbywKPj4+Pj4KPj4+Pj4gVGhpcyBw
YXRjaCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBzZWUgZXJyb3JzIGFueXdoZXJl
LCBidXQKPj4+Pj4gdGhlcmUgaXMgbm8gYXVkaW8gYW5kIHJldmVydGluZyB0aGlzIHBhdGNoIGhl
bHBzLiBQbGVhc2UgZml4IGl0Lgo+Pj4+Cj4+Pj4gV2hhdCBpcyB0aGUgZmFpbHVyZSBtb2RlPyBJ
IGNhbiB0cnkgYW5kIHRha2UgYSBsb29rIGF0IHRoaXMgc29tZSB0aW1lCj4+Pj4gdGhpcyB3ZWVr
LCBidXQgSSBhbSBub3Qgc3VyZSBpZiBJIGhhdmUgYW55IGJvYXJkcyB3aXRoIGFuIGFjdHVhbCB1
c2VmdWwKPj4+PiBhdWRpbyBvdXRwdXQ/Cj4+Pgo+Pj4gVGhlIGZhaWx1cmUgbW9kZSBpcyB0aGF0
IHRoZXJlIG5vIHNvdW5kLiBJIGFsc28gbm90aWNlZCB0aGF0IHZpZGVvCj4+PiBwbGF5YmFjayBz
dHV0dGVycyBhIGxvdCBpZiBtb3ZpZSBmaWxlIGhhcyBhdWRpbyB0cmFjaywgc2VlbXMgc29tZXRo
aW5nCj4+PiB0aW1lcyBvdXQgZHVyaW5nIG9mIHRoZSBhdWRpbyBwbGF5YmFjay4gRm9yIG5vdyBJ
IGRvbid0IGhhdmUgYW55IG1vcmUgaW5mby4KPj4+Cj4+Cj4+IE9oLCBJIGRpZG4ndCBzYXkgaG93
IHRvIHJlcHJvZHVjZSBpdC4uIGZvciBleGFtcGxlIHNpbXBseSBwbGF5aW5nCj4+IGJpZ19idWNr
X2J1bm55XzcyMHBfaDI2NC5tb3YgaW4gTVBWIGhhcyB0aGUgYXVkaW8gcHJvYmxlbS4KPj4KPj4g
aHR0cHM6Ly9kb3dubG9hZC5ibGVuZGVyLm9yZy9wZWFjaC9iaWdidWNrYnVubnlfbW92aWVzL2Jp
Z19idWNrX2J1bm55XzcyMHBfaDI2NC5tb3YKPiAKPiBHaXZlbiB0aGF0IHRoZSBhdWRpbyBkcml2
ZXJzIHVzZXMgcmVnbWFwLCBpdCBjb3VsZCBiZSBnb29kIHRvIGR1bXAgdGhlCj4gSTJTL0FIVUIg
cmVnaXN0ZXJzIHdoaWxlIHRoZSBjbGlwIGlmIHBsYXlpbmcgd2l0aCBhbmQgd2l0aG91dCB0aGlz
IHBhdGNoCj4gdG8gc2VlIHRoZSBkaWZmZXJlbmNlcy4gSSBhbSBjdXJpb3VzIGlmIHRoZSBhdWRp
byBpcyBub3cgYmVpbmcgcGxheWVkIGFzCj4gMjQgb3IgMzItYml0IGluc3RlYWQgb2YgMTYtYml0
IG5vdyB0aGVzZSBhcmUgYXZhaWxhYmxlLgo+IAo+IFlvdSBjb3VsZCBhbHNvIGR1bXAgdGhlIGh3
X3BhcmFtcyB0byBzZWUgdGhlIGZvcm1hdCB3aGlsZSBwbGF5aW5nIGFzCj4gd2VsbCAuLi4KPiAK
PiAkIC9wcm9jL2Fzb3VuZC88c2NhcmQtbmFtZT4vcGNtMHAvc3ViMC9od19wYXJhbXMKCkkgc3Vw
cG9zZSBpdCBpcyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhlIGNvZGVjIGlzbid0IHByb3Blcmx5IGRv
aW5nID4xNgpiaXRzIGFuZCB0aGUgZmFjdCB3ZSBub3cgb2ZmZXIgMjQgYW5kIDMyIGNvdWxkIGJl
IGFuIGlzc3VlLiBJJ3ZlIG5vdApnb3QgYW55dGhpbmcgd2l0aCBhbiBhdWRpbyBvdXRwdXQgb24g
aXQgdGhhdCB3b3VsZCBiZSBlYXN5IHRvIHRlc3QuCgoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8v
d3d3LmNvZGV0aGluay5jby51ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3Zp
ZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBt
YWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
