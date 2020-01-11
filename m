Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7B13815C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 13:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00B3216A6;
	Sat, 11 Jan 2020 13:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00B3216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578745223;
	bh=1l9TVqTWTK5vWYjEg6sxPbXX/htU3EvVCqjn54XTG6Y=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GUwtVMu2es5v0CIrOLvyIGdKa8/7vhvalnSUf8oqPJdNBxlXAJPLdhrPricHpFsJj
	 Z1ffquoZP5noeM8TnNFn06b1hZxrbOyEiCvo5BlfAe7vbvgefGcMZLzknmlJBlQz+p
	 Y3EXO01yMfPDFJrKHAKBj9XCpW8jHm2ts7q7tguU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE66F8010B;
	Sat, 11 Jan 2020 13:18:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3B31F800B9; Sat, 11 Jan 2020 13:18:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CC0F800B9
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 13:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CC0F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2020 04:18:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,421,1571727600"; d="scan'208";a="396689983"
Received: from syamada-mobl.amr.corp.intel.com (HELO [10.255.229.5])
 ([10.255.229.5])
 by orsmga005.jf.intel.com with ESMTP; 11 Jan 2020 04:18:26 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
 <20200108175438.13121-3-pierre-louis.bossart@linux.intel.com>
 <20200110064838.GY2818@vkoul-mobl>
 <a18c668f-4628-0fb9-ffa0-b24cdad1cc8b@linux.intel.com>
Message-ID: <69ad48b0-fa3c-904a-4106-5cd9bd18de5c@linux.intel.com>
Date: Sat, 11 Jan 2020 05:30:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a18c668f-4628-0fb9-ffa0-b24cdad1cc8b@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/6] soundwire: stream: update state
 machine and add state checks
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

CgpPbiAxLzEwLzIwIDEwOjMwIEFNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4+
IC3CoCBpbnQgc2R3X3ByZXBhcmVfc3RyZWFtKHN0cnVjdCBzZHdfc3RyZWFtX3J1bnRpbWUgKiBz
dHJlYW0pOwo+Pj4gK8KgIGludCBzZHdfcHJlcGFyZV9zdHJlYW0oc3RydWN0IHNkd19zdHJlYW1f
cnVudGltZSAqIHN0cmVhbSwgYm9vbCAKPj4+IHJlc3VtZSk7Cj4+Cj4+IHNvIHdoYXQgZG9lcyB0
aGUgYWRkaXRpb25hbCBhcmd1bWVudCBvZiByZXN1bWUgZG8uLj8KPj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvdW5kd2lyZS9zdHJlYW0uYyBiL2RyaXZlcnMvc291bmR3aXJlL3N0cmVhbS5j
Cj4+PiBpbmRleCAxNzhhZTkyYjhjYzEuLjZhYTBiNWQzNzBjMCAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvc291bmR3aXJlL3N0cmVhbS5jCj4+PiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9zdHJl
YW0uYwo+Pj4gQEAgLTE1NTMsOCArMTU1MywxOCBAQCBpbnQgc2R3X3ByZXBhcmVfc3RyZWFtKHN0
cnVjdCAKPj4+IHNkd19zdHJlYW1fcnVudGltZSAqc3RyZWFtKQo+Pgo+PiBhbmQgaXQgaXMgbm90
IG1vZGlmaWVkIGhlcmUsIHNvIGlzIHRoZSBkb2MgY29ycmVjdCBvciB0aGlzLi4/Cj4gCj4gdGhl
IGRvYyBpcyBjb3JyZWN0IGFuZCB0aGUgY29kZSBpcyB1cGRhdGVkIGluCj4gCj4gW1BBVENIIDQv
Nl0gc291bmR3aXJlOiBzdHJlYW06IGRvIG5vdCB1cGRhdGUgcGFyYW1ldGVycyBkdXJpbmcgCj4g
RElTQUJMRUQtUFJFUEFSRUQgdHJhbnNpdGlvbgoKU29ycnksIHdyb25nIGFuc3dlciwgbXkgYmFk
LiBUaGUgY29kZSBibG9jayBpbiB0aGUgZG9jdW1lbnRhdGlvbiBpcyAKaW5jb3JyZWN0LgoKVGhl
IFBhdGNoIDQvNiBpbXBsZW1lbnRzIHRoZSB0cmFuc2l0aW9uIG1lbnRpb25lZCBpbiB0aGUgZG9j
dW1lbnRhdGlvbiwgCmJ1dCB0aGUgZXh0cmEgcGFyYW1ldGVyIGlzIGEgbGVmdC1vdmVyIGZyb20g
YW4gZWFybGllciB2ZXJzaW9uLiBUaGlzIApjYXNlIGlzIG5vdyBoYW5kbGVkIGludGVybmFsbHku
IFdlIGRpZCByZXZlcnQgdG8gdGhlIGluaXRpYWwgcHJvdG90eXBlIAphZnRlciBmaW5kaW5nIG91
dCB0aGF0IGRlYWxpbmcgd2l0aCB0cmFuc2l0aW9ucyBpbiB0aGUgY2FsbGVyIGlzIAplcnJvci1w
cm9uZS4KCldpbGwgZml4IGluIHYyLCB0aGFua3MgZm9yIHNwb3R0aW5nIHRoaXMuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
