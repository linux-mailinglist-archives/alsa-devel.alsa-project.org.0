Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB5118081
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:33:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAF7016B0;
	Tue, 10 Dec 2019 07:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAF7016B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959592;
	bh=riswzxe+JAvtnmbr64oRyHmzB0s8FIUGIj+toCVHx7k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpZkQ0BjRZ+Xe1b71jGZF9hWBGYbf1VgtaS/ShDP4RTqQ/bZuP/4OT4DCliDS5xAn
	 0WiEbwSbQDUlISQLmv1DHavmoc4ifPBTmOc1aA3vo+qRqETD25ctzB8KiIQOeDi2AX
	 0Yy1CtrpQ31CbpmqbAa+G3vN6xkw/Z/BJr+OfBDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C360F80272;
	Tue, 10 Dec 2019 07:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79683F80234; Tue, 10 Dec 2019 00:12:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C369DF800E1
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 00:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C369DF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TKhSM2vH"
Received: by mail-lj1-x241.google.com with SMTP id m6so17651788ljc.1
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 15:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=haj1iQIzusJiq5xZbvoGZltyRINbYQFs1AfZNA3J7Bw=;
 b=TKhSM2vH3L6gCnNkN5WU2o6qjrIDCvhBg57RGAugJJjmOqk47/y/7JMOqmqHziFso4
 vrIPAU6cOcKS2kvKySG05tEdOsJH+0F8G5yjNhcyze5pInblWMAaQlgUxXuQ1Fl08klN
 nbWM7m/6eHZA9wQB1fOu72kGLA/UOaqLAxO2sUc3e36tMraPuUF44s/Qx4tgvkxLwvUs
 lnFXLHz6lITqq+gl7SKRw4M+2+lcWEkdzGwuM1RRKlRlNTDuHeaxeJNUFJgNCl5oofXL
 W1QuKz7bKg+YCyU3u3JrJ+dEuMVjIvMDICNqkbunCMMK13o6dufpzRp6ndjbxVXJsAoT
 U8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=haj1iQIzusJiq5xZbvoGZltyRINbYQFs1AfZNA3J7Bw=;
 b=a1OEj7JIBDHHmmHqDHvKU4LYBZCJc2t4C7CQtVvKSK1MFsuFjwHKHaUzEQS7RM6h8G
 76rja91bgYV39F/OpTDuvzuGgxVh6Xm/r1mOXKLCmNf+l2HOYToijJmVr88BYcQv9fHY
 UhFlykff+2SrJuB86V/U84AVjt5lYeWaGqxQAmlgfdZ2xs0sGkYb2Bdxa6OS2JgDdS34
 wc8r4k2deySwNlfHnOe+tkjnk8iHWd/V6mmlmh9bxIHnrk1m/PKY4EwFu+K8gRr9SAp5
 qGKBa4+wG6yjn7Zxz8ocbhFrtsF5T7qbEXEXDX2kasjHhHGIKhMZxCeX6P7P/UjUBRNQ
 UHZw==
X-Gm-Message-State: APjAAAXSHzC+s+0zCrLgpy6KE166o0DFQ9FFL887UtKkh34wEp8AiTQv
 ERsI9BFRKKigSIXE4SKrInRUonH0
X-Google-Smtp-Source: APXvYqy34NOBgWXdum0Y7rIrwMjGP0v3YtA9lQ/DxV99R/QkSV1aiTOHtATIkgqTDfxW3fj1B55I5g==
X-Received: by 2002:a2e:9906:: with SMTP id v6mr18682024lji.90.1575933140367; 
 Mon, 09 Dec 2019 15:12:20 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id w71sm500435lff.0.2019.12.09.15.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 15:12:19 -0800 (PST)
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org,
 sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
 mark.rutland@arm.com
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-9-git-send-email-skomatineni@nvidia.com>
 <0ce2e83b-800c-da1e-7a3c-3cf1427cfe20@gmail.com>
 <2eeceabe-b5f0-6f9e-ff8c-4ac6167b7cc3@nvidia.com>
 <5d26e32c-a346-4d42-9872-840964512144@gmail.com>
 <79661e2f-dcd4-6dd5-9b4d-9dcc40de478a@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <664a0b15-7136-2a11-f0a0-06f32cca1a9c@gmail.com>
