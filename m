Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE829D2A8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C213616AF;
	Mon, 26 Aug 2019 17:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C213616AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566833233;
	bh=iQn3/GjbOPjvb0j4ArY8y7p3fqBqAS3shddBvq7PWdU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9k0Ge7ObTeoyFypJk+jYjc2xeR1m4DW2GJUXh94ktkk0fRqgs6toPNosE+F0RmAA
	 safht7N9Z7DP6I9jFoTA2udVO2hWn2JReiYcopGHxXME4a/0kUS5DkFWcBwCVHYTjI
	 A0EfDiJYxlIsV42ClOIv/u+gT8f1GhNlE6vWPzBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C364DF80362;
	Mon, 26 Aug 2019 17:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D69FAF80376; Mon, 26 Aug 2019 17:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAF58F80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 17:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAF58F80143
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x7QFP7hr031359;
 Tue, 27 Aug 2019 00:25:08 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp);
 Tue, 27 Aug 2019 00:25:07 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav110.sakura.ne.jp)
Received: from [192.168.1.2] (118.153.231.153.ap.dti.ne.jp [153.231.153.118])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x7QFP7Ox031353
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Tue, 27 Aug 2019 00:25:07 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
To: Hans de Goede <hdegoede@redhat.com>, Daniel Drake <drake@endlessm.com>
References: <20190824210426.16218-1-katsuhiro@katsuster.net>
 <943932bf-2042-2a69-c705-b8e090e96377@redhat.com>
 <CAD8Lp44_uAC4phZ9NbvM_LKNUoiNUqAnFsq4h-bJiQn6byjzGw@mail.gmail.com>
 <eeee149c-4d9b-8b2e-780b-a41e2c87ec02@redhat.com>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <9574e5f4-e9db-1876-73f7-19a79fb1209e@katsuster.net>
Date: Tue, 27 Aug 2019 00:25:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eeee149c-4d9b-8b2e-780b-a41e2c87ec02@redhat.com>
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

