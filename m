Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03576140858
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 11:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8965717E2;
	Fri, 17 Jan 2020 11:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8965717E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579258205;
	bh=UdpxeKCTwLktJpJ0QQJZAlNJUiJGDuqSAZZHs5nzQ7U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wg8HMTThKLOpIEwny1DbCuhtygx5bEyI8AlbsosI3w0lZF3uqarAAbsMWaz8Z5kIE
	 nTwTn+wJi1dLrVeE2tewDKA73Do/wnEwQ2Q3tXHr6+JMeiYG7tU19JLFd+YIhVLZTq
	 pVwTU+j3/i7f94RfKxb6kDwl8h20yo9CdDp19rDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84691F8021D;
	Fri, 17 Jan 2020 11:47:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8DBF80227; Fri, 17 Jan 2020 11:47:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 357D1F801F8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 11:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 357D1F801F8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 02:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,329,1574150400"; d="scan'208";a="214435454"
Received: from unknown (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 17 Jan 2020 02:47:37 -0800
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
 <s5h5zhbp27i.wl-tiwai@suse.de>
 <a1b549b7-a902-b2ee-e2e4-53f73893def3@linux.intel.com>
 <s5h1rrypla9.wl-tiwai@suse.de>
 <d6cee7a3-bbd4-0706-fcc2-96b403f6c58e@linux.intel.com>
 <s5h1rry5qad.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <476be658-59a6-e1f1-d7fc-51331966f27b@linux.intel.com>
Date: Fri, 17 Jan 2020 18:56:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5h1rry5qad.wl-tiwai@suse.de>
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

T24gMjAyMC8xLzE3IOS4i+WNiDY6MzAsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBGcmksIDE3
IEphbiAyMDIwIDExOjEzOjMxICswMTAwLAo+IEtleW9uIEppZSB3cm90ZToKPj4KPj4KPj4KPj4g
T24gMjAyMC8xLzE3IOS4i+WNiDM6NTcsIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+IE9uIEZyaSwg
MTcgSmFuIDIwMjAgMDY6MzA6MTggKzAxMDAsCj4+PiBLZXlvbiBKaWUgd3JvdGU6Cj4+Pj4KPj4+
PiBPbiAyMDIwLzEvMTcg5LiK5Y2INDozNywgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4+Cj4+Pj4g
SGkgVGFrYXNoaSwgSSBnZXQgeW91ciBjb25jZXJuIGhlcmUsIGJ1dCBpZiB3ZSBzd2l0Y2ggdG8g
dXNlIGRtYV9tYXgKPj4+PiBsaW1pdCwgd2Ugd29uJ3QgY2hhbmdlIHRoZSBwcmVhbGxvY2F0ZWQg
YnVmZmVyLCBpdCB3aWxsIGJlIHN0aWxsIDY0S0IKPj4+PiBmb3IgZWFjaCBzdHJlYW0sIHVzZXIg
c3BhY2UgY2FuIGFzayBmb3IgcmUtYWxsb2NhdGUgYnVmZmVyIGZvciBlYWNoCj4+Pj4gc3RyZWFt
IHVwIHRvIDMyTUIsIGJ1dCB0aG9zZSBwaW5uZWQgYW5kIGNhbid0IGJlIHN3YXBwZWQgb3V0IG9u
ZXMgYXJlCj4+Pj4gdGhlIDY0S0IgcHJlYWxsb2NhdGVkIG9uZXMgb25seSwgYW0gSSB3cm9uZz8K
Pj4+Cj4+PiBObywgaW4gZ2VuZXJhbCwgYWxsIHNvdW5kIGhhcmR3YXJlIGJ1ZmZlcnMgYXJlIHBp
bm5lZC4KPj4KPj4gU29ycnksIEkgbXVzdCBoYXZlIGJlZW4gd3JvbmcgaGVyZSwgd2hhdCBJIHdh
cyBmb2N1c2luZyBvbiBpcyB0aG9zZQo+PiBhbGxvY2F0ZWQgU0cgRE1BIGJ1ZmZlcnMsIEkgYW0g
bm90IHN1cmUgaWYgdGhleSBhcmUgdGhvc2UgeW91IGNhbGxlZAo+PiAiaGFyZHdhcmUgYnVmZmVy
cyIgaGVyZS4KPj4KPj4gTXkgdW5kZXJzdGFuZGluZyB3YXMgbGlrZSB0aGlzOgo+Pgo+PiAxLiBp
biBwY21fbmV3KCkgc3RhZ2UsIHRoZSBkZXZpY2UgUENNIGRyaXZlciBzaG91bGQgY2FsbAo+PiBz
bmRfcGNtX2xpYl9wcmVhbGxvY2F0ZV9wYWdlcygpLT4KPj4gCXNuZF9wY21fbGliX3ByZWFsbG9j
YXRlX3BhZ2VzKCktPgo+PiAJCXByZWFsbG9jYXRlX3BjbV9wYWdlcygpCj4+IGFuZCB0aGVuIHRo
ZSBzdWJzdHJlYW0tPmRtYV9idWZmZXIgaXMgaW5pdGlhbGl6ZWQgd2l0aCB0aGUKPj4gcHJlYWxs
b2NhdGVkIGJ1ZmZlci4KPj4KPj4gMi4gaW4gcGNtX29wZW4oKSBzdGFnZSwgdGhlIGRldmljZSBQ
Q00gZHJpdmVyIHNob3VsZCBjYWxsCj4+IHNuZF9wY21fbGliX21hbGxvY19wYWdlcygpLT4KPj4g
CXNuZF9kbWFfYWxsb2NfcGFnZXMoKSAvL2lmIHdlIG5lZWQgdG8gcmVhbGxvY2F0ZSBiaWdnZXIK
Pj4gYnVmZmVyLiAqVGhlIHN1YnN0cmVhbS0+ZG1hX2J1ZmZlciB3b24ndCBiZSBmcmVlZCwgVGFr
YXNoaSwgdGhpcyBpcwo+PiB3aGF0IEkgdGhvdWdodCB5b3UgbmFtZWQgInBpbm5lZCIgYnVmZmVy
LiogQW5kIHRob3NlIHJlYWxsb2NhdGVkCj4+IGJpZ2dlciBidWZmZXIgdmlhIHNuZF9kbWFfYWxs
b2NfcGFnZXMoKSB3aWxsIGJlIGZyZWVkIGF0IHBjbV9jbG9zZSgpCj4+IHBlciBteSB1bmRlcnN0
YW5kaW5nPwo+IAo+IFdoYXQgSSBtZWFudCBhcyAicGlubmVkIiBpcyB0aGF0IHRoZSBwYWdlcyBh
cmUgbm90IHN3YXBwZWQgb3V0IGJ5Cj4gc3dhcHBlciBwcm9jZXNzIGxpa2UgdGhlIHVzZXItc3Bh
Y2Ugb3IgYW5vbnltb3VzIHBhZ2VzLgo+IFNvIGlmIHlvdSBvcGVuIGFsbCBzdHJlYW1zIChzYXkg
MTYgc3RyZWFtcykgb24gYSBtYWNoaW5lIHdpdGggMzJNQgo+IGJ1ZmZlcnMsIGl0J2xsIGNvc3Qg
YSBoYWxmIEdCLiAgQW5kLCB3ZSBoYXZlIG5vIHJlc3RyaWN0aW9uIGFib3V0Cj4gd2hpY2ggdXNl
ciBtYXkgZG8gaXQsIHNvIGFsbCBub3JtYWwgdXNlcnMgd2hvIGhhdmUgdGhlIGFjY2VzcyB0byB0
aGUKPiBzb3VuZCBkZXZpY2UgY2FuIGNvbnN1bWUgYSBoYWxmIEdCIGtlcm5lbCBzcGFjZSBwYWdl
cyBlYXNpbHkuICBGb3IgYQo+IGJpZyBzZXJ2ZXIgaXQncyBubyBwcm9ibGVtLCBidXQgZm9yIGEg
c21hbGwgc3lzdGVtLCBpdCdzIGNvc3RpbmcuCgpVbmRlcnN0b29kLCB5b3UgYXJlIGNvbmNlcm5p
bmcgYWJvdXQgaW50ZW50aW9uYWwgYXR0YWNrIGZyb20gdXNlciBzcGFjZSAKYWJvdXQgbWVtb3J5
IGNvbnN1bWluZywgeW91IHByb3Bvc2UgdGhhdCBub3JtYWwgdXNlciBzaG91bGQgYmUgcGVybWl0
dGVkIAp0byB1c2UgdGhlIGRlZmF1bHQgNjRLQiBvbmx5LCBpZiBsYXJnZXIgYnVmZmVyIHJlcXVp
cmVkLCBwbGVhc2UgdXNlIHByb2MgCmZzIGV4cGVydCBtb2RlLCBpcyBteSB1bmRlcnN0YW5kaW5n
IGNvcnJlY3Q/CgpUaGFua3MsCn5LZXlvbgoKPiAKPiAKPiBUYWthc2hpCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
