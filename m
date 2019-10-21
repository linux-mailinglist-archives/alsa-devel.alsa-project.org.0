Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70723DED61
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 15:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001D51616;
	Mon, 21 Oct 2019 15:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001D51616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571664080;
	bh=MuqN48+7qn8q6zcU1yqqKo3Cu1jLLZ55CUZckyet4Wo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7DDN9gwYHE4Qb72PBSudU657t9U+JI+3MBIdxN1g+qpJWpF6QmJHEZDcR3kU+JTl
	 Z9lwNVLSwgLIMcAwkv8fNb1GtMHSGyNq/x4uMJLacDOgA2HW4IGY7WhxpLYSmRH68j
	 cqtmUtoR/onruQq8YXt7iETvEdBbCLywvnRCoHfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5862AF8036F;
	Mon, 21 Oct 2019 15:19:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C8DF80368; Mon, 21 Oct 2019 15:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6CD5F800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 15:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6CD5F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="q9YWvNv9"
Received: by mail-wr1-x441.google.com with SMTP id r1so4163384wrs.9
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=IzXM9qRz/JzRTDA5ooE2NgWm+U2lHG9aYE8mnLThYtI=;
 b=q9YWvNv9ifnEpmf4fcGn790DbawpBkhYQbpIVJg3hYiigRmAsjCJXHurvRjsJbr33y
 GKAj9CRq9suFR+sT8bkXA66eo/oOwaQ8tVIgh8xTeyUwi3LXse8r+RohW9AKTnYXoZOJ
 G30a0Fwt09369m1iUluNcYAKO/M8Hjw81Wl0xvLiTo4rpxSjJbUz8GYnKERP1UGsco/V
 1AQp5U49KV73xRt8DhQWnoscHp1SDZ4FmHCi2q/M7u0w1ekqC+6fe7vPC9M2+U4Tu61t
 wRem0MnPSHUthaSTQfUD8G9zahBK5zqx0/4Wr/SUvo5wn0J5soLVVBwAEM5zeqsGdw05
 /q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IzXM9qRz/JzRTDA5ooE2NgWm+U2lHG9aYE8mnLThYtI=;
 b=EJ9LMVsQa+rgFamuTdi7tTcDk1Ng0Fg+sKHDkgyGSi8hckSS/rJjo4eNn8GGj+gm28
 xWzTXR/sDviY2jcm7Ogta/iSBVO1+P3azsyhYX+YsC1UIYKbdU5sze4OxTlldChQSU8v
 PzRCc4OdT15hgXfhF7sCqsl+aKt4XPsvdS+U5BGnp1NlMUjWJHcL1Xl8+wbhDXgNAfgM
 wYg5LG11qvM2s7hmsWajp4iKWiZA8R49U7X7x41ogVlqRggsyBilLp5qBAPshnCRXCrv
 1qlX73Cq4Jcq2HZXkoVjlVXbHHJ/FexwyI2NqFSQX034fGoX0eP5j2CsQsqGMg9dGtCI
 8r4A==
X-Gm-Message-State: APjAAAXKJ+yWP3F8a5yS9g09/YNFjInlCvW6JUjJKAHgTp+R+s2Tc0q9
 rAHd1GkAEOt4C4iVuxOxiyNn5Q==
X-Google-Smtp-Source: APXvYqzT82vjBtgcUeW0B+ywGszX0nXKvrB7d+PAaK9wi8U2cK7Uo07kUF1C0Fq2aDGrCrxNy/dEjw==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr5442650wrt.78.1571663969894; 
 Mon, 21 Oct 2019 06:19:29 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id v10sm11291181wmg.48.2019.10.21.06.19.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Oct 2019 06:19:29 -0700 (PDT)
