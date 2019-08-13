Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7B8BF06
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 18:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B535166B;
	Tue, 13 Aug 2019 18:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B535166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565715252;
	bh=IzxE1ZD7kndsdbdtdgfopW71u7UUfoMV0wMbI7MhfNI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r3JbQ3p6M32FgGmAXWpwINqDK2GxgqFHVG1sTTkCK3m75NziAcwUn4m/oW910NFjr
	 MQ6Utp40pNhmF0l8pjaU/D7DOtd7tROcW7N5j0f72xE9ds/Kg2DOQOuaLJr/x3gEd5
	 Ni0tEpEp091k+JAfEBpWOeU1qrtFZWtVQq7zhk8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BCABF8026A;
	Tue, 13 Aug 2019 18:52:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FC4FF80273; Tue, 13 Aug 2019 18:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B008CF80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 18:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B008CF80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mW5YUm5w"
Received: by mail-wm1-x343.google.com with SMTP id e8so1466632wme.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 09:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qLtqPAsEGfnUp7CDjhn/8fwHbe2P4gxMdN6KrPmONdo=;
 b=mW5YUm5wvdISB+s0lKeJ43zd9eGbsQWF9DRWounfZBtWcu4JLOB8EQRlfB/rDhjSgr
 DKFYgTyZvuGRIpRyo7qQJiookhVDTq8mKof/6PoFQpMuAM+rvAYNuvYwnDTgRkzkbdyU
 l8Ig2cdjFoG1SQZcfNSo37LhmGznPEbjJ1q+DnJbjMlS87365uyRdL1U7wa/OvK5KjYT
 Bfd5R1xpzaiOA8rPWtkmfraEvd+7lDXCVRvYHzjyC4ajwXRgI/RSEA6IZGu/HhYzuW99
 TK+Gqiy54WUYpU20s7CUL6nkjGvhth9kyeBHhMX+SUBxOI6HHqyzPJ6B0TrpYWy7HA6K
 0B5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLtqPAsEGfnUp7CDjhn/8fwHbe2P4gxMdN6KrPmONdo=;
 b=JNPthdsH5fX2oonbpSVV8Gd+QjhTVOQ1p2JmLrTHLvMHUf9lKWkm1DkicQ+7dLN/R1
 PNXXejtVZIhXOExxyFRQx+OGyclHujE6RQSpy6Ayy/5o8fI0KPklRfMASAYACaWk9YSB
 40UPG3Ndb9O4l3ZOCIlm4UkJR0tV8KBd94HcjtNMOob9nVqi3t56zhD4YWaMJHjsWig0
 ny0+u50tNE2DW1VhCymhAUfEr/WLXFlI6gbAWabjjPhA1JHbRJVx267b+unu7qEBWN7s
 bUGnCmqvcphqgzBT2Nxd1XXjZDudouYuB45vvE172k3KonRebk74VCZXVNOg4eCxsil5
 kLfQ==
X-Gm-Message-State: APjAAAVdhim5ADeIsRZFXE2uBc+GbZ6UvNllVw0MejR9QOaC/+uKjOOC
 DD8uKP/VtlgQCJcUAKQMWoPNKQ==
