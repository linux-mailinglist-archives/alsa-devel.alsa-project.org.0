Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DD338B5
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 21:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F264B1682;
	Mon,  3 Jun 2019 20:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F264B1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559588410;
	bh=FJ3hHznUY8PxnoIaKADWqN/8LtOcImPc8mjCw60wwC0=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ML3R89nXliIvx5349aywhA47jxUi7myz6mz268ODKutzISgnvrwUubxft9qVh37Te
	 uASkzy9sExszbY6T0p0/6Jje3P9p3dlMjzobUsnub0zoyQh/co/wmACCz9ThdQj4yR
	 YKwsx6y+nkScwQYXFkQfW1IybU44WGTgqgqNd+vY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD92F896DD;
	Mon,  3 Jun 2019 20:58:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D96D7F896DD; Mon,  3 Jun 2019 20:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52CFDF80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52CFDF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 11:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,547,1549958400"; d="scan'208";a="181263887"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 11:58:16 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 98C885800BD;
 Mon,  3 Jun 2019 11:58:15 -0700 (PDT)
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
References: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
 <436681ea-6ffb-93f5-9bae-1f01d98e072f@linux.intel.com>
Message-ID: <5a6ddd11-5fb8-d11a-7765-a4f483c67ec5@linux.intel.com>
Date: Mon, 3 Jun 2019 13:58:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <436681ea-6ffb-93f5-9bae-1f01d98e072f@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 0/5] ASoC: SOF: suspend/resume debug tools
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

T24gNi8zLzE5IDEwOjQ1IEFNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAKPiBP
biA1LzI0LzE5IDI6MjMgUE0sIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+PiBObyBuZXcg
ZnVuY3Rpb25hbGl0eSBwZXIgc2UsIGp1c3QgdXRpbGl0aWVzIGZvciBkZXZlbG9wZXJzLiBUaGUg
dmFzdAo+PiBtYWpvcml0eSBvZiBjdXJyZW50IGludGVncmF0aW9uIGlzc3VlcyBhcmUgcmVsYXRl
ZCB0byBIREF1ZGlvICsgdHJhY2UKPj4gc3VwcG9ydCBjb21iaW5lZCB3aXRoIHJ1bnRpbWUgc3Vz
cGVuZC9yZXN1bWUuCj4+Cj4+IEFkZCBhIGNvdXBsZSBvZiBjaGFuZ2VzIHRvIG1ha2UgaXQgZWFz
aWVyIGZvciBkZXZlbG9wZXJzIHRvIHNlZSB0aGUKPj4gZmlybXdhcmUgbG9ncyBhY3Jvc3Mgc3Vz
cGVuZC9yZXN1bWUgdHJhbnNpdGlvbnMsIGRpc2FibGUgdGhlIHRyYWNlCj4+IGFuZC9vciBkaXNh
YmxlIHJ1bnRpbWVfcG0gdG8gaGVscCBuYXJyb3cgZG93biB0aGUgcHJvYmxlbXMuCj4+Cj4+IEth
aSBWZWhtYW5lbiAoMik6Cj4+IMKgwqAgQVNvQzogU09GOiB0cmFjZTogcmVtb3ZlIGNvZGUgZHVw
bGljYXRpb24gaW4gc29mX3dhaXRfdHJhY2VfYXZhaWwoKQo+PiDCoMKgIEFTb0M6IFNPRjogZm9y
Y2UgZW5kLW9mLWZpbGUgZm9yIGRlYnVnZnMgdHJhY2UgYXQgc3VzcGVuZAo+IAo+IEhpIE1hcmss
IHlvdSBhcHBsaWVkIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBidXQgdGhl
IGxhc3QgMyAKPiBwYXRjaGVzIHdlcmUgbGVmdCBvdXQuIFdlcmUgdGhleSBtaXNzZWQgc29tZWhv
dyBvciBpcyB0aGVyZSBhbnkgb2JqZWN0aW9uPwoKTmV2ZXIgbWluZCwgSSdsbCBoYXZlIHRvIHJl
c3VibWl0IHRoaXMgc2VyaWVzIHNpbmNlIGl0IG5vIGxvbmdlciBhcHBsaWVzIAoob3RoZXIgcGF0
Y2hlcyBtZXJnZWQgZmlyc3QpLiBObyBiaWcgZGVhbC4KCj4gCj4+IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0ICgzKToKPj4gwqDCoCBBU29DOiBTT0Y6IHRyYWNlOiBtb3ZlIHRvIG9wdC1pbiB3aXRoIEtj
b25maWcgYW5kIG1vZHVsZSBwYXJhbWV0ZXIKPj4gwqDCoCBBU29DOiBTT0Y6IGFjcGk6IGFkZCBt
b2R1bGUgcGFyYW0gdG8gZGlzYWJsZSBwbV9ydW50aW1lCj4+IMKgwqAgQVNvQzogU09GOiBwY2k6
IGFkZCBtb2R1bGUgcGFyYW0gdG8gZGlzYWJsZSBwbV9ydW50aW1lCj4+Cj4+IMKgIHNvdW5kL3Nv
Yy9zb2YvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrCj4+IMKgIHNvdW5kL3NvYy9z
b2YvY29yZS5jwqDCoMKgwqDCoMKgwqDCoCB8IDI2ICsrKysrKysrKystLS0tCj4+IMKgIHNvdW5k
L3NvYy9zb2Yvc29mLWFjcGktZGV2LmMgfCAxMiArKysrKystCj4+IMKgIHNvdW5kL3NvYy9zb2Yv
c29mLXBjaS1kZXYuY8KgIHwgMTIgKysrKysrLQo+PiDCoCBzb3VuZC9zb2Mvc29mL3NvZi1wcml2
LmjCoMKgwqDCoCB8wqAgMyArKwo+PiDCoCBzb3VuZC9zb2Mvc29mL3RyYWNlLmPCoMKgwqDCoMKg
wqDCoCB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+PiDCoCA2IGZp
bGVzIGNoYW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPj4KPj4KPj4g
YmFzZS1jb21taXQ6IDE4OGQ0NWZlNzc5ZWViOGUzNTIxYjU5ZmNiMTJjYzQ4YTZmMmMyMDMKPj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
