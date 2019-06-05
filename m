Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6235FE3
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 17:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8A44E;
	Wed,  5 Jun 2019 17:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8A44E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559747321;
	bh=+S8ikQAF6w5hcTdQUwzRALjySsxvxeVuDmPHkU7cJdo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=go2zCaxLRQVmPZqE/sBL81MXIn2nTS2kCN4TMjnR8xdZNi/xEo7GqQmuthkXcid9x
	 rA7uQE00RJA7Ctx6YTI29EIS3XavpiXHhWDcWGgoTmoUqXAOH3bjSQLUQ7/Dxv1FGh
	 R46AwiNPJ7y7nsfJakDWHjvxyUe7AggBCeWq7xHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E68C7F896DD;
	Wed,  5 Jun 2019 17:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F469F896DD; Wed,  5 Jun 2019 17:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DD95F896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 17:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD95F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 08:06:47 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 08:06:47 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 755CC5800BD;
 Wed,  5 Jun 2019 08:06:46 -0700 (PDT)
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
 <20190605134556.10322-3-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <190f5c09-e6ae-918e-3fcc-d91a72a895da@linux.intel.com>
Date: Wed, 5 Jun 2019 10:06:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605134556.10322-3-amadeuszx.slawinski@linux.intel.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gNi81LzE5IDg6NDUgQU0sIEFtYWRldXN6IFPFgmF3acWEc2tpIHdyb3RlOgo+IER1cmluZyB0
aGUgaW50ZWdyYXRpb24gb2YgSERhdWRpbyBzdXBwb3J0LCB3ZSBjaGFuZ2VkIHRoZSB3YXkgaW4g
d2hpY2gKPiB3ZSBnZXQgaGRldiBpbiBzbmRfaGRhY19leHRfYnVzX2RldmljZV9pbml0KCkgdG8g
dXNlIG9uZSBwcmVhbGxvY2F0ZWQKPiB3aXRoIGRldm1fa3phbGxvYygpLCBob3dldmVyIGl0IHN0
aWxsIGxlZnQga2ZyZWUoaGRldikgaW4KPiBzbmRfaGRhY19leHRfYnVzX2RldmljZV9leGl0KCku
IEl0IGxlYWRzIHRvIG9vcHNlcyB3aGVuIHRyeWluZyB0bwo+IHJtbW9kIGFuZCBtb2Rwcm9iZS4g
Rml4IGl0LCBieSBqdXN0IHJlbW92aW5nIGtmcmVlIGNhbGwuCj4gCj4gU09GIGFsc28gdXNlcyBz
b21lIG9mIHRoZSBzbmRfaGRhY18gZnVuY3Rpb25zIGZvciBIREF1ZGlvIHN1cHBvcnQgYnV0Cj4g
YWxsb2NhdGVkIHRoZSBtZW1vcnkgd2l0aCBremFsbG9jLiBBIG1hdGNoaW5nIGZpeCBpcyBwcm92
aWRlZAo+IHNlcGFyYXRlbHkgdG8gYWxpZ24gYWxsIHVzZXJzIG9mIHRoZSBzbmRfaGRhY18gbGli
cmFyeS4KClRoZXJlIGFyZSBzdGFiaWxpdHkgaXNzdWVzIHdpdGggdGhpcyBjaGFuZ2UgKGFscmVh
ZHkgc2hhcmVkIGluIGEgCnNlcGFyYXRlIHNlcmllcykgYW5kIGFkZGl0aW9uYWwgZmluZGluZ3Mg
cmVwb3J0ZWQgYnkgTGliaW4gc28gdGhpcyAKc2hvdWxkIG5vdCBiZSBhcHBsaWVkIGZvciBub3cu
Cgo+IAo+IEZpeGVzOiA2Mjk4NTQyZmEzM2IgKCJBTFNBOiBoZGFjOiByZW1vdmUgbWVtb3J5IGFs
bG9jYXRpb24gZnJvbSBzbmRfaGRhY19leHRfYnVzX2RldmljZV9pbml0IikKPiBSZXZpZXdlZC1i
eTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgo+IFNpZ25lZC1vZmYtYnk6IEFtYWRldXN6
IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGlu
dXguaW50ZWwuY29tPgo+IC0tLQo+ICAgc291bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMuYyB8IDEg
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291
bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMuYyBiL3NvdW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMK
PiBpbmRleCBjMjAzYWY3MWEwOTkuLmYzM2JhNThiNzUzYyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9o
ZGEvZXh0L2hkYWNfZXh0X2J1cy5jCj4gKysrIGIvc291bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMu
Ywo+IEBAIC0xNzAsNyArMTcwLDYgQEAgRVhQT1JUX1NZTUJPTF9HUEwoc25kX2hkYWNfZXh0X2J1
c19kZXZpY2VfaW5pdCk7Cj4gICB2b2lkIHNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX2V4aXQoc3Ry
dWN0IGhkYWNfZGV2aWNlICpoZGV2KQo+ICAgewo+ICAgCXNuZF9oZGFjX2RldmljZV9leGl0KGhk
ZXYpOwo+IC0Ja2ZyZWUoaGRldik7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MX0dQTChzbmRfaGRh
Y19leHRfYnVzX2RldmljZV9leGl0KTsKPiAgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
