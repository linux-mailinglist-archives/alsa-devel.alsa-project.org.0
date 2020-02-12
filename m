Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8231B15A561
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 10:54:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 144541686;
	Wed, 12 Feb 2020 10:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 144541686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581501274;
	bh=1hAavr6FFAlnzMe6iZntAgquPqEpne0WSRPrUcoGsQ4=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PrwOJV+qEW2E/upzCefrqi3hUY59POXx6wXQz3xp4BEu0dMIgJtwryQ7Zgxk1Z+GG
	 tMRcsHXah4CrMhgDkCXT6mbP4AUE9b3MPEnTIe6umb6+y/uPS3VN4UzxglJ2ptBus6
	 ufmCLi7ihF48dWavfF0CFsHelLB0anT4CBOUtEuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC1FF80158;
	Wed, 12 Feb 2020 10:53:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA3BF8019B; Wed, 12 Feb 2020 10:53:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 591CCF8014F
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 10:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 591CCF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="u9m2Yshy"
Received: by mail-wr1-x444.google.com with SMTP id m16so1382185wrx.11
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yOWsJgHXZuM43+uu9LOFAsCRPWTVXnpDLuoV98thPag=;
 b=u9m2YshyI8yy/fuehpb8RwqSIycSNchwZr20ZOFgMxXs5xH+ouy/8hhoF3kYZM889c
 C67AE0RDBV4IcsYZm5yUv2RyNrXoJfKnEc5rTgSDgDDlVeOTDeQIYmKLQv9AK3vuD8Eu
 MUZo8aIBJ6BMCdWo/FOgJkEihjDLj/KjoFquosK4p0x+5T6lBH3WVVTxh48C8lzX5kIu
 dsVq24OH2u/yGckWkaSrmGJEV02yU/ravwzaIDzsLq7YxNkbu9GO/+AYcZ+tudvDdS2B
 unAkgw1RrPhYoQmLiu7OERT/cmy/KNtb3s2gORNIP2SvP9vn4UagBbZ7dQm9plic0vHU
 oE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOWsJgHXZuM43+uu9LOFAsCRPWTVXnpDLuoV98thPag=;
 b=tzOQceZcmVj1OkDuOqhm+fk7RGEl667/96Nerp8z/aFtYze1FnQb30HsXdiUgc+dqG
 uLQfjRP4ovVqut608GQsXTkZAMqXQCAZBvfMezxkr9kpmSbhvd4YKyrHWzsLxmY5nMbw
 eZ3pAW36B76gwsDiBMwplExNZxWxGlSmI+qT7G+/fsw3qZk+JK763CkiSkltZY2zlZp3
 +POQpdYUlF4yA3JIjGDxTX44FDHc1MUax1RDa0Na5WaAb23MHAF4pGix+7PWYrCWd41J
 aD+0WTBWLublrgOLI8Qb08Z0AmLN5ytysI7BdxLBrsw3AYsfkVd3TEa0d5kYjykiMyM8
 6+lg==
X-Gm-Message-State: APjAAAXlgs2xYiXJ2uD/50GcLgVWkZk+f3KeeAc9sCLff/MaMpCpoZyJ
 1HbXV2T1gB5xXuwPmlD84J4ZiA==
X-Google-Smtp-Source: APXvYqzaWASCq9oTzeguO9TliT5Fv8gq1QYgqhC7hAV9dwbVqF9vZ/u7BBNK8pP59w0DmP/sZhKLqA==
X-Received: by 2002:a5d:5148:: with SMTP id u8mr15044395wrt.132.1581501211277; 
 Wed, 12 Feb 2020 01:53:31 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f1sm8992892wro.85.2020.02.12.01.53.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Feb 2020 01:53:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Adam Serbinski <adam@serbinski.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-4-adam@serbinski.com>
 <1875fb89-6a25-0d1a-c367-183ae6980ac8@linaro.org>
Message-ID: <d0fdfa51-c4ed-4f82-149d-1ffb32e1efdf@linaro.org>
Date: Wed, 12 Feb 2020 09:53:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1875fb89-6a25-0d1a-c367-183ae6980ac8@linaro.org>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 3/6] ASoC: qdsp6: q6afe-dai: add support
 to pcm port dais
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

CgpPbiAxMi8wMi8yMDIwIDA5OjUyLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+IAo+IAo+
IE9uIDEyLzAyLzIwMjAgMDE6NTIsIEFkYW0gU2VyYmluc2tpIHdyb3RlOgo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicWNvbSxwY20t
cXVhbnR5cGUiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAmcHJpdi0+cXVhbnR5cGUpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYs
ICJObyBxdWFudHlwZSBmcm9tIERUXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdmFyaWFibGVfdTMyX2FycmF5
KG5vZGUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJxY29tLHBjbS1zbG90LW1hcHBpbmciLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwcml2LT5zbG90X251bWJlcl9tYXBwaW5nLAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxLCBBRkVfTUFYX1BDTV9T
TE9UX0NPVU5UKTsKPiAKPiBUaGVzZSBuZXcgYmluZGluZ3MgbmVlZHMgdG8gYmUgZG9jdW1lbnRl
ZCBpbiAKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcWNvbSxxNmFm
ZS50eHQKClJlcGxpZWQgdG9vIHF1aWNrbHkhCgpJIHdvdWxkIG5vcm1hbGx5IGhhdmUgZXhwZWN0
ZWQgYmluZGluZ3MgcGF0Y2ggYmVmb3JlIHRoaXMgcGF0Y2ggdGhvdWdoLi4KCi0tc3JpbmkKCj4g
Cj4gLS1zcmluaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
