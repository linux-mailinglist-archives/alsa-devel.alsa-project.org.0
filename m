Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E231F963AE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 17:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74722166E;
	Tue, 20 Aug 2019 17:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74722166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566313580;
	bh=6rBeW8iqRLdo+jPtlkbtwAeW3xITW/gb5AVP+rV4zpU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ONuAy58kl9Q3Ywjl51hOIfqXQUfMK7ACnaoHM6NEB53M1CwZQr+erllToEjsOcuvN
	 oCizwAwOe4bWGH45aa2jS6x2km/mgT2ecJ4GcgBcwOICKGbOoeuZ8gJsLwvank5HSb
	 qd17nm12r0173+YbkQB3xXmKXdHabuxmQD+hzE0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B0F3F80391;
	Tue, 20 Aug 2019 17:04:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D52CCF8036E; Tue, 20 Aug 2019 17:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2699F802E0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 17:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2699F802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 08:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="172473322"
Received: from gcraigx-mobl.amr.corp.intel.com (HELO [10.252.3.187])
 ([10.252.3.187])
 by orsmga008.jf.intel.com with ESMTP; 20 Aug 2019 08:04:24 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
 <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
 <27f25fb3-1d50-2b60-3e3b-da61eef1f6ad@linux.intel.com>
 <1bbf24d4-c6cb-00ee-ffbe-18da53d1f942@intel.com>
 <fc461e37-7363-af5a-63a4-9db7a2b8c1cd@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <b3d7dc47-36e9-749f-94be-32854de624be@intel.com>
Date: Tue, 20 Aug 2019 17:04:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc461e37-7363-af5a-63a4-9db7a2b8c1cd@linux.intel.com>
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

