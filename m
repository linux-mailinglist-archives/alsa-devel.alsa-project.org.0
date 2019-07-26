Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D422776C2F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF60208F;
	Fri, 26 Jul 2019 16:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF60208F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564153036;
	bh=nqtHUT12ONfdImPEUUfPYX22pRylJ8eNxT03reLgpok=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C44tfjUTSPmh0ZmBKO9nLVGjw36hOCtWpNSBjWqF31vd2LmwxrefMZNylSE+26Cum
	 gitmqbo1psE7p7HG/scrbLGUyEqn9RJ17cQQKJD0lp7n3Ef4xFOBxID2RBRFx9u4q7
	 ZmknUyvuvn1aTw8SSvStqJermZ5b+Sl4shHTcY2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B91D2F803D5;
	Fri, 26 Jul 2019 16:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 233FAF80393; Fri, 26 Jul 2019 16:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC6DF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC6DF800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322057986"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:55:22 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-33-pierre-louis.bossart@linux.intel.com>
 <b0f7d11d-b9db-af98-3036-ef2a165f7427@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <41d9d18f-9df2-9c7e-6cbd-8e7abb916f71@linux.intel.com>
Date: Fri, 26 Jul 2019 09:55:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b0f7d11d-b9db-af98-3036-ef2a165f7427@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 32/40] soundwire: intel: add helper for
 initialization
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

CgpPbiA3LzI2LzE5IDU6NDIgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gTW92ZSBjb2RlIHRvIGhl
bHBlciBmb3IgcmV1c2UgaW4gcG93ZXIgbWFuYWdlbWVudCByb3V0aW5lcwo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCAKPj4gPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxp
bnV4LmludGVsLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvc291bmR3aXJlL2ludGVsLmMgfCAx
NiArKysrKysrKysrKy0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb3VuZHdpcmUvaW50
ZWwuYyBiL2RyaXZlcnMvc291bmR3aXJlL2ludGVsLmMKPj4gaW5kZXggYzQwYWI0NDNlNzIzLi4y
MTVkYzgxY2RmNzMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvc291bmR3aXJlL2ludGVsLmMKPj4g
KysrIGIvZHJpdmVycy9zb3VuZHdpcmUvaW50ZWwuYwo+PiBAQCAtOTg0LDYgKzk4NCwxNSBAQCBz
dGF0aWMgc3RydWN0IHNkd19tYXN0ZXJfb3BzIHNkd19pbnRlbF9vcHMgPSB7Cj4+IMKgwqDCoMKg
wqAgLnBvc3RfYmFua19zd2l0Y2ggPSBpbnRlbF9wb3N0X2Jhbmtfc3dpdGNoLAo+PiDCoCB9Owo+
PiArc3RhdGljIGludCBpbnRlbF9pbml0KHN0cnVjdCBzZHdfaW50ZWwgKnNkdykKPj4gK3sKPj4g
K8KgwqDCoCAvKiBJbml0aWFsaXplIHNoaW0gYW5kIGNvbnRyb2xsZXIgKi8KPj4gK8KgwqDCoCBp
bnRlbF9saW5rX3Bvd2VyX3VwKHNkdyk7Cj4+ICvCoMKgwqAgaW50ZWxfc2hpbV9pbml0KHNkdyk7
Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gc2R3X2NkbnNfaW5pdCgmc2R3LT5jZG5zKTsKPj4gK30K
PiAKPiBXaHkgZG9uJ3Qgd2UgY2hlY2sgcG9sbGluZyBzdGF0dXMgZm9yIF9saW5rX3Bvd2VyX3Vw
PyBJJ3ZlIGFscmVhZHkgbWV0IAo+IHNsb3cgc3RhcnRpbmcgZGV2aWNlcyBpbiB0aGUgcGFzdC4g
SWYgcG9sbGluZyBmYWlscyBhbmQgLUVBR0FJTiBpcyAKPiByZXR1cm5lZCwgZmxvdyBvZiBpbml0
aWFsaXphdGlvbiBzaG91bGQgcmVhY3QgYXBwcm9wcmlhdGVseSBlLmcuIHBvbGwgCj4gdGlsbCBN
QVhfVElNRU9VVCBvZiBzb21lIHNvcnQgLW9yLSBjb2xsYXBzZS4KClRoZSBjb2RlIGRvZXMgd2hh
dCBpdCBzdGF0ZXMsIGl0IGluaXRpYWxpemVzIHRoZSBJbnRlbCBhbmQgQ2FkZW5jZSBJUHMuCgpX
aGF0IHlvdSBhcmUgcmVmZXJyaW5nIHRvIGlzIGEgZGlmZmVyZW50IHByb2JsZW06IG9uY2UgdGhl
IGJ1cyBzdGFydHMsIAp0aGVuIFNsYXZlIGRldmljZXMgd2lsbCByZXBvcnQgYXMgYXR0YWNoZWQs
IGFuZCB3aWxsIGJlIGVudW1lcmF0ZWQuIFRoaXMgCndpbGwgdGFrZSB0aW1lLiBUaGUgZGV2aWNl
cyBJIHRlc3RlZCBzaG93IHVwIGltbWVkaWF0ZWx5IGFuZCB3aXRoaW4gYSAKY291cGxlIG9mIG1z
IHRoZSBidXMgaXMgb3BlcmF0aW9uYWwuIEJ1dCBNSVBJIGFsbG93cyB0byB0aGUgc3luYyB0byB0
YWtlIAp1cCB0byA0MDk2IGZyYW1lcywgd2hpY2ggaXMgODVtcyB3aXRoIGEgNDhrSHogZnJhbWUg
cmF0ZSwgc28geWVzIHdlIGRvIApuZWVkIHRvIGxvb2sgaW50byB0aGlzLgoKV2UgY3VycmVudGx5
IGRvIG5vdCBoYXZlIGEgbm90aWZpY2F0aW9uIHRoYXQgdGVsbHMgdXMgdGhlIGJ1cyBpcyBiYWNr
IHRvIApub3JtYWwsIHRoYXQncyBhIGRlc2lnbiBmbGF3IC0gc2VlIHRoZSBsYXN0IHBhdGNoIG9m
IHRoZSBzZXJpZXMgd2hlcmUgSSAKa2lja2VkIHRoZSBjYW4gZG93biB0aGUgcm9hZCBidXQgYWRk
aW5nIGFuIGFydGlmaWNpYWwgZGVsYXkuCgpTbyB5ZXMgZ29vZCBwb2ludCBpbmRlZWQgYnV0IG9u
IHRoZSB3cm9uZyBwYXRjaCA6LSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
