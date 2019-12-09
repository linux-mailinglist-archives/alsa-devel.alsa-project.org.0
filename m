Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4C8118075
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29A621681;
	Tue, 10 Dec 2019 07:29:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29A621681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959433;
	bh=o1c7hwD122g8+1JAf23hHm9vL0s9BEUyG2UeVg688ms=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZhZauU9XucCow5G7UbnKxkEXoEwO1je5EOKR+XMs0dVN96uPEBrJQXr1Yg3zIu+1
	 YOQ2iTrhwXjGygcpFlqsWaiUtiqfGDSaSKXnekQ+fgc36sgfRJElzmHQR5YHTxHELR
	 sFYzakFfTwIA30HFicgpzsktM0fQpIBtpt3tyKRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E48A1F80255;
	Tue, 10 Dec 2019 07:28:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5C26F80234; Mon,  9 Dec 2019 21:06:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52FB8F800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 21:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52FB8F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oZPp2x0K"
Received: by mail-lf1-x144.google.com with SMTP id n12so11758714lfe.3
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 12:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u/GIJzR3wCJLmedQ7wGRBS+zeddea2lYVEojwPiD6Yg=;
 b=oZPp2x0KYxbPwBtd9Bz9vftSNS82Y5FinyxDJCnDx2uNsfnPkXAhPTKTe3j4NpZ5Cs
 p+KWi1//D2a/TJnpwe1IwmXq2bCL3BtSOBGNOuWrixen25yxv/VrPaYzpSiDDazdKx8C
 hRvR8g73NRKSpNSRjkvDUYbmEmap789FiQBh2AhZFR7Ec+BkGxl/DOIroAUK6KU/p5up
 lHYK0ov6a5WB8dy1k59kJR0Dc7T2F60lRib16DTSmBGXL/u3p+JIFivbd7mcJDUe4i4p
 EgiIB9X4QPwJZUoDNjWyeq30+2Oz1n3+BGLsplQPOhkESvwZawjHzJJsiqjNL/saRKXl
 s9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/GIJzR3wCJLmedQ7wGRBS+zeddea2lYVEojwPiD6Yg=;
 b=E20DP+YwT5tRRkw1yLdfirwX7e/HqzXiKBrW6XD3uR1WJVQQHjKnxCwDnJkiBTkTvE
 UkNiXn+RFbKgcEeC739iv5eDQyN/amLcvPq1GBD3CnVWZw9C88o5YlBsWKgxqbCiIFPV
 jvanNCxs+nB6xvX/bc9DjlGNMa6gbMfQs9FtprLlFaJvf3EgrY9Mxii8NJu/jF+6rkmV
 AwsnHzRrqi53iagFtc9XjLQCZS/JZ0Msh4xbfOgd/nIKcNLWCeRnoFIXAmfzxRuN4DGq
 QO7M2cL7wZ0kb3Ib2zLC44qbOPyO4ZcvDiKE+J7/Zk8D2k21LC+VJIx1rYtiLM1bXNEU
 3w1Q==
X-Gm-Message-State: APjAAAXa7cKZkWbOQ7loS/Q+gC4l0tyGSH7je3Y22ifSfl+q0dlWihzG
 7B2J82YdTlTmT7O/oBpPvkAl71il
X-Google-Smtp-Source: APXvYqzr/+Nhv/yjlchThUWzU8Ials6Sj/mgzcKHAB5uF8w2Nk+cbzB9kVAwf3QSc6wMaPML/Ctokw==
X-Received: by 2002:a19:784:: with SMTP id 126mr10095957lfh.191.1575922003500; 
 Mon, 09 Dec 2019 12:06:43 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id m11sm202649lfj.89.2019.12.09.12.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 12:06:42 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-9-git-send-email-skomatineni@nvidia.com>
 <0ce2e83b-800c-da1e-7a3c-3cf1427cfe20@gmail.com>
 <2eeceabe-b5f0-6f9e-ff8c-4ac6167b7cc3@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5d26e32c-a346-4d42-9872-840964512144@gmail.com>
Date: Mon, 9 Dec 2019 23:06:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2eeceabe-b5f0-6f9e-ff8c-4ac6167b7cc3@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Dec 2019 07:28:27 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: Re: [alsa-devel] [PATCH v3 08/15] ASoC: tegra: Add audio mclk
 control through clk_out_1 and extern1
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

