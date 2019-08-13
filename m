Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE6D8BEFF
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 18:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 993621664;
	Tue, 13 Aug 2019 18:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 993621664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565715140;
	bh=mBNmjVWceLFOSFReV6nJYzrQ5vPdQMeLjYktu89kRe0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4ow/CdFuHIgNCoAZsoG0uddWKSSvEiAkoUMTbo1rCOg/AAAN0+ctG9HtnHkCCf3l
	 N5j42d4ZnVkglpP9kaXG7n+WSxcz7ImUy14c6w8rCgR2NguYIeN++YabiNKZiMboz4
	 DYJCCx3yYsjb777EysZ/neomHCcJvRofhNyoBZt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 001ABF80290;
	Tue, 13 Aug 2019 18:50:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D256F80273; Tue, 13 Aug 2019 18:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D71CF8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 18:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D71CF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bKMLUItM"
Received: by mail-wr1-x441.google.com with SMTP id t16so18272051wra.6
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aKvLEBrboAAMmqe7EmfIffBPlfVah4vs5sU/D2WtTTk=;
 b=bKMLUItM7LDgUcobeGYy8P3icWVnNx8Klnu3auuhG8PD1xqwrb760Ne3pEwFYP6sxu
 Y7tgimXS45klNXWRHUvIl3yZC9iNEV6N1cqTOQMWjM2sjJw12lba8BWIYKGqxVtH3uik
 7C5q1+BTh+uqzDCkkumcg2eDUiWVvB9F8RvB0cfeEqqcB5BRiuA6wRPkAR0erwtcl+c5
 11YfDR/PNQqZEPkspAGURLcl40rl55DhpUM95vc/3GQSdBHwVEuSLN5C1w9jfTrVKOGR
 04uQ+7WpUlDmaOMhVSi0+9qk0U3bXnO+1stLVtAjQRxNEnwnASBEic0xR/ZOu9XxkouW
 PaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aKvLEBrboAAMmqe7EmfIffBPlfVah4vs5sU/D2WtTTk=;
 b=LrXZ5YUCCiCJsiYm5a375Hjv3YOe8jiD218c9uL5tmOV/qc67L3g+rX+E70XF1R1lO
 Q9skIPsa4Lxw53gbViR5ght41H6rTz3+AhKy033on3taNVe2MdegYipjN9W1re4Rd/u3
 6wUYlWkgnjOEIoZiyKSamo2yaOn8RrikL36yUG8CZbCeaLh0wHc3TjIeSiKOIxfbgSqY
 TDF5wTYy+8ILVA3sb8g0qO/edOccmLSf4vYAdmPVtajppZyuAskjDcgkKsIiUAesBuDT
 dX1/5pr2UaGBrJwvspbpLghLa6Tt/Y4Y7aVjf+7aQ9iCGOG75+9QkTiYjQSYPLXVFr7a
 kTZQ==
X-Gm-Message-State: APjAAAW2oiK7Q5YRnDf0xSypHEKai7nuqqpFjL9D7LfzmMWTx4o9LAuX
 T8M3H3Z1Y1S5WLl4FKNMi7dOXg==
X-Google-Smtp-Source: APXvYqyJ2a2crFUAczycMXxjsyULBrI0V7zj0hw5av3nQ6bDKMWetw+A+Y/KwO1urJjvcDDsOyXRyA==
X-Received: by 2002:adf:dbcc:: with SMTP id e12mr38340576wrj.205.1565715030029; 
 Tue, 13 Aug 2019 09:50:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a11sm11294262wrx.59.2019.08.13.09.50.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 09:50:29 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
