Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BB9E2C8
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 10:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95261664;
	Tue, 27 Aug 2019 10:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95261664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566894921;
	bh=ksK7YddlN3qltd++6iaoojz/vn4D6XB9C1uBteQsv8c=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WhaaldjiT7poEFeOmeMk/ZmmtZkDLH8Sd85YbmkxuntX4HKcOJ8f0GKyXJsEIakTx
	 Dnaj97scIJ8+sL3e/yrlWsZjbrWiKZtzcJAeOdF+edA91A6vST2Vo2tr0QnSG0BKmF
	 6Yn0AS5RXbncMkARXkJenbNDfEz12tEfHi0YtM74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 990D3F80274;
	Tue, 27 Aug 2019 10:33:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17EFDF80274; Tue, 27 Aug 2019 10:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1330F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 10:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1330F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 01:33:27 -0700
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; d="scan'208";a="174478503"
Received: from mwasko-mobl.ger.corp.intel.com (HELO [10.237.137.181])
 ([10.237.137.181])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 27 Aug 2019 01:33:25 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
From: "Wasko, Michal" <michal.wasko@linux.intel.com>
Message-ID: <92ddf26a-f0ca-469d-2ccd-68a3e9cb2e6a@linux.intel.com>
Date: Tue, 27 Aug 2019 10:33:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <47683473-c177-055b-03fe-2f01feeb4016@linux.intel.com>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, alsa-devel@alsa-project.org,
 "Kaczmarski, Filip" <filip.kaczmarski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com
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

