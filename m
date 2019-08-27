Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD699EBC8
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 17:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BFDD1668;
	Tue, 27 Aug 2019 17:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BFDD1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566918173;
	bh=Gygtywvdl1vMIx6sygtuKx9lwbK9JT6oFGp/jCxEHyg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acJQ0Z4j8VZedT99QzpAaxXHrKJN/HyVnkglfNreZ2AitV7uOeOUJrS0cavtciWTW
	 xLmmDL3Mu1Bpwb3zgH9WA2Gu+lmCVfJUQfY6r5gzDM7FrKw9B4l1hXUh2030wR+14M
	 yeVGeBHpMYcY9cUXqeM8GwkvbpdEahQTl/RkXSkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A01DF80274;
	Tue, 27 Aug 2019 17:01:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95CD6F800E7; Tue, 27 Aug 2019 17:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD0CBF80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 17:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD0CBF80142
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 08:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="380945544"
Received: from rileyrox-mobl.amr.corp.intel.com (HELO [10.254.31.52])
 ([10.254.31.52])
 by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2019 08:00:52 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
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
 <e91d8bf1-e832-7a4d-f056-a5105648a056@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c67909a4-aae4-64f2-6e55-d513030fe085@linux.intel.com>
Date: Tue, 27 Aug 2019 10:00:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e91d8bf1-e832-7a4d-f056-a5105648a056@intel.com>
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

