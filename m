Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF5140396
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 06:31:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D7F1795;
	Fri, 17 Jan 2020 06:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D7F1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579239086;
	bh=g768Ut5L805Txs7LqA1wuknAz2uuHGXoYeOQxPS1F+Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmGJmLEsfyIw6BxapSkriM94jXO4DTdQ/pfd0JB6bsXYLtp9Ly/f5y7EZ+5IkzJ8T
	 NHlUPFlJ/Qs+llnZgbBWQfGESZewcum90/2xj89OuW7ohvb+l9VhCy7m/YkSv9wV68
	 o8+4uUVHrvAq4KA4Va8TgE2/zOOYG4f9VAKe45kM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A67E1F801F7;
	Fri, 17 Jan 2020 06:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4E66F801EB; Fri, 17 Jan 2020 06:29:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=PRX_BODY_30,PRX_BODY_72,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68EBEF80086
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 06:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68EBEF80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 21:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,328,1574150400"; d="scan'208";a="257672901"
Received: from unknown (HELO [10.239.159.60]) ([10.239.159.60])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2020 21:29:21 -0800
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
 <s5h5zhbp27i.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <a1b549b7-a902-b2ee-e2e4-53f73893def3@linux.intel.com>
Date: Fri, 17 Jan 2020 13:30:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5h5zhbp27i.wl-tiwai@suse.de>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Rajwa,
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

