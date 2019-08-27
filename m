Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E7A1D94
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:49:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8E916CC;
	Thu, 29 Aug 2019 16:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8E916CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090146;
	bh=GFF1qdhNnJ7U5SodNUHUVZwxqWvM/qFZe2iv/QuobSg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qytFc9ISjxyKyD5mHVep5o2Ci8dU3PPkkxhENxaDtOOGuN/PQuVlqBe4Jj9+t0I/F
	 1x9UmGXpZTZhRwt32lIEr1Z0CsURnjo5Fl45gX3LUpGAg3hD4nLL+enka4FtBVieUg
	 aGkfyFePetzKGwUHHjemZtid3sc5JO5LKhm8Z3+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CD6F80C07;
	Tue, 27 Aug 2019 23:21:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFE1F80BF3; Tue, 27 Aug 2019 23:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A67B3F808F4
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 23:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A67B3F808F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Nttduy7G"
Received: by mail-wr1-x441.google.com with SMTP id q12so232470wrj.12
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 14:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tLhcw38FuKLNsut7gUz1FietvesVxFl+vsh+ysDektI=;
 b=Nttduy7GCncxAEwTn7ROUQfvrd7gHjj+gmRcBK8NJhKmsWss+ZW5JMz+WsG3RVKWWK
 W98wigEyZsjUQuT5JcZS7emeap2xUSbSbpr+dKTOjhjj6IcgqV5Kw38yY9+MBXH89mQz
 jepDS09L0iPppjfwLMM6GElXvmlBox6z94GRZQCgQ0DPbBnYppklne7QOfYMcac/D22T
 9+RjltFJWmIZK6vOkKA8EtSruFP+O239NQRcvbWM0oMZclwW16hgZ8XPv4IPcTOcHAk0
 QtTvMsidOLa2XAXF94hKc5Oy+UroqgLZ+dNCh6zFuTlLxfrAwJ1B1kDgNCPFzqZzIdUS
 +8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tLhcw38FuKLNsut7gUz1FietvesVxFl+vsh+ysDektI=;
 b=ehR0PiwuGqc3GXmfpwXMrB+TuhhuZeRobdjbAJRiPJ0pgyARcJLgOzRnDTKTg1P0Sn
 dHcUhoE8UxdE8VYLXfNYcFUVyzcrePta/Hpg9NroihHU/TRiDS1GWrThx7Ewsh5HuBh2
 bjuyJjZmZdtJpfOGosi6GiMYjo8bv2oOuEaYRNjsNmtSqWVi51xTbFRFC1kOcYXokZB6
 7I0KYZauRDMvgLEjUtj6i8+HKUmvmu17Y0nYH5IxsLvUFzKK8xe35xxsBVcbt0cygiaL
 +DMtWv55cuDbYA2RU7Xy9G/hkjYiHZXKvLtd6paB/XbuN56o++J1wljaUw8baynPJLud
 Etrw==
X-Gm-Message-State: APjAAAW1YVr0LxKRBj7JD640gyhH9YGMTRC8p94BpXv4yxQUePoaUvX1
 aKDqtRMV069i4hjFZ6VMKpbm0Q==
X-Google-Smtp-Source: APXvYqy8AWyg2VL46hPxiroKD/nqocylXrXqvK7Uf41BSbK1KZmcquEck3Uhap2HM5cQB1Qylj3kJg==
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr272620wrw.64.1566940872977;
 Tue, 27 Aug 2019 14:21:12 -0700 (PDT)
Received: from [192.168.86.29]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id r17sm458558wrg.93.2019.08.27.14.21.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 14:21:11 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, robh+dt@kernel.org, vkoul@kernel.org
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
 <7da8aa89-2119-21d1-0e29-8894a8d40bf0@linux.intel.com>
 <37be6b6d-7e7f-2cd6-f9e9-f0cac48791ad@linaro.org>
 <d538238d-25d8-f179-c900-90be50ce814d@linux.intel.com>
 <7ee47f26-12f8-6028-cb83-7f59e669979f@linaro.org>
 <e5b184be-02f1-faa4-94fa-79bda8936d9d@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <aaf1a8f6-9be5-2d42-9f92-4fd75986424d@linaro.org>
