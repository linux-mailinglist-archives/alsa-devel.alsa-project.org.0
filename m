Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1632D99F22
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EFA31607;
	Thu, 22 Aug 2019 20:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EFA31607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499584;
	bh=LTIRcPl4HfxnLjrz3q3T3Smj/nyZonnzkTfBCfDx4SY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL1KYvkyxjpd1Mc0EmZDERkcoGSRQmPwuKW/M+ejTA6IH7K2sCbSfdyVwn7FvHDiT
	 7XkmKPjfE56VGRCkiwqtZniMBNxtrUuomqjB2aTAFmlSXmA7oNHxlk/U2x0bQCu6Qg
	 HoP69UBcqb7jq9/qWWZ2FNV3maZRz0C5xV8ZqnVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C0CF8036E;
	Thu, 22 Aug 2019 20:44:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C594F80391; Thu, 22 Aug 2019 20:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E51AF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E51AF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 11:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="181483205"
Received: from aoho-mobl1.amr.corp.intel.com (HELO [10.252.135.9])
 ([10.252.135.9])
 by orsmga003.jf.intel.com with ESMTP; 22 Aug 2019 11:44:31 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
 <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
 <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <90925296-5cb4-fa87-9c35-a7008f5e8df5@linux.intel.com>
Date: Thu, 22 Aug 2019 13:44:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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

