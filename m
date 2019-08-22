Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1999F53
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13BE91662;
	Thu, 22 Aug 2019 21:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13BE91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566500672;
	bh=zMWPA+iIxm0hJvWSWectu0VJwoy87kach4sdaDR7o30=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BR5Qy5r2dgGsYqWENgUf4Ku3XvLh1RcmpPPtNDgXwYz1vvl8smrC3UrW+PcHo6FRC
	 P1Lh3/p9s4+BIyg7Mp/lNzNlHs7dmZ7L9CTpJDh/WNwWRwZEnkxzJxslzSi443iECa
	 Xv0eDP8aUDzDtzrlyHN6ZUU/ww/51cFi1LwIMmZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B2E5F8036D;
	Thu, 22 Aug 2019 21:02:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19478F80112; Thu, 22 Aug 2019 21:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AF9EF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF9EF80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="180476913"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.2.209])
 ([10.252.2.209])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2019 12:02:33 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
 <14962e17-8a86-5a84-0806-26be99c8b73b@intel.com>
 <3ea7a8a8-932b-4ae3-07d5-27e70208ad0b@linux.intel.com>
 <99f93211-acfe-cd29-09f9-900dbd848bd3@intel.com>
 <90925296-5cb4-fa87-9c35-a7008f5e8df5@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3ff82f6b-647f-5f9c-09c7-be42a00c8bd4@intel.com>
Date: Thu, 22 Aug 2019 21:02:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <90925296-5cb4-fa87-9c35-a7008f5e8df5@linux.intel.com>
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

