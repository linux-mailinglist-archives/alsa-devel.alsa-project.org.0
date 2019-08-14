Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C68DDEE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 21:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816681673;
	Wed, 14 Aug 2019 21:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816681673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565811218;
	bh=9S7ttC4Z0gCLa/4N5zG2y7Q9LVShz++T+eknWuYCLwk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XmgassqQDxwImb30i/llk7BeQpz1W4zZBcVvjFuuk4l+YSO+SNhRVV2xK/xFRdabm
	 ZuiD01p+57eCFOeD4mDGBzw/qRWQBSJDlSyZMwA4stVL0S0UqY1k0wvW1PVIqixXqc
	 C5ZddUg6b711kD50YpePyUnpEpkzoEc8F0ixJBAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7C7FF80268;
	Wed, 14 Aug 2019 21:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F374F80214; Wed, 14 Aug 2019 21:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BE71F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 21:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BE71F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 12:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,386,1559545200"; d="scan'208";a="181658948"
Received: from thegde-mobl.amr.corp.intel.com (HELO [10.252.134.116])
 ([10.252.134.116])
 by orsmga006.jf.intel.com with ESMTP; 14 Aug 2019 12:31:43 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-32-pierre-louis.bossart@linux.intel.com>
 <39318aab-b1b4-2cce-c408-792a5cc343dd@intel.com>
 <ee87d4bb-3f35-eb27-0112-e6e64a09a279@linux.intel.com>
 <20190802172843.GC12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7abdb0e8-b9c4-28c7-d9ed-a7db1574e0b2@linux.intel.com>
Date: Wed, 14 Aug 2019 14:31:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802172843.GC12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 31/40] soundwire: intel: move
 shutdown() callback and don't export symbol
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

