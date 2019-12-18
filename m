Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA85124E82
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 17:58:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1AE826;
	Wed, 18 Dec 2019 17:57:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1AE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576688324;
	bh=iUyb9bEgqWN6UR0Ji5ddxR0kwwqh0FOl1R2cxs9cg+w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUAk/MZVQIIke67i1Oj1+nNfMdN4r0nmnyvbbwNqihSsMkZN+smcNvtER0VFf6+1A
	 0ZG8r1jBcHb/XGSPbzz8gbsdMqTvkCwvBUo8keU8+faAbPq9tJukBpvKy7dxhjKqui
	 EqzZDzBifvHbpu5Dgag1ma3OaVJ/m4Z+f34dM7Mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9416FF80247;
	Wed, 18 Dec 2019 17:57:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C6BF8022C; Wed, 18 Dec 2019 17:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88407F80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 17:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88407F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NG5VFsWc"
Received: by mail-wm1-x344.google.com with SMTP id p17so2719624wmb.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8jj912AzfGGR36Zyy9ypT1L40eB7VdydRDFRM+xeTvg=;
 b=NG5VFsWc8OpSQic9A+qnuy4tuyQZdBU9/nTqultIIQayP3uOueYT5vGA+8b6M1HV8h
 bxdKnjCmG+UfDHsM8noS2NBaSKlX8UL7eihej0mx97HbhLYXYKoJW254BhYko9SuLy33
 ljPy0UWL3KfqEm08I9Fd7J/fBnELrh2eBp/0uGIliwDzc/kmvW16bQSO86KgMZ77Oxc4
 7sqGqHZiqgXXKs8pBrz7C2h7PxHHGL67p3nWtaJN/ECZaGsgw7EBw5njpjDVuZ8FPbSS
 Rjj4RUZmI4aVN6NQis8G2s13S6sI8seJ9kRgafhXcBCCtsf7SDB1RN6ad4GwWfiVkZSS
 eEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8jj912AzfGGR36Zyy9ypT1L40eB7VdydRDFRM+xeTvg=;
 b=MkltdeanQ5I44dGqGRExhinvUna0ABNP/88SMx9AqGYugf4hmwNI/hCC+URfe6rGOW
 Oc3N9a0XzPBSsrK6YtwCnrIN7irE0GFMinVXw4XAdt4/h0UqgfSUEz+XwyxPgV9MdgDH
 uOIk3Zh7VG90wAGm449j+TS51S1cPIjNwZudzHc7aDGf6i6IpuelNXctxyG2gedvCdRB
 7pGn68YAfmpeGLvaTaAyiPpcyrKVJhmQUcO3if0pGWM0jZER2wVWy7puRJafbd9BdYbv
 ESPMWDvBLL4S6aZ4+nJBRKluFhgdLIEpJL7Dsdp7bMbCY3RfhoaZt1Gk6YtovZMqrmtE
 axSA==
X-Gm-Message-State: APjAAAWuW3z/wjcSQt6xYbylHl+JxSM8mETJTvlkrpBAuUFnONZPo9KN
 sncDwkEsxOc/ISjI9yVB+iviGw==
X-Google-Smtp-Source: APXvYqznvg70lQUmBT0CE2ypcnW1H3HGNTT/+ZStxK+nd5g6Jq0zy6bdSurZTVj87HNT3pvZgPeZVQ==
X-Received: by 2002:a1c:a382:: with SMTP id m124mr4472324wme.90.1576688214360; 
 Wed, 18 Dec 2019 08:56:54 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n14sm2981137wmi.26.2019.12.18.08.56.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 08:56:53 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
 <20191217121642.28534-4-srinivas.kandagatla@linaro.org>
 <20191218114624.GB3219@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <80a291dd-9063-ca34-08ac-5ed194e05e79@linaro.org>
Date: Wed, 18 Dec 2019 16:56:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191218114624.GB3219@sirena.org.uk>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lee.jones@linaro.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v5 03/11] ASoC: wcd934x: add support to
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 18/12/2019 11:46, Mark Brown wrote:
> On Tue, Dec 17, 2019 at 12:16:34PM +0000, Srinivas Kandagatla wrote:
> 
>> +config SND_SOC_WCD934X
>> +	tristate "WCD9340/WCD9341 Codec"
>> +	depends on SLIMBUS
>> +	select REGMAP_SLIMBUS
>> +	select REGMAP_IRQ
>> +	help
> 
> Why does this not depend on the MFD change?
My bad, I missed this, Will fix this in next spin.

thanks,
srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