Date: Tue, 27 Aug 2019 22:21:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5b184be-02f1-faa4-94fa-79bda8936d9d@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
 slave bindings
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

CgpPbiAyNi8wOC8yMDE5IDE3OjIyLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+Pj4K
Pj4+Pj4+ICvCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOgo+Pj4+Pj4gK8KgwqDCoMKgwqAgSXMgdGhl
IHRleHR1YWwgcmVwcmVzZW50YXRpb24gb2YgU291bmRXaXJlIEVudW1lcmF0aW9uCj4+Pj4+PiAr
wqDCoMKgwqDCoCBhZGRyZXNzLiBjb21wYXRpYmxlIHN0cmluZyBzaG91bGQgY29udGFpbiBTb3Vu
ZFdpcmUgVmVyc2lvbiAKPj4+Pj4+IElELAo+Pj4+Pj4gK8KgwqDCoMKgwqAgTWFudWZhY3R1cmVy
IElELCBQYXJ0IElEIGFuZCBDbGFzcyBJRCBpbiBvcmRlciBhbmQgc2hhbGwgYmUgaW4KPj4+Pj4+
ICvCoMKgwqDCoMKgIGxvd2VyLWNhc2UgaGV4YWRlY2ltYWwgd2l0aCBsZWFkaW5nIHplcm9lcy4K
Pj4+Pj4+ICvCoMKgwqDCoMKgIFZhbGlkIHNpemVzIG9mIHRoZXNlIGZpZWxkcyBhcmUKPj4+Pj4+
ICvCoMKgwqDCoMKgIFZlcnNpb24gSUQgaXMgMSBuaWJibGUsIG51bWJlciAnMHgxJyByZXByZXNl
bnRzIFNvdW5kV2lyZSAxLjAKPj4+Pj4+ICvCoMKgwqDCoMKgIGFuZCAnMHgyJyByZXByZXNlbnRz
IFNvdW5kV2lyZSAxLjEgYW5kIHNvIG9uLgo+Pj4+Pj4gK8KgwqDCoMKgwqAgTUZEIGlzIDQgbmli
Ymxlcwo+Pj4+Pj4gK8KgwqDCoMKgwqAgUElEIGlzIDQgbmliYmxlcwo+Pj4+Pj4gK8KgwqDCoMKg
wqAgQ0lEIGlzIDIgbmliYmxlcwo+Pj4+Pj4gK8KgwqDCoMKgwqAgTW9yZSBJbmZvcm1hdGlvbiBv
biBkZXRhaWwgb2YgZW5jb2Rpbmcgb2YgdGhlc2UgZmllbGRzIGNhbiBiZQo+Pj4+Pj4gK8KgwqDC
oMKgwqAgZm91bmQgaW4gTUlQSSBBbGxpYW5jZSBEaXNDbyAmIFNvdW5kV2lyZSAxLjAgU3BlY2lm
aWNhdGlvbnMuCj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgwqDCoCByZWc6Cj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgbWF4SXRlbXM6IDEKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjoK
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgSW5zdGFuY2UgSUQgYW5kIExpbmsgSUQgb2YgU291
bmRXaXJlIERldmljZSBBZGRyZXNzLgo+IAo+IG1heWJlIHB1dCBsaW5rIGZpcnN0IGFuZCBtYWtl
IGl0IGNsZWFyIHRoYXQgYm90aCBhcmUgcmVxdWlyZWQuCk9rYXksIEkgd2lsbCBnaXZlIHRoYXQg
YSBnbyBpbiBuZXh0IHZlcnNpb24hCgp0aGFua3MsCnNyaW5pCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
