Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E922C125B77
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 07:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C6A1615;
	Thu, 19 Dec 2019 07:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C6A1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576736748;
	bh=+G67ep3D3Lon/k54RPruS/6JmaGM6ILGPMSIC/b/7ek=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XomKFnqrPmh7xLocqZHKhBqvTG1defFi2p/EJaDjk/PuQ2FtoK9g0Fhq80du5bP59
	 d5XCy4Go9w/pFqd2ZjDg7a8SLAhch2FVJIl6QmrMUtY3xqmMLGebLhL7M1Q1GFblUo
	 pWNLV4gtFuMzclPSs5SJr7z0MEe2ln68NGEE/l6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D53E1F8023F;
	Thu, 19 Dec 2019 07:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16090F80234; Thu, 19 Dec 2019 07:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E07CF8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 07:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E07CF8014F
Received: from [125.35.49.90] (helo=[10.0.0.30])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1ihpE0-0004Ox-07; Thu, 19 Dec 2019 06:23:52 +0000
To: Kai Heng Feng <kai.heng.feng@canonical.com>, Takashi Iwai <tiwai@suse.de>
References: <20191218132650.6303-1-hui.wang@canonical.com>
 <s5hlfr9zc67.wl-tiwai@suse.de>
 <EB061C4E-72BE-491B-ABAE-DFB96BEB7D7C@canonical.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <e58306bc-8a2c-dcb5-c875-0dd4a2f3a51c@canonical.com>
Date: Thu, 19 Dec 2019 14:23:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <EB061C4E-72BE-491B-ABAE-DFB96BEB7D7C@canonical.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: set the interface format
 after resume on Dell WD19
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

