Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A43997D1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 17:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91DA1666;
	Thu, 22 Aug 2019 17:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91DA1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566486781;
	bh=SIgcPgrAVtTOGnG7DdV6flDK329jT6k97AUT6jn0aS0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvJYUnw2fWpBvOV1HzW3IDpLE35J1hk/y6EcVSAsopVLTsB1/cCA5e4n916H6lJ3c
	 k6VnugU5U6lYiFwsHjgHX4kLOR6w9EuWALT5wcWZopYgH9aQRB9jmom/WN26Q8G1hQ
	 aoaWBCUhbgVbtt3JeDpgCZxGJbqCpojHs0U+BvxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E9EF803D5;
	Thu, 22 Aug 2019 17:11:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B846F8036E; Thu, 22 Aug 2019 17:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4D54F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 17:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4D54F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="180411564"
Received: from rdonovan-mobl1.ger.corp.intel.com (HELO [10.252.2.209])
 ([10.252.2.209])
 by fmsmga007.fm.intel.com with ESMTP; 22 Aug 2019 08:11:04 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
 <dbde72dc-9b41-f1a8-001a-5674f5af3b61@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <32051c24-45f7-d4f0-9912-9c93fcf08733@intel.com>
Date: Thu, 22 Aug 2019 17:11:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dbde72dc-9b41-f1a8-001a-5674f5af3b61@linux.intel.com>
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

