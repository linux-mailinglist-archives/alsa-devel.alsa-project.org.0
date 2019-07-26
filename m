Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5110376AFD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89002065;
	Fri, 26 Jul 2019 16:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89002065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564149862;
	bh=PlyQCpQTeMUR98G1YsqbJ+0AWe3uMbF2pTdGblbtf3o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jQO1+jka/3sJIVMKoPyUO9ZeB7J1pKGWCwcTkZRGPtkDdmtjkCb7B6L/rIjue/jqx
	 ZYTnZMeYaov6F/YZWixyMvrRU+eVfbOWccj6jRVLUn+XEMEQW65NTBH7zbjKpazLzM
	 xkhjlK/UMHgqYqIiwaEomuSo1CzEO44JKQIT9tqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 458C6F803D1;
	Fri, 26 Jul 2019 16:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A348AF80393; Fri, 26 Jul 2019 16:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 124E7F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 124E7F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322047360"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 07:02:30 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-7-pierre-louis.bossart@linux.intel.com>
 <1e814ab9-9606-88a5-3181-6cdb203671c3@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f7cc450c-5a87-4ee3-ff35-e588d03da7d8@linux.intel.com>
Date: Fri, 26 Jul 2019 09:02:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1e814ab9-9606-88a5-3181-6cdb203671c3@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 06/40] soundwire: intel: prevent
 possible dereference in hw_params
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

Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9pbnRlbC5jIGIvZHJpdmVycy9zb3Vu
ZHdpcmUvaW50ZWwuYwo+PiBpbmRleCA2ODgzMmU2MTNiMWUuLjQ5Nzg3OWRkOWMwZCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9zb3VuZHdpcmUvaW50ZWwuYwo+PiArKysgYi9kcml2ZXJzL3NvdW5k
d2lyZS9pbnRlbC5jCj4+IEBAIC01MDksNyArNTA5LDcgQEAgc3RhdGljIGludCBpbnRlbF9jb25m
aWdfc3RyZWFtKHN0cnVjdCBzZHdfaW50ZWwgKnNkdywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc25kX3BjbV9od19wYXJhbXMg
Kmh3X3BhcmFtcywgaW50IGxpbmtfaWQpCj4+IMKgIHsKPj4gLcKgwqDCoCBpZiAoc2R3LT5yZXMt
Pm9wcyAmJiBzZHctPnJlcy0+b3BzLT5jb25maWdfc3RyZWFtKQo+PiArwqDCoMKgIGlmIChzZHct
PnJlcy0+b3BzICYmIHNkdy0+cmVzLT5vcHMtPmNvbmZpZ19zdHJlYW0gJiYgc2R3LT5yZXMtPmFy
ZykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBzZHctPnJlcy0+b3BzLT5jb25maWdfc3Ry
ZWFtKHNkdy0+cmVzLT5hcmcsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3Vic3RyZWFtLCBkYWksIGh3X3BhcmFtcywgbGlua19pZCk7Cj4+Cj4gCj4gSG1tLCBkZWNsYXJp
bmcgbG9jYWwgZm9yIHNkdy0+cmVzIHNob3VsZCBwcm92ZSB1c2VmdWwgaGVyZSBhZnRlciAKPiBh
ZGRpdGlvbiBvZiA0dGggc2R3LT5yZXMgZGVyZWZlcmVuY2UuCgp5ZXMsIGl0J3MgYW4gZXllc29y
ZS4gSSBhZGRlZCB0aGlzIHRvIHF1aWNrbHkgZml4IGEga2VybmVsIG9vcHMgd2hpbGUgCmRlYnVn
Z2luZywgd2lsbCBzaW1wbGlmeS4gdGhhbmtzIGZvciB0aGUgbm90ZS4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
