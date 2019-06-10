Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F53AF6C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 09:19:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A94B16B4;
	Mon, 10 Jun 2019 09:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A94B16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560151169;
	bh=YDAoRF80fAiYMJQIhoAkPhm2PkAHwIf/aJrpbQdb8vE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLv1G+l+FL6IeL8abVF7VmiKPKXUzbTGvCBB29DvMP/IGXbU1w9zogtf0uXIEI2a4
	 H4fZVFSXBx0M6aCzfbqASgG+IRMdrHR7GhmWmhNuDE6etEZzxWydaiQI+sg0QITtgs
	 DlBZ7VcbWCp9Yl5ozV4miQeyl2BSXPjzgR79lQVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E78EF896E0;
	Mon, 10 Jun 2019 09:17:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 057EBF896E0; Mon, 10 Jun 2019 09:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CB6F80791
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 09:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CB6F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 00:17:24 -0700
X-ExtLoop1: 1
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.187])
 ([10.237.137.187])
 by orsmga007.jf.intel.com with ESMTP; 10 Jun 2019 00:17:22 -0700
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
 <20190605134556.10322-9-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <36e24c2a-feb4-4c6f-7bc5-76b13ff625a3@intel.com>
Date: Mon, 10 Jun 2019 09:17:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605134556.10322-9-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 08/14] ASoC: Intel: Skylake: Properly
 cleanup on component removal
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

