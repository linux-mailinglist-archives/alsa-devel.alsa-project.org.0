Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CCC11A49F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:41:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01411654;
	Wed, 11 Dec 2019 07:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01411654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046515;
	bh=U5IKi4BVIeG8c0TQM5lkpdbz2904yCw/usNhX1B+LvU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUQIT6Tcle22UvjkXYgNfvc8H/qCHOAcUP12vEOR1rrH9rrdXevttGreLlXehJ/Rn
	 YCWrOw1xVAlDaX5qRzAcnK2kbkvKsYBZw77ARgCQ9ZztrdDpim/6ULm9wHTkz8lDDH
	 IFX3FYiz9OtLxHjuYVzE6QYImAsuJYs1Q4J6Krrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B0EEF80265;
	Wed, 11 Dec 2019 07:38:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EA8F8020C; Tue, 10 Dec 2019 19:24:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3988FF8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 19:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3988FF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aGUEOSg8"
Received: by mail-lf1-x141.google.com with SMTP id r14so14531224lfm.5
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J3Fx8Ozru3AuGWOjWvc6Qigb/OUj/LedRTw55RBNbbg=;
 b=aGUEOSg85AsreT39QBDzBQYeDUNVNG8qxblS0lqPAOh/mvDWQmp+aYHdObab0Ywr6/
 1D/erTOfgbnefovIimaS5RxuhRJzRjZAzlWjw+3mBPmcQTd3cYE2mBsLarWUoVtX7VYk
 oT+kg9iQJ6uc+Cxr22Q7UnhkUxJfa576lHzRkcvAz+SzCjgx3b657NXs3xUVmfkE4IXQ
 +OmlBtcQ2A/XCmuzcQIKUq2k08SSI4a+CsQhJbgXsRpIErzjxtkzDQQX3pQSEaVaDuJs
 aJeWxBsqMyv+4hceKG1UHxRONlmh9VgsaJS7tWPIZJuR1h3F3dx7ySRJQCm1E0wNvqH0
 amvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J3Fx8Ozru3AuGWOjWvc6Qigb/OUj/LedRTw55RBNbbg=;
 b=OoDYJrUK4xrnT3T5pR3jyqvMNdvuvX2gDJbPdkJGvbiSu9y7YX84WqwYzciutoU+cy
 hoDw+rvWf4HoLrY38lYTBFqSDTgBIk102WUsq3nYi9maWSny4dEqph6g6x1K9zZLk8OE
 QHPUXMhybIvaXpIOGvz/Be99UU4tBBknRhBS3jvdIsw/QklKc6TAL7dfr2CTVo798h8x
 G7NWbjYs4UJgrHOqhF/UFPrsEqJQTKo1cpQ6E15p3Z0TK/OidXdGFX9PLChu+0tDg0RK
 HTgdtx0OWN9F4qFIVFypje7BFF6a5bOxWUccFC7qO2QJ7aOsJh8KGI+C7rGWVDCdc71l
 QDdQ==
X-Gm-Message-State: APjAAAV0HDPS5T41GxAskW17a+/6KNthJHz825ZVm1Dms0BziddxEXVZ
 DECg4aRCZOw3WI8ioQUjMNaMo0EH
X-Google-Smtp-Source: APXvYqxF07iQXmiNXjFleXUWs9rwRg1kwAjgSyuguUjGbybN4u6GkAQPSegzeXZQNvdtozsIzp8rUg==
X-Received: by 2002:a19:4a12:: with SMTP id x18mr16433639lfa.158.1576002286171; 
 Tue, 10 Dec 2019 10:24:46 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id b17sm1999915lfp.15.2019.12.10.10.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2019 10:24:45 -0800 (PST)
To: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
 <20191209204735.GK5483@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
Date: Tue, 10 Dec 2019 21:24:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191209204735.GK5483@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, lgirdwood@gmail.com,
 spujar@nvidia.com, mperttunen@nvidia.com, thierry.reding@gmail.com,
 josephl@nvidia.com, linux-clk@vger.kernel.org, mmaddireddy@nvidia.com,
 daniel.lezcano@linaro.org, krzk@kernel.org, jonathanh@nvidia.com,
 mturquette@baylibre.com, devicetree@vger.kernel.org, arnd@arndb.de,
 markz@nvidia.com, alexios.zavras@intel.com, tiwai@suse.com,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tglx@linutronix.de,
 allison@lohutok.net, sboyd@kernel.org, gregkh@linuxfoundation.org,
 pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 Jisheng.Zhang@synaptics.com, Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 09/15] ASoC: tegra: Add fallback for
	audio mclk
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

