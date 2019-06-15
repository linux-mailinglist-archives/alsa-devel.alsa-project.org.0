Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0184702B
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 15:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083D41833;
	Sat, 15 Jun 2019 15:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083D41833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560605180;
	bh=eEbjQbBPUNDq0YopoTZeROzVD4LvmbnE0aRR9Voxgt4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ABs6dlC8cPrPVDHT0Jsfpm532ZSeKUgvbrrD3KYvlh0xrk61IJvist4Q2PDoQTjMy
	 HlmrRE/Jl4pqghmi8v77Yo3X0i72yK60HPr9JFO9oUIvjPoJuD0GjeaUGxodoxGM3Y
	 Tz2Q8ttj3ltPXS/tFRP8XUYD80V0bUQR3Mw2z8bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C49BF89703;
	Sat, 15 Jun 2019 15:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDDF9F80764; Sat, 15 Jun 2019 15:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A77BF80764
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 15:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A77BF80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hrZAMjX8"
Received: by mail-wr1-x441.google.com with SMTP id n4so5306709wrs.3
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vz/q3yDMdsUzgeQCzBXnpHKRw3aqbJ8VhrbofM0uGw8=;
 b=hrZAMjX8YAKjXxrPN9i4Ujy9ygbBRPJb7TBLpsXbIqdZpmx97Burm7sDohZe3gWnGF
 TpUVrUBYaelBUWac1wtnJih7fFCi36VlNHA0e3nFzUJuiQJhTe3pYWGswTK5rzHW85KD
 qcptH5g/EkwFUCv47c9uRFBpc2NGsez4A3/aBJnlybU95E2aY8F8DXzaB2vsTLfFwVA5
 PLa+dFmYzjuHdJSjcWWeO7ysyhLn1TnxbLMmP7Avh6u1ZqdeErA1Fodt6pOIMQ8DJJXB
 8rIChl80ANLmmnIjLwfoHD9EAhoiyDqlcExmWgSZNc2v2Du1hU+2obs+6DOufaJlTpLa
 iZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vz/q3yDMdsUzgeQCzBXnpHKRw3aqbJ8VhrbofM0uGw8=;
 b=I22l+WZrlJER3wHYC2qjXvvDPPg6EG98WRA7WFBf43EFqij6hnpmDDNxtqkDLIIK1K
 qfYjk8VEy9ozy8xcKu//A2vY0guMLg5zJZAjCVCxFoa1oKkJv1ZvqwT6uqxPYaM7TawE
 POidY6ma70BJPS9T8ZjBeR+GjRbRaG7Tmt33+qFuVUcnzU+p4M3CfqRk262wGJgQ3XNt
 pgegPYeWEemkL+HAkY9QXatHzIS4KyAV10hVLdCnrDjBDydJyG8dMPD5Wt8hC26MOCIG
 JRdjm6+6PC8e9enncn+sjljeuseGFn3HeEzPXnQDAL8TJNFWo8JZXMKE1VNp0NdxvJkS
 5pbQ==
X-Gm-Message-State: APjAAAWTVjzSNPtr6jf+sz/t282x8nQpgILGleoFKjGAX0w0gHOqUBSF
 Ns9j7yP4Srcl9Ioja2OMSNvcWA==
X-Google-Smtp-Source: APXvYqzT26v+cM8CuCpyQsf55a1zh1osMb6x36j5wWGQDXrAaSY2Q/a3yv9uJOPSOvdp22hdne9ejA==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr6384669wrq.151.1560605069518; 
 Sat, 15 Jun 2019 06:24:29 -0700 (PDT)
Received: from [192.168.86.29]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x16sm6168247wmj.4.2019.06.15.06.24.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Jun 2019 06:24:28 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
 <249f9647-94d0-41d7-3b95-64c36d90f8e8@linux.intel.com>
 <40ea774c-8aa8-295d-e91e-71423b03c88d@linaro.org>
 <7269521a-ac89-3856-c18c-ffaaf64c0806@linux.intel.com>
 <462620fc-ac91-6a36-46c7-7af0080f06cb@linaro.org>
 <0e836692-2297-4cb7-d681-76692db78a56@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d3ccd866-7bc5-9635-4bb4-6b0765f89835@linaro.org>
Date: Sat, 15 Jun 2019 14:24:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0e836692-2297-4cb7-d681-76692db78a56@linux.intel.com>
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

