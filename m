Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B228141CEB
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 09:04:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B96916AB;
	Sun, 19 Jan 2020 09:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B96916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579421039;
	bh=f1/p2aDyOtYvcYA3XR+dGfw2SBua4jf5oeVOwsUSr9Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDxU96fP1mAxLBQ1asC1jL/z/IWJoZwI9Vozco2K/9IyGgjfay1IceWlCrdxayLj8
	 E1ZkBfeQYaQBQF3YffRd909scTwiXoeST38OnPsq3cuh6vTU0rBeQe60jBI0sNcRY8
	 6J279v86/PEO13DrssUBcLk4cnVIthQGX5uq2uzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 477F5F801EC;
	Sun, 19 Jan 2020 09:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B135FF80143; Sun, 19 Jan 2020 09:02:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C15FF8011E
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 09:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C15FF8011E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jan 2020 00:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,337,1574150400"; d="scan'208";a="214943242"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 19 Jan 2020 00:02:05 -0800
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
 <3374dc7d-e969-5380-581a-f6801a2fe50f@linux.intel.com>
 <s5hzhemo6ku.wl-tiwai@suse.de>
 <68e008e2-6796-f893-35ed-d76a2bf92587@linux.intel.com>
 <s5ho8v249rk.wl-tiwai@suse.de>
 <7c6bb315-1ffc-665d-ff5e-e5e440f3e609@linux.intel.com>
 <s5himl7orc4.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <c7a64462-1cc1-234b-ac96-7774e6116118@linux.intel.com>
Date: Sun, 19 Jan 2020 16:11:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5himl7orc4.wl-tiwai@suse.de>
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

