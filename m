Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B0141BB9
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 04:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02424168C;
	Sun, 19 Jan 2020 04:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02424168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579405540;
	bh=nlZzeNMaRGmWWsB0SfP6Gi2EGhREDcbkzNQAqRrAq1E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyn9xRCr5akLdaujwSMTifT7Mb//+yBPmkhJOPAZkQLZBqdfOoZ9+77erYQ3Bw0Ss
	 ZspQXAMytT9e0hBVRILK8opCcIvEPS8IEhPMXu106RNFeNbZ5n1gnLA3uXNKWpRu0U
	 0Xq27gN3c1Zkio3yo002weiOb+ZKyubnnHIf1aoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E238F801D9;
	Sun, 19 Jan 2020 04:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C3A0F801D9; Sun, 19 Jan 2020 04:43:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB67FF8013E
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 04:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB67FF8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 19:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="214908361"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 18 Jan 2020 19:43:43 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <s5hd0bjq3cu.wl-tiwai@suse.de>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
 <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
 <s5hh80v7h82.wl-tiwai@suse.de>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EE27@SHSMSX105.ccr.corp.intel.com>
 <c70934a1-b838-5029-6573-bf76a34c4cb9@linux.intel.com>
 <93ac843a-bad5-550e-f427-e2a94bd3e8ef@linux.intel.com>
 <b6b55180-b846-96e7-4521-7d3b03881d06@linux.intel.com>
 <3374dc7d-e969-5380-581a-f6801a2fe50f@linux.intel.com>
 <s5hzhemo6ku.wl-tiwai@suse.de>
 <68e008e2-6796-f893-35ed-d76a2bf92587@linux.intel.com>
 <s5ho8v249rk.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <7c6bb315-1ffc-665d-ff5e-e5e440f3e609@linux.intel.com>
Date: Sun, 19 Jan 2020 11:52:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5ho8v249rk.wl-tiwai@suse.de>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Rajwa,
 Marcin" <marcin.rajwa@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
 constrained by preallocated bytes issue
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

