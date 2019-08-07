Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1585384
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 21:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA63815F2;
	Wed,  7 Aug 2019 21:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA63815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565205733;
	bh=8paQt0oVjhDlJF4nUrXbZ6YFiojFgkP/1l/Ss+hHHks=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZ9gzMqlPiG6rgRYrbDbGyo9qF0KolniZFpKEzf2Zqqn3pkuzqcssp/9RCHETPTY/
	 0EbjTLElz804aRdmV4ase+UHsGVL7DJf/++d+a4tPYTmSvdufin1nnzJvOLOPSxIVg
	 /X/SByxO+Z5BVUGRb4Gn5OrAI/1c6zJCJJrI5YI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0079EF80290;
	Wed,  7 Aug 2019 21:20:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 498FFF80290; Wed,  7 Aug 2019 21:20:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C48F800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 21:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C48F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 12:20:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="165442681"
Received: from mwdryfus-mobl.amr.corp.intel.com (HELO [10.254.191.107])
 ([10.254.191.107])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2019 12:20:21 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
 <20190807150203.26359-5-pierre-louis.bossart@linux.intel.com>
 <ac41ec50-6484-cce1-2e41-c42e6bb541ef@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af12fa5a-89ea-2eb7-a8a2-0ba24b9fa214@linux.intel.com>
Date: Wed, 7 Aug 2019 14:20:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ac41ec50-6484-cce1-2e41-c42e6bb541ef@intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 4/6] ASoC: SOF: Intel: byt: Refactor fw
 ready / mem windows creation
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

CgpPbiA4LzcvMTkgMjowNyBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+IE9uIDIwMTktMDgt
MDcgMTc6MDIsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+PiBGcm9tOiBEYW5pZWwgQmFs
dXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+Cj4gCj4+IFNvIHdlIGFyZSBiYXNpY2FsbHkgbW92
aW5nIGNvZGUgZnJvbSBpbnRlbC9ieXQuYyB0byBsb2FkZXIuYyBrZWVwaW5nCj4+IGluIG1pbmQg
dGhhdCBtYm94X29mZnNldCBpcyBhIHBlciBwbGF0Zm9ybSBjb25zdGFudCBzbyB3ZSBuZWVkIHRv
Cj4+IHVzZSBuZXdseSBpbnRyb2R1Y2VkIHNuZF9zb2ZfZHNwX2dldF9tYWlsYm94X29mZnNldCAv
Cj4+IHNuZF9zb2ZfZHNwX2dldF93aW5kb3dfb2Zmc2V0IGluIG9yZGVyIHRvIGdldCB0aGUgY29y
cmVjdAo+PiBtYm94IG9mZnNldCAvIHdpbmRvdyBvZmZzZXQgdmFsdWUuCj4gCj4gWW91J3ZlIGFs
cmVhZHkgZXhwbGFpbmVkIHlvdXIgZ29hbC4gVGhlc2UgZGV0YWlscyBhcmUgdW5uZWNlc3Nhcnku
CgpUaGV5IGRvbid0IGh1cnQgYW5kIGhlbHAgZXhwbGFpbiB0aGUgYXBwcm9hY2guCgo+IAo+Pgo+
PiBBbHNvLCBiYXIgaXMgYSBwZXIgcGxhdGZvcm0gY29uc3RhbnQgc28gd2UgdXNlIHNuZF9zb2Zf
ZHNwX2dldF9iYXJfaW5kZXgKPj4gaW5zdGVhZCBvZiB0aGUgaGFyZGNvZGVkIEJZVF9EU1BfQkFS
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQG54cC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IAo+PiA8cGllcnJlLWxv
dWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAgc291bmQvc29jL3NvZi9p
bnRlbC9ieXQuYyB8IDE2NCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+
IMKgIHNvdW5kL3NvYy9zb2YvbG9hZGVyLmPCoMKgwqAgfCAxNjggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4gwqAgc291bmQvc29jL3NvZi9zb2YtcHJpdi5owqAgfMKg
wqAgMiArCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTg5IGluc2VydGlvbnMoKyksIDE0NSBkZWxl
dGlvbnMoLSkKPiAKPiBIbW0sIGV2ZW4gdGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIHR3byBz
dGVwcywgbm90IG9uZS4gU3BsaXR0aW5nIHRoaXMgCj4gY29tbWl0IGludG8gdHdvIC0gaW50cm9k
dWN0aW9uIG9mIG5ldyBnZW5lcmljIGZ1bmN0aW9ucyBhbmQgYnl0IAo+IGFsaWdubWVudCB0b3dh
cmRzIHRoZSBuZXdseSBhZGRlZCBhcHByb2FjaCAtIHNlZW1zIHJlYXNvbmFibGUuIEJkdyAmIGhk
YSAKPiBmb2xsb3d1cHMgYWxyZWFkeSBtYWtlIGdvb2QgZXhhbXBsZXMuCgpUaGUgbGFzdCB0d28g
anVzdCByZW1vdmUgdGhlIGR1cGxpY2F0ZSBjb2RlIGFuZCBhbGlnbiBvbiB1c2luZyB0aGUgCmNv
bW1vbiBoZWxwZXJzLgpJbiB0aGUgaW5pdGlhbCBzdGVwIHdlIHN0aWxsIG5lZWQgdG8gbW92ZSB0
aGUgY29kZSBmcm9tIGJheXRyYWlsIHRvIHRoZSAKY29tbW9uIGZ1bmN0aW9uLiBEb2luZyBpdCBp
biB0d28gc3RlcHMgZG9lc24ndCBicmluZyBtdWNoIGFkZGVkIHZhbHVlIApJTU8uIFRvIHByZXNl
cnZlIGdpdCBiaXNlY3Qgc3VwcG9ydCwgeW91J2QgbmVlZCB0byBhZGQgYSBuZXcgY29tbW9uIApj
b2RlLCB0aGVuIHJlbW92ZSB0aGUgYmF5dHJhaWwgb25lIGluIGEgZm9sbG93LXVwIHBhdGNoLiBJ
dCdkIG1ha2UgaXQgCmxlc3Mgc2VsZi1leHBsYW5hdG9yeSB3aGVyZSB0aGlzIG5ldyBjb2RlIGNv
bWVzIGZyb20uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