T24gOC8yNi8yMDE5IDExOjU3IFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKCj4KPgo+
IE9uIDgvMjYvMTkgMzowOCBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+PiBPbiAyMDE5LTA4
LTI2IDE4OjUxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gOC8y
Ni8xOSAyOjI0IEFNLCBXYXNrbywgTWljaGFsIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gOC8yNS8yMDE5
IDE6MDYgUE0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+Pj4gT24gMjAxOS0wOC0yNCAxNTo1
MSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4+Pj4gT24gMjAxOS0wOC0yMyAyMzozOSwgTWFy
ayBCcm93biB3cm90ZToKPj4+Pj4+PiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAwMzoxMjoxOFBN
IC0wNTAwLCBQaWVycmUtTG91aXMgQm9zc2FydCAKPj4+Pj4+PiB3cm90ZToKPj4+Pj4+Pj4gT24g
OC8yMy8xOSAxOjQ0IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+Pj4+
IFdhc24ndCBseWluZyBhYm91dCBGVyB2ZXJzaW9uIGJlaW5nIHVucmVsaWFibGUuIExldCdzIHNh
eSB2ZW5kb3IKPj4+Pj4+Pj4+IHJlY2VpdmVzIHF1aWNrIEZXIGRyb3Agd2l0aCBuZXcgUkNSLi4g
c3VjaCBlbmcgZHJvcCBtYXkgY2FycnkgCj4+Pj4+Pj4+PiBpbnZhbGlkCj4+Pj4+Pj4+PiBudW1i
ZXJzIHN1Y2ggYXMgMC4wLjAuMC4uCj4+Pj4+Pj4+PiBJbiBnZW5lcmFsLCBJIHRyeSB0byBhdm9p
ZCByZWx5aW5nIG9uIEZXIHZlcnNpb24gd2hlbmV2ZXIgCj4+Pj4+Pj4+PiBwb3NzaWJsZS4gSXQK
Pj4+Pj4+Pj4+IGNhbiBiZSBkdW1wZWQgZm9yIGRlYnVnIHJlYXNvbnMsIHRydWUsIGJ1dCB0byBi
ZSByZWxpZWQgb24/IAo+Pj4+Pj4+Pj4gTm90IHJlYWxseS4KPj4+Pj4+Pgo+Pj4+Pj4+PiBHb29k
bmVzcywgdGhhdCdzIHJlYWxseSBiYWQuIEkgZGlkbid0IHJlYWxpemUgdGhpcy4KPj4+Pj4+Pgo+
Pj4+Pj4+IEF0IGEgcHJldmlvdXMgZW1wbG95ZXIgSSBtb2RpZmllZCBvdXIgYnVpbGQgc3RhbXBp
bmcKPj4+Pj4+PiBpbmZyYXN0cnVjdHVyZSB0byBhbHNvIGluY2x1ZGUgYm90aCBhIHRpbWVzdGFt
cCBhbmQgYSBzZXJpYWxpemVkCj4+Pj4+Pj4gYnVpbGQgbnVtYmVyIGluIHRoZSB2ZXJzaW9uIG51
bWJlciBzaW5jZSBvbmUgb2YgbXkgY29sbGVhZ3VlcyB3YXMKPj4+Pj4+PiBmb25kIG9mIHNlbmRp
bmcgcGVvcGxlIHByZXJlbGVhc2VzIG9mIHdoYXQgaGUgd2FzIHdvcmtpbmcgb24gdG8KPj4+Pj4+
PiBvdGhlciBwZW9wbGUgd2l0aCBpZGVudGljYWwgdmVyc2lvbiBudW1iZXJzIG9uIGRpZmZlcmVu
dAo+Pj4+Pj4+IGJpbmFyaWVzIGxlYWRpbmcgdG8gbXVjaCBjb25mdXNpb24gYW5kIGNoZWNrc3Vt
bWluZy4gWW91IGRvIHNlZQo+Pj4+Pj4+IGEgbG90IG9mIHRoaW5ncyB3aXRoIHRob3NlIHNlcmlh
bGl6ZWQgdmVyc2lvbiBudW1iZXJzLCBlc3BlY2lhbGx5Cj4+Pj4+Pj4gU1ZOIGJhc2VkIHByb2pl
Y3RzLgo+Pj4+Pj4+Cj4+Pj4+Pj4+PiBQZXJzb25hbGx5LCBJJ20gYWdhaW5zdCBhbGwgaGFyZGNv
ZGVzIGFuZCB3b3VsZCBzaW1wbHkgCj4+Pj4+Pj4+PiByZWNvbW1lbmQgYWxsCj4+Pj4+Pj4+PiB1
c2VyIHRvIHJlZGlyZWN0IHRoZWlyIHN5bWxpbmtzIHdoZW4gdGhleSBkbyBzd2l0Y2gga2VybmVs
IC0gCj4+Pj4+Pj4+PiBhbG9uZyB3aXRoCj4+Pj4+Pj4+PiBkdW1waW5nIHdhcm5pbmcvIGVycm9y
IG1lc3NhZ2UgaW4gZG1lc2cuIEhhcmRjb2RlcyBicmluZyAKPj4+Pj4+Pj4+IHByb2JsZW1zIHdp
dGgKPj4+Pj4+Pj4+IGZvcndhcmQgY29tcGF0aWJpbGl0eSBhbmQgdGhhdCdzIHdoeSBob3N0IHNo
b3VsZCBvZmZsb2FkIHRoZW0gCj4+Pj4+Pj4+PiBhd2F5IHRvCj4+Pj4+Pj4+PiBGVy4KPj4+Pj4+
Pgo+Pj4+Pj4+PiBDZXphcnksIEkga25vdyB5b3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgYWxs
IHRoaXMsIGJ1dCBhdCAKPj4+Pj4+Pj4gdGhpcyBwb2ludCBpZiB3ZQo+Pj4+Pj4+PiAoSW50ZWwp
IGNhbid0IGd1YXJhbnRlZSBhbnkgc29ydCBvZiBpbnRlcm9wZXJhYmlsaXR5IHdpdGggYm90aCAK
Pj4+Pj4+Pj4gZmlybXdhcmUgYW5kCj4+Pj4+Pj4+IHRvcG9sb2d5IHdlIHNob3VsZCBtYWtlIGl0
IGNsZWFyIHRoYXQgdGhpcyBkcml2ZXIgaXMgbm90IAo+Pj4+Pj4+PiByZWNvbW1lbmRlZCB1bmxl
c3MKPj4+Pj4+Pj4gc3BlY2lmaWMgdmVyc2lvbnMgb2YgdGhlIGZpcm13YXJlL3RvcG9sb2d5IGFy
ZSB1c2VkLCBhbmQgYXMgYSAKPj4+Pj4+Pj4gY29uc2VxdWVuY2UKPj4+Pj4+Pj4gdGhlIHR5cGlj
YWwgY2xpZW50IGRpc3Ryb3MgYW5kIGRlc2t0b3AvbGFwdG9wIHVzZXJzIHNob3VsZCB1c2UgCj4+
Pj4+Pj4+IEhEYXVkaW8KPj4+Pj4+Pj4gbGVnYWN5IG9yIFNPRiAoZm9yIERNSUNzKQo+Pj4+Pj4+
Cj4+Pj4+Pj4gTm90IHRoZSBtb3N0IGVsZWdlbnQgc29sdXRpb24gYnV0IEknbSB3b25kZXJpbmcg
aWYga2VlcGluZyBhIGNvcHkKPj4+Pj4+PiBvZiB0aGUgZHJpdmVyIGFzIGlzIGFyb3VuZCBhbmQg
dXNpbmcgbmV3IGxvY2F0aW9ucyBmb3IgdGhlIGZpeGVkCj4+Pj4+Pj4gZmlybXdhcmUgbWlnaHQg
YmUgdGhlIHNhZmVzdCB3YXkgdG8gaGFuZGxlIHRoaXMuwqAgV2UgY291bGQgaGF2ZSBhCj4+Pj4+
Pj4gd3JhcHBlciB3aGljaCB0cmllcyB0byBsb2FkIHRoZSBuZXdlciBmaXJtd2FyZSBhbmQgdXNl
cyB0aGUgZml4ZWQKPj4+Pj4+PiBkcml2ZXIgY29kZSBpZiB0aGF0J3MgdGhlcmUsIG90aGVyd2lz
ZSB0cmllcyB0aGUgb2xkIGRyaXZlciB3aXRoCj4+Pj4+Pj4gdGhlIGV4aXN0aW5nIGZpcm13YXJl
IHBhdGhzLsKgIFRoaXMgaXMgb2J2aW91c2x5IGEgaG9ycm9yIHNob3cgYW5kCj4+Pj4+Pj4gbGVh
dmVzIHRoZSBvbGQgY29kZSBzaXR0aW5nIHRoZXJlIGJ1dCBnaXZlbiB0aGUgbWlzdGFrZXMgdGhh
dAo+Pj4+Pj4+IGhhdmUgYmVlbiBtYWRlIHRoZSB3aG9sZSBzaXR1YXRpb24gbG9va3MgbGlrZSBh
IGhvdXNlIG9mIGNhcmRzLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzIGZvciB0aGUgZmVl
ZGJhY2sgTWFyay4gV2hpbGUgSSdtIG5vdCB5ZXQgb24gdGhlICJTT0Ygd2lsbCAKPj4+Pj4+IGZp
eCB0aGlzIiB0cmFpbiwgSSdtIGtlZW4gdG8gYWdyZWUgdG8gbGVhdmluZyB0aGlzIGVudGlyZWx5
IHRvIAo+Pj4+Pj4gU09GIGlmIGl0IGNvbWVzIGRvd24gdG8gdXMgZHVwbGljYXRpbmcgL3NreWxh
a2UuCj4+Pj4+Pgo+Pj4+Pj4gSG93ZXZlciwgd2UgYXJlIG5vdCBnb2luZyB0byBnaXZlIHVwIHRo
YXQgZWFzaWx5LiBJJ2xsIHNlZSBpZiAKPj4+Pj4+IHNvbWUgImdvbGRlbiBjb25maWciIGhhcmRj
b2RlcyBjYW4ndCBiZSBwcm92aWRlZCBpbiBzb21lIGxlZ2FjeS5jIAo+Pj4+Pj4gZmlsZSB3aGlj
aCB3b3VsZCBiZSBmZXRjaGVkIGlmIGluaXRpYWwgc2V0dXAgZmFpbHMuIEUuZy46IDJjb3Jlcywg
Cj4+Pj4+PiAzc3NwcywgMVBBR0VfU0laRSBwZXIgdHJhY2UgYnVmZmVyLi4gYW5kIHN1Y2guIFRo
ZXJlIGFyZSBxdWl0ZSBhIAo+Pj4+Pj4gZmV3IGZhY3RvcnMgdG8gdGFrZSBpbnRvIGNvbnNpZGVy
YXRpb24gdGhvdWdoLiBJZiAiYXNraW5nIiB1c2VyIAo+Pj4+Pj4gdmlhIGRtZXNnIHRvIHVwZ3Jh
ZGUgdGhlIGZpcm13YXJlIGlmIGhpcy9oZXIgc2V0dXAgY29udGFpbnMgCj4+Pj4+PiBvYnNvbGV0
ZSBiaW5hcnkgaXMgcmVhbGx5IG5vdCBhbiBvcHRpb24sIHRoZW4gc29tZSBtYWdpYyB3b3JkcyAK
Pj4+Pj4+IGdvdCB0byBiZSBpbnZvbHZlZC4KPj4+Pj4+Cj4+Pj4+PiBDemFyZWsKPj4+Pj4KPj4+
Pj4gT24gdGhlIHNlY29uZCB0aG91Z2h0IHdoYXQgaWYgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyBr
ZXJuZWwgY29kZSwgCj4+Pj4+IGJpbmFyaWVzIHdvdWxkIGJlIGR1cGxpY2F0ZWQ/Cj4+Pj4+IEku
ZS4gcmF0aGVyIHRoYW4gdGFyZ2V0aW5nIC9pbnRlbC9kc3BfZndfY25sLmJpbiwgX25ld18gL3Nr
eWxha2UgCj4+Pj4+IHdvdWxkIGJlIGV4cGVjdGluZyAvaW50ZWwvZHNwX2Z3X2NubF9yZWxlYXNl
LmJpbj8gU2FtZSB3aXRoIAo+Pj4+PiB0b3BvbG9neSBiaW5hcmllcy4KPj4+Pj4gSW4gc3VjaCBj
YXNlLCB3ZSAib25seSIgbmVlZCB0byBmaWd1cmUgb3V0IGhvdyB0byBwcm9wYWdhdGUgbmV3IAo+
Pj4+PiBmaWxlcyB0byBMaW51eCBkaXN0b3Mgc28gd2hlbmV2ZXIgc29tZW9uZSB1cGRhdGVzIHRo
ZWlyIGtlcm5lbCwgCj4+Pj4+IG5ldyBiaW5hcmllcyBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRo
ZWlyIC9saWIvZmlybXdhcmUuCj4+Pj4+Cj4+Pj4+IElmIHN1Y2ggb3B0aW9uIGlzIHZhbGlkLCB3
ZSBjYW4gcG9zdHBvbmUgL3NreWxha2UgdXBncmFkZSB0aWxsIDUuNCAKPj4+Pj4gbWVyZ2luZyB3
aW5kb3cgY2xvc2VzIGFuZCB0aGUgcGF0Y2hlcyAocm91Z2ggZXN0aW1hdGlvbiBpcyAxNTApIAo+
Pj4+PiB3b3VsZCBkZXNjZW5kIHVwb24gYWxzYS1kZXZlbCBpbiB0aW1lIGJldHdlZW4gNS40IGFu
ZCA1LjUuCj4+Pj4KPj4+PiBJZiB0aGUgZHJpdmVyIGFuZCBGVyB1cGRhdGUgd2lsbCBiZSB3aXRo
aW4gdGhlIHNhbWUga2VybmVsIHJlbGVhc2UgCj4+Pj4gdGhlbiBJTUhPCj4+Pj4gdGhlcmUgc2hv
dWxkIGJlIG5vIGNvbXBhdGliaWxpdHkgcHJvYmxlbSBiZXR3ZWVuIHRob3NlIHR3byAKPj4+PiBj
b21wb25lbnRzLCByaWdodD8KPj4+PiBUaGlzIHdheSBrZXJuZWwgdXNlcnMgd2lsbGluZyB0byBz
dGljayB0byBvbGQgRlcgY2FuIHN0YXkgb24gb2xkZXIgCj4+Pj4ga2VybmVsIHZlcnNpb24gd2hp
bGUKPj4+PiBvdGhlcnMgY2FuIHVwZGF0ZSBhbmQgcmVjZWl2ZSBhbGwgdGhlIGxhdGVzdCBGVyBm
dW5jdGlvbmFsaXR5IHRoYXQgCj4+Pj4gd2FzIGRldmVsb3BlZCBhbmQgZW5hYmxlZC4KPj4+Cj4+
PiBJIGFtIG5vdCBjb21mb3J0YWJsZSB3aXRoIHByZWNsdWRpbmcgYSBrZXJuZWwgdXBkYXRlIGJl
Y2F1c2Ugb2YgYSAKPj4+IHNpbmdsZSBmaXJtd2FyZSBmaWxlLiBUaGVyZSBhcmUgYWxsIHNvcnQg
b2YgcmVhc29ucyBmb3IgdXBkYXRpbmcgYSAKPj4+IGtlcm5lbCwgc2VjdXJpdHksIHNpZGViYW5k
IGF0dGFja3MgYW5kIEFuZHJvaWQgQ0REIGNvbXBhdGliaWxpdHkgCj4+PiBiZWluZyB0aGUgbW9z
dCBvYnZpb3VzIG9uZXMuCj4+PgpUaGUgc2luZ2xlIGZpcm13YXJlIGZpbGUgd2lsbCBub3QgYmUg
YSBibG9ja2VyIGFzIHRoZSBkcml2ZXIgaW5jbHVkZWQgaW4gCnVwZGF0ZWQga2VybmVsIHdpbGwg
c3VwcG9ydCBpdC4KQWxsIHlvdSBoYXZlIHRvIGRvIGlzIHRoZSBsaXR0bGUgZWZmb3J0IHRvIHJl
LWdlbmVyYXRlIHlvdXIgY3VzdG9tIAp0b3BvbG9neSBmb3IgdGhlIG5ldyBmaXJtd2FyZSB0YXJn
ZXQuClRoZSBlbnRpcmUgb3BlcmF0aW9uIHNob3VsZCBub3QgYmUgYSBwcm9ibGVtIGFzIHRoZXJl
IGFyZSBkZWRpY2F0ZWQgCnV0aWxpdGllcyBsaWtlIEZESyB0byBkbyB0aGF0LgoKWW91ciBzdGF0
ZW1lbnQgUGllcnJlIHN1Z2dlc3QgdGhhdCBldmVyeW9uZSBzaG91bGQgYXZvaWQgYW55IGZ1bmN0
aW9uYWwgCmNoYW5nZXMgaW4ga2VybmVsCnRoYXQgYXJlIG5vdCBjcml0aWNhbCBiZWNhdXNlIHRo
YXQgd291bGQgYmUgcHJvYmxlbWF0aWMgZm9yIG90aGVycyB3aG8gCnN3aXRjaCBmcm9tIG9sZGVy
IGtlcm5lbCB2ZXJzaW9uLgo+Pj4+Cj4+Pj4gSW4gdGVybXMgb2YgRlcgdG9wb2xvZ3kgY29tcGF0
aWJpbGl0eSB0aGVyZSBpcyBhbiBvcHRpb24gdG8gcmVhZCAKPj4+PiBmcm9tIHRvcG9sb2d5IG1h
bmlmZXN0Cj4+Pj4gYSBGVyB2ZXJzaW9uIHRoYXQgaXQgd2FzIGJ1aWxkIGZvciBhbmQgaW7CoCBj
YXNlIGlmIGl0IGRvZXMgbm90IAo+Pj4+IG1hdGNoIEZXIHZlcnNpb24gcHJlc2VudCBvbgo+Pj4+
IHRoZSBwbGF0Zm9ybSB0aGVuIHByaW50IHdhcm5pbmcgdGhhdCB0aGUgRlcgdG9wb2xvZ3kgYmlu
YXJ5IHNob3VsZCAKPj4+PiBiZSByZWJ1aWxkIGZvciBjdXJyZW50Cj4+Pj4gRlcgdmVyc2lvbiAo
eC54LngueCkuCj4+Pgo+Pj4gQ2FuIHlvdSBwcm92aWRlIGEgcG9pbnRlciBvbiBob3cgdGhlIEZX
IHZlcnNpb24gaXMgZW1iZWRkZWQgaW4gYSAKPj4+IC5jb25mLy50cGxnIGZpbGU/IEkgc2VlIGEg
Y291cGxlIHdoZXJlIHRoYXQgaW5mb3JtYXRpb24gZG9lcyBub3QgCj4+PiBzZWVtIHByZXNlbnQu
Cj4+Pgo+Pj4+IFRoZSBhYm92ZSBhcHByb2FjaCBhdCB0aGUgZW5kIG1heSBiZSBsZXNzIGNvbmZ1
c2luZyB0aGVuIHNvdXJjZSAKPj4+PiBjb2RlIG9yIGJpbmFyeSBkdXBsaWNhdGlvbi4KPj4+Cj4+
Cj4+IEluZGVlZC4gT3VyIGV4aXN0aW5nIHRvcG9sb2d5IHNraXBzIHRoYXQgcGFydCBvZiBpbnRl
cm5hbCAueG1sIGFuZCAKPj4gdGh1cyBzdWNoIGluZm9ybWF0aW9uIGlzIG5vdCBwcm9wYWdhdGVk
IHRvIGtlcm5lbC4KPj4KPj4gUGllcnJlLCBob3cgYWJvdXQgdGhlIGJpbmFyeS1kdXBsaWNhdGlv
biAtIGFzIGRlc2NyaWJlZCBhYm92ZT8gQnR3LCAKPj4gdGhhdCdzIG5vdCBhIHNpbmdsZSBmaXJt
d2FyZSBmaWxlIF4pXiBXZSB3b3VsZCBpbW1lZGlhdGVseSB1cGRhdGUgYWxsIAo+PiBvZiB0aGVt
LCB0b2dldGhlciB3aXRoIHRvcG9sb2dpZXMuCj4KPiBJIGRpZG4ndCB1bmRlcnN0YW5kIGhvdyB5
b3Ugd291bGQgc2VsZWN0IHRoZSBuZXcgZmlybXdhcmVzPyBTb21lIGNvZGUgCj4gY2hhbmdlIG5l
ZWRzIHRvIGhhcHBlbiBhcyB3ZWxsPwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