X-Google-Smtp-Source: APXvYqyDTslYtT+nos0C9th5ic6vn8MyRNZrZ/a7bFDyc53Tg0MzTNOzv1OYn9FBo/c6bVTFIpy9QQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr4274787wml.77.1565715142658;
 Tue, 13 Aug 2019 09:52:22 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z8sm25678055wru.13.2019.08.13.09.52.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 09:52:22 -0700 (PDT)
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <95c517ab-7c63-5d13-a03a-1db01812bb69@intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <71fb21d0-3083-e590-db83-dbe489a4357e@linaro.org>
Date: Tue, 13 Aug 2019 17:52:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <95c517ab-7c63-5d13-a03a-1db01812bb69@intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, spapothi@codeaurora.org
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3LAoKT24gMTMvMDgvMjAxOSAxNzowMywgQ2V6YXJ5IFJvamV3
c2tpIHdyb3RlOgo+IE9uIDIwMTktMDgtMTMgMTA6MzUsIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3Jv
dGU6Cj4+IE9uIHBsYXRmb3JtcyB3aGljaCBoYXZlIHNtYXJ0IHNwZWFrZXIgYW1wbGlmaWVycyBj
b25uZWN0ZWQgdmlhCj4+IHNvdW5kd2lyZSBhbmQgbW9kZWxlZCBhcyBhdXggZGV2aWNlcyBpbiBB
U29DLCBpbiBzdWNoIHVzZWNhc2VzIG1hY2hpbmUKPj4gZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRv
IGdldCBzZHcgbWFzdGVyIHN0cmVhbSBmcm9tIGRhaSBzbyB0aGF0IGl0IGNhbgo+PiB1c2UgdGhl
IHJ1bnRpbWUgc3RyZWFtIHRvIHNldHVwIHNsYXZlIHN0cmVhbXMuCj4+Cj4+IHNvdW5kd2lyZSBh
bHJlYWR5IGFzIGEgc2V0IGZ1bmN0aW9uLCBnZXQgZnVuY3Rpb24gd291bGQgcHJvdmlkZSBtb3Jl
Cj4+IGZsZXhpYmlsaXR5IHRvIGFib3ZlIGNvbmZpZ3VyYXRpb25zLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBTcmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+
Cj4+IC0tLQo+PiDCoCBpbmNsdWRlL3NvdW5kL3NvYy1kYWkuaCB8IDEwICsrKysrKysrKysKPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc291bmQvc29jLWRhaS5oIGIvaW5jbHVkZS9zb3VuZC9zb2MtZGFpLmgKPj4gaW5kZXgg
ZGM0OGZlMDgxYTIwLi4xZTAxZjRhMzAyZTAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvc291bmQv
c29jLWRhaS5oCj4+ICsrKyBiL2luY2x1ZGUvc291bmQvc29jLWRhaS5oCj4+IEBAIC0yMDIsNiAr
MjAyLDcgQEAgc3RydWN0IHNuZF9zb2NfZGFpX29wcyB7Cj4+IMKgwqDCoMKgwqAgaW50ICgqc2V0
X3Nkd19zdHJlYW0pKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB2b2lkICpzdHJlYW0sIGludCBkaXJlY3Rpb24pOwo+PiArwqDCoMKgIHZvaWQg
KigqZ2V0X3Nkd19zdHJlYW0pKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLCBpbnQgZGlyZWN0aW9u
KTsKPj4gwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqAgKiBEQUkgZGlnaXRhbCBtdXRlIC0g
b3B0aW9uYWwuCj4+IMKgwqDCoMKgwqDCoCAqIENhbGxlZCBieSBzb2MtY29yZSB0byBtaW5pbWlz
ZSBhbnkgcG9wcy4KPj4gQEAgLTQxMCw0ICs0MTEsMTMgQEAgc3RhdGljIGlubGluZSBpbnQgCj4+
IHNuZF9zb2NfZGFpX3NldF9zZHdfc3RyZWFtKHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLAo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9UU1VQUDsKPj4gwqAgfQo+PiArc3RhdGljIGlu
bGluZSB2b2lkICpzbmRfc29jX2RhaV9nZXRfc2R3X3N0cmVhbShzdHJ1Y3Qgc25kX3NvY19kYWkg
KmRhaSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaW50IGRpcmVjdGlvbikKPj4gK3sKPj4gK8KgwqDCoCBpZiAoZGFpLT5kcml2ZXItPm9w
cy0+Z2V0X3Nkd19zdHJlYW0pCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGFpLT5kcml2ZXIt
Pm9wcy0+Z2V0X3Nkd19zdHJlYW0oZGFpLCBkaXJlY3Rpb24pOwo+PiArwqDCoMKgIGVsc2UKPj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FTk9UU1VQUCk7Cj4+ICt9Cj4gCj4gRHJv
cCByZWR1bmRhbnQgZWxzZS4KTm90IGFsbCB0aGUgZGFpIGRyaXZlcnMgd291bGQgaW1wbGVtZW50
IHRoaXMgZnVuY3Rpb24sIEkgZ3Vlc3MgZWxzZSBpcyAKbm90IHJlZHVuZGFudCBoZXJlIQoKLS1z
cmluaQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
