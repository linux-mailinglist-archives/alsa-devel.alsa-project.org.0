Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0DC0F7E
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Sep 2019 05:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CEFF1665;
	Sat, 28 Sep 2019 05:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CEFF1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569641812;
	bh=pjIfoiGomp5CUgHXuI3ZazeixBtdWK+n7N/a6Xiltuw=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZIi5Z6rBrb1rG39PmSPvzLYRiRIB76+z7iuh9hywC+KDWolZZ0J+wnGHXpg73Cfh
	 to0P5vtBfBvjMjpuWqO+YQxE1gO8xzpZFTh3Xojzdfw9n3E/ghujsnwLVDqR2Ur4M6
	 Rr8977LR6XugYVQ4rAc9KlLNGIEG8QMfOsp25/ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0348F8048D;
	Sat, 28 Sep 2019 05:35:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C696BF803F4; Sat, 28 Sep 2019 05:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DDFFF800E2
 for <alsa-devel@alsa-project.org>; Sat, 28 Sep 2019 05:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DDFFF800E2
Received: from [114.254.47.161] (helo=[192.168.1.108])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1iE3UR-0004yx-0b; Sat, 28 Sep 2019 03:33:47 +0000
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
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <c39251a2-66fc-74da-a8c3-7990259fc70f@canonical.com>
Date: Sat, 28 Sep 2019 11:33:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cc8e8881-a210-610d-d4fb-fdf8daef942c@perex.cz>
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

