Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD43C8FF
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB7C16F1;
	Tue, 11 Jun 2019 12:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB7C16F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560249111;
	bh=AZbsipzt4MShNalZ1Pn7gzFF+DwYOJ1BSV9o6OW0Qes=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X1+OqwrEG+UMPd45Azu+KEE3F/K49TQQlyRPGegot2Un+MRBxBRFxU9y65ATY3XcN
	 WVpV/EEHltFHfb/zIGqetP6ogL8J6G2Z1WIzueW9+IRUNR/GwGXVpzBMlP4L78vFqR
	 1gG+g428dXNcZxIMQUZSZ1UCHXHVfRvfDZThPsNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C8FDF8970F;
	Tue, 11 Jun 2019 12:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D59C6F8970F; Tue, 11 Jun 2019 12:29:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD858F8961D
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 12:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD858F8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="y7qmYfLC"
Received: by mail-wr1-x443.google.com with SMTP id m3so12423301wrv.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M85tDvSO1y/yeeXKIT4QQ+Mi/qHlL9lRNm7SAqISA7I=;
 b=y7qmYfLCKTDOn5agwlJpK0d/8R5GPbL3CHKyjAmTfPsU5SHzSZTRSeo9ltk0UBq7TS
 tca01mVkEJ6KgwzyaTcSGkcZZZ21tbYvjK1onqMspHJr2xvkp0875BvxvYkq0q4eo9Ew
 pvAmMlnVzbmx/yCj6O4J07Ubi9mRQwb5Fys/o4Y4RVNIuRyrDW4mRqwyVnGcJ8Em5j6x
 CmrDUvMVbyDSevWGOyKFJ6fErZMisHGvKsrz09zacpIAjomTQTDmaY5Gts1SnmyUKVa2
 7IMgEV77vtYBJnDMrH3AxZ7kvg2XNfvAvsVr6A8pZZqS/ms4y0odVPTeK3M2gq5SISbS
 /Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M85tDvSO1y/yeeXKIT4QQ+Mi/qHlL9lRNm7SAqISA7I=;
 b=ZXcV6T7EavqQI2axiLnrUg3HkHPhY+Id74SAjhp9Nez+RWJiq+5/qr8zlE4y0VmDFy
 PHF6vYdxxhCxV1qTiYV+x4iwv84sEdGO4aBLsdyZdAsw1KS7e74euj08tYPJiG2fFmgO
 9F490NaZ+fUiMGxo9zPsXOaU0pal2zlH1ezBUtE5QQ2I2oFSbj0Cc7ju6rWxSqd4M1+Z
 hMLs8Kp88JOb/RmU3Wfi+D0gOv3hdcMfyx8q8MQ8r2SeXsUCSA7qblC6fnhaUHVkTdYg
 3GBvGfJsPK5YBffCJO+NUIAtKxTGGsjA8nfpLcXin0JS2kH1NdNnXZtma3dQDL+O9pfY
 /y5A==
X-Gm-Message-State: APjAAAVF9+WaFNRc2NkkJRRARY4HH8sTPyVQzEYFQoz17A4LW/9YnpTf
 vt8P9wzHMjWzJclH5zuC8PkebbXghrWKZA==
X-Google-Smtp-Source: APXvYqwxt7HB9+C3etBO06tZ96K8l6qG1G2Lj6oFtJDgC06knZVDdMfbFtxWP1l0oE2q0m0iUvSpNw==
X-Received: by 2002:a05:6000:1241:: with SMTP id
 j1mr12045880wrx.63.1560248995982; 
 Tue, 11 Jun 2019 03:29:55 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x11sm3017513wmg.23.2019.06.11.03.29.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:29:54 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
 <249f9647-94d0-41d7-3b95-64c36d90f8e8@linux.intel.com>
 <40ea774c-8aa8-295d-e91e-71423b03c88d@linaro.org>
 <7269521a-ac89-3856-c18c-ffaaf64c0806@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <462620fc-ac91-6a36-46c7-7af0080f06cb@linaro.org>
Date: Tue, 11 Jun 2019 11:29:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7269521a-ac89-3856-c18c-ffaaf64c0806@linux.intel.com>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 6/6] soundwire: qcom: add support for
 SoundWire controller
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

CgpPbiAxMC8wNi8yMDE5IDE1OjEyLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+PiAr
Cj4+Pj4gK8KgwqDCoCBpZiAoZGV2X2FkZHIgPT0gU0RXX0JST0FEQ0FTVF9ERVZfTlVNKSB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGN0cmwtPmZpZm9fc3RhdHVzID0gMDsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZjdHJsLT5zcF9jbWRfY29t
cCwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbXNlY3NfdG9famlmZmllcyhUSU1FT1VUX01TKSk7Cj4+Pgo+Pj4gVGhpcyBpcyBvZGQuIFRo
ZSBTb3VuZFdpcmUgc3BlYyBkb2VzIG5vdCBoYW5kbGUgd3JpdGVzIHRvIGEgc2luZ2xlIAo+Pj4g
ZGV2aWNlIG9yIGJyb2FkY2FzdCB3cml0ZXMgZGlmZmVyZW50bHkuIEkgZG9uJ3Qgc2VlIGEgY2xl
YXIgcmVhc29uIAo+Pj4gd2h5IHlvdSB3b3VsZCBvbmx5IHRpbWVvdXQgZm9yIGEgYnJvYWRjYXN0
IHdyaXRlLgo+Pj4KPj4KPj4gVGhlcmUgaXMgZGFuZ2VyIG9mIGJsb2NraW5nIGhlcmUgd2l0aG91
dCB0aW1lb3V0Lgo+IAo+IFJpZ2h0LCBhbmQgaXQncyBmaW5lIHRvIGFkZCBhIHRpbWVvdXQuIFRo
ZSBxdWVzdGlvbiBpcyB3aHkgYWRkIGEgdGltZW91dCAKPiAqb25seSogZm9yIGEgYnJvYWRjYXN0
IG9wZXJhdGlvbj8gSXQgc2hvdWxkIGJlIGFkZGVkIGZvciBldmVyeSAKPiB0cmFuc2FjdGlvbiBJ
TU8sIHVubGVzcyB5b3UgaGF2ZSBhIHJlYXNvbiBub3QgdG8gZG8gc28uCj4gCgpJIGRpZCB0cnkg
dGhpcyBiZWZvcmUsIHRoZSBpc3N1ZSBpcyB3aGVuIHdlIHJlYWQvd3JpdGUgcmVnaXN0ZXJzIGZy
b20gCmludGVycnVwdCBoYW5kbGVyLCB0aGVzZSBjYW4gYmUgZGVhZGxvY2tlZCBhcyB3ZSB3aWxs
IGJlIGludGVycnVwdCAKaGFuZGxlciB3YWl0aW5nIGZvciBhbm90aGVyIGNvbXBsZXRpb24gaW50
ZXJydXB0LCB3aGljaCB3aWxsIG5ldmVyIApoYXBwZW4gdW5sZXNzIHdlIHJldHVybiBmcm9tIHRo
ZSBmaXJzdCBpbnRlcnJ1cHQuCgp0aGFua3MsCnNyaW5pCgo+Pj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
