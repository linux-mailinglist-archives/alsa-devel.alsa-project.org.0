Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE5873FF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 10:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753CA1668;
	Fri,  9 Aug 2019 10:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753CA1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565339180;
	bh=Wq+MtTvP++PRINBu+79NjYCxuTNl9HnbFE6KGKh4krs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NvLiqoIDMmKBP9ReGcXPNEfWehoI5VURMyVg8znt+yIyrev/aLQtB90QmiUWlslE4
	 kzODobtS6n77UYjB6pwrOMVWuj9GrPYnTQa7xpGp8qKol7lR4H8jvG7zRZxG52nRSc
	 1u6FmOnfXig92M8T4uVxlq/tzzv3ipjAJH+VUPow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A6CF803F3;
	Fri,  9 Aug 2019 10:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5542CF803F3; Fri,  9 Aug 2019 10:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B0EF800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 10:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B0EF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hpCkRRnR"
Received: by mail-wm1-x344.google.com with SMTP id p74so4814222wme.4
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8CRcuLlZBVUoudDmKIo2V95xe+m342E7hqInXMzRQt8=;
 b=hpCkRRnRSXdDdd+u+TyuDO6eNse5HxqOgqPvragd7b+RDtJkx9YLO2C4uiJbN14bJA
 9tayvMQ3/TW7TeIbSLVrxmffwymAR0mpib3vKHYh8/xACPg4fAo6aVaM/0Zn2y1D5/Jp
 PFXcwCIjwCZ3/+rKuCpZZ2TOHmEKA72vKoL9OurIyQUNlVK6CUspyygJ933U03FmP85A
 vKEDVcozT0bJsYUS1CRjuaC9wA3a+7kU0KWYpTMKFqS1cbJtI5kANEty4VAXgcXh4uBu
 RgaIGgV7T9I0drXfpAntSNjFN+nVodqv+AZE6KjtF+bBCPCOdDx3vQileD9dmA2NR0XL
 MidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8CRcuLlZBVUoudDmKIo2V95xe+m342E7hqInXMzRQt8=;
 b=qfUWTQE65z9UwZ7HmEhqZuFBw+YFF2MSUdHNmXogz45jyxbfB8JJW/iig1bCeMOTEJ
 ii7yCtptj8ArwKxkSqAQJ0COkOlfgdOyVic8S10OYkcCim5H89bsPELwDJgnm/XKfs/n
 K6FZccBAkluq6nvRlsAkKnOw3aN6nFsmgzU+SBXQPuAX5yK19HBo0Om8o8ZM+f5qZe5T
 4YhqD/JJX3jpgeR1qZTpjJlOrn0EwECC8mWwsHfYpZVRD/49SHqPi13EsgLe2PNhR9vH
 a8GTeKc6xRAxQRR7sUTklD+WG5DJWLUd8OQS0Tvd9VXzq4zpaz6RfBeagoTSIgU669Jy
 i9CQ==
X-Gm-Message-State: APjAAAXuXnS5yMgFddmNJiH4SeP0/t9roemFDtYiQrhEAUK8tr/r6NjV
 +3dMfvUdVUk8ZmGPRcuu1r4akMytKb8=
X-Google-Smtp-Source: APXvYqyVzJUw2M7RRl4NadS2ltOeMpoO+u8ylbDe75BC7y7RRzAQad3Qs+baCXwnoNQwkk2wXSyA3g==
X-Received: by 2002:a1c:c742:: with SMTP id x63mr9871453wmf.0.1565339087435;
 Fri, 09 Aug 2019 01:24:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w23sm4730828wmi.45.2019.08.09.01.24.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 01:24:46 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
 <42ca4170-0fa0-6951-f568-89a05c095d5a@linux.intel.com>
 <564f5fa4-59ec-b4e5-a7a5-29dee99039b3@linaro.org>
 <20190809054602.GK12733@vkoul-mobl.Dlink>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ff9144ce-a4d1-a3fd-ab49-256367413b11@linaro.org>