T24gMjAxOS0wOC0yMiAyMDo0NCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yMi8xOSAxMjoxNCBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+PiBPbiAyMDE5LTA4
LTIyIDE4OjQyLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gOC8y
Mi8xOSAxMTowNSBBTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4+IE9uIDIwMTktMDgtMjIg
MTc6NTgsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiA4
LzIyLzE5IDY6MzYgQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4+Pj4+IEFwYXJ0IGZyb20g
SGFzd2VsbCBtYWNoaW5lcywgYWxsIG90aGVyIGRldmljZXMgaGF2ZSB0aGVpciBwcml2YXRlIAo+
Pj4+Pj4gZGF0YQo+Pj4+Pj4gc2V0IHRvIHNuZF9zb2NfYWNwaV9tYWNoIGluc3RhbmNlLgo+Pj4+
Pj4KPj4+Pj4+IENoYW5nZXMgZm9yIEhTVy8gQkRXIGJvYXJkcyBpbnRyb2R1Y2VkIHdpdGggc2Vy
aWVzOgo+Pj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDc4MjAzNS8K
Pj4+Pj4+Cj4+Pj4+PiBhZGRlZCBzdXBwb3J0IGZvciBkYWlfbGluayBwbGF0Zm9ybV9uYW1lIGFk
anVzdG1lbnRzIHdpdGhpbiBjYXJkIAo+Pj4+Pj4gcHJvYmUKPj4+Pj4+IHJvdXRpbmVzLiBUaGVz
ZSB0YWtlIGZvciBncmFudGVkIHByaXZhdGVfZGF0YSBwb2ludHMgdG8KPj4+Pj4+IHNuZF9zb2Nf
YWNwaV9tYWNoIHdoZXJlYXMgZm9yIEhhc3dlbGwsIGl0J3Mgc3N0X3BkYXRhIGluc3RlYWQuIENo
YW5nZQo+Pj4+Pj4gcHJpdmF0ZSBjb250ZXh0IG9mIHBsYXRmb3JtX2RldmljZSAtIHJlcHJlc2Vu
dGluZyBtYWNoaW5lIGJvYXJkIC0gdG8KPj4+Pj4+IGFkZHJlc3MgdGhpcy4KPj4+Pj4+Cj4+Pj4+
PiBGaXhlczogZTg3MDU1ZDczMmUzICgiQVNvQzogSW50ZWw6IGhhc3dlbGw6IHBsYXRmb3JtIG5h
bWUgZml4dXAgCj4+Pj4+PiBzdXBwb3J0IikKPj4+Pj4+IEZpeGVzOiA3ZTQwZGRjZjk3NGEgKCJB
U29DOiBJbnRlbDogYmR3LXJ0NTY3NzogcGxhdGZvcm0gbmFtZSBmaXh1cCAKPj4+Pj4+IHN1cHBv
cnQiKQo+Pj4+Pj4gRml4ZXM6IDJkMDY3YjI4MDdmOSAoIkFTb0M6IEludGVsOiBicm9hZHdlbGw6
IHBsYXRmb3JtIG5hbWUgZml4dXAgCj4+Pj4+PiBzdXBwb3J0IikKPj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IENlemFyeSBSb2pld3NraSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT4KPj4+Pj4+IC0t
LQo+Pj4+Pj4gwqAgc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jIHwgMyArKy0KPj4+
Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+
Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5j
IAo+Pj4+Pj4gYi9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3BpLmMKPj4+Pj4+IGluZGV4
IDE1ZjJiMjdlNjQzZi4uYzM0ZjYyOGM3OTg3IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvc291bmQvc29j
L2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+Pj4+PiArKysgYi9zb3VuZC9zb2MvaW50ZWwvY29t
bW9uL3NzdC1hY3BpLmMKPj4+Pj4+IEBAIC0xMDksMTEgKzEwOSwxMiBAQCBpbnQgc3N0X2FjcGlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAKPj4+Pj4+ICpwZGV2KQo+Pj4+Pj4gwqDCoMKg
wqDCoCB9Cj4+Pj4+PiDCoMKgwqDCoMKgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHNzdF9h
Y3BpKTsKPj4+Pj4+ICvCoMKgwqAgbWFjaC0+cGRhdGEgPSBzc3RfcGRhdGE7Cj4+Pj4+PiDCoMKg
wqDCoMKgIC8qIHJlZ2lzdGVyIG1hY2hpbmUgZHJpdmVyICovCj4+Pj4+PiDCoMKgwqDCoMKgIHNz
dF9hY3BpLT5wZGV2X21hY2ggPQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtX2Rl
dmljZV9yZWdpc3Rlcl9kYXRhKGRldiwgbWFjaC0+ZHJ2X25hbWUsIC0xLAo+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNzdF9wZGF0YSwg
c2l6ZW9mKCpzc3RfcGRhdGEpKTsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYWNoLCBzaXplb2YoKm1hY2gpKTsKPj4+Pj4KPj4+Pj4g
SSBub3cgYWdyZWUgdGhhdCB0aGUgY29kZSBJIGFkZGVkIGlzIGluY29ycmVjdCBhbmQgcHJvYmFi
bHkgCj4+Pj4+IGFjY2Vzc2VzIG1lbW9yeSBvZmZzZXRzIHRoYXQgYXJlbid0IHJpZ2h0LiBJIGhh
dmUgYWJzb2x1dGVseSBubyAKPj4+Pj4gaWRlYSB3aHkgSSBhZGRlZCB0aGlzIGNvbW1lbnQgdGhh
dCAnbGVnYWN5IGRvZXMgbm90IHBhc3MgCj4+Pj4+IHBhcmFtZXRlcnMnIHdoZW4gaXQgbW9zdCBk
ZWZpbml0aXZlbHkgZG9lcy4gR29vZCBjYXRjaCBvbiB5b3VyIHNpZGUuCj4+Pj4+Cj4+Pj4+IFRo
YXQgc2FpZCwgZG9lc24ndCB0aGUgcHJvcG9zZWQgZml4IGludHJvZHVjZSBhbm90aGVyIGlzc3Vl
Pwo+Pj4+Pgo+Pj4+PiBJbiB0aGUgbWFjaGluZSBkcml2ZXJzLCB5b3Ugc3RpbGwgZ2V0IHBkYXRh
IGRpcmVjdGx5LCBzbyBhcmVuJ3QgeW91IAo+Pj4+PiBtaXNzaW5nIGFuIGluZGlyZWN0aW9uIHRv
IGdldCBiYWNrIHRvIHBkYXRhIGZyb20gbWFjaD8KPj4+Pj4KPj4+Pj4gc3RhdGljIGludCBiZHdf
cnQ1Njc3X3J0ZF9pbml0KHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQpCj4+Pj4+IHsK
Pj4+Pj4gwqDCoMKgwqDCoHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0gCj4+
Pj4+IHNuZF9zb2NfcnRkY29tX2xvb2t1cChydGQsIERSVl9OQU1FKTsKPj4+Pj4gwqDCoMKgwqDC
oHN0cnVjdCBzc3RfcGRhdGEgKnBkYXRhID0gZGV2X2dldF9wbGF0ZGF0YShjb21wb25lbnQtPmRl
dik7Cj4+Pj4+IMKgwqDCoMKgwqBzdHJ1Y3Qgc3N0X2hzdyAqYnJvYWR3ZWxsID0gcGRhdGEtPmRz
cDsKPj4+Pj4KPj4+Pj4gPDw8IHNvIGhlcmUgeW91IHRvb2sgdGhlIHdyb25nIHBvaW50ZXIsIG5v
Pwo+Pj4+Cj4+Pj4gQm90aCBCYXl0cmFpbCBhbmQgSGFzd2VsbCBhcmUgZW51bWVyYXRlZCBpbiBh
IGJpdCBkaWZmZXJlbnQgZmFzaGlvbiAKPj4+PiB0aGFuIFNLTCBlcXVpdmFsZW50cy4KPj4+Pgo+
Pj4+IFRoZXJlIGlzIGFuIGluLXBsYWNlIHJlZ2lzdHJhdGlvbiBmb3IgbWFjaGluZSBkZXZpY2Ug
LSB3aG9zZSAKPj4+PiBwcml2YXRlX2RhdGEgZ2V0cyB1c2VkIGluIG1hY2hpbmUgcHJvYmUgLSBh
bmQgcGNtIGRldmljZSB3aGljaCAKPj4+PiBoYXBwZW5zIG9uIGZpcm13YXJlIGxvYWQgY2FsbGJh
Y2sgCj4+Pj4gKC9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1hY3BpOjYzKS4gX3J0ZF9pbml0
IG1ha2VzIHVzZSBvZiB0aGUgCj4+Pj4gbGF0dGVyIG9mIHR3by4KPj4+Cj4+PiBJIGRvbid0IGdl
dCB5b3VyIGV4cGxhbmF0aW9ucy4gY2FuIHlvdSBlbGFib3JhdGUgb24gd2hhdCB0aGlzIGRvZXMg
Cj4+PiBub3cgdGhhdCBwZGF0YSBpcyBubyBsb25nZXIgcGFzc2VkIGFzIGFuIGFyZ3VtZW50IHRv
IHRoZSBtYWNoaW5lIGRyaXZlcjoKPj4+Cj4+PiBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNv
bXBvbmVudCA9IHNuZF9zb2NfcnRkY29tX2xvb2t1cChydGQsIAo+Pj4gRFJWX05BTUUpOwo+Pj4g
c3RydWN0IHNzdF9wZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGNvbXBvbmVudC0+ZGV2
KTsKPj4+Cj4+PiB0aGUgJ2NvbXBvbmVudCcgaGVyZSBpcyBub3QgdGhlIFBDTSBvbmUsIGlzIGl0
Pwo+Pj4KPj4+Cj4+Cj4+IFN1cmUgdGhpbmcuCj4+Cj4+IENvZGU6Cj4+IMKgwqDCoMKgwqAvKiBy
ZWdpc3RlciBtYWNoaW5lIGRyaXZlciAqLwo+PiDCoMKgwqDCoMKgc3N0X2FjcGktPnBkZXZfbWFj
aCA9Cj4+IMKgwqDCoMKgwqDCoMKgwqAgcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoZGV2
LCBtYWNoLT5kcnZfbmFtZSwgLTEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3N0X3BkYXRhLCBzaXplb2YoKnNzdF9wZGF0YSkpOwo+Pgo+
PiBGb3VuZCBpbiBzc3RfYWNwaV9wcm9iZSAoL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWFj
cGkuYzoxNDUpIAo+PiBnZW5lcmF0ZXMgbmV3IHBsYXRmb3JtX2RldmljZSAtIHdoaWNoIHJlcHJl
c2VudHMgbWFjaGluZSBib2FyZCAtIHdpdGggCj4+IGl0cyBwcml2YXRlIGRhdGEgc2V0IHRvIHBv
aW50ZXIgdG8gaW5zdGFuY2Ugb2Ygc3RydWN0IHNzdF9wZGF0YSB0eXBlLiAKPj4gVGhpcyBkYXRh
IGdldHMgdXNlZCBvbiBtYWNoaW5lIGJvYXJkIHByb2JlLCBlLmcuOiAKPj4gYnJvYWR3ZWxsX2F1
ZGlvX3Byb2JlICgvc291bmQvc29jL2ludGVsL2JvYXJkcy9icm9hZHdlbGwuYzoyNzApLgo+PiBJ
bnZvbHZlZCBwbGF0Zm9ybSBpcyBjYWxsZWQ6IGJyb2Fkd2VsbC1hdWRpby4gUmVxdWVzdGVkIHBy
aXZhdGUgZGF0YSAKPj4gdHlwZSBieSBicm9hZHdlbGxfYXVkaW9fcHJvYmU6IHN0cnVjdCBzbmRf
c29jX2FjcGlfbWFjaCAqLiBNSVNNQVRDSC4KPj4KPj4KPj4gQ29kZToKPj4KPj4gwqDCoMKgwqDC
oC8qIHJlZ2lzdGVyIFBDTSBhbmQgREFJIGRyaXZlciAqLwo+PiDCoMKgwqDCoMKgc3N0X2FjcGkt
PnBkZXZfcGNtID0KPj4gwqDCoMKgwqDCoMKgwqDCoCBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJf
ZGF0YShkZXYsIGRlc2MtPmRydl9uYW1lLCAtMSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzc3RfcGRhdGEsIHNpemVvZigqc3N0X3BkYXRh
KSk7Cj4+Cj4+IEZvdW5kIGluIHNzdF9hY3BpX2Z3X2NiICgvc291bmQvc29jL2ludGVsL2NvbW1v
bi9zc3RfYWNwaV9md19jYjo0NykgCj4+IGdlbmVyYXRlcyBuZXcgcGxhdGZvcm1fZGV2aWNlIC0g
d2hpY2ggcmVwcmVzZW50cyBIYXN3ZWxsIFBDTSwgeW91IG1heSAKPj4gdHJlYXQgaXQgYXMgU2t5
bGFrZSBlcXVpdmFsZW50IC0gd2l0aCBpdHMgcHJpdmF0ZSBkYXRhIHNldCB0byBwb2ludGVyIAo+
PiB0byBpbnN0YW5jZSBvZiBzdHJ1Y3Qgc3N0X3BkYXRhIHR5cGUuIFRoaXMgZGF0YSBnZXRzIHVz
ZWQgb24gZGFpIC5pbml0IAo+PiAtIGJyb2Fkd2VsbF9ydGRfaW5pdCAtIGludm9jYXRpb24gd2hl
biBjYXJkIGlzIGluc3RhbnRpYXRlZCBieSBBU29DIAo+PiBjb2RlLiBBcyB5b3UgY2FuIHNlZSBv
biAoL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMvYnJvYWR3ZWxsLmM6MTYyKSwgCj4+IHBsYXRmb3Jt
IHRpZWQgd2l0aCBpdCBpczogaGFzd2VsbC1wY20tYXVkaW8uIFJlcXVlc3RlZCBwcml2YXRlIGRh
dGEgCj4+IHR5cGUgYnkgYnJvYWR3ZWxsX3J0ZF9pbml0IC0gc3RydWN0IHNzdF9wZGF0YSAqLiBN
QVRDSC4KPiAKPiAKPiB0aGUgbWFjaGluZSBkcml2ZXJzIHVzZXMgc25kX3NvY19ydGRjb21fbG9v
a3VwKHJ0ZCwgRFJWX05BTUUpOwo+IAo+IEhvdyBpcyBEUlZfTkFNRSBjb25uZWN0ZWQgdG8gaGFz
d2VsbC1wY20tYXVkaW8/Cj4gCj4gSSBtdXN0IGJlIG1pc3Npbmcgc29tZXRoaW5nIGluIHlvdXIg
bG9naWMuCj4gCgpQbGVhc2UgY2hlY2tvdXQgc3N0LWFjcGkuYyBmaWxlIGFuZCBzZWUgZGVjbGFy
YXRpb24gb2YgbGVnYWN5IHBsYXRmb3JtIApkZXNjcmlwdG9ycy4gU2VlIHRoZSBuYW1lcyBvZiBQ
Q00gZGV2aWNlcyAocGxhdGZvcm0gZGV2aWNlcykgYmVpbmcgZGVjbGFyZWQuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