Date: Tue, 13 Aug 2019 17:50:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LAoKT24gMTMvMDgvMjAxOSAxNTo0NCwgUGllcnJlLUxvdWlz
IEJvc3NhcnQgd3JvdGU6Cj4gT24gOC8xMy8xOSAzOjM1IEFNLCBTcmluaXZhcyBLYW5kYWdhdGxh
IHdyb3RlOgo+PiBPbiBwbGF0Zm9ybXMgd2hpY2ggaGF2ZSBzbWFydCBzcGVha2VyIGFtcGxpZmll
cnMgY29ubmVjdGVkIHZpYQo+PiBzb3VuZHdpcmUgYW5kIG1vZGVsZWQgYXMgYXV4IGRldmljZXMg
aW4gQVNvQywgaW4gc3VjaCB1c2VjYXNlcyBtYWNoaW5lCj4+IGRyaXZlciBzaG91bGQgYmUgYWJs
ZSB0byBnZXQgc2R3IG1hc3RlciBzdHJlYW0gZnJvbSBkYWkgc28gdGhhdCBpdCBjYW4KPj4gdXNl
IHRoZSBydW50aW1lIHN0cmVhbSB0byBzZXR1cCBzbGF2ZSBzdHJlYW1zLgo+IAo+IHVzaW5nIHRo
ZSBfc2V0X3Nkd19zdHJlYW0/IEkgZG9uJ3QgZnVsbHkgZ2V0IHRoZSBzZXF1ZW5jZSB3aXRoIHRo
ZSAKPiB3b3JkaW5nIGFib3ZlLgoKWWVzLCB1c2luZyBzZXRfc2R3X3N0cmVhbSgpLgoKPiAKPj4K
Pj4gc291bmR3aXJlIGFscmVhZHkgYXMgYSBzZXQgZnVuY3Rpb24sIGdldCBmdW5jdGlvbiB3b3Vs
ZCBwcm92aWRlIG1vcmUKPj4gZmxleGliaWxpdHkgdG8gYWJvdmUgY29uZmlndXJhdGlvbnMuCj4g
Cj4gSSBhbSBub3QgY2xlYXIgaWYgeW91IGFyZSBhc2tpbmcgZm9yIGJvdGggdG8gYmUgdXNlZCwg
b3IgZ2V0IG9ubHkgb3Igc2V0IAo+IG9ubHk/CgpJdCBkZXBlbmRzIG9uIHRoZSB1c2VjYXNlLCBp
biBkYjg0NWMgdXNlY2FzZSAgWzFdIGFzIEF1eCBkZXZpY2UgaXMgZGFpIApsZXNzLCBtYWNoaW5l
IGRyaXZlciBpcyB1c2luZyBnZXQgZnVuY3Rpb24gdG8gZ2V0IGhvbGQgb2YgbWFzdGVyIHN0cmVh
bSAKc28gdGhhdCBpdCBjYW4gc2V0dXAgc2xhdmUgcG9ydCBjb25maWcuCgoKTG9va3MgbGlrZSB0
aGVyZSBpcyBhIHR5cG8gaW4gYWJvdmUgbGlrZQoKVGhpcyB3YXMgc3VwcG9zZWQgdG8gYmUgInNv
dW5kd2lyZSBhbHJlYWR5IGhhcyBhIHNldCBmdW5jdGlvbiwgZ2V0IApmdW5jdGlvbiB3b3VsZCBw
cm92aWRlIG1vcmUgZmxleGliaWxpdHkgdG8gYWJvdmUgY29uZmlndXJhdGlvbnMiCgpbMV0gCmh0
dHBzOi8vZ2l0LmxpbmFyby5vcmcvbGFuZGluZy10ZWFtcy93b3JraW5nL3F1YWxjb21tL2tlcm5l
bC5naXQvdHJlZS9zb3VuZC9zb2MvcWNvbS9kYjg0NWMuYz9oPWludGVncmF0aW9uLWxpbnV4LXFj
b21sdAoKdGhhbmtzLApzcmluaQoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogU3Jpbml2YXMgS2Fu
ZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gwqAgaW5j
bHVkZS9zb3VuZC9zb2MtZGFpLmggfCAxMCArKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL3NvYy1k
YWkuaCBiL2luY2x1ZGUvc291bmQvc29jLWRhaS5oCj4+IGluZGV4IGRjNDhmZTA4MWEyMC4uMWUw
MWY0YTMwMmUwIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL3NvdW5kL3NvYy1kYWkuaAo+PiArKysg
Yi9pbmNsdWRlL3NvdW5kL3NvYy1kYWkuaAo+PiBAQCAtMjAyLDYgKzIwMiw3IEBAIHN0cnVjdCBz
bmRfc29jX2RhaV9vcHMgewo+PiDCoMKgwqDCoMKgIGludCAoKnNldF9zZHdfc3RyZWFtKShzdHJ1
Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAq
c3RyZWFtLCBpbnQgZGlyZWN0aW9uKTsKPj4gK8KgwqDCoCB2b2lkICooKmdldF9zZHdfc3RyZWFt
KShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwgaW50IGRpcmVjdGlvbik7Cj4+IMKgwqDCoMKgwqAg
LyoKPj4gwqDCoMKgwqDCoMKgICogREFJIGRpZ2l0YWwgbXV0ZSAtIG9wdGlvbmFsLgo+PiDCoMKg
wqDCoMKgwqAgKiBDYWxsZWQgYnkgc29jLWNvcmUgdG8gbWluaW1pc2UgYW55IHBvcHMuCj4+IEBA
IC00MTAsNCArNDExLDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50IAo+PiBzbmRfc29jX2RhaV9zZXRf
c2R3X3N0cmVhbShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiAtRU5PVFNVUFA7Cj4+IMKgIH0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAqc25kX3Nv
Y19kYWlfZ2V0X3Nkd19zdHJlYW0oc3RydWN0IHNuZF9zb2NfZGFpICpkYWksCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBkaXJlY3Rp
b24pCj4+ICt7Cj4+ICvCoMKgwqAgaWYgKGRhaS0+ZHJpdmVyLT5vcHMtPmdldF9zZHdfc3RyZWFt
KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRhaS0+ZHJpdmVyLT5vcHMtPmdldF9zZHdfc3Ry
ZWFtKGRhaSwgZGlyZWN0aW9uKTsKPj4gK8KgwqDCoCBlbHNlCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gRVJSX1BUUigtRU5PVFNVUFApOwo+PiArfQo+PiArCj4+IMKgICNlbmRpZgo+Pgo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
