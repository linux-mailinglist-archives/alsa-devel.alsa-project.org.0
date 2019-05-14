Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B77641CA29
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2019 16:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F69822;
	Tue, 14 May 2019 16:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F69822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557843637;
	bh=d7rRe4SOAxVPytw+zz1z0d5IQ0h3abZiHRra4awLUe0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LH56nZOcKzMACzMPUaA+zmfQG23I11RP0DTkijLJyrloJL9l/KLpoSI/jlmyKHr3j
	 VvKqCngXF67MDo8B06uQmOGQeMsa39i7T7uqzUyloHjB1Hc7/SE9ICRVv1q0ifpUDC
	 8Ibrur+yud+kO/sfLaMo93BsnOKASqawkL8IOuEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CE43F896B6;
	Tue, 14 May 2019 16:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C31DF896B6; Tue, 14 May 2019 16:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 612ABF8961A
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 16:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 612ABF8961A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aO4mfMmQ"
Received: by mail-lj1-x242.google.com with SMTP id z1so14497812ljb.3
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BnopQyDTp3w+lH+126vXLoMkRZyurR3lHK8FN+w79WA=;
 b=aO4mfMmQSw8MqwlhM6PaavL5cSNl6DGT5oLQi7HVxwFsejilWHpPHhz3bb9CEBBqVS
 /UAkj+XsFvm/xGigFa9w5doLbWmbYFhMVp73VwGp7YbHNHjY+1V2rQ20v7j3AszcS7g1
 J0sSCnZPyli5mLTwiSmxMQ2XwbmD5+8H/PjG06AGYhIHM3Jeo8g6YDPucgIYeaXjnhRx
 T1o57cQ9a/l2bSqRHIegL0K5KXC/W6rg/wBmkUVvGwdiRVuNtDfLdFEvqM4AmmMU8NVH
 Xt3Pb8Chalgo/aFHdiXnXIxe2wzGGR+FJuMYHpM4hf3qzlXQXVS+a0WjpTZYCZBo9qzA
 +a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BnopQyDTp3w+lH+126vXLoMkRZyurR3lHK8FN+w79WA=;
 b=C6FyNIBKaOAZoT7X9Ugb/qgCRX+DRSJeSkhc6yvEM93wwTzxJ67BzGzL0FlsEAJXxQ
 K3bkuCMtbJx6SS/TF36G8mDRsBpRsQrjtROW9r76wLfOARiQ8oWM6Mwxm1V1sdRSG2sl
 wyKOykC5X7XvYgqBhOgn8+o4s+agIKdeUeOjRKV99lbPsLOvbiymMamdLGF3Q0Lns7ld
 9nNENdeA9YnxklBFzKSQXRdQ+7i+PzXPNeCwv/yvVsy3FMWKSUyJ5hoavUmOD5jj3GPU
 JR6DzjYUHVp5MwjwkofztXYy1ib+n2pk1A9XNx5BQeYoLSn7HvRinuZiGQ1p1BBSDIGr
 8lIQ==
X-Gm-Message-State: APjAAAU/BP3VH1PguSNxfvprkRe+/iswHIpIBMW+I8oez0tKRy9u//Nz
 Rm84u/fQzfTK0FP7MHYZv0vf8HqoCFQ=
X-Google-Smtp-Source: APXvYqw01F8/1l6mH5gPYSyCX1ZGvilurmZKYrjXBq/1tg2CHOiI9QEWZr5Ks7i5uXohl2b7YZp+zg==
X-Received: by 2002:a2e:91c3:: with SMTP id u3mr16937568ljg.130.1557843521002; 
 Tue, 14 May 2019 07:18:41 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl.
 [31.178.116.31])
 by smtp.googlemail.com with ESMTPSA id b29sm3802361lfo.38.2019.05.14.07.18.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 07:18:40 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <158b63b9-ff73-7f53-de83-5a7b8a21b250@gmail.com>
 <s5h4l5xrxxm.wl-tiwai@suse.de>
