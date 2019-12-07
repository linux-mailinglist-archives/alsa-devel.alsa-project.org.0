Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D6116AD6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:20:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1F316B1;
	Mon,  9 Dec 2019 11:19:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1F316B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886820;
	bh=7cafCujQrYJhKxaY+FnxKk/6VRnz6gI9KCaWF+4D4lI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5thals0iseTAwVLOheYqZ+ucShcdZQEXbsEeEqFrQjambHHWNZIaktWbKyE8usD8
	 7Ln6qUsFocLL4I57r3i9Suk77uf1tfRwbmp8T6N4kbOu2h/AfJ4fg0Jt/PCnkz8j1p
	 baQD0rW8gtp9kqMkG6zlNZYdOJ1pksEl8s2Uu47w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D5A7F80478;
	Mon,  9 Dec 2019 10:52:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BFB6F801F7; Sat,  7 Dec 2019 15:33:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44876F8010F
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 15:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44876F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K3aQ1qbn"
Received: by mail-lj1-x242.google.com with SMTP id a13so10731219ljm.10
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 06:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/FFDjLwGzWA9HSQGVIzBQAFJnVseiTav15XJa3GBc3M=;
 b=K3aQ1qbnb55GNOBjWlsAMHcHx4YpXkTmspJZNtQXfZdFyWE+cwSXhC+prKM7Cj+7LU
 jduHbB8Y3SawAfvF6BiO8joJc70Bkgx827I05VZk19e5S08pWQHu0Xcj6ubmkd9v01yz
 8vUqyzhjuQuo0tipFfpM4TEbT+am9WsUMgmv74hmFUD5Zr2yprED8P8W42B5XsatRe9S
 38WrXZFsAGdVu3KbEql7dhqguT+YQlZWhEvwJyyK9ghBvbfEPEAFUPiFXdK9weISgcb/
 /GbNBmS+Dg67t1paCZbFk9QohnHq8yqD2EqOYGBFRHLDRRrZm8Dj+vv5w6l+R7nUiWbP
 PXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/FFDjLwGzWA9HSQGVIzBQAFJnVseiTav15XJa3GBc3M=;
 b=Nr9Q76Vjse6uuTvOXSN6QVdByvCThIVaMOU0IJoC+M4VsQ+HMlu+yFgOBev8aU7p7e
 cHafRjGRn58pwjoEht07ChWEbOmUzKdpGieUG3yAhUh6FqJyQdSBz04pMKd8six42KqZ
 HJYxCyb4uSErrMr8OsqZp86xIBxzTcFiKpP2rgGNY8DGHPwy/Y7TX5yeAp9+S1iCB0Ft
 p0Z3uKAMrzl8fMo+EbVw2frpSBJcnCxjZIpcXdMxu44lif9dcK5xazvNJB/aRddoEGJQ
 w/mbQUKmvc9vg7WwbMy3YGx0zHZp0dHGNaVNp4/3GTg98iXVPEJ2IhJ0dZyCIkOK5pRz
 evMA==
X-Gm-Message-State: APjAAAW9NyOy2D69TB4xWnA4fpk51Hd28rNXXnlGDCfhAGrZvmqJwaCI
 oWaT0ql9TOKMctYCGVx60xwf90Ei
X-Google-Smtp-Source: APXvYqwlXFJb8W4yPOfhW3/16zy5CO9BLcreipXry+ldYRegUMcmqCBo+2yeOXVRJRYvTKIUZaTVpA==
X-Received: by 2002:a2e:9705:: with SMTP id r5mr10932018lji.114.1575729201868; 
 Sat, 07 Dec 2019 06:33:21 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id l28sm8132397lfk.21.2019.12.07.06.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 06:33:21 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
Date: Sat, 7 Dec 2019 17:33:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Dec 2019 10:51:21 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: Re: [alsa-devel] [PATCH v3 06/15] clk: tegra: Remove
 tegra_pmc_clk_init along with clk ids
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

MDYuMTIuMjAxOSAwNTo0OCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IEN1cnJl
bnQgVGVncmEgY2xvY2sgZHJpdmVyIHJlZ2lzdGVycyBQTUMgY2xvY2tzIGNsa19vdXRfMSwgY2xr
X291dF8yLAo+IGNsa19vdXRfMyBhbmQgYmxpbmsgb3V0cHV0IGluIHRlZ3JhX3BtY19pbml0KCkg
d2hpY2ggZG9lcyBkaXJlY3QgVGVncmEKPiBQTUMgYWNjZXNzIGR1cmluZyBjbGtfb3BzIGFuZCB0
aGVzZSBQTUMgcmVnaXN0ZXIgcmVhZCBhbmQgd3JpdGUgYWNjZXNzCj4gd2lsbCBub3QgaGFwcGVu
IHdoZW4gUE1DIGlzIGluIHNlY3VyZSBtb2RlLgo+IAo+IEFueSBkaXJlY3QgUE1DIHJlZ2lzdGVy
IGFjY2VzcyBmcm9tIG5vbi1zZWN1cmUgd29ybGQgd2lsbCBub3QgZ28KPiB0aHJvdWdoIGFuZCBh
bGwgdGhlIFBNQyBjbG9ja3MgYW5kIGJsaW5rIGNvbnRyb2wgYXJlIGRvbmUgaW4gVGVncmEgUE1D
Cj4gZHJpdmVyIHdpdGggUE1DIGFzIGNsb2NrIHByb3ZpZGVyLgo+IAo+IFRoaXMgcGF0Y2ggcmVt
b3ZlcyB0ZWdyYV9wbWNfY2xrX2luaXQgYWxvbmcgd2l0aCBjb3JyZXNwb25kaW5nIGNsayBpZHMK
PiBmcm9tIFRlZ3JhIGNsb2NrIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTb3dqYW55YSBL
b21hdGluZW5pIDxza29tYXRpbmVuaUBudmlkaWEuY29tPgo+IC0tLQoKW3NuaXBdCgo+IEBAIC0x
MjMwLDkgKzEyMjIsNiBAQCBzdGF0aWMgc3RydWN0IHRlZ3JhX2Nsa19pbml0X3RhYmxlIGluaXRf
dGFibGVbXSBfX2luaXRkYXRhID0gewoKPiAgCXsgVEVHUkEzMF9DTEtfUExMX0EsIFRFR1JBMzBf
Q0xLX0NMS19NQVgsIDU2NDQ4MDAwMCwgMSB9LAo+ICAJeyBURUdSQTMwX0NMS19QTExfQV9PVVQw
LCBURUdSQTMwX0NMS19DTEtfTUFYLCAxMTI4OTYwMCwgMSB9LAo+ICAJeyBURUdSQTMwX0NMS19F
WFRFUk4xLCBURUdSQTMwX0NMS19QTExfQV9PVVQwLCAwLCAxIH0sCgpQZXJoYXBzIHRoZXNlIGNs
b2NrcyBkbyBub3QgbmVlZCB0byBiZSBhbHdheXMtZW5hYmxlZD8KCltzbmlwXQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
