Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB2116AED
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:24:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3577C16D6;
	Mon,  9 Dec 2019 11:24:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3577C16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887094;
	bh=wT5RG8Ifaq1UNAYDsBIAI7kTJ+xZJIq3CFMOwi5D1l0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FRvVrCNy+towy2Fr/ToAepSR2R+cLhq4mRygcrCaxQ/YRCcw/c6X8u2fozeevm3Y2
	 Hdk+qywGEVbmZku1N1t/NyIgNjTifXadbeUZ6JygYBinau247i/ZqD8wW2e9waAyhS
	 1rWPat0LVB6Lkm5OaIykiuE8G0DnTaz0GVBe/kQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76DFFF804D9;
	Mon,  9 Dec 2019 10:52:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4124EF801F7; Sun,  8 Dec 2019 00:25:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0851F80108
 for <alsa-devel@alsa-project.org>; Sun,  8 Dec 2019 00:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0851F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m2e3DVoJ"
Received: by mail-lj1-x243.google.com with SMTP id 21so11582431ljr.0
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 15:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UYYclqI+qbEWxgjHzSQw1mRE8Z+HNZO1kpO5Dr5T5Zo=;
 b=m2e3DVoJEoIDL+VUAjilEa45HADkdtPQ5yqtDXIeKD7IyMxe7/l2p2UTMdO/G5ZSMh
 JV36MAs5NUacLjejDjRHiL0axTSr/l8rtQHgIJuPKBq+XXvn/lUFY5RhMhWjemyBinTW
 Fj0+9DwxlchlD2NRJ9WShFXNHXwrm1QW+DbAIx0sBwT7H4QM/slfpRGTbL79Oa7+bnFC
 T/DkK5f9SCOVtQa4cm87GQ1blSqIogDXcGdoZtTh6c2eQzNKdG0Q/fiKwH4qsx1BaPpH
 3bbQlJ3G8WFeqPWU8uCcaksknWRyWBhapQjk/AfaQbxsfrbtluK4FDXqq8BOK9nYQKrZ
 aI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UYYclqI+qbEWxgjHzSQw1mRE8Z+HNZO1kpO5Dr5T5Zo=;
 b=rhyM1KaTUNWhEZoTHvNpvVlD2p5iPV1GD9KKZ35Pz0EEOFrLiVo6phL6wp5eA0+F2O
 16OZkqHvrGFerGInEeaHCINfFipnVIHrtM9OVs55t8XQd7kQmKg5yqLSbQ+CIFEJHqhV
 Kac+ZbE3+p814DHBs20MFGFtoGjALuqeXB7DLWrdrkiz/lY9ZoOVtPeovR4TK+BJ0vWw
 JBdib5D0gO+gdZsC89ePQoCgpmQAPwRdZJPAUAMzc5dgdr/SmFB3fx5yq3SSzkOpwc9Y
 XPzmqbx8YX1GkPgsBpwiuKPKAHEECxIFMPlklKEajpNKERwLyXHrosE0wH9/e4IWB090
 jjbA==
X-Gm-Message-State: APjAAAXqFbdq2dW4Z1sNv9M9CmFRaOYcgrEqkJuuyJcVR15ykAceKprx
 qmQ4GrmvmlWgiZSlICYUPuNDoRBa
X-Google-Smtp-Source: APXvYqyhVxrvLXBCuvNVTxG/3XJJJA+cgc3K90h56oHZ1wvKmB/jS+aOEEXAQQRzF0rA1zwaXQqVmA==
X-Received: by 2002:a2e:9bd9:: with SMTP id w25mr10729689ljj.212.1575761095167; 
 Sat, 07 Dec 2019 15:24:55 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id p26sm8604243lfh.64.2019.12.07.15.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 15:24:54 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
 <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
 <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
 <5938df22-2474-3950-fc33-3e19cbf3da9c@gmail.com>
 <c81ccd45-781e-0fce-4f20-65281b8c6119@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f8188f0d-ec7e-7d4a-f977-16273b594838@gmail.com>
