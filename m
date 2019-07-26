Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20C7679A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 15:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A77D2055;
	Fri, 26 Jul 2019 15:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A77D2055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564148103;
	bh=ZaEB5KH+38xYrNIRdh5J7fE5quJNMZwqWnvyUhEDvX4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tdNhiM9OdtYQg8HREyHQ/Rc/1m4R9LGiqyiXAfhckHv6DnVuQuh15H3hRF2k6A1H1
	 s2P80NKbgc66jYBr7wk64WE5Za9JK1u8CdZsOLWRQ7MIEmOoczPImMxXIP/ZGx3BQ2
	 kqCBK8rKZvd8h7uJbakJEvcgN5ZKTpWdyavb1GC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF0F2F801A4;
	Fri, 26 Jul 2019 15:33:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A770F80393; Fri, 26 Jul 2019 15:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43A46F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 15:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A46F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 06:33:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="322039842"
Received: from msmall-mobl.amr.corp.intel.com (HELO [10.251.154.62])
 ([10.251.154.62])
 by orsmga004.jf.intel.com with ESMTP; 26 Jul 2019 06:33:06 -0700
To: Bard liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-10-pierre-louis.bossart@linux.intel.com>
 <3aa182a9-4b8e-96dd-e8f8-f2f5a90401cb@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f3468f5b-3e0a-ee4a-7e7a-734ed23fbdfa@linux.intel.com>
Date: Fri, 26 Jul 2019 08:33:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3aa182a9-4b8e-96dd-e8f8-f2f5a90401cb@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
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

Cj4+IEBAIC03NTgsMTUgKzc3NCw5IEBAIHN0YXRpYyBpbnQgX2NkbnNfZW5hYmxlX2ludGVycnVw
dChzdHJ1Y3Qgc2R3X2NkbnMgCj4+ICpjZG5zKQo+PiDCoMKgICovCj4+IMKgIGludCBzZHdfY2Ru
c19lbmFibGVfaW50ZXJydXB0KHN0cnVjdCBzZHdfY2RucyAqY2RucykKPj4gwqAgewo+PiAtwqDC
oMKgIGludCByZXQ7Cj4+IC0KPj4gwqDCoMKgwqDCoCBfY2Ruc19lbmFibGVfaW50ZXJydXB0KGNk
bnMpOwo+PiAtwqDCoMKgIHJldCA9IGNkbnNfY2xlYXJfYml0KGNkbnMsIENETlNfTUNQX0NPTkZJ
R19VUERBVEUsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBDRE5TX01DUF9D
T05GSUdfVVBEQVRFX0JJVCk7Cj4+IC3CoMKgwqAgaWYgKHJldCA8IDApCj4+IC3CoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGNkbnMtPmRldiwgIkNvbmZpZyB1cGRhdGUgdGltZWRvdXRcbiIpOwo+PiAt
wqDCoMKgIHJldHVybiByZXQ7Cj4gU2hvdWxkIHdlIGFkZCBjZG5zX3VwZGF0ZV9jb25maWcoKSBo
ZXJlPwoKaW5kZWVkLCB0aGlzIHdvdWxkIGJlIGEgZ29vZCBpbXByb3ZlbWVudC4gVGhlIGNvZGUg
d29ya3MgYmVjYXVzZSB3ZSAKYWRkZWQgdGhlIGV4aXRfcmVzZXQoKSBzZXF1ZW5jZSB3aGljaCBk
b2VzIGNhbGwgY2Ruc191cGRhdGVfY29uZmlnKCksIApidXQgYmV0dGVyIG1ha2UgdGhpcyBmdW5j
dGlvbiBzZWxmLWNvbnRhaW5lZC4gV2hlbiB3ZSBlbmFibGUgdGhlIApjbG9jay1zdG9wIG1vZGUg
d2Ugd2lsbCBub3QgZG8gdGhpcyByZXNldCBzZXF1ZW5jZS4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
