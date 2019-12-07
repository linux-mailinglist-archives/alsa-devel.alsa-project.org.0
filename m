Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B482116AE6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:23:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF0B216AC;
	Mon,  9 Dec 2019 11:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF0B216AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887016;
	bh=8nXucXI6vsHdUyRZYHhH1T6ntwvz6ypmNj7vWewA8h8=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hnkh/bF1a1v6rzWuqsxBJGIqxSAO7cg0pvd54S3KeFxFs/ZjvKmuyTf6wXohBgp7z
	 5YzTaiXMY3Z3IWkLF0gOPF0iEBL22GAN4qnZgTT0mz3Zb09i1X0u4qLYLzXQTOyALC
	 O7EdWUsmVZLMtsnnrtVJfM6q3+xk/P/nQJvS7T9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A777F804B4;
	Mon,  9 Dec 2019 10:52:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1BF9F801F7; Sat,  7 Dec 2019 16:53:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 207C1F8010F
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 16:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207C1F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tKeXKLzI"
Received: by mail-lf1-x143.google.com with SMTP id y5so7531826lfy.7
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 07:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fH/Cb31jYEPGogb8f2+iaeg542opqKMOZ7lMxFJPQIw=;
 b=tKeXKLzIAcKFmF0Mwf1RVL7DQHzE0ICmG2H1a6v+QeY5aahYo7oHTXcTkzuWDZbx3X
 LnZUW1nHbMft634YXkFFWL3iqH423Id9IgQbEafXlLPaZBu4JT3/WxtRAJAhKWuL0koy
 ybKTwNU81xAi+WBpJ4RUnNE3oehiU8i30w1WYXu5D23XToZeb4Vg5cqzTqKosUmRjZoo
 pbBQKrW4Vr/1aZsdC03bT7LhqP8GmRYh2ZVDFo4OwHM4VGPjr8Ld9OGX7WZ+pxYVvfbf
 dgizH2AjvpiPQXN/YLwR12E6euKIo5IQh60x+6mb073znORRB5A5pzC7btNGVmySR7WG
 kIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fH/Cb31jYEPGogb8f2+iaeg542opqKMOZ7lMxFJPQIw=;
 b=E6psKLl94F4X27Ow+qvZamZXOoNTPmtdLJkgtfdh7OSwNo7LPknJvcgNSf26YU13tJ
 MD8lo2okMLdgroSAFDNAO9padcDARc6EO0xzU8mPkxlzejT6ueuk2WI8sH0do+N6MSee
 wBOEoBDp6ZooZebtWw5S1Q5g/ZVxPdzqd564UOPRlTRtsLULKcoh80VlATpMPgAFklj9
 zcL+Yuuy9riYev4XwW0hsdfWRfiRumIjJNy0f3dPWE3YxqES1umqrBiUaoFPFT+LLpfY
 Zilz4R+WjVvrFz+7ALYryIgZkYfBNsZD9v8gr9SpShqkHXVeQm3uRALOCBd6K7Fw8WYb
 JhwA==
X-Gm-Message-State: APjAAAWADFHzKDcc5XngyZh9e0hQnqbcJY+80ECoXrFnGRcfnOyqD1Uq
 1EoWyuLuo/YeF/xPFpbUmWWJ+GWe
X-Google-Smtp-Source: APXvYqwVVXkKdtSCHhcDsPC5obY0P8+ELH7kxpNBj912HH/ZsWUCjhrIqgJpy3Fn/wap8rKrgutUDQ==
X-Received: by 2002:a19:4901:: with SMTP id w1mr7061966lfa.56.1575734016840;
 Sat, 07 Dec 2019 07:53:36 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id l26sm914272lfj.59.2019.12.07.07.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 07:53:36 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-4-git-send-email-skomatineni@nvidia.com>
 <7cf4ff77-2f33-4ee5-0e09-5aa6aef3e8be@gmail.com>
 <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
