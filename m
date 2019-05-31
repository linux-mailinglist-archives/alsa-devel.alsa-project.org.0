Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B458031432
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 19:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B461165D;
	Fri, 31 May 2019 19:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B461165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559325074;
	bh=X/mls8I3lTjJhEcCJJcyFht41EnuSDabNJ/+yM9lMJE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ukp0XeXHc7fe5QD62kkOsfDJgWFxiklWyH/D8+VJ80DAop5EWgTGbD3PJD4C9PLcE
	 Q2KGr3GFiUT9sVuYYazbCDhCB3Edke+dKWMx2ezTeqc+gcwTxUggJkaw5+alYUbldv
	 x0nSaLPHUUGgNUYq48geYotoksKHudvcsi1uc5sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE90BF896E8;
	Fri, 31 May 2019 19:49:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 594B4F896E5; Fri, 31 May 2019 19:49:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C03CF8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 19:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C03CF8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 10:49:15 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 31 May 2019 10:49:15 -0700
Received: from mayurda-mobl.amr.corp.intel.com (unknown [10.252.130.8])
 by linux.intel.com (Postfix) with ESMTP id BCAD0580105;
 Fri, 31 May 2019 10:49:14 -0700 (PDT)
To: =?UTF-8?B?S292w6FjcyBUYW3DoXM=?= <kepszlok@zohomail.eu>,
 alsa-devel@alsa-project.org
References: <20190531172226.7114-1-kepszlok@zohomail.eu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <97104d01-848b-a980-42b1-e0af00efc0b4@linux.intel.com>
Date: Fri, 31 May 2019 12:49:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531172226.7114-1-kepszlok@zohomail.eu>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH V3] ASoC: Intel: Baytrail: add quirk for
 Aegex 10 (RU2) tablet
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

