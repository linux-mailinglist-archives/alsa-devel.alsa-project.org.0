Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F849D613
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B168316B5;
	Mon, 26 Aug 2019 20:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B168316B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566845828;
	bh=X2jFI7lgGLUgVfCLclL9AvGcJzMwNy2hx0Uw1Fx/XKE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t9VbJYkeHyVkLnQHHxB8bOz0NUdzN1s5p/slbYxAOh6UsVB4jzifotAWLstnTV6hg
	 c9DpajzMVXS2Y0c6N5Sfoh/ZNP3VO4DwiN416ms1S0GcQ6FZbWBFTwe0ITvpq6vJCA
	 5dvoDUmBaXa4kzLWEp47jB5lFCNGj9sQsWO64sW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D53BCF805F5;
	Mon, 26 Aug 2019 20:55:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 825D9F80390; Mon, 26 Aug 2019 20:55:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 365A5F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365A5F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 11:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="185044399"
Received: from dmitra-mobl.amr.corp.intel.com (HELO [10.252.138.53])
 ([10.252.138.53])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2019 11:55:17 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 robh+dt@kernel.org, vkoul@kernel.org
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
 <7da8aa89-2119-21d1-0e29-8894a8d40bf0@linux.intel.com>
 <37be6b6d-7e7f-2cd6-f9e9-f0cac48791ad@linaro.org>
 <d538238d-25d8-f179-c900-90be50ce814d@linux.intel.com>
 <7ee47f26-12f8-6028-cb83-7f59e669979f@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e5b184be-02f1-faa4-94fa-79bda8936d9d@linux.intel.com>
Date: Mon, 26 Aug 2019 11:22:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ee47f26-12f8-6028-cb83-7f59e669979f@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
 slave bindings
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