T24gMjAyMC8xLzE3IOS4iuWNiDQ6MzcsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBUaHUsIDE2
IEphbiAyMDIwIDE4OjQwOjI2ICswMTAwLAo+IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+
Pgo+Pgo+Pj4+Pj4gU28sIGRvIHlvdSBzdWdnZXN0IG5vdCBkb2luZyBwcmVhbGxvY2F0aW9uKG9y
IGNhbGxpbmcgaXQgd2l0aCAwCj4+Pj4+PiBzaXplKSBmb3IgYWxsCj4+Pj4+PiBkcml2ZXIgd2l0
aCBUWVBFX1NHPyBJIGFtIGZpbmUgaWYgdGhpcyBpcyB0aGUgcmVjb21tZW5kZWQgbWV0aG9kLAo+
Pj4+Pj4gSSBjYW4gdHJ5Cj4+Pj4+PiB0aGlzIG9uIFNPRiBJMlMgcGxhdGZvcm0gdG8gc2VlIGlm
IGl0IGNhbiB3b3JrIGFzIHdlIHJlcXVpcmVkIGZvcgo+Pj4+Pj4gdmVyeSBsYXJnZQo+Pj4+Pj4g
YnVmZmVyIHNpemUuCj4+Pj4KPj4+PiBLZXlvbiwgZm9yIHRoZSByZXN0IG9mIHVzIHRvIGZvbGxv
dyB0aGlzIHBhdGNoLCB3b3VsZCB5b3UgbWluZAo+Pj4+IGNsYXJpZnlpbmcgd2hhdCBkcml2ZXMg
dGhlIG5lZWQgZm9yIGEgJ3ZlcnkgbGFyZ2UgYnVmZmVyIHNpemUnLCBhbmQKPj4+PiB3aGF0IG9y
ZGVyIG9mIG1hZ25pdHVkZSB0aGlzIHZlcnkgbGFyZ2Ugc2l6ZSB3b3VsZCBiZS4KPj4+Pgo+Pj4+
IEZXSVcsIHdlJ3ZlIG1lYXN1cmVkIGNvbnNpc3RlbnRseSBvbiBkaWZmZXJlbnQgV2luZG93cy9M
aW51eAo+Pj4+IHBsYXRmb3JtcywgbWF5YmUgMTAgeWVhcnMgYWdvLCB0aGF0IG9uY2UgeW91IHJl
YWNoIGEgYnVmZmVyIG9mIDFzCj4+Pj4gKDM4NCBrQikgdGhlIGJlbmVmaXRzIGZyb20gaW5jcmVh
c2luZyB0aGF0IGJ1ZmZlciBzaXplIGZ1cnRoZXIgYXJlCj4+Pj4gbWFyZ2luYWwgaW4gdGVybXMg
b2YgcG93ZXIgY29uc3VtcHRpb24sIGFuZCBnZW5lcmF0ZSBhbGwga2luZHMgb2YKPj4+PiBpc3N1
ZXMgd2l0aCB2b2x1bWUgdXBkYXRlcyBhbmQgZGVmZXJyZWQgcm91dGluZyBjaGFuZ2VzLgo+Pj4+
Cj4+PiBXZSBuZWVkIGJpZ2dlciBidWZmZXIgb24gaG9zdCBzaWRlIHRvIGNvbXBlbnNhdGUgdGhl
IHdha2UgdXAgdGltZQo+Pj4gZnJvbSBkMGl4IHRvIGQwIHdoaWNoIHRha2VzIH4yIHNlY29uZHMg
b24gbXkgc2V0dXAuIFNvLCB3aWl0aAo+Pj4gc21hbGxlciBidWZmZXIgc2l6ZXMgbGlrZSA8IDIg
c2Vjb25kcyB3ZSBvdmVyd3JpdGUgZGF0YSBzaW5jZSBGVwo+Pj4ga2VlcHMgY29wcGluZyB3aGls
ZSBob3N0IGRvZXNuJ3QgcmVhZCB1bnRpbCBpdHMgdXAgYW5kIHJ1bm5pbmcKPj4+IGFnYWluLgo+
Pgo+PiBSaWdodCwgdGhhdCdzIGEgdmFsaWQgY2FzZSwgYnV0IHRoYXQncyAyNTYga0IsIG5vdCAn
dmVyeSBsYXJnZScgb3IKPj4gbGlrZWx5IHRvIGV2ZXIgdHJpZ2dlciBhbiBPT00gY2FzZS4KPiAK
PiBUaGF0IHNpemUgc2hvdWxkbid0IG1hdHRlciwgYW5kIHdvdWxkIHdvcmsgZXZlbiB3aXRoIHRo
ZQo+IHByZWFsbG9jYXRpb24uCj4gCj4gTXkgY29uY2VybiBpcyB0aGF0IHJlbW92aW5nIHRoZSBs
aW1pdGF0aW9uIHdvdWxkIGFsbG93IHRoZSBhbGxvY2F0aW9uCj4gb2YgdG9vIGxhcmdlIHNpemVz
LiAgRXZlbiB3aXRoIGRtYV9tYXggbGltaXQsIGl0IGNhbiBnbyB1cCB0byAzMk1CCj4gcGh5c2lj
YWwgcGFnZXMgcGVyIHN0cmVhbSBmb3IgSERBLiAgRGVwZW5kaW5nIG9uIHRoZSBoYXJkd2FyZSBz
ZXR1cCwKPiB0aGVyZSBjYW4gYmUgYSBsb3Qgb2Ygc3RyZWFtcyBhc3NpZ25tZW50IChlLmcuIEhE
TUkgY29kZWNzKSBhbmQKPiBtdWx0aXBsZSBjb2RlY3MgLyBjb250cm9sbGVycywgYW5kIGltYWdp
bmUgdGhhdCBhbGwgdGhvc2UgYWxsb2NhdGVkCj4gcGFnZXMgYXJlIHBpbm5lZCBhbmQgY2FuJ3Qg
YmUgc3dhcHBlZCBvdXQuLi4KCkhpIFRha2FzaGksIEkgZ2V0IHlvdXIgY29uY2VybiBoZXJlLCBi
dXQgaWYgd2Ugc3dpdGNoIHRvIHVzZSBkbWFfbWF4IApsaW1pdCwgd2Ugd29uJ3QgY2hhbmdlIHRo
ZSBwcmVhbGxvY2F0ZWQgYnVmZmVyLCBpdCB3aWxsIGJlIHN0aWxsIDY0S0IgCmZvciBlYWNoIHN0
cmVhbSwgdXNlciBzcGFjZSBjYW4gYXNrIGZvciByZS1hbGxvY2F0ZSBidWZmZXIgZm9yIGVhY2gg
CnN0cmVhbSB1cCB0byAzMk1CLCBidXQgdGhvc2UgcGlubmVkIGFuZCBjYW4ndCBiZSBzd2FwcGVk
IG91dCBvbmVzIGFyZSAKdGhlIDY0S0IgcHJlYWxsb2NhdGVkIG9uZXMgb25seSwgYW0gSSB3cm9u
Zz8KClRoYW5rcywKfktleW9uCgo+IAo+IAo+IFRha2FzaGkKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
