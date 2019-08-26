Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89A9CC16
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 11:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6BAD167D;
	Mon, 26 Aug 2019 11:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6BAD167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566810176;
	bh=yix4aNQKIoA1vFhFCguvsozEaE1B6F5TdN1hE1TVD9Y=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6AGmVBlwX02hJuIqc4vGQ4PzNCQH4Cfx4wz4DJaWYN1bHjwLmmj2nLrZki/6uwBh
	 79qH13ZPrf8E7gT37qpemVrdepWOB5OyMgxW2sgBzFUPLsLwC78jFPhoIPVwoGuPQq
	 cF07ohIB62A2lTMpYvHPOJLF0OcNJ/qLgN6XTE74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C724F801ED;
	Mon, 26 Aug 2019 11:01:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3145DF802BC; Mon, 26 Aug 2019 11:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C381DF8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C381DF8014A
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x7Q90vqv017977;
 Mon, 26 Aug 2019 18:00:57 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav402.sakura.ne.jp);
 Mon, 26 Aug 2019 18:00:57 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav402.sakura.ne.jp)
Received: from [192.168.1.2] (118.153.231.153.ap.dti.ne.jp [153.231.153.118])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x7Q90unj017961
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Mon, 26 Aug 2019 18:00:56 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>
References: <20190824210426.16218-1-katsuhiro@katsuster.net>
 <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
 <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
 <f3096961-6b26-1ccf-47f2-978ae3648031@katsuster.net>
Message-ID: <bf9bebb7-9c6d-3a56-d144-3466cd00d5eb@katsuster.net>
Date: Mon, 26 Aug 2019 18:00:56 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f3096961-6b26-1ccf-47f2-978ae3648031@katsuster.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 David Yang <yangxiaohua@everest-semi.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: es8316: limit headphone mixer volume
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

