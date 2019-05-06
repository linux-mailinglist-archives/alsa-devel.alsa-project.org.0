Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E615657
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 01:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FDD18E8;
	Tue,  7 May 2019 01:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FDD18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557185506;
	bh=DdG3fJI4Pax/J4BmFEeaBqzWvZkJ2C6SJRQEYAFCV/w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thhGSUQPD6DEaPfneSImTtwXkefiuXqkmH6TcSq5oAJ7y8KhywWOsFDjvYRLLpemM
	 pWrCFo2YJoB1u8bY1u262H4jZlf5V+ztZEReFvr1WVcGrLLDMJsmDOQ3f78VCBpTxP
	 +d29uhFiepk+1XXL3UvDid7iBFWiF5KAHT2Mt4I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D58FF896FD;
	Tue,  7 May 2019 01:30:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 385C2F896F0; Tue,  7 May 2019 01:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69759F89673
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 01:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69759F89673
Received: from [123.123.251.121] (helo=[192.168.1.107])
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hNn3R-0004ko-13; Mon, 06 May 2019 23:29:53 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20190506140932.7942-1-hui.wang@canonical.com>
 <s5himun4pu4.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <2738a3b7-168a-ccb2-eb2b-184c88477c65@canonical.com>
Date: Tue, 7 May 2019 07:29:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5himun4pu4.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 1/2] ALSA: hda/hdmi - Read the pin sense
 from register when repolling
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

Ck9uIDIwMTkvNS82IOS4i+WNiDEwOjMxLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gT24gTW9uLCAw
NiBNYXkgMjAxOSAxNjowOTozMSArMDIwMCwKPiBIdWkgV2FuZyB3cm90ZToKPj4gQEAgLTE2NjMs
NiArMTY2MywxMSBAQCBzdGF0aWMgdm9pZCBoZG1pX3JlcG9sbF9lbGQoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQo+PiAgIAljb250YWluZXJfb2YodG9fZGVsYXllZF93b3JrKHdvcmspLCBzdHJ1
Y3QgaGRtaV9zcGVjX3Blcl9waW4sIHdvcmspOwo+PiAgIAlzdHJ1Y3QgaGRhX2NvZGVjICpjb2Rl
YyA9IHBlcl9waW4tPmNvZGVjOwo+PiAgIAlzdHJ1Y3QgaGRtaV9zcGVjICpzcGVjID0gY29kZWMt
PnNwZWM7Cj4+ICsJc3RydWN0IGhkYV9qYWNrX3RibCAqamFjazsKPj4gKwo+PiArCWphY2sgPSBz
bmRfaGRhX2phY2tfdGJsX2dldChjb2RlYywgcGVyX3Bpbi0+cGluX25pZCk7Cj4+ICsJaWYgKGph
Y2spCj4+ICsJCWphY2sgPSBqYWNrLT5qYWNrX2RpcnR5ID0gMTsKPiBPaCwgYW5kIEkgY29ycmVj
dGVkIHRoZSBvYnZpb3VzIHR5cG8gYWJvdmUgbWFudWFsbHkgd2hpbGUgYXBwbHlpbmcuCj4gV2Ug
ZG9uJ3QgbmVlZCB0byBzdWJzdGl0dXRlIGphY2sgdHdpY2UuCgpPaCwgc29ycnkuCgo+Cj4KPiBU
YWthc2hpCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwo+
IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
