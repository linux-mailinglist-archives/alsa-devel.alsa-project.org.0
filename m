Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D056976B48
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 442432064;
	Fri, 26 Jul 2019 16:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 442432064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564150614;
	bh=dD6ts4ON5z2hQb0zQho5Dl+ncxvjCEGY+P9FmTG2L+A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GsnCqB/aDctBJmrfIJ2a9O0969w1cETd63jAJlptvicwNXfkfXxsVbdwtIYaWjXcb
	 dP9rLbMudSVQ1uR7X+kcT62oCWHb/J0uPU+0sp+PbZhQZJetVgmjGyxvfPNPx1dcFI
	 ftiP8kopVaUSWfXC2tbHb5BTb6JO/RWqmc8GF6ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AF19F803D5;
	Fri, 26 Jul 2019 16:15:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B81F80393; Fri, 26 Jul 2019 16:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9073EF800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9073EF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322050604"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:15:00 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-21-pierre-louis.bossart@linux.intel.com>
 <f718d6ae-6654-210b-4152-6692091130c9@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0ef40222-46b2-1f5e-2482-ae1f48a91241@linux.intel.com>
Date: Fri, 26 Jul 2019 09:15:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f718d6ae-6654-210b-4152-6692091130c9@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 20/40] soundwire: prototypes for
 suspend/resume
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

CgpPbiA3LzI2LzE5IDU6MDQgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTog
UGllcnJlLUxvdWlzIEJvc3NhcnQgCj4+IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRl
bC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5oIHwg
MyArKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb3VuZHdpcmUvY2FkZW5jZV9tYXN0ZXIuaCAKPj4gYi9kcml2ZXJzL3Nv
dW5kd2lyZS9jYWRlbmNlX21hc3Rlci5oCj4+IGluZGV4IGMwYmY2ZmYwMGE0NC4uZDM3NWJiZmVh
ZDE4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9jYWRlbmNlX21hc3Rlci5oCj4+
ICsrKyBiL2RyaXZlcnMvc291bmR3aXJlL2NhZGVuY2VfbWFzdGVyLmgKPj4gQEAgLTE2NSw2ICsx
NjUsOSBAQCBpbnQgc2R3X2NkbnNfZW5hYmxlX2ludGVycnVwdChzdHJ1Y3Qgc2R3X2NkbnMgKmNk
bnMpOwo+PiDCoCB2b2lkIHNkd19jZG5zX2RlYnVnZnNfaW5pdChzdHJ1Y3Qgc2R3X2NkbnMgKmNk
bnMsIHN0cnVjdCBkZW50cnkgKnJvb3QpOwo+PiAraW50IHNkd19jZG5zX3N1c3BlbmQoc3RydWN0
IHNkd19jZG5zICpjZG5zKTsKPj4gK2Jvb2wgc2R3X2NkbnNfY2hlY2tfcmVzdW1lX3N0YXR1cyhz
dHJ1Y3Qgc2R3X2NkbnMgKmNkbnMpOwo+PiArCj4+IMKgIGludCBzZHdfY2Ruc19nZXRfc3RyZWFt
KHN0cnVjdCBzZHdfY2RucyAqY2RucywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IHNkd19jZG5zX3N0cmVhbXMgKnN0cmVhbSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdTMyIGNoLCB1MzIgZGlyKTsKPj4KPiAKPiBObyBjb21taXQgbWVzc2FnZSwgZ3Vlc3MgaXQn
cyBTUVVBU0hNRSBjb21taXQgYW5kIHNob3VsZG4ndCBiZSBwYXJ0IG9mIAo+IG92ZXJhbGwgc2Vy
aWVzLgoKSSBjYW4ndCByZWNhbGwgd2h5IGl0J3Mgc2VwYXJhdGUsIHdpbGwgbG9vayBpbnRvIHRo
aXMuIFRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
