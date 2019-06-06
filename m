Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F1137490
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 14:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE381669;
	Thu,  6 Jun 2019 14:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE381669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559825753;
	bh=kCEvap2rB29nne+nY2yo2h7XB6GRKkYVxj6F+s8KgPE=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDJ14kA4U+7oPb5zlJoUakgoLKy0sSNkFCjciKJwyB4ZDK7VTJhoMb8Xapabw1zig
	 aTyl8AYtUMwmp7X2Q2Q3Y2qF1nwqzUs+bmXqL3Qv/OJN4ia9nyDjqzn6bDg+GC9avV
	 UN3kwIp6ZzA5xsUey/Gcf3ypj+dp5Dd+ZCCURRDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D146F896F8;
	Thu,  6 Jun 2019 14:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9B2FF896F7; Thu,  6 Jun 2019 14:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7960F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 14:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7960F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 05:53:59 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2019 05:53:57 -0700
Date: Thu, 6 Jun 2019 14:57:44 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190606145744.4ea389db@xxx>
In-Reply-To: <190f5c09-e6ae-918e-3fcc-d91a72a895da@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
 <20190605134556.10322-3-amadeuszx.slawinski@linux.intel.com>
 <190f5c09-e6ae-918e-3fcc-d91a72a895da@linux.intel.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 02/14] ALSA: hdac: fix memory release for
 SST and SOF drivers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gV2VkLCA1IEp1biAyMDE5IDEwOjA2OjQ3IC0wNTAwClBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxw
aWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBPbiA2LzUvMTkg
ODo0NSBBTSwgQW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6Cj4gPiBEdXJpbmcgdGhlIGludGVn
cmF0aW9uIG9mIEhEYXVkaW8gc3VwcG9ydCwgd2UgY2hhbmdlZCB0aGUgd2F5IGluCj4gPiB3aGlj
aCB3ZSBnZXQgaGRldiBpbiBzbmRfaGRhY19leHRfYnVzX2RldmljZV9pbml0KCkgdG8gdXNlIG9u
ZQo+ID4gcHJlYWxsb2NhdGVkIHdpdGggZGV2bV9remFsbG9jKCksIGhvd2V2ZXIgaXQgc3RpbGwg
bGVmdCBrZnJlZShoZGV2KQo+ID4gaW4gc25kX2hkYWNfZXh0X2J1c19kZXZpY2VfZXhpdCgpLiBJ
dCBsZWFkcyB0byBvb3BzZXMgd2hlbiB0cnlpbmcgdG8KPiA+IHJtbW9kIGFuZCBtb2Rwcm9iZS4g
Rml4IGl0LCBieSBqdXN0IHJlbW92aW5nIGtmcmVlIGNhbGwuCj4gPiAKPiA+IFNPRiBhbHNvIHVz
ZXMgc29tZSBvZiB0aGUgc25kX2hkYWNfIGZ1bmN0aW9ucyBmb3IgSERBdWRpbyBzdXBwb3J0Cj4g
PiBidXQgYWxsb2NhdGVkIHRoZSBtZW1vcnkgd2l0aCBremFsbG9jLiBBIG1hdGNoaW5nIGZpeCBp
cyBwcm92aWRlZAo+ID4gc2VwYXJhdGVseSB0byBhbGlnbiBhbGwgdXNlcnMgb2YgdGhlIHNuZF9o
ZGFjXyBsaWJyYXJ5LiAgCj4gCj4gVGhlcmUgYXJlIHN0YWJpbGl0eSBpc3N1ZXMgd2l0aCB0aGlz
IGNoYW5nZSAoYWxyZWFkeSBzaGFyZWQgaW4gYSAKPiBzZXBhcmF0ZSBzZXJpZXMpIGFuZCBhZGRp
dGlvbmFsIGZpbmRpbmdzIHJlcG9ydGVkIGJ5IExpYmluIHNvIHRoaXMgCj4gc2hvdWxkIG5vdCBi
ZSBhcHBsaWVkIGZvciBub3cuCj4gCgpZZXMsIGFzIG1lbnRpb25lZCBpbiBjb3ZlciBsZXR0ZXIg
dGhlcmUgaXMgcGVuZGluZyBkaXNjdXNzaW9uLCBJCnByb3ZpZGVkIGl0IGZvciBjb21wbGV0ZW5l
c3MuCgo+ID4gCj4gPiBGaXhlczogNjI5ODU0MmZhMzNiICgiQUxTQTogaGRhYzogcmVtb3ZlIG1l
bW9yeSBhbGxvY2F0aW9uIGZyb20KPiA+IHNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX2luaXQiKSBS
ZXZpZXdlZC1ieTogVGFrYXNoaSBJd2FpCj4gPiA8dGl3YWlAc3VzZS5kZT4gU2lnbmVkLW9mZi1i
eTogQW1hZGV1c3ogU8WCYXdpxYRza2kKPiA+IDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4Lmlu
dGVsLmNvbT4gU2lnbmVkLW9mZi1ieTogUGllcnJlLUxvdWlzCj4gPiBCb3NzYXJ0IDxwaWVycmUt
bG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+IC0tLQo+ID4gICBzb3VuZC9oZGEvZXh0L2hk
YWNfZXh0X2J1cy5jIHwgMSAtCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCj4gPiBiL3Nv
dW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMgaW5kZXggYzIwM2FmNzFhMDk5Li5mMzNiYTU4Yjc1
M2MKPiA+IDEwMDY0NCAtLS0gYS9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCj4gPiArKysg
Yi9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCj4gPiBAQCAtMTcwLDcgKzE3MCw2IEBAIEVY
UE9SVF9TWU1CT0xfR1BMKHNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX2luaXQpOwo+ID4gICB2b2lk
IHNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX2V4aXQoc3RydWN0IGhkYWNfZGV2aWNlICpoZGV2KQo+
ID4gICB7Cj4gPiAgIAlzbmRfaGRhY19kZXZpY2VfZXhpdChoZGV2KTsKPiA+IC0Ja2ZyZWUoaGRl
dik7Cj4gPiAgIH0KPiA+ICAgRVhQT1JUX1NZTUJPTF9HUEwoc25kX2hkYWNfZXh0X2J1c19kZXZp
Y2VfZXhpdCk7Cj4gPiAgIAo+ID4gICAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
