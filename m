Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C0915A827
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 12:45:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D477B1679;
	Wed, 12 Feb 2020 12:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D477B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581507926;
	bh=5vt7eMLvAUe20XKUMOOPF+vh9I8L39S5nE1mIR8jy3Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rMrORT6DyehcoTOQhI7MEcNftk8e90dcqCLtol0bkISzZ00Ry1ATl4HXMy33y+ECh
	 +E/JzxA4TmFlNqPZDmVMmjWHSgD5YsWs2i4WpdyldlIhQ7vS6oXcEIMdE/raBi7Fj7
	 5JD8FKiYCOE2fjbT31RAz/A6z6zNxixl2YzEhnbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0598DF8014F;
	Wed, 12 Feb 2020 12:43:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A5FAF80157; Wed, 12 Feb 2020 12:43:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D886F800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 12:43:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D886F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lDfQr6Li"
Received: by mail-wm1-x344.google.com with SMTP id p9so1856346wmc.2
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 03:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KOvpD7jZ6dU2lykqqwZ1WffWjcj24MrFs0WAUYdtKH4=;
 b=lDfQr6Liipb++iFWX6iJLPM9MLax/98YrjUMx2NSCP8nRQEJxYPjeazAW44phauv1J
 zDMSgxErIqX4lltTO8KyGkxULwpxH6e9bJjady6qCsW+AebfdzEjQF+Mcss/P6lo3+OS
 FF91PfU0aV/URWm4wh3GjSVnh613RzCiGx7tWGzzdRYi6ewXTPYxFjEv1efuDc7Jqwge
 zn5xpPgaLdj2zpQqUiy9CKCUKgX907JZl8MXHgLWLPzbAIeBDfLt3go9I+tWL4EHPVdP
 006LMBAjbJpqTAWatWWABjuhtYLmX8EQ7svmcDYwPWKzjX5P+6qeN/fAarriHxmM6Zfn
 q7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KOvpD7jZ6dU2lykqqwZ1WffWjcj24MrFs0WAUYdtKH4=;
 b=eX5BZ771oz0Tz/4y56yzUHBeIey40mOKvkMGxkkLS3a6dtRH7+DNrJJndOPR8lnCZr
 lP5g1VUHdxGkPiNR6GU5eguWCQylccCTYFBsetHR+IhkVYnX8MpdoVt/tgCF9JzWnrGo
 xYITNn9KkGtqZr8OwCpahISVX2o1GmBGd2/nJvmz15VVgBI/8PA7YEtYkcoHqTGbmDdJ
 4elPIocwsQBuQ5/4kZo5O2TDAeqby8iM8+bltn1OnGFUb/tN2sTXmKCIfX5JCUnuHtt+
 dHULEWDSJccNCMOHaIRumYjLxMmvQoQ29pyC0N56moFewdMmf6KVU/+divHz0aVzY8E4
 shtQ==
X-Gm-Message-State: APjAAAUrIRTlCUnkfucDiUUJo32kjagr6ksQriaESyQ9iFwdBOkqovv8
 335fQ6CRGD1T5+br/y4JaEbn2Q==
X-Google-Smtp-Source: APXvYqzE17zeWea41ReY8EYtUfOouJpQCc5O05qfY1oQPGPCmX9DhPfP9NiRKKy53KgUTk1hUJxU6A==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr11846557wmg.167.1581507821024; 
 Wed, 12 Feb 2020 03:43:41 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q130sm473499wme.19.2020.02.12.03.43.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Feb 2020 03:43:38 -0800 (PST)
To: Adam Serbinski <adam@serbinski.com>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-7-adam@serbinski.com>
 <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
 <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b5c1328a-e3ca-826d-9ff0-f2bbce24ac22@linaro.org>
Date: Wed, 12 Feb 2020 11:43:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2989c09149976a28d13d4b4eb10b7c7e@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe
 pcm dt binding documentation
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

CgpPbiAxMi8wMi8yMDIwIDExOjAxLCBBZGFtIFNlcmJpbnNraSB3cm90ZToKPj4+Cj4+PiArCj4+
PiArIC0gcWNvbSxwY20tc2xvdC1tYXBwaW5nCj4+PiArwqDCoMKgIFVzYWdlOiByZXF1aXJlZCBm
b3IgcGNtIGludGVyZmFjZQo+Pgo+PiBBcmUgdGhlc2Ugbm90IHNwZWNpZmljIHRvIDhrIGFuZCAx
NmsgbW9kZSA/Cj4+IFdlIHNob3VsZCBwcm9iYWJseSBsaXN0IHZhbHVlcyBmb3IgYm90aCBtb2Rl
cyBoZXJlLgo+IAo+IE5vLCB0aGlzIGlzIGp1c3QgdGhlIG9mZnNldCB0aGF0IHRoZSBhdWRpbyBz
YW1wbGUgaXMgcGxhY2VkIGluIHdpdGggCj4gcmVzcGVjdCB0byBhIG1heGltdW0gb2YgNCBzbG90
cywgMTYgYml0cyB3aWRlLCBiZWdpbm5pbmcgd2l0aCB0aGUgc3luYyAKPiBwdWxzZS4KCgpUaGF0
J3Mgbm90IHRydWUgYXRsZWFzdCBieSB0aGUgUURTUCBkb2N1bWVudGF0aW9uLAphY2NvcmRpbmcg
dG8gaXQgd2Ugd2lsbCB1c2UgbW9yZSBzbG90cyB0byB0cmFuc2ZlciBhdCBoaWdoZXIgc2FtcGxl
IApyYXRlLiBleDoKMTYga0h6IGRhdGEgY2FuIGJlIHRyYW5zZmVycmVkIHVzaW5nIDgga0h6IHNh
bXBsZXMgaW4gdHdvCnNsb3RzLgoKQWxzbyB0aGVyZSBhcmUgMzIgc2xvdHMgZm9yIGVhY2ggb2Yg
NCBzdXBwb3J0ZWQgY2hhbm5lbHMgZm9yIFBDTSBBRkUgcG9ydC4KCgo+IAo+IFdoZW4gc3dpdGNo
aW5nIGJldHdlZW4gOCBhbmQgMTZrIHNhbXBsZSByYXRlLCBpdCBpcyBqdXN0IHRoZSBzeW5jIHB1
bHNlIAo+IHJhdGUgdGhhdCBpcyBjaGFuZ2VkLiBUaGUgYXVkaW8gc2FtcGxlIHdpbGwgYmUgZGVs
aXZlcmVkIGluIHRoZSBzYW1lIAo+IHNsb3QsIGp1c3QgYXQgYSBkaWZmZXJlbnQgZnJlcXVlbmN5
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
