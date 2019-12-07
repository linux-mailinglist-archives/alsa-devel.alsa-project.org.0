Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD42116AE3
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:22:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1660B16E0;
	Mon,  9 Dec 2019 11:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1660B16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886937;
	bh=VJ58fGu5o+0MP9DjxVVXetVP7NRLsIEAq5yHK5i+evc=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBR/CSBQAQ9VPEHEH0foEV4QTTTqqqxSRi+BECD6xI1J8jymWS2NAz7nr4Rk5Csxw
	 bvBQtuVbxqmD3KWCP197NxY8QTIeC6TNAc6bl9YqUMirhTmJpf+1zCDnRRlGWpZGm/
	 D5f3jDV4n29APk/P6o3oj+wfq0gZWGinvUXkPYuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D175F8049E;
	Mon,  9 Dec 2019 10:52:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97D69F80108; Sat,  7 Dec 2019 16:04:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37346F80108
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 16:04:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37346F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F6+K7JPq"
Received: by mail-lj1-x244.google.com with SMTP id s22so10802432ljs.7
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 07:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n8a+Wo0Uh6h7aFSS48D/6SstLsiUjh8g7OoKXGq8H00=;
 b=F6+K7JPqGvnQPCj28mwmw64tWflHmRmyDRI8MKlZXjoZzQqgZFfel3SZ4iaYF1AlRg
 se5iYaUtMXNNsTEwCwgnyVAZHCG6BoMefsmABDu8mCKuq44oE48Doj9GUhZ3RZNXZZsn
 Os2c9bNKrc4rUcmbifRJYrZags2606oCFJDSI8PgmOVo3lDwHUmPwvkw2emjqpxUmiQi
 asRj4d90tqVR976m0ftDXNrJPP/8dmeIe6JHHVdHru6kwcFXBSm0/NQtsIWpWnzlDNYI
 gUln+JQDYnkTtJjvWPat3QEQan9Ma7wsD7UKvsevW1SMhLQWs3/5cOXDVnEa+8azxRuS
 k5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8a+Wo0Uh6h7aFSS48D/6SstLsiUjh8g7OoKXGq8H00=;
 b=Dv7ebiA2cXRe77GW5u2jfsApm7dz7ahTBQCxsWICgYcqbb8CrnYSGZcNt/8VNw/dhm
 Dxd3QuDKgS6HvFSlzfcU5Q071jOmpOlRL5GK2qmSBYXXlr9GoNs+ngDm+x2ZbaB0ynST
 cUw4UpiTlkR28rDEFLeIs2XaKaHQhjbxLpheogNO/ANh0g0YfMS7Ruuya4/L3jdoyntb
 FIyfVq2P8RU0snkcpY1nzIZVvUFNwSqt+lhTeW15N+OWPdpd3IqeZ3cRUrJpK3dGbowi
 vbjcLAFoeYXEA7yLLCgOVtV/huULaCCeMOxZH6m8EA/6lcNpxuuB+TixsRrmaeTl2zij
 LfSw==
X-Gm-Message-State: APjAAAUF/Pb22dqgR/w9Gxa/rmF7vK15nNMo+wJcrpynrptFd1GzBDC2
 auUjihqS3JKFxy/SGl5QJzfJmjEc
X-Google-Smtp-Source: APXvYqx8nqzLijIPm81DFDtG10vReYQUtoGSR6Xe9cy7lZcn9qwS9Z9YNCeclJLvekppT55wIsUI8Q==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr11710121ljg.93.1575731056973; 
 Sat, 07 Dec 2019 07:04:16 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id z13sm8188887ljh.21.2019.12.07.07.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 07:04:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
 <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
 <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
Message-ID: <5938df22-2474-3950-fc33-3e19cbf3da9c@gmail.com>
Date: Sat, 7 Dec 2019 18:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
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

