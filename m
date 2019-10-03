Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2C4C969D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2019 04:09:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D06166E;
	Thu,  3 Oct 2019 04:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D06166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570068564;
	bh=YVgPfGYnRIMjjkvEaYrH/PkZlpN7Fr/FYlwT82UzeO0=;
	h=From:To:References:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CsM5EWuIUoATtz4B7T3T0CqwmvUbDOxbgxLuPFZkJOXkYCY4AveXT5iIYmA2RT8rb
	 yNDcrx30vdm+ygW8/yC/zySwrbNwACSDDDlHPvWlzbV68XfZ4QvagHnSkW6uWjq34D
	 6Oga2reFoTEfB6ezUtTCkjHp06z6C9twdm4Hok58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EC1F80519;
	Thu,  3 Oct 2019 04:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E142EF80506; Thu,  3 Oct 2019 04:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33391F8013F
 for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2019 04:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33391F8013F
Received: from [114.252.215.226] (helo=[192.168.1.108])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iFqWi-0001yi-Dn; Thu, 03 Oct 2019 02:07:32 +0000
From: Hui Wang <hui.wang@canonical.com>
To: Jaroslav Kysela <perex@perex.cz>, Mark Pearson <mpearson@lenovo.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
 <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
 <153ba191eb3c4849b6e65db5fc8e8760@lenovo.com>
 <4cb6bec8-1dac-9114-c230-c9196763e58d@canonical.com>
 <cc8e8881-a210-610d-d4fb-fdf8daef942c@perex.cz>
 <c39251a2-66fc-74da-a8c3-7990259fc70f@canonical.com>
Message-ID: <2baf109d-07a8-ac5e-1750-aa409d5d0a55@canonical.com>
Date: Thu, 3 Oct 2019 10:07:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c39251a2-66fc-74da-a8c3-7990259fc70f@canonical.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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

