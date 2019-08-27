Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F54B9EBBB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 17:00:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22FE1658;
	Tue, 27 Aug 2019 16:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22FE1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566918000;
	bh=2G/tLbHBEmhGPqz7AFifqsHsWx0KVbKfbMJ0axSf3Ko=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/OGkKXhi7o1im1nIukWiXV5hl/7krz4dcXhFBLfVEbzlj6/z5ZVRz6tAdgQ7/eZo
	 okkPQvOb2CwM6JhJr3Z9wdebPsCex4xkjEQ3NQgXv6lx/ghKSegOFYwx2cRE6ixYZI
	 nxUqtfCGUF7fqUlP9d9cie6VBJzb9DxlPwSKmuVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27CA9F80274;
	Tue, 27 Aug 2019 16:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46026F80274; Tue, 27 Aug 2019 16:58:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8068EF800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8068EF800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="171221288"
Received: from blavena-mobl.ger.corp.intel.com (HELO [10.252.27.63])
 ([10.252.27.63])
 by orsmga007.jf.intel.com with ESMTP; 27 Aug 2019 07:58:01 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <a08b2547-3fe5-5c48-9513-c5ade151c01e@linux.intel.com>
 <50932a9f-2f3e-c150-77c7-f021f84ed4d1@intel.com>
 <20190823102652.GM23391@sirena.co.uk>
 <c845fda4-c18d-2ca8-7337-6e6af74d239c@intel.com>
 <70222fac-8c4e-5ceb-3c49-7020196b59df@linux.intel.com>
 <2e2a34b8-2451-01f6-79a1-14f06d1ed059@intel.com>
 <9dfd3a96-f286-34d6-fe57-9b6b8740e424@linux.intel.com>
 <20190823213920.GW23391@sirena.co.uk>
 <57196fe6-9291-5518-9fb6-731b9b5c27ed@intel.com>
 <ab5f0c6a-8d16-0848-1ca7-96286334a9bc@intel.com>
 <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
 <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
 <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
 <47683473-c177-055b-03fe-2f01feeb4016@linux.intel.com>
 <92ddf26a-f0ca-469d-2ccd-68a3e9cb2e6a@linux.intel.com>
 <49d056e3-e1f6-039b-5265-82a4052af577@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <e91d8bf1-e832-7a4d-f056-a5105648a056@intel.com>
Date: Tue, 27 Aug 2019 16:58:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <49d056e3-e1f6-039b-5265-82a4052af577@linux.intel.com>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/35] ASoC: Intel: Clenaup SST
 initialization
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