SGVsbG8gSGFucywgRGFuaWVsLAoKVGhhbmsgeW91IGZvciByZXZpZXdpbmcgYW5kIGNvbW1lbnQu
CgpPbiAyMDE5LzA4LzI2IDE4OjA5LCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDI2LTA4LTE5IDA0OjUzLCBEYW5pZWwgRHJha2Ugd3JvdGU6Cj4+IE9uIE1vbiwgQXVnIDI2LCAy
MDE5IGF0IDE6MzggQU0gSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4gCj4+IHdy
b3RlOgo+Pj4gT24gMjQtMDgtMTkgMjM6MDQsIEthdHN1aGlybyBTdXp1a2kgd3JvdGU6Cj4+Pj4g
VGhpcyBwYXRjaCBsaW1pdHMgSGVhZHBob25lIG1peGVyIHZvbHVtZSB0byA0IGZyb20gNy4KPj4+
PiBCZWNhdXNlIG91dHB1dCBzb3VuZCBzdWRkZW5seSBiZWNvbWVzIHZlcnkgbG91ZGx5IHdpdGgg
bWFueSBub2lzZSBpZgo+Pj4+IHNldCB2b2x1bWUgb3ZlciA0Lgo+Pgo+PiBUaGF0IHNvdW5kcyBs
aWtlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBsaW1pdGVkIGluIFVDTS4KPj4KPj4+IEhpZ2hl
ciB0aGVuIDQgbm90IHdvcmtpbmcgbWF0Y2hlcyBteSBleHBlcmllbmNlLCBzZWUgdGhpcyBjb21t
ZW50IGZyb20KPj4+IHRoZSBVQ00gZmlsZTogYWxzYS1saWIvc3JjL2NvbmYvdWNtL2NvZGVjcy9l
czgzMTYvRW5hYmxlU2VxLmNvbmYgOgo+Pj4KPj4+ICMgU2V0IEhQIG1peGVyIHZvbCB0byAtNiBk
QiAoNC83KSBsb3VkZXIgZG9lcyBub3Qgd29yawo+Pj4gY3NldCAibmFtZT0nSGVhZHBob25lIE1p
eGVyIFZvbHVtZScgNCIKPj4KPj4gV2hhdCBkb2VzICJkb2VzIG5vdCB3b3JrIiBtZWFuIG1vcmUg
cHJlY2lzZWx5Pwo+IAo+IElJUkMgZ2FyYmxlZCBzb3VuZC4KPiAKPj4gSSBjaGVja2VkIHRoZSBz
cGVjLCB0aGVyZSBpcyBpbmRlZWQgc29tZXRoaW5nIHdyb25nIGluIHRoZSBrZXJuZWwgCj4+IGRy
aXZlciBoZXJlLgo+PiBUaGUgZGIgc2NhbGUgaXMgbm90IGEgc2ltcGxlIHNjYWxlIGFzIHRoZSBr
ZXJuZWwgc291cmNlIHN1Z2dlc3RzLgo+Pgo+PiBJbnN0ZWFkIGl0IGlzOgo+PiAwMDAwIOKAkyAt
MTJkQgo+PiAwMDAxIOKAkyAtMTAuNWRCCj4+IDAwMTAg4oCTIC05ZEIKPj4gMDAxMSDigJMgLTcu
NWRCCj4+IDAxMDAg4oCTIC02ZEIKPj4gMTAwMCDigJMgLTQuNWRCCj4+IDEwMDEg4oCTIC0zZEIK
Pj4gMTAxMCDigJMgLTEuNWRCCj4+IDEwMTEg4oCTIDBkQgo+Pgo+PiBTbyBwZXJoYXBzIHdlIGNh
biBmaXggdGhlIGtlcm5lbCB0byBmb2xsb3cgdGhpcyB0YWJsZSBhbmQgdGhlbiB1c2UgVUNNCj4+
IHRvIGxpbWl0IHRoZSB2b2x1bWUgaWYgaXRzIHRvbyBoaWdoIG9uIGEgZ2l2ZW4gcGxhdGZvcm0/
Cj4gCj4gWWVzIHRoYXQgc291bmRzIGxpa2UgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBLYXRzdWhp
cm8gY2FuIHlvdSBjb25maXJtIHRoYXQKPiB1c2luZyB0aGlzIHRhYmxlIGFsbG93cyB1c2luZyB0
aGUgZnVsbCBzY2FsZSA/IG5vdGUgdGhhdCB0aGUgZnVsbCBzY2FsZSBub3cKPiBoYXMgOSBzdGVw
cyByYXRoZXIgdGhlbiA4Lgo+IAoKSSd2ZSBmaW5pc2hlZCB0ZXN0aW5nIHRoaXMgdGFibGUgb24g
bXkgYm9hcmQgKFJvY2tQcm82NCkuCkV2ZXJ5IHZhbHVlcyB3b3JrIHdlbGwgd2l0aG91dCBnYXJi
bGVkIHNvdW5kLgoKSSBjaGVja2VkIGFkZHJlc3MgMHgxNiByZWdpc3RlciB2aWEgL3N5cy9rZXJu
ZWwvZGVidWcvcmVnbWFwIHRvby4KVGhlIHJlZ2lzdGVyIHZhbHVlcyBhbmQgZEIgKGdldCBmcm9t
IGFsc2FtaXhlcikgYXJlIHRoZSBmb2xsb3dpbmcgaWYKSSBpbmNyZWFzZSBoZWFkcGhvbmUgdm9s
dW1lIHRvIG1heCBmcm9tIG1pbi4KCiAgIHJlZyAgIGRCCiAgIDB4MTYgIHNjYWxlCiAgIC0tLS0t
LS0tLS0tLQogICAweDAwICAtMTIuMDAKICAgMHgxMSAgLTEwLjUwCiAgIDB4MjIgIC05LjAwCiAg
IDB4MzMgIC03LjUwCiAgIDB4NDQgIC02LjAwCiAgIDB4ODggIC00LjUwCiAgIDB4OTkgIC0zLjAw
CiAgIDB4YWEgIC0xLjUwCiAgIDB4YmIgIDAuMDAKCgpBbmQgSSBmb3VuZCBvdGhlciBwcm9ibGVt
LCBjdXJyZW50IGNvZGUgaXMgaW52ZXJ0ZWQgTC9SIHZvbHVtZS4KSXQncyBvbmx5IGluIEhlYWRw
aG9uZSAibWl4ZXIiIHZvbHVtZS4gSXQgc2VlbXMgSGVhZHBob25lICJtYXN0ZXIiCnZvbHVtZSB3
b3JrcyBjb3JyZWN0bHkuCgpJJ2xsIGZpeCB0aGVzZSBwcm9ibGVtcyBhbmQgc2VuZCBWMiBwYXRj
aCBzZXQuCgoKPiBSZWdhcmRzLAo+IAo+IEhhbnMKPiAKPiAKCkJlc3QgUmVnYXJkcywKS2F0c3Vo
aXJvIFN1enVraQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
