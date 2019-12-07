Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AA116ADC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212C716D9;
	Mon,  9 Dec 2019 11:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212C716D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886860;
	bh=YvfiztcLzYj7GOewjOtQu+1je2iQlm5Iy8QTVclacRU=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tuGgMKLf1Dg7c3BWTeTgRyusiiRoMWBipbcUZBgYyirMkTSh9prDHHux44WSkQcWf
	 /noZXaBWnD62pLuRYfwS2cEIm15EF+sHSqWUsxVJz35BQW4LWEXrbTSG2WtQIs5NKF
	 xy+tn91A/IDl+XSxwftm5/ziTqLMIBT+d8ZSEAP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABBD0F80480;
	Mon,  9 Dec 2019 10:52:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7191F801F7; Sat,  7 Dec 2019 15:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F0CF8010F
 for <alsa-devel@alsa-project.org>; Sat,  7 Dec 2019 15:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F0CF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JEXsRsUj"
Received: by mail-lj1-x244.google.com with SMTP id k8so10763114ljh.5
 for <alsa-devel@alsa-project.org>; Sat, 07 Dec 2019 06:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M4178m5wqKcjur6WZ9VbgwAy1j68KdshPPjyIN/6tPs=;
 b=JEXsRsUjV2g10sr0Ks0k3FUw9U5Tv97+5vrfYHJZOIcNSgd6M+N5vTtgaCHX3c8/8a
 +oNhdRKUkWMzF/WSTpiuN4ecPb7ElQcmbs2mNsXjcnxARF1D/yvdqxmsTYRUbn6iq9EX
 QWPn4LtwsAJt2utSabQVTf8KbxeHmW61Q93SPmk9gzIFH8IyCqeH3royTvXmlDHUqMiX
 JXzhDznChEN8g9jgpuJyTjWuW3g57aSUeC/E3MrGn7Z+ZoDte3AzDVtEH8M0HlO9Mp4i
 AtmyKD5OcVxL7iXM/75BCdU8CI9/SZEArBOGMMhwzOagt8LV3x/rei58gUrWU05odAD8
 y0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M4178m5wqKcjur6WZ9VbgwAy1j68KdshPPjyIN/6tPs=;
 b=kMQhih8puq/igCBp/14WibNb4ShYWDybtejKbbvsbK9WLpdUbcEvDkEZQw4aUqmt2K
 K6fYmQoUVfKSet2ZlODLirLscv8L8vgreS9r7kcRx6LU7yk1mTH+DoexrFiUVP/bdasH
 E/tGlj6I5ENxpaBwsqHw1+oejvVFT5oT35ZXsQufwguosyxg4uK4NBELgwGlITXmfoGF
 NS2aq+2V0lBz4vI/j3fpQi7kQne+jSC/7u8VaN29f4B9hnxZDW5jsTC/CESyc2yASCw6
 xvnhWJ0S0e2YLjEHx3OzvhgNQeDvrSmYIDPQtovSxaO01DaYVcrgcAoRgie3g/BT4G1i
 60Gg==
X-Gm-Message-State: APjAAAV+a8CK56cDbzpLfiqqMUCZcEpdR3qiyC4zsIXcQwCLxUlmdr1A
 r4s2ZjjNbNiEjxpnwK7uZENoj4la
X-Google-Smtp-Source: APXvYqyqrq36nLJ9lM39hAYXIi5EgLPNDsEijYW1ZwyxcXInMqQSgLCoGiMV6ulTtSVLZFqJpT8q6Q==
X-Received: by 2002:a2e:8e72:: with SMTP id t18mr2688107ljk.132.1575729830747; 
 Sat, 07 Dec 2019 06:43:50 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id w2sm8155909ljo.61.2019.12.07.06.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2019 06:43:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
 <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
Message-ID: <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
Date: Sat, 7 Dec 2019 17:43:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
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