Ck9uIDIwMTkvOS8yOCDkuIrljYgxMTozMywgSHVpIFdhbmcgd3JvdGU6Cj4KPiBPbiAyMDE5Lzkv
Mjcg5LiL5Y2INTowMSwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+PiBEbmUgMjcuIDA5LiAxOSB2
IDEwOjIxIEh1aSBXYW5nIG5hcHNhbChhKToKPj4+IFNvIGZhciwgdGhlIGFsc2EtbGliIHN0aWxs
IGRlcGVuZHMgb24gdGhlIGNhcmQtPm5hbWUvbG9uZy1uYW1lIHRvIGZpbmQKPj4+IHRoZSBuZWVk
ZWQgVUNNLCBJIGtub3cgc29tZSBEZWxsIG1hY2hpbmVzIGFsc28gdXNlcyBzb2YgZHJpdmVyIChz
byB0aGUKPj4+IGNhcmQtPm5hbWUvbG9uZy1uYW1lIGlzIGFsc28gc29mLXNrbF9oZGFfY2FyZCks
IHNvIGlmIHRoaXMgVUNNIGlzCj4+PiBtZXJnZWQsIGl0IHdpbGwgYmUgc2hhcmVkIHdpdGggRGVs
bCBtYWNoaW5lcy4gQnV0IG9uIHRob3NlIERlbGwKPj4+IG1hY2hpbmVzLCB0aGVyZSBpcyBubyBC
QVNTIFNwZWFrZXIsIGFuZCBEZWxsIG1hY2hpbmVzIGhhdmUgc3RoIHRoYXQKPj4+IExlbm92byBt
YWNoaW5lcyBkb24ndCBoYXZlLCBsaWtlIGhlYWRzZXQtbWljIGFuZCBoZWFkcGhvbmUtbWljLiBI
b3cgdG8KPj4+IG1ha2UgdGhpcyBVQ00gd29yayBvbiBib3RoIExlbm92byBhbmQgRGVsbCBtYWNo
aW5lcz8KPj4gVGhhbmtzIGZvciB0aGlzIGluZm8uIFRoZSBsb25nLW5hbWUgY29udGFpbnMgRE1J
IGluZm8sIHNvIEkgdXBkYXRlZCB0aGUKPj4gY29uZmlndXJhdGlvbiBpbiB0aGlzIHdheToKPj4K
SGVsbG8gSmFyb3NsYXYsCgpGb3IgdGhlIGxvbmctPm5hbWUgd2l0aCBETUkgaW5mbywgaXMgaXQg
YSBuZXcgZmVhdHVyZSBvciBhbiBvbGQgZmVhdHVyZSAKdGhhdCBleGlzdGluZyBmb3IgYSBsb25n
IHRpbWU/IElmIGl0IGlzIGEgbmV3IGZlYXR1cmUsIGlzIGl0IGltcGxlbWVudGVkIApieSBrZXJu
ZWwgZHJpdmVyIG9yIGJ5IGFsc2EtbGliLCBhbHJlYWR5IHVwc3RyZWFtZWQ/CgpUaGFua3MsCgpI
dWkuCgoKPj4gaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL2Nv
bW1pdC9hYzgzMTkyNDVlMTIxM2U0NmExYWU1YzJkZTRkZGQ0YTBjODkyNmUyIAo+Pgo+Pgo+PiBo
dHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvY29tbWl0LzliZDBi
ZjM0YTU3MWE0YTNjMzhkNzQwOTg5NzJkODJjNThmYWM4MGUgCj4+Cj4+Cj4+IChldmVyeXRoaW5n
IGlzIGluIHRoZSB1cGRhdGVkICdpbXBvcnQnIGJyYW5jaCkKPj4KPj4gU28geW91IGNhbiBhZGQg
dGhlIHNwZWNpZmljIGNvbmZpZyBmb3IgdGhlIERlbGwgZGV2aWNlLCB0b28uCj4KPiBPSywgdGhh
dCBpcyBnb29kLCB0aGFua3MuCj4KPiBSZWdhcmRzLAo+Cj4gSHVpLgo+Cj4+Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEphcm9zbGF2Cj4+Cj4+Cj4+PiBSZWdhcmRz
LAo+Pj4KPj4+IEh1aS4KPj4+Cj4+Pgo+Pj4gT24gMjAxOS85LzI0IOS4i+WNiDg6MDYsIE1hcmsg
UGVhcnNvbiB3cm90ZToKPj4+Pj4+IEkgdGhpbmsgdGhlIGZpcnN0IG9yZGVyIHdvdWxkIGJlIHRv
IGhhdmUgdGhlIGZpbGUgY2xlYW5lZC11cCwgCj4+Pj4+PiB3aXRoIGl0cwo+Pj4+Pj4gSW50ZWwg
b3JpZ2luIGNsZWFybHkgc3RhdGVkIHdpdGggYSBzaWduZWQtb2ZmLWJ5IHRhZy4KPj4+Pj4+Cj4+
Pj4+PiBUaGVuIG9uY2UgdGhpcyBpcyBkb25lLCB0aGUgRGViaWFuIHBhY2thZ2UgY3JlYXRpb24g
bmVlZHMgdG8gYmUKPj4+Pj4+IGhhbmRsZWQgKHVzaW5nIGVpdGhlciB0aGUgQUxTQSByZXBvIG9y
IHRoZSBjbG9uZWQgdmVyc2lvbiBvbiBTT0YKPj4+Pj4+IEdpdEh1YikuIEkgZG9uJ3QgaGF2ZSBh
bnkgZXhwZXJpZW5jZSB3aXRoIERlYmlhbiBwYWNrYWdlcyBzbyBjYW4ndAo+Pj4+Pj4gcmVhbGx5
IGNvbW1lbnQgb24gdGhlIGVmZm9ydCBpdCB3b3VsZCB0YWtlLgo+Pj4+PiBJIGRpZCBzb21lIGNs
ZWFudXBzIGhlcmU6Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3Qv
YWxzYS11Y20tCj4+Pj4+IGNvbmYvY29tbWl0L2Y3OTZmMDg1MmEwOTdlMjM4ZmE5ZjVlZmIxNzRl
OTViNWVlNmM4YjcKPj4+Pj4KPj4+Pj4gUGllcnJlLCBjb3VsZCB5b3UgY29uZmlybSB0aGUgb3Jp
Z2luYWwgc291cmNlIGFuZCBhcmUgeW91IG9rIHdpdGggCj4+Pj4+IHRoYXQ/Cj4+Pj4+Cj4+Pj4g
SSBnb3QgY29uZmlybWF0aW9uIGZyb20gSW50ZWwgdGhhdCB0aGV5IGFyZSB0aGUgb3JpZ2luYWwg
c291cmNlIC0gCj4+Pj4gdGhleSBwcm92aWRlZCBtZSB3aXRoIHRoZSBmaWxlcyAoYXMgYW4gYXNp
ZGUgaW4gY2FzZSBpdCBpcyAKPj4+PiBpbXBvcnRhbnQsIG9yaWdpbmFsbHkgdGhleSB3ZXJlIHdv
cmtpbmcgd2l0aCBDYW5vbmljYWwgb24gZ2V0dGluZyAKPj4+PiBVYnVudHUgd29ya2luZyBvbiBv
bmUgb2Ygb3VyIChMZW5vdm8pIHBsYXRmb3JtcykuIEkgd2FzIGZvbGxvd2luZyAKPj4+PiB1cCB3
aXRoIENhbm9uaWNhbCB0byBqdXN0IGNoZWNrIHdoYXQgdGhleSBoYWQgZG9uZSBidXQgaGF2ZW4n
dCAKPj4+PiBoZWFyZCBiYWNrIHlldC4KPj4+Pgo+Pj4+IFNpbmNlIEludGVsIGhhcyBwcm92aWRl
ZCB0aGUgZmlsZXMgdG8gbWUgZGlyZWN0bHkgLSBjYW4gSSBhY3QgYXMgYW4gCj4+Pj4gb3JpZ2lu
YWwgc291cmNlIGNvbmZpcm1hdGlvbj8KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBBbHNhLWRldmVsIG1haWxpbmcgbGlz
dAo+Pj4+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+Pj4+IGh0dHBzOi8vbWFpbG1hbi5h
bHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+Pj4+Cj4+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
