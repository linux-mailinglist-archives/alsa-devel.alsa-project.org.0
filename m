Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575951470B1
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 19:24:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8740E1683;
	Thu, 23 Jan 2020 19:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8740E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579803892;
	bh=dNQuMqDI2EGOUdzuugFiF5gQAHISlSA9T5YBsIZqmsQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=emhiRcfavndz2wxp/UDxl7tVmIUx0n8NIis1I9r8cA0GJ1k9dd1adYRwnQo5tjDF3
	 RpXvczTmps4zlMgEK3c+rNtE3ZHzCcCZah47ixiMshZNJiWbeu0VB5lI90B+i8dSk/
	 J81ToPfRekrVfDAO6RwImUegzsRDGKnqJq49L2ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34033F801ED;
	Thu, 23 Jan 2020 19:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B82CF801D9; Thu, 23 Jan 2020 19:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3F87F80112
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 19:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F87F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 10:22:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,354,1574150400"; d="scan'208";a="221689014"
Received: from batya-mobl4.ger.corp.intel.com (HELO [10.251.128.108])
 ([10.251.128.108])
 by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2020 10:22:58 -0800
To: "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com
References: <20200122181254.22801-1-cezary.rojewski@intel.com>
 <9246ee43-ffec-2b28-3a56-211f08797342@intel.com>
 <a30fffb3-5f6b-eaa4-1684-3f19d973c54f@linux.intel.com>
 <013c7d4b-c08f-f476-50fe-70ae22580277@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5516562e-9f0c-55c8-a193-b1a80a341392@linux.intel.com>
Date: Thu, 23 Jan 2020 12:22:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <013c7d4b-c08f-f476-50fe-70ae22580277@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl_hda_dsp_common: Fix
 global-out-of-bounds bug
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