T24gMjAyMC8xLzE5IOS4i+WNiDM6MDksIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBTdW4sIDE5
IEphbiAyMDIwIDA0OjUyOjU1ICswMTAwLAo+IEtleW9uIEppZSB3cm90ZToKPj4KPj4KPj4gT24g
MjAyMC8xLzE3IOS4i+WNiDc6MTIsIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+IE9uIEZyaSwgMTcg
SmFuIDIwMjAgMTE6NDM6MjQgKzAxMDAsCj4+PiBLZXlvbiBKaWUgd3JvdGU6Cj4+Pj4KPj4+PiBJ
biBTT0YgZHJpdmVyLCB3ZSBkb24ndCB1c2Uga2VybmVsIGNvbmZpZyBpdGVtIGxpa2UKPj4+PiBD
T05GSUdfU05EX0hEQV9QUkVBTExPQ19TSVpFIGZvciBIREEsIHRoZSBjb2RlIGZvciBpdCBpczoK
Pj4+Pgo+Pj4+IAlzbmRfcGNtX2xpYl9wcmVhbGxvY2F0ZV9wYWdlcyhwY20tPnN0cmVhbXNbc3Ry
ZWFtXS5zdWJzdHJlYW0sCj4+Pj4gCQkJCSAgICAgIFNORFJWX0RNQV9UWVBFX0RFVl9TRywgc2Rl
di0+ZGV2LAo+Pj4+IAkJCQlsZTMyX3RvX2NwdShjYXBzLT5idWZmZXJfc2l6ZV9taW4pLAo+Pj4+
IAkJCQlsZTMyX3RvX2NwdShjYXBzLT5idWZmZXJfc2l6ZV9tYXgpKTsKPj4+Pgo+Pj4+IFNvIHRo
ZSBwcmVhbGxvY2F0ZWQgc2l6ZSBpcyBjb25maWd1cmVkIHZpYSB0b3BvbG9neSBmaWxlLCB0aGF0
IGlzCj4+Pj4gY2Fwcy0+YnVmZmVyX3NpemVfbWluLCBubyBjaGFuY2UgZm9yIFB1bHNlQXVkaW8g
dG8gcmVjb25maWd1cmUgaXQuCj4+Pj4KPj4+PiBTbywgaXQgbG9va3MgbGlrZSB3ZSBoYXZlIHRv
IGNoYW5nZSBpdCB0byB0aGlzIGlmIHdlIGRvbid0IGNoYW5nZSB0aGUKPj4+PiBBTFNBIGNvcmU6
Cj4+Pj4KPj4+PiAJc25kX3BjbV9saWJfcHJlYWxsb2NhdGVfcGFnZXMocGNtLT5zdHJlYW1zW3N0
cmVhbV0uc3Vic3RyZWFtLAo+Pj4+IAkJCQkgICAgICBTTkRSVl9ETUFfVFlQRV9ERVZfU0csIHNk
ZXYtPmRldiwKPj4+PiAtCQkJCWxlMzJfdG9fY3B1KGNhcHMtPmJ1ZmZlcl9zaXplX21pbiksCj4+
Pj4gKwkJCQlsZTMyX3RvX2NwdShjYXBzLT5idWZmZXJfc2l6ZV9tYXgpLAo+Pj4+IAkJCQlsZTMy
X3RvX2NwdShjYXBzLT5idWZmZXJfc2l6ZV9tYXgpKTsKPj4+Cj4+PiBZZXMsIHBhc3NpbmcgYnVm
ZmVyX3NpemVfbWluIGZvciB0aGUgcHJlYWxsb2NhdGlvbiBzb3VuZHMgYWxyZWFkeQo+Pj4gYmFk
LiAgVGhlIGRlZmF1bHQgdmFsdWUgc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIHVzdWFsIG9wZXJh
dGlvbnMsIG5vdAo+Pj4gdGhlIGNvc3QtY3V0dGluZyBtaW5pbXVtLiAgT3RoZXJ3aXNlIHRoZXJl
IGlzIG5vIG1lcml0IG9mCj4+PiBwcmVhbGxvY2F0aW9uLgo+Pj4KPj4+IEFsdGVybmF0aXZlbHks
IHdlIG1heSBwYXNzIDAgdGhlcmUsIGluZGljYXRpbmcgbm8gbGltaXRhdGlvbiwgdG9vLgo+Pj4g
QnV0LCB0aGlzIHdvdWxkIG5lZWQgYSBiaXQgb3RoZXIgYWRqdXN0bWVudCwgZS5nLiBzbmRfcGNt
X2hhcmR3YXJlCj4+PiBzaG91bGQgaGF2ZSBsb3dlciBidWZmZXJfYnl0ZXNfbWF4Lgo+Pgo+PiBU
aGFuayB5b3UgVGFrYXNoaSwgdGhlbiBsZXQncyBmb2xsb3cgaXQgdG8gcHJlLWFsbG9jYXRlIHdp
dGgKPj4gY2Fwcy0+YnVmZmVyX3NpemVfbWF4LCBhcyB3ZSBkb24ndCBzcGVjaWZ5IGFueSBsaW1p
dGF0aW9ucyBpbgo+PiBzbmRfcGNtX2hhcmR3YXJlIHRvZGF5LCB3ZSB3YW50IHRvIGxlYXZlIGl0
IGNvbmZpZ3VyYWJsZSB0byBlYWNoCj4+IHNwZWNpZmljIHRvcG9sb2d5IGZpbGUgZm9yIGRpZmZl
cmVudCBtYWNoaW5lcy4KPiAKPiBIb3cgYmlnIGlzIGNhcHMtPmJ1ZmZlcl9zaXplX21heD8gIFBh
c3NpbmcgdGhlIHZhbHVlIHRoZXJlIG1lYW5zCj4gYWN0dWFsbHkgdHJ5aW5nIHRvIGFsbG9jYXRl
IHRoZSBnaXZlbiBzaXplIGFzIGRlZmF1bHQsIGFuZCBpdCdkIGJlIGEKPiBsb3Qgb2Ygd2FzdGUg
aWYgYSB0b28gbGFyZ2UgdmFsdWUgKGUuZy4gMzJNQikgaXMgcGFzc2VkIHRoZXJlLgoKSXQgdmFy
aWVzIGZvciBlYWNoIHN0cmVhbSwgbW9zdCBvZiB0aGVtIGFyZSA2NTUzNiBCeXRlcyBvbmx5LCB3
aGVyZWFzIApvbmUgZm9yIFdha2UtT24tVm9pY2UgbWlnaHQgbmVlZCBhID4gNCBTZWNvbmRzIGJ1
ZmZlciBjb3VsZCBiZSB1cCB0byAKYWJvdXQgMX4yTUJ5dGVzLCBhbmQgYW5vdGhlciBvbmUgZm9y
IGRlZXAtYnVmZmVyIHBsYXliYWNrIGNhbiBiZSB1cCB0byAKYWJvdXQgOE1CeXRlcy4KCj4gCj4g
SSB0aGluayB3ZSBjYW4gZ28gZm9yIHBhc3NpbmcgemVybyBhcyBkZWZhdWx0LCB3aGljaCBtZWFu
cyBza2lwcGluZwo+IHByZWFsbG9jYXRpb24uICBJbiBhZGRpdGlvbiwgd2UgbWF5IGFkZCBhbiB1
cHBlciBsaW1pdCBvZiB0aGUgdG90YWwKCkp1c3QgZGlkIGFuIGV4cGVyaW1lbnQgYW5kIHRoaXMg
d29ya3MgZm9yIG1lLCBJIGJlbGlldmUgd2Ugc3RpbGwgbmVlZCB0byAKY2FsbCBzbmRfcGNtX3Nl
dF9tYW5hZ2VkX2J1ZmZlcigpIHRob3VnaCB0aGUgcHJlYWxsb2NhdGlvbiBpcyBza2lwcGVkIGlu
IAp0aGlzLCByaWdodD8KCj4gYW1vdW50IG9mIGFsbG9jYXRpb24gcGVyIGNhcmQsIGNvbnRyb2xs
ZWQgaW4gcGNtX21lbW9yeS5jLCBmb3IKPiBleGFtcGxlLiAgVGhpcyBsb2dpYyBjYW4gYmUgYXBw
bGllZCB0byB0aGUgbGVnYWN5IEhEQSwgdG9vLgo+IAo+IFRoaXMgc2hvdWxkIGJlIHJlbGF0aXZl
bHkgZWFzeSwgYW5kIEknbGwgcHJvdmlkZSB0aGUgcGF0Y2ggaW4gdGhlIG5leHQKPiB3ZWVrLgoK
T0ssIHRoYXQncyBmaW5lIGZvciBtZSBhbHNvLCB0aGFuayB5b3UuCgp+S2V5b24KCj4gCj4gCj4g
VGFrYXNoaQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