Date: Tue, 10 Dec 2019 02:12:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <79661e2f-dcd4-6dd5-9b4d-9dcc40de478a@nvidia.com>
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

MTAuMTIuMjAxOSAwMjowNSwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+IAo+IE9u
IDEyLzkvMTkgMTI6MDYgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMDcuMTIuMjAxOSAy
MjoyMCwgU293amFueWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4gT24gMTIvNy8xOSA2OjU4
IEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gMDYuMTIuMjAxOSAwNTo0OCwgU293amFu
eWEgS29tYXRpbmVuaSDQv9C40YjQtdGCOgo+Pj4+PiBDdXJyZW50IEFTb0MgZHJpdmVyIHVzZXMg
ZXh0ZXJuMSBhcyBjZGV2MSBjbG9jayBmcm9tIFRlZ3JhMzAgb253YXJkcwo+Pj4+PiB0aHJvdWdo
IGRldmljZSB0cmVlLgo+Pj4+Pgo+Pj4+PiBBY3R1YWwgYXVkaW8gbWNsayBpcyBjbGtfb3V0XzEg
YW5kIHRvIHVzZSBQTExBIGZvciBtY2xrIHJhdGUgY29udHJvbCwKPj4+Pj4gbmVlZCB0byBjbGtf
b3V0XzFfbXV4IHBhcmVudCB0byBleHRlcm4xIGFuZCBleHRlcm4xIHBhcmVudCB0bwo+Pj4+PiBQ
TExBX09VVDAuCj4+Pj4+Cj4+Pj4+IEN1cnJlbnRseSBUZWdyYSBjbG9jayBkcml2ZXIgaW5pdCBz
ZXRzIHRoZSBwYXJlbnRzIGFuZCBlbmFibGVzIGJvdGgKPj4+Pj4gY2xrX291dF8xIGFuZCBleHRl
cm4xIGNsb2Nrcy4gQnV0IHRoZXNlIGNsb2NrcyBwYXJlbnQgYW5kIGVuYWJsZXMKPj4+Pj4gc2hv
dWxkCj4+Pj4+IGJlIGNvbnRyb2xsZWQgYnkgQVNvQyBkcml2ZXIuCj4+Pj4+Cj4+Pj4+IENsb2Nr
IHBhcmVudHMgY2FuIGJlIHNwZWNpZmllZCBpbiBkZXZpY2UgdHJlZSB1c2luZyBhc3NpZ25lZC1j
bG9ja3MKPj4+Pj4gYW5kIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMuCj4+Pj4+Cj4+Pj4+IFRvIGVu
YWJsZSBhdWRpbyBtY2xrLCBib3RoIGNsa19vdXRfMSBhbmQgZXh0ZXJuMSBjbG9ja3MgbmVlZCB0
byBiZQo+Pj4+PiBlbmFibGVkLgo+Pj4+Pgo+Pj4+PiBUaGlzIHBhdGNoIGNvbmZpZ3VyZXMgcGFy
ZW50cyBmb3IgY2xrX291dF8xIGFuZCBleHRlcm4xIGNsb2NrcyBpZgo+Pj4+PiBkZXZpY2UKPj4+
Pj4gdHJlZSBkb2VzIG5vdCBzcGVjaWZ5IGNsb2NrIHBhcmVudHMgaW5vcmRlciB0byBzdXBwb3J0
IG9sZCBkZXZpY2UgdHJlZQo+Pj4+PiBhbmQgY29udHJvbHMgbWNsayB1c2luZyBib3RoIGNsa19v
dXRfMSBhbmQgZXh0ZXJuMSBjbG9ja3MuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNvd2ph
bnlhIEtvbWF0aW5lbmkgPHNrb21hdGluZW5pQG52aWRpYS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDC
oMKgIHNvdW5kL3NvYy90ZWdyYS90ZWdyYV9hc29jX3V0aWxzLmMgfCA2Ngo+Pj4+PiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiDCoMKgIHNvdW5kL3NvYy90ZWdy
YS90ZWdyYV9hc29jX3V0aWxzLmggfMKgIDEgKwo+Pj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwg
NjcgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL3RlZ3Jh
L3RlZ3JhX2Fzb2NfdXRpbHMuYwo+Pj4+PiBiL3NvdW5kL3NvYy90ZWdyYS90ZWdyYV9hc29jX3V0
aWxzLmMKPj4+Pj4gaW5kZXggNTM2YTU3OGU5NTEyLi44ZTNhMzc0MGRmN2MgMTAwNjQ0Cj4+Pj4+
IC0tLSBhL3NvdW5kL3NvYy90ZWdyYS90ZWdyYV9hc29jX3V0aWxzLmMKPj4+Pj4gKysrIGIvc291
bmQvc29jL3RlZ3JhL3RlZ3JhX2Fzb2NfdXRpbHMuYwo+Pj4+PiBAQCAtNjAsNiArNjAsNyBAQCBp
bnQgdGVncmFfYXNvY191dGlsc19zZXRfcmF0ZShzdHJ1Y3QKPj4+Pj4gdGVncmFfYXNvY191dGls
c19kYXRhICpkYXRhLCBpbnQgc3JhdGUsCj4+Pj4+IMKgwqDCoMKgwqDCoCBkYXRhLT5zZXRfbWNs
ayA9IDA7Cj4+Pj4+IMKgwqAgwqDCoMKgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUoZGF0YS0+
Y2xrX2NkZXYxKTsKPj4+Pj4gK8KgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUoZGF0YS0+Y2xr
X2V4dGVybjEpOwo+Pj4+PiDCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEt
PmNsa19wbGxfYV9vdXQwKTsKPj4+Pj4gwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFy
ZShkYXRhLT5jbGtfcGxsX2EpOwo+Pj4+PiDCoMKgIEBAIC04OSw2ICs5MCwxNCBAQCBpbnQgdGVn
cmFfYXNvY191dGlsc19zZXRfcmF0ZShzdHJ1Y3QKPj4+Pj4gdGVncmFfYXNvY191dGlsc19kYXRh
ICpkYXRhLCBpbnQgc3JhdGUsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7
Cj4+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IMKgwqAgK8KgwqDCoCBpZiAoIUlTX0VSUl9PUl9O
VUxMKGRhdGEtPmNsa19leHRlcm4xKSkgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZXJyID0gY2xr
X3ByZXBhcmVfZW5hYmxlKGRhdGEtPmNsa19leHRlcm4xKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChlcnIpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkYXRhLT5k
ZXYsICJDYW4ndCBlbmFibGUgZXh0ZXJuMTogJWRcbiIsIGVycik7Cj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICvC
oMKgwqAgfQo+Pj4+PiArCj4+Pj4+IMKgwqDCoMKgwqDCoCBlcnIgPSBjbGtfcHJlcGFyZV9lbmFi
bGUoZGF0YS0+Y2xrX2NkZXYxKTsKPj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkYXRhLT5kZXYsICJDYW4ndCBlbmFibGUgY2Rl
djE6ICVkXG4iLCBlcnIpOwo+Pj4+PiBAQCAtMTA5LDYgKzExOCw3IEBAIGludCB0ZWdyYV9hc29j
X3V0aWxzX3NldF9hYzk3X3JhdGUoc3RydWN0Cj4+Pj4+IHRlZ3JhX2Fzb2NfdXRpbHNfZGF0YSAq
ZGF0YSkKPj4+Pj4gwqDCoMKgwqDCoMKgIGludCBlcnI7Cj4+Pj4+IMKgwqAgwqDCoMKgwqDCoCBj
bGtfZGlzYWJsZV91bnByZXBhcmUoZGF0YS0+Y2xrX2NkZXYxKTsKPj4+Pj4gK8KgwqDCoCBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoZGF0YS0+Y2xrX2V4dGVybjEpOwo+Pj4+PiDCoMKgwqDCoMKgwqAg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsa19wbGxfYV9vdXQwKTsKPj4+Pj4gwqDCoMKg
wqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShkYXRhLT5jbGtfcGxsX2EpOwo+Pj4+PiDCoMKg
IEBAIC0xNDIsNiArMTUyLDE0IEBAIGludCB0ZWdyYV9hc29jX3V0aWxzX3NldF9hYzk3X3JhdGUo
c3RydWN0Cj4+Pj4+IHRlZ3JhX2Fzb2NfdXRpbHNfZGF0YSAqZGF0YSkKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoCAr
wqDCoMKgIGlmICghSVNfRVJSX09SX05VTEwoZGF0YS0+Y2xrX2V4dGVybjEpKSB7Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBlcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoZGF0YS0+Y2xrX2V4dGVybjEp
Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGVycikgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXZfZXJyKGRhdGEtPmRldiwgIkNhbid0IGVuYWJsZSBleHRlcm4xOiAlZFxuIiwg
ZXJyKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIH0KPj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gV2h5IHRoaXMgaXMgbmVlZGVkIGdp
dmVuIHRoYXQgY2xrX2V4dGVybjEgaXMgZWl0aGVyIGEgY2hpbGQgb2YgTUNMSyBvcgo+Pj4+IE1D
TEsgaXRzZWxmIChvbiBUMjApPyBUaGUgY2hpbGQgY2xvY2tzIGFyZSBlbmFibGVkIHdoZW4gdGhl
IHBhcmVudCBpcwo+Pj4+IGVuYWJsZWQuCj4+PiBGb3IgVDMwIGFuZCBsYXRlciwgY2xrX2V4dGVy
bjEgaXMgb25lIG9mIHRoZSBzb3VyY2UgZm9yIGNsa19vdXRfMV9tdXguCj4+PiBjbGtfZXh0ZXJu
MSBpcyBpbiBDQVIgYW5kIGl0IGhhcyBpdHMgb3duIGdhdGUgYW5kIG11eC4KPj4+Cj4+PiBBcyBh
dWRpbyBtY2xrIHJlbGF0ZWQgY2xvY2tzIChjbGtfb3V0XzEsIGNsa19vdXRfMV9tdXgsIGFuZCBl
eHRlcm4xKSBhcmUKPj4+IG1vdmVkIGludG8gQVNvQyBkcml2ZXIgZnJvbSBjbG9jayBkcml2ZXIK
Pj4+Cj4+PiBuZWVkIHRvIGVuYWJsZSBleHRlcm4xIGdhdGUgYXMgd2VsbCBhbG9uZyB3aXRoIGNs
a19vdXQxIGZvciBUMzAgdGhyb3VnaAo+Pj4gVDIxMC4KPj4+Cj4+PiBKdXN0IEZZSSwgZXh0ZXJu
MSBlbmFibGUgaGVyZSBoYXBwZW5zIG9ubHkgd2hlbiBkYXRhLT5jbGtfZXh0ZXJuMSBpcwo+Pj4g
YXZhaWxhYmxlIHdoaWNoIGlzIGZvciBUMzAgb253YXJkcy4KPj4gY2xrX291dF8xIGlzIHRoZSBw
YXJlbnQgb2YgZXh0ZXJuMSwgdGh1cyBleHRlcm4xIGlzIGVuYWJsZWQgYnkgdGhlIGNsawo+PiBj
b3JlIHdoZW5ldmVyIGNsa19vdXRfMSBpcyBlbmFibGVkIGJlY2F1c2UgZGF0YS0+Y2xrX2NkZXYx
PWNsa19vdXRfMS4gQW4KPj4gSSBtaXNzaW5nIHNvbWV0aGluZz8KPj4KPj4gW3NuaXBdCj4gZXh0
ZXJuMSBpcyB0aGUgcGFyZW50IGZvciBjbGtfb3V0XzEuIGV4cGxhaW5lZCBleHRlcm4xIGNsb2Nr
IHBhdGggdG8KPiBjbGtfb3V0IGluIHJlcGx5IHRvIHlvdXIgY29tbWVudCBpbiBvdGhlciBwYXRj
aCBvZiB0aGlzIHNlcmllcy4KClJpZ2h0LCBJIG1lYW50IGV4dGVybjEgdGhlIHBhcmVudCBvZiBj
bGtfb3V0XzEsIHNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLgpTbyB3aGVuIGNsa19vdXRfMSAoY2hp
bGQpIGlzIGVuYWJsZWQsIGV4dGVybjEgKHBhcmVudCkgaXMgZW5hYmxlZCBhcyB3ZWxsLgoKSSds
bCB0YWtlIGEgY2xvc2VyIGxvb2sgYXQgdGhlIG90aGVyIGVtYWlsIHRvbW9ycm93LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
