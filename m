Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BCEDBBD
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 10:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE48B1729;
	Mon,  4 Nov 2019 10:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE48B1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572860247;
	bh=wiyG6Y/VVGifiMog3pvV4CXPQPFjB7IXlYsKThrJcw0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+B9DuzumowcBxU6Poc4cxdqzJMaBXCTMsAy6FGIvwm3YyadecUqAXCcbfPoP+0WE
	 v2jdn32BRWnuw5k10HXupPVYu9XqCgOIV/2YH6qAGFSZ5N7+Dt5ZSDi8rXX2V83irN
	 6ltePzq3tPlNrw2BRY8ZmO0H3PcbpmhVZpMrQ7SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58559F8015B;
	Mon,  4 Nov 2019 10:35:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC10F803F4; Mon,  4 Nov 2019 10:35:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB895F8019B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 10:35:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB895F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cbz46ZF4"
Received: by mail-wr1-x441.google.com with SMTP id w18so16194404wrt.3
 for <alsa-devel@alsa-project.org>; Mon, 04 Nov 2019 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/q/Jy46HAl5qDXGb5pMNUar0Ktcd+mxfRNJZDPc+0iA=;
 b=cbz46ZF4/8Y+P96GJfJgqFSAzXtlzcvpN6rYWoHc+Bc8gxO/OHCXy9vBcfZbht65VU
 cfjEYKbmRFxx8c4gfyYUwt5aF45wDHFz4Me5jgojTPUDHsJar6DdJRq1Tb5wvK89nWCx
 mJw8dvIDh0chO6vIDUmC2KucxY+vz8LaxmwiPaqqK+yw6RXFVnJzYYQAov7GqelcbGm0
 snLp2xSC+qkU8IQ4Jc3t1h87nvBIDMCQCt4RxtWiPdRSa8ibUa4AzoFq0ddXg47PRpL/
 mkHd/qFeSuq4B1l1WrRgn9gfigdbvZmzt0P5bdt2KC2q1mQ9O+nQekY19UFuTT0firaM
 U+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/q/Jy46HAl5qDXGb5pMNUar0Ktcd+mxfRNJZDPc+0iA=;
 b=bSVOwY0GXLppjW6kJb/4v+J7rHqwuCbzELlmEj8N9kIrs+x7tqvm5s81W0bir+whDw
 +tsSLBuk7dIQxHOGqgvDshkr7+PcSmfL6qDtPvwXLCP3MwyjTuY4KplT7PcZ5rfP/k1V
 HUvk/+F5s/xGkUcok+2zRb0t3ExNr72AMOKGM+RH/1rsXSJ2vH0NClLZYJC4gOloJ9HX
 8lTfatXYdzwbUFCcLRBGTtGSwxXYLQ7UmclhHD0Ow84Eyn96Y7GDPVjmt1osyf06onw7
 +T0N80dZPXZfiksxNX0pFBHsydlizC9bMMrSNfJW6vr7+mgNbKvpoby1dyDU4zXcPB8L
 OTUg==
X-Gm-Message-State: APjAAAVhj9VCY01JO+pbP1wtpB3o8HKGJuoy0r+gBQ8/00Xbj4h4BF/n
 voT04vh87JGXjU5tOLHHqOSF4w==
X-Google-Smtp-Source: APXvYqxElW8oVQU4a1AD6VV1NNkiEHVf6/MACgp9Py33Zz2M9a29Io3XDGtIDAPS4xVT66PYeZxpHQ==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr21444957wri.130.1572860135741; 
 Mon, 04 Nov 2019 01:35:35 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id b8sm9771016wrt.39.2019.11.04.01.35.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Nov 2019 01:35:34 -0800 (PST)
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
 <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
Date: Mon, 4 Nov 2019 09:35:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
Content-Language: en-US
Cc: Rob Herring <robh@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, bgoswami@codeaurora.org, vinod.koul@linaro.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v3 08/11] dt-bindings: pinctrl:
 qcom-wcd934x: Add bindings for gpio
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks for reviewing this!

On 03/11/2019 23:19, Linus Walleij wrote:
> On Tue, Oct 29, 2019 at 12:29 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
> 
>> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
>> gpio controller to control 5 gpios on the chip. This patch adds
>> required device tree bindings for it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 52 +++++++++++++++++++
> 
> The bindings look OK, but remind me if I have asked before (sorry then)
> does these GPIOs expose some pin control properties and that is why
> the driver is placed under pin control rather than the GPIO namespace?
> 
I don't remember you asking about this before :-),

This controller just has Output enable bits, No pin control properties.

As you suggested I can move this to drivers/gpio in next version.

Thanks,
srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
