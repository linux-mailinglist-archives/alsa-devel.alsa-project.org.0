Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9978546E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 22:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B8B81667;
	Wed,  7 Aug 2019 22:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B8B81667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565209172;
	bh=1ghRHomeCdZrDkl+anEyZstxK1ErOul2C7qfsxkB0M4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNdu1EIFwW+z+ia1perf/aEzIDv+PNjx05I/g0iClbMBds8yNDYBPuGIMj9tmNUB7
	 AxKy+iFVwjwoVoQg0qMQ7dQmDAA+G/hdgQQ/KkG7EWd2xEsIzwG0VbpZLxNvxJbZmY
	 /u5LNaaNxp+GQWJN5RF6zleco6R14onKx10UsHiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46DEBF80227;
	Wed,  7 Aug 2019 22:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FCF2F80290; Wed,  7 Aug 2019 22:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9907BF800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 22:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9907BF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 13:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="186117255"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 07 Aug 2019 13:17:40 -0700
Received: from kyablokx-mobl.amr.corp.intel.com (unknown [10.251.19.34])
 by linux.intel.com (Postfix) with ESMTP id A9C6E58046E;
 Wed,  7 Aug 2019 13:17:39 -0700 (PDT)
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190807145227.26216-1-pierre-louis.bossart@linux.intel.com>
 <07fe0e09-6984-76c9-da7c-a1992e7f7b64@intel.com>
 <CAFQqKeXnSFUDG_72LGhxMD5aAU-DjnnPc9oqcrWBy_NfJNRQLg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <922d7056-8347-876f-fd2a-de17344b506e@linux.intel.com>
Date: Wed, 7 Aug 2019 15:17:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFQqKeXnSFUDG_72LGhxMD5aAU-DjnnPc9oqcrWBy_NfJNRQLg@mail.gmail.com>
Content-Language: en-US
Cc: tiwai@suse.de, Linux-ALSA <alsa-devel@alsa-project.org>,
 Jaska Uimonen <jaska.uimonen@intel.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: topology: use set_get_data in
 process load
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

