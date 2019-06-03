Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28C43282B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 07:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350AE1665;
	Mon,  3 Jun 2019 07:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350AE1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559541313;
	bh=wfVf/jwy58jzjBrMJeIPbMTo4BQ69lsYvK0xilMa+z0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVOBStTNl6STk78ZVc8bynDpPqK/RLqikk9a45LTkJpc3sUGChC06CaGoJfWgnPFN
	 bU0xfBpX29kEovjzI7B8QSO3HQoasDCVbrnQR6o1/0V6KTT65y5S5ihprOg6IHC9ya
	 mY6WOqiubHIF8r4B95HnGF21/z0mUSrsd7YywKS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70BF2F80CC4;
	Mon,  3 Jun 2019 07:53:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC629F896DD; Mon,  3 Jun 2019 07:53:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D0DAF80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 07:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0DAF80774
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 22:53:17 -0700
X-ExtLoop1: 1
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga008.jf.intel.com with ESMTP; 02 Jun 2019 22:53:16 -0700
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <s5h7ea6lfaa.wl-tiwai@suse.de>
 <1f3059d6-b271-f612-c670-e7214674892f@linux.intel.com>
 <s5h36kulc07.wl-tiwai@suse.de>
 <a2737284-ee55-59e5-cab7-2503d27c92bb@linux.intel.com>
 <s5hzhn2jvf2.wl-tiwai@suse.de> <s5hv9xqjto3.wl-tiwai@suse.de>
 <68aa2fa2-41fc-3dfb-c82f-1f88be5bd867@linux.intel.com>
 <s5hmuj2jr9a.wl-tiwai@suse.de>
 <13dce83f-a092-6d9f-4676-8e3fc46bdc23@linux.intel.com>
 <s5hftoujp7k.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <f82b90df-77d5-911f-c448-e53957d6ce35@linux.intel.com>
Date: Mon, 3 Jun 2019 13:58:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hftoujp7k.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Why open-coding in sof_hda_bus_init()?
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

