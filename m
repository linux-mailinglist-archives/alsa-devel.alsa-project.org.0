Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00246126821
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 18:30:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913F5950;
	Thu, 19 Dec 2019 18:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913F5950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576776637;
	bh=1g26O2VKqi4fb5kT0u8HSHiL3QcP9yIq8eYTqZXRbQM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/TL1br2ogDuqm0ocmKx+IXKVrmTeQ+zbGlZ78HuSF6UfBoHX3HWdh9T5Tlae/Nd2
	 IngVP4avl8ua5QVit72aXQ8FplRVgWemc9gvhHEjyFuRXSA9tnmITru9fMr5jg1P2h
	 bhJwG8qootEODig7Iv4NTdItIrwTfi1uhMgZVj8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1562F80234;
	Thu, 19 Dec 2019 18:28:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B376DF80234; Thu, 19 Dec 2019 18:28:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB49BF8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 18:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB49BF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xk3y9Uvf"
Received: by mail-wm1-x344.google.com with SMTP id m24so6269004wmc.3
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KM9qiMDfWKFWWdCAAPZQUcLR4rcoEPUjfLdlA5II0go=;
 b=Xk3y9UvfTT0+Ov2hyWIqLRGjMtYrhB1HcKktCLIY0h/JLmVYGwjuV1P6zpdiJh8qNR
 TmcZB+0dGj0Ko3YCsB5487mevpccX9VqujsdaaNeoIbRIPcvy+J99YXACmc1m25VD2A7
 iDPWOs6laaTvmsHw+2v027T3QnXfBukqPbs2fuaxKJaX3o1acyRS0+qG5C+fpC8cvg+1
 78LrhSHW5jUUSCN4QsQMGkQ/4wB7aT1m9qMe2lTBVhHnmT3k5z4zpBhg9A1tRkeSuU8e
 UnuM4Va7wx0yd+kY6cgbyjh7Ha/FSiT/CTkLVrOx349EcPEat7shDxLuOkLv9fpX6B48
 n0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KM9qiMDfWKFWWdCAAPZQUcLR4rcoEPUjfLdlA5II0go=;
 b=E5puNKlZqXFCGumO3FsVwvCNWQrh2DzAY0cWutse1AtJSvA9vlJ1OnqGAbYXqv5AXm
 HT33dWgeDaRsQdbWxkvDXO/koy1cgf17FHT+0QRTOOmW6WClLfPcwHUtj0OyR0uv8rPw
 GRhXl4sbDhnmkK2cN6ZW1kxNBZ7Ec6N02UcXAjF/m2x8OamNbiAIBIVUuBozAArDqJJ/
 QyCLTH0RPs26ChJGX+NSb7sF1zCPWQtZSoWanq0cPh0kC7DMmcfwL7a98k5/rfvbCUBi
 eQLkPRCrSw5slBJPUDxDBsVpV0sDIPSrXNHZUCZEaSakeqFQjX0gXqyTUoogcYx9Na1H
 doUw==
X-Gm-Message-State: APjAAAX61f6QNFtRdqe1pPYY5hzGThFCzt0zWLKSOIJMZwN+5HiO7XQw
 61QeT/VOsQAbaZDhuasse+vP9A==