MDkuMTIuMjAxOSAyMzo0NywgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIE1vbiwgRGVjIDA5
LCAyMDE5IGF0IDExOjMxOjU5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDku
MTIuMjAxOSAxOTo0MCwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IAo+Pj4gV2h5IHdvdWxkIHRo
aXMgbmVlZCB0byBiZSBhIHN0YWJsZSBmaXg/ICBQcmVzdW1hYmx5IHBlb3BsZSB3aXRoIHN0YWJs
ZQo+Pj4ga2VybmVscyBhcmUgdXNpbmcgdGhlIG9sZCBkZXZpY2UgdHJlZSBhbnl3YXk/Cj4gCj4+
IEF0IGxlYXN0IFJvYiBIZXJyaW5nIGlzIGFza2luZyB0byBtYWludGFpbiBiYWNrd2FyZHMgY29t
cGF0aWJpbGl0eQo+PiBiZWNhdXNlIHNvbWUgZGl0cm9zIGFyZSB1c2luZyBuZXdlciBkZXZpY2Ut
dHJlZXMgd2l0aCBzdGFibGUga2VybmVscy4KPiAKPiBZb3UncmUgdGFsa2luZyBhYm91dCBmb3J3
YXJkcyBjb21wYXRpYmlsaXR5IG5vdCBiYWNrd2FyZHMgaGVyZS4gIEFyZQo+IHRob3NlIGRpc3Ry
b3MgYWN0dWFsbHkgdXNpbmcgTFRTIGtlcm5lbHM/CgpJIHRoaW5rIG9wZW5TVVNFIExlYXAgY291
bGQgYmUgb25lIG9mIHRob3NlIGRpc3Ryb3MgdGhhdCB1c2UgTFRTIGtlcm5lbAp3aXRoIG5ld2Vy
IGRldmljZS10cmVlcywgYnV0IHRoYXQncyBub3QgMTAwJS4gTWF5YmUgUm9iIGNvdWxkIGhlbHAK
Y2xhcmlmeWluZyB0aGF0LgoKPj4gSSdtIHBlcnNvbmFsbHkgYWxzbyB0ZW5kaW5nIHRvIHVzZSB0
aGUgbmV3ZXIgRFRCIHdpdGggb2xkZXIga2VybmVsCj4+IHZlcnNpb24gd2hlbmV2ZXIgdGhlcmUg
aXMgYSBuZWVkIHRvIGNoZWNrIHNvbWV0aGluZyB1c2luZyBzdGFibGUga2VybmVsLgo+PiBQZXJo
YXBzIGxvc2luZyBzb3VuZCBpcyBub3QgdmVyeSBpbXBvcnRhbnQsIGJ1dCB3aWxsIGJlIG5pY2Vy
IGlmIHRoYXQKPj4gZG9lc24ndCBoYXBwZW4uCj4gCj4gVGhhdCByZWFsbHkgZG9lcyBzb3VuZCBs
aWtlIGEgInlvdSBicm9rZSBpdCwgeW91IGdldCBhbGwgdGhlIHBpZWNlcyIKPiBzaXR1YXRpb24g
VEJILi4uICBJJ2QgYmUgYSBsb3QgbW9yZSBjb21mb3J0YWJsZSBpZiB0aGUgc3RhYmxlIGtlcm5l
bHMKPiB3ZXJlIHN0aWNraW5nIHRvIGJ1Z2ZpeCBvbmx5IHRob3VnaCBJIGRvIGFwcHJlY2lhdGUg
dGhhdCB0aGV5J3JlIG5vdAo+IHJlYWxseSB0aGF0IGFueSBtb3JlLgoKSW4gc29tZSBjYXNlcyBp
dCBjb3VsZCBiZSBwYWluZnVsIHRvIG1haW50YWluIGRldmljZS10cmVlIGNvbXBhdGliaWxpdHkK
Zm9yIHBsYXRmb3JtcyBsaWtlIE5WSURJQSBUZWdyYSBTb0NzIGJlY2F1c2UgaGFyZHdhcmUgd2Fz
bid0IG1vZGVsZWQKY29ycmVjdGx5IGZyb20gdGhlIHN0YXJ0LgoKSSBhZ3JlZSB0aGF0IHBlb3Bs
ZSBzaG91bGQgdXNlIHJlbGV2YW50IGRldmljZS10cmVlcy4gSXQncyBxdWl0ZSBhIGxvdApvZiBo
YXNzbGUgdG8gY2FyZSBhYm91dCBjb21wYXRpYmlsaXR5IGZvciBwbGF0Zm9ybXMgdGhhdCBhcmUg
cGVybWFuZW50bHkKaW4gYSBkZXZlbG9wbWVudCBzdGF0ZS4gSXQgY291bGQgYmUgbW9yZSByZWFz
b25hYmxlIHRvIGdvIHRocm91Z2ggdGhlCnBhaW4gaWYga2VybmVsIHJlcXVpcmVkIGEgZnVsbC1m
ZWF0dXJlZCBkZXZpY2UgdHJlZSBmb3IgZXZlcnkgU29DIGZyb20KdGhlIHN0YXJ0LgoKQnV0IG1h
eWJlIFRlZ3JhIC8gZGV2aWNlLXRyZWUgbWFpbnRhaW5lcnMgaGF2ZSBhIGRpZmZlcmVudCBvcGlu
aW9uLgpJSVVDLCBkZXZpY2UtdHJlZXMgYXJlIG1lYW50IHRvIGJlIHN0YWJsZSBhbmQgc29mdHdh
cmUtYWdub3N0aWMsIGF0CmxlYXN0IHRoYXQgd2FzIHRoZSBjYXNlIG5vdCBzbyBsb25nIHRpbWUg
YWdvIGFuZCBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcwpwcmVtaXNlIGNoYW5nZWQuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