Cj4+Pj4+ICt0aXRsZTogU291bmRXaXJlIENvbnRyb2xsZXIgR2VuZXJpYyBCaW5kaW5nCj4+Pj4+
ICsKPj4+Pj4gK21haW50YWluZXJzOgo+Pj4+PiArwqAgLSBTcmluaXZhcyBLYW5kYWdhdGxhIDxz
cmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4+Pj4+ICsKPj4+Pj4gK2Rlc2NyaXB0aW9u
OiB8Cj4+Pj4+ICvCoCBTb3VuZFdpcmUgYnVzc2VzIGNhbiBiZSBkZXNjcmliZWQgd2l0aCBhIG5v
ZGUgZm9yIHRoZSBTb3VuZFdpcmUgCj4+Pj4+IGNvbnRyb2xsZXIKPj4+Pj4gK8KgIGRldmljZSBh
bmQgYSBzZXQgb2YgY2hpbGQgbm9kZXMgZm9yIGVhY2ggU291bmRXaXJlIHNsYXZlIG9uIHRoZSAK
Pj4+Pj4gYnVzLgo+Pj4+PiArCj4+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+PiArwqAgJG5vZGVuYW1l
Ogo+Pj4+PiArwqDCoMKgIHBhdHRlcm46ICJec291bmR3aXJlKEAuKnwtWzAtOWEtZl0pKiQiCj4+
Cj4+IHJlLXJlYWRpbmcgdGhpcywgaXQgbG9va3MgbGlrZSB5b3UgYXJlIGRlZmluaW5nIHRoZSBj
b250cm9sbGVyIAo+PiBiaW5kaW5ncywgYnV0IHRoZXJlIGFyZSBubyByZWFsIGNvbnRyb2xsZXIt
bGV2ZWwgcHJvcGVydGllcyBleGNlcHQgZm9yIAo+PiB0aGUgZmFjdCB0aGF0IHRoZXkgaW5jbHVk
ZSBzbGF2ZSBiaW5kaW5ncz8KPj4KPiBZZXMsIEVhY2ggdmVuZG9yIHNwZWNpZmljIG1hc3RlciBj
YW4gaGF2ZSB0aGVyZSBzcGVjaWZpYyBwcm9wZXJ0aWVzIAo+IGhlcmUsIHRoaXMgaXMganVzdCB0
byByZXByZXNlbnQgaG93IHNsYXZlIG5vZGVzIHJlcHJlc2VudGVkIHcuci50IHRvIAo+IG1hc3Rl
ciBub2Rlcy4KCkkgYW0gbm90IGNsZWFyIG9uIGhvdyBhIHZlbmRvciB3b3VsZCBkb2N1bWVudCB0
aG9zZSBjb250cm9sbGVyIApwcm9wZXJ0aWVzIHRoZW4/CgpBbmQgdGhlIG51bWJlciBvZiBsaW5r
cyBkb2Vzbid0IHNlZW0gbGlrZSBhIHZlbmRvci1zcGVjaWZpYyBkZWZpbml0aW9uLCAKaWYgeW91
IGluY2x1ZGUgdGhlIGxpbmtJRCBpbiB0aGUgcmVnaXN0ZXIgaW5mb3JtYXRpb24gYmVsb3cgaXQn
ZCBoZWxwIHRvIAprbm93biBob3cgbWFueSBsaW5rcyBjYW4gYmUgZW5hYmxlZCwgd2hpY2ggb25l
cyBhcmUgdXNlZCAoaWYgdGhlcmUgaXMgCmFueSBwaW4tbXV4KSBhbmQgY2hlY2sgaWYgdGhlIGNv
bmZpZ3VyYXRpb25zIGFyZSBjb3JyZWN0LgoKPiAKPj4gSW4gTUlQSSB0aGUgbm90aW9uIG9mIGNv
bnRyb2xsZXIgaXMgdGhhdCBpdCBjYW4gZGVhbCB3aXRoIG11bHRpcGxlIAo+PiBsaW5rcywgZWFj
aCBvZiB3aGljaCBoYXZpbmcgc3BlY2lmaWMgcHJvcGVydGllcyAoY2xvY2sgc3BlZWQsIGNsb2Nr
IAo+PiBzdG9wIHByb3BlcnRpZXMsIGV0YykuCj4+Cj4+Pj4+ICsKPj4+Pj4gK8KgICIjYWRkcmVz
cy1jZWxscyI6Cj4+Pj4+ICvCoMKgwqAgY29uc3Q6IDIKPj4+Pj4gKwo+Pj4+PiArwqAgIiNzaXpl
LWNlbGxzIjoKPj4+Pj4gK8KgwqDCoCBjb25zdDogMAo+Pj4+PiArCj4+Pj4+ICtwYXR0ZXJuUHJv
cGVydGllczoKPj4+Pj4gK8KgICJeLipAWzAtOWEtZl0rJCI6Cj4+Pj4+ICvCoMKgwqAgdHlwZTog
b2JqZWN0Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4+PiArwqDCoMKgwqDC
oCBjb21wYXRpYmxlOgo+Pj4+PiArwqDCoMKgwqDCoCBwYXR0ZXJuOiAiXnNkd1swLTldWzAtOWEt
Zl17NH1bMC05YS1mXXs0fVswLTlhLWZdezJ9JCIKPj4+Pgo+Pj4+IFNvIGlzIHRoaXMgYSA2NC1i
aXQgdmFsdWUsIGFzIGluIHRoZSBNSVBJIHNwZWMsIG9yIGlzIHRoaXMgcGFydCBvZiAKPj4+PiB0
aGUgX0FEUiBkZXNjcmlwdGlvbj8KPj4+Cj4+PiBSb2IgZGlkIG5vdCBsaWtlIGVuY29kaW5nIGNv
bXBhdGlibGUgc3RyaW5nIGV4YWN0bHkgbGlrZSBfQURSIGVuY29kaW5nLgo+Pj4KPj4+IGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDE5LzgvMjIvNDkwCj4+Cj4+IFdvbmRlcmluZyBpZiB3ZSBhcmUg
dGFsa2luZyBhYm91dCBkaWZmZXJlbnQgY29uY2VwdHM/Cj4+Cj4+IFJvYidzIHBvaW50IHdhcyBh
Ym91dCB0aGUgSW5zdGFuY2VJRAo+Pgo+PiAiQXNzdW1pbmcgeW91IGNvdWxkIGhhdmUgbW9yZSB0
aGFuIDEgb2YgdGhlIHNhbWUgZGV2aWNlIG9uIHRoZSBidXMsCj4+IHRoZW4geW91IG5lZWQgc29t
ZSB3YXkgdG8gZGlzdGluZ3Vpc2ggdGhlbSBhbmQgdGhlIHdheSB0aGF0J3MgZG9uZSBmb3IKPj4g
RFQgaXMgdW5pdC1hZGRyZXNzL3JlZy4gQW5kIGNvbXBhdGlibGUgc3RyaW5ncyBzaG91bGQgYmUg
Y29uc3RhbnQgZm9yCj4+IGVhY2ggaW5zdGFuY2UuIgo+Pgo+PiBZb3UgY2FuIHVzZSB0aGUgTUlQ
SSBlbmNvZGluZyAqZXhjZXB0KiBmb3IgdGhlIEluc3RhbmNlSUQsIHRoYXQnZCBiZSAKPj4gZmlu
ZS4gSXQnbGwganVzdCBiZSBhIGJpdCB3ZWlyZCBzaW5jZSB0aGUgU2xhdmUgZGV2aWNlIHdpbGwg
cmVwb3J0IHRoZSAKPj4gNDggYml0cyB0aGF0IGluY2x1ZGUgdGhlIEluc3RhbmNlIElELCBzbyB5
b3UnbGwgaGF2ZSB0byBzcGVjaWFsIGNhc2UgCj4+IHRoaXMgZmllbGQsIGJ1dCBpZiB0aGlzIGlz
IGEgRFQgcmVxdWlyZW1lbnQgdGhlbiBmaW5lLgo+Pgo+PiBSb2IncyBwb2ludCBkb2VzIG5vdCBh
cHBseSB0byB0aGUgbGluayBJRCAtIHdoaWNoIGlzIHVzZWQgd2hlbiB5b3UgCj4+IGhhdmUgbXVs
dGlwbGUgbWFzdGVycyBpbiB5b3VyIGNvbnRyb2xsZXIuIFRoZSBTbGF2ZSBkZXZpY2UgaXMgYXR0
YWNoZWQgCj4+IGluIG9uZSBsb2NhdGlvbiBhbmQgd2lsbCBuZXZlciBtb3ZlLCBzbyB0aGF0IGlz
IGEgY29uc3RhbnQgdmFsdWUuCj4gCj4gUG9pbnQgaXMgdGhhdCB0aGlzIGNvbXBhdGlibGUgaXMg
Zm9yIHNsYXZlIGRldmljZSwgaXQgc2hvdWxkIG5vdCBtYXR0ZXIgCj4gd2hlcmUgYW5kIGhvdyB0
aGUgc2xhdmUgaXMgY29ubmVjdGVkLCBjb21wYXRpYmxlIHNob3VsZCBiZSBjb25zdGFudCAKPiBp
cnJlc3BlY3RpdmUgb2YgTGluayBJRC4KPiBMZXRzIHNheSBmb3IgZXhhbXBsZSBpZiBXU0E4ODF4
IHNsYXZlIGRldmljZSBpcyBjb25uZWN0ZWQgdG8gYSAKPiBzaW5nbGUtTGluayBDb250cm9sbGVy
IGFuZCB0aGUgc2FtZSBkZXZpY2UgaXMgY29ubmVjdGVkIHRvIGEgCj4gTXVsdGlMaW5rLWNvbnRy
b2xsZXIgdGhlbiB3ZSB3b3VsZCBlbmR1cCBpbiBtb3JlIHRoYW4gb25lIGNvbXBhdGlibGUgCj4g
c3RyaW5nIGZvciBXU0E4ODF4IGRyaXZlci4gPgo+IAo+ICBGcm9tIERpc2NvIFNwZWNpYyBpdCBj
bGVhcmx5IHNheXMgdGhhdCBMaW5rSUQgdmFsdWVzIGFyZSByZWxhdGl2ZQo+IHRvIHRoZSBpbW1l
ZGlhdGUgcGFyZW50IERldmljZS4gU28gaGF2aW5nIExpbmtJRCBpbiBjb21wYXRpYmxlIHN0cmlu
ZyBpcyAKPiB2ZXJ5IGZyYWdpbGUuCgpvaywgZmluZSB0aGVuLgoKPiAKPj4KPj4+Cj4+Pj4gSSBh
bHNvIGRvbid0IGdldCB3aHkgdGhlIGZpcnN0IGl0ZW0gaW4gaW4gYmFzZTEwPwo+Pj4+Cj4+Pgo+
Pj4gQXMgdGhpcyBjb3JyZXNwb25kcyB0byBTb3VuZHdpcmUgVmVyc2lvbiwgYW5kIEkgaGF2ZSBu
byB2aXNpYmlsaXR5IG9mIAo+Pj4gdmVyc2lvbiBudW1iZXIgZW5jb2RpbmcgYWZ0ZXIgcmVhY2hp
bmcgbnVtYmVyIDkgaW4gdGhpcyBmaWVsZC4KPj4+Cj4+PiBUaGlzIGNhbiBiZSB1cGRhdGVkIG9u
Y2Ugd2UgaGF2ZSBtb3JlIGluZm8gb24gaG93IHRoZSBWZXJzaW9uIAo+Pj4gZW5jb2Rpbmcgd2ls
bCBsb29rIGxpa2UgaW4gZnV0dXJlLgo+Pj4KPj4+IElkZWEgb2YgbGltaXRpbmcgcmVnZXggdG8g
WzAtOV0gZm9yIHZlcnNpb24gaXMgdG8gZW5mb3JjZSBzb21lIGNoZWNraW5nIQo+Pgo+PiB0aGUg
dmVyc2lvbiBpcyBhIDQgYml0IHZhbHVlIHN0YXJ0aW5nIGF0IDEgZm9yIFNvdW5kV2lyZSAxLjAu
IFRoZXJlIGlzIAo+PiBub3RoaW5nIGluIHRoZSBzcGVjIHRoYXQgdGFsa3MgYWJvdXQgYSBsaW1p
dCB0byA5Lgo+Pgo+PiBJdCdzIHVubGlrZWx5IHdlJ2xsIGV2ZXIgcmVhY2ggdGhhdCBidXQgeW91
IGFyZSBpbnRlcnByZXRpbmcgYSBzcGVjIAo+PiBoZXJlLiBwbHVzIGp1c3QgYmVsb3cgeW91IG1l
bnRpb24gYWxsIGZpZWxkcyBhcyBiZWluZyBoZXhhZGVjaW1hbC4KPj4KPiBBbSBoYXBweSB0byBj
aGFuZ2UgdGhpcyB0bwo+IAo+IHBhdHRlcm46ICJec2R3WzAtOWEtZl1bMC05YS1mXXs0fVswLTlh
LWZdezR9WzAtOWEtZl17Mn0kIgo+IAo+IGlmIHlvdSBhcmUgb2theSB3aXRoIHJlc3Qgb2YgdGhl
IHN0dWZmLgoKeWVzLCBvay4KCj4gCj4gdGhhbmtzLAo+IHNyaW5pCj4+Pgo+Pj4gLS1zcmluaQo+
Pj4KPj4+Pgo+Pj4+PiArwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjoKPj4+Pj4gK8KgwqDCoMKgwqAg
SXMgdGhlIHRleHR1YWwgcmVwcmVzZW50YXRpb24gb2YgU291bmRXaXJlIEVudW1lcmF0aW9uCj4+
Pj4+ICvCoMKgwqDCoMKgIGFkZHJlc3MuIGNvbXBhdGlibGUgc3RyaW5nIHNob3VsZCBjb250YWlu
IFNvdW5kV2lyZSBWZXJzaW9uIElELAo+Pj4+PiArwqDCoMKgwqDCoCBNYW51ZmFjdHVyZXIgSUQs
IFBhcnQgSUQgYW5kIENsYXNzIElEIGluIG9yZGVyIGFuZCBzaGFsbCBiZSBpbgo+Pj4+PiArwqDC
oMKgwqDCoCBsb3dlci1jYXNlIGhleGFkZWNpbWFsIHdpdGggbGVhZGluZyB6ZXJvZXMuCj4+Pj4+
ICvCoMKgwqDCoMKgIFZhbGlkIHNpemVzIG9mIHRoZXNlIGZpZWxkcyBhcmUKPj4+Pj4gK8KgwqDC
oMKgwqAgVmVyc2lvbiBJRCBpcyAxIG5pYmJsZSwgbnVtYmVyICcweDEnIHJlcHJlc2VudHMgU291
bmRXaXJlIDEuMAo+Pj4+PiArwqDCoMKgwqDCoCBhbmQgJzB4MicgcmVwcmVzZW50cyBTb3VuZFdp
cmUgMS4xIGFuZCBzbyBvbi4KPj4+Pj4gK8KgwqDCoMKgwqAgTUZEIGlzIDQgbmliYmxlcwo+Pj4+
PiArwqDCoMKgwqDCoCBQSUQgaXMgNCBuaWJibGVzCj4+Pj4+ICvCoMKgwqDCoMKgIENJRCBpcyAy
IG5pYmJsZXMKPj4+Pj4gK8KgwqDCoMKgwqAgTW9yZSBJbmZvcm1hdGlvbiBvbiBkZXRhaWwgb2Yg
ZW5jb2Rpbmcgb2YgdGhlc2UgZmllbGRzIGNhbiBiZQo+Pj4+PiArwqDCoMKgwqDCoCBmb3VuZCBp
biBNSVBJIEFsbGlhbmNlIERpc0NvICYgU291bmRXaXJlIDEuMCBTcGVjaWZpY2F0aW9ucy4KPj4+
Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoCByZWc6Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBtYXhJdGVt
czogMQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqAgSW5zdGFuY2UgSUQgYW5kIExpbmsgSUQgb2YgU291bmRXaXJlIERldmljZSBBZGRy
ZXNzLgoKbWF5YmUgcHV0IGxpbmsgZmlyc3QgYW5kIG1ha2UgaXQgY2xlYXIgdGhhdCBib3RoIGFy
ZSByZXF1aXJlZC4KCj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCByZXF1aXJlZDoKPj4+Pj4gK8KgwqDC
oMKgwqAgLSBjb21wYXRpYmxlCj4+Pj4+ICvCoMKgwqDCoMKgIC0gcmVnCj4+Pj4+ICsKPj4+Pj4g
K2V4YW1wbGVzOgo+Pj4+PiArwqAgLSB8Cj4+Pj4+ICvCoMKgwqAgc291bmR3aXJlQGMyZDAwMDAg
ewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAicWNvbSxzb3VuZHdpcmUtdjEuNS4wIjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDBjMmQwMDAwIDB4MjAwMD47Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNw
ZWFrZXJAMSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2R3
MTAyMTcyMDEwMDAiOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MSAwPjsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNw
ZWFrZXJAMiB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic2R3
MTAyMTcyMDEwMDAiOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MiAwPjsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+ICvCoMKgwqAgfTsKPj4+Pj4gKwo+Pj4+PiAr
Li4uCj4+Pj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
