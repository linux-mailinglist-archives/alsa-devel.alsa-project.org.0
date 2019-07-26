Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880F76BF1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25992093;
	Fri, 26 Jul 2019 16:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25992093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564152368;
	bh=X5XDaI409IMqHaB/lKB/gDdni41/FbFlH6zRfbnG6hY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rBdta0x+5n+WsjidnTa7mW+gmksCCVY28Ex/DwdES237MlsvqK5/UPo4UO87I+qVX
	 FnHbJzSZOAipEh67h4YiKxbvW8s2kNaxPiNUv2FoJ5y6gzR20FohEVqIIMoo4kubT1
	 rlxlWyNkkaF5+JkWO9q30uF+2jLCZCj2wcJ/PQKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A508F803D6;
	Fri, 26 Jul 2019 16:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3833DF803F3; Fri, 26 Jul 2019 16:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 449D4F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 449D4F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322055734"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:43:34 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-30-pierre-louis.bossart@linux.intel.com>
 <c1d859dc-3fd6-0be7-2240-c3b1f3240c0a@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a8ac6b27-ce30-2a76-aeab-d01acbac4265@linux.intel.com>
Date: Fri, 26 Jul 2019 09:43:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c1d859dc-3fd6-0be7-2240-c3b1f3240c0a@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 29/40] soundwire: intel_init: add
 kernel module parameter to filter out links
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

CgpPbiA3LzI2LzE5IDU6MzAgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA3
LTI2IDAxOjQwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4gQEAgLTgzLDYgKzg3LDkg
QEAgc3RhdGljIHN0cnVjdCBzZHdfaW50ZWxfY3R4Cj4+IMKgwqDCoMKgwqAgY2FwcyA9IGlvcmVh
ZDMyKHJlcy0+bW1pb19iYXNlICsgU0RXX1NISU1fQkFTRSArIFNEV19TSElNX0xDQVApOwo+PiDC
oMKgwqDCoMKgIGNhcHMgJj0gR0VOTUFTSygyLCAwKTsKPj4gK8KgwqDCoCBkZXZfZGJnKCZhZGV2
LT5kZXYsICJTb3VuZFdpcmUgbGlua3M6IEJJT1MgY291bnQgJWQgaGFyZHdhcmUgY2FwcyAKPj4g
JWRcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoCBjb3VudCwgY2Fwcyk7Cj4+ICsKPj4gwqDCoMKgwqDC
oCAvKiBDaGVjayBIVyBzdXBwb3J0ZWQgdnMgcHJvcGVydHkgdmFsdWUgYW5kIHVzZSBtaW4gb2Yg
dHdvICovCj4+IMKgwqDCoMKgwqAgY291bnQgPSBtaW5fdCh1OCwgY2FwcywgY291bnQpOwo+IAo+
IFRoaXMgbWVzc2FnZSBkb2VzIG5vdCBsb29rIGxpa2UgaXQgYmVsb25ncyB0byBjdXJyZW50IHBh
dGNoIC0gbm8gCj4gbGlua19tYXNrIGRlcGVuZGVuY3kgd2hhdHNvZXZlci4gVGhlcmUgaGF2ZSBi
ZWVuIGNvdXBsZSAiaW5mb3JtYXRpdmUiIAo+IHBhdGNoZXMgaW4geW91ciBzZXJpZXMsIG1heWJl
IHNjaGVkdWxlIGl0IHdpdGggdGhlbSBpbnN0ZWFkIChhcyBhIAo+IHNlcGFyYXRlIHNlcmllcyk/
CgpZb3UncmUgcmlnaHQsIHRoaXMgbG9nIHNob3VsZCBiZSBpbiBhIGRpZmZlcmVudCBwYXRjaC4g
aXQgd2FzIGFkZGVkIHdoZW4gCkkgd2FzIGRlYnVnZ2luZyB0aGUgRGlzQ28gcHJvcGVydGllcyBh
IGNvdXBsZSBvZiBtb250aHMgYmFjayBhbmQgc2hvdWxkIApiZSBtb3ZlZC4gdGhhbmtzIGZvciBu
b3RpbmcgdGhpcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
