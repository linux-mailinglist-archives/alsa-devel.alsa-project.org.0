Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F159EA25
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 15:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 294681664;
	Tue, 27 Aug 2019 15:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 294681664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566914060;
	bh=CfQCGyfl0zIsfb6AR+0pEGYd5BPxAePGCXK+Z5KwgoM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jF545ahXORR+GPQLdfhPJKbr2BFIDy/9O02yb+8uzwBGyKll32MJBrvrFEl5bnJU7
	 VCw//8hLoF81PN7wUkqj0oByvh/gmfdmaE7vVl4cahZLEqdnzSz6hcp07JnXFyajb4
	 xhz1ZJfy4fD8o2xkdoBPyZvQyYGYfpt+wA76ZEF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE3DF802A1;
	Tue, 27 Aug 2019 15:52:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD742F80274; Tue, 27 Aug 2019 15:52:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A5A9F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 15:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A5A9F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 06:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="380923233"
Received: from rsmirand-mobl.amr.corp.intel.com (HELO [10.255.229.95])
 ([10.255.229.95])
 by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2019 06:52:24 -0700
To: "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <49d056e3-e1f6-039b-5265-82a4052af577@linux.intel.com>
Date: Tue, 27 Aug 2019 08:52:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92ddf26a-f0ca-469d-2ccd-68a3e9cb2e6a@linux.intel.com>
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

