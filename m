Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406AA29879
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 15:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCC016DF;
	Fri, 24 May 2019 15:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCC016DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558703102;
	bh=wuawUNVaeoliRkaDoSVFKVE5ozc7M8BSyr7vvu4Kcfg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE//ZNeTGifuKQi5KcKvoyIAAqNoYzwkTygxtg88RNGlldjUKZ9XjKBrI7tOsftU5
	 qPEUhwkVIzZPJWgDUarAzvIS13uie+KFzP+Vabrc5J21FZaR59PDzBNI4OLPSw51Km
	 YTAjJRlwOw1iDenKiJwP+wZC/zMc2rqNJBjK8Z4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF91F89636;
	Fri, 24 May 2019 15:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B7AF89630; Fri, 24 May 2019 15:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15A83F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 15:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15A83F80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 06:03:11 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO [10.251.128.35])
 ([10.251.128.35])
 by orsmga003.jf.intel.com with ESMTP; 24 May 2019 06:03:09 -0700
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <9019c87f-cf1a-b59f-d87e-8169b247cf88@infradead.org>
 <6b89e370-90e3-6962-c71a-80919b7c6154@linux.intel.com>
 <4cedd724-7c2e-10c2-a328-61f7af3ab9ed@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7d685525-b0fe-429b-f0ea-f363069cf667@linux.intel.com>
Date: Fri, 24 May 2019 08:03:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4cedd724-7c2e-10c2-a328-61f7af3ab9ed@infradead.org>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoc: fix
 sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64
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