SGVsbG8sCgpPb3BzLi4uIEkgZ290IG1pc3Rha2UsCgogPiAgICAgIFNPQ19ET1VCTEVfVExWKCJI
ZWFkcGhvbmUgTWl4ZXIgVm9sdW1lIiwgRVM4MzE2X0hQTUlYX1ZPTCwKID4gICAgICAgICAgICAg
ICAgIDAsIDQsIDE1LCAwLCBocG1peGVyX2dhaW5fdGx2KSwKCmlzIHdyb25nLAoKID4gICAgICBT
T0NfRE9VQkxFX1RMVigiSGVhZHBob25lIE1peGVyIFZvbHVtZSIsIEVTODMxNl9IUE1JWF9WT0ws
CiA+ICAgICAgICAgICAgICAgICAwLCA0LCAxMSwgMCwgaHBtaXhlcl9nYWluX3RsdiksCgppcyBj
b3JyZWN0LgoKQmVzdCBSZWdhcmRzLApLYXRzdWhpcm8gU3V6dWtpCgoKT24gMjAxOS8wOC8yNiAx
Nzo0MSwgS2F0c3VoaXJvIFN1enVraSB3cm90ZToKPiBIZWxsbyBEYW5pZWwsCj4gCj4gT24gMjAx
OS8wOC8yNiAxMTo1MywgRGFuaWVsIERyYWtlIHdyb3RlOgo+PiBPbiBNb24sIEF1ZyAyNiwgMjAx
OSBhdCAxOjM4IEFNIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+IAo+PiB3cm90
ZToKPj4+IE9uIDI0LTA4LTE5IDIzOjA0LCBLYXRzdWhpcm8gU3V6dWtpIHdyb3RlOgo+Pj4+IFRo
aXMgcGF0Y2ggbGltaXRzIEhlYWRwaG9uZSBtaXhlciB2b2x1bWUgdG8gNCBmcm9tIDcuCj4+Pj4g
QmVjYXVzZSBvdXRwdXQgc291bmQgc3VkZGVubHkgYmVjb21lcyB2ZXJ5IGxvdWRseSB3aXRoIG1h
bnkgbm9pc2UgaWYKPj4+PiBzZXQgdm9sdW1lIG92ZXIgNC4KPj4KPj4gVGhhdCBzb3VuZHMgbGlr
ZSBzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgbGltaXRlZCBpbiBVQ00uCj4+Cj4+PiBIaWdoZXIg
dGhlbiA0IG5vdCB3b3JraW5nIG1hdGNoZXMgbXkgZXhwZXJpZW5jZSwgc2VlIHRoaXMgY29tbWVu
dCBmcm9tCj4+PiB0aGUgVUNNIGZpbGU6IGFsc2EtbGliL3NyYy9jb25mL3VjbS9jb2RlY3MvZXM4
MzE2L0VuYWJsZVNlcS5jb25mIDoKPj4+Cj4+PiAjIFNldCBIUCBtaXhlciB2b2wgdG8gLTYgZEIg
KDQvNykgbG91ZGVyIGRvZXMgbm90IHdvcmsKPj4+IGNzZXQgIm5hbWU9J0hlYWRwaG9uZSBNaXhl
ciBWb2x1bWUnIDQiCj4+Cj4+IFdoYXQgZG9lcyAiZG9lcyBub3Qgd29yayIgbWVhbiBtb3JlIHBy
ZWNpc2VseT8KPj4KPj4gSSBjaGVja2VkIHRoZSBzcGVjLCB0aGVyZSBpcyBpbmRlZWQgc29tZXRo
aW5nIHdyb25nIGluIHRoZSBrZXJuZWwgCj4+IGRyaXZlciBoZXJlLgo+PiBUaGUgZGIgc2NhbGUg
aXMgbm90IGEgc2ltcGxlIHNjYWxlIGFzIHRoZSBrZXJuZWwgc291cmNlIHN1Z2dlc3RzLgo+Pgo+
PiBJbnN0ZWFkIGl0IGlzOgo+PiAwMDAwIOKAkyAtMTJkQgo+PiAwMDAxIOKAkyAtMTAuNWRCCj4+
IDAwMTAg4oCTIC05ZEIKPj4gMDAxMSDigJMgLTcuNWRCCj4+IDAxMDAg4oCTIC02ZEIKPj4gMTAw
MCDigJMgLTQuNWRCCj4+IDEwMDEg4oCTIC0zZEIKPj4gMTAxMCDigJMgLTEuNWRCCj4+IDEwMTEg
4oCTIDBkQgo+Pgo+ICA+IFNvIHBlcmhhcHMgd2UgY2FuIGZpeCB0aGUga2VybmVsIHRvIGZvbGxv
dyB0aGlzIHRhYmxlIGFuZCB0aGVuIHVzZSBVQ00KPiAgPiB0byBsaW1pdCB0aGUgdm9sdW1lIGlm
IGl0cyB0b28gaGlnaCBvbiBhIGdpdmVuIHBsYXRmb3JtPwo+ICA+Cj4gCj4gVGhhbmsgeW91IHZl
cnkgaW1wb3J0YW50IGluZm9ybWF0aW9uLiBTbyB5b3UgbWVhbiB2YWx1ZSA1LCA2LCA3IGFyZQo+
IGlsbGVnYWwgc2V0dGluZ3MgZm9yIEVTODMxNi4gQ29ycmVjdCBjb2RlcyBhcmUKPiAKPiBzdGF0
aWMgY29uc3QgU05EUlZfQ1RMX1RMVkRfREVDTEFSRV9EQl9SQU5HRShocG1peGVyX2dhaW5fdGx2
LAo+ICDCoMKgwqDCoDAsIDQsIFRMVl9EQl9TQ0FMRV9JVEVNKC0xMjAwLCAxNTAsIDApLAo+ICDC
oMKgwqDCoDgsIDExLCBUTFZfREJfU0NBTEVfSVRFTSgtNDUwLCAxNTAsIDApLAo+ICk7Cj4gCj4g
YW5kLi4uCj4gCj4gIMKgwqDCoMKgU09DX0RPVUJMRV9UTFYoIkhlYWRwaG9uZSBNaXhlciBWb2x1
bWUiLCBFUzgzMTZfSFBNSVhfVk9MLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAs
IDQsIDE1LCAwLCBocG1peGVyX2dhaW5fdGx2KSwKPiAKPiBJcyBteSB1bmRlcnN0YW5kaW5nIGNv
cnJlY3Q/IElmIHNvIEknbGwgdGVzdCBpdCBvbiBteSBib2FyZAo+IChSb2NrUHJvNjQpIGFuZCBy
ZS1zZW5kIHBhdGNoLgo+IAo+IEJUVywgZG8geW91IGtub3cgaG93IHRvIGdldCBFUzgzMTYgSTJD
IHJlZ2lzdGVycyBzcGVjPwo+IEkgd2FudCB0byBzZWUgaXQgZm9yIHVuZGVyc3RhbmRpbmcgY3Vy
cmVudCBjb2RlLCBidXQgSSBjYW5ub3QgZmluZC4uLgo+IAo+IAo+PiBUaGFua3MKPj4gRGFuaWVs
Cj4+Cj4+Cj4gCj4gQmVzdCBSZWdhcmRzLAo+IEthdHN1aGlybyBTdXp1a2kKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
