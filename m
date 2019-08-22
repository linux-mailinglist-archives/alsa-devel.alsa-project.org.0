Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39667998B1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 18:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5C486F;
	Thu, 22 Aug 2019 18:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5C486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566489730;
	bh=mNudD4uOcGcUbZdKFNkQslpjDPl8EXEBW6fVFC/Aaa0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFr1Pv2QBwtrOwr2W4WpLHW/3+ekNE1RpzyMaRMcNr86R7UKs/M16USt7P2ZM2CL/
	 GIZZ3XA1ElNc7iQCQv39LCNkDmfrix7WQ/vUVf+VM9ib9sUUcuzPBO9pXW1wC//YLk
	 H6rivdk4ksmJ8geoBMbJODEod7QQWJK8m2OfRq7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16AB5F80391;
	Thu, 22 Aug 2019 18:00:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96D05F80391; Thu, 22 Aug 2019 18:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1271F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 18:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1271F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 09:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="330433624"
Received: from rsetyawa-mobl1.amr.corp.intel.com (HELO [10.251.3.78])
 ([10.251.3.78])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2019 09:00:14 -0700
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190822151928.GB1200@ubuntu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5cf3425a-9b09-dee8-04ab-1bd746d33723@linux.intel.com>
Date: Thu, 22 Aug 2019 11:00:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822151928.GB1200@ubuntu>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Cgo+IEluIHBhdGNoIDQvNSBJIGZvcmdvdCB0byBtZW50aW9uIHN1cGVyZmx1b3VzIGJyYWNlcyBh
cm91bmQgZGV2X2VycigpCj4gaW4gc2R3X2NvbmZpZ19zdHJlYW0oKSBhbmQgc2R3X2ZyZWVfc3Ry
ZWFtKCkuIE90aGVyd2lzZSBmb3IgdGhlIHNlcmllczoKCldpbGwgZml4LCB0aGFua3MgZm9yIHNw
b3R0aW5nIHRoaXMuCgo+IFJldmlld2VkLWJ5OiBHdWVubmFkaSBMaWFraG92ZXRza2kgPGd1ZW5u
YWRpLmxpYWtob3ZldHNraUBsaW51eC5pbnRlbC5jb20+CgpUaGFua3MsIEkgYXBwcmVjaWF0ZSB0
aGUgb3Zlcm5pZ2h0IHJldmlldyEKCj4gCj4gVGhhbmtzCj4gR3Vlbm5hZGkKPiAKPiBPbiBXZWQs
IEF1ZyAyMSwgMjAxOSBhdCAwMzoxNzoxNVBNIC0wNTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3
cm90ZToKPj4gVGhpcyBSRkMgaXMgdGhlIGNvbXBhbmlvbiBvZiB0aGUgb3RoZXIgUkZDICdzb3Vu
ZHdpcmU6IGludGVsOiBzaW1wbGlmeQo+PiBEQUkvUERJIGhhbmRsaW5n4oCLJy4gT3VyIHB1cnBv
c2UgYXQgdGhpcyBwb2ludCBpcyB0byBnYXRoZXIgZmVlZGJhY2sgb24KPj4gdGhlIGludGVyZmFj
ZXMgYmV0d2VlbiB0aGUgSW50ZWwgU09GIHBhcnRzIGFuZCB0aGUgU291bmRXaXJlIGNvZGUuCj4+
Cj4+IFRoZSBzdWdnZXN0ZWQgc29sdXRpb24gaXMgYSBzaW1wbGUgaW5pdC9yZWxlYXNlIGluc2Vy
dGVkIGF0Cj4+IHByb2JlL3JlbW92ZSBhbmQgcmVzdW1lL3N1c3BlbmQsIGFzIHdlbGwgYXMgdHdv
IGNhbGxiYWNrcyBmb3IgdGhlIFNPRgo+PiBkcml2ZXIgdG8gZ2VuZXJhdGUgSVBDIGNvbmZpZ3Vy
YXRpb25zIHdpdGggdGhlIGZpcm13YXJlLiBUaGF0IGxldmVsIG9mCj4+IHNlcGFyYXRpb24gY29t
cGxldGVseSBoaWRlcyB0aGUgZGV0YWlscyBvZiB0aGUgU291bmRXaXJlIERBSXMgYW5kIHdpbGwK
Pj4gYWxsb3cgZm9yICd0cmFuc3BhcmVudCcgbXVsdGktY3B1IERBSSBzdXBwb3J0LCB3aGljaCB3
aWxsIGJlIGhhbmRsZWQKPj4gaW4gdGhlIG1hY2hpbmUgZHJpdmVyIGFuZCB0aGUgc291bmR3aXJl
IERBSXMuCj4+Cj4+IFRoaXMgc29sdXRpb24gd2FzIHRlc3RlZCBvbiBJY2VMYWtlIGFuZCBDb21l
dExha2UsIGFuZCBjYXB0dXJlcyB0aGUKPj4gZmVlZGJhY2sgZnJvbSBTT0YgY29udHJpYnV0b3Jz
IG9uIGFuIGluaXRpYWwgaW50ZWdyYXRpb24gdGhhdCB3YXMKPj4gZGVlbWVkIHRvbyBjb21wbGlj
YXRlZCAoYW5kIHJpZ2h0bHkgc28pLgo+Pgo+PiBQaWVycmUtTG91aXMgQm9zc2FydCAoNSk6Cj4+
ICAgIEFTb0M6IFNPRjogSVBDOiBkYWktaW50ZWw6IG1vdmUgQUxIIGRlY2xhcmF0aW9ucyBpbiBo
ZWFkZXIgZmlsZQo+PiAgICBBU29DOiBTT0Y6IEludGVsOiBoZGE6IGFkZCBoZWxwZXIgdG8gaW5p
dGlhbGl6ZSBTb3VuZFdpcmUgSVAKPj4gICAgQVNvQzogU09GOiBJbnRlbDogaGRhOiBhZGQgU291
bmRXaXJlIElQIHN1cHBvcnQKPj4gICAgQVNvQzogU09GOiBJbnRlbDogaGRhOiBhZGQgU291bmRX
aXJlIHN0cmVhbSBjb25maWcvZnJlZSBjYWxsYmFja3MKPj4gICAgQVNvQzogU09GOiBJbnRlbDog
YWRkIHN1cHBvcnQgZm9yIFNvdW5kV2lyZSBzdXNwZW5kL3Jlc3VtZQo+Pgo+PiAgIGluY2x1ZGUv
c291bmQvc29mL2RhaS1pbnRlbC5oIHwgIDE4ICsrLS0KPj4gICBzb3VuZC9zb2Mvc29mL2ludGVs
L2hkYS1kc3AuYyB8ICAxMSArKysKPj4gICBzb3VuZC9zb2Mvc29mL2ludGVsL2hkYS5jICAgICB8
IDE1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgc291bmQvc29jL3Nv
Zi9pbnRlbC9oZGEuaCAgICAgfCAgMTEgKysrCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxODggaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4KPj4gYmFzZS1jb21taXQ6IDNiM2FhYTAx
N2U4MDcyYjFiZmRkZGE5MmJlMjk2YjM0NjNkODcwYmUKPj4gLS0gCj4+IDIuMjAuMQo+Pgo+PiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPj4gaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