T24gMjAxOS0wOC0yMCAxNjowNSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMC8xOSA4OjM4IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IE9uIDIwMTktMDgt
MjAgMTQ6MzYsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiA4LzIw
LzE5IDY6MTggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+PiBPbiAyMDE5LTA4LTA3IDAz
OjMxLCBLdW5pbm9yaSBNb3JpbW90byB3cm90ZToKPj4+Pj4KPj4+Pj4gRnJvbTogS3VuaW5vcmkg
TW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgo+Pj4+Pgo+Pj4+PiBz
bmRfc29jX2RhcG1fYWRkX3JvdXRlcygpIHJlZ2lzdGVycyByb3V0ZXMgYnkgdXNpbmcKPj4+Pj4g
Zm9yKC4uLiBpIDwgbnVtOyAuLi4pLiBJZiByb3V0ZXMgd2FzIE5VTEwsIG51bSBzaG91bGQgYmUg
emVyby4KPj4+Pj4gVGh1cywgd2UgZG9uJ3QgbmVlZCB0byBjaGVjayBhYm91dCByb3V0ZSBwb2lu
dGVyLgo+Pj4+PiBUaGlzIHBhdGNoIGFsc28gY2FyZXMgbWlzc2luZyByZXR1cm4gdmFsdWUuCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEt1bmlub3JpIE1vcmltb3RvIDxrdW5pbm9yaS5tb3Jp
bW90by5neEByZW5lc2FzLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IHYxIC0+IHYyCj4+Pj4+Cj4+Pj4+
IMKgwqDCoMKgLSBjaGVjayByZXR1cm4gdmFsdWUKPj4+Pj4gwqDCoMKgwqAtIGNoYW5nZSBTdWJq
ZWN0Cj4+Pj4+Cj4+Pj4+IMKgIHNvdW5kL3NvYy9zb2MtY29yZS5jIHwgMjMgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1jb3Jl
LmMgYi9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+Pj4+PiBpbmRleCAyMWNkZDNjLi5jYTFiMDRjIDEw
MDY0NAo+Pj4+PiAtLS0gYS9zb3VuZC9zb2Mvc29jLWNvcmUuYwo+Pj4+PiArKysgYi9zb3VuZC9z
b2Mvc29jLWNvcmUuYwo+Pj4+PiBAQCAtMTMxMCwxMCArMTMxMCwxMSBAQCBzdGF0aWMgaW50IHNv
Y19wcm9iZV9jb21wb25lbnQoc3RydWN0IAo+Pj4+PiBzbmRfc29jX2NhcmQgKmNhcmQsCj4+Pj4+
IMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cl9wcm9iZTsKPj4+Pj4gLcKgwqDCoCBpZiAoY29tcG9uZW50LT5kcml2ZXItPmRhcG1fcm91dGVz
KQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoZGFwbSwKPj4+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBvbmVudC0+ZHJp
dmVyLT5kYXBtX3JvdXRlcywKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbXBvbmVudC0+ZHJpdmVyLT5udW1fZGFwbV9yb3V0ZXMpOwo+Pj4+PiArwqDCoMKg
IHJldCA9IHNuZF9zb2NfZGFwbV9hZGRfcm91dGVzKGRhcG0sCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcG9uZW50LT5kcml2ZXItPmRhcG1fcm91
dGVzLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bXBvbmVudC0+ZHJpdmVyLT5udW1fZGFwbV9yb3V0ZXMpOwo+Pj4+PiArwqDCoMKgIGlmIChyZXQg
PCAwKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfcHJvYmU7Cj4+Pj4+IMKgwqDCoMKg
wqAgbGlzdF9hZGQoJmRhcG0tPmxpc3QsICZjYXJkLT5kYXBtX2xpc3QpOwo+Pj4+PiDCoMKgwqDC
oMKgIC8qIHNlZSBmb3JfZWFjaF9jYXJkX2NvbXBvbmVudHMgKi8KPj4+Pj4gQEAgLTIwNjAsMTMg
KzIwNjEsMTUgQEAgc3RhdGljIGludCBzbmRfc29jX2luc3RhbnRpYXRlX2NhcmQoc3RydWN0IAo+
Pj4+PiBzbmRfc29jX2NhcmQgKmNhcmQpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzbmRfc29j
X2FkZF9jYXJkX2NvbnRyb2xzKGNhcmQsIGNhcmQtPmNvbnRyb2xzLAo+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcmQtPm51bV9jb250cm9scyk7
Cj4+Pj4+IC3CoMKgwqAgaWYgKGNhcmQtPmRhcG1fcm91dGVzKQo+Pj4+PiAtwqDCoMKgwqDCoMKg
wqAgc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sIGNhcmQtPmRhcG1fcm91dGVz
LAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FyZC0+bnVt
X2RhcG1fcm91dGVzKTsKPj4+Pj4gK8KgwqDCoCByZXQgPSBzbmRfc29jX2RhcG1fYWRkX3JvdXRl
cygmY2FyZC0+ZGFwbSwgY2FyZC0+ZGFwbV9yb3V0ZXMsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FyZC0+bnVtX2RhcG1fcm91dGVzKTsKPj4+Pj4g
K8KgwqDCoCBpZiAocmV0IDwgMCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gcHJvYmVfZW5k
Owo+Pj4+PiAtwqDCoMKgIGlmIChjYXJkLT5vZl9kYXBtX3JvdXRlcykKPj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIHNuZF9zb2NfZGFwbV9hZGRfcm91dGVzKCZjYXJkLT5kYXBtLCBjYXJkLT5vZl9kYXBt
X3JvdXRlcywKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNh
cmQtPm51bV9vZl9kYXBtX3JvdXRlcyk7Cj4+Pj4+ICvCoMKgwqAgcmV0ID0gc25kX3NvY19kYXBt
X2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sIGNhcmQtPm9mX2RhcG1fcm91dGVzLAo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhcmQtPm51bV9vZl9kYXBt
X3JvdXRlcyk7Cj4+Pj4+ICvCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBnb3RvIHByb2JlX2VuZDsKPj4+Pj4gwqDCoMKgwqDCoCAvKiB0cnkgdG8gc2V0IHNvbWUgc2Fu
ZSBsb25nbmFtZSBpZiBETUkgaXMgYXZhaWxhYmxlICovCj4+Pj4+IMKgwqDCoMKgwqAgc25kX3Nv
Y19zZXRfZG1pX25hbWUoY2FyZCwgTlVMTCk7Cj4+Pj4+Cj4+Pj4KPj4+PiBIZWxsbyB0aGVyZSwK
Pj4+Pgo+Pj4+IEkndmUgcnVuIGEgdmFsaWRhdGlvbiBjeWNsZSBvbiByZWNlbnQgYnJvb25pZS9m
b3ItbmV4dCBhbmQgdGhpcyAKPj4+PiBjb21taXQgY2F1c2VkIHJlZ3Jlc3Npb24uIEhvd2V2ZXIs
IGl0IG1heSBiZSBzaW1wbHkgYW4gZXJyb3Igb24gCj4+Pj4gYm9hcmQgc2lkZSBpbnN0ZWFkLgo+
Pj4+Cj4+Pj4gUHJldmlvdXNseSwgcmV0IGZyb20gc25kX3NvY19kYXBtX2FkZF9yb3V0ZXMgaGFz
IGJlZW4gaWdub3JlZCB0aHVzIAo+Pj4+IGl0IHdhcyBwZXJtaXNzaXZlIGZvciBhZGRpdGlvbiBv
ZiBzZXZlcmFsIHJvdXRlcyB0byBmYWlsLiBBcyBsb25nIGFzIAo+Pj4+IHNvbWUgcm91dGVzIHN1
Y2NlZWRlZCwgY2FyZCB3YXMgd29ya2luZyBqdXN0IGZpbmUuIE5vdyBpdCdzIG5vIAo+Pj4+IGxv
bmdlciB0aGUgY2FzZSAtIGJlaGF2aW9yIG9mIHRoZSBjYXJkIGluaXRpYWxpemF0aW9uIGhhcyBj
aGFuZ2VkOiAKPj4+PiBpdCBpcyByZXF1aXJlZCBmb3IgQUxMIHJvdXRlcyB0byBzdWNjZWVkIGJl
Zm9yZSBjYXJkIGNhbiBiZSBmdWxseSAKPj4+PiBpbnN0YW50aWF0ZWQuCj4+Pj4KPj4+PiBNdXN0
IHNheSBjb2xsYXBzaW5nIHNuZF9zb2NfaW5zdGFudGlhdGVfY2FyZCBpcyBhIHdvbmRlcmZ1bCB3
YXkgdG8gCj4+Pj4gdGVzdCB5b3VyIGNhcmQncyByZW1vdmFsIGZsb3cgKHNvY19fY2xlYW51cF9j
YXJkX3Jlc291cmNlcyBhbmQgCj4+Pj4gZnJpZW5kcykuLgo+Pj4+Cj4+Pj4gUXVlc3Rpb24gaXMg
c2ltcGxlOiBhcmUgd2Ugc3RheWluZyB3aXRoIGFsbC1mb3Itb25lLyBvbmUtZm9yLWFsbCAKPj4+
PiBhcHByb2FjaCBvciB3ZSByZXZlcnRpbmcgdG8gcGVybWlzc2l2ZSBiZWhhdmlvcj8KPj4+Cj4+
PiBDYW4geW91IGVsYWJvcmF0ZSBpbiB3aGljaCB0ZXN0IGNhc2UgdGhpcyBwYXRjaCBjcmVhdGVz
IGEgcHJvYmxlbT8gCj4+PiBKdXN0IGN1cmlvdXMgd2h5IHRoZSByb3V0ZSBhZGRpdGlvbiBmYWls
cyBpbiB0aGUgZmlyc3QgcGxhY2UuCj4+Cj4+IElmIHNuZF9zb2NfaW5zdGFudGlhdGVfY2FyZCBm
YWlscyBzbyBkb2VzIGFueSB0ZXN0LCByZWFsbHkuIFJlZCB3YWxsIAo+PiB3YXMgZWFzeSB0byBz
cG90IGV2ZW4gZm9yIGEgaHVuZ3J5IGRldmVsb3BlciA6ICkKPj4KPj4gT3VyIGNubF9ydDI3NCBi
b2FyZCBkZWNsYXJlcyBzZXZlcmFsIHJvdXRlcywgeWV0IG91ciB0b3BvbG9neSBkb2VzIG5vdCAK
Pj4gcHJvdmlkZSBuZWNlc3NhcnkgaW5mbyBmb3IgYWxsIG9mIHRoZW0uIEFuZCB0aHVzLCBhZGRp
dGlvbiBvZiBzb21lIAo+PiByb3V0ZXMgZmFpbHMuIFRoaXMgd2FzIGZpbmUgdGlsbCBub3cuIFRo
YXQncyBhbHNvIHdoeSBJJ2QgbWVudGlvbmVkIGluIAo+PiB0aGUgdmVyeSBmaXJzdCBzZW50ZW5j
ZTogaXQgbWlnaHQgYmUgc2ltcGx5IGEgYm9hcmQgaXNzdWUuIE1heWJlIHdlIAo+PiBzaG91bGQg
aGF2ZSBuZXZlciBhYnVzZWQgcGVybWlzc2l2ZSBiZWhhdmlvciBpbiB0aGUgZmlyc3QgcGxhY2Uu
Cj4gCj4gWWVwLCBhbmQgdGhhdCBkcml2ZXIgaXMgbm90IHVwc3RyZWFtIGFzIHdlbGwgc28gSW50
ZWwgY2FuJ3QgY29tcGxhaW4gCj4gaGVyZS4uLgoKPz8KCkl0J3Mgbm90IGFib3V0IGNvbXBsYWlu
aW5nLCByYXRoZXIgc3RhcnRpbmcgYSBkaXNjdXNzaW9uLiBJZiBJIHdlcmUgCnVzaW5nIGJvYXJk
cyB3aXRoIHRvcG9sb2d5IG5vdCBmdWxseSBtYXRjaGluZyBpdHMgYm9hcmQgZXF1aXZhbGVudCAK
KGJlY2F1c2UgaWYgaGFzIG5ldmVyIGJlZW4gcmVxdWlyZWQgb2YgbWUpIHRoZW4gdGhlcmUgbWF5
IGJlIG90aGVycyB3aG8gCmRpZCB0aGUgZXhhY3Qgc2FtZSB0cmljay4gWW91ciBjYXJkIHdvbid0
IGJlIGVudW1lcmF0ZWQgbm93ID09IGNoYW5nZSBvZiAKYmVoYXZpb3IuCgpCb2FyZCBieHRfcnQy
OTggaXMgdXBzdHJlYW1lZCBhbmQgdGhlIGV4YWN0IHNhbWUgZmFpbHVyZXMgY291bGQgYmUgCnJl
cHJvZHVjZWQgc2luY2UgdG9wb2xvZ3kgaGFzIHNvbWV0aGluZyB0byBzYXkgaGVyZSB0b28uLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
