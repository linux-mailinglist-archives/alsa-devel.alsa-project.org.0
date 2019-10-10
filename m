Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6DD2655
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 11:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA331616;
	Thu, 10 Oct 2019 11:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA331616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570699805;
	bh=ZTmOiUHAxthhLhE5rhFGNw69EDWZTT1A3JpzjqrzecU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LJNydyHjaFy1qEwX6qmrAs44Lb12sqWp7Ie1vwCgocOsRhWstczmDdb007I52f79w
	 vK4id0WtZRbXVSE67kc7xcalnQ9EvAvtZvvv78A/xMuNVHvvnqz2yymT8PZV0yTDGY
	 KVZvXFf8N/pizTaWrqrI19vdGF0K/z8lxJmCO/es=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89220F80447;
	Thu, 10 Oct 2019 11:28:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F33A0F8038F; Thu, 10 Oct 2019 11:28:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33820F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 11:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33820F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vBgud5FU"
Received: by mail-wm1-x341.google.com with SMTP id 7so6140399wme.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D/ELkajn5nIeWjt+au+JukJPjjOmYN8ul5L5G8g9Cbw=;
 b=vBgud5FUoF0BluzVgOr5mc+3sO+QeVDiiFna1seL30oxei6d/G1Gcn6OURjpSV5FJp
 tyIDD8hgqfT6TqZ0m8A+Y570QFqu7S18n75up5d6x6MwFgpV2at9SaLbbeQMiQbgHkK1
 HFkubXUAXl0UuYvhGw8Hu6IcWiMWHPa3r20trLP/WXhWAHUJQg3ZNz8NkhNi/DKeFb97
 FTEXsltHQ9xnTUKo9aJL817yRA6Kjg8QH9Af0vGts/ubMQ8yskDLIBA44ZPI4WOVeS+G
 FTra92WmfZuYkQdI53afAlAcjNMt5rfa5bQr5fIQIGChlBjL3p7uv9RQPwGWYYdlPOsj
 tXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/ELkajn5nIeWjt+au+JukJPjjOmYN8ul5L5G8g9Cbw=;
 b=m98E5M+BbwhRi0nAyT7VdA7/3FQ2xkfnEJPQq/2OED78xvw7R7QE0p0xrvKoSCcvum
 2SHhJe7yQTh9TKXiM8AIGnTd9SlKMsIx224hW4YwvN0YWFJHJkQ7qisUR6VkzimNoqcv
 EIKGlgXjZfzrHhDvdQw1F8p2nUAvstCR1eFQOVJMsdBsLvWywmgwQUsB4JSFE2WoLOiC
 YzXTaag9abX9ipd8AO5AxNA7FMYt5KgYpDkBww0oBr0DCxBkrXBbWUK+LEJPX9L1Vzir
 OBG5SCEwI6W+TujPtZso1TmGSViCkf/QF8owC7KLhOBhR0RT/sMexgTOeH6IaiGRabby
 +jvA==
X-Gm-Message-State: APjAAAXhg9fDZ7gXC1H9YiSstFvNOGM9r7L29aG4/830sWYzrptGq1ux
 r4lADz+8y1vvtwcHC9FjoM5crA==
X-Google-Smtp-Source: APXvYqzh6cSKpRv0QPcGFghP+vIiOOMTWhRv7tSw50MdW0LwB1cnhPJCjyLv5lQ6J6Vs3RTkKyuYyg==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr6538733wml.118.1570699691297; 
 Thu, 10 Oct 2019 02:28:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id l11sm6282042wmh.34.2019.10.10.02.28.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 02:28:10 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
 <20191009085108.4950-3-srinivas.kandagatla@linaro.org>
 <20191009163535.GK2036@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <95637c0a-8373-0eda-47e5-ac6e529019e5@linaro.org>
Date: Thu, 10 Oct 2019 10:28:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009163535.GK2036@sirena.org.uk>
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

Thanks Mark for taking time to review this patch.

On 09/10/2019 17:35, Mark Brown wrote:
> On Wed, Oct 09, 2019 at 09:51:08AM +0100, Srinivas Kandagatla wrote:
> 
>> +static const u8 wsa881x_reg_readable[WSA881X_CACHE_SIZE] = {
> 
>> +static bool wsa881x_readable_register(struct device *dev, unsigned int reg)
>> +{
>> +	return wsa881x_reg_readable[reg];
> u
> There's no bounds check and that array size is not...
> 
I converted this now to a proper switch statement as other drivers do.

>> +static struct regmap_config wsa881x_regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 8,
>> +	.cache_type = REGCACHE_RBTREE,
>> +	.reg_defaults = wsa881x_defaults,
>> +	.num_reg_defaults = ARRAY_SIZE(wsa881x_defaults),
>> +	.max_register = WSA881X_MAX_REGISTER,
> 
> ...what regmap has as max_register.  Uusually you'd render as a
> switch statement (as you did for volatile) and let the compiler
> figure out a sensible way to do the lookup.

Sorry, I did not get your point here.

Are you saying that we can skip max_register in this regmap config ?
Then how would max_register in regmap be set?

> 
>> +static void wsa881x_init(struct wsa881x_priv *wsa881x)
>> +{
>> +	struct regmap *rm = wsa881x->regmap;
>> +	unsigned int val = 0;
>> +
>> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
>> +	regcache_cache_only(rm, true);
>> +	regmap_multi_reg_write(rm, wsa881x_rev_2_0,
>> +			       ARRAY_SIZE(wsa881x_rev_2_0));
>> +	regcache_cache_only(rm, false);
> 
> This looks broken, what is it supposed to be doing?  It looks
> like it should be a register patch but it's not documented.
> 
Yep, it makes sense to move this to patch, its done in new version.

>> +static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
>> +	SOC_ENUM("Smart Boost Level", smart_boost_lvl_enum),
>> +	WSA881X_PA_GAIN_TLV("PA Gain", WSA881X_SPKR_DRV_GAIN,
>> +			    4, 0xC, 1, pa_gain),
> 
> As covered in control-names.rst all volume controls should end in
> Volume.
> 
Fixed this in next version.

>> +static void wsa881x_clk_ctrl(struct snd_soc_component *comp, bool enable)
>> +{
>> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
>> +
>> +	mutex_lock(&wsa881x->res_lock);
> 
> What is this lock supposed to be protecting?  As far as I can
> tell this function is the only place it is used and this function
> has exactly one caller which itself has only one caller which is
> a DAPM widget and hence needs no locking.  It looks awfully like
> it should just be a widget itself, or inlined into the single
> caller.
> 
This was done for temperature sensor reads which can happen in parallel.
But for now I will remove it and add back once we add tsens support.

>> +static void wsa881x_bandgap_ctrl(struct snd_soc_component *comp, bool enable)
>> +{
>> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
> 
> Similarly here.
> 
This one was over done! its now removed in next version.

>> +static int32_t wsa881x_resource_acquire(struct snd_soc_component *comp,
>> +					bool enable)
>> +{
>> +	wsa881x_clk_ctrl(comp, enable);
>> +	wsa881x_bandgap_ctrl(comp, enable);
>> +
>> +	return 0;
>> +}
> 
> There's no corresponding disables.

both wsa881x_clk_ctrl() and wsa881x_bandgap_ctrl() have corresponding 
disables in that functions.

thanks,
srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
