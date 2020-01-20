Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE7514218F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 03:16:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AADF11677;
	Mon, 20 Jan 2020 03:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AADF11677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579486594;
	bh=Fk6Qf7FwCfFBaioet1gt1U4eKxgM7SC6lBUTIv6xsMg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQDSiro9SPajuARhLijsaJ6RKhQQ+/X0FAX8KyCn+iOlSxixgpAWOrJv9VI1xJKFr
	 oFtOjpbGkI7pfbk35xtxyQSmyHOIzLhN0oFGkLuqk3x5145LYBi7EClzRMgxOKsbG4
	 PgkeKHZBWfZZydKOh/xDNvxqYmucasRz3IMGuFV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F17F8F8022D;
	Mon, 20 Jan 2020 03:14:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 016CEF8020C; Mon, 20 Jan 2020 03:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B22BF800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 03:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B22BF800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2020 18:14:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,340,1574150400"; d="scan'208";a="215103580"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2020 18:14:33 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
 <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
 <s5hh80v7h82.wl-tiwai@suse.de>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EE27@SHSMSX105.ccr.corp.intel.com>
 <c70934a1-b838-5029-6573-bf76a34c4cb9@linux.intel.com>
 <93ac843a-bad5-550e-f427-e2a94bd3e8ef@linux.intel.com>
 <b6b55180-b846-96e7-4521-7d3b03881d06@linux.intel.com>
 <3374dc7d-e969-5380-581a-f6801a2fe50f@linux.intel.com>
 <s5hzhemo6ku.wl-tiwai@suse.de>
 <68e008e2-6796-f893-35ed-d76a2bf92587@linux.intel.com>
 <s5ho8v249rk.wl-tiwai@suse.de>
 <7c6bb315-1ffc-665d-ff5e-e5e440f3e609@linux.intel.com>
 <s5himl7orc4.wl-tiwai@suse.de>
 <c7a64462-1cc1-234b-ac96-7774e6116118@linux.intel.com>
 <s5hftgbom0p.wl-tiwai@suse.de>
 <ab37a499-305f-2ce8-9b29-1483ea473a57@linux.intel.com>
 <s5h7e1nohfl.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <ed005c51-ba2c-2162-c293-c1badf1d6b2b@linux.intel.com>
Date: Mon, 20 Jan 2020 10:23:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5h7e1nohfl.wl-tiwai@suse.de>
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