CgpPbiA4LzIyLzE5IDEyOjE0IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0w
OC0yMiAxODo0MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDgvMjIv
MTkgMTE6MDUgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+IE9uIDIwMTktMDgtMjIgMTc6
NTgsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiA4LzIyLzE5
IDY6MzYgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+Pj4gQXBhcnQgZnJvbSBIYXN3ZWxs
IG1hY2hpbmVzLCBhbGwgb3RoZXIgZGV2aWNlcyBoYXZlIHRoZWlyIHByaXZhdGUgZGF0YQo+Pj4+
PiBzZXQgdG8gc25kX3NvY19hY3BpX21hY2ggaW5zdGFuY2UuCj4+Pj4+Cj4+Pj4+IENoYW5nZXMg
Zm9yIEhTVy8gQkRXIGJvYXJkcyBpbnRyb2R1Y2VkIHdpdGggc2VyaWVzOgo+Pj4+PiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzEwNzgyMDM1Lwo+Pj4+Pgo+Pj4+PiBhZGRlZCBz
dXBwb3J0IGZvciBkYWlfbGluayBwbGF0Zm9ybV9uYW1lIGFkanVzdG1lbnRzIHdpdGhpbiBjYXJk
IHByb2JlCj4+Pj4+IHJvdXRpbmVzLiBUaGVzZSB0YWtlIGZvciBncmFudGVkIHByaXZhdGVfZGF0
YSBwb2ludHMgdG8KPj4+Pj4gc25kX3NvY19hY3BpX21hY2ggd2hlcmVhcyBmb3IgSGFzd2VsbCwg
aXQncyBzc3RfcGRhdGEgaW5zdGVhZC4gQ2hhbmdlCj4+Pj4+IHByaXZhdGUgY29udGV4dCBvZiBw
bGF0Zm9ybV9kZXZpY2UgLSByZXByZXNlbnRpbmcgbWFjaGluZSBib2FyZCAtIHRvCj4+Pj4+IGFk
ZHJlc3MgdGhpcy4KPj4+Pj4KPj4+Pj4gRml4ZXM6IGU4NzA1NWQ3MzJlMyAoIkFTb0M6IEludGVs
OiBoYXN3ZWxsOiBwbGF0Zm9ybSBuYW1lIGZpeHVwIAo+Pj4+PiBzdXBwb3J0IikKPj4+Pj4gRml4
ZXM6IDdlNDBkZGNmOTc0YSAoIkFTb0M6IEludGVsOiBiZHctcnQ1Njc3OiBwbGF0Zm9ybSBuYW1l
IGZpeHVwIAo+Pj4+PiBzdXBwb3J0IikKPj4+Pj4gRml4ZXM6IDJkMDY3YjI4MDdmOSAoIkFTb0M6
IEludGVsOiBicm9hZHdlbGw6IHBsYXRmb3JtIG5hbWUgZml4dXAgCj4+Pj4+IHN1cHBvcnQiKQo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRl
bC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoCBzb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3Bp
LmMgfCAzICsrLQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9u
L3NzdC1hY3BpLmMgCj4+Pj4+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+
Pj4+IGluZGV4IDE1ZjJiMjdlNjQzZi4uYzM0ZjYyOGM3OTg3IDEwMDY0NAo+Pj4+PiAtLS0gYS9z
b3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3BpLmMKPj4+Pj4gKysrIGIvc291bmQvc29jL2lu
dGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+Pj4+IEBAIC0xMDksMTEgKzEwOSwxMiBAQCBpbnQgc3N0
X2FjcGlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+Pj4gwqDCoMKgwqDC
oCB9Cj4+Pj4+IMKgwqDCoMKgwqAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgc3N0X2FjcGkp
Owo+Pj4+PiArwqDCoMKgIG1hY2gtPnBkYXRhID0gc3N0X3BkYXRhOwo+Pj4+PiDCoMKgwqDCoMKg
IC8qIHJlZ2lzdGVyIG1hY2hpbmUgZHJpdmVyICovCj4+Pj4+IMKgwqDCoMKgwqAgc3N0X2FjcGkt
PnBkZXZfbWFjaCA9Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwbGF0Zm9ybV9kZXZpY2VfcmVn
aXN0ZXJfZGF0YShkZXYsIG1hY2gtPmRydl9uYW1lLCAtMSwKPj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNzdF9wZGF0YSwgc2l6ZW9mKCpz
c3RfcGRhdGEpKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1hY2gsIHNpemVvZigqbWFjaCkpOwo+Pj4+Cj4+Pj4gSSBub3cgYWdyZWUg
dGhhdCB0aGUgY29kZSBJIGFkZGVkIGlzIGluY29ycmVjdCBhbmQgcHJvYmFibHkgYWNjZXNzZXMg
Cj4+Pj4gbWVtb3J5IG9mZnNldHMgdGhhdCBhcmVuJ3QgcmlnaHQuIEkgaGF2ZSBhYnNvbHV0ZWx5
IG5vIGlkZWEgd2h5IEkgCj4+Pj4gYWRkZWQgdGhpcyBjb21tZW50IHRoYXQgJ2xlZ2FjeSBkb2Vz
IG5vdCBwYXNzIHBhcmFtZXRlcnMnIHdoZW4gaXQgCj4+Pj4gbW9zdCBkZWZpbml0aXZlbHkgZG9l
cy4gR29vZCBjYXRjaCBvbiB5b3VyIHNpZGUuCj4+Pj4KPj4+PiBUaGF0IHNhaWQsIGRvZXNuJ3Qg
dGhlIHByb3Bvc2VkIGZpeCBpbnRyb2R1Y2UgYW5vdGhlciBpc3N1ZT8KPj4+Pgo+Pj4+IEluIHRo
ZSBtYWNoaW5lIGRyaXZlcnMsIHlvdSBzdGlsbCBnZXQgcGRhdGEgZGlyZWN0bHksIHNvIGFyZW4n
dCB5b3UgCj4+Pj4gbWlzc2luZyBhbiBpbmRpcmVjdGlvbiB0byBnZXQgYmFjayB0byBwZGF0YSBm
cm9tIG1hY2g/Cj4+Pj4KPj4+PiBzdGF0aWMgaW50IGJkd19ydDU2NzdfcnRkX2luaXQoc3RydWN0
IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCkKPj4+PiB7Cj4+Pj4gwqDCoMKgwqDCoHN0cnVjdCBz
bmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gCj4+Pj4gc25kX3NvY19ydGRjb21fbG9va3Vw
KHJ0ZCwgRFJWX05BTUUpOwo+Pj4+IMKgwqDCoMKgwqBzdHJ1Y3Qgc3N0X3BkYXRhICpwZGF0YSA9
IGRldl9nZXRfcGxhdGRhdGEoY29tcG9uZW50LT5kZXYpOwo+Pj4+IMKgwqDCoMKgwqBzdHJ1Y3Qg
c3N0X2hzdyAqYnJvYWR3ZWxsID0gcGRhdGEtPmRzcDsKPj4+Pgo+Pj4+IDw8PCBzbyBoZXJlIHlv
dSB0b29rIHRoZSB3cm9uZyBwb2ludGVyLCBubz8KPj4+Cj4+PiBCb3RoIEJheXRyYWlsIGFuZCBI
YXN3ZWxsIGFyZSBlbnVtZXJhdGVkIGluIGEgYml0IGRpZmZlcmVudCBmYXNoaW9uIAo+Pj4gdGhh
biBTS0wgZXF1aXZhbGVudHMuCj4+Pgo+Pj4gVGhlcmUgaXMgYW4gaW4tcGxhY2UgcmVnaXN0cmF0
aW9uIGZvciBtYWNoaW5lIGRldmljZSAtIHdob3NlIAo+Pj4gcHJpdmF0ZV9kYXRhIGdldHMgdXNl
ZCBpbiBtYWNoaW5lIHByb2JlIC0gYW5kIHBjbSBkZXZpY2Ugd2hpY2ggCj4+PiBoYXBwZW5zIG9u
IGZpcm13YXJlIGxvYWQgY2FsbGJhY2sgCj4+PiAoL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0
LWFjcGk6NjMpLiBfcnRkX2luaXQgbWFrZXMgdXNlIG9mIHRoZSAKPj4+IGxhdHRlciBvZiB0d28u
Cj4+Cj4+IEkgZG9uJ3QgZ2V0IHlvdXIgZXhwbGFuYXRpb25zLiBjYW4geW91IGVsYWJvcmF0ZSBv
biB3aGF0IHRoaXMgZG9lcyBub3cgCj4+IHRoYXQgcGRhdGEgaXMgbm8gbG9uZ2VyIHBhc3NlZCBh
cyBhbiBhcmd1bWVudCB0byB0aGUgbWFjaGluZSBkcml2ZXI6Cj4+Cj4+IHN0cnVjdCBzbmRfc29j
X2NvbXBvbmVudCAqY29tcG9uZW50ID0gc25kX3NvY19ydGRjb21fbG9va3VwKHJ0ZCwgCj4+IERS
Vl9OQU1FKTsKPj4gc3RydWN0IHNzdF9wZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGNv
bXBvbmVudC0+ZGV2KTsKPj4KPj4gdGhlICdjb21wb25lbnQnIGhlcmUgaXMgbm90IHRoZSBQQ00g
b25lLCBpcyBpdD8KPj4KPj4KPiAKPiBTdXJlIHRoaW5nLgo+IAo+IENvZGU6Cj4gIMKgwqDCoMKg
LyogcmVnaXN0ZXIgbWFjaGluZSBkcml2ZXIgKi8KPiAgwqDCoMKgwqBzc3RfYWNwaS0+cGRldl9t
YWNoID0KPiAgwqDCoMKgwqDCoMKgwqAgcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoZGV2
LCBtYWNoLT5kcnZfbmFtZSwgLTEsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNzdF9wZGF0YSwgc2l6ZW9mKCpzc3RfcGRhdGEpKTsKPiAKPiBG
b3VuZCBpbiBzc3RfYWNwaV9wcm9iZSAoL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFjcGku
YzoxNDUpIAo+IGdlbmVyYXRlcyBuZXcgcGxhdGZvcm1fZGV2aWNlIC0gd2hpY2ggcmVwcmVzZW50
cyBtYWNoaW5lIGJvYXJkIC0gd2l0aCAKPiBpdHMgcHJpdmF0ZSBkYXRhIHNldCB0byBwb2ludGVy
IHRvIGluc3RhbmNlIG9mIHN0cnVjdCBzc3RfcGRhdGEgdHlwZS4gCj4gVGhpcyBkYXRhIGdldHMg
dXNlZCBvbiBtYWNoaW5lIGJvYXJkIHByb2JlLCBlLmcuOiBicm9hZHdlbGxfYXVkaW9fcHJvYmUg
Cj4gKC9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2Jyb2Fkd2VsbC5jOjI3MCkuCj4gSW52b2x2ZWQg
cGxhdGZvcm0gaXMgY2FsbGVkOiBicm9hZHdlbGwtYXVkaW8uIFJlcXVlc3RlZCBwcml2YXRlIGRh
dGEgCj4gdHlwZSBieSBicm9hZHdlbGxfYXVkaW9fcHJvYmU6IHN0cnVjdCBzbmRfc29jX2FjcGlf
bWFjaCAqLiBNSVNNQVRDSC4KPiAKPiAKPiBDb2RlOgo+IAo+ICDCoMKgwqDCoC8qIHJlZ2lzdGVy
IFBDTSBhbmQgREFJIGRyaXZlciAqLwo+ICDCoMKgwqDCoHNzdF9hY3BpLT5wZGV2X3BjbSA9Cj4g
IMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKGRldiwgZGVzYy0+
ZHJ2X25hbWUsIC0xLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3BkYXRhKSk7Cj4gCj4gRm91bmQgaW4g
c3N0X2FjcGlfZndfY2IgKC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdF9hY3BpX2Z3X2NiOjQ3
KSAKPiBnZW5lcmF0ZXMgbmV3IHBsYXRmb3JtX2RldmljZSAtIHdoaWNoIHJlcHJlc2VudHMgSGFz
d2VsbCBQQ00sIHlvdSBtYXkgCj4gdHJlYXQgaXQgYXMgU2t5bGFrZSBlcXVpdmFsZW50IC0gd2l0
aCBpdHMgcHJpdmF0ZSBkYXRhIHNldCB0byBwb2ludGVyIHRvIAo+IGluc3RhbmNlIG9mIHN0cnVj
dCBzc3RfcGRhdGEgdHlwZS4gVGhpcyBkYXRhIGdldHMgdXNlZCBvbiBkYWkgLmluaXQgLSAKPiBi
cm9hZHdlbGxfcnRkX2luaXQgLSBpbnZvY2F0aW9uIHdoZW4gY2FyZCBpcyBpbnN0YW50aWF0ZWQg
YnkgQVNvQyBjb2RlLiAKPiBBcyB5b3UgY2FuIHNlZSBvbiAoL3NvdW5kL3NvYy9pbnRlbC9ib2Fy
ZHMvYnJvYWR3ZWxsLmM6MTYyKSwgcGxhdGZvcm0gCj4gdGllZCB3aXRoIGl0IGlzOiBoYXN3ZWxs
LXBjbS1hdWRpby4gUmVxdWVzdGVkIHByaXZhdGUgZGF0YSB0eXBlIGJ5IAo+IGJyb2Fkd2VsbF9y
dGRfaW5pdCAtIHN0cnVjdCBzc3RfcGRhdGEgKi4gTUFUQ0guCgoKdGhlIG1hY2hpbmUgZHJpdmVy
cyB1c2VzIHNuZF9zb2NfcnRkY29tX2xvb2t1cChydGQsIERSVl9OQU1FKTsKCkhvdyBpcyBEUlZf
TkFNRSBjb25uZWN0ZWQgdG8gaGFzd2VsbC1wY20tYXVkaW8/CgpJIG11c3QgYmUgbWlzc2luZyBz
b21ldGhpbmcgaW4geW91ciBsb2dpYy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
