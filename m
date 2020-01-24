Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D098D147795
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 05:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67E471670;
	Fri, 24 Jan 2020 05:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67E471670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579840023;
	bh=PyYJ6eJx5H3PwiJts/7tpOvqYnhPwkca724tjRS9VMk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJ4IQrtZ3c9QLH1vIqym+HRuE62MOCiupy9X8hwDKXWVQ67pR44yCDpPs89sJ8HZC
	 V4eVXCt8DIxrYHQZFILkpsTgZQ2qZn8oiHnGXTYGhnEOQaysEIgNJ7qNaZBlUp9viD
	 iF6yEFPjFA3Ou4MXXcUne3vuQ+SFDoIO2JeY6oTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF64F80217;
	Fri, 24 Jan 2020 05:25:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 865ABF8020C; Fri, 24 Jan 2020 05:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37CD8F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 05:25:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37CD8F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Yqgm/L6R"
Received: by mail-lf1-x144.google.com with SMTP id m30so287442lfp.8
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 20:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nqvrrfgH50F3heDUQV2TPxvyGIm9jjs0IGrVe+RwimE=;
 b=Yqgm/L6R0clKVYrscixlwYJrmLydO6eTZXRSwbpSsJkZRcKp28C3d7HqPnhXE8vqbH
 9VdqiMw/4NEz4lxzg9g1A42L97lUsDUtkTs++ZjGiv/9mjFmGPsmezm7L5YrcZ7J7zNi
 SNZQwMmcFdpRp9XNelnkzmBRgDQU3K10FIKouhjNx01IweB+AvH7YZGLomp67wp5V5KR
 V1o9EcoAUzA28Q+wzAt43MypyA3faknk8Lp9HDE0raVbiy/DqAzutS+E/Cdm5LhWucoB
 5AZ2SuyKr+7/6x+uDIg6v3vszDyYk8tq1/kw86qyWf/5VrEDXmifItnWblE2nraMF4ii
 pkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nqvrrfgH50F3heDUQV2TPxvyGIm9jjs0IGrVe+RwimE=;
 b=lBm/gnrC4+aSneGX1mnOGmc1zMaPVZDd0UZ5djcFjm/ihQ5yeNrN+FQmWINmlqEfCV
 7xDOK+423WKdMZ+wFNIfRetQTn81TRltettpjdOR8Ed9I1jbYLAOL1xNSiQC7yuk8q+F
 8zdOPypiKHHxYuEs8wHLqk7amVmVJWH1xoZd5+yqpqGTlflSrg0cNOHJJyEKKF0SDCwc
 MVd881k0bFpdiDSGj9pP1BsmiQRAy1EThzhndLaAdinqGp7gn9kj+uYCsfYoKh6rRWZq
 6ROjx0P0RyvEaDN9nff5e7yRnABuIpUt2Po2u7iwP/tWgoccA98GHWDYB9eTw2QthMP1
 avrQ==
X-Gm-Message-State: APjAAAUl5OVQRqo8LzjnBQfDkhfFOGViXT0F00Zly8dM4AHXjKMd8FZi
 ve1Vo3KK5pwW3CU8oQKcPVU=
X-Google-Smtp-Source: APXvYqz9HRXIowhnShk3uHeDO/07QPAIONMd8ODEb7ccArNqgO+S9/aB3Jd/HegdKDhotT/9ZK1LTw==
X-Received: by 2002:ac2:523c:: with SMTP id i28mr487778lfl.104.1579839912004; 
 Thu, 23 Jan 2020 20:25:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id f30sm2282977ljp.31.2020.01.23.20.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 20:25:11 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-8-git-send-email-spujar@nvidia.com>
 <743d6d7d-f29c-191a-853b-414250ca38df@gmail.com>
 <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8a3259b7-6875-236a-b16c-cd8e023cc8b2@gmail.com>
Date: Fri, 24 Jan 2020 07:25:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3759aa0b-9e56-0fb4-27b7-4f98898d4e22@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 7/9] ASoC: tegra: add Tegra210 based ADMAIF
 driver
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

