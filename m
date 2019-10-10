Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA5D2B8A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 15:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7DF7166F;
	Thu, 10 Oct 2019 15:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7DF7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570714840;
	bh=p9toHGB+oPpt5T5PQaNWXLxqr/RE2169jspIS/cRxLU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bahq9qVtUJF7dpy2o4Uj6nRydBT/ffLK/SwG6XpFtCWIVmDbevXH4aEYZfVL1SFVX
	 Fn+fQHElnEpCPnvsqpr4/lzw/IJyw4NV0Lu2D51Y7DKMpF4B1+/iEYgRcaWnrdcTl0
	 /4wGDeA+YbCNSqBn/kKBHu+GxLye4/o9+xcrgjQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6285AF8038F;
	Thu, 10 Oct 2019 15:38:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C882F8038F; Thu, 10 Oct 2019 15:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25CA5F80113
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 15:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25CA5F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c4rXOv/U"
Received: by mail-wr1-x441.google.com with SMTP id q9so7948236wrm.8
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNKHo7wC/215Tc8q4IYUbrHibFKH//hrOf2lUQhIP+k=;
 b=c4rXOv/U6+AGwyzEaBsCCLbaPQ5PuswG1a6LIjyTlEvCwnrKbXZnR6+HreuUwAWKCh
 x1F92c0aWJ7Lesa1HUS/neB+6UavBIP9tDmaDAWfVQLY6ATDftbfn+eE8qUA9lSiiwb0
 gbmHF+AjOTVGA+9uhTCzakVpyAGqzygdFxKJtBqLiwwyaB8uucpBFsrG40IC5MpekjvZ
 6FJsrXQxcT0U/zEHaiJNH/f62LGjOeH4L9NzahroreQZe3JPH7nD4UqJlS6TyDZvjijF
 H76aq0v43xsWi50NHm7CBZ8HdwL+3389nJ0QzbZBKWH9vbf5cIGJcguEpIKcuvvoLz49
 x1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNKHo7wC/215Tc8q4IYUbrHibFKH//hrOf2lUQhIP+k=;
 b=NZcvY9DwhxqACkbX+b3/kgkU7HfDctKK+ufpe7/i8a0xJxGu7LwFXp91UzdwyVsAxb
 A4DSpoGwCkZMXCu9irYWian5G6aR0XlpliP8dvQEeykT4RV9kC0o5bEF1qkSAAylLnqj
 zHDqO8jbr1BfRZRB4th+vud6YThmolcszG1jHEO+0GN7q+yEzshJXfiUelxVvT9yqUlY
 eU4Xcz9hXSZZc9XmxAwtBaer8cI0XLc3mnHEbcI+Pndt8TESe/T9w4pcdOmgZE+FkX7T
 RsLO1R3CeZ6M3xmqUXLu5QnSD40tBI2IfsuA6lQX45bQazQ75tBIM6yxjQEbyIDaRpdQ
 iaHg==
X-Gm-Message-State: APjAAAVpCempJ6nSJ2rUoOgs/gLU+dG5nxZiiPCyhmFIWoh+E3gegWXk
 4TnWxIsisJy6lVfQl1vyrpCXUQ==
X-Google-Smtp-Source: APXvYqztlBMqNL6y+jP0zl/tFHe7klxsBxWvq4OmxyJphjZ92KRbEFrRmvrcRFKdis6Ee/b8FEfGxw==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr3800979wrn.392.1570714730051; 
 Thu, 10 Oct 2019 06:38:50 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q10sm11593228wrd.39.2019.10.10.06.38.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:38:49 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
 <20191009163535.GK2036@sirena.org.uk>
 <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
 <20191010132314.GQ2036@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <32280055-dd4a-9573-58fa-0076955e9c92@linaro.org>
Date: Thu, 10 Oct 2019 14:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191010132314.GQ2036@sirena.org.uk>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v7 2/2] ASoC: codecs: add wsa881x amplifier
	support
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



On 10/10/2019 14:23, Mark Brown wrote:
> On Thu, Oct 10, 2019 at 10:28:04AM +0100, Srinivas Kandagatla wrote:
>> On 09/10/2019 17:35, Mark Brown wrote:
>>> On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:
>>>> +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {
> 
>>>> +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
>>>> +{
>>>> +	return wsa881x_reg_readable[reg];
> 
>>> There's no bounds check and that array size is not...
> 
>> I converted this now to a proper switch statement as other drivers do.
> 
>>>> +static struct regmap_config wsa881x_regmap_config = {
>>>> +	.reg_bits = 32,
>>>> +	.val_bits = 8,
>>>> +	.cache_type = REGCACHE_RBTREE,
>>>> +	.reg_defaults = wsa881x_defaults,
>>>> +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
>>>> +	.max_register = WSA881X_MAX_REGISTER,
> 
>>> ...what regmap has as max_register.  Uusually you'd render as a
>>> switch statement (as you did for volatile) and let the compiler
>>> figure out a sensible way to do the lookup.
> 
>> Sorry, I did not get your point here.
> 
>> Are you saying that we can skip max_register in this regmap config ?
>> Then how would max_register in regmap be set?
> 
> I'm saying that you appear to be relying on max_register to
> verify that you're not overflowing the array bounds but you
> max_register is not set to the same thing as the array size.

Thanks for clarification, I have removed the readable array in new 
version, removed multiple macros for max register and fixed max_register 
to point to last register.

--srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
