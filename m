Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E1D2D03
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53C11691;
	Thu, 10 Oct 2019 16:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53C11691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570719288;
	bh=3z4IQ/fIXb8qW3ZwYDWSHrwOtstFFWyZYaJbEJULebA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tQP7Uo+NvXriipqh2vnu7hhqcq8h6PI9Fj75UxAEW8+ZFNuCXZLE+v43bzoSPGWh7
	 QUjalqXjAOULCOH+crkdrYJ6mIyB1kO3KjkatEVcGf2D+a/OWhTtQLZ1jWMXi4b8En
	 YQM3TqQHL4/4YEMLh8W0SJUNjMXD0TmwU8WxhAII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3275BF802BC;
	Thu, 10 Oct 2019 16:53:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E8B2F8038F; Thu, 10 Oct 2019 16:53:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 784B5F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 784B5F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YLVYojmZ"
Received: by mail-wm1-x343.google.com with SMTP id y21so7117306wmi.0
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 07:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ogX19xTF57aFe3oLSZTYbHqPylf65sw/BnbPhbpyza4=;
 b=YLVYojmZHRibGzAKjxCtdNVt6hLytCZAIUouc12/g7OHFSJVb8NVOYj0YBUxQHe3kI
 snTuCRqGWF2n7c0MYnfyNT3T1rcH7cza8Rg1hQ9xZacfZC4JT5OQtX3dfhuO0cLO8V9T
 vtG3hxajSr8lDjXfWWjjEvoi7qF+niiC/x/xzUGDiRCYnUu6hg+U/gsY53mgR57oTMoR
 rV5j+5o1JU0Eox4Q19cutYZyrt6eR3gBSghIdsf8DyVUdNKysyaUl51ymtl6yd+2uumM
 tcbt5uN4ohwUg+NkP0U3QTW3eXTqk9Ubz+YR/9T2k1qrCG6yX3zDJ+ZFjNtpiXClpgiH
 OVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ogX19xTF57aFe3oLSZTYbHqPylf65sw/BnbPhbpyza4=;
 b=X+5JYlPJhBdmR4dyZ7qJ/pGi/7ydQIG0hpjkm1jUHVn98EtddynHTXZP+FrUHCj7xN
 reqBeHVQSYDdavkjTj20Hyq96nv053JMnyElZMbbCj8dvi+toC3QcUwbA5Hew9F7wNwy
 4SdpZVihJsvz5kbxAoFr4Yh9RaNikWidUbeqhtZYPSMRryBvDpcCCAApZiBkgaKX+s/h
 402VY4xbdJvdwstl5eyuV9x+nI32DafKz5PBM1Ay9TpvEtMiRKRG5B+QYUMbUr+ZgO5N
 Odi94dIwVsWUwV5a8lq+xleXoQC272n3z+uSfBpU9lgIr4OLHrR6coJE8TeXAGjwAI1R
 Idnw==
X-Gm-Message-State: APjAAAULZiayuigtq9K58seRlgbOnInmTrMYWMdhvQiFeosmVtxntuqy
 iOUBehlqcYWv4PwYaesYxqRL7A==
X-Google-Smtp-Source: APXvYqy+Bih+cBnFUqfiyHx+rF6V6v2BcFAwwwBD4aNU4yH5OgKLOSMFASKwGYJnqnhU8L4hJZeIzQ==
X-Received: by 2002:a05:600c:2481:: with SMTP id
 1mr7649336wms.98.1570719178563; 
 Thu, 10 Oct 2019 07:52:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h17sm8308000wme.6.2019.10.10.07.52.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 07:52:57 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
 <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
 <20191010120337.GB31391@ediswmail.ad.cirrus.com>
 <22eff3aa-dfd6-1ee5-8f22-2af492286053@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e671930b-645a-7ee3-6926-eea39626c0a3@linaro.org>
Date: Thu, 10 Oct 2019 15:52:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22eff3aa-dfd6-1ee5-8f22-2af492286053@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, Vinod Koul <vkoul@kernel.org>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
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

