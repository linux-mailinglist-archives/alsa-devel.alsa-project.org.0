Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF0555AE
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 19:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01CC31607;
	Tue, 25 Jun 2019 19:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01CC31607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561483038;
	bh=gCXtyGpv4cTiRV6LfHu22qLSHSPiaCcTob06bQimyi4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBiFKC99hcITLRQU8cLUnzd4y070d2jvYjTlVuorsn2XqVbzBq1l3TzbpVczQ0eM8
	 p7pJtuSUdvVNAx3bTpzSI20mzHnfLhmBvT+sy5CbbVqJ10AMtpku6yUQr9B5FJ40Wq
	 K3crJ7wuZaZtdG5RMW8eBB+Hj30B+eajQVZKlgns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7532BF896F0;
	Tue, 25 Jun 2019 19:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45FEBF896F9; Tue, 25 Jun 2019 19:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0B00F8075C
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 19:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B00F8075C
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 10:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,416,1557212400"; d="scan'208";a="360023359"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jun 2019 10:15:20 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hfp2N-0005c2-10; Tue, 25 Jun 2019 20:15:19 +0300
Date: Tue, 25 Jun 2019 20:15:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Message-ID: <20190625171519.GE9224@smile.fi.intel.com>
References: <20190619150213.87691-1-andriy.shevchenko@linux.intel.com>
 <20190624105157.18a348ce@xxx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624105157.18a348ce@xxx>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: Intel: Skylake: Switch to modern
 UUID API
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTA6NTE6NTdBTSArMDIwMCwgQW1hZGV1c3ogU8WCYXdp
xYRza2kgd3JvdGU6Cj4gT24gV2VkLCAxOSBKdW4gMjAxOSAxODowMjoxMyArMDMwMAo+IEFuZHkg
U2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKClRo
YW5rcyBmb3IgcmV2aWV3LCB0aG91Z2ggdGhpcyBvbmUgd2lsbCBiZSBwYXJ0IG9mIHVwc3RyZWFt
LgoKPiA+IC1zdHJ1Y3QgVVVJRCB7Cj4gPiAtCXU4IGlkWzE2XTsKPiA+IC19Owo+ID4gLQoKPiA+
ICBzdHJ1Y3QgYWRzcF9tb2R1bGVfZW50cnkgewo+ID4gIAl1MzIgc3RydWN0X2lkOwo+ID4gIAl1
OCAgbmFtZVs4XTsKPiA+IC0Jc3RydWN0IFVVSUQgdXVpZDsKPiA+ICsJdTggIHV1aWRbMTZdOwo+
IAo+IGd1aWRfdCB1dWlkOwoKVGhpcyBzZWVtcyBhIHBhcnQgb2YgQUJJLgpBQkkgZG9lc24ndCBh
bmQgc2hvdWxkbid0IGtub3cgYW55dGhpbmcgYWJvdXQga2VybmVsIGludGVybmFsIHR5cGVzLgoK
SWYgSSdtIG1pc3Rha2VuLCBvbmUsIHdobyBrbm93cyBiZXR0ZXIgdGhlIGFyZWEsIGNhbiBzdWJt
aXQgYSBmb2xsb3d1cC4KCj4gPiAgc3RydWN0IHNrbF9tb2R1bGVfaW5zdF9pZCB7Cj4gPiAtCXV1
aWRfbGUgbW9kX3V1aWQ7Cj4gPiArCWd1aWRfdCBtb2RfdXVpZDsKPiA+ICAJaW50IG1vZHVsZV9p
ZDsKPiA+ICAJdTMyIGluc3RhbmNlX2lkOwo+ID4gIAlpbnQgcHZ0X2lkOwo+ID4gQEAgLTM2MCw3
ICszNjAsNyBAQCBzdHJ1Y3Qgc2tsX21vZHVsZV9yZXMgewo+ID4gIH07Cj4gPiAgCj4gPiAgc3Ry
dWN0IHNrbF9tb2R1bGUgewo+ID4gLQl1dWlkX2xlIHV1aWQ7Cj4gPiArCWd1aWRfdCB1dWlkOwo+
ID4gIAl1OCBsb2FkYWJsZTsKPiA+ICAJdTggaW5wdXRfcGluX3R5cGU7Cj4gPiAgCXU4IG91dHB1
dF9waW5fdHlwZTsKPiAKPiAKPiBJIHdvdWxkIGFsc28gYWRkOgo+IAo+IHN0cnVjdCBza2xfbW9k
dWxlX2NmZyB7Cj4gLQl1OCBndWlkWzE2XTsKPiArCWd1aWRfdCB1dWlkOwo+IAo+IHNob3VsZCBn
ZXQgcmlkIG9mIGZldyBjYXN0cyBhYm92ZS4gT3ZlcmFsbCBJIHdvdWxkIGV4cGVjdCBubyBjYXN0
cyBhdAo+IGFsbC4KClNlZSBhYm92ZS4KCk5ldmVydGhlbGVzcywgdGhlcmUgaXMgYW4gaWRlYSB0
byBhZGQgc29tZSB3cmFwcGVycyB0byBVVUlEIGZyYW1ld29yayB0byBjb3ZlcgpjYXNlcyB3aGVu
IHJhdyBidWZmZXIgaXMgY29waWVkIHRvIFVVSUQgdHlwZSBvciBiYWNrIGFuZCBhY2NvbXBhbnlp
bmcgQVBJLgoKQXQgbGVhc3QgYnRyZnMgZXhwZWN0cyBzdWNoLgoKSSB3aWxsIHRyeSB0byBrZWVw
IHRoaXMgaW4gbWluZCBhbmQgY29udmVydCBBU29DIHN0dWZmIHRvIHRoZSBuZXcgQVBJIHdoZW4g
aXQKYXBwZWFycyBpbiB0aGUgdXBzdHJlYW0uCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkg
U2hldmNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
