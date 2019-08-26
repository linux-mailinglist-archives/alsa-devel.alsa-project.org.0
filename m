Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C99CBD6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 10:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5E051674;
	Mon, 26 Aug 2019 10:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5E051674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566809030;
	bh=0U5DvHRlBoRLTAyVJhSGG8MpD/VAm85O/6r/1L4mZPg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cgMAPKXABUQ4UDZB/B4g4Rj5NFkDb66BiHiQmVOhxzF1TrrJdxoWQo8bsx0qMnlxp
	 Ft0SxyWX+uRRgY/YAd7LlLET1p8ZdgS4yZQWQh1TTvhrTLIHBmkeSWipf04TDmkjRi
	 wcW/dFfRwg0MKgnPohkuUUXbT1pmGx5b2nkY0fMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 796C3F802BC;
	Mon, 26 Aug 2019 10:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DFB2F80362; Mon, 26 Aug 2019 10:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34134F80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 10:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34134F80143
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x7Q8fk0Z012652;
 Mon, 26 Aug 2019 17:41:46 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp);
 Mon, 26 Aug 2019 17:41:46 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav104.sakura.ne.jp)
Received: from [192.168.1.2] (118.153.231.153.ap.dti.ne.jp [153.231.153.118])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x7Q8fj9d012648
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Mon, 26 Aug 2019 17:41:45 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
To: Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>
References: <20190824210426.16218-1-katsuhiro@katsuster.net>
 <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
 <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <f3096961-6b26-1ccf-47f2-978ae3648031@katsuster.net>
Date: Mon, 26 Aug 2019 17:41:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
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

SGVsbG8gRGFuaWVsLAoKT24gMjAxOS8wOC8yNiAxMTo1MywgRGFuaWVsIERyYWtlIHdyb3RlOgo+
IE9uIE1vbiwgQXVnIDI2LCAyMDE5IGF0IDE6MzggQU0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4+IE9uIDI0LTA4LTE5IDIzOjA0LCBLYXRzdWhpcm8gU3V6dWtp
IHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBsaW1pdHMgSGVhZHBob25lIG1peGVyIHZvbHVtZSB0byA0
IGZyb20gNy4KPj4+IEJlY2F1c2Ugb3V0cHV0IHNvdW5kIHN1ZGRlbmx5IGJlY29tZXMgdmVyeSBs
b3VkbHkgd2l0aCBtYW55IG5vaXNlIGlmCj4+PiBzZXQgdm9sdW1lIG92ZXIgNC4KPiAKPiBUaGF0
IHNvdW5kcyBsaWtlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBsaW1pdGVkIGluIFVDTS4KPiAK
Pj4gSGlnaGVyIHRoZW4gNCBub3Qgd29ya2luZyBtYXRjaGVzIG15IGV4cGVyaWVuY2UsIHNlZSB0
aGlzIGNvbW1lbnQgZnJvbQo+PiB0aGUgVUNNIGZpbGU6IGFsc2EtbGliL3NyYy9jb25mL3VjbS9j
b2RlY3MvZXM4MzE2L0VuYWJsZVNlcS5jb25mIDoKPj4KPj4gIyBTZXQgSFAgbWl4ZXIgdm9sIHRv
IC02IGRCICg0LzcpIGxvdWRlciBkb2VzIG5vdCB3b3JrCj4+IGNzZXQgIm5hbWU9J0hlYWRwaG9u
ZSBNaXhlciBWb2x1bWUnIDQiCj4gCj4gV2hhdCBkb2VzICJkb2VzIG5vdCB3b3JrIiBtZWFuIG1v
cmUgcHJlY2lzZWx5Pwo+IAo+IEkgY2hlY2tlZCB0aGUgc3BlYywgdGhlcmUgaXMgaW5kZWVkIHNv
bWV0aGluZyB3cm9uZyBpbiB0aGUga2VybmVsIGRyaXZlciBoZXJlLgo+IFRoZSBkYiBzY2FsZSBp
cyBub3QgYSBzaW1wbGUgc2NhbGUgYXMgdGhlIGtlcm5lbCBzb3VyY2Ugc3VnZ2VzdHMuCj4gCj4g
SW5zdGVhZCBpdCBpczoKPiAwMDAwIOKAkyAtMTJkQgo+IDAwMDEg4oCTIC0xMC41ZEIKPiAwMDEw
IOKAkyAtOWRCCj4gMDAxMSDigJMgLTcuNWRCCj4gMDEwMCDigJMgLTZkQgo+IDEwMDAg4oCTIC00
LjVkQgo+IDEwMDEg4oCTIC0zZEIKPiAxMDEwIOKAkyAtMS41ZEIKPiAxMDExIOKAkyAwZEIKPiAK
ID4gU28gcGVyaGFwcyB3ZSBjYW4gZml4IHRoZSBrZXJuZWwgdG8gZm9sbG93IHRoaXMgdGFibGUg
YW5kIHRoZW4gdXNlIFVDTQogPiB0byBsaW1pdCB0aGUgdm9sdW1lIGlmIGl0cyB0b28gaGlnaCBv
biBhIGdpdmVuIHBsYXRmb3JtPwogPgoKVGhhbmsgeW91IHZlcnkgaW1wb3J0YW50IGluZm9ybWF0
aW9uLiBTbyB5b3UgbWVhbiB2YWx1ZSA1LCA2LCA3IGFyZQppbGxlZ2FsIHNldHRpbmdzIGZvciBF
UzgzMTYuIENvcnJlY3QgY29kZXMgYXJlCgpzdGF0aWMgY29uc3QgU05EUlZfQ1RMX1RMVkRfREVD
TEFSRV9EQl9SQU5HRShocG1peGVyX2dhaW5fdGx2LAoJMCwgNCwgVExWX0RCX1NDQUxFX0lURU0o
LTEyMDAsIDE1MCwgMCksCgk4LCAxMSwgVExWX0RCX1NDQUxFX0lURU0oLTQ1MCwgMTUwLCAwKSwK
KTsKCmFuZC4uLgoKCVNPQ19ET1VCTEVfVExWKCJIZWFkcGhvbmUgTWl4ZXIgVm9sdW1lIiwgRVM4
MzE2X0hQTUlYX1ZPTCwKCQkgICAgICAgMCwgNCwgMTUsIDAsIGhwbWl4ZXJfZ2Fpbl90bHYpLAoK
SXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0PyBJZiBzbyBJJ2xsIHRlc3QgaXQgb24gbXkgYm9h
cmQKKFJvY2tQcm82NCkgYW5kIHJlLXNlbmQgcGF0Y2guCgpCVFcsIGRvIHlvdSBrbm93IGhvdyB0
byBnZXQgRVM4MzE2IEkyQyByZWdpc3RlcnMgc3BlYz8KSSB3YW50IHRvIHNlZSBpdCBmb3IgdW5k
ZXJzdGFuZGluZyBjdXJyZW50IGNvZGUsIGJ1dCBJIGNhbm5vdCBmaW5kLi4uCgoKPiBUaGFua3MK
PiBEYW5pZWwKPiAKPiAKCkJlc3QgUmVnYXJkcywKS2F0c3VoaXJvIFN1enVraQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
