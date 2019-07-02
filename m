Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A4F5D462
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 18:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2880216A0;
	Tue,  2 Jul 2019 18:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2880216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562085518;
	bh=ksGtjXgmX/AbzhNjd/e1D563GJwWuHdVmIAHNmFXzos=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XqTyRmovL9z919rTp3Z8KnKaZDUfaeJFoRkLWJG4O/VJTGuSdVwMMrksEY80r+Eh5
	 mun5JYH7Pm9jGRH93bgvAvxUw5LJztY8ajAE5OK6HioNECckCmqcACd1ZFAenipFeR
	 fu/WN8O7uDfw3HG9yhKCl+lLxr945D5H31LwrpJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E260F800C1;
	Tue,  2 Jul 2019 18:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DAB2F800C9; Tue,  2 Jul 2019 18:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E294F800C1
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 18:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E294F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OngUtG0d"
Received: by mail-wr1-x441.google.com with SMTP id f9so18547324wre.12
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lF9soJyMkLeLjJhltqgLaauR5o64m7hdxOWdTW6RC9w=;
 b=OngUtG0dms5ero2nERh945lhF4ggvecPo0sVQdqHGK3zgIXPzu5be420mEmW0sIZMM
 Y+JP0FPRTRlO0TrobF+KJQtf9Vd95dspmwFAWX7o6Wv5mBrhr9CCk3u+fzFEvuRawuUj
 khNo0wSvhkv3gxx2VKECsgHFqEPy6lvo3+8I+MLzv1kYrYtlQHGs4oNJNiXpO7lMPalD
 VD6kCBIJ7qTO6jaBWGKmbOrnMLtClODZ9FZ9JLdhMV0U/k6cJJm/TTB0Aj22iO06jll+
 UtbS5TO7SFGHnIMJQBUwE6Zz9QMHBB9CLgqLV++uxCcUuaFzVXBL+iA7wM2I1IQi8cGB
 q7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lF9soJyMkLeLjJhltqgLaauR5o64m7hdxOWdTW6RC9w=;
 b=M5L2h1+CtiawFKA3o2fM5FwqfuCyr1Nuhmx/nZqgK4RTMBqO4UVFXHBmBPlppN/TyT
 ts5qBviyfWOyRKdH4Akur1YKvWpYYQ574hYwngOIIQ0GgAM+VBJ0W3yybF/0UEqDi+bz
 Z5+Ue4310X6aatxWNHE+O1DLKpsSHc3Ltp3HSQ12GxZXhwoBVcQw0u+Ec4w6600Gnid8
 /BdKSbxjfzk3s9TvPQElWcobce/Ikl7n+G3F8HU/0YnNFRDM5IOqwOxXHSVLI53lBdQQ
 RMUXgTaQ5yq5wZ0y3FhMlMhf66kCwZ+TczhcApe43ayKGKOX8pSSav4IYzVHE+NfIUjV
 htiA==
X-Gm-Message-State: APjAAAUoFcBv3i605YzEQzmsOT9jLdRfiM1lVrgGJAuJ/4e1lYqRly1Z
 LFB43p5zVlwe79jg5K5R+Yf9ew==
X-Google-Smtp-Source: APXvYqzZoQoXmz5sJbp7Bi5qHFRSp7zCr3pYOlnxEzqrYBGohTyKncQ7NWjPSo8Wggto7O9ZsuvnGA==
X-Received: by 2002:adf:ab0f:: with SMTP id q15mr8488551wrc.325.1562085409297; 
 Tue, 02 Jul 2019 09:36:49 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id v67sm4531145wme.24.2019.07.02.09.36.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 09:36:48 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-2-srinivas.kandagatla@linaro.org>
 <20190702140252.GO2793@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <fa816433-71d1-e7ad-7fd9-fcc306c665ff@linaro.org>
Date: Tue, 2 Jul 2019 17:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190702140252.GO2793@sirena.org.uk>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, robh+dt@kernel.org, srini@kernel.org
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
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

Thanks for the review,

On 02/07/2019 15:02, Mark Brown wrote:
> On Tue, Jul 02, 2019 at 09:09:15AM +0100, Srinivas Kandagatla wrote:
> 
>> +- qcom,micbias1-lvl:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: Should be voltage in milli Volts for micbias1 output
> 
> milivolts
> 
>> +	Supported values are in inbetween 1800mV-2850mV
> 
> in between

yes, I agree and I will fix them in next version.

thanks,
srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