T24gMjAxOS0wOC0yNyAxNTo1MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+Pj4+
Pj4+PiBOb3QgdGhlIG1vc3QgZWxlZ2VudCBzb2x1dGlvbiBidXQgSSdtIHdvbmRlcmluZyBpZiBr
ZWVwaW5nIGEgY29weQo+Pj4+Pj4+Pj4gb2YgdGhlIGRyaXZlciBhcyBpcyBhcm91bmQgYW5kIHVz
aW5nIG5ldyBsb2NhdGlvbnMgZm9yIHRoZSBmaXhlZAo+Pj4+Pj4+Pj4gZmlybXdhcmUgbWlnaHQg
YmUgdGhlIHNhZmVzdCB3YXkgdG8gaGFuZGxlIHRoaXMuwqAgV2UgY291bGQgaGF2ZSBhCj4+Pj4+
Pj4+PiB3cmFwcGVyIHdoaWNoIHRyaWVzIHRvIGxvYWQgdGhlIG5ld2VyIGZpcm13YXJlIGFuZCB1
c2VzIHRoZSBmaXhlZAo+Pj4+Pj4+Pj4gZHJpdmVyIGNvZGUgaWYgdGhhdCdzIHRoZXJlLCBvdGhl
cndpc2UgdHJpZXMgdGhlIG9sZCBkcml2ZXIgd2l0aAo+Pj4+Pj4+Pj4gdGhlIGV4aXN0aW5nIGZp
cm13YXJlIHBhdGhzLsKgIFRoaXMgaXMgb2J2aW91c2x5IGEgaG9ycm9yIHNob3cgYW5kCj4+Pj4+
Pj4+PiBsZWF2ZXMgdGhlIG9sZCBjb2RlIHNpdHRpbmcgdGhlcmUgYnV0IGdpdmVuIHRoZSBtaXN0
YWtlcyB0aGF0Cj4+Pj4+Pj4+PiBoYXZlIGJlZW4gbWFkZSB0aGUgd2hvbGUgc2l0dWF0aW9uIGxv
b2tzIGxpa2UgYSBob3VzZSBvZiBjYXJkcy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRo
YW5rcyBmb3IgdGhlIGZlZWRiYWNrIE1hcmsuIFdoaWxlIEknbSBub3QgeWV0IG9uIHRoZSAiU09G
IHdpbGwgCj4+Pj4+Pj4+IGZpeCB0aGlzIiB0cmFpbiwgSSdtIGtlZW4gdG8gYWdyZWUgdG8gbGVh
dmluZyB0aGlzIGVudGlyZWx5IHRvIAo+Pj4+Pj4+PiBTT0YgaWYgaXQgY29tZXMgZG93biB0byB1
cyBkdXBsaWNhdGluZyAvc2t5bGFrZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSG93ZXZlciwgd2UgYXJl
IG5vdCBnb2luZyB0byBnaXZlIHVwIHRoYXQgZWFzaWx5LiBJJ2xsIHNlZSBpZiAKPj4+Pj4+Pj4g
c29tZSAiZ29sZGVuIGNvbmZpZyIgaGFyZGNvZGVzIGNhbid0IGJlIHByb3ZpZGVkIGluIHNvbWUg
Cj4+Pj4+Pj4+IGxlZ2FjeS5jIGZpbGUgd2hpY2ggd291bGQgYmUgZmV0Y2hlZCBpZiBpbml0aWFs
IHNldHVwIGZhaWxzLiAKPj4+Pj4+Pj4gRS5nLjogMmNvcmVzLCAzc3NwcywgMVBBR0VfU0laRSBw
ZXIgdHJhY2UgYnVmZmVyLi4gYW5kIHN1Y2guIAo+Pj4+Pj4+PiBUaGVyZSBhcmUgcXVpdGUgYSBm
ZXcgZmFjdG9ycyB0byB0YWtlIGludG8gY29uc2lkZXJhdGlvbiB0aG91Z2guIAo+Pj4+Pj4+PiBJ
ZiAiYXNraW5nIiB1c2VyIHZpYSBkbWVzZyB0byB1cGdyYWRlIHRoZSBmaXJtd2FyZSBpZiBoaXMv
aGVyIAo+Pj4+Pj4+PiBzZXR1cCBjb250YWlucyBvYnNvbGV0ZSBiaW5hcnkgaXMgcmVhbGx5IG5v
dCBhbiBvcHRpb24sIHRoZW4gCj4+Pj4+Pj4+IHNvbWUgbWFnaWMgd29yZHMgZ290IHRvIGJlIGlu
dm9sdmVkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDemFyZWsKPj4+Pj4+Pgo+Pj4+Pj4+IE9uIHRoZSBz
ZWNvbmQgdGhvdWdodCB3aGF0IGlmIGluc3RlYWQgb2YgZHVwbGljYXRpbmcga2VybmVsIGNvZGUs
IAo+Pj4+Pj4+IGJpbmFyaWVzIHdvdWxkIGJlIGR1cGxpY2F0ZWQ/Cj4+Pj4+Pj4gSS5lLiByYXRo
ZXIgdGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9md19jbmwuYmluLCBfbmV3XyAvc2t5bGFrZSAK
Pj4+Pj4+PiB3b3VsZCBiZSBleHBlY3RpbmcgL2ludGVsL2RzcF9md19jbmxfcmVsZWFzZS5iaW4/
IFNhbWUgd2l0aCAKPj4+Pj4+PiB0b3BvbG9neSBiaW5hcmllcy4KPj4+Pj4+PiBJbiBzdWNoIGNh
c2UsIHdlICJvbmx5IiBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IHRvIHByb3BhZ2F0ZSBuZXcgCj4+
Pj4+Pj4gZmlsZXMgdG8gTGludXggZGlzdG9zIHNvIHdoZW5ldmVyIHNvbWVvbmUgdXBkYXRlcyB0
aGVpciBrZXJuZWwsIAo+Pj4+Pj4+IG5ldyBiaW5hcmllcyBhcmUgYWxyZWFkeSBwcmVzZW50IGlu
IHRoZWlyIC9saWIvZmlybXdhcmUuCj4+Pj4+Pj4KPj4+Pj4+PiBJZiBzdWNoIG9wdGlvbiBpcyB2
YWxpZCwgd2UgY2FuIHBvc3Rwb25lIC9za3lsYWtlIHVwZ3JhZGUgdGlsbCAKPj4+Pj4+PiA1LjQg
bWVyZ2luZyB3aW5kb3cgY2xvc2VzIGFuZCB0aGUgcGF0Y2hlcyAocm91Z2ggZXN0aW1hdGlvbiBp
cyAKPj4+Pj4+PiAxNTApIHdvdWxkIGRlc2NlbmQgdXBvbiBhbHNhLWRldmVsIGluIHRpbWUgYmV0
d2VlbiA1LjQgYW5kIDUuNS4KPj4+Pj4+Cj4+Pj4+PiBJZiB0aGUgZHJpdmVyIGFuZCBGVyB1cGRh
dGUgd2lsbCBiZSB3aXRoaW4gdGhlIHNhbWUga2VybmVsIHJlbGVhc2UgCj4+Pj4+PiB0aGVuIElN
SE8KPj4+Pj4+IHRoZXJlIHNob3VsZCBiZSBubyBjb21wYXRpYmlsaXR5IHByb2JsZW0gYmV0d2Vl
biB0aG9zZSB0d28gCj4+Pj4+PiBjb21wb25lbnRzLCByaWdodD8KPj4+Pj4+IFRoaXMgd2F5IGtl
cm5lbCB1c2VycyB3aWxsaW5nIHRvIHN0aWNrIHRvIG9sZCBGVyBjYW4gc3RheSBvbiBvbGRlciAK
Pj4+Pj4+IGtlcm5lbCB2ZXJzaW9uIHdoaWxlCj4+Pj4+PiBvdGhlcnMgY2FuIHVwZGF0ZSBhbmQg
cmVjZWl2ZSBhbGwgdGhlIGxhdGVzdCBGVyBmdW5jdGlvbmFsaXR5IHRoYXQgCj4+Pj4+PiB3YXMg
ZGV2ZWxvcGVkIGFuZCBlbmFibGVkLgo+Pj4+Pgo+Pj4+PiBJIGFtIG5vdCBjb21mb3J0YWJsZSB3
aXRoIHByZWNsdWRpbmcgYSBrZXJuZWwgdXBkYXRlIGJlY2F1c2Ugb2YgYSAKPj4+Pj4gc2luZ2xl
IGZpcm13YXJlIGZpbGUuIFRoZXJlIGFyZSBhbGwgc29ydCBvZiByZWFzb25zIGZvciB1cGRhdGlu
ZyBhIAo+Pj4+PiBrZXJuZWwsIHNlY3VyaXR5LCBzaWRlYmFuZCBhdHRhY2tzIGFuZCBBbmRyb2lk
IENERCBjb21wYXRpYmlsaXR5IAo+Pj4+PiBiZWluZyB0aGUgbW9zdCBvYnZpb3VzIG9uZXMuCj4+
Pj4+Cj4+IFRoZSBzaW5nbGUgZmlybXdhcmUgZmlsZSB3aWxsIG5vdCBiZSBhIGJsb2NrZXIgYXMg
dGhlIGRyaXZlciBpbmNsdWRlZCAKPj4gaW4gdXBkYXRlZCBrZXJuZWwgd2lsbCBzdXBwb3J0IGl0
Lgo+PiBBbGwgeW91IGhhdmUgdG8gZG8gaXMgdGhlIGxpdHRsZSBlZmZvcnQgdG8gcmUtZ2VuZXJh
dGUgeW91ciBjdXN0b20gCj4+IHRvcG9sb2d5IGZvciB0aGUgbmV3IGZpcm13YXJlIHRhcmdldC4K
Pj4gVGhlIGVudGlyZSBvcGVyYXRpb24gc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0gYXMgdGhlcmUg
YXJlIGRlZGljYXRlZCAKPj4gdXRpbGl0aWVzIGxpa2UgRkRLIHRvIGRvIHRoYXQuCj4gCj4gVGhl
IGlzc3VlIGlzIHRoZSBzYW1lIHdoZXRoZXIgaXQncyBhIHRvcG9sb2d5IGZpbGUgb3IgYSBmaXJt
d2FyZSBmaWxlLiAKPiBUaGUgaWRlYWwgc2l0dWF0aW9uIGlzIHRoYXQgd2hlbiB0aGUga2VybmVs
IGlzIHVwZGF0ZWQgaXQgaGFuZGxlcyBib3RoIAo+IGluIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdh
eXMuCj4gCj4gSWYgdG8gZGVhbCB3aXRoIGEgbmV3IGZpcm13YXJlIGZpbGUgeW91IGhhdmUgdG8g
cmVnZW5lcmF0ZSBhIG5ldyAKPiB0b3BvbG9neSwgeW91IGFyZSBpbiBhIGRpZmZlcmVudCBtb2Rl
bCBhbHRvZ2V0aGVyLgo+IAo+PiBZb3VyIHN0YXRlbWVudCBQaWVycmUgc3VnZ2VzdCB0aGF0IGV2
ZXJ5b25lIHNob3VsZCBhdm9pZCBhbnkgCj4+IGZ1bmN0aW9uYWwgY2hhbmdlcyBpbiBrZXJuZWwK
Pj4gdGhhdCBhcmUgbm90IGNyaXRpY2FsIGJlY2F1c2UgdGhhdCB3b3VsZCBiZSBwcm9ibGVtYXRp
YyBmb3Igb3RoZXJzIHdobyAKPj4gc3dpdGNoIGZyb20gb2xkZXIga2VybmVsIHZlcnNpb24uCj4g
IMKgQWxsIEkgc2FpZCB3YXMgdGhhdCB5b3UgY2Fubm90IGFzc3VtZSB0aGF0IHBlb3BsZSB3aG8g
YXJlIHVzaW5nIGFuIG9sZCAKPiBmaXJtd2FyZS9kcml2ZXIgd2lsbCByZW1haW4gb24gYW4gb2xk
IGtlcm5lbC4KPiAKPiBNYXJrIG1hZGUgYW4gaW5pdGlhbCBwcm9wb3NhbCB0byBlc3NlbnRpYWxs
eSBmcmVlemUgdGhlIGN1cnJlbnQgCj4gc29sdXRpb24sIHdoaWNoIHdvdWxkIG1ha2UgaXQgcG9z
c2libGUgdG8gdXBkYXRlIHRoZSBrZXJuZWwgYnV0IGtlZXAgdGhlIAo+IHNhbWUgc2t5bGFrZSBk
cml2ZXIgaW4gbGVnYWN5L21haW50ZW5hbmNlIG1vZGUgb25seSwgYW5kIGFuICduZXcnIG9wdGlv
biAKPiB0aGF0IHdvdWxkIHJlbHkgb24gYW4gdXBkYXRlZCBkaXN0cmlidXRpb24gb2YgZmlybXdh
cmUvZHJpdmVyLiBJIGRpZCBub3QgCj4gZ2V0IHRoZSBjb3VudGVyIHByb3Bvc2FsIGZyb20gQ2V6
YXJ5IGF0IGFsbC4KCkFpbid0IG15IHByZXZpb3VzIG1lc3NhZ2U6CgotCgpPbiB0aGUgc2Vjb25k
IHRob3VnaHQgd2hhdCBpZiBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGtlcm5lbCBjb2RlLCAKYmlu
YXJpZXMgd291bGQgYmUgZHVwbGljYXRlZD8KSS5lLiByYXRoZXIgdGhhbiB0YXJnZXRpbmcgL2lu
dGVsL2RzcF9md19jbmwuYmluLCBfbmV3XyAvc2t5bGFrZSB3b3VsZCAKYmUgZXhwZWN0aW5nIC9p
bnRlbC9kc3BfZndfY25sX3JlbGVhc2UuYmluPyBTYW1lIHdpdGggdG9wb2xvZ3kgYmluYXJpZXMu
CkluIHN1Y2ggY2FzZSwgd2UgIm9ubHkiIG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gcHJvcGFn
YXRlIG5ldyBmaWxlcyB0byAKTGludXggZGlzdG9zIHNvIHdoZW5ldmVyIHNvbWVvbmUgdXBkYXRl
cyB0aGVpciBrZXJuZWwsIG5ldyBiaW5hcmllcyBhcmUgCmFscmVhZHkgcHJlc2VudCBpbiB0aGVp
ciAvbGliL2Zpcm13YXJlLgoKSWYgc3VjaCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBwb3N0cG9u
ZSAvc2t5bGFrZSB1cGdyYWRlIHRpbGwgNS40IAptZXJnaW5nIHdpbmRvdyBjbG9zZXMgYW5kIHRo
ZSBwYXRjaGVzIChyb3VnaCBlc3RpbWF0aW9uIGlzIDE1MCkgd291bGQgCmRlc2NlbmQgdXBvbiBh
bHNhLWRldmVsIGluIHRpbWUgYmV0d2VlbiA1LjQgYW5kIDUuNS4KCi0KCmEgY291bnRlciBwcm9w
b3NhbD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
