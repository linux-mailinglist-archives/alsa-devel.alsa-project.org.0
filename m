Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCE762D8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 11:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74FD6201F;
	Fri, 26 Jul 2019 11:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74FD6201F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564134965;
	bh=bS/+ahGNMrLAWYRnjbJAfZwznO1Dw5ZvfEclP/sNtFg=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncyNDSYxMMMUJC/8120bT3VMo1EFi8kzoO285NQbvimkgAmT2oy11w9zWWyYtBUt1
	 W3NxcL6zrmm/82s5KbJjAnOJRFcM8Eb+Ho2hVW1NAJYiG2iEeTvS9JguMOfGShEauq
	 /zDBTz/BYWWnYahZoaWhdQh3fUH7fJJ6HGbQVPFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3986F80393;
	Fri, 26 Jul 2019 11:55:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 849DAF80393; Fri, 26 Jul 2019 11:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD9A7F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 11:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD9A7F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 02:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="175549843"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by orsmga006.jf.intel.com with ESMTP; 26 Jul 2019 02:54:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-10-pierre-louis.bossart@linux.intel.com>
 <980e074e-0736-1b17-266b-2ef0ae7d7823@intel.com>
Message-ID: <c317cf0f-9487-2137-3451-ea4a514e5225@intel.com>
Date: Fri, 26 Jul 2019 11:54:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <980e074e-0736-1b17-266b-2ef0ae7d7823@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 09/40] soundwire: cadence_master: fix
 usage of CONFIG_UPDATE
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

CgpPbiAyMDE5LTA3LTI2IDExOjUzLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0w
Ny0yNiAwMTo0MCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+IMKgIC8qCj4+IMKgwqAg
KiBkZWJ1Z2ZzCj4+IMKgwqAgKi8KPj4gQEAgLTc1OCwxNSArNzc0LDkgQEAgc3RhdGljIGludCBf
Y2Ruc19lbmFibGVfaW50ZXJydXB0KHN0cnVjdCBzZHdfY2RucyAKPj4gKmNkbnMpCj4+IMKgwqAg
Ki8KPj4gwqAgaW50IHNkd19jZG5zX2VuYWJsZV9pbnRlcnJ1cHQoc3RydWN0IHNkd19jZG5zICpj
ZG5zKQo+PiDCoCB7Cj4+IC3CoMKgwqAgaW50IHJldDsKPj4gLQo+PiDCoMKgwqDCoMKgIF9jZG5z
X2VuYWJsZV9pbnRlcnJ1cHQoY2Rucyk7Cj4+IC3CoMKgwqAgcmV0ID0gY2Ruc19jbGVhcl9iaXQo
Y2RucywgQ0ROU19NQ1BfQ09ORklHX1VQREFURSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIENETlNfTUNQX0NPTkZJR19VUERBVEVfQklUKTsKPj4gLcKgwqDCoCBpZiAocmV0
IDwgMCkKPj4gLcKgwqDCoMKgwqDCoMKgIGRldl9lcnIoY2Rucy0+ZGV2LCAiQ29uZmlnIHVwZGF0
ZSB0aW1lZG91dFxuIik7Cj4+IC3CoMKgwqAgcmV0dXJuIHJldDsKPj4gK8KgwqDCoCByZXR1cm4g
MDsKPj4gwqAgfQo+PiDCoCBFWFBPUlRfU1lNQk9MKHNkd19jZG5zX2VuYWJsZV9pbnRlcnJ1cHQp
Owo+IAo+IFJhdGhlciB0aGFuIGlnbm9yaW5nIF9jZG5zX2VuYWJsZV9pbnRlcnJ1cHQgLSBkZXNw
aXRlIHNhaWQgZnVuYyBhbHdheXMgCj4gcmV0dXJuaW5nIDAgLSBzaW1wbHkgZG86IHJldHVybiBf
Y25kc19lbmFibGVfaW50ZXJydXB0KGNkbnMpIGFuZCBmbGFnIAo+IGNhbGxlciB3aXRoIGlubGlu
ZS4KPiAKPiBBZnRlcndhcmRzLCBvbmUgY2FuIHRoaW5rIGlmIHN1Y2ggZW5jYXBzdWxhdGlvbiBp
cyBldmVuIHJlcXVpcmVkIC0gCj4gcmVtb3ZlIGV4aXN0aW5nIHNkd19jZG5zX2VuYWJsZV9pbnRl
cnJ1cHQgYW5kIHJlbmFtZSAKPiBfY25kc19lbmFibGVfaW50ZXJydXB0PwoKTmV2ZXJtaW5kLCBJ
IHNlZSB5b3Ugc2ltcGxpZmllZCBpdCBpbiB0aGUgbmV4dCBwYXRjaC4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