Date: Fri, 9 Aug 2019 09:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190809054602.GK12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] soundwire: core: add device tree
 support for slave devices
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

CgpPbiAwOS8wOC8yMDE5IDA2OjQ2LCBWaW5vZCBLb3VsIHdyb3RlOgo+Pj4+ICtpbnQgc2R3X29m
X2ZpbmRfc2xhdmVzKHN0cnVjdCBzZHdfYnVzICpidXMpCj4+Pj4gK3sKPj4+PiArwqDCoMKgIHN0
cnVjdCBkZXZpY2UgKmRldiA9IGJ1cy0+ZGV2Owo+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9u
b2RlICpub2RlOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGZvcl9lYWNoX2NoaWxkX29mX25vZGUoYnVz
LT5kZXYtPm9mX25vZGUsIG5vZGUpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNkd19z
bGF2ZV9pZCBpZDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqY29tcGF0ID0gTlVM
TDsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaW50IHVuaXF1ZV9pZCwgcmV0Owo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpbnQgdmVyLCBtZmdfaWQsIHBhcnRfaWQsIGNsYXNzX2lkOwo+Pj4+ICsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgY29tcGF0ID0gb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJjb21wYXRpYmxl
IiwgTlVMTCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghY29tcGF0KQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gc3NjYW5mKGNvbXBhdCwgInNkdyV4LCV4LCV4LCV4IiwKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJnZlciwgJm1mZ19pZCwgJnBhcnRfaWQsICZjbGFzc19pZCk7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgIT0gNCkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldl9lcnIoZGV2LCAiTWFuZiBJRCAmIFByb2R1Y3QgY29kZSBub3QgZm91bmQgJXNc
biIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXQpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2Rl
LCAic2R3LWluc3RhbmNlLWlkIiwgJnVuaXF1ZV9pZCk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChyZXQpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkluc3Rh
bmNlIGlkIG5vdCBmb3VuZDolZFxuIiwgcmV0KTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb250aW51ZTsKPj4+IEkgYW0gY29uZnVzZWQgaGVyZS4KPj4+IElmIHlvdSBoYXZlIHR3byBp
ZGVudGljYWwgZGV2aWNlcyBvbiB0aGUgc2FtZSBsaW5rLCBpc24ndCB0aGlzIHByb3BlcnR5Cj4+
PiByZXF1aXJlZCBhbmQgdGhhdCBzaG91bGQgYmUgYSByZWFsIGVycm9yIGluc3RlYWQgb2YgYSBj
b250aW51ZT8KPj4gWWVzLCBJIGFncmVlIGl0IHdpbGwgYmUgbWFuZGF0b3J5IGluIHN1Y2ggY2Fz
ZXMuCj4+Cj4+IEFtIG9rYXkgZWl0aGVyIHdheSwgSSBkb250IG1pbmQgY2hhbmdpbmcgaXQgdG8g
cmV0dXJuaW5nIEVJTlZBTCBpbiBhbGwgdGhlCj4+IGNhc2VzLgo+IERvIHdlIHdhbnQgdG8gYWJv
cnQ/IFdlIGFyZSBpbiBsb29wIHNjYW5uaW5nIGZvciBkZXZpY2VzIHNvIG1ha2VzIHNlbnNlCj4g
aWYgd2UgZG8gbm90IGRvIHRoYXQgYW5kIGNvbnRpbnVlIHRvIGNoZWNrIG5leHQgb25lLi4KClRo
YXQgd2FzIG15IGluaXRhbCBwbGFuLgpQaWVycmUgc3VnZ2VzdGVkIGEgYmV0dGVyIGNvbXBhdGli
bGUgdG8gaW5jbHVkZSBpbnN0YW5jZSBJRCBhbmQgTGlua0lEIApzbyB0aGlzIGNoZWNrIHdvdWxk
IGJlIHBhcnQgb2YgdGhlIGNoZWNrIG9uZSBiZWZvcmUgdGhpcyBsaW5lLgoKLS1zcmluaQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
