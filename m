Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93593961E4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 16:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13872166A;
	Tue, 20 Aug 2019 16:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13872166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566310032;
	bh=OiFubYhlW+s39VIwp/0bHYdblz7q3XTF1pHDNbnQd90=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PgFCcGHy0awKMtJfmVbd+fgJOOUZfNsSpCfq0YtHiZLPFcVfzC9aLiP5SHUVEVpSh
	 dd5Hpm6ugoTNjvIRhFGaAuP2k6KRsKsQd6Hi9KHZc2Di8ykpxFX0hEWEE3pGMrlHE0
	 OKPWvmcYwbwPO4tVQxWqBX4YAZmJcQvaEKcel5BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFC2F8036E;
	Tue, 20 Aug 2019 16:05:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F5E7F8036E; Tue, 20 Aug 2019 16:05:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A6BF800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 16:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A6BF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 07:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="262177805"
Received: from slawrenx-mobl.amr.corp.intel.com (HELO [10.251.28.5])
 ([10.251.28.5])
 by orsmga001.jf.intel.com with ESMTP; 20 Aug 2019 07:05:18 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
 <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
 <27f25fb3-1d50-2b60-3e3b-da61eef1f6ad@linux.intel.com>
 <1bbf24d4-c6cb-00ee-ffbe-18da53d1f942@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fc461e37-7363-af5a-63a4-9db7a2b8c1cd@linux.intel.com>
Date: Tue, 20 Aug 2019 09:05:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1bbf24d4-c6cb-00ee-ffbe-18da53d1f942@intel.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 09/25] ASoC: soc-core: tidyup for
 snd_soc_dapm_add_routes()
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