CgpPbiAxMS8wNi8yMDE5IDEzOjIxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
PiBPbiA2LzExLzE5IDU6MjkgQU0sIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6Cj4+Cj4+Cj4+
IE9uIDEwLzA2LzIwMTkgMTU6MTIsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4+Pj4g
Kwo+Pj4+Pj4gK8KgwqDCoCBpZiAoZGV2X2FkZHIgPT0gU0RXX0JST0FEQ0FTVF9ERVZfTlVNKSB7
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgY3RybC0+Zmlmb19zdGF0dXMgPSAwOwo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldCA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmY3RybC0+c3Bf
Y21kX2NvbXAsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbXNlY3NfdG9famlmZmllcyhUSU1FT1VUX01TKSk7Cj4+Pj4+Cj4+Pj4+IFRo
aXMgaXMgb2RkLiBUaGUgU291bmRXaXJlIHNwZWMgZG9lcyBub3QgaGFuZGxlIHdyaXRlcyB0byBh
IHNpbmdsZSAKPj4+Pj4gZGV2aWNlIG9yIGJyb2FkY2FzdCB3cml0ZXMgZGlmZmVyZW50bHkuIEkg
ZG9uJ3Qgc2VlIGEgY2xlYXIgcmVhc29uIAo+Pj4+PiB3aHkgeW91IHdvdWxkIG9ubHkgdGltZW91
dCBmb3IgYSBicm9hZGNhc3Qgd3JpdGUuCj4+Pj4+Cj4+Pj4KPj4+PiBUaGVyZSBpcyBkYW5nZXIg
b2YgYmxvY2tpbmcgaGVyZSB3aXRob3V0IHRpbWVvdXQuCj4+Pgo+Pj4gUmlnaHQsIGFuZCBpdCdz
IGZpbmUgdG8gYWRkIGEgdGltZW91dC4gVGhlIHF1ZXN0aW9uIGlzIHdoeSBhZGQgYSAKPj4+IHRp
bWVvdXQgKm9ubHkqIGZvciBhIGJyb2FkY2FzdCBvcGVyYXRpb24/IEl0IHNob3VsZCBiZSBhZGRl
ZCBmb3IgCj4+PiBldmVyeSB0cmFuc2FjdGlvbiBJTU8sIHVubGVzcyB5b3UgaGF2ZSBhIHJlYXNv
biBub3QgdG8gZG8gc28uCj4+Pgo+Pgo+PiBJIGRpZCB0cnkgdGhpcyBiZWZvcmUsIHRoZSBpc3N1
ZSBpcyB3aGVuIHdlIHJlYWQvd3JpdGUgcmVnaXN0ZXJzIGZyb20gCj4+IGludGVycnVwdCBoYW5k
bGVyLCB0aGVzZSBjYW4gYmUgZGVhZGxvY2tlZCBhcyB3ZSB3aWxsIGJlIGludGVycnVwdCAKPj4g
aGFuZGxlciB3YWl0aW5nIGZvciBhbm90aGVyIGNvbXBsZXRpb24gaW50ZXJydXB0LCB3aGljaCB3
aWxsIG5ldmVyIAo+PiBoYXBwZW4gdW5sZXNzIHdlIHJldHVybiBmcm9tIHRoZSBmaXJzdCBpbnRl
cnJ1cHQuCj4gCj4gSSBkb24ndCBxdWl0ZSBnZXQgdGhlIGlzc3VlLiBXaXRoIHRoZSBJbnRlbCBo
YXJkd2FyZSB3ZSBvbmx5IGRlYWwgd2l0aCAKPiBNYXN0ZXIgcmVnaXN0ZXJzIChzb21lIG9mIHdo
aWNoIG1pcnJvciB0aGUgYnVzIHN0YXRlKSBpbiB0aGUgaGFuZGxlciBhbmQgCj4gd2lsbCBvbmx5
IG1vZGlmeSBTbGF2ZSByZWdpc3RlcnMgaW4gdGhlIHRocmVhZC4gQWxsIGNoYW5nZXMgdG8gU2xh
dmUgCj4gcmVnaXN0ZXJzIHdpbGwgYmUgc3ViamVjdCB0byBhIHRpbWVvdXQgYXMgd2VsbCBhcyBh
IGNoZWNrIGZvciBubyAKPiByZXNwb25zZSBvciBOQUsuIE5vdCBzdXJlIHdoYXQgaXMgc3BlY2lm
aWMgYWJvdXQgeW91ciBzb2x1dGlvbiB0aGF0IAo+IHJlcXVpcmVzIGEgZGlmZmVyZW50IGhhbmRs
aW5nIG9mIGNvbW1hbmRzIGRlcGVuZGluZyBvbiB3aGljaCBkZXZpY2UgCj4gbnVtYmVyIGlzIHVz
ZWQuIEl0IGNvdWxkIHZlcnkgd2VsbCBiZSB0aGF0IHlvdSd2ZSB1bmNvdmVyZWQgYSBmbGF3IGlu
IAo+IHRoZSBidXMgZGVzaWduIGJ1dCBJIHN0aWxsIGRvbid0IHNlZSBob3cgaXQgd291bGQgYmUg
UXVhbGNvbW0tc3BlY2lmaWM/CgpTb3JyeSBJdCB0b29rIGJpdCBtb3JlIHRpbWUgZm9yIGRpZ2dp
bmcgdXAgdGhlIGlzc3VlIHdoaWNoIEkgZmFjZWQgCnByZXZpb3VzbHkgdG8gYW5zd2VyIHRoaXMg
cXVlcnkuIFRoaXMgaXMgbm93IGZpeGVkIGFuZCB2MiBwYXRjaHNldCBoYXMgCnNhbWUgaGFuZGxp
bmcgZm9yIGFsbCB0aGUgc2xhdmUgcmVnaXN0ZXJzIHJlYWQvd3JpdGVzIHdpdGggbm8gc3BlY2lh
bCAKY2FzaW5nLgoKVGhhbmtzLApzcmluaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