MDcuMTIuMjAxOSAyMjoyMCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzcvMTkgNjo1OCBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiAwNi4xMi4yMDE5IDA1
OjQ4LCBTb3dqYW55YSBLb21hdGluZW5pINC/0LjRiNC10YI6Cj4+PiBDdXJyZW50IEFTb0MgZHJp
dmVyIHVzZXMgZXh0ZXJuMSBhcyBjZGV2MSBjbG9jayBmcm9tIFRlZ3JhMzAgb253YXJkcwo+Pj4g
dGhyb3VnaCBkZXZpY2UgdHJlZS4KPj4+Cj4+PiBBY3R1YWwgYXVkaW8gbWNsayBpcyBjbGtfb3V0
XzEgYW5kIHRvIHVzZSBQTExBIGZvciBtY2xrIHJhdGUgY29udHJvbCwKPj4+IG5lZWQgdG8gY2xr
X291dF8xX211eCBwYXJlbnQgdG8gZXh0ZXJuMSBhbmQgZXh0ZXJuMSBwYXJlbnQgdG8gUExMQV9P
VVQwLgo+Pj4KPj4+IEN1cnJlbnRseSBUZWdyYSBjbG9jayBkcml2ZXIgaW5pdCBzZXRzIHRoZSBw
YXJlbnRzIGFuZCBlbmFibGVzIGJvdGgKPj4+IGNsa19vdXRfMSBhbmQgZXh0ZXJuMSBjbG9ja3Mu
IEJ1dCB0aGVzZSBjbG9ja3MgcGFyZW50IGFuZCBlbmFibGVzIHNob3VsZAo+Pj4gYmUgY29udHJv
bGxlZCBieSBBU29DIGRyaXZlci4KPj4+Cj4+PiBDbG9jayBwYXJlbnRzIGNhbiBiZSBzcGVjaWZp
ZWQgaW4gZGV2aWNlIHRyZWUgdXNpbmcgYXNzaWduZWQtY2xvY2tzCj4+PiBhbmQgYXNzaWduZWQt
Y2xvY2stcGFyZW50cy4KPj4+Cj4+PiBUbyBlbmFibGUgYXVkaW8gbWNsaywgYm90aCBjbGtfb3V0
XzEgYW5kIGV4dGVybjEgY2xvY2tzIG5lZWQgdG8gYmUKPj4+IGVuYWJsZWQuCj4+Pgo+Pj4gVGhp
cyBwYXRjaCBjb25maWd1cmVzIHBhcmVudHMgZm9yIGNsa19vdXRfMSBhbmQgZXh0ZXJuMSBjbG9j
a3MgaWYgZGV2aWNlCj4+PiB0cmVlIGRvZXMgbm90IHNwZWNpZnkgY2xvY2sgcGFyZW50cyBpbm9y
ZGVyIHRvIHN1cHBvcnQgb2xkIGRldmljZSB0cmVlCj4+PiBhbmQgY29udHJvbHMgbWNsayB1c2lu
ZyBib3RoIGNsa19vdXRfMSBhbmQgZXh0ZXJuMSBjbG9ja3MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogU293amFueWEgS29tYXRpbmVuaSA8c2tvbWF0aW5lbmlAbnZpZGlhLmNvbT4KPj4+IC0tLQo+
Pj4gwqAgc291bmQvc29jL3RlZ3JhL3RlZ3JhX2Fzb2NfdXRpbHMuYyB8IDY2Cj4+PiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgc291bmQvc29jL3RlZ3JhL3Rl
Z3JhX2Fzb2NfdXRpbHMuaCB8wqAgMSArCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2Vy
dGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RlZ3JhL3RlZ3JhX2Fzb2Nf
dXRpbHMuYwo+Pj4gYi9zb3VuZC9zb2MvdGVncmEvdGVncmFfYXNvY191dGlscy5jCj4+PiBpbmRl
eCA1MzZhNTc4ZTk1MTIuLjhlM2EzNzQwZGY3YyAxMDA2NDQKPj4+IC0tLSBhL3NvdW5kL3NvYy90
ZWdyYS90ZWdyYV9hc29jX3V0aWxzLmMKPj4+ICsrKyBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYV9h
c29jX3V0aWxzLmMKPj4+IEBAIC02MCw2ICs2MCw3IEBAIGludCB0ZWdyYV9hc29jX3V0aWxzX3Nl
dF9yYXRlKHN0cnVjdAo+Pj4gdGVncmFfYXNvY191dGlsc19kYXRhICpkYXRhLCBpbnQgc3JhdGUs
Cj4+PiDCoMKgwqDCoMKgIGRhdGEtPnNldF9tY2xrID0gMDsKPj4+IMKgIMKgwqDCoMKgwqAgY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsa19jZGV2MSk7Cj4+PiArwqDCoMKgIGNsa19kaXNh
YmxlX3VucHJlcGFyZShkYXRhLT5jbGtfZXh0ZXJuMSk7Cj4+PiDCoMKgwqDCoMKgIGNsa19kaXNh
YmxlX3VucHJlcGFyZShkYXRhLT5jbGtfcGxsX2Ffb3V0MCk7Cj4+PiDCoMKgwqDCoMKgIGNsa19k
aXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtfcGxsX2EpOwo+Pj4gwqAgQEAgLTg5LDYgKzkwLDE0
IEBAIGludCB0ZWdyYV9hc29jX3V0aWxzX3NldF9yYXRlKHN0cnVjdAo+Pj4gdGVncmFfYXNvY191
dGlsc19kYXRhICpkYXRhLCBpbnQgc3JhdGUsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGVycjsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gwqAgK8KgwqDCoCBpZiAoIUlTX0VSUl9PUl9OVUxM
KGRhdGEtPmNsa19leHRlcm4xKSkgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGVyciA9IGNsa19wcmVw
YXJlX2VuYWJsZShkYXRhLT5jbGtfZXh0ZXJuMSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGVy
cikgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkYXRhLT5kZXYsICJDYW4n
dCBlbmFibGUgZXh0ZXJuMTogJWRcbiIsIGVycik7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gZXJyOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+ICvCoMKgwqAgfQo+Pj4gKwo+
Pj4gwqDCoMKgwqDCoCBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoZGF0YS0+Y2xrX2NkZXYxKTsK
Pj4+IMKgwqDCoMKgwqAgaWYgKGVycikgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIo
ZGF0YS0+ZGV2LCAiQ2FuJ3QgZW5hYmxlIGNkZXYxOiAlZFxuIiwgZXJyKTsKPj4+IEBAIC0xMDks
NiArMTE4LDcgQEAgaW50IHRlZ3JhX2Fzb2NfdXRpbHNfc2V0X2FjOTdfcmF0ZShzdHJ1Y3QKPj4+
IHRlZ3JhX2Fzb2NfdXRpbHNfZGF0YSAqZGF0YSkKPj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4+
IMKgIMKgwqDCoMKgwqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsa19jZGV2MSk7Cj4+
PiArwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtfZXh0ZXJuMSk7Cj4+PiDC
oMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtfcGxsX2Ffb3V0MCk7Cj4+
PiDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtfcGxsX2EpOwo+Pj4g
wqAgQEAgLTE0Miw2ICsxNTIsMTQgQEAgaW50IHRlZ3JhX2Fzb2NfdXRpbHNfc2V0X2FjOTdfcmF0
ZShzdHJ1Y3QKPj4+IHRlZ3JhX2Fzb2NfdXRpbHNfZGF0YSAqZGF0YSkKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoCArwqDCoMKgIGlmICgh
SVNfRVJSX09SX05VTEwoZGF0YS0+Y2xrX2V4dGVybjEpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
ZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKGRhdGEtPmNsa19leHRlcm4xKTsKPj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoZXJyKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRh
dGEtPmRldiwgIkNhbid0IGVuYWJsZSBleHRlcm4xOiAlZFxuIiwgZXJyKTsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8Kg
wqDCoCB9Cj4+IFdoeSB0aGlzIGlzIG5lZWRlZCBnaXZlbiB0aGF0IGNsa19leHRlcm4xIGlzIGVp
dGhlciBhIGNoaWxkIG9mIE1DTEsgb3IKPj4gTUNMSyBpdHNlbGYgKG9uIFQyMCk/IFRoZSBjaGls
ZCBjbG9ja3MgYXJlIGVuYWJsZWQgd2hlbiB0aGUgcGFyZW50IGlzCj4+IGVuYWJsZWQuCj4gCj4g
Rm9yIFQzMCBhbmQgbGF0ZXIsIGNsa19leHRlcm4xIGlzIG9uZSBvZiB0aGUgc291cmNlIGZvciBj
bGtfb3V0XzFfbXV4Lgo+IGNsa19leHRlcm4xIGlzIGluIENBUiBhbmQgaXQgaGFzIGl0cyBvd24g
Z2F0ZSBhbmQgbXV4Lgo+IAo+IEFzIGF1ZGlvIG1jbGsgcmVsYXRlZCBjbG9ja3MgKGNsa19vdXRf
MSwgY2xrX291dF8xX211eCwgYW5kIGV4dGVybjEpIGFyZQo+IG1vdmVkIGludG8gQVNvQyBkcml2
ZXIgZnJvbSBjbG9jayBkcml2ZXIKPiAKPiBuZWVkIHRvIGVuYWJsZSBleHRlcm4xIGdhdGUgYXMg
d2VsbCBhbG9uZyB3aXRoIGNsa19vdXQxIGZvciBUMzAgdGhyb3VnaAo+IFQyMTAuCj4gCj4gSnVz
dCBGWUksIGV4dGVybjEgZW5hYmxlIGhlcmUgaGFwcGVucyBvbmx5IHdoZW4gZGF0YS0+Y2xrX2V4
dGVybjEgaXMKPiBhdmFpbGFibGUgd2hpY2ggaXMgZm9yIFQzMCBvbndhcmRzLgoKY2xrX291dF8x
IGlzIHRoZSBwYXJlbnQgb2YgZXh0ZXJuMSwgdGh1cyBleHRlcm4xIGlzIGVuYWJsZWQgYnkgdGhl
IGNsawpjb3JlIHdoZW5ldmVyIGNsa19vdXRfMSBpcyBlbmFibGVkIGJlY2F1c2UgZGF0YS0+Y2xr
X2NkZXYxPWNsa19vdXRfMS4gQW4KSSBtaXNzaW5nIHNvbWV0aGluZz8KCltzbmlwXQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