From: =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Message-ID: <de267744-b620-ff52-4bbc-696bc74aa789@gmail.com>
Date: Tue, 14 May 2019 16:18:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h4l5xrxxm.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] Fix for Lenovo B50-70 inverted internal
 microphone bug.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMTQuMDUuMjAxOSAxNTowMiwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIE1vbiwgMTMgTWF5
IDIwMTkgMjM6MjU6MzYgKzAyMDAsCj4gTWljaGFYMiBXYWRvd3NraSB3cm90ZToKPj4KPj4gQWRk
IHBhdGNoIGZvciByZWFsdGVrIGNvZGVjIGluIExlbm92byBCNTAtNzAuCj4+IEJ1Z3ppbGxhOiBo
dHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9hbHNhLWRyaXZlci8rYnVn
LzE1MjQyMTUKPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBXYWRvd3NraSA8d2Fkb3NtQGdt
YWlsLmNvbT4KPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiAKPiBBY3R1YWxseSB0aGlzIHNl
ZW1zIHByb2JsZW1hdGljOiB0aGUgYWRkZWQgUENJIFNTSUQgKDE3YWE6Mzk3OCkgZG9lcwo+IGFs
cmVhZHkgZXhpc3QgZm9yIElkZWFwYWQgWTQxMFAuICBUaGF0IGlzLCB3ZSBuZWVkIHRvIHJlcGxh
Y2UgdGhlCj4gZW50cnksIG5vdCBqdXN0IGFkZGluZy4gIFRoZSBleGlzdGluZyBxdWlyayBpcyBv
bmx5IGFib3V0IHRoZSBub2lzZQo+IGZpeCBhbmQgaXQgZGlkbid0IHNlZW0gaGVscCBpbiBhIGxh
dGVyIGtlcm5lbCB2ZXJzaW9uLCBpbiBhbnl3YXksIHNvCj4gaXQgc2hvdWxkIGJlIE9LIHRvIHJl
cGxhY2Ugd2l0aCB0aGUgbmV3IHF1aXJrLgoKSSBhbHNvIHNhdyB0aGlzIGNvbmZsaWN0LCBidXQg
SSBkaWRuJ3Qga25vdyB3aGF0IHNob3VsZCBJIGRvIHdpdGggdGhpcy4KSWYgeW91IHNheSB0aGF0
IGV4aXN0aW5nIGZpeCBmb3IgSWRlYXBhZCBZNDEwUCBpcyBub3QgbmVjZXNzYXJ5IG5vdywgSSBy
ZXBsYWNlIHRoaXMgd2l0aCBMZW5vdm8gQjUwLTcwIGZpeC4KCj4gQWxzbywgSSB3b25kZXIgd2hl
dGhlciB0aGUgZXhpc3RpbmcgcXVpcmsKPiBBTEMyNjlfRklYVVBfRE1JQ19USElOS1BBRF9BQ1BJ
IHdvcmtzIG9uIHlvdXIgZGV2aWNlLiAgQ291bGQgeW91IGNoZWNrCj4gaXQ/Cj4gCj4gCj4gdGhh
bmtzLAo+IAo+IFRha2FzaGkKClllcywgcXVpcmsgQUxDMjY5X0ZJWFVQX0RNSUNfVEhJTktQQURf
QUNQSSB3b3JrcyBmaW5lIG9uIG15IGRldmljZS4KTXkgbGFwdG9wIHVzZXMgQUxDMjMzLCBzbyBJ
IGNyZWF0ZWQgc2VwYXJhdGVkIHF1aXJrLCBidXQgZmluYWxseSBpdCBkb2VzIHRoZSBzYW1lIHRo
aW5nLgpTaG91bGQgSSByZW1vdmUgQUxDMjMzX0ZJWFVQX0lOVl9ETUlDIGFuZCByZXBsYWNlIGl0
IHdpdGggQUxDMjY5X0ZJWFVQX0RNSUNfVEhJTktQQURfQUNQST8KCnRoYW5rcywKTWljaGHFggpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