Date: Sun, 8 Dec 2019 02:24:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c81ccd45-781e-0fce-4f20-65281b8c6119@nvidia.com>
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

MDcuMTIuMjAxOSAyMjozNSwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzcvMTkgNzowNCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwNy4xMi4yMDE5IDE3
OjQzLCBEbWl0cnkgT3NpcGVua28g0L/QuNGI0LXRgjoKPj4+IDA3LjEyLjIwMTkgMTc6MzMsIERt
aXRyeSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+IDA2LjEyLjIwMTkgMDU6NDgsIFNvd2phbnlh
IEtvbWF0aW5lbmkg0L/QuNGI0LXRgjoKPj4+Pj4gQ3VycmVudCBUZWdyYSBjbG9jayBkcml2ZXIg
cmVnaXN0ZXJzIFBNQyBjbG9ja3MgY2xrX291dF8xLCBjbGtfb3V0XzIsCj4+Pj4+IGNsa19vdXRf
MyBhbmQgYmxpbmsgb3V0cHV0IGluIHRlZ3JhX3BtY19pbml0KCkgd2hpY2ggZG9lcyBkaXJlY3Qg
VGVncmEKPj4+Pj4gUE1DIGFjY2VzcyBkdXJpbmcgY2xrX29wcyBhbmQgdGhlc2UgUE1DIHJlZ2lz
dGVyIHJlYWQgYW5kIHdyaXRlIGFjY2Vzcwo+Pj4+PiB3aWxsIG5vdCBoYXBwZW4gd2hlbiBQTUMg
aXMgaW4gc2VjdXJlIG1vZGUuCj4+Pj4+Cj4+Pj4+IEFueSBkaXJlY3QgUE1DIHJlZ2lzdGVyIGFj
Y2VzcyBmcm9tIG5vbi1zZWN1cmUgd29ybGQgd2lsbCBub3QgZ28KPj4+Pj4gdGhyb3VnaCBhbmQg
YWxsIHRoZSBQTUMgY2xvY2tzIGFuZCBibGluayBjb250cm9sIGFyZSBkb25lIGluIFRlZ3JhIFBN
Qwo+Pj4+PiBkcml2ZXIgd2l0aCBQTUMgYXMgY2xvY2sgcHJvdmlkZXIuCj4+Pj4+Cj4+Pj4+IFRo
aXMgcGF0Y2ggcmVtb3ZlcyB0ZWdyYV9wbWNfY2xrX2luaXQgYWxvbmcgd2l0aCBjb3JyZXNwb25k
aW5nIGNsayBpZHMKPj4+Pj4gZnJvbSBUZWdyYSBjbG9jayBkcml2ZXIuCj4+Pj4+Cj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFNvd2phbnlhIEtvbWF0aW5lbmkgPHNrb21hdGluZW5pQG52aWRpYS5jb20+
Cj4+Pj4+IC0tLQo+Pj4+IFtzbmlwXQo+Pj4+Cj4+Pj4+IEBAIC0xMjMwLDkgKzEyMjIsNiBAQCBz
dGF0aWMgc3RydWN0IHRlZ3JhX2Nsa19pbml0X3RhYmxlCj4+Pj4+IGluaXRfdGFibGVbXSBfX2lu
aXRkYXRhID0gewo+Pj4+PiDCoMKgwqDCoMKgIHsgVEVHUkEzMF9DTEtfUExMX0EsIFRFR1JBMzBf
Q0xLX0NMS19NQVgsIDU2NDQ4MDAwMCwgMSB9LAo+Pj4+PiDCoMKgwqDCoMKgIHsgVEVHUkEzMF9D
TEtfUExMX0FfT1VUMCwgVEVHUkEzMF9DTEtfQ0xLX01BWCwgMTEyODk2MDAsIDEgfSwKPj4+Pj4g
wqDCoMKgwqDCoCB7IFRFR1JBMzBfQ0xLX0VYVEVSTjEsIFRFR1JBMzBfQ0xLX1BMTF9BX09VVDAs
IDAsIDEgfSwKPj4+PiBQZXJoYXBzIHRoZXNlIGNsb2NrcyBkbyBub3QgbmVlZCB0byBiZSBhbHdh
eXMtZW5hYmxlZD8KPj4+Pgo+Pj4+IFtzbmlwXQo+Pj4+Cj4+PiBBbHNvLCBFWFRFUk4xIHBhcmVu
dCBjb25maWd1cmF0aW9uIHNob3VsZCBiZSBtb3ZlZCB0byB0aGUgYXVkaW8KPj4+IGRyaXZlci9k
ZXZpY2UtdHJlZSBhcyB3ZWxsLgo+PiBBaCwgSSBtaXNzZWQgdGhhdCBpdCdzIGRvbmUgaW4gdGhl
IHBhdGNoICMxMC4KPiBZZXMgaXRzIGRvbmUgaW4gUGF0Y2gjMTAKPj4KPj4+IE1heWJlIGl0IGV2
ZW4gbWFrZXMgc2Vuc2UgdG8gbW92ZSB0aGUgd2hvbGUgY29uZmlndXJhdGlvbiwgaW5jbHVkaW5n
Cj4+PiBQTExBLiBJIGRvbid0IHNlZSB3aHkgY2xrIGRyaXZlciBuZWVkIHRvIGRvIHNvbWV0aGlu
ZyBmb3IgdGhlIGF1ZGlvCj4+PiBkcml2ZXIuCj4gCj4gQ3VycmVudCBBU29DIGRyaXZlciBhbHJl
YWR5IHRha2VzIGNhcmUgb2YgUExMQSByYXRlIGFuZCBlbmFibGVzLgo+IAo+IFNvIFBMTEEgaW5p
dCBjYW4gYmUgcmVtb3ZlZCBmcm9tIGNsb2NrIGRyaXZlciB0b28uIEkgZGlkbid0IHdlbnQgdGhy
b3VnaAo+IGNvbXBsZXRlIGF1ZGlvIGRyaXZlciB0byBiZSBjb25maWRlbnQgdG8gcmVtb3ZlIHRo
aXMuCj4gCj4gQnV0IFBMTEEgaXMgbmVlZGVkIGZvciBpMnMgY2xvY2sgYWxzbyBhbmQgY3VycmVu
dGx5IEkyUyBkcml2ZXIgdGFrZXMKPiBjYXJlIG9mIG9ubHkgSTJTIGNsb2NrIHJhdGUgdXNpbmcg
UExMQSBhcyBwYXJlbnQgc2V0IGJ5IGNsb2NrIGRyaXZlciBhbmQKPiBjbG9jayBkcml2ZXIgZW5h
YmxlcyBQTExBIGVhcmxpZXIgdG8gaGF2ZSBpdCByZWFkeSBieSB0aGUgdGltZSBib3RoIEkyUwo+
IGRyaXZlciBhbmQgQVNvQyBkcml2ZXIgLgpJMlMgY291bGQgdXNlIGFzc2lnbmVkLWNsb2Nrcywg
YnV0IHByb2JhYmx5IGl0J3Mgbm90IHJlYWxseSBuZWNlc3NhcnkKYW5kIHByZWRlZmluZWQgY29u
ZmlndXJhdGlvbiBpbiB0aGUgY2xrIGRyaXZlciBpcyBnb29kIGVub3VnaC4KCkF0IGxlYXN0IFBM
TEEgZG9lc24ndCBuZWVkIHRvIGJlIGFsd2F5cy1lbmFibGVkIHNpbmNlIGF1ZGlvIGRyaXZlcnMK
ZW5hYmxlIGl0IHdoZW4gbmVjZXNzYXJ5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
