Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901A14CCA9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 15:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65AF167D;
	Wed, 29 Jan 2020 15:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65AF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580308901;
	bh=FObd3xnJQJxlCdQR0PwTWUf5rvNqftZjeSc27T34AMY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eqn0Z473Bqe5+EWDAhfxMEzH+tStMj0F8RCERmjdpopsi2LNR+RND13sZPDLfguO8
	 +dUggljnSmAtJ9izLTluC3aWBhknOjSKOZEkyO5UiRnbY16cMqrJ1B9cBBPC+Pzn0h
	 tg3hixmY1oLX9XT9AWkycfhfX9Uej9heAlwTdR7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C56D0F80229;
	Wed, 29 Jan 2020 15:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 504F7F8021E; Wed, 29 Jan 2020 15:39:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FDCF80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 15:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FDCF80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 06:39:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,378,1574150400"; d="scan'208";a="223849746"
Received: from rnoffsin-mobl.amr.corp.intel.com (HELO [10.252.139.181])
 ([10.252.139.181])
 by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2020 06:39:51 -0800
To: Takashi Iwai <tiwai@suse.de>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <CAFQqKeW5b5BEU1cXRzxqmmSNCQ8Qnifn3mivx4yVnrtk7Ho0Tg@mail.gmail.com>
 <s5hsgjyn1ci.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aff5f7fd-13d2-b523-b3c6-a4529c4cf26e@linux.intel.com>
Date: Wed, 29 Jan 2020 08:39:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hsgjyn1ci.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about the right fix for a sparse warning
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

CgpPbiAxLzI5LzIwIDE6NTUgQU0sIFRha2FzaGkgSXdhaSB3cm90ZToKPiBPbiBXZWQsIDI5IEph
biAyMDIwIDAyOjExOjM4ICswMTAwLAo+IFNyaWRoYXJhbiwgUmFuamFuaSB3cm90ZToKPj4KPj4g
SGkgVGFrYXNoaSwKPj4KPj4gV2UncmUgc2VlaW5nIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5p
bmcgaW4gdGhlIFNPRiBjb2RlOgo+Pgo+PiBzb3VuZC9zb2Mvc29mL3NvZi1hdWRpby5jOjg2OjMx
OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhc3NpZ25tZW50IChkaWZmZXJlbnQgYmFzZSB0
eXBlcykKPj4gc291bmQvc29jL3NvZi9zb2YtYXVkaW8uYzo4NjozMTogICAgZXhwZWN0ZWQgcmVz
dHJpY3RlZCBzbmRfcGNtX3N0YXRlX3QgW3VzZXJ0eXBlXSBzdGF0ZQo+PiBzb3VuZC9zb2Mvc29m
L3NvZi1hdWRpby5jOjg2OjMxOiAgICBnb3Qgc2lnbmVkIGludCBbc2lnbmVkXSBbdXNlcnR5cGVd
IFtleHBsaWNpdGx5LXNpZ25lZF0gc3RhdGUKPj4KPj4gVGhlIGxpbmUgdW5kZXIgc2NydXRpbnkg
d2hlcmUgd2UgYXNzaWduICJzdGF0ZSIgaXMgYXMgZm9sbG93czoKPj4KPj4gc3RhdGUgPSBzdWJz
dHJlYW0tPnJ1bnRpbWUtPnN0YXR1cy0+c3RhdGU7Cj4+Cj4+IGFuZCBpdCBpcyBkZWZpbmVkIGFz
Cj4+IHNuZF9wY21fc3RhdGVfdCBzdGF0ZTsKPj4KPj4gVGhlcmUgYXJlIG90aGVyIHBsYWNlcyAo
ZXggcGNtX29zcy5jKSB3aGVyZSBhIHNpbWlsYXIgYXNzaWdubWVudCBoYXMgYmVlbiB1c2VkCj4+
IGFzIHdlbGwuCj4+Cj4+IFdoYXQgZml4ZXMgdGhlIGlzc3VlIGlzIGEgZm9yY2VkIGNhc3QgdG8g
c25kX3BjbV9zdGF0ZV90IGFzIGJlbG93IGJlZm9yZQo+PiBhc3NpZ25pbmc6Cj4+ICDCoHN0YXRl
ID0gKF9fZm9yY2Ugc25kX3BjbV9zdGF0ZV90KXN1YnN0cmVhbS0+cnVudGltZS0+c3RhdHVzLT5z
dGF0ZTsKPj4KPj4gRG8geW91IHRoaW5rIHRoaXMgaXMgYWNjZXB0YWJsZT8gSWYgbm90LCBjb3Vs
ZCB5b3UgcGxlYXNlIHN1Z2dlc3QgYW4KPj4gYWx0ZXJuYXRpdmU/Cj4gCj4gSG0sIEkgZG9uJ3Qg
c2VlIHRoZSB3YXJuaW5nIGluIG15IGNvZGUuICBEaWQgeW91IG1lcmdlIGFsbCB1cHN0cmVhbQo+
IHN0dWZmIGFuZCBzdGlsbCBnZXQgaXQ/CgpJdCdzIGJlZW4gbWVyZ2VkIGluIHRoZSBTT0YgdHJl
ZSAodG9waWMvc29mLWRldikgYW5kIGl0J2xsIGJlIGluIHRoZSAKbmV4dCBiYXRjaCBJIHNlbmQu
IEl0J3Mgbm90IHVwc3RyZWFtIGp1c3QgeWV0IGJlY2F1c2Ugd2Ugd2FudCB0byByZW1vdmUgCnRo
ZSB3YXJuaW5nIHRvIG1ha2UgdGhlIHBhdGNoIG5pY2UgYW5kIHNoaW55IDotKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