MDcuMTIuMjAxOSAxNzozMywgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDYuMTIuMjAx
OSAwNTo0OCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+PiBDdXJyZW50IFRlZ3Jh
IGNsb2NrIGRyaXZlciByZWdpc3RlcnMgUE1DIGNsb2NrcyBjbGtfb3V0XzEsIGNsa19vdXRfMiwK
Pj4gY2xrX291dF8zIGFuZCBibGluayBvdXRwdXQgaW4gdGVncmFfcG1jX2luaXQoKSB3aGljaCBk
b2VzIGRpcmVjdCBUZWdyYQo+PiBQTUMgYWNjZXNzIGR1cmluZyBjbGtfb3BzIGFuZCB0aGVzZSBQ
TUMgcmVnaXN0ZXIgcmVhZCBhbmQgd3JpdGUgYWNjZXNzCj4+IHdpbGwgbm90IGhhcHBlbiB3aGVu
IFBNQyBpcyBpbiBzZWN1cmUgbW9kZS4KPj4KPj4gQW55IGRpcmVjdCBQTUMgcmVnaXN0ZXIgYWNj
ZXNzIGZyb20gbm9uLXNlY3VyZSB3b3JsZCB3aWxsIG5vdCBnbwo+PiB0aHJvdWdoIGFuZCBhbGwg
dGhlIFBNQyBjbG9ja3MgYW5kIGJsaW5rIGNvbnRyb2wgYXJlIGRvbmUgaW4gVGVncmEgUE1DCj4+
IGRyaXZlciB3aXRoIFBNQyBhcyBjbG9jayBwcm92aWRlci4KPj4KPj4gVGhpcyBwYXRjaCByZW1v
dmVzIHRlZ3JhX3BtY19jbGtfaW5pdCBhbG9uZyB3aXRoIGNvcnJlc3BvbmRpbmcgY2xrIGlkcwo+
PiBmcm9tIFRlZ3JhIGNsb2NrIGRyaXZlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU293amFueWEg
S29tYXRpbmVuaSA8c2tvbWF0aW5lbmlAbnZpZGlhLmNvbT4KPj4gLS0tCj4gCj4gW3NuaXBdCj4g
Cj4+IEBAIC0xMjMwLDkgKzEyMjIsNiBAQCBzdGF0aWMgc3RydWN0IHRlZ3JhX2Nsa19pbml0X3Rh
YmxlIGluaXRfdGFibGVbXSBfX2luaXRkYXRhID0gewo+IAo+PiAgCXsgVEVHUkEzMF9DTEtfUExM
X0EsIFRFR1JBMzBfQ0xLX0NMS19NQVgsIDU2NDQ4MDAwMCwgMSB9LAo+PiAgCXsgVEVHUkEzMF9D
TEtfUExMX0FfT1VUMCwgVEVHUkEzMF9DTEtfQ0xLX01BWCwgMTEyODk2MDAsIDEgfSwKPj4gIAl7
IFRFR1JBMzBfQ0xLX0VYVEVSTjEsIFRFR1JBMzBfQ0xLX1BMTF9BX09VVDAsIDAsIDEgfSwKPiAK
PiBQZXJoYXBzIHRoZXNlIGNsb2NrcyBkbyBub3QgbmVlZCB0byBiZSBhbHdheXMtZW5hYmxlZD8K
PiAKPiBbc25pcF0KPiAKCkFsc28sIEVYVEVSTjEgcGFyZW50IGNvbmZpZ3VyYXRpb24gc2hvdWxk
IGJlIG1vdmVkIHRvIHRoZSBhdWRpbwpkcml2ZXIvZGV2aWNlLXRyZWUgYXMgd2VsbC4KCk1heWJl
IGl0IGV2ZW4gbWFrZXMgc2Vuc2UgdG8gbW92ZSB0aGUgd2hvbGUgY29uZmlndXJhdGlvbiwgaW5j
bHVkaW5nClBMTEEuIEkgZG9uJ3Qgc2VlIHdoeSBjbGsgZHJpdmVyIG5lZWQgdG8gZG8gc29tZXRo
aW5nIGZvciB0aGUgYXVkaW8gZHJpdmVyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