Date: Mon, 21 Oct 2019 14:19:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191021131927.GJ4365@dell>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
 <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
 <20191021114520.GD4365@dell>
 <38dde3d9-8d7e-7dc0-7cba-137b43cea9d1@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38dde3d9-8d7e-7dc0-7cba-137b43cea9d1@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 02/11] mfd: wcd934x: add support to
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gTW9uLCAyMSBPY3QgMjAxOSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKCj4gCj4gCj4g
T24gMjEvMTAvMjAxOSAxMjo0NSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gTW9uLCAyMSBPY3Qg
MjAxOSwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiA+IAo+ID4gPiBUaGFua3MgTGVlIGZv
ciB0YWtpbmcgdGltZSB0byByZXZpZXcuCj4gPiA+IAo+ID4gPiBJIGFncmVlIHdpdGggbW9zdCBv
ZiB0aGUgc3R5bGUgcmVsYXRlZCBjb21tZW50cywgd2lsbCBmaXggdGhlbSBpbiBuZXh0Cj4gPiA+
IHZlcnNpb24uIEZvciBvdGhlcnMgSSBoYXZlIHJlcGxpZWQgaXQgaW5saW5lLgo+ID4gCj4gPiBb
Li4uXQo+ID4gCj4gPiA+ID4gPiArc3RhdGljIGludCB3Y2Q5MzR4X3NsaW1fc3RhdHVzKHN0cnVj
dCBzbGltX2RldmljZSAqc2RldiwKPiA+ID4gPiA+ICsJCQkgICAgICAgZW51bSBzbGltX2Rldmlj
ZV9zdGF0dXMgc3RhdHVzKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsJc3RydWN0IGRldmljZSAq
ZGV2ID0gJnNkZXYtPmRldjsKPiA+ID4gPiA+ICsJc3RydWN0IHdjZDkzNHhfZGF0YSAqd2NkOwo+
ID4gPiA+ID4gKwlpbnQgcmV0Owo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgc2VtYW50aWNhbGx5
IG9kZCEgIFdoeSBhcmUgeW91IGRvaW5nIG1vc3Qgb2YgdGhlCj4gPiA+ID4gaW5pdGlhbGlzYXRp
b24gYW5kIGJyaW5nLXVwIGluICdzdGF0dXMnIGFuZCBub3QgJ3Byb2JlJy4gIFNlZW1zCj4gPiA+
ID4gYnJva2VuIHRvIG1lLgo+ID4gPiAKPiA+ID4gU0xJTUJ1cyBkZXZpY2Ugd2lsbCBub3QgYmUg
aW4gYSBzdGF0ZSB0byBjb21tdW5pY2F0ZSBiZWZvcmUgZW51bWVyYXRpb24gKGF0Cj4gPiA+IHBy
b2JlKSwgc28gYWxsIHRoZSBkZXZpY2UgaW5pdGlhbGl6YXRpb24gaXMgZG9uZSBpbiBzdGF0dXMg
Y2FsbGJhY2sgd2hlcmUgaXQKPiA+ID4gaXMgcmVhZHkgZm9yIGNvbW11bmljYXRpb24uCj4gPiAK
PiA+IFdoeSBkbyB3ZSBuZWVkIHRoZSBkZXZpY2UgdG8gYmUgdXAgKmJlZm9yZSogY2FsbGluZyBw
cm9iZT8KPiA+IAo+IAo+IFRvIEluaXRpYWxpemUgdGhlIGRldmljZS4KPiBBbmQgU0xJTWJ1cyBk
ZXZpY2UgcmVnaXN0ZXJzIGFjY2VzcyBjYW4gbm90IGJlIGRvbmUgYmVmb3JlIGVudW1lcmF0aW9u
LgoKSSdtIG5vdCBzdXJlIHdoeSB5b3UgbmVlZCBhbnkgaGFyZHdhcmUgdG8gYmUgZW5hYmxlZCBi
ZWZvcmUgY2FsbGluZwoucHJvYmUoKS4gVGhhdCBpcyB0aGUgcHVycG9zZSBvZiAucHJvYmUoKS4g
VGhlIG9ubHkgd2F5IGluIHdoaWNoIEkgY2FuCnNlZSB0aGlzIGJlaW5nIGEgcmVxdWlyZW1lbnQg
aXMgaWYgaW5mb3JtYXRpb24gbG9jYXRlZCBvbiB0aGUgZGV2aWNlCmlzIHJlcXVpcmVkIGluIG9y
ZGVyIHRvIGRvIGRldmljZS1kcml2ZXIgbWF0Y2hpbmcuCgpJbiB3aGljaCBjYXNlLCBob3cgd2Fz
IHRoZSAuc3RhdHVzKCkgZnVuY3Rpb24gbWF0Y2hlZD8KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