CgpPbiA4LzIwLzE5IDg6MzggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTIwIDE0OjM2LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4KPj4gT24gOC8yMC8x
OSA2OjE4IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+PiBPbiAyMDE5LTA4LTA3IDAzOjMx
LCBLdW5pbm9yaSBNb3JpbW90byB3cm90ZToKPj4+Pgo+Pj4+IEZyb206IEt1bmlub3JpIE1vcmlt
b3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5lc2FzLmNvbT4KPj4+Pgo+Pj4+IHNuZF9zb2Nf
ZGFwbV9hZGRfcm91dGVzKCkgcmVnaXN0ZXJzIHJvdXRlcyBieSB1c2luZwo+Pj4+IGZvciguLi4g
aSA8IG51bTsgLi4uKS4gSWYgcm91dGVzIHdhcyBOVUxMLCBudW0gc2hvdWxkIGJlIHplcm8uCj4+
Pj4gVGh1cywgd2UgZG9uJ3QgbmVlZCB0byBjaGVjayBhYm91dCByb3V0ZSBwb2ludGVyLgo+Pj4+
IFRoaXMgcGF0Y2ggYWxzbyBjYXJlcyBtaXNzaW5nIHJldHVybiB2YWx1ZS4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3JpbW90by5neEByZW5l
c2FzLmNvbT4KPj4+PiAtLS0KPj4+PiB2MSAtPiB2Mgo+Pj4+Cj4+Pj4gwqDCoMKgwqAtIGNoZWNr
IHJldHVybiB2YWx1ZQo+Pj4+IMKgwqDCoMKgLSBjaGFuZ2UgU3ViamVjdAo+Pj4+Cj4+Pj4gwqAg
c291bmQvc29jL3NvYy1jb3JlLmMgfCAyMyArKysrKysrKysrKysrLS0tLS0tLS0tLQo+Pj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29jLWNvcmUuYyBiL3NvdW5kL3NvYy9zb2MtY29y
ZS5jCj4+Pj4gaW5kZXggMjFjZGQzYy4uY2ExYjA0YyAxMDA2NDQKPj4+PiAtLS0gYS9zb3VuZC9z
b2Mvc29jLWNvcmUuYwo+Pj4+ICsrKyBiL3NvdW5kL3NvYy9zb2MtY29yZS5jCj4+Pj4gQEAgLTEz
MTAsMTAgKzEzMTAsMTEgQEAgc3RhdGljIGludCBzb2NfcHJvYmVfY29tcG9uZW50KHN0cnVjdCAK
Pj4+PiBzbmRfc29jX2NhcmQgKmNhcmQsCj4+Pj4gwqDCoMKgwqDCoCBpZiAocmV0IDwgMCkKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfcHJvYmU7Cj4+Pj4gLcKgwqDCoCBpZiAoY29t
cG9uZW50LT5kcml2ZXItPmRhcG1fcm91dGVzKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzbmRfc29j
X2RhcG1fYWRkX3JvdXRlcyhkYXBtLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb21wb25lbnQtPmRyaXZlci0+ZGFwbV9yb3V0ZXMsCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5udW1fZGFw
bV9yb3V0ZXMpOwo+Pj4+ICvCoMKgwqAgcmV0ID0gc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoZGFw
bSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBv
bmVudC0+ZHJpdmVyLT5kYXBtX3JvdXRlcywKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5udW1fZGFwbV9yb3V0ZXMpOwo+
Pj4+ICvCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX3By
b2JlOwo+Pj4+IMKgwqDCoMKgwqAgbGlzdF9hZGQoJmRhcG0tPmxpc3QsICZjYXJkLT5kYXBtX2xp
c3QpOwo+Pj4+IMKgwqDCoMKgwqAgLyogc2VlIGZvcl9lYWNoX2NhcmRfY29tcG9uZW50cyAqLwo+
Pj4+IEBAIC0yMDYwLDEzICsyMDYxLDE1IEBAIHN0YXRpYyBpbnQgc25kX3NvY19pbnN0YW50aWF0
ZV9jYXJkKHN0cnVjdCAKPj4+PiBzbmRfc29jX2NhcmQgKmNhcmQpCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHNuZF9zb2NfYWRkX2NhcmRfY29udHJvbHMoY2FyZCwgY2FyZC0+Y29udHJvbHMsCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXJkLT5u
dW1fY29udHJvbHMpOwo+Pj4+IC3CoMKgwqAgaWYgKGNhcmQtPmRhcG1fcm91dGVzKQo+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBzbmRfc29jX2RhcG1fYWRkX3JvdXRlcygmY2FyZC0+ZGFwbSwgY2FyZC0+
ZGFwbV9yb3V0ZXMsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNhcmQtPm51bV9kYXBtX3JvdXRlcyk7Cj4+Pj4gK8KgwqDCoCByZXQgPSBzbmRfc29jX2RhcG1f
YWRkX3JvdXRlcygmY2FyZC0+ZGFwbSwgY2FyZC0+ZGFwbV9yb3V0ZXMsCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXJkLT5udW1fZGFwbV9yb3V0ZXMp
Owo+Pj4+ICvCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gcHJv
YmVfZW5kOwo+Pj4+IC3CoMKgwqAgaWYgKGNhcmQtPm9mX2RhcG1fcm91dGVzKQo+Pj4+IC3CoMKg
wqDCoMKgwqDCoCBzbmRfc29jX2RhcG1fYWRkX3JvdXRlcygmY2FyZC0+ZGFwbSwgY2FyZC0+b2Zf
ZGFwbV9yb3V0ZXMsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNhcmQtPm51bV9vZl9kYXBtX3JvdXRlcyk7Cj4+Pj4gK8KgwqDCoCByZXQgPSBzbmRfc29jX2Rh
cG1fYWRkX3JvdXRlcygmY2FyZC0+ZGFwbSwgY2FyZC0+b2ZfZGFwbV9yb3V0ZXMsCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXJkLT5udW1fb2ZfZGFw
bV9yb3V0ZXMpOwo+Pj4+ICvCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGdvdG8gcHJvYmVfZW5kOwo+Pj4+IMKgwqDCoMKgwqAgLyogdHJ5IHRvIHNldCBzb21lIHNhbmUg
bG9uZ25hbWUgaWYgRE1JIGlzIGF2YWlsYWJsZSAqLwo+Pj4+IMKgwqDCoMKgwqAgc25kX3NvY19z
ZXRfZG1pX25hbWUoY2FyZCwgTlVMTCk7Cj4+Pj4KPj4+Cj4+PiBIZWxsbyB0aGVyZSwKPj4+Cj4+
PiBJJ3ZlIHJ1biBhIHZhbGlkYXRpb24gY3ljbGUgb24gcmVjZW50IGJyb29uaWUvZm9yLW5leHQg
YW5kIHRoaXMgCj4+PiBjb21taXQgY2F1c2VkIHJlZ3Jlc3Npb24uIEhvd2V2ZXIsIGl0IG1heSBi
ZSBzaW1wbHkgYW4gZXJyb3Igb24gYm9hcmQgCj4+PiBzaWRlIGluc3RlYWQuCj4+Pgo+Pj4gUHJl
dmlvdXNseSwgcmV0IGZyb20gc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMgaGFzIGJlZW4gaWdub3Jl
ZCB0aHVzIGl0IAo+Pj4gd2FzIHBlcm1pc3NpdmUgZm9yIGFkZGl0aW9uIG9mIHNldmVyYWwgcm91
dGVzIHRvIGZhaWwuIEFzIGxvbmcgYXMgCj4+PiBzb21lIHJvdXRlcyBzdWNjZWVkZWQsIGNhcmQg
d2FzIHdvcmtpbmcganVzdCBmaW5lLiBOb3cgaXQncyBubyBsb25nZXIgCj4+PiB0aGUgY2FzZSAt
IGJlaGF2aW9yIG9mIHRoZSBjYXJkIGluaXRpYWxpemF0aW9uIGhhcyBjaGFuZ2VkOiBpdCBpcyAK
Pj4+IHJlcXVpcmVkIGZvciBBTEwgcm91dGVzIHRvIHN1Y2NlZWQgYmVmb3JlIGNhcmQgY2FuIGJl
IGZ1bGx5IAo+Pj4gaW5zdGFudGlhdGVkLgo+Pj4KPj4+IE11c3Qgc2F5IGNvbGxhcHNpbmcgc25k
X3NvY19pbnN0YW50aWF0ZV9jYXJkIGlzIGEgd29uZGVyZnVsIHdheSB0byAKPj4+IHRlc3QgeW91
ciBjYXJkJ3MgcmVtb3ZhbCBmbG93IChzb2NfX2NsZWFudXBfY2FyZF9yZXNvdXJjZXMgYW5kIAo+
Pj4gZnJpZW5kcykuLgo+Pj4KPj4+IFF1ZXN0aW9uIGlzIHNpbXBsZTogYXJlIHdlIHN0YXlpbmcg
d2l0aCBhbGwtZm9yLW9uZS8gb25lLWZvci1hbGwgCj4+PiBhcHByb2FjaCBvciB3ZSByZXZlcnRp
bmcgdG8gcGVybWlzc2l2ZSBiZWhhdmlvcj8KPj4KPj4gQ2FuIHlvdSBlbGFib3JhdGUgaW4gd2hp
Y2ggdGVzdCBjYXNlIHRoaXMgcGF0Y2ggY3JlYXRlcyBhIHByb2JsZW0/IAo+PiBKdXN0IGN1cmlv
dXMgd2h5IHRoZSByb3V0ZSBhZGRpdGlvbiBmYWlscyBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gCj4g
SWYgc25kX3NvY19pbnN0YW50aWF0ZV9jYXJkIGZhaWxzIHNvIGRvZXMgYW55IHRlc3QsIHJlYWxs
eS4gUmVkIHdhbGwgd2FzIAo+IGVhc3kgdG8gc3BvdCBldmVuIGZvciBhIGh1bmdyeSBkZXZlbG9w
ZXIgOiApCj4gCj4gT3VyIGNubF9ydDI3NCBib2FyZCBkZWNsYXJlcyBzZXZlcmFsIHJvdXRlcywg
eWV0IG91ciB0b3BvbG9neSBkb2VzIG5vdCAKPiBwcm92aWRlIG5lY2Vzc2FyeSBpbmZvIGZvciBh
bGwgb2YgdGhlbS4gQW5kIHRodXMsIGFkZGl0aW9uIG9mIHNvbWUgCj4gcm91dGVzIGZhaWxzLiBU
aGlzIHdhcyBmaW5lIHRpbGwgbm93LiBUaGF0J3MgYWxzbyB3aHkgSSdkIG1lbnRpb25lZCBpbiAK
PiB0aGUgdmVyeSBmaXJzdCBzZW50ZW5jZTogaXQgbWlnaHQgYmUgc2ltcGx5IGEgYm9hcmQgaXNz
dWUuIE1heWJlIHdlIAo+IHNob3VsZCBoYXZlIG5ldmVyIGFidXNlZCBwZXJtaXNzaXZlIGJlaGF2
aW9yIGluIHRoZSBmaXJzdCBwbGFjZS4KClllcCwgYW5kIHRoYXQgZHJpdmVyIGlzIG5vdCB1cHN0
cmVhbSBhcyB3ZWxsIHNvIEludGVsIGNhbid0IGNvbXBsYWluIGhlcmUuLi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
