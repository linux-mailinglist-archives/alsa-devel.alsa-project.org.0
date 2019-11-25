Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D40FB108BE4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2019 11:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFE018A5;
	Mon, 25 Nov 2019 11:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFE018A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574678399;
	bh=HDjLG7n+BpV+vxG/Bq83AATjin8/g2mX8TQNaXwo9S8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MywyLO6lLNfOoJW77NOXwKnBeYVe4Kv9HgWFFgd9zdLhioUBKAhsIaa/JIA2MXdVa
	 1Pbszf/p+Rh516YjOQztcYqh/HF3N1HSckXcqR0wf+xRZvumLq6lWeP6xE2d+8P/Nx
	 Yi9UISNa7reCMT01uUpj1zDHp6hYXwPR9h/BCNIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9934F8016F;
	Mon, 25 Nov 2019 11:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1745BF8016F; Mon, 25 Nov 2019 11:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D14BF800AB
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 11:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D14BF800AB
Received: from [167.98.27.226] (helo=[10.35.5.173])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iZBkE-0004VY-OJ; Mon, 25 Nov 2019 10:37:26 +0000
To: Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
Date: Mon, 25 Nov 2019 10:37:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
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

T24gMjMvMTEvMjAxOSAyMTowOSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE4LjEwLjIwMTkg
MTg6NDgsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+PiBGcm9tOiBFZHdhcmQgQ3JhZ2cgPGVkd2Fy
ZC5jcmFnZ0Bjb2RldGhpbmsuY28udWs+Cj4+Cj4+IFRoZSB0ZWdyYTMgYXVkaW8gY2FuIHN1cHBv
cnQgMjQgYW5kIDMyIGJpdCBzYW1wbGUgc2l6ZXMgc28gYWRkIHRoZQo+PiBvcHRpb24gdG8gdGhl
IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyB0byBjb25maWd1cmUgdGhlIFMyNF9MRSBvciBTMzJfTEUK
Pj4gZm9ybWF0cyB3aGVuIHJlcXVlc3RlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRWR3YXJkIENy
YWdnIDxlZHdhcmQuY3JhZ2dAY29kZXRoaW5rLmNvLnVrPgo+PiBbYmVuLmRvb2tzQGNvZGV0aGlu
ay5jby51azogZml4dXAgbWVyZ2Ugb2YgMjQgYW5kIDMyYml0XQo+PiBbYmVuLmRvb2tzQGNvZGV0
aGluay5jby51azogYWRkIHBtIGNhbGxzIGFyb3VuZCB5dGRtIGNvbmZpZ10KPj4gW2Jlbi5kb29r
c0Bjb2RldGhpbmsuY28udWs6IGRyb3AgZGVidWcgcHJpbnRpbmcgdG8gZGV2X2RiZ10KPj4gU2ln
bmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgo+PiAtLS0K
Pj4gc3F1YXNoIDVhZWNhNWEwNTVmZCBBU29DOiB0ZWdyYTogaTJzOiBwbV9ydW50aW1lX2dldF9z
eW5jKCkgaXMgbmVlZGVkIGluIHRkbSBjb2RlCj4+Cj4+IEFTb0M6IHRlZ3JhOiBpMnM6IHBtX3J1
bnRpbWVfZ2V0X3N5bmMoKSBpcyBuZWVkZWQgaW4gdGRtIGNvZGUKPj4gLS0tCj4+ICAgc291bmQv
c29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYyBiL3NvdW5kL3NvYy90
ZWdyYS90ZWdyYTMwX2kycy5jCj4+IGluZGV4IDczZjBkZGRlYWVmMy4uMDYzZjM0Yzg4MmFmIDEw
MDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+PiArKysgYi9zb3Vu
ZC9zb2MvdGVncmEvdGVncmEzMF9pMnMuYwo+PiBAQCAtMTI3LDcgKzEyNyw3IEBAIHN0YXRpYyBp
bnQgdGVncmEzMF9pMnNfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3Ry
ZWFtLAo+PiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkYWktPmRldjsKPj4gICAJc3RydWN0IHRl
Z3JhMzBfaTJzICppMnMgPSBzbmRfc29jX2RhaV9nZXRfZHJ2ZGF0YShkYWkpOwo+PiAgIAl1bnNp
Z25lZCBpbnQgbWFzaywgdmFsLCByZWc7Cj4+IC0JaW50IHJldCwgc2FtcGxlX3NpemUsIHNyYXRl
LCBpMnNjbG9jaywgYml0Y250Owo+PiArCWludCByZXQsIHNhbXBsZV9zaXplLCBzcmF0ZSwgaTJz
Y2xvY2ssIGJpdGNudCwgYXVkaW9fYml0czsKPj4gICAJc3RydWN0IHRlZ3JhMzBfYWh1Yl9jaWZf
Y29uZiBjaWZfY29uZjsKPj4gICAKPj4gICAJaWYgKHBhcmFtc19jaGFubmVscyhwYXJhbXMpICE9
IDIpCj4+IEBAIC0xMzcsOCArMTM3LDE5IEBAIHN0YXRpYyBpbnQgdGVncmEzMF9pMnNfaHdfcGFy
YW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+PiAgIAlzd2l0Y2ggKHBh
cmFtc19mb3JtYXQocGFyYW1zKSkgewo+PiAgIAljYXNlIFNORFJWX1BDTV9GT1JNQVRfUzE2X0xF
Ogo+PiAgIAkJdmFsID0gVEVHUkEzMF9JMlNfQ1RSTF9CSVRfU0laRV8xNjsKPj4gKwkJYXVkaW9f
Yml0cyA9IFRFR1JBMzBfQVVESU9DSUZfQklUU18xNjsKPj4gICAJCXNhbXBsZV9zaXplID0gMTY7
Cj4+ICAgCQlicmVhazsKPj4gKwljYXNlIFNORFJWX1BDTV9GT1JNQVRfUzI0X0xFOgo+PiArCQl2
YWwgPSBURUdSQTMwX0kyU19DVFJMX0JJVF9TSVpFXzI0Owo+PiArCQlhdWRpb19iaXRzID0gVEVH
UkEzMF9BVURJT0NJRl9CSVRTXzI0Owo+PiArCQlzYW1wbGVfc2l6ZSA9IDI0Owo+PiArCQlicmVh
azsKPj4gKwljYXNlIFNORFJWX1BDTV9GT1JNQVRfUzMyX0xFOgo+PiArCQl2YWwgPSBURUdSQTMw
X0kyU19DVFJMX0JJVF9TSVpFXzMyOwo+PiArCQlhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJ
Rl9CSVRTXzMyOwo+PiArCQlzYW1wbGVfc2l6ZSA9IDMyOwo+PiArCQlicmVhazsKPj4gICAJZGVm
YXVsdDoKPj4gICAJCXJldHVybiAtRUlOVkFMOwo+PiAgIAl9Cj4+IEBAIC0xNzAsOCArMTgxLDgg
QEAgc3RhdGljIGludCB0ZWdyYTMwX2kyc19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3Ry
ZWFtICpzdWJzdHJlYW0sCj4+ICAgCWNpZl9jb25mLnRocmVzaG9sZCA9IDA7Cj4+ICAgCWNpZl9j
b25mLmF1ZGlvX2NoYW5uZWxzID0gMjsKPj4gICAJY2lmX2NvbmYuY2xpZW50X2NoYW5uZWxzID0g
MjsKPj4gLQljaWZfY29uZi5hdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+
PiAtCWNpZl9jb25mLmNsaWVudF9iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzE2Owo+PiAr
CWNpZl9jb25mLmF1ZGlvX2JpdHMgPSBhdWRpb19iaXRzOwo+PiArCWNpZl9jb25mLmNsaWVudF9i
aXRzID0gYXVkaW9fYml0czsKPj4gICAJY2lmX2NvbmYuZXhwYW5kID0gMDsKPj4gICAJY2lmX2Nv
bmYuc3RlcmVvX2NvbnYgPSAwOwo+PiAgIAljaWZfY29uZi5yZXBsaWNhdGUgPSAwOwo+PiBAQCAt
MzA2LDE0ICszMTcsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9kcml2ZXIg
dGVncmEzMF9pMnNfZGFpX3RlbXBsYXRlID0gewo+PiAgIAkJLmNoYW5uZWxzX21pbiA9IDIsCj4+
ICAgCQkuY2hhbm5lbHNfbWF4ID0gMiwKPj4gICAJCS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgw
MDBfOTYwMDAsCj4+IC0JCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+ICsJ
CS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+PiArCQkJICAgU05EUlZfUENN
X0ZNVEJJVF9TMjRfTEUgfAo+PiArCQkJICAgU05EUlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+ICAg
CX0sCj4+ICAgCS5jYXB0dXJlID0gewo+PiAgIAkJLnN0cmVhbV9uYW1lID0gIkNhcHR1cmUiLAo+
PiAgIAkJLmNoYW5uZWxzX21pbiA9IDIsCj4+ICAgCQkuY2hhbm5lbHNfbWF4ID0gMiwKPj4gICAJ
CS5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+IC0JCS5mb3JtYXRzID0gU05E
UlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+ICsJCS5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9T
MzJfTEUgfAo+PiArCQkJICAgU05EUlZfUENNX0ZNVEJJVF9TMjRfTEUgfAo+PiArCQkJICAgU05E
UlZfUENNX0ZNVEJJVF9TMTZfTEUsCj4+ICAgCX0sCj4+ICAgCS5vcHMgPSAmdGVncmEzMF9pMnNf
ZGFpX29wcywKPj4gICAJLnN5bW1ldHJpY19yYXRlcyA9IDEsCj4+Cj4gCj4gSGVsbG8sCj4gCj4g
VGhpcyBwYXRjaCBicmVha3MgYXVkaW8gb24gVGVncmEzMC4gSSBkb24ndCBzZWUgZXJyb3JzIGFu
eXdoZXJlLCBidXQKPiB0aGVyZSBpcyBubyBhdWRpbyBhbmQgcmV2ZXJ0aW5nIHRoaXMgcGF0Y2gg
aGVscHMuIFBsZWFzZSBmaXggaXQuCgpXaGF0IGlzIHRoZSBmYWlsdXJlIG1vZGU/IEkgY2FuIHRy
eSBhbmQgdGFrZSBhIGxvb2sgYXQgdGhpcyBzb21lIHRpbWUKdGhpcyB3ZWVrLCBidXQgSSBhbSBu
b3Qgc3VyZSBpZiBJIGhhdmUgYW55IGJvYXJkcyB3aXRoIGFuIGFjdHVhbCB1c2VmdWwKYXVkaW8g
b3V0cHV0PwoKLS0gCkJlbiBEb29rcwkJCQlodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KU2Vu
aW9yIEVuZ2luZWVyCQkJCUNvZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3
LmNvZGV0aGluay5jby51ay9wcml2YWN5Lmh0bWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
