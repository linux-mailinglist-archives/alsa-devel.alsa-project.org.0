Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CB132AE0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 17:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0C8184F;
	Tue,  7 Jan 2020 17:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0C8184F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578413741;
	bh=e6VXJQwN4sPovlYxIQaCftknU04Ng3wnQBMPHSqqT9Y=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMhRG/ejTmz02G3oRkp9l+cYOOVJsw2/Od2vQd7NJntx5HpRcccLTb5jti4HS11mC
	 AzY6vTyK/msip3KlMtC8GW91ISe/UYKz5n33krt6yyHKVElC5ijT20hzg1nTS0+FhP
	 eFEPD71fHhrBBx0vXOTktwD25uFnyGxv82NWONN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D2FFF80140;
	Tue,  7 Jan 2020 17:13:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79FCFF8010B; Tue,  7 Jan 2020 17:13:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2610F8010B
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 17:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2610F8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2020 08:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; d="scan'208";a="421121687"
Received: from adohr-mobl1.ger.corp.intel.com (HELO [10.252.12.58])
 ([10.252.12.58])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jan 2020 08:13:48 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20191217095851.19629-1-cezary.rojewski@intel.com>
 <20191217095851.19629-2-cezary.rojewski@intel.com>
 <s5h36dj2r0y.wl-tiwai@suse.de>
 <8d796ef4-e6d2-ade3-25c3-756599c44348@intel.com>
Message-ID: <9de668a0-07f9-a56b-e845-741355104fc3@intel.com>
Date: Tue, 7 Jan 2020 17:13:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8d796ef4-e6d2-ade3-25c3-756599c44348@intel.com>
Content-Language: en-US
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 1/7] ALSA: hda: Allow for compress stream
 to hdac_ext_stream assignment
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