T24gMjAyMC8xLzE5IOS4i+WNiDY6NDMsIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBTdW4sIDE5
IEphbiAyMDIwIDExOjE0OjU2ICswMTAwLAo+IEtleW9uIEppZSB3cm90ZToKPj4KPj4gT24gMjAy
MC8xLzE5IOS4i+WNiDU6MDQsIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+IE9uIFN1biwgMTkgSmFu
IDIwMjAgMDk6MTE6MTcgKzAxMDAsCj4+PiBLZXlvbiBKaWUgd3JvdGU6Cj4+Pj4gT24gMjAyMC8x
LzE5IOS4i+WNiDM6MDksIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+PiBJdCB2YXJpZXMgZm9yIGVh
Y2ggc3RyZWFtLCBtb3N0IG9mIHRoZW0gYXJlIDY1NTM2IEJ5dGVzIG9ubHksIHdoZXJlYXMKPj4+
PiBvbmUgZm9yIFdha2UtT24tVm9pY2UgbWlnaHQgbmVlZCBhID4gNCBTZWNvbmRzIGJ1ZmZlciBj
b3VsZCBiZSB1cCB0bwo+Pj4+IGFib3V0IDF+Mk1CeXRlcywgYW5kIGFub3RoZXIgb25lIGZvciBk
ZWVwLWJ1ZmZlciBwbGF5YmFjayBjYW4gYmUgdXAgdG8KPj4+PiBhYm91dCA4TUJ5dGVzLgo+Pj4g
SG0sIHNvIHRoaXMgdmFyaWVzIHNvIG11Y2ggZGVwZW5kaW5nIG9uIHRoZSB1c2UgY2FzZT8KPj4+
IEkgdGhvdWdodCBpdCBjb21lcyBmcm9tIHRoZSB0b3BvbG9neSBmaWxlIGFuZCBpdCdzIGVzc2Vu
dGlhbGx5Cj4+PiBjb25zaXN0ZW50IG92ZXIgdmFyaW91cyBwdXJwb3Nlcy4KPj4KPj4gWWVzLCB3
ZSBhZGQgZGlmZmVyZW50IGJ1ZmZlcl9ieXRlc19tYXggbGltaXRhdGlvbiB0byBlYWNoIHN0cmVh
bQo+PiBkZXBlbmRpbmcgb24gaXRzIHVzZSBjYXNlLCBiYXNpY2FsbHkgd2Ugc2V0IGl0IHRvIHRo
ZSBtYXhpbXVtIHZhbHVlIHdlCj4+IGNsYWltIHRvIHN1cHBvcnQgb25seSwgd2UgZG9uJ3Qgd2Fu
dCB0byB3YXN0ZSBhbnkgb2YgdGhlIHN5c3RlbQo+PiBtZW1vcnkuCj4+Cj4+Pgo+Pj4+PiBJIHRo
aW5rIHdlIGNhbiBnbyBmb3IgcGFzc2luZyB6ZXJvIGFzIGRlZmF1bHQsIHdoaWNoIG1lYW5zIHNr
aXBwaW5nCj4+Pj4+IHByZWFsbG9jYXRpb24uICBJbiBhZGRpdGlvbiwgd2UgbWF5IGFkZCBhbiB1
cHBlciBsaW1pdCBvZiB0aGUgdG90YWwKPj4+PiBKdXN0IGRpZCBhbiBleHBlcmltZW50IGFuZCB0
aGlzIHdvcmtzIGZvciBtZSwgSSBiZWxpZXZlIHdlIHN0aWxsIG5lZWQKPj4+PiB0byBjYWxsIHNu
ZF9wY21fc2V0X21hbmFnZWRfYnVmZmVyKCkgdGhvdWdoIHRoZSBwcmVhbGxvY2F0aW9uIGlzCj4+
Pj4gc2tpcHBlZCBpbiB0aGlzLCByaWdodD8KPj4+IE5vLCBzbmRfcGNtX3NldF9tYW5hZ2VkX2J1
ZmZlcigpIGlzIHRoZSBuZXcgUENNIHByZWFsbG9jYXRpb24gQVBJLgo+Pj4gVGhlIG9sZCBzbmRf
cGNtX2xpYl9wcmVhbGxvY2F0ZSooKSBpcyBhbG1vc3QgZ29uZS4KPj4KPj4gV2hhdCBJIGFza2Vk
IGlzIGFjdHVhbGx5IHRoYXQgc2luY2UgdGhlIHByZWFsbG9jYXRpb24gd2lsbCBiZQo+PiBza2lw
cGVkKHdpdGggcGFzc2luZyBzaXplPTApLCBjYW4gd2UganVzdCBub3QgY2FsbGluZwo+PiBzbmRf
cGNtX3NldF9tYW5hZ2VkX2J1ZmZlcigpIG9yIHNuZF9wY21fbGliX3ByZWFsbG9jYXRlKigpIGlu
IG91ciBTT0YKPj4gUENNIGRyaXZlcj8gSSBiZWxpZXZlIG5vKHdlIHN0aWxsIG5lZWQgdGhlIGlu
dm9raW5nIHRvIGRvCj4+IGluaXRpYWxpemF0aW9uIGV4Y2VwdCBidWZmZXIgYWxsb2NhdGluZyk/
Cj4gCj4gWW91IHN0aWxsIG5lZWQgdG8gY2FsbCBpdC4gIE90aGVyd2lzZSB0aGUgUENNIGNvcmUg
ZG9lc24ndCBrbm93IHdoYXQKPiBraW5kIG9mIGJ1ZmZlciB0eXBlIGhhcyB0byBiZSBhbGxvY2F0
ZWQuCj4gCj4gQmFzaWNhbGx5IHNuZF9wY21fc2V0X21hbmFnZWRfYnVmZmVyKCkgb3Igc25kX3Bj
bV9saWJfcHJlYWxsb2NhdGUqKCkKPiBkb2VzIHR3byB0aGluZ3M6IHNldCB0aGUgYnVmZmVyIHR5
cGUgYW5kIGl0cyBwcmVhbGxvY2F0aW9uIChkZWZhdWx0Cj4gYW5kIG1heCBzaXplKS4gIFRoZSBs
YXR0ZXIgZGVmYXVsdCBzaXplIGNhbiBiZSAwLCBtZWFuaW5nIHRoYXQgbm8KPiBkZWZhdWx0IHBy
ZWFsbG9jYXRpb24gaXMgcGVyZm9ybWVkLiAgQWxzbyB0aGUgbWF4IGNhbiBiZSAwLCBpLmUuIG5v
Cj4gcHJlYWxsb2NhdGlvbiBpcyBuZWVkZWQgYXQgYWxsIGZvciB0aGUgYnVmZmVycyAoZS5nLiB2
bWFsbG9jCj4gYnVmZmVycykuICBNZWFud2hpbGUgdGhlIGJ1ZmZlciB0eXBlIGFuZCBpdHMgZGV2
aWNlIHBvaW50ZXIgYXJlCj4gbWFuZGF0b3J5IGFuZCBjYW4ndCBiZSBza2lwcGVkLgoKR290IGl0
LCB0aGFua3MgZm9yIGd1aWRpbmcgb24gaXQgVGFrYXNoaS4KClRoYW5rcywKfktleW9uCgo+IAo+
Pj4KPj4+Pj4gYW1vdW50IG9mIGFsbG9jYXRpb24gcGVyIGNhcmQsIGNvbnRyb2xsZWQgaW4gcGNt
X21lbW9yeS5jLCBmb3IKPj4+Pj4gZXhhbXBsZS4gIFRoaXMgbG9naWMgY2FuIGJlIGFwcGxpZWQg
dG8gdGhlIGxlZ2FjeSBIREEsIHRvby4KPj4+Pj4KPj4+Pj4gVGhpcyBzaG91bGQgYmUgcmVsYXRp
dmVseSBlYXN5LCBhbmQgSSdsbCBwcm92aWRlIHRoZSBwYXRjaCBpbiB0aGUgbmV4dAo+Pj4+PiB3
ZWVrLgo+Pj4+IE9LLCB0aGF0J3MgZmluZSBmb3IgbWUgYWxzbywgdGhhbmsgeW91Lgo+Pj4gQmVs
b3cgaXMgYSBxdWljayBoYWNrIGZvciBIREEuICBXZSBzdGlsbCBuZWVkIHRoZSBjZXJ0YWluIGFt
b3VudCBvZgo+Pj4gcHJlYWxsb2NhdGlvbiBmb3Igbm9uLXg4NiBzeXN0ZW1zIHRoYXQgZG9uJ3Qg
c3VwcG9ydCBTRy1idWZmZXJzLCBzbwo+Pj4gYSBiaXQgb2YgdHJpY2sgaXMgYXBwbGllZCB0byBL
Y29uZmlnLgo+Pj4KPj4+IFRvdGFsbHkgdW50ZXN0ZWQsIGFzIHVzdWFsLgo+Pgo+PiBEaWQgYSBx
dWljayB0ZXN0KHBsdXMgcGFzc2luZyAwIHNpemUgZm9yIHByZWFsbG9jYXRlIGluIFNPRiBQQ00K
Pj4gZHJpdmVyKSBhbmQgaXQgd29ya3MgZm9yIG15IHVzZSBjYXNlKG5vIHJlZ3Jlc3Npb24gY29t
cGFyaW5nIHRoYXQKPj4gd2l0aG91dCBhcHBseWluZyB0aGlzIHBhdGNoKSwgVGhhbmsgeW91Lgo+
IAo+IE9LLCB3aWxsIHRpZHkgdXAgYW5kIHN1Ym1pdCBsYXRlci4KPiAKPiAKPiBUYWthc2hpCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
