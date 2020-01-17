Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3B1403A1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 06:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5C717BD;
	Fri, 17 Jan 2020 06:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5C717BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579239493;
	bh=y6neHtFn8QWeR3S5EsJ00yXe+LhAvUkgjXSx8EZL+W0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BB2g1ST2mNZ/Vri0RczNJuS9CE052OBu1YpF3o9npL3M+Br+CtUuRLMKK/I4OatYg
	 YIZGjDa6TwFGKiAfSOyYfD4gGbUXKVGk546bKrbqyG0cIgoKcoPCERiZs6FwTEZBHt
	 lUKw8nTUfm3ezAoY7BPsdtPmefys+k+ykwE9Bp38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 037F5F801F8;
	Fri, 17 Jan 2020 06:36:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C88F8F801EB; Fri, 17 Jan 2020 06:36:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC062F800E9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 06:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC062F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 21:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,328,1574150400"; d="scan'208";a="257674742"
Received: from unknown (HELO [10.239.159.60]) ([10.239.159.60])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2020 21:36:19 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>,
 "Jie, Yang" <yang.jie@intel.com>, Takashi Iwai <tiwai@suse.de>
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
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <3374dc7d-e969-5380-581a-f6801a2fe50f@linux.intel.com>
Date: Fri, 17 Jan 2020 13:37:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b6b55180-b846-96e7-4521-7d3b03881d06@linux.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

T24gMjAyMC8xLzE3IOS4iuWNiDE6NDAsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+IAo+
Pj4+PiBTbywgZG8geW91IHN1Z2dlc3Qgbm90IGRvaW5nIHByZWFsbG9jYXRpb24ob3IgY2FsbGlu
ZyBpdCB3aXRoIDAgCj4+Pj4+IHNpemUpIGZvciBhbGwKPj4+Pj4gZHJpdmVyIHdpdGggVFlQRV9T
Rz8gSSBhbSBmaW5lIGlmIHRoaXMgaXMgdGhlIHJlY29tbWVuZGVkIG1ldGhvZCwgSSAKPj4+Pj4g
Y2FuIHRyeQo+Pj4+PiB0aGlzIG9uIFNPRiBJMlMgcGxhdGZvcm0gdG8gc2VlIGlmIGl0IGNhbiB3
b3JrIGFzIHdlIHJlcXVpcmVkIGZvciAKPj4+Pj4gdmVyeSBsYXJnZQo+Pj4+PiBidWZmZXIgc2l6
ZS4KPj4+Cj4+PiBLZXlvbiwgZm9yIHRoZSByZXN0IG9mIHVzIHRvIGZvbGxvdyB0aGlzIHBhdGNo
LCB3b3VsZCB5b3UgbWluZCAKPj4+IGNsYXJpZnlpbmcgd2hhdCBkcml2ZXMgdGhlIG5lZWQgZm9y
IGEgJ3ZlcnkgbGFyZ2UgYnVmZmVyIHNpemUnLCBhbmQgCj4+PiB3aGF0IG9yZGVyIG9mIG1hZ25p
dHVkZSB0aGlzIHZlcnkgbGFyZ2Ugc2l6ZSB3b3VsZCBiZS4KPj4+Cj4+PiBGV0lXLCB3ZSd2ZSBt
ZWFzdXJlZCBjb25zaXN0ZW50bHkgb24gZGlmZmVyZW50IFdpbmRvd3MvTGludXggCj4+PiBwbGF0
Zm9ybXMsIG1heWJlIDEwIHllYXJzIGFnbywgdGhhdCBvbmNlIHlvdSByZWFjaCBhIGJ1ZmZlciBv
ZiAxcyAKPj4+ICgzODQga0IpIHRoZSBiZW5lZml0cyBmcm9tIGluY3JlYXNpbmcgdGhhdCBidWZm
ZXIgc2l6ZSBmdXJ0aGVyIGFyZSAKPj4+IG1hcmdpbmFsIGluIHRlcm1zIG9mIHBvd2VyIGNvbnN1
bXB0aW9uLCBhbmQgZ2VuZXJhdGUgYWxsIGtpbmRzIG9mIAo+Pj4gaXNzdWVzIHdpdGggdm9sdW1l
IHVwZGF0ZXMgYW5kIGRlZmVycmVkIHJvdXRpbmcgY2hhbmdlcy4KPj4+Cj4+IFdlIG5lZWQgYmln
Z2VyIGJ1ZmZlciBvbiBob3N0IHNpZGUgdG8gY29tcGVuc2F0ZSB0aGUgd2FrZSB1cCB0aW1lIGZy
b20gCj4+IGQwaXggdG8gZDAgd2hpY2ggdGFrZXMgfjIgc2Vjb25kcyBvbiBteSBzZXR1cC4gU28s
IHdpaXRoIHNtYWxsZXIgCj4+IGJ1ZmZlciBzaXplcyBsaWtlIDwgMiBzZWNvbmRzIHdlIG92ZXJ3
cml0ZSBkYXRhIHNpbmNlIEZXIGtlZXBzIGNvcHBpbmcgCj4+IHdoaWxlIGhvc3QgZG9lc24ndCBy
ZWFkIHVudGlsIGl0cyB1cCBhbmQgcnVubmluZyBhZ2Fpbi4KPiAKPiBSaWdodCwgdGhhdCdzIGEg
dmFsaWQgY2FzZSwgYnV0IHRoYXQncyAyNTYga0IsIG5vdCAndmVyeSBsYXJnZScgb3IgCj4gbGlr
ZWx5IHRvIGV2ZXIgdHJpZ2dlciBhbiBPT00gY2FzZS4KCkZvciBTMjRfTEUsIGl0IGlzIDUxMktC
LCB0aGUgcG9pbnQgaXMgdGhhdCBpZiB3ZSBjYW4ndCByZS1hbGxvY2F0ZSAKYnVmZmVyIGF0IGh3
X3BhcmFtcygpIHN0YWdlLCB0aGVuIHdlIG5lZWQgZm9sbG93IGEgQktNIHRoYXQgd2UgaGF2ZSB0
byAKcHJlYWxsb2NhdGUgdGhlIGxhcmdlc3QgRE1BIGJ1ZmZlciB0aGF0IHdlIGNsYWltIHRvIHN1
cHBvcnQgYXQgCnBjbV9uZXcoKSwgSSB0aGluayB0aGlzIGlzIGFjdHVhbGx5IGFub3RoZXIga2lu
ZCBvZiB3YXN0IHdpdGggdGhlc2UgCmxhcmdlc3QgcGlubmVkIGJ1ZmZlciB0aGF0IGNhbid0IGJl
IHN3YXBwZWQgb3V0Li4uCgpUaGFua3MsCn5LZXlvbgoKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