MjQuMDEuMjAyMCAwNjoyNywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMS8y
NC8yMDIwIDY6NTggQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRXh0ZXJuYWwgZW1haWw6
IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4KPj4KPj4gMjAuMDEu
MjAyMCAxNzoyMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+IFtzbmlwXQo+Pj4gK3N0YXRp
YyBib29sIHRlZ3JhX2FkbWFpZl93cl9yZWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgcmVnKQo+Pj4gK3sKPj4+ICvCoMKgwqDCoCBzdHJ1Y3QgdGVncmFfYWRtYWlmICphZG1haWYg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPj4+ICvCoMKgwqDCoCB1bnNpZ25lZCBpbnQgY2hfc3Ry
aWRlID0gVEVHUkFfQURNQUlGX0NIQU5ORUxfUkVHX1NUUklERTsKPj4+ICvCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgbnVtX2NoID0gYWRtYWlmLT5zb2NfZGF0YS0+bnVtX2NoOwo+Pj4gK8KgwqDCoMKg
IHVuc2lnbmVkIGludCByeF9iYXNlID0gYWRtYWlmLT5zb2NfZGF0YS0+cnhfYmFzZTsKPj4+ICvC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgdHhfYmFzZSA9IGFkbWFpZi0+c29jX2RhdGEtPnR4X2Jhc2U7
Cj4+PiArwqDCoMKgwqAgdW5zaWduZWQgaW50IGdsb2JhbF9iYXNlID0gYWRtYWlmLT5zb2NfZGF0
YS0+Z2xvYmFsX2Jhc2U7Cj4+PiArwqDCoMKgwqAgdW5zaWduZWQgaW50IHJlZ19tYXggPQo+Pj4g
YWRtYWlmLT5zb2NfZGF0YS0+cmVnbWFwX2NvbmYtPm1heF9yZWdpc3RlcjsKPj4+ICvCoMKgwqDC
oCB1bnNpZ25lZCBpbnQgcnhfbWF4ID0gcnhfYmFzZSArIChudW1fY2ggKiBjaF9zdHJpZGUpOwo+
Pj4gK8KgwqDCoMKgIHVuc2lnbmVkIGludCB0eF9tYXggPSB0eF9iYXNlICsgKG51bV9jaCAqIGNo
X3N0cmlkZSk7Cj4+PiArCj4+PiArwqDCoMKgwqAgaWYgKChyZWcgPj0gcnhfYmFzZSkgJiYgKHJl
ZyA8IHJ4X21heCkpIHsKPj4gVGhlIGJyYWNlcyBhcmUgbm90IG5lZWRlZCBhcm91bmQgdGhlIGNv
bXBhcmlzb25zIGJlY2F1c2UgdGhleSBwcmVjZWRlCj4+IHRoZSBBTkQuIFNhbWUgZm9yIGFsbCBv
dGhlciBzaW1pbGFyIG9jY3VycmVuY2VzIGluIHRoZSBjb2RlLgo+IAo+IFdoaWxlIHRoYXQgaXMg
dHJ1ZSwgc29tZSBwcmVmZXIgdG8gdXNlIGV4cGxpY2l0IGJyYWNlcyB0byBtYWtlIGl0IG1vcmUK
PiByZWFkYWJsZS4KPiBJbiB0aGUgcGFzdCBJIHdhcyB0b2xkIHRvIHVzZSBleHBsaWNpdGx5IGlu
IHN1Y2ggY2FzZXMuCgpBdCBsZWFzdCBtb3N0IG9mIGNvZGUgaW4ga2VybmVsIChJJ3ZlIHNlZW4p
IGRvZXNuJ3QgaGF2ZSBzdXBlcmZsdW91cwpwYXJlbnMgKHRoZSBjdXJ2eSB0aGluZ2llcyBhY3R1
YWxseSBzaG91bGQgYmUgdGhlIGJyYWNlcykuIFJlYWRhYmlsaXR5CmlzIGFyZ3VhYmxlIGluIHRo
aXMgY2FzZSwgSSdtIGZpbmRpbmcgc3VjaCBjb2RlIGEgYml0IG1vcmUgZGlmZmljdWx0IHRvCnJl
YWQsIGFsdGhvdWdoIGluIHNvbWUgY2FzZXMgcGFyZW5zIGFuZCBzcGFjaW5nIG1heSBoZWxwIHRv
IHJlYWQgbW9yZQpjb21wbGV4IGNvbnN0cnVjdGlvbnMuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