Cj4+Pj4+Pj4+IE5vdCB0aGUgbW9zdCBlbGVnZW50IHNvbHV0aW9uIGJ1dCBJJ20gd29uZGVyaW5n
IGlmIGtlZXBpbmcgYSBjb3B5Cj4+Pj4+Pj4+IG9mIHRoZSBkcml2ZXIgYXMgaXMgYXJvdW5kIGFu
ZCB1c2luZyBuZXcgbG9jYXRpb25zIGZvciB0aGUgZml4ZWQKPj4+Pj4+Pj4gZmlybXdhcmUgbWln
aHQgYmUgdGhlIHNhZmVzdCB3YXkgdG8gaGFuZGxlIHRoaXMuwqAgV2UgY291bGQgaGF2ZSBhCj4+
Pj4+Pj4+IHdyYXBwZXIgd2hpY2ggdHJpZXMgdG8gbG9hZCB0aGUgbmV3ZXIgZmlybXdhcmUgYW5k
IHVzZXMgdGhlIGZpeGVkCj4+Pj4+Pj4+IGRyaXZlciBjb2RlIGlmIHRoYXQncyB0aGVyZSwgb3Ro
ZXJ3aXNlIHRyaWVzIHRoZSBvbGQgZHJpdmVyIHdpdGgKPj4+Pj4+Pj4gdGhlIGV4aXN0aW5nIGZp
cm13YXJlIHBhdGhzLsKgIFRoaXMgaXMgb2J2aW91c2x5IGEgaG9ycm9yIHNob3cgYW5kCj4+Pj4+
Pj4+IGxlYXZlcyB0aGUgb2xkIGNvZGUgc2l0dGluZyB0aGVyZSBidXQgZ2l2ZW4gdGhlIG1pc3Rh
a2VzIHRoYXQKPj4+Pj4+Pj4gaGF2ZSBiZWVuIG1hZGUgdGhlIHdob2xlIHNpdHVhdGlvbiBsb29r
cyBsaWtlIGEgaG91c2Ugb2YgY2FyZHMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGFua3Mg
Zm9yIHRoZSBmZWVkYmFjayBNYXJrLiBXaGlsZSBJJ20gbm90IHlldCBvbiB0aGUgIlNPRiB3aWxs
IAo+Pj4+Pj4+IGZpeCB0aGlzIiB0cmFpbiwgSSdtIGtlZW4gdG8gYWdyZWUgdG8gbGVhdmluZyB0
aGlzIGVudGlyZWx5IHRvIAo+Pj4+Pj4+IFNPRiBpZiBpdCBjb21lcyBkb3duIHRvIHVzIGR1cGxp
Y2F0aW5nIC9za3lsYWtlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSG93ZXZlciwgd2UgYXJlIG5vdCBnb2lu
ZyB0byBnaXZlIHVwIHRoYXQgZWFzaWx5LiBJJ2xsIHNlZSBpZiAKPj4+Pj4+PiBzb21lICJnb2xk
ZW4gY29uZmlnIiBoYXJkY29kZXMgY2FuJ3QgYmUgcHJvdmlkZWQgaW4gc29tZSBsZWdhY3kuYyAK
Pj4+Pj4+PiBmaWxlIHdoaWNoIHdvdWxkIGJlIGZldGNoZWQgaWYgaW5pdGlhbCBzZXR1cCBmYWls
cy4gRS5nLjogMmNvcmVzLCAKPj4+Pj4+PiAzc3NwcywgMVBBR0VfU0laRSBwZXIgdHJhY2UgYnVm
ZmVyLi4gYW5kIHN1Y2guIFRoZXJlIGFyZSBxdWl0ZSBhIAo+Pj4+Pj4+IGZldyBmYWN0b3JzIHRv
IHRha2UgaW50byBjb25zaWRlcmF0aW9uIHRob3VnaC4gSWYgImFza2luZyIgdXNlciAKPj4+Pj4+
PiB2aWEgZG1lc2cgdG8gdXBncmFkZSB0aGUgZmlybXdhcmUgaWYgaGlzL2hlciBzZXR1cCBjb250
YWlucyAKPj4+Pj4+PiBvYnNvbGV0ZSBiaW5hcnkgaXMgcmVhbGx5IG5vdCBhbiBvcHRpb24sIHRo
ZW4gc29tZSBtYWdpYyB3b3JkcyAKPj4+Pj4+PiBnb3QgdG8gYmUgaW52b2x2ZWQuCj4+Pj4+Pj4K
Pj4+Pj4+PiBDemFyZWsKPj4+Pj4+Cj4+Pj4+PiBPbiB0aGUgc2Vjb25kIHRob3VnaHQgd2hhdCBp
ZiBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGtlcm5lbCBjb2RlLCAKPj4+Pj4+IGJpbmFyaWVzIHdv
dWxkIGJlIGR1cGxpY2F0ZWQ/Cj4+Pj4+PiBJLmUuIHJhdGhlciB0aGFuIHRhcmdldGluZyAvaW50
ZWwvZHNwX2Z3X2NubC5iaW4sIF9uZXdfIC9za3lsYWtlIAo+Pj4+Pj4gd291bGQgYmUgZXhwZWN0
aW5nIC9pbnRlbC9kc3BfZndfY25sX3JlbGVhc2UuYmluPyBTYW1lIHdpdGggCj4+Pj4+PiB0b3Bv
bG9neSBiaW5hcmllcy4KPj4+Pj4+IEluIHN1Y2ggY2FzZSwgd2UgIm9ubHkiIG5lZWQgdG8gZmln
dXJlIG91dCBob3cgdG8gcHJvcGFnYXRlIG5ldyAKPj4+Pj4+IGZpbGVzIHRvIExpbnV4IGRpc3Rv
cyBzbyB3aGVuZXZlciBzb21lb25lIHVwZGF0ZXMgdGhlaXIga2VybmVsLCAKPj4+Pj4+IG5ldyBi
aW5hcmllcyBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRoZWlyIC9saWIvZmlybXdhcmUuCj4+Pj4+
Pgo+Pj4+Pj4gSWYgc3VjaCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBwb3N0cG9uZSAvc2t5bGFr
ZSB1cGdyYWRlIHRpbGwgNS40IAo+Pj4+Pj4gbWVyZ2luZyB3aW5kb3cgY2xvc2VzIGFuZCB0aGUg
cGF0Y2hlcyAocm91Z2ggZXN0aW1hdGlvbiBpcyAxNTApIAo+Pj4+Pj4gd291bGQgZGVzY2VuZCB1
cG9uIGFsc2EtZGV2ZWwgaW4gdGltZSBiZXR3ZWVuIDUuNCBhbmQgNS41Lgo+Pj4+Pgo+Pj4+PiBJ
ZiB0aGUgZHJpdmVyIGFuZCBGVyB1cGRhdGUgd2lsbCBiZSB3aXRoaW4gdGhlIHNhbWUga2VybmVs
IHJlbGVhc2UgCj4+Pj4+IHRoZW4gSU1ITwo+Pj4+PiB0aGVyZSBzaG91bGQgYmUgbm8gY29tcGF0
aWJpbGl0eSBwcm9ibGVtIGJldHdlZW4gdGhvc2UgdHdvIAo+Pj4+PiBjb21wb25lbnRzLCByaWdo
dD8KPj4+Pj4gVGhpcyB3YXkga2VybmVsIHVzZXJzIHdpbGxpbmcgdG8gc3RpY2sgdG8gb2xkIEZX
IGNhbiBzdGF5IG9uIG9sZGVyIAo+Pj4+PiBrZXJuZWwgdmVyc2lvbiB3aGlsZQo+Pj4+PiBvdGhl
cnMgY2FuIHVwZGF0ZSBhbmQgcmVjZWl2ZSBhbGwgdGhlIGxhdGVzdCBGVyBmdW5jdGlvbmFsaXR5
IHRoYXQgCj4+Pj4+IHdhcyBkZXZlbG9wZWQgYW5kIGVuYWJsZWQuCj4+Pj4KPj4+PiBJIGFtIG5v
dCBjb21mb3J0YWJsZSB3aXRoIHByZWNsdWRpbmcgYSBrZXJuZWwgdXBkYXRlIGJlY2F1c2Ugb2Yg
YSAKPj4+PiBzaW5nbGUgZmlybXdhcmUgZmlsZS4gVGhlcmUgYXJlIGFsbCBzb3J0IG9mIHJlYXNv
bnMgZm9yIHVwZGF0aW5nIGEgCj4+Pj4ga2VybmVsLCBzZWN1cml0eSwgc2lkZWJhbmQgYXR0YWNr
cyBhbmQgQW5kcm9pZCBDREQgY29tcGF0aWJpbGl0eSAKPj4+PiBiZWluZyB0aGUgbW9zdCBvYnZp
b3VzIG9uZXMuCj4+Pj4KPiBUaGUgc2luZ2xlIGZpcm13YXJlIGZpbGUgd2lsbCBub3QgYmUgYSBi
bG9ja2VyIGFzIHRoZSBkcml2ZXIgaW5jbHVkZWQgaW4gCj4gdXBkYXRlZCBrZXJuZWwgd2lsbCBz
dXBwb3J0IGl0Lgo+IEFsbCB5b3UgaGF2ZSB0byBkbyBpcyB0aGUgbGl0dGxlIGVmZm9ydCB0byBy
ZS1nZW5lcmF0ZSB5b3VyIGN1c3RvbSAKPiB0b3BvbG9neSBmb3IgdGhlIG5ldyBmaXJtd2FyZSB0
YXJnZXQuCj4gVGhlIGVudGlyZSBvcGVyYXRpb24gc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0gYXMg
dGhlcmUgYXJlIGRlZGljYXRlZCAKPiB1dGlsaXRpZXMgbGlrZSBGREsgdG8gZG8gdGhhdC4KClRo
ZSBpc3N1ZSBpcyB0aGUgc2FtZSB3aGV0aGVyIGl0J3MgYSB0b3BvbG9neSBmaWxlIG9yIGEgZmly
bXdhcmUgZmlsZS4gClRoZSBpZGVhbCBzaXR1YXRpb24gaXMgdGhhdCB3aGVuIHRoZSBrZXJuZWwg
aXMgdXBkYXRlZCBpdCBoYW5kbGVzIGJvdGggCmluIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdheXMu
CgpJZiB0byBkZWFsIHdpdGggYSBuZXcgZmlybXdhcmUgZmlsZSB5b3UgaGF2ZSB0byByZWdlbmVy
YXRlIGEgbmV3IAp0b3BvbG9neSwgeW91IGFyZSBpbiBhIGRpZmZlcmVudCBtb2RlbCBhbHRvZ2V0
aGVyLgoKPiBZb3VyIHN0YXRlbWVudCBQaWVycmUgc3VnZ2VzdCB0aGF0IGV2ZXJ5b25lIHNob3Vs
ZCBhdm9pZCBhbnkgZnVuY3Rpb25hbCAKPiBjaGFuZ2VzIGluIGtlcm5lbAo+IHRoYXQgYXJlIG5v
dCBjcml0aWNhbCBiZWNhdXNlIHRoYXQgd291bGQgYmUgcHJvYmxlbWF0aWMgZm9yIG90aGVycyB3
aG8gCj4gc3dpdGNoIGZyb20gb2xkZXIga2VybmVsIHZlcnNpb24uCiAgQWxsIEkgc2FpZCB3YXMg
dGhhdCB5b3UgY2Fubm90IGFzc3VtZSB0aGF0IHBlb3BsZSB3aG8gYXJlIHVzaW5nIGFuIG9sZCAK
ZmlybXdhcmUvZHJpdmVyIHdpbGwgcmVtYWluIG9uIGFuIG9sZCBrZXJuZWwuCgpNYXJrIG1hZGUg
YW4gaW5pdGlhbCBwcm9wb3NhbCB0byBlc3NlbnRpYWxseSBmcmVlemUgdGhlIGN1cnJlbnQgCnNv
bHV0aW9uLCB3aGljaCB3b3VsZCBtYWtlIGl0IHBvc3NpYmxlIHRvIHVwZGF0ZSB0aGUga2VybmVs
IGJ1dCBrZWVwIHRoZSAKc2FtZSBza3lsYWtlIGRyaXZlciBpbiBsZWdhY3kvbWFpbnRlbmFuY2Ug
bW9kZSBvbmx5LCBhbmQgYW4gJ25ldycgb3B0aW9uIAp0aGF0IHdvdWxkIHJlbHkgb24gYW4gdXBk
YXRlZCBkaXN0cmlidXRpb24gb2YgZmlybXdhcmUvZHJpdmVyLiBJIGRpZCBub3QgCmdldCB0aGUg
Y291bnRlciBwcm9wb3NhbCBmcm9tIENlemFyeSBhdCBhbGwuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
