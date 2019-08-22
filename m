Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D499801
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 17:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695141666;
	Thu, 22 Aug 2019 17:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695141666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566487289;
	bh=rbmqL8PqZTP8hzlqx8y3/N2VtCPt9AjmossdREMDqc8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZXnwuxi9LgLcnDtckoHwdZDXifQYjVvYUpFTF7smuZLvhHBJP9Ma1N0iTMPYVqk9
	 PkiVKMghdsJEEuFCsdfHFBLyKHcC7E5HcfbETX05pVQA2J4AjtHnyLQ0wr9A6gHGDZ
	 Tx98BG8zxKVIrHNDbkj0s5ObPSAlZM7PJVPPVt4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8A73F80391;
	Thu, 22 Aug 2019 17:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0EE7F8036E; Thu, 22 Aug 2019 17:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D31F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 17:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D31F800BF
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="173166237"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.36.176])
 by orsmga008.jf.intel.com with ESMTP; 22 Aug 2019 08:19:30 -0700
Date: Thu, 22 Aug 2019 17:19:29 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190822151928.GB1200@ubuntu>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/5] ASoC: SOF: Intel: SoundWire
 initial integration
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

SGkgUGllcnJlLAoKSW4gcGF0Y2ggNC81IEkgZm9yZ290IHRvIG1lbnRpb24gc3VwZXJmbHVvdXMg
YnJhY2VzIGFyb3VuZCBkZXZfZXJyKCkgCmluIHNkd19jb25maWdfc3RyZWFtKCkgYW5kIHNkd19m
cmVlX3N0cmVhbSgpLiBPdGhlcndpc2UgZm9yIHRoZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogR3Vl
bm5hZGkgTGlha2hvdmV0c2tpIDxndWVubmFkaS5saWFraG92ZXRza2lAbGludXguaW50ZWwuY29t
PgoKVGhhbmtzCkd1ZW5uYWRpCgpPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwMzoxNzoxNVBNIC0w
NTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiBUaGlzIFJGQyBpcyB0aGUgY29tcGFu
aW9uIG9mIHRoZSBvdGhlciBSRkMgJ3NvdW5kd2lyZTogaW50ZWw6IHNpbXBsaWZ5Cj4gREFJL1BE
SSBoYW5kbGluZ+KAiycuIE91ciBwdXJwb3NlIGF0IHRoaXMgcG9pbnQgaXMgdG8gZ2F0aGVyIGZl
ZWRiYWNrIG9uCj4gdGhlIGludGVyZmFjZXMgYmV0d2VlbiB0aGUgSW50ZWwgU09GIHBhcnRzIGFu
ZCB0aGUgU291bmRXaXJlIGNvZGUuCj4gCj4gVGhlIHN1Z2dlc3RlZCBzb2x1dGlvbiBpcyBhIHNp
bXBsZSBpbml0L3JlbGVhc2UgaW5zZXJ0ZWQgYXQKPiBwcm9iZS9yZW1vdmUgYW5kIHJlc3VtZS9z
dXNwZW5kLCBhcyB3ZWxsIGFzIHR3byBjYWxsYmFja3MgZm9yIHRoZSBTT0YKPiBkcml2ZXIgdG8g
Z2VuZXJhdGUgSVBDIGNvbmZpZ3VyYXRpb25zIHdpdGggdGhlIGZpcm13YXJlLiBUaGF0IGxldmVs
IG9mCj4gc2VwYXJhdGlvbiBjb21wbGV0ZWx5IGhpZGVzIHRoZSBkZXRhaWxzIG9mIHRoZSBTb3Vu
ZFdpcmUgREFJcyBhbmQgd2lsbAo+IGFsbG93IGZvciAndHJhbnNwYXJlbnQnIG11bHRpLWNwdSBE
QUkgc3VwcG9ydCwgd2hpY2ggd2lsbCBiZSBoYW5kbGVkCj4gaW4gdGhlIG1hY2hpbmUgZHJpdmVy
IGFuZCB0aGUgc291bmR3aXJlIERBSXMuCj4gCj4gVGhpcyBzb2x1dGlvbiB3YXMgdGVzdGVkIG9u
IEljZUxha2UgYW5kIENvbWV0TGFrZSwgYW5kIGNhcHR1cmVzIHRoZQo+IGZlZWRiYWNrIGZyb20g
U09GIGNvbnRyaWJ1dG9ycyBvbiBhbiBpbml0aWFsIGludGVncmF0aW9uIHRoYXQgd2FzCj4gZGVl
bWVkIHRvbyBjb21wbGljYXRlZCAoYW5kIHJpZ2h0bHkgc28pLgo+IAo+IFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0ICg1KToKPiAgIEFTb0M6IFNPRjogSVBDOiBkYWktaW50ZWw6IG1vdmUgQUxIIGRlY2xh
cmF0aW9ucyBpbiBoZWFkZXIgZmlsZQo+ICAgQVNvQzogU09GOiBJbnRlbDogaGRhOiBhZGQgaGVs
cGVyIHRvIGluaXRpYWxpemUgU291bmRXaXJlIElQCj4gICBBU29DOiBTT0Y6IEludGVsOiBoZGE6
IGFkZCBTb3VuZFdpcmUgSVAgc3VwcG9ydAo+ICAgQVNvQzogU09GOiBJbnRlbDogaGRhOiBhZGQg
U291bmRXaXJlIHN0cmVhbSBjb25maWcvZnJlZSBjYWxsYmFja3MKPiAgIEFTb0M6IFNPRjogSW50
ZWw6IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgc3VzcGVuZC9yZXN1bWUKPiAKPiAgaW5jbHVk
ZS9zb3VuZC9zb2YvZGFpLWludGVsLmggfCAgMTggKystLQo+ICBzb3VuZC9zb2Mvc29mL2ludGVs
L2hkYS1kc3AuYyB8ICAxMSArKysKPiAgc291bmQvc29jL3NvZi9pbnRlbC9oZGEuYyAgICAgfCAx
NTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBzb3VuZC9zb2Mvc29mL2lu
dGVsL2hkYS5oICAgICB8ICAxMSArKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxODggaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiAKPiBiYXNlLWNvbW1pdDogM2IzYWFhMDE3ZTgwNzJi
MWJmZGRkYTkyYmUyOTZiMzQ2M2Q4NzBiZQo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