Message-ID: <dc7a057a-0bed-0e6f-0987-edcfec47f867@gmail.com>
Date: Sat, 7 Dec 2019 18:53:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ad3a6743-4b36-fa25-9cc7-72803038ecc5@gmail.com>
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
Subject: Re: [alsa-devel] [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock
 registrations into PMC driver
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

MDcuMTIuMjAxOSAxODo0NywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDcuMTIuMjAx
OSAxNzoyOCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDA2LjEyLjIwMTkgMDU6NDgs
IFNvd2phbnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+IFRlZ3JhMjEwIGFuZCBwcmlvciBU
ZWdyYSBQTUMgaGFzIGNsa19vdXRfMSwgY2xrX291dF8yLCBjbGtfb3V0XzMgd2l0aAo+Pj4gbXV4
IGFuZCBnYXRlIGZvciBlYWNoIG9mIHRoZXNlIGNsb2Nrcy4KPj4+Cj4+PiBDdXJyZW50bHkgdGhl
c2UgUE1DIGNsb2NrcyBhcmUgcmVnaXN0ZXJlZCBieSBUZWdyYSBjbG9jayBkcml2ZXIgdXNpbmcK
Pj4+IGNsa19yZWdpc3Rlcl9tdXggYW5kIGNsa19yZWdpc3Rlcl9nYXRlIGJ5IHBhc3NpbmcgUE1D
IGJhc2UgYWRkcmVzcwo+Pj4gYW5kIHJlZ2lzdGVyIG9mZnNldHMgYW5kIFBNQyBwcm9ncmFtbWlu
ZyBmb3IgdGhlc2UgY2xvY2tzIGhhcHBlbnMKPj4+IHRocm91Z2ggZGlyZWN0IFBNQyBhY2Nlc3Mg
YnkgdGhlIGNsb2NrIGRyaXZlci4KPj4+Cj4+PiBXaXRoIHRoaXMsIHdoZW4gUE1DIGlzIGluIHNl
Y3VyZSBtb2RlIGFueSBkaXJlY3QgUE1DIGFjY2VzcyBmcm9tIHRoZQo+Pj4gbm9uLXNlY3VyZSB3
b3JsZCBkb2VzIG5vdCBnbyB0aHJvdWdoIGFuZCB0aGVzZSBjbG9ja3Mgd2lsbCBub3QgYmUKPj4+
IGZ1bmN0aW9uYWwuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBhZGRzIHRoZXNlIGNsb2NrcyByZWdpc3Ry
YXRpb24gd2l0aCBQTUMgYXMgYSBjbG9jayBwcm92aWRlcgo+Pj4gZm9yIHRoZXNlIGNsb2Nrcy4g
Y2xrX29wcyBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgZm9yIHRoZXNlIGNsb2Nrcwo+Pj4gdXNl
cyB0ZWdyYV9wbWNfcmVhZGwgYW5kIHRlZ3JhX3BtY193cml0ZWwgd2hpY2ggc3VwcG9ydHMgUE1D
IHByb2dyYW1taW5nCj4+PiBpbiBzZWN1cmUgbW9kZSBhbmQgbm9uLXNlY3VyZSBtb2RlLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFNvd2phbnlhIEtvbWF0aW5lbmkgPHNrb21hdGluZW5pQG52aWRp
YS5jb20+Cj4+PiAtLS0KPiAKPiBbc25pcF0KPiAKPj4+ICsKPj4+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNsa19vcHMgcG1jX2Nsa19nYXRlX29wcyA9IHsKPj4+ICsJLmlzX2VuYWJsZWQgPSBwbWNf
Y2xrX2lzX2VuYWJsZWQsCj4+PiArCS5lbmFibGUgPSBwbWNfY2xrX2VuYWJsZSwKPj4+ICsJLmRp
c2FibGUgPSBwbWNfY2xrX2Rpc2FibGUsCj4+PiArfTsKPj4KPj4gV2hhdCdzIHRoZSBiZW5lZml0
IG9mIHNlcGFyYXRpbmcgR0FURSBmcm9tIHRoZSBNVVg/Cj4+Cj4+IEkgdGhpbmsgaXQgY291bGQg
YmUgYSBzaW5nbGUgY2xvY2suCj4gCj4gQWNjb3JkaW5nIHRvIFRSTToKPiAKPiAxLiBHQVRFIGFu
ZCBNVVggYXJlIHNlcGFyYXRlIGVudGl0aWVzLgo+IAo+IDIuIEdBVEUgaXMgdGhlIHBhcmVudCBv
ZiBNVVggKHNlZSBQTUMncyBDTEtfT1VUIHBhdGhzIGRpYWdyYW0gaW4gVFJNKS4KPiAKPiAzLiBQ
TUMgZG9lc24ndCBnYXRlIEVYVFBFUklQSCBjbG9jayBidXQgY291bGQgImZvcmNlLWVuYWJsZSIg
aXQsIGNvcnJlY3Q/Cgo0LiBjbGtfbV9kaXYyLzQgYXJlIGludGVybmFsIFBNQyBPU0MgZGl2aWRl
cnMgYW5kIHRodXMgdGhlc2UgY2xvY2tzCnNob3VsZCBiZWxvbmcgdG8gUE1DLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