CgpPbiAxMC8xMC8yMDE5IDE1OjAxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPj4+
PiBJdCdzIGJlZW4gYSB3aGlsZSBzaW5jZSB0aGlzIHRocmVhZCBzdGFydGVkLCBhbmQgSSBzdGls
bCBkb24ndAo+Pj4+IHF1aXRlIGdldCB0aGUgY29uY2VwdHMgb3IgbG9naWMuCj4+Pj4KPj4+PiBG
aXJzdCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgdGhlIHByb2JsZW0gd2l0aCAiYXV4IiBkZXZp
Y2VzIGlzLgo+Pj4+IEFsbCB0aGUgU291bmRXaXJlIHN0dWZmIGlzIGJhc2VkIG9uIHRoZSBjb25j
ZXB0IG9mIERBSSwgc28gSSBndWVzcwo+Pj4+IEkgYW0KPj4+Cj4+PiBUaGF0IGlzIHRoZSBhY3R1
YWwgcHJvYmxlbSEgU29tZSBhdXggZGV2aWNlcyBkb2VzIG5vdCBoYXZlIGRhaXMuCj4+Pgo+Pgo+
PiBVc3VhbGx5IGF1eCBkZXZpY2VzIGFyZSB1c2VkIGZvciB0aGluZ3MgbGlrZSBhbmFsb2cgYW1w
bGlmaWVycyB0aGF0Cj4+IGNsZWFybHkgZG9uJ3QgaGF2ZSBhIGRpZ2l0YWwgaW50ZXJmYWNlLCB0
aHVzIGl0IHJlYWxseSBtYWtlcyBubyBzZW5zZQo+PiB0byBoYXZlIGEgREFJIGxpbmsgY29ubmVj
dGluZyB0aGVtLiBTbyBJIGd1ZXNzIG15IHF1ZXN0aW9uIGhlcmUKPj4gd291bGQgYmUgd2hhdCBp
cyB0aGUgdGhpbmtpbmcgb24gbWFraW5nIHRoZSAic21hcnQgYW1wbGlmaWVyIiBkYWlsZXNzPwo+
PiBJdCBmZWVscyBsaWtlIGhhdmluZyBhIENPREVDIHRvIENPREVDIERBSSBiZXR3ZWVuIHRoZSBD
T0RFQyBhbmQKPj4gdGhlIEFNUCB3b3VsZCBiZSBhIG1vcmUgb2J2aW91cyB3YXkgdG8gY29ubmVj
dCB0aGUgdHdvIGRldmljZXMKPj4gYW5kIHdvdWxkIHByZXN1bWFibHkgYXZvaWQgdGhlIGlzc3Vl
cyBiZWluZyBkaXNjdXNzZWQgYXJvdW5kIHRoZQo+PiBwYXRjaC4KPiAKPiBBaCwgbm93IEkgZ2V0
IGl0LCBJIG1pc3NlZCB0aGUgcG9pbnQgYWJvdXQgbm90IGhhdmluZyBEQUlzIGZvciB0aGUgCj4g
YW1wbGlmaWVyLgo+IAo+IEkgd2lsbCBzZWNvbmQgQ2hhcmxlcycgcG9pbnQsIHRoZSBjb2RlIHlv
dSBoYXZlIGluIHRoZSBtYWNoaW5lIGRyaXZlciBhdCAKCkkgYWdyZWUgd2l0aCBDaGFybGVzLAoK
V1NBODgxMC9XU0E4ODE1IGlzIGNvbm5lY3RlZCB2aWEgU291bmRXaXJlIGRpZ2l0YWwgaW50ZXJm
YWNlLCBzbyBJIGNhbiAKdHJ5IHRvIG1vZGVsIHRoaXMgYW1wbGlmaWVyIHdpdGggZGFpcyBhbmQg
c2VlIGhvdyBpdCBlbmRzIHVwLgoKSSBzdGlsbCBuZWVkIHRvIGZpZ3VyZSBvdXQgcHJlZml4aW5n
IG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGlzIApBbXBsaWZpZXIgY29udHJvbHMgd2l0aCAiTGVm
dCIgYW5kICJSaWdodCIKCj4gWzFdIGdldHMgYSBTb3VuZFdpcmUgc3RyZWFtIGNvbnRleHQgZnJv
bSB0aGUgU0xJTWJ1cyBjb2RlYyBkYWkuIEl0J3MgYSAKPiBiaXQgb2RkIHRvIG1peCBsYXllcnMg
dGhpcyB3YXkuCgpZZXAgd2UgaGF2ZSBhIHZlcnkgbWl4ZWQgc2V0dXAgb24gdGhpcyBTb0MuCgpT
byBpdCBsb29rcyBsaWtlIHRoaXMuCk1haW4gV0NEOTM0WCBDb2RlYyB3aGljaCBpcyBjb25uZWN0
ZWQgdmlhIFNMSU1CdXMgd2hpY2ggaGFzIFNvdW5kV2lyZSAKQ29udHJvbGxlciBibG9jayBhbG9u
ZyB3aXRoIG90aGVyIGFuYWxvZyArIGRpZ2l0YWwgYmxvY2tzLgpBZ2FpbiB0aGUgU291bmRXaXJl
IENvbnRyb2xsZXIgZnJvbSB0aGF0IFdDRDkzNFggY29kZWMgaXMgd2lyZWQgdXAgdG8gCldTQTg4
MVggU21hcnQgc3BlYWtlciBhbXBsaWZpZXJzLgoKCj4gCj4gCj4gQW5kIGlmIEkgbG9vayBhdCB0
aGUgY29kZSBiZWxvdywgdGFrZW4gZnJvbSBbMV0sIGlmIHlvdSBoYXZlIG1vcmUgdGhhbiAKPiBv
bmUgY29kZWMsIHRoZW4geW91ciBjb2RlIGxvb2tzIHByb2JsZW1hdGljOiBkYXRhLT5zcnVudGlt
ZSB3b3VsZCBiZSAKPiBvdmVycmlkZW4gYW5kIHlvdSdkIHVzZSB0aGUgaW5mbyBmcm9tIHRoZSBs
YXN0IGNvZGVjIGRhaSBvbiB0aGUgZGFpbGluay4uLgoKVGhpcyBjb2RlIGhhcyBiZWVuIHdyaXR0
ZW4gdmVyeSBtdWNoIHNwZWNpZmljIHRvIERCODQ1YyB3aGljaCBoYXMgb25seSAKb25lIGNvZGVj
LiBCdXQgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQuCgotLXNyaW5pCgo+IAo+IGNhc2UgU0xJTUJV
U18wX1JYLi4uU0xJTUJVU182X1RYOgo+ICDCoCBmb3IgKGkgPSAwIDsgaSA8IGRhaV9saW5rLT5u
dW1fY29kZWNzOyBpKyspIHsKPiAgwqDCoMKgIFtzbmlwXQo+ICDCoMKgwqAgZGF0YS0+c3J1bnRp
bWVbY3B1X2RhaS0+aWRdID0KPiAgwqDCoMKgwqBzbmRfc29jX2RhaV9nZXRfc2R3X3N0cmVhbShy
dGQtPmNvZGVjX2RhaXNbaV0sIDApOyA8PCBzYW1lIAo+IGRlc3RpbmF0aW9uIGZvciBtdWx0aXBs
ZSBjb2RlY19kYWlzLi4uCj4gCj4gSWYgeW91IGtlZXAgdGhlIGFtcCBkYWktbGVzcywgdGhlbiB0
aGUgc3RyZWFtIGNvbmNlcHQgc2hvdWxkIGJlIHNvbWVob3cgCj4gYWxsb2NhdGVkIG9uIHRoZSBt
YXN0ZXIgKG9yIG1hY2hpbmUpIHNpZGUgYW5kIHBhc3NlZCB0byB0aGUgY29kZWMgZGFpcyAKPiB0
aGF0IGFyZSBhc3NvY2lhdGVkIHRvIHRoZSBzYW1lICdzdHJlYW0nLgo+IAo+IAo+IFsxXSAKPiBo
dHRwczovL2dpdC5saW5hcm8ub3JnL3Blb3BsZS9zcmluaXZhcy5rYW5kYWdhdGxhL2xpbnV4Lmdp
dC90cmVlL3NvdW5kL3NvYy9xY29tL2RiODQ1Yy5jP2g9cmVsZWFzZS9kYjg0NWMvcWNvbWx0LTUu
MiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