X-Google-Smtp-Source: APXvYqxEChvbzvXz1AWKw3LjAHZoXrlun6tgfrVy7bOQosew+hDZAwYPv96u+0LKl9otucSH4hTVGg==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr11102986wml.83.1576776520153; 
 Thu, 19 Dec 2019 09:28:40 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n67sm6887821wmf.46.2019.12.19.09.28.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Dec 2019 09:28:39 -0800 (PST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
 <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <db36d6d7-40a2-bbd2-f299-838abf4d92cc@linaro.org>
Date: Thu, 19 Dec 2019 17:28:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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

CgpPbiAxOS8xMi8yMDE5IDE2OjM2LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4g
K3N0YXRpYyBpbnQgd2NkOTM0eF9zbGltX3N0YXR1cyhzdHJ1Y3Qgc2xpbV9kZXZpY2UgKnNkZXYs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBzbGltX2Rldmlj
ZV9zdGF0dXMgc3RhdHVzKQo+PiArewo+PiArwqDCoMKgIHN3aXRjaCAoc3RhdHVzKSB7Cj4+ICvC
oMKgwqAgY2FzZSBTTElNX0RFVklDRV9TVEFUVVNfVVA6Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gd2NkOTM0eF9zbGltX3N0YXR1c191cChzZGV2KTsKPj4gK8KgwqDCoCBjYXNlIFNMSU1fREVW
SUNFX1NUQVRVU19ET1dOOgo+PiArwqDCoMKgwqDCoMKgwqAgbWZkX3JlbW92ZV9kZXZpY2VzKCZz
ZGV2LT5kZXYpOwo+PiArwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqAgZGVmYXVsdDoK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArwqDCoMKgIH0KPj4gKwo+PiAr
wqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4gCj4gdGhpcyBpcyBpbnRlcmVzdGluZy9zdXJw
cmlzaW5nIC0gSSBqdXN0IG5vdGljZWQgd2hhdCBsb29rcyBsaWtlIGEgCj4gc2lnbmlmaWNhbnQg
Y2hhbmdlIGluIGhvdyBwcm9iZS9pbml0aWFsaXphdGlvbiBhcmUgaGFuZGxlZC4KPiAKPiBJdCB3
YXMgbXkgdW5kZXJzdGFuZGluZyB0aGF0IGluIFNMSU1idXMgdGhlIExpbnV4IGRldmljZXMgYXJl
IGNyZWF0ZWQgYXQgCj4gcHJvYmUgdGltZSwgYW5kIHdoZW4gdGhlIGRldmljZSByZXBvcnRzIHBy
ZXNlbnQgdGhpcyAnZGV2aWNlX3N0YXR1cycgCj4gY2FsbGJhY2sgaXMgdXNlZCB0byBub3RpZnkg
dGhlIGNvZGVjIGRyaXZlciBvZiBhIGNoYW5nZS4gVGhlIHJhdGlvbmFsZSAKPiBmb3IgdGhpcyB3
YXMgdGhhdCB0aGUgY29kZWMgZHJpdmVyIG1heSBjb250cm9sIHBvd2VyIHN3aXRjaGVzL2dwaW9z
IHRoYXQgCj4gYXJlIG5lY2Vzc2FyeSBmb3IgdGhlIGRldmljZSB0byBhcHBlYXIgb24gdGhlIGJ1
cy4KCldlIHVzZSBzYW1lIHJhdGlvbmFsIGhlcmUgdG8gcG93ZXIgc3dpdGNoIGFuZCBmbGlwIHJl
c2V0IHBpbnMgaW4gZGV2aWNlIApwcm9iZSB0byBwb3dlciB1cCB0aGUgYWN0dWFsIFNMSU1CdXMg
ZGV2aWNlIGluIGRldmljZSBwcm9iZS4KCk9ubHkgZGlmZmVyZW5jZSBoZXJlIGlzIHRoYXQgdGhl
IGFjdHVhbCBTTElNQnVzIGRldmljZSBpdHNlbGYgaXMgCnJlcHJlc2VudGVkIGFzIG1hbnkgY2hp
bGQgZGV2aWNlcyBiYXNlZCBvbiB0aGVyZSBmdW5jdGlvbmFsaXR5LgoKU0xJTUJ1cyBwYXJlbnQg
ZGV2aWNlIGluIHRoaXMgY2FzZSBpcyBNRkQgZGV2aWNlIHdoaWNoIGlzIGNyZWF0ZWQgYXQgCnBy
b2JlIHRpbWUuIEhvd2V2ZXIgY2hpbGQgZGV2aWNlcyBmb3IgdGhhdCBkZXZpY2UgbGlrZSBncGlv
IGNvbnRyb2xsZXIsIApjb2RlYywgY2xvY2sgY29udHJvbGxlciBhbmQgc291bmR3aXJlIGNvbnRy
b2xsZXIgYXJlIGNyZWF0ZWQgb25seSBhZnRlciAKdGhlIGRldmljZSBpcyBlbnVtZXJhdGVkIG9u
IHRoZSBidXMuIEJlZm9yZSB0aGF0IG5vbmUgb2YgdGhlc2UgZGV2aWNlcyAKd2lsbCBiZSBpbiBh
IHBvc2l0aW9uIHRvIHRhbGsgb24gdGhlIGJ1cy4KCgo+IAo+IFRoaXMgYXJndW1lbnQgd2FzIHVz
ZWQgdG8gcmVxdWlyZSBhbiBjaGFuZ2UgaW4gdGhlIFNvdW5kV2lyZSAKPiBpbXBsZW1lbnRhdGlv
biwgc28gd2UgZm9sbG93ZWQgdGhpcyBtb2RlbCBvZiBjcmVhdGluZyBkZXZpY2VzIGF0IHByb2Jl
IAo+IHRpbWUgYmFzZWQgb24gaW5mb3JtYXRpb24gcmVwb3J0ZWQgYnkgQUNQSS9EVCwgYW5kIHVz
ZWQgdGhlIAo+ICd1cGRhdGVfc3RhdHVzJyBjYWxsYmFjayB3aGVuIHRoZSBkZXZpY2UgaXMgcHJl
c2VudCBvbiB0aGUgYnVzICh3aGljaCAKPiBtYXkgaGFwcGVuIGFmdGVyIGEgZGVsYXkgb3IgY29u
dHJvbGxlZCBieSBhbiBleHRlcm5hbCBwb3dlciBzd2l0Y2gpLiAKPiBUaGlzIGFwcHJvYWNoIGNh
biBsZWFkIHRvICdnaG9zdCBkZXZpY2VzJyBkZXNjcmliZWQgaW4gZmlybXdhcmUgYnV0IG5vdCAK
PiBwb3B1bGF0ZWQgaW4gaGFyZHdhcmUsIGFuZCBwb3dlciBtYW5hZ2VtZW50IG9wZW5zIG9uIGhv
dyBsb25nIGEgYnVzIAo+IG5lZWRzIHRvIHJlbWFpbiBhY3RpdmUgaWYgbm8gZGV2aWNlcyByZXBv
cnQgcHJlc2VudC4KPiAKPiBXaGF0IEkgdW5kZXJzdGFuZCBmcm9tIHRoZSBjb2RlIGFib3ZlIGlz
IHRoYXQgdGhlIGRldmljZXMgYXJlIGFjdHVhbGx5IAo+IGNyZWF0ZWQgd2hlbiB0aGUgU0xJTWJ1
cyBkZXZpY2UgcmVwb3J0cyBQUkVTRU5ULCB3aGljaCBzZWVtcyBhIDE4MCAKPiBkZWdyZWUgY2hh
bmdlIGluIGRpcmVjdGlvbnM/Cj4gCk5vdGUgdGhlc2UgYXJlIHRoZSBjaGlsZCBkZXZpY2VzIG9m
IHRoZSBNRkQgU0xJTUJ1cyBkZXZpY2UuCgoKPiBJIGFjdHVhbGx5IHByZWZlciBpdCB0aGlzIHdh
eSwgYW5kIGFsbCBjdXJyZW50IGRpc2N1c3Npb25zIGluIE1JUEkgCj4gY2lyY2xlcyBwb2ludCB0
byB0aGUgZmFjdCB0aGF0IHdoZW4gdGhlIGJ1cyBzdGFydHMgYWxsIGRldmljZXMgb24gdGhhdCAK
PiBidXMgc2hvdWxkIGFscmVhZHkgYmUgcG93ZXJlZCBhbmQgaGF2ZSB0aGUgYWJpbGl0eSB0byBy
ZXBvcnQgcHJlc2VudCAKPiBpbW1lZGlhdGVseSAoaWYgdGhlIGJ1cyBzdGFydHMgaW4gYSAnc2Fm
ZScgbW9kZSBhbmQgdGhlbiBsYXRlciBwcm9ncmFtcyAKPiBkaWZmZXJlbnQgUEhZIHBhcmFtZXRl
cnMsIGEgZGV2aWNlIGNhbiBubyBsb25nZXIgam9pbiB0aGUgYnVzKQoKSW4gb3VyIGNhc2Ugd2Ug
bmVlZCB0byBzd2l0Y2ggb24gZmV3IHJlZ3VsYXRvcnMgYW5kIGZsaXAgdGhlIHJlc2V0IHBpbyAK
dG8gYmUgYWJsZSB0byBicmluZyB0aGUgZGV2aWNlIHRvIGVudW1lcmF0ZS4KCj4gCj4gSSB3b3Vs
ZCBob3dldmVyIG5vdCByZW1vdmUgdGhlIGRldmljZXMgd2hlbiB0aGUgc3RhdHVzIGlzIGRvd24g
YnV0IG9ubHkgCj4gb24gYW4gZXhwbGljaXQgLnJlbW92ZS4KCkFtIG9wZW4gZm9yIHN1Z2dlc3Rp
b25zIGJ1dCBJIHdvdWxkIG5vdCBsaWtlIHRoZSBjaGlsZCBkZXZpY2VzIHRvIHRhbGsgCm9uIHRo
ZSBidXMgb25jZSB0aGUgU0xJTWJ1cyBkZXZpY2UgaXMgZG93biEgT25seSB3YXkgdG8gZW5zdXJl
IG9yIG1ha2UgCml0IHNpbGVudCBpcyB0byByZW1vdmUuCgpUaGFua3MsCnNyaW5pCj4gCj4gRmVl
ZGJhY2sgd2VsY29tZS4KPiAtUGllcnJlCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