T24gMjAxOS0wOC0yMiAxNjowNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gT24gOC8y
Mi8xOSA2OjM2IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+IEFwYXJ0IGZyb20gSGFzd2Vs
bCBtYWNoaW5lcywgYWxsIG90aGVyIGRldmljZXMgaGF2ZSB0aGVpciBwcml2YXRlIGRhdGEKPj4g
c2V0IHRvIHNuZF9zb2NfYWNwaV9tYWNoIGluc3RhbmNlLgo+Pgo+PiBDaGFuZ2VzIGZvciBIU1cv
IEJEVyBib2FyZHMgaW50cm9kdWNlZCB3aXRoIHNlcmllczoKPj4gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9jb3Zlci8xMDc4MjAzNS8KPj4KPj4gYWRkZWQgc3VwcG9ydCBmb3IgZGFpX2xp
bmsgcGxhdGZvcm1fbmFtZSBhZGp1c3RtZW50cyB3aXRoaW4gY2FyZCBwcm9iZQo+PiByb3V0aW5l
cy4gVGhlc2UgdGFrZSBmb3IgZ3JhbnRlZCBwcml2YXRlX2RhdGEgcG9pbnRzIHRvCj4+IHNuZF9z
b2NfYWNwaV9tYWNoIHdoZXJlYXMgZm9yIEhhc3dlbGwsIGl0J3Mgc3N0X3BkYXRhIGluc3RlYWQu
IENoYW5nZQo+PiBwcml2YXRlIGNvbnRleHQgb2YgcGxhdGZvcm1fZGV2aWNlIC0gcmVwcmVzZW50
aW5nIG1hY2hpbmUgYm9hcmQgLSB0bwo+PiBhZGRyZXNzIHRoaXMuCj4gCj4gQ2V6YXJ5LCBzZWUg
dGhlIGNvbW1lbnRzIG9mIHRoZSBpbml0aWFsIHNlcmllczoKPiAKPiAiTm90ZSB0aGF0IGJ5dC1t
YXg5ODA4MCwgYnl0LXJ0NTY0MCB3ZXJlIG5vdCBtb2RpZmllZCBzaW5jZSB0aGV5IGFyZQo+IGRl
cHJlY2F0ZWQuIGJ5dGNodC1ub2NvZGVjIGFuZCB0aGUgU2t5bGFrZS9LYWJ5bGFrZSBtYWNoaW5l
IGRyaXZlcnMKPiBjaGFuZ2VzIHdlcmUgbm90IGNoYW5nZWQgc2luY2UgU09GIGRvZXMgbm90IHN1
cHBvcnQgdGhlbS4gVGhlcmUgbWF5IGJlCj4gYWRkaXRpb25hbCBjaGFuZ2VzIGlmIGFuZCB3aGVu
IFNreWxha2UvS2FieWxha2UgYXJlIHN1cHBvcnRlZCBieSBTT0YKPiAobGFyZ2VseSBhIGZpcm13
YXJlIGF1dGhlbnRpY2F0aW9uIGlzc3VlLCBub3QgdGVjaG5pY2FsIGRpZmZpY3VsdHkpLiIKPiAK
PiBJIGludGVudGlvbmFsbHkgZGlkIG5vdCB0b3VjaCB0aGUgSGFzd2VsbCBhbmQgQmF5dHJhaWwg
bGVnYWN5IHNpbmNlIGJvdGggCj4gZHJpdmVycyBkbyBub3QgdXBkYXRlIHRoZSBwbGF0Zm9ybSBu
YW1lLCB0aGlzIGlzIG9ubHkgZG9uZSBmb3IgY2FzZXMgCj4gd2hlcmUgU09GIGlzIHVzZWQuCj4g
Cj4gU28gd2hpbGUgSSBkb24ndCBtaW5kIGEgY2hhbmdlLCBpdCdzIGdvdCB0byBjb21lIHdpdGgg
dGVzdHMgZm9yIGVhY2ggCj4gdmFyaWFudCwgYW5kIGlmIHlvdSBkbyB0aGUgY2hhbmdlcyBmb3Ig
SGFzd2VsbCB0aGVuIHlvdSB3YW50IHRvIGNoYW5nZSAKPiBCYXl0cmFpbCBsZWdhY3kgbWFjaGlu
ZSBkcml2ZXJzIGFzIHdlbGwuIEFuZCBhcmUgd2UgZ29pbmcgdG8gY2hhbmdlIHRoZSAKPiBTS0wv
S0JMIG1hY2hpbmUgZHJpdmVycyB0byBhbGxvdyBmb3IgdGhpcyBwbGF0Zm9ybSBuYW1lIHJld3Jp
dGU/Cj4gCj4gQWxzbyB0aGUgaW5mb3JtYXRpb24gYmVsb3cgaXMgbWlzbGVhZGluZzogbm90aGlu
ZyBpcyBicm9rZW4gaW4gdGhlIAo+IGN1cnJlbnQgc29sdXRpb24gYW5kIC1zdGFibGUga2VybmVs
cyBkbyBub3QgbmVlZCB0byBwaWNrIHRoaXMgcGF0Y2hzZXQuIAo+IFRoaXMgaXMgYSBjb2RlIGFs
aWdubWVudCBhbmQgdGhlIGJlaGF2aW9yIGlzIGlkZW50aWNhbC4KPiAKPiBPciBhcyBhbiBhbHRl
cm5hdGl2ZSB3ZSBsZWF2ZSB0aGUgY29kZSBhcyBpcy4uLgo+IAoKR3Vlc3MgSSB3YXNuJ3QgY2xl
YXIgZW5vdWdoOgotIHRoaXMgY29kZSBmaXhlcyBwYW5pYyBnZW5lcmF0ZWQgYnkgc2VyaWVzIGZv
dW5kIHVuZGVyIGxpbmsgYWJvdmUuCgpGb2xsb3dpbmcgY29kZSBhZGRlZCB3aXRoaW4gbWFjaGlu
ZSBwcm9iZSBmb3IgYnJvYWR3ZWxsLmM6CgkvKiBvdmVycmlkZSBwbGFmb3JtIG5hbWUsIGlmIHJl
cXVpcmVkICovCgltYWNoID0gKCZwZGV2LT5kZXYpLT5wbGF0Zm9ybV9kYXRhOwoJcGRhdGEgPSAo
JnBkZXYtPmRldiktPnBsYXRmb3JtX2RhdGE7CglpZiAobWFjaCkgLyogZXh0cmEgY2hlY2sgc2lu
Y2UgbGVnYWN5IGRvZXMgbm90IHBhc3MgcGFyYW1ldGVycyAqLyB7CgkJcGxhdGZvcm1fbmFtZSA9
IG1hY2gtPm1hY2hfcGFyYW1zLnBsYXRmb3JtOwoJCWRldl93YXJuKCZwZGV2LT5kZXYsICJCcm9h
ZHdlbGwgcGxhdGZvcm1fbmFtZTogJXMsICVzLCAlcywgJXNcbiIsIAptYWNoLT5pZCwgbWFjaC0+
ZHJ2X25hbWUsIG1hY2gtPmZ3X2ZpbGVuYW1lLCBwbGF0Zm9ybV9uYW1lKTsKCQlkZXZfd2Fybigm
cGRldi0+ZGV2LCAiQnJvYWR3ZWxsIGlkIGFuZCByZXNfaWR4OiAleCwgJWRcbiIsIHBkYXRhLT5p
ZCwgCnBkYXRhLT5yZXNpbmRleF9kbWFfYmFzZSk7Cgl9CgoKR2VuZXJhdGVzOgoKWyAgIDI1Ljk4
MjE1MV0gYnJvYWR3ZWxsLWF1ZGlvIGJyb2Fkd2VsbC1hdWRpbzogQnJvYWR3ZWxsIHBsYXRmb3Jt
X25hbWU6IAosIChudWxsKSwgKGVmYXVsdCksIChudWxsKQpbICAgMjUuOTgyMTU3XSBicm9hZHdl
bGwtYXVkaW8gYnJvYWR3ZWxsLWF1ZGlvOiBCcm9hZHdlbGwgaWQgYW5kIApyZXNfaWR4OiAzNDM4
LCAxMDQwMzg0CgoKQ29uc2x1c2lvbjoKMHgzNDM4ID09IEJEV19JRAoxMDQwMzg0IC0+IDB4MEZF
MDAwIC0+IFdQVF9EU1BfRE1BX0FERFJfT0ZGU0VUCmNvbmZpcm1zIHRoZSBjbGFpbS4KCkFzIHN0
YXRlZCwgZHVyaW5nIGNsZWFudXBzIGFuZCBtb3Zpbmcgc3R1ZmYgYXJvdW5kLCBjb2RlIHlvdSd2
ZSBhZGRlZCAKZ2VuZXJhdGVzIHBhbmljcy4gUmlnaHQgbm93IGl0IHdvcmtzIG9ubHkgYmVjYXVz
ZSBvZiBvZmZzZXRzIG9mIAptaXNjYXN0ZWQgb2JqZWN0IHBvaW50aW5nIHRvIHVuaW5pdGlhbGl6
ZWQgdmFyaWFibGUgKGx1Y2tpbHkpLgpwbGF0Zm9ybV9uYW1lIGlzIGluaXRpYWxpemVkIGFzIE5V
TEwgZm9yIGFsbCBTS0wrIGFuZCBsZWdhY3kgcGxhdGZvcm1zIAphbmQgdGh1cyB0aGUgc25kX3Nv
Y19maXh1cF9kYWlfbGlua3NfcGxhdGZvcm1fbmFtZSByZXR1cm5zIGltbWVkaWF0ZWx5LiAKU28g
YnkgYWxsIG1lYW5zLCBjaGFuZ2UgaXMgbm90IG9ubHkgc2F2ZSwgYnV0IHJlcXVpcmVkLgoKQ29k
ZSBpcyBiZWluZyB0ZXN0ZWQgb24gMnggQkRXLVkgd2hpY2ggbGl2ZSBub3cgYSBoYXBweSBsaXZl
IGluIG91ciBsYWIgCndpdGggdGhlIHJlc3Qgb2YgdGhlIHBsYXRmb3Jtcy4KCkN6YXJlawoKCj4+
IEZpeGVzOiBlODcwNTVkNzMyZTMgKCJBU29DOiBJbnRlbDogaGFzd2VsbDogcGxhdGZvcm0gbmFt
ZSBmaXh1cCBzdXBwb3J0IikKPj4gRml4ZXM6IDdlNDBkZGNmOTc0YSAoIkFTb0M6IEludGVsOiBi
ZHctcnQ1Njc3OiBwbGF0Zm9ybSBuYW1lIGZpeHVwIAo+PiBzdXBwb3J0IikKPj4gRml4ZXM6IDJk
MDY3YjI4MDdmOSAoIkFTb0M6IEludGVsOiBicm9hZHdlbGw6IHBsYXRmb3JtIG5hbWUgZml4dXAg
Cj4+IHN1cHBvcnQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5y
b2pld3NraUBpbnRlbC5jb20+Cj4+IC0tLQo+PiDCoCBzb3VuZC9zb2MvaW50ZWwvY29tbW9uL3Nz
dC1hY3BpLmMgfCAzICsrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3Nz
dC1hY3BpLmMgCj4+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtYWNwaS5jCj4+IGluZGV4
IDE1ZjJiMjdlNjQzZi4uYzM0ZjYyOGM3OTg3IDEwMDY0NAo+PiAtLS0gYS9zb3VuZC9zb2MvaW50
ZWwvY29tbW9uL3NzdC1hY3BpLmMKPj4gKysrIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3Qt
YWNwaS5jCj4+IEBAIC0xMDksMTEgKzEwOSwxMiBAQCBpbnQgc3N0X2FjcGlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgcGxh
dGZvcm1fc2V0X2RydmRhdGEocGRldiwgc3N0X2FjcGkpOwo+PiArwqDCoMKgIG1hY2gtPnBkYXRh
ID0gc3N0X3BkYXRhOwo+PiDCoMKgwqDCoMKgIC8qIHJlZ2lzdGVyIG1hY2hpbmUgZHJpdmVyICov
Cj4+IMKgwqDCoMKgwqAgc3N0X2FjcGktPnBkZXZfbWFjaCA9Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0YShkZXYsIG1hY2gtPmRydl9uYW1lLCAtMSwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNz
dF9wZGF0YSwgc2l6ZW9mKCpzc3RfcGRhdGEpKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hY2gsIHNpemVvZigqbWFjaCkpOwo+PiDCoMKg
wqDCoMKgIGlmIChJU19FUlIoc3N0X2FjcGktPnBkZXZfbWFjaCkpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gUFRSX0VSUihzc3RfYWNwaS0+cGRldl9tYWNoKTsKPj4KPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