Cgo+Pj4gRm9yIHRoZSBsYXN0IGZldyBkYXlzIHdlIGhhdmUgYmVlbiBwbGF5aW5nIHdpdGggInZh
bmlsbGEiIDUuNSBrZXJuZWwgCj4+PiAtIG9uZSB3aXRob3V0IHRvbiBvZiAvc2t5bGFrZSBwYXRj
aGVzIC0gdG8gZmluZCBvdXQgaG93IGNvdWxkIGhkYS1kc3AgCj4+PiBiZSBlbmFibGVkIG9uIHNr
bC8ga2JsKyB3aXRoIHRoZSBsZWFzdCBhbW91bnQgb2YgY2hhbmdlcyBwdWxsZWQgZnJvbSAKPj4+
IG91ciBicmFuY2ggcG9zc2libGUuCj4+Pgo+Pj4gVHVybmVkIG91dCB0aGUgYWRkaXRpb24gb2Yg
dGhpcyBzaW5nbGUgcGF0Y2ggQU5EIHRvcG9sb2d5IGJpbmFyeSAKPj4+IHVwZGF0ZSBnb3QgdGhl
IGpvYiBkb25lLgo+Pj4KPj4+IE5vdywgaG93IGNhbiB3ZSBwcm9jZWVkIHdpdGggc3VjaCBzb2x1
dGlvbi4gQ2FuIHNoYXJlIHRoZSB0b3BvbG9neSAKPj4+IGJpbmFyeS8gLmNvbmYgaWYgbmVlZGVk
LCBzbyBhbnlvbmUgaW50ZXJlc3RlZCBjYW4gY2hlY2sgaXQgb3V0Lgo+Pgo+PiBJIGFtIHBlcnNv
bmFsbHkgaW50ZXJlc3RlZCBmb3IgdGVzdHMgYnV0IEkgZG91YnQgdGhpcyBvcHRpb24gaXMgdXNh
YmxlIAo+PiBieSBhbnlvbmUgb3V0c2lkZSBvZiBJbnRlbCAtIGFkZGl0aW9uYWwgaXNzdWVzIHdp
dGggcHJvYmUgcmFjZSAKPj4gY29uZGl0aW9ucyB3aXRoIGk5MTUsIGUuZy4gb24gTGludXMnIERl
bGwgWFBTIDkzNTAsIG5vIERNSUMgc3VwcG9ydCAKPj4gYW5kIG5vdCBzZWxlY3RlZCBhbnl3YXlz
IGJ5IEphcm9zbGF2J3MgbmV3IGxvZ2ljLCBubyBVQ00sIGFuZCBubyBwbGFucyAKPj4gZm9yIHRo
ZSB1c2Ugb2YgdGhlIEhETUkgY29tbW9uIGNvZGVjLgo+IAo+IFRoZSBMaW51eCBTa3lsYWtlIGRy
aXZlciBvZmZpY2lhbGx5IHN1cHBvcnQgYXVkaW8gb3ZlciBEU1Agb24gSW50ZWwgY0FWUyAKPiAx
LjUrIGJvYXJkcywgdGhhdCBpbmNsdWRlIFNreWxha2UgSFcgdGFyZ2V0IHdpdGggaGRhLWRzcCBj
b25maWd1cmF0aW9uLiAKPiBUaGUgY29uZmlndXJhdGlvbiBpcyByZWd1bGFybHkgdGVzdGVkIGJ5
IEludGVsIEF1ZGlvIENJIHRlYW0uCj4gCj4gQXMgaXQgd2FzIGFncmVlZCB3aXRoIHlvdSBQaWVy
cmUgdGhlIFNreWxha2UgZHJpdmVyIHdpbGwgYmUga2VwdCB1bmRlciAKPiBtYWludGVuYW5jZSBh
bmQgdGhlIHByb3Bvc2VkIGNoYW5nZXMgYXJlIGFib3V0IHRvIGtlZXAgaGRhLWRzcCAKPiBjb25m
aWd1cmF0aW9uIGZ1bmN0aW9uYWwgZm9yIGFueW9uZSB3aG8gd291bGQgbGlrZSB0byB1c2UgaXQu
IExpbnVzIAo+IGxhcHRvcCBpc3N1ZSBpcyBhY3R1YWxseSBvbmUgb2YgdGhlIGdvb2QgcmVhc29u
cyB3aHkgd2Ugd291bGQgbGlrZSB0byAKPiBrZWVwIGhkYS1kc3AgY29uZmlndXJhdGlvbiBmdW5j
dGlvbmFsCgpXZSBoYXZlIHRvIGFncmVlIG9uIHdoYXQgJ21haW50YWluZWQnIG1lYW5zIHRoZW4u
CgpJIGRvbid0IG1pbmQgbGVhdmluZyB0aGUgU2t5bGFrZSBkcml2ZXIgaW4gdGhlIGtlcm5lbCBh
bmQgbGV0dGluZyBwZW9wbGUgCndobyBoYXZlIGFjY2VzcyB0byBJbnRlbCBzdXBwb3J0IHVzZSBp
dC4gQ2V6YXJ5IGlzIGxpc3RlZCBhcyB0aGUgCm1haW50YWluZXIgYXMgSSBzdWdnZXN0ZWQgaXQs
IGFuZCB0aGlzIHBhdGNoIHByb3ZpZGVzIGFuIG5lY2Vzc2FyeSBmaXguCgpCdXQgZG9lcyB0aGlz
IG1lYW4gdGhpcyBIZGF1ZGlvIG9wdGlvbiBpcyB1c2FibGUgYnkgZGlzdHJpYnV0aW9ucyBhbmQg
CkxpbnV4IHVzZXJzIHdobyBkb24ndCBoYXZlIGFjY2VzcyB0byBJbnRlbCBzdXBwb3J0PwoKSSB3
aWxsIGFzc2VydCB0aGF0IGl0J3Mgbm90LCBiYXNlZCBvbiBteSBvd24gZXhwZXJpZW5jZSBvbmx5
IDIgd2Vla3MgCmFnby4gSSB0cmllZCB0byBtYWtlIGF1ZGlvIHdvcmsgb24gYSBLQkwgTlVDIGFu
ZCBoYWQgdG8gY29tbWVudCBzdHVmZiAKb3V0IGR1ZSB0byBhbiBvYnNvbGV0ZSB0b3BvbG9neS4g
c2VlIApodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9saW51eC9wdWxsLzE2NjcjaXNz
dWVjb21tZW50LTU3MjMxMjE1NwoKWW91IHNob3VsZCBhbHNvIGxvb2sgYXQgdGhlIGhlbHAgdGV4
dCBmb3IgdGhlIG9wdGlvbjoKCmNvbmZpZyBTTkRfU09DX0lOVEVMX1NLWUxBS0VfSERBVURJT19D
T0RFQwoJYm9vbCAiSERBdWRpbyBjb2RlYyBzdXBwb3J0IgoJaGVscAoJICBUaGlzIG9wdGlvbiBi
cm9rZSBhdWRpbyBvbiBMaW51cycgU2t5bGFrZSBsYXB0b3AgaW4gRGVjZW1iZXIgMjAxOAoJICBh
bmQgdGhlIHJhY2UgY29uZGl0aW9ucyBkdXJpbmcgdGhlIHByb2JlIHdlcmUgbm90IGZpeGVkIHNp
bmNlLgoJICBUaGlzIG9wdGlvbiBpcyBERVBSRUNBVEVELCBhbGwgSERhdWRpbyBjb2RlYyBzdXBw
b3J0IG5lZWRzCgkgIHRvIGJlIGhhbmRsZWQgYnkgdGhlIFNPRiBkcml2ZXIuCgkgIERpc3RyaWJ1
dGlvbnMgc2hvdWxkIG5vdCBlbmFibGUgdGhpcyBvcHRpb24gYW5kIHRoZXJlIGFyZSBubyBrbm93
bgoJICB1c2VycyBvZiB0aGlzIGNhcGFiaWxpdHkuCgpObyBvbmUgb2JqZWN0ZWQgdG8gdGhpcyB3
b3JkaW5nIGJhY2sgaW4gT2N0b2JlciwgYnV0IHdlIHN0aWxsIHNlZSB0aGlzIApvcHRpb24gc2Vs
ZWN0ZWQgaW4gbXVsdGlwbGUgZGlzdHJvcywgc28gdGhlIGxhc3Qgc3VnZ2VzdGlvbiBpcyB0byBt
b3ZlIAp0byBhbiBvcHQtaW4gc2VsZWN0aW9uIHRvIGd1aWRlIGRpc3RyaWJ1dGlvbnMuCgo+IFlv
dXIgb3RoZXIgc3RhdGVtZW50cyBQaWVycmUgYXJlIHF1aXRlIG91dGRhdGVkOgo+IAo+ICDCoMKg
wqAgLSBQcm9iZSByYWNlIGNvbmRpdGlvbnMgd2l0aCBpOTE1IC0gcmVzb2x2ZWQgaW4gSERBCgpJ
IGNoZWNrZWQgbGFzdCBtb250aCBhbmQgdGhpbmdzIHN0aWxsIGJyZWFrIG9uIHRoZSBEZWxsIFhQ
Uy4gVGhlcmUgYXJlIApjaGFsbGVuZ2luZyByYWNlIGNvbmRpdGlvbnMgdGhhdCBhcmUgbm90IHNl
ZW4gb24gSW50ZWwgUlZQcyBhbmQgTlVDcywgCmJ1dCBicm9rZSBMaW51cycgbGFwdG9wIGFuZCBh
IHNsZXcgb2Ygb3RoZXJzOgoKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJt
YWlsL2Fsc2EtZGV2ZWwvMjAxOC1EZWNlbWJlci8xNDM1NDkuaHRtbAoKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOC1EZWNlbWJlci8xNDM1
OTYuaHRtbAoKVW5sZXNzIHlvdSd2ZSB2ZXJpZmllZCBTU1Qgc3VwcG9ydCBvbiB0aG9zZSBwbGF0
Zm9ybXMsIHlvdXIgY2xhaW0gb2YgCidyZXNvbHZlZCcgaXMgaW52YWxpZC4KCj4gIMKgwqDCoCAt
IERNSUMgaXMgc3VwcG9ydGVkCgpUaGVyZSBpcyBubyB0b3BvbG9neSBwcm92aWRlZCB3aXRoIERN
SUMrSERhdWRpbyBzdXBwb3J0LiBJIGFza2VkIGZvciAKdGhpcyBtb3JlIHRoYW4gMTggbW9udGhz
IGFnbyBhbmQgaXQgd2FzIG5ldmVyIG1hZGUgYXZhaWxhYmxlLCBldmVuIHRvIAptZSwgYW5kIFNP
RiBiZWNvbWUgdGhlIGRlZmF1bHQgc29sdXRpb24gZm9yIEhEQXVkaW8rRE1JQyBjYXNlcy4KCj4g
IMKgwqDCoCAtIFVDTSBpcyBub3QgZGlyZWN0bHkgZHJpdmVyIHJlbGF0ZWQgYW5kIGNhbiBiZSBl
YXNpbHkgdXBkYXRlZAoKImVhc2lseSIsIGJ1dCBoYXNuJ3QgYmVlbiBkb25lIGluIDE4IG1vbnRo
cywgYW5kIGl0IGFjdHVhbGx5IHRha2VzIGEgbG90IApvZiB3b3JrIHRvIGdldCB0aGluZ3Mgcmln
aHQuIEVzcGVjaWFsbHkgd2l0aCB0aGUgU1NUIGRyaXZlciBhbmQgdGhlIAptaXhlcnMgcmVxdWly
ZWQgb24gdGhlIHBsYXRmb3JtIHNpZGUgc2luY2Ugbm90aGluZyBpcyBjb25uZWN0ZWQgYnkgZGVm
YXVsdC4KCj4gIMKgwqDCoCAtIEludGVsIEF1ZGlvIENJIHdhcyBmb2N1c2VkIG9uIGNvbW1vbiBI
RC1BIGNvZGVjIGJ1dCB0aGUgSERNSSAKPiBjb21tb24gY29kZWMgaXMgc3VwcG9ydGVkIGFzIHdl
bGwKPiAKPj4gSW4gY2FzZSB5b3UgZGlkbid0IHNlZSBpdCwgdGhlIFNreWxha2UgZHJpdmVyICdI
RGF1ZGlvIGNvZGVjJyBvcHRpb24gCj4+IGlzIHN1Z2dlc3RlZCBhcyBvbmUgb2YgdGhlICd1bnN1
cHBvcnRlZCcgZmVhdHVyZXMgaGVyZToKPj4gaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2pl
Y3QvbGludXgvcHVsbC8xNzQyCj4+Cj4+IC1QaWVycmUKPiAKPiBUaGUgc3VnZ2VzdGlvbiB0byBt
YXJrIHRoZSBTa3lsYWtlIGRyaXZlciAnSERhdWRpbyBjb2RlYycgb3B0aW9uIGFzIAo+ICd1bnN1
cHBvcnRlZCcgaXMgY29taW5nIGZyb20geW91IFBpZXJyZSAocGF0Y2ggZnJvbSB0d28gZGF5c2Fn
bz8pIGFuZCBJIAo+IGJlbGlldmUgdGhhdCB5b3Ugc2hvdWxkIGNvbnN1bHQgc3VjaCBvcGluaW9u
IHdpdGggSW50ZWwgU2t5bGFrZSBkcml2ZXIgCj4gbWFpbnRhaW5lcnMuCgpZb3Ugd2VyZSBpbiBj
b3B5IGFuZCBkaWQgbm90IGNvbW1lbnQsIHNhbWUgZm9yIENlemFyeS4KCk1heWJlICd1bnN1cHBv
cnRlZCcgaXMgdG9vIHN0cm9uZyBhIHdvcmQsIGJ1dCBpdCB3YXMgVGFrYXNoaSdzIApzdWdnZXN0
aW9uIDotKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
