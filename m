Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C253D9C2F8
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2019 13:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 113AD166B;
	Sun, 25 Aug 2019 13:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 113AD166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566731327;
	bh=uTFjDDT4jBaIxQ+dVTZaZP0UVcOEZlsOgd/LAO1CD2g=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+LLTjk3lgpwddSqcQYMBfYai8fhrvkwZWjfyBAbYdpNgRUeI65h4pdys73nw59X3
	 ertNc+JpO6vvEVrhXSH75Tfz/N6IUTU1Dg2CkceHwo2CezEgvwcAZzK6U506s+gIv+
	 NSU9S7Qa8HU2rOgGLZy98VglWb5IjMmyVfNeb3q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6A3EF80268;
	Sun, 25 Aug 2019 13:07:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B27BF80213; Sun, 25 Aug 2019 13:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC4FF801ED
 for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2019 13:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC4FF801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Aug 2019 04:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,429,1559545200"; d="scan'208";a="379342683"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.200])
 ([10.252.26.200])
 by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2019 04:06:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Message-ID: <ab5f0c6a-8d16-0848-1ca7-96286334a9bc@intel.com>
Date: Sun, 25 Aug 2019 13:06:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <57196fe6-9291-5518-9fb6-731b9b5c27ed@intel.com>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, alsa-devel@alsa-project.org,
 "Kaczmarski, Filip" <filip.kaczmarski@intel.com>, tiwai@suse.com,
 lgirdwood@gmail.com
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