CgpPbiA4LzI3LzE5IDk6NTggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTI3IDE1OjUyLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4+Pj4+Pj4+PiBOb3Qg
dGhlIG1vc3QgZWxlZ2VudCBzb2x1dGlvbiBidXQgSSdtIHdvbmRlcmluZyBpZiBrZWVwaW5nIGEg
Y29weQo+Pj4+Pj4+Pj4+IG9mIHRoZSBkcml2ZXIgYXMgaXMgYXJvdW5kIGFuZCB1c2luZyBuZXcg
bG9jYXRpb25zIGZvciB0aGUgZml4ZWQKPj4+Pj4+Pj4+PiBmaXJtd2FyZSBtaWdodCBiZSB0aGUg
c2FmZXN0IHdheSB0byBoYW5kbGUgdGhpcy7CoCBXZSBjb3VsZCBoYXZlIGEKPj4+Pj4+Pj4+PiB3
cmFwcGVyIHdoaWNoIHRyaWVzIHRvIGxvYWQgdGhlIG5ld2VyIGZpcm13YXJlIGFuZCB1c2VzIHRo
ZSBmaXhlZAo+Pj4+Pj4+Pj4+IGRyaXZlciBjb2RlIGlmIHRoYXQncyB0aGVyZSwgb3RoZXJ3aXNl
IHRyaWVzIHRoZSBvbGQgZHJpdmVyIHdpdGgKPj4+Pj4+Pj4+PiB0aGUgZXhpc3RpbmcgZmlybXdh
cmUgcGF0aHMuwqAgVGhpcyBpcyBvYnZpb3VzbHkgYSBob3Jyb3Igc2hvdyBhbmQKPj4+Pj4+Pj4+
PiBsZWF2ZXMgdGhlIG9sZCBjb2RlIHNpdHRpbmcgdGhlcmUgYnV0IGdpdmVuIHRoZSBtaXN0YWtl
cyB0aGF0Cj4+Pj4+Pj4+Pj4gaGF2ZSBiZWVuIG1hZGUgdGhlIHdob2xlIHNpdHVhdGlvbiBsb29r
cyBsaWtlIGEgaG91c2Ugb2YgY2FyZHMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBU
aGFua3MgZm9yIHRoZSBmZWVkYmFjayBNYXJrLiBXaGlsZSBJJ20gbm90IHlldCBvbiB0aGUgIlNP
RiAKPj4+Pj4+Pj4+IHdpbGwgZml4IHRoaXMiIHRyYWluLCBJJ20ga2VlbiB0byBhZ3JlZSB0byBs
ZWF2aW5nIHRoaXMgCj4+Pj4+Pj4+PiBlbnRpcmVseSB0byBTT0YgaWYgaXQgY29tZXMgZG93biB0
byB1cyBkdXBsaWNhdGluZyAvc2t5bGFrZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBIb3dldmVyLCB3
ZSBhcmUgbm90IGdvaW5nIHRvIGdpdmUgdXAgdGhhdCBlYXNpbHkuIEknbGwgc2VlIGlmIAo+Pj4+
Pj4+Pj4gc29tZSAiZ29sZGVuIGNvbmZpZyIgaGFyZGNvZGVzIGNhbid0IGJlIHByb3ZpZGVkIGlu
IHNvbWUgCj4+Pj4+Pj4+PiBsZWdhY3kuYyBmaWxlIHdoaWNoIHdvdWxkIGJlIGZldGNoZWQgaWYg
aW5pdGlhbCBzZXR1cCBmYWlscy4gCj4+Pj4+Pj4+PiBFLmcuOiAyY29yZXMsIDNzc3BzLCAxUEFH
RV9TSVpFIHBlciB0cmFjZSBidWZmZXIuLiBhbmQgc3VjaC4gCj4+Pj4+Pj4+PiBUaGVyZSBhcmUg
cXVpdGUgYSBmZXcgZmFjdG9ycyB0byB0YWtlIGludG8gY29uc2lkZXJhdGlvbiAKPj4+Pj4+Pj4+
IHRob3VnaC4gSWYgImFza2luZyIgdXNlciB2aWEgZG1lc2cgdG8gdXBncmFkZSB0aGUgZmlybXdh
cmUgaWYgCj4+Pj4+Pj4+PiBoaXMvaGVyIHNldHVwIGNvbnRhaW5zIG9ic29sZXRlIGJpbmFyeSBp
cyByZWFsbHkgbm90IGFuIG9wdGlvbiwgCj4+Pj4+Pj4+PiB0aGVuIHNvbWUgbWFnaWMgd29yZHMg
Z290IHRvIGJlIGludm9sdmVkLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEN6YXJlawo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBPbiB0aGUgc2Vjb25kIHRob3VnaHQgd2hhdCBpZiBpbnN0ZWFkIG9mIGR1cGxpY2F0
aW5nIGtlcm5lbCAKPj4+Pj4+Pj4gY29kZSwgYmluYXJpZXMgd291bGQgYmUgZHVwbGljYXRlZD8K
Pj4+Pj4+Pj4gSS5lLiByYXRoZXIgdGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9md19jbmwuYmlu
LCBfbmV3XyAvc2t5bGFrZSAKPj4+Pj4+Pj4gd291bGQgYmUgZXhwZWN0aW5nIC9pbnRlbC9kc3Bf
ZndfY25sX3JlbGVhc2UuYmluPyBTYW1lIHdpdGggCj4+Pj4+Pj4+IHRvcG9sb2d5IGJpbmFyaWVz
Lgo+Pj4+Pj4+PiBJbiBzdWNoIGNhc2UsIHdlICJvbmx5IiBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93
IHRvIHByb3BhZ2F0ZSBuZXcgCj4+Pj4+Pj4+IGZpbGVzIHRvIExpbnV4IGRpc3RvcyBzbyB3aGVu
ZXZlciBzb21lb25lIHVwZGF0ZXMgdGhlaXIga2VybmVsLCAKPj4+Pj4+Pj4gbmV3IGJpbmFyaWVz
IGFyZSBhbHJlYWR5IHByZXNlbnQgaW4gdGhlaXIgL2xpYi9maXJtd2FyZS4KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gSWYgc3VjaCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBwb3N0cG9uZSAvc2t5bGFrZSB1
cGdyYWRlIHRpbGwgCj4+Pj4+Pj4+IDUuNCBtZXJnaW5nIHdpbmRvdyBjbG9zZXMgYW5kIHRoZSBw
YXRjaGVzIChyb3VnaCBlc3RpbWF0aW9uIGlzIAo+Pj4+Pj4+PiAxNTApIHdvdWxkIGRlc2NlbmQg
dXBvbiBhbHNhLWRldmVsIGluIHRpbWUgYmV0d2VlbiA1LjQgYW5kIDUuNS4KPj4+Pj4+Pgo+Pj4+
Pj4+IElmIHRoZSBkcml2ZXIgYW5kIEZXIHVwZGF0ZSB3aWxsIGJlIHdpdGhpbiB0aGUgc2FtZSBr
ZXJuZWwgCj4+Pj4+Pj4gcmVsZWFzZSB0aGVuIElNSE8KPj4+Pj4+PiB0aGVyZSBzaG91bGQgYmUg
bm8gY29tcGF0aWJpbGl0eSBwcm9ibGVtIGJldHdlZW4gdGhvc2UgdHdvIAo+Pj4+Pj4+IGNvbXBv
bmVudHMsIHJpZ2h0Pwo+Pj4+Pj4+IFRoaXMgd2F5IGtlcm5lbCB1c2VycyB3aWxsaW5nIHRvIHN0
aWNrIHRvIG9sZCBGVyBjYW4gc3RheSBvbiAKPj4+Pj4+PiBvbGRlciBrZXJuZWwgdmVyc2lvbiB3
aGlsZQo+Pj4+Pj4+IG90aGVycyBjYW4gdXBkYXRlIGFuZCByZWNlaXZlIGFsbCB0aGUgbGF0ZXN0
IEZXIGZ1bmN0aW9uYWxpdHkgCj4+Pj4+Pj4gdGhhdCB3YXMgZGV2ZWxvcGVkIGFuZCBlbmFibGVk
Lgo+Pj4+Pj4KPj4+Pj4+IEkgYW0gbm90IGNvbWZvcnRhYmxlIHdpdGggcHJlY2x1ZGluZyBhIGtl
cm5lbCB1cGRhdGUgYmVjYXVzZSBvZiBhIAo+Pj4+Pj4gc2luZ2xlIGZpcm13YXJlIGZpbGUuIFRo
ZXJlIGFyZSBhbGwgc29ydCBvZiByZWFzb25zIGZvciB1cGRhdGluZyBhIAo+Pj4+Pj4ga2VybmVs
LCBzZWN1cml0eSwgc2lkZWJhbmQgYXR0YWNrcyBhbmQgQW5kcm9pZCBDREQgY29tcGF0aWJpbGl0
eSAKPj4+Pj4+IGJlaW5nIHRoZSBtb3N0IG9idmlvdXMgb25lcy4KPj4+Pj4+Cj4+PiBUaGUgc2lu
Z2xlIGZpcm13YXJlIGZpbGUgd2lsbCBub3QgYmUgYSBibG9ja2VyIGFzIHRoZSBkcml2ZXIgaW5j
bHVkZWQgCj4+PiBpbiB1cGRhdGVkIGtlcm5lbCB3aWxsIHN1cHBvcnQgaXQuCj4+PiBBbGwgeW91
IGhhdmUgdG8gZG8gaXMgdGhlIGxpdHRsZSBlZmZvcnQgdG8gcmUtZ2VuZXJhdGUgeW91ciBjdXN0
b20gCj4+PiB0b3BvbG9neSBmb3IgdGhlIG5ldyBmaXJtd2FyZSB0YXJnZXQuCj4+PiBUaGUgZW50
aXJlIG9wZXJhdGlvbiBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSBhcyB0aGVyZSBhcmUgZGVkaWNh
dGVkIAo+Pj4gdXRpbGl0aWVzIGxpa2UgRkRLIHRvIGRvIHRoYXQuCj4+Cj4+IFRoZSBpc3N1ZSBp
cyB0aGUgc2FtZSB3aGV0aGVyIGl0J3MgYSB0b3BvbG9neSBmaWxlIG9yIGEgZmlybXdhcmUgZmls
ZS4gCj4+IFRoZSBpZGVhbCBzaXR1YXRpb24gaXMgdGhhdCB3aGVuIHRoZSBrZXJuZWwgaXMgdXBk
YXRlZCBpdCBoYW5kbGVzIGJvdGggCj4+IGluIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdheXMuCj4+
Cj4+IElmIHRvIGRlYWwgd2l0aCBhIG5ldyBmaXJtd2FyZSBmaWxlIHlvdSBoYXZlIHRvIHJlZ2Vu
ZXJhdGUgYSBuZXcgCj4+IHRvcG9sb2d5LCB5b3UgYXJlIGluIGEgZGlmZmVyZW50IG1vZGVsIGFs
dG9nZXRoZXIuCj4+Cj4+PiBZb3VyIHN0YXRlbWVudCBQaWVycmUgc3VnZ2VzdCB0aGF0IGV2ZXJ5
b25lIHNob3VsZCBhdm9pZCBhbnkgCj4+PiBmdW5jdGlvbmFsIGNoYW5nZXMgaW4ga2VybmVsCj4+
PiB0aGF0IGFyZSBub3QgY3JpdGljYWwgYmVjYXVzZSB0aGF0IHdvdWxkIGJlIHByb2JsZW1hdGlj
IGZvciBvdGhlcnMgCj4+PiB3aG8gc3dpdGNoIGZyb20gb2xkZXIga2VybmVsIHZlcnNpb24uCj4+
IMKgwqBBbGwgSSBzYWlkIHdhcyB0aGF0IHlvdSBjYW5ub3QgYXNzdW1lIHRoYXQgcGVvcGxlIHdo
byBhcmUgdXNpbmcgYW4gCj4+IG9sZCBmaXJtd2FyZS9kcml2ZXIgd2lsbCByZW1haW4gb24gYW4g
b2xkIGtlcm5lbC4KPj4KPj4gTWFyayBtYWRlIGFuIGluaXRpYWwgcHJvcG9zYWwgdG8gZXNzZW50
aWFsbHkgZnJlZXplIHRoZSBjdXJyZW50IAo+PiBzb2x1dGlvbiwgd2hpY2ggd291bGQgbWFrZSBp
dCBwb3NzaWJsZSB0byB1cGRhdGUgdGhlIGtlcm5lbCBidXQga2VlcCAKPj4gdGhlIHNhbWUgc2t5
bGFrZSBkcml2ZXIgaW4gbGVnYWN5L21haW50ZW5hbmNlIG1vZGUgb25seSwgYW5kIGFuICduZXcn
IAo+PiBvcHRpb24gdGhhdCB3b3VsZCByZWx5IG9uIGFuIHVwZGF0ZWQgZGlzdHJpYnV0aW9uIG9m
IGZpcm13YXJlL2RyaXZlci4gCj4+IEkgZGlkIG5vdCBnZXQgdGhlIGNvdW50ZXIgcHJvcG9zYWwg
ZnJvbSBDZXphcnkgYXQgYWxsLgo+IAo+IEFpbid0IG15IHByZXZpb3VzIG1lc3NhZ2U6Cj4gCj4g
LQo+IAo+IE9uIHRoZSBzZWNvbmQgdGhvdWdodCB3aGF0IGlmIGluc3RlYWQgb2YgZHVwbGljYXRp
bmcga2VybmVsIGNvZGUsIAo+IGJpbmFyaWVzIHdvdWxkIGJlIGR1cGxpY2F0ZWQ/Cj4gSS5lLiBy
YXRoZXIgdGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9md19jbmwuYmluLCBfbmV3XyAvc2t5bGFr
ZSB3b3VsZCAKPiBiZSBleHBlY3RpbmcgL2ludGVsL2RzcF9md19jbmxfcmVsZWFzZS5iaW4/IFNh
bWUgd2l0aCB0b3BvbG9neSBiaW5hcmllcy4KPiBJbiBzdWNoIGNhc2UsIHdlICJvbmx5IiBuZWVk
IHRvIGZpZ3VyZSBvdXQgaG93IHRvIHByb3BhZ2F0ZSBuZXcgZmlsZXMgdG8gCj4gTGludXggZGlz
dG9zIHNvIHdoZW5ldmVyIHNvbWVvbmUgdXBkYXRlcyB0aGVpciBrZXJuZWwsIG5ldyBiaW5hcmll
cyBhcmUgCj4gYWxyZWFkeSBwcmVzZW50IGluIHRoZWlyIC9saWIvZmlybXdhcmUuCj4gCj4gSWYg
c3VjaCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBwb3N0cG9uZSAvc2t5bGFrZSB1cGdyYWRlIHRp
bGwgNS40IAo+IG1lcmdpbmcgd2luZG93IGNsb3NlcyBhbmQgdGhlIHBhdGNoZXMgKHJvdWdoIGVz
dGltYXRpb24gaXMgMTUwKSB3b3VsZCAKPiBkZXNjZW5kIHVwb24gYWxzYS1kZXZlbCBpbiB0aW1l
IGJldHdlZW4gNS40IGFuZCA1LjUuCj4gCj4gLQo+IAo+IGEgY291bnRlciBwcm9wb3NhbD8KCnlv
dSBkaWRuJ3QgZXhwbGFpbiBob3cgdGhlICdkdXBsaWNhdGVkIGJpbmFyaWVzJyB3b3VsZCBiZSBz
ZWxlY3RlZC4gQW5kIAonaW5zdGVhZCBvZicgbWVhbnMgeW91IHN1Z2dlc3RlZCBhbiBhbHRlcm5h
dGl2ZSB0byBNYXJrJ3MgcHJvcG9zYWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