T24gNS8zMS8xOSAxMjoyMiBQTSwgS292w6FjcyBUYW3DoXMgd3JvdGU6Cj4gVGhpcyB0YWJsZXQg
aGFzIGFuIGluY29ycmVjdCBhY3BpIGlkZW50aWZpZXIganVzdCBsaWtlCj4gVGhpbmtwYWQxMCB0
YWJsZXQsIHdoaWNoIGlzIHdoeSBpdCBpcyB0cnlpbmcgdG8gbG9hZCB0aGUgUlQ1NjQwIGRyaXZl
cgo+IGluc3RlYWQgb2YgdGhlIFJUNTc2MiBkcml2ZXIuIFRoZSBSVDU2NDAgZHJpdmVyLCBvbiB0
aGUgb3RoZXIgaGFuZCwgY2hlY2tzCj4gdGhlIGhhcmR3YXJlIElELCBzbyBubyBkcml2ZXIgYXJl
IGxvYWRlZCBkdXJpbmcgYm9vdC4gVGhpcyBmaXggcmVzb2x2ZXMgdG8KPiBsb2FkIHRoZSBSVDU2
NzIgZHJpdmVyIG9uIHRoaXMgdGFibGV0IGR1cmluZyBib290LiBJdCBhbHNvIHByb3ZpZGVzIHRo
ZQo+IGNvcnJlY3QgSU8gY29uZmlndXJhdGlvbiwgbGlrZSB0aGUgamFjayBkZXRlY3QgbW9kZSAz
LCBmb3IgMS44ViBwdWxsdXAuIEkKPiB3b3VsZCBsaWtlIHRvIHRoYW5rIFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0IGZvciBoZWxwaW5nIHdpdGggdGhpcyBwYXRjaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBL
b3bDoWNzIFRhbcOhcyA8a2Vwc3psb2tAem9ob21haWwuZXU+CgpUaGFua3MsIGxvb2tzIGdvb2Qg
bm93IQoKQWNrZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2Fy
dEBsaW51eC5pbnRlbC5jb20+CgoKCj4gLS0tCj4gICBzb3VuZC9zb2MvY29kZWNzL3J0NTY3MC5j
ICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysrKwo+ICAgLi4uL3NvYy9pbnRl
bC9jb21tb24vc29jLWFjcGktaW50ZWwtYnl0LW1hdGNoLmMgfCAxNyArKysrKysrKysrKysrKysr
Kwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY3MC5jCj4g
aW5kZXggOWEwMzcxMDhiMWFlLi5hNzQ2ZTExY2NmZTMgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29j
L2NvZGVjcy9ydDU2NzAuYwo+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjcwLmMKPiBAQCAt
Mjg4Miw2ICsyODgyLDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBkbWlf
cGxhdGZvcm1faW50ZWxfcXVpcmtzW10gPSB7Cj4gICAJCQkJCQkgUlQ1NjcwX0RFVl9HUElPIHwK
PiAgIAkJCQkJCSBSVDU2NzBfSkRfTU9ERTMpLAo+ICAgCX0sCj4gKwl7Cj4gKwkJLmNhbGxiYWNr
ID0gcnQ1NjcwX3F1aXJrX2NiLAo+ICsJCS5pZGVudCA9ICJBZWdleCAxMCB0YWJsZXQgKFJVMiki
LAo+ICsJCS5tYXRjaGVzID0gewo+ICsJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJBRUdF
WCIpLAo+ICsJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIlJVMiIpLAo+ICsJCX0s
Cj4gKwkJLmRyaXZlcl9kYXRhID0gKHVuc2lnbmVkIGxvbmcgKikoUlQ1NjcwX0RNSUNfRU4gfAo+
ICsJCQkJCQkgUlQ1NjcwX0RNSUMyX0lOUiB8Cj4gKwkJCQkJCSBSVDU2NzBfREVWX0dQSU8gfAo+
ICsJCQkJCQkgUlQ1NjcwX0pEX01PREUzKSwKPiArCX0sCj4gICAJe30KPiAgIH07Cj4gICAKPiBk
aWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0
Y2guYyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGktaW50ZWwtYnl0LW1hdGNoLmMK
PiBpbmRleCAwY2ZhYjI0Nzg3NmEuLjlmYjU4ZjFmMDk1ZiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9z
b2MvaW50ZWwvY29tbW9uL3NvYy1hY3BpLWludGVsLWJ5dC1tYXRjaC5jCj4gKysrIGIvc291bmQv
c29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1ieXQtbWF0Y2guYwo+IEBAIC0yMiw2ICsy
Miw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGJ5dF9tYWNoaW5lX2lkOwo+ICAgCj4gICAjZGVm
aW5lIEJZVF9USElOS1BBRF8xMCAgMQo+ICAgI2RlZmluZSBCWVRfUE9WX1AxMDA2VyAgIDIKPiAr
I2RlZmluZSBCWVRfQUVHRVhfMTAgICAgIDMKPiAgIAo+ICAgc3RhdGljIGludCBieXRfdGhpbmtw
YWQxMF9xdWlya19jYihjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCAqaWQpCj4gICB7Cj4gQEAg
LTM1LDYgKzM2LDEyIEBAIHN0YXRpYyBpbnQgYnl0X3Bvdl9wMTAwNndfcXVpcmtfY2IoY29uc3Qg
c3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkKQo+ICAgCXJldHVybiAxOwo+ICAgfQo+ICAgCj4gK3N0
YXRpYyBpbnQgYnl0X2FlZ2V4MTBfcXVpcmtfY2IoY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQg
KmlkKQo+ICt7Cj4gKwlieXRfbWFjaGluZV9pZCA9IEJZVF9BRUdFWF8xMDsKPiArCXJldHVybiAx
Owo+ICt9Cj4gKwo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJ5dF90YWJs
ZVtdID0gewo+ICAgCXsKPiAgIAkJLmNhbGxiYWNrID0gYnl0X3RoaW5rcGFkMTBfcXVpcmtfY2Is
Cj4gQEAgLTc1LDkgKzgyLDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBi
eXRfdGFibGVbXSA9IHsKPiAgIAkJCURNSV9FWEFDVF9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjBF
NTciKSwKPiAgIAkJfSwKPiAgIAl9LAo+ICsJewo+ICsJCS8qIEFlZ2V4IDEwIHRhYmxldCAoUlUy
KSAqLwo+ICsJCS5jYWxsYmFjayA9IGJ5dF9hZWdleDEwX3F1aXJrX2NiLAo+ICsJCS5tYXRjaGVz
ID0gewo+ICsJCQlETUlfTUFUQ0goRE1JX1NZU19WRU5ET1IsICJBRUdFWCIpLAo+ICsJCQlETUlf
TUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lPTiwgIlJVMiIpLAo+ICsJCX0sCj4gKwl9LAo+ICAgCXsg
fQo+ICAgfTsKPiAgIAo+ICsvKiBUaGUgVGhpbmthcGQgMTAgYW5kIEFlZ2V4IDEwIHRhYmxldHMg
aGF2ZSB0aGUgc2FtZSBJRCBwcm9ibGVtICovCj4gICBzdGF0aWMgc3RydWN0IHNuZF9zb2NfYWNw
aV9tYWNoIGJ5dF90aGlua3BhZF8xMCA9IHsKPiAgIAkuaWQgPSAiMTBFQzU2NDAiLAo+ICAgCS5k
cnZfbmFtZSA9ICJjaHQtYnN3LXJ0NTY3MiIsCj4gQEAgLTEwNCw2ICsxMjAsNyBAQCBzdGF0aWMg
c3RydWN0IHNuZF9zb2NfYWNwaV9tYWNoICpieXRfcXVpcmsodm9pZCAqYXJnKQo+ICAgCj4gICAJ
c3dpdGNoIChieXRfbWFjaGluZV9pZCkgewo+ICAgCWNhc2UgQllUX1RISU5LUEFEXzEwOgo+ICsJ
Y2FzZSBCWVRfQUVHRVhfMTA6Cj4gICAJCXJldHVybiAmYnl0X3RoaW5rcGFkXzEwOwo+ICAgCWNh
c2UgQllUX1BPVl9QMTAwNlc6Cj4gICAJCXJldHVybiAmYnl0X3Bvdl9wMTAwNnc7Cj4gCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
