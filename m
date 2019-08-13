Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B071E8BCDE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 17:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE371667;
	Tue, 13 Aug 2019 17:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE371667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565709454;
	bh=v7yKKb1DrZTQMVFk8yNisfXVKuhyisg8IdT4yO4/kpA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwYQQyuv/ZtP+hSajM13s1JJ6CIU7GS/8mGWAIFCSfeiLlV0yznWV9fLGfpB3aaH2
	 tLveq4r030KEDvkX69Y3pc/WsWTvN8yJJUq9wFaUUTS+IzEfdC4GGDkSsCITCC56Zz
	 afAzfmij20WpsRgRyBrDBAm/n20q0wZ1Hv8X9SH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7426DF80274;
	Tue, 13 Aug 2019 17:15:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F0F8F80273; Tue, 13 Aug 2019 17:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF65CF8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 17:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF65CF8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 08:15:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="177827821"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.1.240])
 ([10.252.1.240])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2019 08:15:37 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20190621113116.47525-1-andriy.shevchenko@linux.intel.com>
 <20190813144253.GG30120@smile.fi.intel.com>
 <39ce9fc6-c3e8-e7ed-af1c-6f612b831180@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <74187b3a-aea4-f11b-8e12-d9d66b9ac85d@intel.com>
Date: Tue, 13 Aug 2019 17:15:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <39ce9fc6-c3e8-e7ed-af1c-6f612b831180@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: Intel: Skylake: Print constant
 literals from format specifier
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

T24gMjAxOS0wOC0xMyAxNjo1MiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gT24gOC8x
My8xOSA5OjQyIEFNLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+IE9uIEZyaSwgSnVuIDIxLCAy
MDE5IGF0IDAyOjMxOjE2UE0gKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4+IEluc3Rl
YWQgb2YgdXNpbmcgdHdvIGFkZGl0aW9uYWwgIiVzIiBzcGVjaWZpZXJzLCBwdXQgdGhlIGNvbnN0
YW50IHN0cmluZwo+Pj4gbGl0ZXJhbHMgZGlyZWN0bHkgdG8gdGhlIGZvcm1hdCBzcGVjaWZpZXIu
Cj4+Pgo+Pgo+PiBQaWVycmUsIGRvZXMgaXQgbG9vayBnb29kIHRvIHlvdT8KPiAKPiBMR1RNIGJ1
dCBDZXphcnkgc2hvdWxkIGNoaW1lIGluIGZvciBjaGFuZ2VzIHRvIHRoZSBTa3lsYWtlIGRyaXZl
ci4KClNlZW1zIHRoaXMgb25lIGVzY2FwZWQgbXkgZXllLiBMb29rcyBnb29kIHRvIG1lIHRvby4K
Cj4+PiBDYzogTGlhbSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT4KPj4+IENjOiBNYXJr
IEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4+PiBDYzogVmlub2QgS291bCA8dmtvdWxAa2Vy
bmVsLm9yZz4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZj
aGVua29AbGludXguaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBzb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtc3N0LmMgfCAzICstLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwv
c2t5bGFrZS9za2wtc3N0LmMgCj4+PiBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1zc3Qu
Ywo+Pj4gaW5kZXggMTNjNjM2ZGVjZTU2Li5mM2UxMzk5NDUwZGIgMTAwNjQ0Cj4+PiAtLS0gYS9z
b3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LmMKPj4+ICsrKyBiL3NvdW5kL3NvYy9pbnRl
bC9za3lsYWtlL3NrbC1zc3QuYwo+Pj4gQEAgLTQyMSw4ICs0MjEsNyBAQCBzdGF0aWMgaW50IHNr
bF9sb2FkX21vZHVsZShzdHJ1Y3Qgc3N0X2RzcCAqY3R4LCAKPj4+IHUxNiBtb2RfaWQsIHU4ICpn
dWlkKQo+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0ID0gMDsKPj4+IMKgwqDCoMKgwqAgY2hhciBtb2Rf
bmFtZVs2NF07IC8qIGd1aWQgc3RyID0gMzIgY2hhcnMgKyA0IGh5cGhlbnMgKi8KPj4+IC3CoMKg
wqAgc25wcmludGYobW9kX25hbWUsIHNpemVvZihtb2RfbmFtZSksICIlcyVwVUwlcyIsCj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJpbnRlbC9k
c3BfZndfIiwgZ3VpZCwgIi5iaW4iKTsKPj4+ICvCoMKgwqAgc25wcmludGYobW9kX25hbWUsIHNp
emVvZihtb2RfbmFtZSksICJpbnRlbC9kc3BfZndfJXBVTC5iaW4iLCAKPj4+IGd1aWQpOwo+Pj4g
wqDCoMKgwqDCoCBtb2R1bGVfZW50cnkgPSBza2xfbW9kdWxlX2dldF9mcm9tX2lkKGN0eCwgbW9k
X2lkKTsKPj4+IMKgwqDCoMKgwqAgaWYgKG1vZHVsZV9lbnRyeSA9PSBOVUxMKSB7Cj4+PiAtLSAK
Pj4+IDIuMjAuMQo+Pj4KPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