Ck9uIDIwMTkvOS8yNyDkuIvljYg1OjAxLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4gRG5lIDI3
LiAwOS4gMTkgdiAxMDoyMSBIdWkgV2FuZyBuYXBzYWwoYSk6Cj4+IFNvIGZhciwgdGhlIGFsc2Et
bGliIHN0aWxsIGRlcGVuZHMgb24gdGhlIGNhcmQtPm5hbWUvbG9uZy1uYW1lIHRvIGZpbmQKPj4g
dGhlIG5lZWRlZCBVQ00sIEkga25vdyBzb21lIERlbGwgbWFjaGluZXMgYWxzbyB1c2VzIHNvZiBk
cml2ZXIgKHNvIHRoZQo+PiBjYXJkLT5uYW1lL2xvbmctbmFtZSBpcyBhbHNvIHNvZi1za2xfaGRh
X2NhcmQpLCBzbyBpZiB0aGlzIFVDTSBpcwo+PiBtZXJnZWQsIGl0IHdpbGwgYmUgc2hhcmVkIHdp
dGggRGVsbCBtYWNoaW5lcy4gQnV0IG9uIHRob3NlIERlbGwKPj4gbWFjaGluZXMsIHRoZXJlIGlz
IG5vIEJBU1MgU3BlYWtlciwgYW5kIERlbGwgbWFjaGluZXMgaGF2ZSBzdGggdGhhdAo+PiBMZW5v
dm8gbWFjaGluZXMgZG9uJ3QgaGF2ZSwgbGlrZSBoZWFkc2V0LW1pYyBhbmQgaGVhZHBob25lLW1p
Yy4gSG93IHRvCj4+IG1ha2UgdGhpcyBVQ00gd29yayBvbiBib3RoIExlbm92byBhbmQgRGVsbCBt
YWNoaW5lcz8KPiBUaGFua3MgZm9yIHRoaXMgaW5mby4gVGhlIGxvbmctbmFtZSBjb250YWlucyBE
TUkgaW5mbywgc28gSSB1cGRhdGVkIHRoZQo+IGNvbmZpZ3VyYXRpb24gaW4gdGhpcyB3YXk6Cj4K
PiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtdWNtLWNvbmYvY29tbWl0L2Fj
ODMxOTI0NWUxMjEzZTQ2YTFhZTVjMmRlNGRkZDRhMGM4OTI2ZTIKPgo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9jb21taXQvOWJkMGJmMzRhNTcxYTRhM2Mz
OGQ3NDA5ODk3MmQ4MmM1OGZhYzgwZQo+Cj4gKGV2ZXJ5dGhpbmcgaXMgaW4gdGhlIHVwZGF0ZWQg
J2ltcG9ydCcgYnJhbmNoKQo+Cj4gU28geW91IGNhbiBhZGQgdGhlIHNwZWNpZmljIGNvbmZpZyBm
b3IgdGhlIERlbGwgZGV2aWNlLCB0b28uCgpPSywgdGhhdCBpcyBnb29kLCB0aGFua3MuCgpSZWdh
cmRzLAoKSHVpLgoKPgo+IAkJCQkJSmFyb3NsYXYKPgo+Cj4+IFJlZ2FyZHMsCj4+Cj4+IEh1aS4K
Pj4KPj4KPj4gT24gMjAxOS85LzI0IOS4i+WNiDg6MDYsIE1hcmsgUGVhcnNvbiB3cm90ZToKPj4+
Pj4gSSB0aGluayB0aGUgZmlyc3Qgb3JkZXIgd291bGQgYmUgdG8gaGF2ZSB0aGUgZmlsZSBjbGVh
bmVkLXVwLCB3aXRoIGl0cwo+Pj4+PiBJbnRlbCBvcmlnaW4gY2xlYXJseSBzdGF0ZWQgd2l0aCBh
IHNpZ25lZC1vZmYtYnkgdGFnLgo+Pj4+Pgo+Pj4+PiBUaGVuIG9uY2UgdGhpcyBpcyBkb25lLCB0
aGUgRGViaWFuIHBhY2thZ2UgY3JlYXRpb24gbmVlZHMgdG8gYmUKPj4+Pj4gaGFuZGxlZCAodXNp
bmcgZWl0aGVyIHRoZSBBTFNBIHJlcG8gb3IgdGhlIGNsb25lZCB2ZXJzaW9uIG9uIFNPRgo+Pj4+
PiBHaXRIdWIpLiBJIGRvbid0IGhhdmUgYW55IGV4cGVyaWVuY2Ugd2l0aCBEZWJpYW4gcGFja2Fn
ZXMgc28gY2FuJ3QKPj4+Pj4gcmVhbGx5IGNvbW1lbnQgb24gdGhlIGVmZm9ydCBpdCB3b3VsZCB0
YWtlLgo+Pj4+IEkgZGlkIHNvbWUgY2xlYW51cHMgaGVyZToKPj4+Pgo+Pj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tCj4+Pj4gY29uZi9jb21taXQvZjc5NmYwODUy
YTA5N2UyMzhmYTlmNWVmYjE3NGU5NWI1ZWU2YzhiNwo+Pj4+Cj4+Pj4gUGllcnJlLCBjb3VsZCB5
b3UgY29uZmlybSB0aGUgb3JpZ2luYWwgc291cmNlIGFuZCBhcmUgeW91IG9rIHdpdGggdGhhdD8K
Pj4+Pgo+Pj4gSSBnb3QgY29uZmlybWF0aW9uIGZyb20gSW50ZWwgdGhhdCB0aGV5IGFyZSB0aGUg
b3JpZ2luYWwgc291cmNlIC0gdGhleSBwcm92aWRlZCBtZSB3aXRoIHRoZSBmaWxlcyAoYXMgYW4g
YXNpZGUgaW4gY2FzZSBpdCBpcyBpbXBvcnRhbnQsIG9yaWdpbmFsbHkgdGhleSB3ZXJlIHdvcmtp
bmcgd2l0aCBDYW5vbmljYWwgb24gZ2V0dGluZyBVYnVudHUgd29ya2luZyBvbiBvbmUgb2Ygb3Vy
IChMZW5vdm8pIHBsYXRmb3JtcykuIEkgd2FzIGZvbGxvd2luZyB1cCB3aXRoIENhbm9uaWNhbCB0
byBqdXN0IGNoZWNrIHdoYXQgdGhleSBoYWQgZG9uZSBidXQgaGF2ZW4ndCBoZWFyZCBiYWNrIHll
dC4KPj4+Cj4+PiBTaW5jZSBJbnRlbCBoYXMgcHJvdmlkZWQgdGhlIGZpbGVzIHRvIG1lIGRpcmVj
dGx5IC0gY2FuIEkgYWN0IGFzIGFuIG9yaWdpbmFsIHNvdXJjZSBjb25maXJtYXRpb24/Cj4+Pgo+
Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cj4+PiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwKPj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