T24gMjAxOS0wNi0wNSAxNTo0NSwgQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6Cj4gV2hlbiB3
ZSByZW1vdmUgY29tcG9uZW50IHdlIG5lZWQgdG8gcmV2ZXJzZSB0aGluZ3Mgd2hpY2ggd2VyZSBk
b25lIG9uCj4gaW5pdCwgdGhpcyBjb25zaXN0cyBvZiB0b3BvbG9neSBjbGVhbnVwLCBsaXN0cyBj
bGVhbnVwIGFuZCByZWxlYXNpbmcKPiBmaXJtd2FyZS4KPiAKPiBDdXJyZW50bHkgY2xlYW51cCBo
YW5kbGVycyBhcmUgcHV0IGluIHdyb25nIHBsYWNlcyBvciBvdGhlcndpc2UgbWlzc2luZy4KPiBT
byBhZGQgcHJvcGVyIGNvbXBvbmVudCBjbGVhbnVwIGZ1bmN0aW9uIGFuZCBwZXJmb3JtIGNsZWFu
dXBzIGluIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFk
ZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgIHNvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC1wY20uYyAgICAgIHwgIDggKysrKysrLS0KPiAgIHNvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC10b3BvbG9neS5jIHwgMTUgKysrKysrKysrKysrKysrCj4gICBzb3VuZC9z
b2MvaW50ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuaCB8ICAyICsrCj4gICBzb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wuYyAgICAgICAgICB8ICAyIC0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1w
Y20uYwo+IGluZGV4IDQ0MDYyODA2ZmJlZC4uN2U4MTEwYzE1MjU4IDEwMDY0NAo+IC0tLSBhL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYwo+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9z
a3lsYWtlL3NrbC1wY20uYwo+IEBAIC0xNDU5LDggKzE0NTksMTIgQEAgc3RhdGljIGludCBza2xf
cGxhdGZvcm1fc29jX3Byb2JlKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50KQo+
ICAgCj4gICBzdGF0aWMgdm9pZCBza2xfcGNtX3JlbW92ZShzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKmNvbXBvbmVudCkKPiAgIHsKPiAtCS8qIHJlbW92ZSB0b3BvbG9neSAqLwo+IC0Jc25kX3Nv
Y190cGxnX2NvbXBvbmVudF9yZW1vdmUoY29tcG9uZW50LCBTTkRfU09DX1RQTEdfSU5ERVhfQUxM
KTsKPiArCXN0cnVjdCBoZGFjX2J1cyAqYnVzID0gZGV2X2dldF9kcnZkYXRhKGNvbXBvbmVudC0+
ZGV2KTsKPiArCXN0cnVjdCBza2wgKnNrbCA9IGJ1c190b19za2woYnVzKTsKPiArCj4gKwlza2xf
dHBsZ19leGl0KGNvbXBvbmVudCwgYnVzKTsKPiArCj4gKwlza2xfZGVidWdmc19leGl0KHNrbCk7
Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnRfZHJp
dmVyIHNrbF9jb21wb25lbnQgID0gewo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtdG9wb2xvZ3kuYyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9n
eS5jCj4gaW5kZXggNDRmM2IyOWE3MjEwLi4zOTY0MjYyMTA5YWMgMTAwNjQ0Cj4gLS0tIGEvc291
bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMKPiArKysgYi9zb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuYwo+IEBAIC0zNzQ4LDMgKzM3NDgsMTggQEAgaW50IHNr
bF90cGxnX2luaXQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsIHN0cnVjdCBo
ZGFjX2J1cyAqYnVzKQo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gKwo+ICt2b2lkIHNrbF90
cGxnX2V4aXQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsIHN0cnVjdCBoZGFj
X2J1cyAqYnVzKQo+ICt7Cj4gKwlzdHJ1Y3Qgc2tsICpza2wgPSBidXNfdG9fc2tsKGJ1cyk7Cj4g
KwlzdHJ1Y3Qgc2tsX3BpcGVsaW5lICpwcGwsICp0bXA7Cj4gKwo+ICsJaWYgKCFsaXN0X2VtcHR5
KCZza2wtPnBwbF9saXN0KSkKPiArCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocHBsLCB0bXAs
ICZza2wtPnBwbF9saXN0LCBub2RlKQo+ICsJCQlsaXN0X2RlbCgmcHBsLT5ub2RlKTsKPiArCj4g
KwkvKiBjbGVhbiB1cCB0b3BvbG9neSAqLwo+ICsJc25kX3NvY190cGxnX2NvbXBvbmVudF9yZW1v
dmUoY29tcG9uZW50LCBTTkRfU09DX1RQTEdfSU5ERVhfQUxMKTsKPiArCj4gKwlyZWxlYXNlX2Zp
cm13YXJlKHNrbC0+dHBsZyk7Cj4gK30KCkluIGRlYnVnZnMgY2xlYW51cCBwYXRjaDoKW1BBVENI
IDA3LzE0XSBBU29DOiBJbnRlbDogU2t5bGFrZTogQWRkIGZ1bmN0aW9uIHRvIGNsZWFudXAgZGVi
dWdmcyAKaW50ZXJmYWNlCgp5b3UgZGVmaW5lIHNrbF9kZWJ1Z2ZzX2V4aXQgc2VwYXJhdGVseSAt
IGl0cyB1c2FnZSBpcyBzcGxpdCBhbmQgcHJlc2VudCAKaW4gdGhpcyB2ZXJ5IHBhdGNoIGluc3Rl
YWQuIEhvd2V2ZXIsIGZvciB0cGxnIGNvdW50ZXJwYXJ0IC0gCnNrbF90cGxnX2V4aXQgLSB5b3Un
dmUgZGVjaWRlZCB0byBjb21iaW5lIGJvdGggdG9nZXRoZXIuIFdoeSBub3QgCnNlcGFyYXRlIHRw
bGcgY2xlYW51cCB0b28/Cgo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtdG9wb2xvZ3kuaCBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5oCj4g
aW5kZXggODIyODJjYWM5NzUxLi43ZDMyYzYxYzczZTcgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmgKPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtdG9wb2xvZ3kuaAo+IEBAIC00NzEsNiArNDcxLDggQEAgdm9pZCBza2xfdHBsZ19z
ZXRfYmVfZG1pY19jb25maWcoc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4gICAJc3RydWN0IHNr
bF9waXBlX3BhcmFtcyAqcGFyYW1zLCBpbnQgc3RyZWFtKTsKPiAgIGludCBza2xfdHBsZ19pbml0
KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LAo+ICAgCQkJCXN0cnVjdCBoZGFj
X2J1cyAqZWJ1cyk7Cj4gK3ZvaWQgc2tsX3RwbGdfZXhpdChzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKmNvbXBvbmVudCwKPiArCQkJCXN0cnVjdCBoZGFjX2J1cyAqYnVzKTsKPiAgIHN0cnVjdCBz
a2xfbW9kdWxlX2NmZyAqc2tsX3RwbGdfZmVfZ2V0X2Nwcl9tb2R1bGUoCj4gICAJCXN0cnVjdCBz
bmRfc29jX2RhaSAqZGFpLCBpbnQgc3RyZWFtKTsKPiAgIGludCBza2xfdHBsZ191cGRhdGVfcGlw
ZV9wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wuYyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5jCj4gaW5kZXgg
NmQ2NDAxNDEwMjUwLi5lNDg4MWZmNDI3ZWEgMTAwNjQ0Cj4gLS0tIGEvc291bmQvc29jL2ludGVs
L3NreWxha2Uvc2tsLmMKPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYwo+IEBA
IC0xMTE5LDE0ICsxMTE5LDEyIEBAIHN0YXRpYyB2b2lkIHNrbF9yZW1vdmUoc3RydWN0IHBjaV9k
ZXYgKnBjaSkKPiAgIAlzdHJ1Y3Qgc2tsICpza2wgPSBidXNfdG9fc2tsKGJ1cyk7Cj4gICAKPiAg
IAljYW5jZWxfd29ya19zeW5jKCZza2wtPnByb2JlX3dvcmspOwo+IC0JcmVsZWFzZV9maXJtd2Fy
ZShza2wtPnRwbGcpOwo+ICAgCj4gICAJcG1fcnVudGltZV9nZXRfbm9yZXN1bWUoJnBjaS0+ZGV2
KTsKPiAgIAo+ICAgCS8qIGNvZGVjIHJlbW92YWwsIGludm9rZSBidXNfZGV2aWNlX3JlbW92ZSAq
Lwo+ICAgCXNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX3JlbW92ZShidXMpOwo+ICAgCj4gLQlza2wt
PmRlYnVnZnMgPSBOVUxMOwo+ICAgCXNrbF9wbGF0Zm9ybV91bnJlZ2lzdGVyKCZwY2ktPmRldik7
Cj4gICAJc2tsX2ZyZWVfZHNwKHNrbCk7Cj4gICAJc2tsX21hY2hpbmVfZGV2aWNlX3VucmVnaXN0
ZXIoc2tsKTsKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
