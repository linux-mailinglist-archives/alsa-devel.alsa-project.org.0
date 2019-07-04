Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762E5FEA7
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 01:29:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7795B1695;
	Fri,  5 Jul 2019 01:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7795B1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562282951;
	bh=9jkhjKB5h5lbRFviEfyTbfPKbUok9ztRKC3PU9tQm34=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8OpFkyGWORCuXElfV2pZ+Fo7EZ1JYN6Epfd7dsVcV+DGIxFbGLMkfX9rCJCBCMt3
	 Y/3qaVx5L2reQHszhQhDiAEUB53Qx6r92MwkKHYr10GA9ulP+8MqoMKXRQmtSvzkXO
	 YJUQ2hk5I9aMMzJI6Mv7Ha5V+vn2vUzLNgp+Yud0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3EF6F80113;
	Fri,  5 Jul 2019 01:27:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F503F80111; Fri,  5 Jul 2019 01:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6F8F80058
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 01:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6F8F80058
Received: from [114.252.212.168] (helo=[192.168.1.106])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hjB89-00053a-18; Thu, 04 Jul 2019 23:27:09 +0000
To: "He, Bo" <bo.he@intel.com>, "kailang@realtek.com" <kailang@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CD6925E8781EFD4D8E11882D20FC406D52AB58B6@SHSMSX104.ccr.corp.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <c37fa9bd-071c-6c10-55a6-933a4937fa87@canonical.com>
Date: Fri, 5 Jul 2019 07:27:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CD6925E8781EFD4D8E11882D20FC406D52AB58B6@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Cc: "jian-hong@endlessm.com" <jian-hong@endlessm.com>,
 "drake@endlessm.com" <drake@endlessm.com>,
 "chiu@endlessm.com" <chiu@endlessm.com>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] audio lost from speaker after reboot from windows
 on the device ALC295
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

TWF5YmUgeW91ciBtYWNoaW5lIGhhcyBhbiBleHRlcm5hbCBhbXBsaWZpZXIgd2hpY2ggbmVlZHMg
dG8gYmUgc2V0IGJ5IApzb2Z0d2FyZSBiZWZvcmUgaXQgY2FuIHdvcmsuCgpPbiAyMDE5LzcvNCDk
uIvljYg4OjAyLCBIZSwgQm8gd3JvdGU6Cj4gSGksIHBhdGNoX3JlYWx0ZWsuYyBtYWludGFpbmVy
Ogo+IAlJIHNlZSBvbmUgaXNzdWUgdGhhdCByZWJvb3QgZnJvbSB3aW5kb3dzIGFuZCBib290IHRv
IHVidW50dSwgdGhlIGF1ZGlvIGxvc3QgZnJvbSBzcGVha2VyLCBJIHN1c3BlY3QgdGhlcmUgYXJl
IHNvbWUgYnVncyBpbiBwYXRjaF9yZWFsdGVrLmMgZHJpdmVycywgIHRoZSBkZXZpY2UgaXMgQUxD
Mjk1IGFuZCB0aGUgZGV2aWNlIGlkIGlzIDB4MTBlYzAyOTUuCj4KPiBJIGhhdmUgZG9uZSB0aGUg
YmVsb3cgZXhwZXJpbWVudHM6Cj4gMS4gcmVib290IGZyb20gd2luZG93cyB0byB3aW5kb3dzLCB0
aGUgYXVkaW8gaXMgcGVyc2lzdCAuCj4gMi4gcmVib290IGZyb20gd2luZG93cyB0byB1YnVudHUs
IHRoZSBhdWRpbyBsb3N0IGZyb20gc3BlYWtlciwgYnV0IGNhbiBoZWFyIGlmIEkgaG90cGx1ZyBv
bmUgZWFycGhvbmUuCj4gMy4gaWYgdGhlIGlzc3VlIHJlcHJvZHVjZSBhZnRlciByZWJvb3QgZnJv
bSB3aW5kb3dzLCByZWJvb3QgdGhlIHVidW50dSBjYW4ndCByZXN0b3JlIHRoZSBhdWRpbywgSSBz
dXNwZWN0IGl0J3Mgd2FybSByZXNldC4KPiA0LiBpZiBJIHdyaXRlIHRoZSBwb3J0IDB4Y2Y5IHdp
dGggMHhlIHRvIGRvIGNvbGQgcmVzZXQsIHRoZSBhdWRpbyBjYW4gcmVzdG9yZS4KPiA1LiBpZiBJ
IGRvIHN1c3BlbmQvcmVzdW1lLCB0aGUgYXVkaW8gY2FuIHJlc3RvcmUsIEkgc3VzcGVjdCBkbyBj
b2xkIGJvb3QgYW5kIHN1c3BlbmQgd2lsbCB0cmlnZ2VyIHRoZSBwbGF0Zm9ybSByZXNldCB0byBy
ZXNldCB0aGUgQUxDMjk1Lgo+IDYuIGlmIEkgZG8gZG91YmxlIGZ1bmN0aW9uIHJlc2V0ICh3cml0
ZSB0aGUgdmVyYiAweDdmZiBpbiBhbGNfaW5pdCksIHRoZSBhdWRpbyBpcyBzdGlsbCBjYW4ndCBy
ZXN0b3JlLgo+IHNuZF9oZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MDEsIDAsIEFDX1ZFUkJfU0VU
X0NPREVDX1JFU0VULCAwKTsgLyogRnVuY3Rpb24gcmVzZXQgKi8KPiBzbmRfaGRhX2NvZGVjX3dy
aXRlKGNvZGVjLCAweDAxLCAwLCBBQ19WRVJCX1NFVF9DT0RFQ19SRVNFVCwgMCk7IC8qIGRvdWJs
ZSBGdW5jdGlvbiByZXNldCAqLwo+IDcuIHRoZSBpc3N1ZSBpcyBmaXJzdCBmb3VuZCBvbiBrZXJu
ZWwgNC4xOS41MCwgSSBzdGlsbCBzZWUgdGhlIGlzc3VlIHdpdGggdGhlIGxhdGVzdCBrZXJuZWwg
NS4yLXJjMiwgaXMgaXQgcG9zc2libGUgd2luZG93cyBjaGFuZ2Ugc29tZSBkZWZhdWx0IHJlZ2lz
dGVycywgYnV0IEFMQzI5NSBkb24ndCBpbml0aWFsaXplIHRoZSByZWdpc3Rlcj8KPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