Cgo+Pj4+ICt2b2lkIGludGVsX3NodXRkb3duKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vi
c3RyZWFtLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBzbmRfc29jX2RhaSAq
ZGFpKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc2R3X2NkbnNfZG1hX2RhdGEgKmRtYTsK
Pj4+PiArCj4+Pj4gK8KgwqDCoCBkbWEgPSBzbmRfc29jX2RhaV9nZXRfZG1hX2RhdGEoZGFpLCBz
dWJzdHJlYW0pOwo+Pj4+ICvCoMKgwqAgaWYgKCFkbWEpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPj4+PiArCj4+Pj4gK8KgwqDCoCBzbmRfc29jX2RhaV9zZXRfZG1hX2RhdGEoZGFpLCBz
dWJzdHJlYW0sIE5VTEwpOwo+Pj4+ICvCoMKgwqAga2ZyZWUoZG1hKTsKPj4+PiArfQo+Pj4KPj4+
IENvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCBidXQgZG8gd2UgcmVhbGx5IG5lZWQgdG8gX2dldF9k
bWFfIGhlcmU/Cj4+PiBfc2V0X2RtYV8gc2VlbXMgYnVsbGV0cHJvb2YsIHNhbWUgZm9yIGtmcmVl
Lgo+Pgo+PiBJIG11c3QgYWRtaXQgSSBoYXZlIG5vIGlkZWEgd2h5IHdlIGhhdmUgYSByZWZlcmVu
Y2UgdG8gRE1BcyBoZXJlLCB0aGlzIGxvb2tzCj4+IGxpa2UgYW4gYWJ1c2UgdG8gc3RvcmUgYSBk
YWktc3BlY2lmaWMgY29udGV4dCwgYW5kIHRoZSBpbml0aWFsIHRlc3QgbG9va3MKPj4gbGlrZSBj
b3B5LXBhc3RlIHRvIGRldGVjdCBpbnZhbGlkIGNvbmZpZ3MsIGFzIGRvbmUgaW4gb3RoZXIgY2Fs
bGJhY2tzLiBWaW5vZAo+PiBhbmQgU2FueW9nIG1pZ2h0IGhhdmUgbW9yZSBoaXN0b3J5IHRoYW4g
bWUgaGVyZS4KPiAKPiBJIGRvbnQgc2VlIHNuZF9zb2NfZGFpX3NldF9kbWFfZGF0YSgpIGNhbGwg
Zm9yCj4gc2R3X2NkbnNfZG1hX2RhdGEgc28gc29tdGhpbmcgaXMgbWlzc2luZyAoYXQgbGVhc3Qg
aW4gdXBzdHJlYW0gY29kZSkKPiAKPiBJSVJDIHdlIHNob3VsZCBoYXZlIGEgc25kX3NvY19kYWlf
c2V0X2RtYV9kYXRhKCkgaW4gYWxsb2Mgb3Igc29tZQo+IGluaXRpYWxpemF0aW9uIHJvdXRpbmUg
YW5kIHdlIGZyZWUgaXQgaGVyZS4uIFNhbnlvZz8KClZpbm9kLCBJIGRvdWJsZS1jaGVja2VkIHRo
YXQgd2UgZG8gbm90IGluZGVlZCBoYXZlIGEgY2FsbCB0byAKc25kX3NvY19kYWlfZG1hX2RhdGEo
KSwgYnV0IHRoZXJlIGlzIGNvZGUgaW4gY2Ruc19zZXRfc3RyZWFtKCkgdGhhdCBzZXRzIAp0aGUg
cmVsZXZhbnQgZGFpLT5wbGF5YmFjay9jYXB0dXJlX2RtYV9kYXRhLCBzZWUgYmVsb3cKCkkgYW0g
bm90IGEgYmlnIGZhbiBvZiB0aGlzIGNvZGUsIHRvdWNoaW5nIHRoZSBBU29DIGNvcmUgaW50ZXJu
YWwgZmllbGRzIAppc24ndCBhIGdvb2QgaWRlYSBpbiBnZW5lcmFsLgoKQWxzbyBub3Qgc3VyZSB3
aHkgZm9yIGEgREFJIHdlIG5lZWQgYm90aCBfZHJ2ZGF0YSBhbmQgX2RtYV9kYXRhIAooZXNwZWNp
YWxseSBmb3IgdGhpcyBjYXNlIHdoZXJlIHRoZSBpbmZvcm1hdGlvbiBzdG9yZWQgaGFzIGFic29s
dXRlbHkgCm5vdGhpbmcgdG8gZG8gd2l0aCBETUFzKS4KCklmIHRoZSBpZGVhIHdhcyB0byBrZWVw
IGEgY29udGV4dCB0aGF0IGlzIGRpcmVjdGlvbi1kZXBlbmRlbnQsIHRoYXQncyAKbGlrZWx5IHVu
bmVjZXNzYXJ5LiBGb3IgdGhlIEludGVsL0NhZGVuY2UgY2FzZSB0aGUgaW50ZXJmYWNlcyBjYW4g
YmUgCmNvbmZpZ3VyZWQgYXMgcGxheWJhY2sgT1IgY2FwdHVyZSwgbm90IGJvdGggY29uY3VycmVu
dGx5LCBzbyB0aGUgImRtYSIgCmluZm9ybWF0aW9uIGNvdWxkIGhhdmUgYmVlbiBzdG9yZWQgaW4g
dGhlIGdlbmVyaWMgREFJIF9kcnZkYXRhLgoKSSBoYXZlIG90aGVyIHRoaW5ncyB0byBsb29rIGlu
dG8gZm9yIG5vdyBidXQgdGhpcyBjb2RlIHdpbGwgbGlrZWx5IG5lZWQgCnRvIGJlIGNsZWFuZWQt
dXAgYXQgc29tZSBwb2ludCB0byByZW1vdmUgdW5uZWNlc3NhcnkgcGFydHMuCgppbnQgY2Ruc19z
ZXRfc2R3X3N0cmVhbShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKCQkJdm9pZCAqc3RyZWFtLCBi
b29sIHBjbSwgaW50IGRpcmVjdGlvbikKewoJc3RydWN0IHNkd19jZG5zICpjZG5zID0gc25kX3Nv
Y19kYWlfZ2V0X2RydmRhdGEoZGFpKTsKCXN0cnVjdCBzZHdfY2Ruc19kbWFfZGF0YSAqZG1hOwoK
CWRtYSA9IGt6YWxsb2Moc2l6ZW9mKCpkbWEpLCBHRlBfS0VSTkVMKTsKCWlmICghZG1hKQoJCXJl
dHVybiAtRU5PTUVNOwoKCWlmIChwY20pCgkJZG1hLT5zdHJlYW1fdHlwZSA9IFNEV19TVFJFQU1f
UENNOwoJZWxzZQoJCWRtYS0+c3RyZWFtX3R5cGUgPSBTRFdfU1RSRUFNX1BETTsKCglkbWEtPmJ1
cyA9ICZjZG5zLT5idXM7CglkbWEtPmxpbmtfaWQgPSBjZG5zLT5pbnN0YW5jZTsKCglkbWEtPnN0
cmVhbSA9IHN0cmVhbTsKCiA+Pj4gdGhpcyBpcyBlcXVpdmFsZW50IHRvIHNuZF9zb2NfZGFpX2Rt
YV9kYXRhKCkKCglpZiAoZGlyZWN0aW9uID09IFNORFJWX1BDTV9TVFJFQU1fUExBWUJBQ0spCgkJ
ZGFpLT5wbGF5YmFja19kbWFfZGF0YSA9IGRtYTsKCWVsc2UKCQlkYWktPmNhcHR1cmVfZG1hX2Rh
dGEgPSBkbWE7Cjw8PDwKCXJldHVybiAwOwp9CkVYUE9SVF9TWU1CT0woY2Ruc19zZXRfc2R3X3N0
cmVhbSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