T24gOC83LzE5IDM6MDkgUE0sIFNyaWRoYXJhbiwgUmFuamFuaSB3cm90ZToKPiAKPiAKPiBPbiBX
ZWQsIEF1ZyA3LCAyMDE5IGF0IDEyOjMyIFBNIENlemFyeSBSb2pld3NraSAKPiA8Y2V6YXJ5LnJv
amV3c2tpQGludGVsLmNvbSA8bWFpbHRvOmNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+PiB3cm90
ZToKPiAKPiAgICAgT24gMjAxOS0wOC0wNyAxNjo1MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3Jv
dGU6Cj4gICAgICA+IEZyb206IEphc2thIFVpbW9uZW4gPGphc2thLnVpbW9uZW5AaW50ZWwuY29t
Cj4gICAgIDxtYWlsdG86amFza2EudWltb25lbkBpbnRlbC5jb20+Pgo+IAo+ICAgICAgPsKgIMKg
IMKgIMKgcHJvY2VzcyA9IGt6YWxsb2MoaXBjX3NpemUsIEdGUF9LRVJORUwpOwo+ICAgICAgPiAt
wqAgwqAgwqBpZiAoIXByb2Nlc3MpCj4gICAgICA+ICvCoCDCoCDCoGlmICghcHJvY2Vzcykgewo+
ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqBrZnJlZSh3ZGF0YSk7Cj4gICAgICA+wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVOT01FTTsKPiAgICAgID4gK8KgIMKgIMKgfQo+ICAg
ICAgPgo+ICAgICAgPsKgIMKgIMKgIMKgLyogY29uZmlndXJlIGlpciBJUEMgbWVzc2FnZSAqLwo+
ICAgICAgPsKgIMKgIMKgIMKgcHJvY2Vzcy0+Y29tcC5oZHIuc2l6ZSA9IGlwY19zaXplOwo+ICAg
ICAgPiBAQCAtMTgzNSw3ICsxODkwLDkgQEAgc3RhdGljIGludCBzb2ZfcHJvY2Vzc19sb2FkKHN0
cnVjdAo+ICAgICBzbmRfc29jX2NvbXBvbmVudCAqc2NvbXAsIGludCBpbmRleCwKPiAgICAgID7C
oCDCoCDCoCDCoGlmIChyZXQgIT0gMCkgewo+ICAgICAgPsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZGV2X2VycihzZGV2LT5kZXYsICJlcnJvcjogcGFyc2UgcHJvY2Vzcy5jZmcgdG9rZW5zCj4gICAg
IGZhaWxlZCAlZFxuIiwKPiAgICAgID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGxlMzJfdG9fY3B1KHByaXZhdGUtPnNpemUpKTsKPiAgICAgID4gLcKgIMKgIMKgIMKgIMKgIMKg
IMKgZ290byBlcnI7Cj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGtmcmVlKHdkYXRhKTsK
PiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKga2ZyZWUocHJvY2Vzcyk7Cj4gICAgICA+ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7Cj4gICAgICA+wqAgwqAgwqAgwqB9Cj4gICAg
ICA+Cj4gCj4gICAgICA+IEBAIC0xODg2LDEwICsxOTE2LDM2IEBAIHN0YXRpYyBpbnQgc29mX3By
b2Nlc3NfbG9hZChzdHJ1Y3QKPiAgICAgc25kX3NvY19jb21wb25lbnQgKnNjb21wLCBpbnQgaW5k
ZXgsCj4gICAgICA+Cj4gICAgICA+wqAgwqAgwqAgwqByZXQgPSBzb2ZfaXBjX3R4X21lc3NhZ2Uo
c2Rldi0+aXBjLCBwcm9jZXNzLT5jb21wLmhkci5jbWQsCj4gICAgIHByb2Nlc3MsCj4gICAgICA+
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaXBjX3NpemUs
IHIsIHNpemVvZigqcikpOwo+ICAgICAgPiAtwqAgwqAgwqBpZiAocmV0ID49IDApCj4gICAgICA+
ICsKPiAgICAgID4gK8KgIMKgIMKgaWYgKHJldCA8IDApIHsKPiAgICAgID4gK8KgIMKgIMKgIMKg
IMKgIMKgIMKgZGV2X2VycihzZGV2LT5kZXYsICJlcnJvcjogY3JlYXRlIHByb2Nlc3MgZmFpbGVk
XG4iKTsKPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKga2ZyZWUod2RhdGEpOwo+ICAgICAg
PiArwqAgwqAgwqAgwqAgwqAgwqAgwqBrZnJlZShwcm9jZXNzKTsKPiAgICAgID7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldHVybiByZXQ7Cj4gICAgICA+IC1lcnI6Cj4gICAgICA+IC3CoCDCoCDC
oGtmcmVlKHByb2Nlc3MpOwo+ICAgICAgPiArwqAgwqAgwqB9Cj4gICAgICA+ICsKPiAgICAgID4g
K8KgIMKgIMKgLyogd2Ugc2VudCB0aGUgZGF0YSBpbiBzaW5nbGUgbWVzc2FnZSBzbyByZXR1cm4g
Ki8KPiAgICAgID4gK8KgIMKgIMKgaWYgKGlwY19kYXRhX3NpemUpIHsKPiAgICAgID4gK8KgIMKg
IMKgIMKgIMKgIMKgIMKga2ZyZWUod2RhdGEpOwo+ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm4gcmV0Owo+ICAgICAgPiArwqAgwqAgwqB9Cj4gICAgICA+ICsKPiAgICAgID4gK8Kg
IMKgIMKgLyogc2VuZCBjb250cm9sIGRhdGEgd2l0aCBsYXJnZSBtZXNzYWdlIHN1cHBvcnRlZCBt
ZXRob2QgKi8KPiAgICAgID4gK8KgIMKgIMKgZm9yIChpID0gMDsgaSA8IHdpZGdldC0+bnVtX2tj
b250cm9sczsgaSsrKSB7Cj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHdkYXRhW2ldLmNv
bnRyb2wtPnJlYWRiYWNrX29mZnNldCA9IDA7Cj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oHJldCA9IHNuZF9zb2ZfaXBjX3NldF9nZXRfY29tcF9kYXRhKHNkZXYtPmlwYywKPiAgICAgd2Rh
dGFbaV0uY29udHJvbCwKPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd2RhdGFbaV0uaXBjX2Nt
ZCwKPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgd2RhdGFbaV0uY3RybF90eXBlLAo+ICAgICAg
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAgICAg
IMKgd2RhdGFbaV0uY29udHJvbC0+Y21kLAo+ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVl
KTsKPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCAhPSAwKSB7Cj4gICAgICA+
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl9lcnIoc2Rldi0+ZGV2LCAiZXJy
b3I6IHNlbmQgY29udHJvbAo+ICAgICBmYWlsZWRcbiIpOwo+ICAgICAgPiArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBrZnJlZShwcm9jZXNzKTsKPiAgICAgID4gK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7Cj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oH0KPiAgICAgID4gK8KgIMKgIMKgfQo+ICAgICAgPiArCj4gICAgICA+ICvCoCDCoCDCoGtmcmVl
KHdkYXRhKTsKPiAgICAgID7CoCDCoCDCoCDCoHJldHVybiByZXQ7Cj4gICAgICA+wqAgwqB9Cj4g
Cj4gICAgIE9uIHNldmVyYWwgb2NjYXNpb25zIHlvdSd2ZSBhZGRlZCBpbmRpdmlkdWFsIGVycm9y
IHBhdGhzIGluc3RlYWQgb2YgYQo+ICAgICB1bmlmaWVkIG9uZS4gUGVyc29uYWxseSBJIGRvbid0
IGZpbmQgaXQgZWFzaWVyIHRvIHJlYWQgYW5kIHVuZGVyc3RhbmQKPiAgICAgZnVuY3Rpb24ncyBm
bG93IGF0IGFsbC4KPiAKPiAgICAgPGlmcyB3aXRoIGdvdG8gZXJyPgo+IAo+ICAgICBlcnI6Cj4g
ICAgICDCoCDCoCDCoCDCoCBrZnJlZShwcm9jZXNzKTsKPiAgICAgIMKgIMKgIMKgIMKgIGtmcmVl
KHdkYXRhKTsKPiAgICAgIMKgIMKgIMKgIMKgIHJldHVybiByZXQ7Cj4gCj4gICAgIGRvZXNuJ3Qg
bG9vayB0aGF0IGJhZC4uCj4gCj4gVGhhbmtzIGZvciBwb2ludGluZyBvdXQuIFBlcmhhcHMsIHRo
ZSBlcnJvciBoYW5kbGluZyBjYW4gYmUgaW1wcm92ZWQgYSAKPiBsaXR0bGUuIFdlIGNhbiBmaXgg
aW4gdjIuCgpJIHRvb2sgYSBsb29rIGF0IHRoaXMgYW5kIHRoZXJlJ3MgcmVhbGx5IG9ubHkgMi8z
IHBsYWNlcyB3aGVyZSB3ZSBjb3VsZCAKdXNlIGEgZ290bywgYnV0IHdlJ2QgaGF2ZSB0byB1c2Ug
MiBsYWJlbHMgZGVwZW5kaW5nIG9uIHdoZXRoZXIgd2UgZnJlZSAKcHJvY2Vzcy93ZGF0YSBzbyBu
b3Qgc3VyZSBpZiB3ZSdkIG1ha2UgdGhlIGNvZGUgbW9yZSBzZWxmLWV4cGxhbmF0b3J5IGluIAp0
aGUgZW5kLgoKSmFza2EsIGNhbiB5b3UgdGFrZSBhIGxvb2s/Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