Ck9uIDIwMjAvMS8xNyDkuIvljYg3OjEyLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gRnJpLCAx
NyBKYW4gMjAyMCAxMTo0MzoyNCArMDEwMCwKPiBLZXlvbiBKaWUgd3JvdGU6Cj4+Cj4+Cj4+Cj4+
IE9uIDIwMjAvMS8xNyDkuIvljYg0OjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+PiBPbiBGcmks
IDE3IEphbiAyMDIwIDA2OjM3OjE2ICswMTAwLAo+Pj4gS2V5b24gSmllIHdyb3RlOgo+Pj4+Cj4+
Pj4gT24gMjAyMC8xLzE3IOS4iuWNiDE6NDAsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+
Pj4+Pgo+Pj4+Pj4+Pj4gU28sIGRvIHlvdSBzdWdnZXN0IG5vdCBkb2luZyBwcmVhbGxvY2F0aW9u
KG9yIGNhbGxpbmcgaXQgd2l0aCAwCj4+Pj4+Pj4+PiBzaXplKSBmb3IgYWxsCj4+Pj4+Pj4+PiBk
cml2ZXIgd2l0aCBUWVBFX1NHPyBJIGFtIGZpbmUgaWYgdGhpcyBpcyB0aGUgcmVjb21tZW5kZWQK
Pj4+Pj4+Pj4+IG1ldGhvZCwgSSBjYW4gdHJ5Cj4+Pj4+Pj4+PiB0aGlzIG9uIFNPRiBJMlMgcGxh
dGZvcm0gdG8gc2VlIGlmIGl0IGNhbiB3b3JrIGFzIHdlIHJlcXVpcmVkCj4+Pj4+Pj4+PiBmb3Ig
dmVyeSBsYXJnZQo+Pj4+Pj4+Pj4gYnVmZmVyIHNpemUuCj4+Pj4+Pj4KPj4+Pj4+PiBLZXlvbiwg
Zm9yIHRoZSByZXN0IG9mIHVzIHRvIGZvbGxvdyB0aGlzIHBhdGNoLCB3b3VsZCB5b3UgbWluZAo+
Pj4+Pj4+IGNsYXJpZnlpbmcgd2hhdCBkcml2ZXMgdGhlIG5lZWQgZm9yIGEgJ3ZlcnkgbGFyZ2Ug
YnVmZmVyIHNpemUnLAo+Pj4+Pj4+IGFuZCB3aGF0IG9yZGVyIG9mIG1hZ25pdHVkZSB0aGlzIHZl
cnkgbGFyZ2Ugc2l6ZSB3b3VsZCBiZS4KPj4+Pj4+Pgo+Pj4+Pj4+IEZXSVcsIHdlJ3ZlIG1lYXN1
cmVkIGNvbnNpc3RlbnRseSBvbiBkaWZmZXJlbnQgV2luZG93cy9MaW51eAo+Pj4+Pj4+IHBsYXRm
b3JtcywgbWF5YmUgMTAgeWVhcnMgYWdvLCB0aGF0IG9uY2UgeW91IHJlYWNoIGEgYnVmZmVyIG9m
IDFzCj4+Pj4+Pj4gKDM4NCBrQikgdGhlIGJlbmVmaXRzIGZyb20gaW5jcmVhc2luZyB0aGF0IGJ1
ZmZlciBzaXplIGZ1cnRoZXIgYXJlCj4+Pj4+Pj4gbWFyZ2luYWwgaW4gdGVybXMgb2YgcG93ZXIg
Y29uc3VtcHRpb24sIGFuZCBnZW5lcmF0ZSBhbGwga2luZHMgb2YKPj4+Pj4+PiBpc3N1ZXMgd2l0
aCB2b2x1bWUgdXBkYXRlcyBhbmQgZGVmZXJyZWQgcm91dGluZyBjaGFuZ2VzLgo+Pj4+Pj4+Cj4+
Pj4+PiBXZSBuZWVkIGJpZ2dlciBidWZmZXIgb24gaG9zdCBzaWRlIHRvIGNvbXBlbnNhdGUgdGhl
IHdha2UgdXAgdGltZQo+Pj4+Pj4gZnJvbSBkMGl4IHRvIGQwIHdoaWNoIHRha2VzIH4yIHNlY29u
ZHMgb24gbXkgc2V0dXAuIFNvLCB3aWl0aAo+Pj4+Pj4gc21hbGxlciBidWZmZXIgc2l6ZXMgbGlr
ZSA8IDIgc2Vjb25kcyB3ZSBvdmVyd3JpdGUgZGF0YSBzaW5jZSBGVwo+Pj4+Pj4ga2VlcHMgY29w
cGluZyB3aGlsZSBob3N0IGRvZXNuJ3QgcmVhZCB1bnRpbCBpdHMgdXAgYW5kIHJ1bm5pbmcKPj4+
Pj4+IGFnYWluLgo+Pj4+Pgo+Pj4+PiBSaWdodCwgdGhhdCdzIGEgdmFsaWQgY2FzZSwgYnV0IHRo
YXQncyAyNTYga0IsIG5vdCAndmVyeSBsYXJnZScgb3IKPj4+Pj4gbGlrZWx5IHRvIGV2ZXIgdHJp
Z2dlciBhbiBPT00gY2FzZS4KPj4+Pgo+Pj4+IEZvciBTMjRfTEUsIGl0IGlzIDUxMktCLCB0aGUg
cG9pbnQgaXMgdGhhdCBpZiB3ZSBjYW4ndCByZS1hbGxvY2F0ZQo+Pj4+IGJ1ZmZlciBhdCBod19w
YXJhbXMoKSBzdGFnZSwgdGhlbiB3ZSBuZWVkIGZvbGxvdyBhIEJLTSB0aGF0IHdlIGhhdmUgdG8K
Pj4+PiBwcmVhbGxvY2F0ZSB0aGUgbGFyZ2VzdCBETUEgYnVmZmVyIHRoYXQgd2UgY2xhaW0gdG8g
c3VwcG9ydCBhdAo+Pj4+IHBjbV9uZXcoKSwgSSB0aGluayB0aGlzIGlzIGFjdHVhbGx5IGFub3Ro
ZXIga2luZCBvZiB3YXN0IHdpdGggdGhlc2UKPj4+PiBsYXJnZXN0IHBpbm5lZCBidWZmZXIgdGhh
dCBjYW4ndCBiZSBzd2FwcGVkIG91dC4uLgo+Pj4KPj4+IFdlbGwsIHRoYXQncyB0aGUgY2FzZSB5
b3UnZCBuZWVkIGEgbGFyZ2VyIHByZWFsbG9jYXRpb24uCj4+PiBJIGd1ZXNzIG1hbnkgZGlzdHJv
cyBhbHJlYWR5IHNldCBpdCB0byBhIGhpZ2hlciB2YWx1ZSBmb3IgUHVsc2VBdWRpby4KPj4+IFRo
ZSBkZWZhdWx0IDY0a0IgaXMganVzdCBmcm9tIGhpc3RvcmljYWwgYW5kIGNvbXBhdGliaWxpdHkg
cmVhc29uLCBhbmQKPj4+IHdlIG1heSBleHRlbmQgaXQgdG8gMU1CIG9yIHNvIG5vdy4KPj4KPj4g
SW4gU09GIGRyaXZlciwgd2UgZG9uJ3QgdXNlIGtlcm5lbCBjb25maWcgaXRlbSBsaWtlCj4+IENP
TkZJR19TTkRfSERBX1BSRUFMTE9DX1NJWkUgZm9yIEhEQSwgdGhlIGNvZGUgZm9yIGl0IGlzOgo+
Pgo+PiAJc25kX3BjbV9saWJfcHJlYWxsb2NhdGVfcGFnZXMocGNtLT5zdHJlYW1zW3N0cmVhbV0u
c3Vic3RyZWFtLAo+PiAJCQkJICAgICAgU05EUlZfRE1BX1RZUEVfREVWX1NHLCBzZGV2LT5kZXYs
Cj4+IAkJCQlsZTMyX3RvX2NwdShjYXBzLT5idWZmZXJfc2l6ZV9taW4pLAo+PiAJCQkJbGUzMl90
b19jcHUoY2Fwcy0+YnVmZmVyX3NpemVfbWF4KSk7Cj4+Cj4+IFNvIHRoZSBwcmVhbGxvY2F0ZWQg
c2l6ZSBpcyBjb25maWd1cmVkIHZpYSB0b3BvbG9neSBmaWxlLCB0aGF0IGlzCj4+IGNhcHMtPmJ1
ZmZlcl9zaXplX21pbiwgbm8gY2hhbmNlIGZvciBQdWxzZUF1ZGlvIHRvIHJlY29uZmlndXJlIGl0
Lgo+Pgo+PiBTbywgaXQgbG9va3MgbGlrZSB3ZSBoYXZlIHRvIGNoYW5nZSBpdCB0byB0aGlzIGlm
IHdlIGRvbid0IGNoYW5nZSB0aGUKPj4gQUxTQSBjb3JlOgo+Pgo+PiAJc25kX3BjbV9saWJfcHJl
YWxsb2NhdGVfcGFnZXMocGNtLT5zdHJlYW1zW3N0cmVhbV0uc3Vic3RyZWFtLAo+PiAJCQkJICAg
ICAgU05EUlZfRE1BX1RZUEVfREVWX1NHLCBzZGV2LT5kZXYsCj4+IC0JCQkJbGUzMl90b19jcHUo
Y2Fwcy0+YnVmZmVyX3NpemVfbWluKSwKPj4gKwkJCQlsZTMyX3RvX2NwdShjYXBzLT5idWZmZXJf
c2l6ZV9tYXgpLAo+PiAJCQkJbGUzMl90b19jcHUoY2Fwcy0+YnVmZmVyX3NpemVfbWF4KSk7Cj4g
Cj4gWWVzLCBwYXNzaW5nIGJ1ZmZlcl9zaXplX21pbiBmb3IgdGhlIHByZWFsbG9jYXRpb24gc291
bmRzIGFscmVhZHkKPiBiYWQuICBUaGUgZGVmYXVsdCB2YWx1ZSBzaG91bGQgYmUgc3VmZmljaWVu
dCBmb3IgdXN1YWwgb3BlcmF0aW9ucywgbm90Cj4gdGhlIGNvc3QtY3V0dGluZyBtaW5pbXVtLiAg
T3RoZXJ3aXNlIHRoZXJlIGlzIG5vIG1lcml0IG9mCj4gcHJlYWxsb2NhdGlvbi4KPiAKPiBBbHRl
cm5hdGl2ZWx5LCB3ZSBtYXkgcGFzcyAwIHRoZXJlLCBpbmRpY2F0aW5nIG5vIGxpbWl0YXRpb24s
IHRvby4KPiBCdXQsIHRoaXMgd291bGQgbmVlZCBhIGJpdCBvdGhlciBhZGp1c3RtZW50LCBlLmcu
IHNuZF9wY21faGFyZHdhcmUKPiBzaG91bGQgaGF2ZSBsb3dlciBidWZmZXJfYnl0ZXNfbWF4LgoK
VGhhbmsgeW91IFRha2FzaGksIHRoZW4gbGV0J3MgZm9sbG93IGl0IHRvIHByZS1hbGxvY2F0ZSB3
aXRoIApjYXBzLT5idWZmZXJfc2l6ZV9tYXgsIGFzIHdlIGRvbid0IHNwZWNpZnkgYW55IGxpbWl0
YXRpb25zIGluIApzbmRfcGNtX2hhcmR3YXJlIHRvZGF5LCB3ZSB3YW50IHRvIGxlYXZlIGl0IGNv
bmZpZ3VyYWJsZSB0byBlYWNoIApzcGVjaWZpYyB0b3BvbG9neSBmaWxlIGZvciBkaWZmZXJlbnQg
bWFjaGluZXMuCgpUaGFua3MsCn5LZXlvbgoKPiAKPiAKPiBUYWthc2hpCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1haWxpbmcg
bGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