T24gMjAxOS0xMi0xNyAxMzowNiwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+IAo+IAo+IE9uIDIw
MTktMTItMTcgMTE6MTksIFRha2FzaGkgSXdhaSB3cm90ZToKPj4gT24gVHVlLCAxNyBEZWMgMjAx
OSAxMDo1ODo0NSArMDEwMCwKPj4gQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4KPj4+IEN1cnJl
bnRseSBvbmx5IFBDTSBzdHJlYW1zIGNhbiBlbmxpc3QgaGRhY19zdHJlYW0gZm9yIHRoZWlyIGRh
dGEKPj4+IHRyYW5zZmVyLiBBZGQgY3N0cmVhbSBmaWVsZCB0byBoZGFjX2V4dF9zdHJlYW0gdG8g
ZXhwb3NlIHBvc3NpYmlsaXR5IG9mCj4+PiBjb21wcmVzcyBzdHJlYW0gYXNzaWdubWVudCBpbiBw
bGFjZSBvZiBQQ00gb25lLgo+Pj4gTGltaXRlZCB0byBIT1NULXR5cGUgb25seS4KPj4+Cj4+PiBS
YXRoZXIgdGhhbiBjb3B5aW5nIGVudGlyZSBoZGFjX2V4dF9ob3N0X3N0cmVhbV9hc3NpZ24sIGRl
Y2xhcmUgc2VwYXJhdGUKPj4+IFBDTSBhbmQgY29tcHJlc3Mgd3JhcHBlcnMgYW5kIHJldXNlIGl0
IGZvciBib3RoIGNhc2VzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENlemFyeSBSb2pld3NraSA8
Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgaW5jbHVkZS9zb3VuZC9o
ZGF1ZGlvLmjCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPj4+IMKgIGluY2x1ZGUvc291bmQvaGRh
dWRpb19leHQuaMKgwqDCoMKgIHzCoCAyICsrCj4+PiDCoCBzb3VuZC9oZGEvZXh0L2hkYWNfZXh0
X3N0cmVhbS5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4+PiDCoCAz
IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvaGRhdWRpby5oIGIvaW5jbHVkZS9zb3VuZC9oZGF1
ZGlvLmgKPj4+IGluZGV4IGUwNWI5NWU4M2Q1YS4uOWE4YmYxZWI3ZDY5IDEwMDY0NAo+Pj4gLS0t
IGEvaW5jbHVkZS9zb3VuZC9oZGF1ZGlvLmgKPj4+ICsrKyBiL2luY2x1ZGUvc291bmQvaGRhdWRp
by5oCj4+PiBAQCAtNDgxLDYgKzQ4MSw3IEBAIHN0cnVjdCBoZGFjX3N0cmVhbSB7Cj4+PiDCoMKg
wqDCoMKgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtO8KgwqDCoCAvKiBhc3Np
Z25lZCBzdWJzdHJlYW0sCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogc2V0IGluIFBDTSBvcGVuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+PiArwqDCoMKgIHN0cnVjdCBz
bmRfY29tcHJfc3RyZWFtICpjc3RyZWFtOwo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgZm9y
bWF0X3ZhbDvCoMKgwqAgLyogZm9ybWF0IHZhbHVlIHRvIGJlIHNldCBpbiB0aGUKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogY29udHJvbGxlciBhbmQg
dGhlIGNvZGVjCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqLwo+Pgo+PiBPbmUgbWlnaHQgdXNlIHVuaW9uIGZvciBwb2ludGluZyB0byBlaXRoZXIgUENN
IG9yIGNvbXByIHN0cmVhbSBhbmQKPj4gaWRlbnRpZnkgdGhlIHR5cGUgd2l0aCBzb21lIGZsYWcu
Cj4+Cj4+IMKgwqDCoMKgc3RydWN0IGhkYWNfc3RyZWFtIHsKPj4gwqDCoMKgwqDCoMKgwqAgdW5p
b24gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAq
c3Vic3RyZWFtOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBzbmRfY29tcHJfc3Ry
ZWFtICpjc3RyZWFtOwo+PiDCoMKgwqDCoMKgwqDCoCB9Owo+PiDCoMKgwqDCoMKgwqDCoCBib29s
IGlzX2NvbXByOwo+PiDCoMKgwqDCoMKgwqDCoCAuLi4uCj4+Cj4+IEJ1dCwgSSdtIG5vdCBhZHZv
Y2F0aW5nIGZvciB0aGlzLsKgIEFsdGhvdWdoIHRoaXMgbWFrZXMgdGhlIHN0cmVhbQo+PiBhc3Np
Z25tZW50IG1vcmUgaGFuZHksIGl0IG1pZ2h0IGxlYWQgdG8gcmVmZXIgdG8gYSB3cm9uZyBvYmpl
Y3QgaWYgeW91Cj4+IGRvbid0IGNoZWNrIHRoZSBmbGFnIHByb3Blcmx5LCB0b28uwqAgSXQgcmVh
bGx5IGRlcGVuZHMgb24gdGhlIGNvZGUuCj4+Cj4gCj4gSSdtIGhhcHB5IHdpdGggYm90aCAtIGV4
aXN0aW5nIC0gYW5kIHlvdXIgdmFyaWFudC4gSW4gZXNzZW5jZSwgdGhpcyAKPiBjYXVzZXMgc2lt
cGx5OiBzL2lmIChoc3RyZWFtLT5jc3RyZWFtKS9pZiAoaHN0cmVhbS0+aXNfY29tcHIpL2cgdG8g
b2NjdXIuCj4gCj4gSW4gZ2VuZXJhbCwgSSdtIHN0cm9uZyBzdXBwb3J0ZXIgb2YgYSAiUENNLWNv
bXByIG1hcnJpYWdlIiBpZGVhIC0gYm90aCAKPiBiZWluZyBjb21iaW5lZCBpbiBzZW5zZSBvZiBo
YXZpbmcgc2ltaWxhciBiYXNlIGluIHRoZSBmdXR1cmUgc28gb25lIAo+IGNvdWxkIG1ha2UgdXNl
IG9mICJzbmRfYmFzZV9zdHJlYW0iLCBjaGVja291dCB0aGUgaXNfY29tcHIgZmllbGQgYW5kIAo+
IGNhc3QgaW50byBhY3R1YWwgdHlwZSAoX3BjbV8gLW9yLSBfY29tcHJfKSB2aWEgY29udGFpbmVy
X29mIG1hY3JvLgo+IAo+IFRoaXMgaXMgbW9yZSBvZiBhIHdpc2ggb3Igc29uZyBvZiB0aGUgZnV0
dXJlIGZvciBub3csIHRob3VnaC4gQ29tcHJlc3MgCj4gYW5kIFBDTSBvcHMgc3RyZWFtbGluaW5n
IGlzIG5vdCB3aXRoaW4gdGhlIHNjb3BlIG9mIHByb2JlcyBhbmQgcmVxdWlyZXMgCj4gbXVjaCBt
b3JlIHdvcmsgOiApCj4gCgpBZnRlciB0aGlua2luZyBtb3JlIGFib3V0IGl0LCBJJ2QgcmF0aGVy
IHN0aWNrIHRvIHRoZSBjdXJyZW50IGFwcHJvYWNoLgoKUGF0Y2ggMyBvZiB0aGUgc2VyaWVzIChb
UEFUQ0ggMy83XSBBTFNBOiBoZGE6IEludGVycnVwdCBzZXJ2aWNpbmcgYW5kIApCREwgc2V0dXAg
Zm9yIGNvbXByZXNzIHN0cmVhbXMpOgoKKC4uLikKICAJLyogcmVzZXQgQkRMIGFkZHJlc3MgKi8K
ICAJc25kX2hkYWNfc3RyZWFtX3dyaXRlbChhenhfZGV2LCBTRF9CRExQTCwgMCk7CkBAIC00ODYs
MTUgKzQ5MywyMiBAQCBpbnQgc25kX2hkYWNfc3RyZWFtX3NldF9wYXJhbXMoc3RydWN0IGhkYWNf
c3RyZWFtIAoqYXp4X2RldiwKICAJCQkJIHVuc2lnbmVkIGludCBmb3JtYXRfdmFsKQogIHsKICAJ
c3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0gPSBhenhfZGV2LT5zdWJzdHJlYW07
CisJc3RydWN0IHNuZF9jb21wcl9zdHJlYW0gKmNzdHJlYW0gPSBhenhfZGV2LT5jc3RyZWFtOwog
IAl1bnNpZ25lZCBpbnQgYnVmc2l6ZSwgcGVyaW9kX2J5dGVzOwogIAl1bnNpZ25lZCBpbnQgbm9f
cGVyaW9kX3dha2V1cDsKICAJaW50IGVycjsKCi0JaWYgKCFzdWJzdHJlYW0pCisJaWYgKHN1YnN0
cmVhbSkgeworCQlidWZzaXplID0gc25kX3BjbV9saWJfYnVmZmVyX2J5dGVzKHN1YnN0cmVhbSk7
CisJCXBlcmlvZF9ieXRlcyA9IHNuZF9wY21fbGliX3BlcmlvZF9ieXRlcyhzdWJzdHJlYW0pOwor
CQlub19wZXJpb2Rfd2FrZXVwID0gc3Vic3RyZWFtLT5ydW50aW1lLT5ub19wZXJpb2Rfd2FrZXVw
OworCX0gZWxzZSBpZiAoY3N0cmVhbSkgeworCQlidWZzaXplID0gY3N0cmVhbS0+cnVudGltZS0+
YnVmZmVyX3NpemU7CisJCXBlcmlvZF9ieXRlcyA9IGNzdHJlYW0tPnJ1bnRpbWUtPmZyYWdtZW50
X3NpemU7CisJCW5vX3BlcmlvZF93YWtldXAgPSAwOworCX0gZWxzZSB7CiAgCQlyZXR1cm4gLUVJ
TlZBTDsKLQlidWZzaXplID0gc25kX3BjbV9saWJfYnVmZmVyX2J5dGVzKHN1YnN0cmVhbSk7Ci0J
cGVyaW9kX2J5dGVzID0gc25kX3BjbV9saWJfcGVyaW9kX2J5dGVzKHN1YnN0cmVhbSk7Ci0Jbm9f
cGVyaW9kX3dha2V1cCA9IHN1YnN0cmVhbS0+cnVudGltZS0+bm9fcGVyaW9kX3dha2V1cDsKKwl9
CgogIAlpZiAoYnVmc2l6ZSAhPSBhenhfZGV2LT5idWZzaXplIHx8CiAgCSAgICBwZXJpb2RfYnl0
ZXMgIT0gYXp4X2Rldi0+cGVyaW9kX2J5dGVzIHx8CgooLi4uKQoKdGhlIGlmLyBlbHNlIGlmLyBl
bHNlIGJsb2NrIHdvdWxkIGhhdmUgdG8gYmUgcmVvcmdhbml6ZWQgYW5kIHN0YXJ0IHdpdGggCnBv
aW50ZXIgdmFsaWRpdHkgZmlyc3QgKGFuZCByZXR1cm4gLUVJTlZBTCBpZiBldmFsdWF0ZWQgdG8g
dHJ1ZSksIGUuZy46CglpZiAoIWF6eF9kZXYtPnN1YnN0cmVhbSkgewoJCXJldHVybiAtRUlOVkFM
OwoJfSBlbHNlIGlmIChheHpfZGV2LT5pc19jb21wcikgewoJCS8vIGNvbXByIHN0dWZmCgl9IGVs
c2UgewoJCS8vIHBjbSBzdHVmZgoJfQoKTm93LCB3aXRoIHVuaW9uIHsgc3Vic3RyZWFtOyBjc3Ry
ZWFtIH07IGFwcHJvYWNoLCB0aGlzIGlzIHZhbGlkIGJ1dCBtYXkgCmJlIGNvbmZ1c2luZyBmb3Ig
YSByZWFkZXIgLSBjb2RlIGNoZWNrcyBmb3Igc3Vic3RyZWFtIHB0ciBfb25seV8gYXMgCmFkZGl0
aW9uYWwgY3N0cmVhbS1jaGVjayB3b3VsZCBiZSByZWR1bmRhbnQuCgpPbiB0aGUgb3RoZXIgaGFu
ZDoKCWlmIChzdWJzdHJlYW0pIHsKCQkvLyBwY20gc3R1ZmYKCX0gZWxzZSBpZiAoY3N0cmVhbSkg
ewoJCS8vIGNvbXByIHN0dWZmCgl9IGVsc2UgewoJCXJldHVybiAtRUlOVkFMOwoJfQoKaXMgY2xl
YXIgdG8gZXZlcnlvbmUuIEl0J3MgdHJ1ZSB0aG91Z2ggdGhhdCBvbmx5IG9uZSBwdHIgbWF5IGJl
IGFzc2lnbmVkIAooc3Vic3RyZWFtIC1vci0gY3N0cmVhbSkgc28gdW5pb24gaGFkIGl0cyBwb2lu
dCB0b28uIEknZCB2YWx1ZSAKcmVhZGFiaWxpdHkgb3ZlciB0aGF0LCB0aG91Z2guCgoKV2l0aCB0
aGF0IHNhaWQsIEkgZG9uJ3Qgc2VlIGFueSBvdGhlciBzdWdnZXN0aW9ucyBmb3Igc2FpZCBzZXJp
ZXMuIApTaG91bGQgSSByZXNlbmQgYXMgdjIgd2l0aCBubyBjaGFuZ2VzIChtaW51cyAiW1BBVENI
IDYvN10gQVNvQzogCmNvbXByZXNzOiBBZGQgcG1fcnVudGltZSBzdXBwb3J0IiBwYXRjaCBhcyBp
dCBoYXMgYWxyZWFkeSBiZWVuIGFjY2VwdGVkIApieSBNYXJrKSBvciBsZWF2ZSBhcyBpcz8KCkN6
YXJlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