CgpPbiAyMDE5LzYvMSDkuIrljYg1OjIwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gRnJpLCAz
MSBNYXkgMjAxOSAyMjo1OToxNyArMDIwMCwKPiBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToK
Pj4KPj4KPj4+PiB3ZSBuZWVkIGV2ZXJ5dGhpbmcgdGhhdCB3YXMgcmVtb3ZlZCBpbiB5b3VyIHBy
b3Bvc2FsIDotKQo+Pj4+Cj4+Pj4gLQltZW1zZXQoYnVzLCAwLCBzaXplb2YoKmJ1cykpOwo+Pj4+
IC0JYnVzLT5kZXYgPSBkZXY7Cj4+Pj4gLQo+Pj4+IC0JYnVzLT5pb19vcHMgPSAmaW9fb3BzOwo+
Pj4+IC0JSU5JVF9MSVNUX0hFQUQoJmJ1cy0+c3RyZWFtX2xpc3QpOwo+Pj4+IC0KPj4+PiAtCWJ1
cy0+aXJxID0gLTE7Cj4+Pj4gLQlidXMtPmV4dF9vcHMgPSBleHRfb3BzOwo+Pj4+IC0KPj4+PiAt
CS8qCj4+Pj4gLQkgKiBUaGVyZSBpcyBvbmx5IG9uZSBIREEgYnVzIGF0bS4ga2VlcCB0aGUgaW5k
ZXggYXMgMC4KPj4+PiAtCSAqIE5lZWQgdG8gZml4IHdoZW4gdGhlcmUgYXJlIG1vcmUgdGhhbiBv
bmUgSERBIGJ1cy4KPj4+PiAtCSAqLwo+Pj4+IC0JYnVzLT5pZHggPSAwOwo+Pj4+IC0KPj4+PiAt
CXNwaW5fbG9ja19pbml0KCZidXMtPnJlZ19sb2NrKTsKPj4+Pgo+Pj4+IFRoaXMgaXMgdGhlIHNt
YWxsZXN0IHNldCBvZiBpbml0aWFsaXphdGlvbiBuZWVkZWQgd2hlbiB5b3UgZG9uJ3QgbmVlZAo+
Pj4+IGhkbWkvaGRhdWRpbyBjb2RlYyBzdXBwb3J0Lgo+Pj4KPj4+IEkgZG9uJ3QgdW5kZXJzdGFu
ZCBpdC4uLiAgV2h5IFNPRiBjb3JlIG5lZWRzIHRvIGluaXRpYWxpemUgdGhlIGNvbnRlbnQKPj4+
IG9mIEhELWF1ZGlvIGJ1cyBvYmplY3QgZXZlbiBpZiB5b3Ugd29uJ3QgdXNlIGl0Pwo+Pgo+PiB3
ZSBkbyB1c2UgaXQgbGVmdCBhbmQgcmlnaHQsIGJ1dCB3ZSBvbmx5IHVzZSB0aGUgJ2NvbnRyb2xs
ZXIvRE1BJwo+PiBwYXJ0cyBvZiB0aGF0IHN0cnVjdHVyZS4gd2UgaGF2ZSB6ZXJvIHVzZSBmb3Ig
Q09SQi9SSVJCIGFuZAo+PiBjb2RlYy1zcGVjaWZpYyBzdHVmZiB3aGVuIEkyUyBhbmQgRE1JQyBh
cmUgdGhlIG9ubHkgY29ubmVjdGlvbnMgdG8gM3JkCj4+IHBhcnR5IGNoaXBzCj4gCj4gU28geW91
IHdhbnQgdG8gYXZvaWQgdGhlIGRlcGVuZGVuY3kgb24gc25kLWhkYS1jb3JlIGlmIHRoZSBzeXN0
ZW0gaXMKPiB3aXRoIG9ubHkgSTJTL0RNSUM/CgpIaSBUYWthc2hpLCB5ZXMsIHRoYXQncyB0cnVl
LiBXZSB3YW50IHRvIHJldXNlIHRoZSBoZGFjIHJlZ2lzdGVycyBhY2Nlc3MgCnBhcnQoYnVzLT5p
b19vcHMsIGJ1cy0+c3RyZWFtX2xpc3QpLCBmb3IgaG9zdCBETUEgc3RyZWFtIG1hbmFnZW1lbnQo
ZS5nLiAKaW4gc29mL2ludGVsL2hkYS1zdHJlYW0uYyksIHdpdGhvdXQgdGhlIGRlcGVuZGVuY3kg
b24gc25kLWhkYS1jb3JlLgoKPiAKPiBCdXQsIHNuZC1zb2YtaW50ZWwtaGRhLWNvbW1vbiBhbHJl
YWR5IGhhcyB0aGUgaGFyZCBkZXBlbmRlbmN5IG9uCj4gc25kLWhkYS1jb3JlIGlmIENPTkZJR19T
TkRfU09DX1NPRl9IREEgaXMgZW5hYmxlZC4gIFNvIHRoZSBhdHRlbXB0Cj4gbWFrZXMgbGl0dGxl
IHNlbnNlIGFzIGxvbmcgYXMgQ09ORklHX1NORF9TT0NfU09GX0hEQSBpcyBzZXQuCj4gCj4gQW5k
LCBpZiBDT05GSUdfU05EX1NPQ19TT0ZfSERBIGlzbid0IHNldCAtLSBpLmUuCj4gQ09ORklHX1NO
RF9TT0NfSEZfSERBX0xJTksgaXNuJ3Qgc2V0IGVpdGhlcjsgaXQgaW1wbGllcyB0aGF0IHRoZXJl
IGNhbgo+IGJlIG5vIHVzZXIgb2YgSEQtYXVkaW8gYnVzLiAgU28sIEkgc2VlIG5vIGJpZyByZWFz
b24gd2UgbmVlZCB0byBjYXJlCj4gYWJvdXQgdGhlIHN0dWZmLi4uCj4gCj4gCj4+PiBJT1csIHdo
YXQncyB0aGUgbWVyaXQgb2YgaGF2aW5nIGhkYS1idXMuYyB3aXRoIHRoZSBjb3B5IG9mCj4+PiBz
bmQtaGRhLWNvcmUgY29kZT8gIEFzIGZhciBhcyBJIHNlZSwgYm90aCBoZGEuYyBhbmQgaGRhLWJ1
cy5jIGFyZQo+Pj4gbGlua2VkIGludG8gdGhlIHNhbWUgc25kLXNvZi1pbnRlbC1oZGEtY29tbW9u
IG1vZHVsZS4gIEFuZCwgdGhlIGZvcm1lcgo+Pj4gaGFzIHRoZSBkaXJlY3QgY2FsbHMgb2YgSEQt
YXVkaW8gY29yZSBBUEkgKHdpdGgKPj4+IENPTkZJR19TTkRfU09DX1NPRl9IREEpOyBpLmUuIHNu
ZC1zb2YtaW50ZWwtaGRhLWNvbW1vbiBhbHJlYWR5IGRlcGVuZHMKPj4+IG9uIHNuZC1oZGEtY29y
ZSBpZiBDT05GSUdfU05EX1NPQ19TT0ZfSERBIGlzIG9uLCBubyBtYXR0ZXIgaG93IHlvdQo+Pj4g
Y29kZSBoZGEtYnVzLmMuCj4+Cj4+IEkgYWdyZWUgd2UgY291bGQgaW1wbGVtZW50IGhkYS1idXMg
aW4gYSBjbGVhbmVyIHdheSAtIGJ1dCBpdCdzIGEgdmVyeQo+PiBzbWFsbCBmaWxlLgo+IAo+IFll
cywgYnV0IHRoaXMgaXMgYSBraW5kIG9mIGxheWVyIHZpb2xhdGlvbi4gIEltYWdpbmUgeW91IGRv
IGluaXRpYWxpemUKPiB0aGUgc3RydWN0IHBjaV9kZXYgb3Igd2hhdGV2ZXIgZWxzZSBkZXZpY2Ug
b2JqZWN0IGJlY2F1c2UgeW91IHdhbnQgdG8KPiByZWR1Y2UgdGhlIGRlcGVuZGVuY3kgb24gb3Ro
ZXIgY29yZSBoZWxwZXJzOyBpdCB3b3VsZCBiZSBuaWdodG1hcmUKPiBmcm9tIHRoZSBtYWludGVu
YW5jZSBQT1YuCj4gCj4gSSd2ZSBoYWQgYWxyZWFkeSBoYXJkIHRpbWUgdG8gZmlndXJlIG91dCB3
aHkgU09GIEhEQSBpbml0aWFsaXplcyB0aGUKPiBIRC1hdWRpbyBidXMsIGJlY2F1c2UgaXQgbWlz
c2VzIHRoZSBleHBsaWNpdCBzbmRfaGRhY18qX2J1c19pbml0KCkKPiBjYWxsLiAgVGhhdCdzIHRo
ZSBzdGFydGluZyBwb2ludCBvZiB0aGlzIHRocmVhZC4KPiAKPiBTbywgbGV0J3MgYXZvaWQgdWds
eSBoYWNrcy4gIE1ha2UgaXQgbW9yZSBzdHJhaWdodGZvcndhcmQuICBBZ2FpbiwgaWYKPiB0aGUg
bW9kdWxlIHNpemUgbWF0dGVycywgd2UgY2FuIHNwbGl0IGFuZCByZWR1Y2UgdGhlIHBhcnQgb2Yg
SEQtYXVkaW8KPiBjb3JlIHN0dWZmIHRoYXQgaXMgZGlyZWN0bHkgbGlua2VkIHRvIFNPRiBjb3Jl
LgoKSWYgd2UgY2FuIHNwbGl0IEhELWF1ZGlvIGNvcmUgc3R1ZmYgdG8gcHJvdmlkZSBhIGhvc3Qg
RE1BL3N0cmVhbSBvbmx5IAptb2R1bGUgZm9yIEkyUy9ETUlDLCB0aGF0IHdvdWxkIGJlIGdyZWF0
LgoKVGhhbmtzLAp+S2V5b24KCj4gCj4+IEEgbGFyZ2VyIGNvcmUgcmVwYXJ0aXRpb25pbmcgd291
bGQgdGFrZSBxdWl0ZSBhIGJpdCBvZgo+PiB0aW1lLCBhbmQgaW4gdGhlIG1lYW4gdGltZSB3ZSBh
bHJlYWR5IGhhdmUgdG8gc29ydCBvdXQgYWxsIHRoZSBkZWx0YXMKPj4gYmV0d2VlbiBsZWdhY3kg
ZHJpdmVyIGFuZCBoZGFjIGxpYnJhcnkuCj4+Cj4+IEFueXdheXMsIHRoYXQncyBpdCBmb3IgbWUg
dGhpcyB3ZWVrLCBlbmpveSB5b3VyIHZhY2F0aW9uIQo+IAo+IFRoYW5rcyEKPiAKPiAKPiBUYWth
c2hpCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