MDcuMTIuMjAxOSAxNzo0MywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDcuMTIuMjAx
OSAxNzozMywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4+IDA2LjEyLjIwMTkgMDU6NDgs
IFNvd2phbnlhIEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+IEN1cnJlbnQgVGVncmEgY2xvY2sg
ZHJpdmVyIHJlZ2lzdGVycyBQTUMgY2xvY2tzIGNsa19vdXRfMSwgY2xrX291dF8yLAo+Pj4gY2xr
X291dF8zIGFuZCBibGluayBvdXRwdXQgaW4gdGVncmFfcG1jX2luaXQoKSB3aGljaCBkb2VzIGRp
cmVjdCBUZWdyYQo+Pj4gUE1DIGFjY2VzcyBkdXJpbmcgY2xrX29wcyBhbmQgdGhlc2UgUE1DIHJl
Z2lzdGVyIHJlYWQgYW5kIHdyaXRlIGFjY2Vzcwo+Pj4gd2lsbCBub3QgaGFwcGVuIHdoZW4gUE1D
IGlzIGluIHNlY3VyZSBtb2RlLgo+Pj4KPj4+IEFueSBkaXJlY3QgUE1DIHJlZ2lzdGVyIGFjY2Vz
cyBmcm9tIG5vbi1zZWN1cmUgd29ybGQgd2lsbCBub3QgZ28KPj4+IHRocm91Z2ggYW5kIGFsbCB0
aGUgUE1DIGNsb2NrcyBhbmQgYmxpbmsgY29udHJvbCBhcmUgZG9uZSBpbiBUZWdyYSBQTUMKPj4+
IGRyaXZlciB3aXRoIFBNQyBhcyBjbG9jayBwcm92aWRlci4KPj4+Cj4+PiBUaGlzIHBhdGNoIHJl
bW92ZXMgdGVncmFfcG1jX2Nsa19pbml0IGFsb25nIHdpdGggY29ycmVzcG9uZGluZyBjbGsgaWRz
Cj4+PiBmcm9tIFRlZ3JhIGNsb2NrIGRyaXZlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTb3dq
YW55YSBLb21hdGluZW5pIDxza29tYXRpbmVuaUBudmlkaWEuY29tPgo+Pj4gLS0tCj4+Cj4+IFtz
bmlwXQo+Pgo+Pj4gQEAgLTEyMzAsOSArMTIyMiw2IEBAIHN0YXRpYyBzdHJ1Y3QgdGVncmFfY2xr
X2luaXRfdGFibGUgaW5pdF90YWJsZVtdIF9faW5pdGRhdGEgPSB7Cj4+Cj4+PiAgCXsgVEVHUkEz
MF9DTEtfUExMX0EsIFRFR1JBMzBfQ0xLX0NMS19NQVgsIDU2NDQ4MDAwMCwgMSB9LAo+Pj4gIAl7
IFRFR1JBMzBfQ0xLX1BMTF9BX09VVDAsIFRFR1JBMzBfQ0xLX0NMS19NQVgsIDExMjg5NjAwLCAx
IH0sCj4+PiAgCXsgVEVHUkEzMF9DTEtfRVhURVJOMSwgVEVHUkEzMF9DTEtfUExMX0FfT1VUMCwg
MCwgMSB9LAo+Pgo+PiBQZXJoYXBzIHRoZXNlIGNsb2NrcyBkbyBub3QgbmVlZCB0byBiZSBhbHdh
eXMtZW5hYmxlZD8KPj4KPj4gW3NuaXBdCj4+Cj4gCj4gQWxzbywgRVhURVJOMSBwYXJlbnQgY29u
ZmlndXJhdGlvbiBzaG91bGQgYmUgbW92ZWQgdG8gdGhlIGF1ZGlvCj4gZHJpdmVyL2RldmljZS10
cmVlIGFzIHdlbGwuCgpBaCwgSSBtaXNzZWQgdGhhdCBpdCdzIGRvbmUgaW4gdGhlIHBhdGNoICMx
MC4KCj4gTWF5YmUgaXQgZXZlbiBtYWtlcyBzZW5zZSB0byBtb3ZlIHRoZSB3aG9sZSBjb25maWd1
cmF0aW9uLCBpbmNsdWRpbmcKPiBQTExBLiBJIGRvbid0IHNlZSB3aHkgY2xrIGRyaXZlciBuZWVk
IHRvIGRvIHNvbWV0aGluZyBmb3IgdGhlIGF1ZGlvIGRyaXZlci4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