T24gMjAxOS0wOC0yNCAxNTo1MSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+IE9uIDIwMTktMDgt
MjMgMjM6MzksIE1hcmsgQnJvd24gd3JvdGU6Cj4+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDAz
OjEyOjE4UE0gLTA1MDAsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4gT24gOC8yMy8x
OSAxOjQ0IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Cj4+Pj4gV2Fzbid0IGx5aW5nIGFi
b3V0IEZXIHZlcnNpb24gYmVpbmcgdW5yZWxpYWJsZS4gTGV0J3Mgc2F5IHZlbmRvcgo+Pj4+IHJl
Y2VpdmVzIHF1aWNrIEZXIGRyb3Agd2l0aCBuZXcgUkNSLi4gc3VjaCBlbmcgZHJvcCBtYXkgY2Fy
cnkgaW52YWxpZAo+Pj4+IG51bWJlcnMgc3VjaCBhcyAwLjAuMC4wLi4KPj4+PiBJbiBnZW5lcmFs
LCBJIHRyeSB0byBhdm9pZCByZWx5aW5nIG9uIEZXIHZlcnNpb24gd2hlbmV2ZXIgcG9zc2libGUu
IEl0Cj4+Pj4gY2FuIGJlIGR1bXBlZCBmb3IgZGVidWcgcmVhc29ucywgdHJ1ZSwgYnV0IHRvIGJl
IHJlbGllZCBvbj8gTm90IHJlYWxseS4KPj4KPj4+IEdvb2RuZXNzLCB0aGF0J3MgcmVhbGx5IGJh
ZC4gSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzLgo+Pgo+PiBBdCBhIHByZXZpb3VzIGVtcGxveWVyIEkg
bW9kaWZpZWQgb3VyIGJ1aWxkIHN0YW1waW5nCj4+IGluZnJhc3RydWN0dXJlIHRvIGFsc28gaW5j
bHVkZSBib3RoIGEgdGltZXN0YW1wIGFuZCBhIHNlcmlhbGl6ZWQKPj4gYnVpbGQgbnVtYmVyIGlu
IHRoZSB2ZXJzaW9uIG51bWJlciBzaW5jZSBvbmUgb2YgbXkgY29sbGVhZ3VlcyB3YXMKPj4gZm9u
ZCBvZiBzZW5kaW5nIHBlb3BsZSBwcmVyZWxlYXNlcyBvZiB3aGF0IGhlIHdhcyB3b3JraW5nIG9u
IHRvCj4+IG90aGVyIHBlb3BsZSB3aXRoIGlkZW50aWNhbCB2ZXJzaW9uIG51bWJlcnMgb24gZGlm
ZmVyZW50Cj4+IGJpbmFyaWVzIGxlYWRpbmcgdG8gbXVjaCBjb25mdXNpb24gYW5kIGNoZWNrc3Vt
bWluZy7CoCBZb3UgZG8gc2VlCj4+IGEgbG90IG9mIHRoaW5ncyB3aXRoIHRob3NlIHNlcmlhbGl6
ZWQgdmVyc2lvbiBudW1iZXJzLCBlc3BlY2lhbGx5Cj4+IFNWTiBiYXNlZCBwcm9qZWN0cy4KPj4K
Pj4+PiBQZXJzb25hbGx5LCBJJ20gYWdhaW5zdCBhbGwgaGFyZGNvZGVzIGFuZCB3b3VsZCBzaW1w
bHkgcmVjb21tZW5kIGFsbAo+Pj4+IHVzZXIgdG8gcmVkaXJlY3QgdGhlaXIgc3ltbGlua3Mgd2hl
biB0aGV5IGRvIHN3aXRjaCBrZXJuZWwgLSBhbG9uZyB3aXRoCj4+Pj4gZHVtcGluZyB3YXJuaW5n
LyBlcnJvciBtZXNzYWdlIGluIGRtZXNnLiBIYXJkY29kZXMgYnJpbmcgcHJvYmxlbXMgd2l0aAo+
Pj4+IGZvcndhcmQgY29tcGF0aWJpbGl0eSBhbmQgdGhhdCdzIHdoeSBob3N0IHNob3VsZCBvZmZs
b2FkIHRoZW0gYXdheSB0bwo+Pj4+IEZXLgo+Pgo+Pj4gQ2V6YXJ5LCBJIGtub3cgeW91IGFyZSBu
b3QgcmVzcG9uc2libGUgZm9yIGFsbCB0aGlzLCBidXQgYXQgdGhpcyAKPj4+IHBvaW50IGlmIHdl
Cj4+PiAoSW50ZWwpIGNhbid0IGd1YXJhbnRlZSBhbnkgc29ydCBvZiBpbnRlcm9wZXJhYmlsaXR5
IHdpdGggYm90aCAKPj4+IGZpcm13YXJlIGFuZAo+Pj4gdG9wb2xvZ3kgd2Ugc2hvdWxkIG1ha2Ug
aXQgY2xlYXIgdGhhdCB0aGlzIGRyaXZlciBpcyBub3QgcmVjb21tZW5kZWQgCj4+PiB1bmxlc3MK
Pj4+IHNwZWNpZmljIHZlcnNpb25zIG9mIHRoZSBmaXJtd2FyZS90b3BvbG9neSBhcmUgdXNlZCwg
YW5kIGFzIGEgCj4+PiBjb25zZXF1ZW5jZQo+Pj4gdGhlIHR5cGljYWwgY2xpZW50IGRpc3Ryb3Mg
YW5kIGRlc2t0b3AvbGFwdG9wIHVzZXJzIHNob3VsZCB1c2UgSERhdWRpbwo+Pj4gbGVnYWN5IG9y
IFNPRiAoZm9yIERNSUNzKQo+Pgo+PiBOb3QgdGhlIG1vc3QgZWxlZ2VudCBzb2x1dGlvbiBidXQg
SSdtIHdvbmRlcmluZyBpZiBrZWVwaW5nIGEgY29weQo+PiBvZiB0aGUgZHJpdmVyIGFzIGlzIGFy
b3VuZCBhbmQgdXNpbmcgbmV3IGxvY2F0aW9ucyBmb3IgdGhlIGZpeGVkCj4+IGZpcm13YXJlIG1p
Z2h0IGJlIHRoZSBzYWZlc3Qgd2F5IHRvIGhhbmRsZSB0aGlzLsKgIFdlIGNvdWxkIGhhdmUgYQo+
PiB3cmFwcGVyIHdoaWNoIHRyaWVzIHRvIGxvYWQgdGhlIG5ld2VyIGZpcm13YXJlIGFuZCB1c2Vz
IHRoZSBmaXhlZAo+PiBkcml2ZXIgY29kZSBpZiB0aGF0J3MgdGhlcmUsIG90aGVyd2lzZSB0cmll
cyB0aGUgb2xkIGRyaXZlciB3aXRoCj4+IHRoZSBleGlzdGluZyBmaXJtd2FyZSBwYXRocy7CoCBU
aGlzIGlzIG9idmlvdXNseSBhIGhvcnJvciBzaG93IGFuZAo+PiBsZWF2ZXMgdGhlIG9sZCBjb2Rl
IHNpdHRpbmcgdGhlcmUgYnV0IGdpdmVuIHRoZSBtaXN0YWtlcyB0aGF0Cj4+IGhhdmUgYmVlbiBt
YWRlIHRoZSB3aG9sZSBzaXR1YXRpb24gbG9va3MgbGlrZSBhIGhvdXNlIG9mIGNhcmRzLgo+Pgo+
IAo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIE1hcmsuIFdoaWxlIEknbSBub3QgeWV0IG9uIHRo
ZSAiU09GIHdpbGwgZml4IAo+IHRoaXMiIHRyYWluLCBJJ20ga2VlbiB0byBhZ3JlZSB0byBsZWF2
aW5nIHRoaXMgZW50aXJlbHkgdG8gU09GIGlmIGl0IAo+IGNvbWVzIGRvd24gdG8gdXMgZHVwbGlj
YXRpbmcgL3NreWxha2UuCj4gCj4gSG93ZXZlciwgd2UgYXJlIG5vdCBnb2luZyB0byBnaXZlIHVw
IHRoYXQgZWFzaWx5LiBJJ2xsIHNlZSBpZiBzb21lIAo+ICJnb2xkZW4gY29uZmlnIiBoYXJkY29k
ZXMgY2FuJ3QgYmUgcHJvdmlkZWQgaW4gc29tZSBsZWdhY3kuYyBmaWxlIHdoaWNoIAo+IHdvdWxk
IGJlIGZldGNoZWQgaWYgaW5pdGlhbCBzZXR1cCBmYWlscy4gRS5nLjogMmNvcmVzLCAzc3Nwcywg
MVBBR0VfU0laRSAKPiBwZXIgdHJhY2UgYnVmZmVyLi4gYW5kIHN1Y2guIFRoZXJlIGFyZSBxdWl0
ZSBhIGZldyBmYWN0b3JzIHRvIHRha2UgaW50byAKPiBjb25zaWRlcmF0aW9uIHRob3VnaC4gSWYg
ImFza2luZyIgdXNlciB2aWEgZG1lc2cgdG8gdXBncmFkZSB0aGUgZmlybXdhcmUgCj4gaWYgaGlz
L2hlciBzZXR1cCBjb250YWlucyBvYnNvbGV0ZSBiaW5hcnkgaXMgcmVhbGx5IG5vdCBhbiBvcHRp
b24sIHRoZW4gCj4gc29tZSBtYWdpYyB3b3JkcyBnb3QgdG8gYmUgaW52b2x2ZWQuCj4gCj4gQ3ph
cmVrCgpPbiB0aGUgc2Vjb25kIHRob3VnaHQgd2hhdCBpZiBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5n
IGtlcm5lbCBjb2RlLCAKYmluYXJpZXMgd291bGQgYmUgZHVwbGljYXRlZD8KSS5lLiByYXRoZXIg
dGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9md19jbmwuYmluLCBfbmV3XyAvc2t5bGFrZSB3b3Vs
ZCAKYmUgZXhwZWN0aW5nIC9pbnRlbC9kc3BfZndfY25sX3JlbGVhc2UuYmluPyBTYW1lIHdpdGgg
dG9wb2xvZ3kgYmluYXJpZXMuCkluIHN1Y2ggY2FzZSwgd2UgIm9ubHkiIG5lZWQgdG8gZmlndXJl
IG91dCBob3cgdG8gcHJvcGFnYXRlIG5ldyBmaWxlcyB0byAKTGludXggZGlzdG9zIHNvIHdoZW5l
dmVyIHNvbWVvbmUgdXBkYXRlcyB0aGVpciBrZXJuZWwsIG5ldyBiaW5hcmllcyBhcmUgCmFscmVh
ZHkgcHJlc2VudCBpbiB0aGVpciAvbGliL2Zpcm13YXJlLgoKSWYgc3VjaCBvcHRpb24gaXMgdmFs
aWQsIHdlIGNhbiBwb3N0cG9uZSAvc2t5bGFrZSB1cGdyYWRlIHRpbGwgNS40IAptZXJnaW5nIHdp
bmRvdyBjbG9zZXMgYW5kIHRoZSBwYXRjaGVzIChyb3VnaCBlc3RpbWF0aW9uIGlzIDE1MCkgd291
bGQgCmRlc2NlbmQgdXBvbiBhbHNhLWRldmVsIGluIHRpbWUgYmV0d2VlbiA1LjQgYW5kIDUuNS4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