Ck9uIDIwMTkvMTIvMTkg5LiL5Y2IMTI6NTUsIEthaSBIZW5nIEZlbmcgd3JvdGU6Cj4gSGkgSHVp
IGFuZCBUYWthc2hpLAo+Cj4+IE9uIERlYyAxOSwgMjAxOSwgYXQgMzowNiBBTSwgVGFrYXNoaSBJ
d2FpIDx0aXdhaUBzdXNlLmRlPiB3cm90ZToKPj4KPj4gT24gV2VkLCAxOCBEZWMgMjAxOSAxNDoy
Njo1MCArMDEwMCwKPj4gSHVpIFdhbmcgd3JvdGU6Cj4+PiBSZWNlbnRseSB3ZSBmb3VuZCB0aGUg
aGVhZHNldC1taWMgb24gdGhlIERlbGwgRG9jayBXRDE5IGRvZXNuJ3Qgd29yawo+Pj4gYW55bW9y
ZSBhZnRlciBzMyAoczJpIG9yIGRlZXApLCB0aGlzIHByb2JsZW0gY291bGQgYmUgd29ya2Fyb3Vu
ZGVkIGJ5Cj4+PiBjbG9zZWluZyAocGNtX2Nsb3NlKSB0aGUgYXBwIGFuZCB0aGVuIHJlb3Blbmlu
ZyAocGNtX29wZW4pIHRoZSBhcHAsIHNvCj4+PiB0aGlzIGJ1ZyBpcyBub3QgZWFzeSB0byBiZSBk
ZXRlY3RlZCBieSB1c2Vycy4KPj4+Cj4+PiBXaGVuIHByb2JsZW0gaGFwcGVucywgcmV0aXJlX2Nh
cHR1cmVfdXJiKCkgY291bGQgc3RpbGwgYmUgY2FsbGVkCj4+PiBwZXJpb2RpY2FsbHksIGJ1dCB0
aGUgc2l6ZSBvZiBjYXB0dXJlZCBkYXRhIGlzIGFsd2F5cyAwLCBpdCBjb3VsZCBiZQo+Pj4gYSBm
aXJtd2FyZSBidWcgb24gdGhlIGRvY2suIEFueXdheSBJIGZvdW5kIGFmdGVyIHJlc3VtaW5nLCB0
aGUKPj4+IHNuZF91c2JfcGNtX3ByZXBhcmUoKSB3aWxsIGJlIGNhbGxlZCwgYW5kIGlmIHdlIGZv
cmNpYmx5IHJ1bgo+Pj4gc2V0X2Zvcm1hdCgpIHRvIHNldCB0aGUgaW50ZXJmYWNlIGFuZCBpdHMg
ZW5kcG9pbnQsIHRoZSBjYXB0dXJlCj4+PiBzaXplIHdpbGwgYmUgbm9ybWFsIGFnYWluLiBUaGlz
IHByb2JsZW0gYW5kIHdvcmthb3VuZCBhbHNvIGFwcGx5IHRvCj4+PiBwbGF5YmFjay4KPj4+Cj4+
PiBUbyBmaXggaXQgaW4gdGhlIGtlcm5lbCwgYWRkIGEgcXVpcmsgdG8gbGV0IHNldF9mb3JtYXQo
KSBydW4KPj4+IGZvcmNpYmx5IG9uY2UgYWZ0ZXIgcmVzdW1lLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IEh1aSBXYW5nIDxodWkud2FuZ0BjYW5vbmljYWwuY29tPgo+PiBUaGFua3MsIHRoZSB3b3Jr
YXJvdW5kIGxvb2tzIHJlYXNvbmFibGUuCj4+IEkgYXBwbGllZCBpdCBub3cgd2l0aCBDYyB0byBz
dGFibGUuCj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSBpdOKAmXMgYSBrZXJuZWwgYnVnLiBbMV0g
WzJdIGNhbiBhbHNvIGZpeCB0aGUgaXNzdWUuCj4KPiBTaW5jZSBVU0IgYXVkaW8gZG9lc27igJl0
IGhhdmUgU05EUlZfUENNX0lORk9fUkVTVU1FIGNhcGFiaWxpdHksCj4gdXNlcnNwYWNlIHNob3Vs
ZG7igJl0IHRyeSB0byB1c2Ugc25kX3BjbV9yZXN1bWUoKS4gQ29tbWl0IFsxXSB1c2VzCj4gc25k
X3BjbV9kcm9wKCkgdG8gbWFrZSB0aGUgZGV2aWNlIGxlYXZlIHN1c3BlbmRlZCBzdGF0ZSBhbmQg
dGhlIGRldmljZQo+IGJlaGF2ZXMgY29ycmVjdGx5IHdpdGggdGhlIGZpeC4KPgo+IFsxXSBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcHVsc2VhdWRpby9wdWxzZWF1ZGlvL2NvbW1pdC9m
N2IzNTM3YmJmOWE2OTE2ZWUzZmQ3MmE4MjAyNTUxOWI0YzM0NmY1Cj4gWzJdIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vY29tbWl0LzczNGEwMGM4
NDk4MTVhNDU2OTc5NzBkNTkzMDY4YzMwMWEwNGViYmIKClRoYW5rcyBmb3Igc2hhcmluZyB0aGUg
aW5mbywgWzFdIGNvdWxkIHdvcmthcm91bmQgdGhpcyBidWcgYmVjYXVzZSBpdCAKZmluYWxseSBj
YWxsZWQgcGNtX2Nsb3NlKCkgYW5kIHBjbV9vcGVuKCksIFsyXSBkb2Vzbid0IGNoYW5nZSB0aGUg
CmV4ZWN1dGluZyBwYXRoIGluIHRoIFBBLCBpdCBpcyBhIGNvc21ldGljIGltcHJvdmVtZW50IGZv
ciBbMV0uCgpJIGd1ZXNzIGl0IGlzIGEgZmlybXdhcmUgcHJvYmxlbSwgYW5kIGNvdWxkIGJlIGZp
eGVkIGluIHRoZSBrZXJuZWwuwqAgCkJlY2F1c2UgSSB0ZXN0ZWQgbWFueSBvdGhlciB1c2IgYXVk
aW8gY2FyZHMsIHRoZXkgZG9uJ3QgbmVlZCB3b3JrYXJvdWQgCm9mIFsxXSwgdGhleSBhbGwgY291
bGQgcGxheWJhY2sgYW5kIGNhcHR1cmUgYWZ0ZXIgcmVzdW1pbmcsIHNvIHRoaXMgCnByb2JsZW0g
aXMgc3BlY2lmaWMgdG8gdGhpcyBoYXJkd2FyZS4gQW5kIGluIHRoZW9yeSBhIGRldmljZSBzaG91
bGQgd29yayAKc2FtZSBiZWZvcmUgYW5kIGFmdGVyIHN1c3BlbmQswqAgaXQgc2hvdWxkIG5vdCBk
ZXBlbmQgb24gdXNlcnNwYWNlIHRvIApjbG9zZSBpdCBhbmQgcmVvcGVuIGl0LiBBZnRlciBhZGRp
bmcgdGhpcyBmaXgsIHRoaXMgdXNiIGF1ZGlvIGNhcmQgY291bGQgCndvcmsgYWZ0ZXIgcmVzdW1p
bmcgZXZlbiBvbiBhIHN5c3RlbSB3aXRob3V0IFBBLiBBbmQgdGhpcyBrZXJuZWwgcGF0Y2ggCmRv
ZXNuJ3QgaGF2ZSBhbnkgY29uZmxpY3Qgd2l0aCBbMV0vWzJdIGluIHRoZSBQQSwgdGhleSBjb3Vs
ZCB3b3JrIHdlbGwgCnRvZ2V0aGVyLgoKVGhhbmtzLAoKSHVpLgoKCj4gS2FpLUhlbmcKPgo+Pgo+
PiBUYWthc2hpCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwo+PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