CgpPbiA1LzIzLzE5IDk6NTkgUE0sIFJhbmR5IER1bmxhcCB3cm90ZToKPiBPbiA1LzIzLzE5IDQ6
MjggQU0sIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pgo+Pgo+PiBPbiA1LzIyLzE5IDEw
OjU4IFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4+PiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5s
YXBAaW5mcmFkZWFkLm9yZz4KPj4+Cj4+PiBza2wtc3NwLWNsay5jIGRvZXMgbm90IGJ1aWxkIG9u
IElBNjQgYmVjYXVzZSB0aGUgZHJpdmVyCj4+PiB1c2VzIHRoZSBjb21tb24gY2xvY2sgaW50ZXJm
YWNlLCBzbyBtYWtlIHRoZSBkcml2ZXIgZGVwZW5kCj4+PiBvbiBDT01NT05fQ0xLLgo+Pj4KPj4+
IEZpeGVzIHRoaXMgYnVpbGQgZXJyb3I6Cj4+PiAuLi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtc3NwLWNsay5jOjI2OjE2OiBlcnJvcjogZmllbGQgJ2h3JyBoYXMgaW5jb21wbGV0ZSB0eXBl
Cj4+PiAgwqDCoCBzdHJ1Y3QgY2xrX2h3IGh3Owo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF5+Cj4+Pgo+Pj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+Cj4+PiBDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+Pj4gQ2M6
IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5j
b20+Cj4+PiBDYzogTGlhbSBHaXJkd29vZCA8bGlhbS5yLmdpcmR3b29kQGxpbnV4LmludGVsLmNv
bT4KPj4+IENjOiBKaWUgWWFuZyA8eWFuZy5qaWVAbGludXguaW50ZWwuY29tPgo+Pj4gQ2M6IGFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+Pj4gLS0tCj4+PiAgwqAgc291bmQvc29jL2ludGVs
L0tjb25maWfCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDMgKystCj4+PiAgwqAgc291bmQvc29jL2lu
dGVsL2JvYXJkcy9LY29uZmlnIHzCoMKgwqAgMiArLQo+Pj4gIMKgIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IC0tLSBsbngtNTItcmMxLm9y
aWcvc291bmQvc29jL2ludGVsL0tjb25maWcKPj4+ICsrKyBsbngtNTItcmMxL3NvdW5kL3NvYy9p
bnRlbC9LY29uZmlnCj4+PiBAQCAtMTA0LDcgKzEwNCw3IEBAIGNvbmZpZyBTTkRfU1NUX0FUT01f
SElGSTJfUExBVEZPUk1fQUNQSQo+Pj4gIMKgIGNvbmZpZyBTTkRfU09DX0lOVEVMX1NLWUxBS0UK
Pj4+ICDCoMKgwqDCoMKgIHRyaXN0YXRlICJBbGwgU2t5bGFrZS9TU1QgUGxhdGZvcm1zIgo+Pj4g
IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBQQ0kgJiYgQUNQSQo+Pj4gLcKgwqDCoCBzZWxlY3QgU05E
X1NPQ19JTlRFTF9TS0wKPj4+ICvCoMKgwqAgc2VsZWN0IFNORF9TT0NfSU5URUxfU0tMIGlmIENP
TU1PTl9DTEsKPj4KPj4gSXMgdGhpcyByZWFsbHkgbmVjZXNzYXJ5PyBUaGUgQ09NTU9OX0NMSyBp
cyBvbmx5IG5lZWRlZCBmb3IgdGhlIFNORF9TT0NfSU5URUxfU0tZTEFLRV9TU1BfQ0xLIG9wdGlv
biwgaXNuJ3QgaXQ/Cj4gCj4gSXQgcHJldmVudHMgdGhpcyBLY29uZmlnIHdhcm5pbmc6Cj4gCj4g
V0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgU05EX1NPQ19J
TlRFTF9TS0wKPiAgICBEZXBlbmRzIG9uIFtuXTogU09VTkQgWz15XSAmJiAhVU1MICYmIFNORCBb
PXldICYmIFNORF9TT0MgWz15XSAmJiBTTkRfU09DX0lOVEVMX1NTVF9UT1BMRVZFTCBbPXldICYm
IFBDSSBbPXldICYmIEFDUEkgWz15XSAmJiBDT01NT05fQ0xLIFs9bl0KPiAgICBTZWxlY3RlZCBi
eSBbeV06Cj4gICAgLSBTTkRfU09DX0lOVEVMX1NLWUxBS0UgWz15XSAmJiBTT1VORCBbPXldICYm
ICFVTUwgJiYgU05EIFs9eV0gJiYgU05EX1NPQyBbPXldICYmIFNORF9TT0NfSU5URUxfU1NUX1RP
UExFVkVMIFs9eV0gJiYgUENJIFs9eV0gJiYgQUNQSSBbPXldCgpIdW1tLCBvay4gQ2FuIHlvdSBz
aGFyZSB0aGUgY29uZmlnPyBJJ2QgbGlrZSB0byBsb29rIGludG8gdGhpcy4gVGhlcmUgCm1heSBi
ZSBhIG5lZWQgZm9yIHRoaXMgQ09NTU9OX0NMSywgYnV0IGFwcGx5aW5nIGl0IGhlcmUgd291bGQg
bm90IGJlIApmdWxseSBjb3JyZWN0OiB5b3UgY2FuIHVuc2VsZWN0IFNORF9TT0NfSU5URUxfU0tZ
TEFLRSBhbmQgb25seSBzZWxlY3QgClNORF9TT0NfSU5URUxfU0tMIGFuZCBzdGlsbCBoYXZlIHRo
ZSBzYW1lIHByb2JsZW0uCgo+IAo+Pj4gIMKgwqDCoMKgwqAgc2VsZWN0IFNORF9TT0NfSU5URUxf
QVBMCj4+PiAgwqDCoMKgwqDCoCBzZWxlY3QgU05EX1NPQ19JTlRFTF9LQkwKPj4+ICDCoMKgwqDC
oMKgIHNlbGVjdCBTTkRfU09DX0lOVEVMX0dMSwo+Pj4gQEAgLTEyMCw2ICsxMjAsNyBAQCBjb25m
aWcgU05EX1NPQ19JTlRFTF9TS1lMQUtFCj4+PiAgwqAgY29uZmlnIFNORF9TT0NfSU5URUxfU0tM
Cj4+PiAgwqDCoMKgwqDCoCB0cmlzdGF0ZSAiU2t5bGFrZSBQbGF0Zm9ybXMiCj4+PiAgwqDCoMKg
wqDCoCBkZXBlbmRzIG9uIFBDSSAmJiBBQ1BJCj4+PiArwqDCoMKgIGRlcGVuZHMgb24gQ09NTU9O
X0NMSwo+Pj4gIMKgwqDCoMKgwqAgc2VsZWN0IFNORF9TT0NfSU5URUxfU0tZTEFLRV9GQU1JTFkK
Pj4+ICDCoMKgwqDCoMKgIGhlbHAKPj4+ICDCoMKgwqDCoMKgwqDCoCBJZiB5b3UgaGF2ZSBhIElu
dGVsIFNreWxha2UgcGxhdGZvcm0gd2l0aCB0aGUgRFNQIGVuYWJsZWQKPj4+IC0tLSBsbngtNTIt
cmMxLm9yaWcvc291bmQvc29jL2ludGVsL2JvYXJkcy9LY29uZmlnCj4+PiArKysgbG54LTUyLXJj
MS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL0tjb25maWcKPj4+IEBAIC0yODYsNyArMjg2LDcgQEAg
Y29uZmlnIFNORF9TT0NfSU5URUxfS0JMX1JUNTY2M19NQVg5ODkyNwo+Pj4gIMKgwqDCoMKgwqAg
c2VsZWN0IFNORF9TT0NfTUFYOTg5MjcKPj4+ICDCoMKgwqDCoMKgIHNlbGVjdCBTTkRfU09DX0RN
SUMKPj4+ICDCoMKgwqDCoMKgIHNlbGVjdCBTTkRfU09DX0hEQUNfSERNSQo+Pj4gLcKgwqDCoCBz
ZWxlY3QgU05EX1NPQ19JTlRFTF9TS1lMQUtFX1NTUF9DTEsKPj4+ICvCoMKgwqAgc2VsZWN0IFNO
RF9TT0NfSU5URUxfU0tZTEFLRV9TU1BfQ0xLIGlmIENPTU1PTl9DTEsKPj4KPj4gYW5kIGhlcmUg
SSB3b3VsZCBtYWtlIGl0IGEgZGVwZW5kLiBJIGd1ZXNzIHlvdXIgc29sdXRpb24gc29sdmVzIHRo
ZSBjb21waWxhdGlvbiBidXQgZG9lc24ndCBmdWxseSByZXByZXNlbnQgdGhlIGZhY3QgdGhhdCB0
aGlzIG1hY2hpbmUgZHJpdmVyIGlzIG5vdCBmdW5jdGlvbmFsIHdpdGhvdXQgQ09NTU9OX0NMSytT
S1lMQUtFX1NTUF9DTEsuCj4gCj4gTm90IGZ1bmN0aW9uYWwgb24gaWE2NCBhbnl3YXkuICA6KQoK
WWVhaCwgSSBhbSBmaW5lIHdpdGggdGhpcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
