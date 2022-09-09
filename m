Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69575B3B0F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 16:48:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 534951685;
	Fri,  9 Sep 2022 16:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 534951685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662734939;
	bh=OcuhMvTcC+q6ZZnJhgVha44kvK5eL+wcctOzi5kyyDw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WqVk1FwTIOaz9/YgUFPSe21/Zk74uKnZSWRBrcRErcuBc+DVrUctn+9pSpM92tX8d
	 xqJQw+QGh+ftyiQdswHLxxttCTc/pgPsrH9Cani8krPqirPvfqAvPh4NbwfYW1U+O2
	 zTUsJTTi7R8lrdTAwnefn/kkEhJ76niFBP9nvtyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B92FBF8016C;
	Fri,  9 Sep 2022 16:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A78CEF8023A; Fri,  9 Sep 2022 16:47:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7371BF8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 16:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7371BF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="un9G4vfK"
Received: by mail-lj1-x22c.google.com with SMTP id by6so2096667ljb.11
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 07:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JB9qgUrwYsWle3Jv9JHDQg8bS7SdjgM/S8qMg12D/Vw=;
 b=un9G4vfKcf5oiK+XurhljjSXBl0WVTJjEoefol8zx7MG/0ZU4YWSpEByGeExqOspWG
 wxSh1krcqHEalllyfqyyOa8eBmZzCkBdjHdA45L15gpqcHXR5IlAYJ3h497h8fxP0AkU
 bWqR2hs7R0gqg5Z0uVuShPTq7i28wjN4SMjQY6Y4v1lybTC/+/pbh1VJocmX2ZX7aQvt
 /Ul200xCDGSOEuOqE7aIUlgU06FKvc1cBCxBSivjBj4In8Mw1Y8sde3mY3IS535jHSvm
 Hvg9N/RYsubhLLlg2hqsXAksE3Wb/gS7TCer8q8Os+OPnFxJJrNYz2kkPxtaLm78/48V
 9EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JB9qgUrwYsWle3Jv9JHDQg8bS7SdjgM/S8qMg12D/Vw=;
 b=rQyaY5bOKd8ko11uAAMXQR3Kg7nEtBQFbH/xPSPk2RoFKOdDkodtKGb6o3b2oWXj/q
 xKhCl+BXdC/FfKukCu52q7CLf/Tanhr0scOABtlSFmA8LWfWvk5Y0HaDyNyolnkPfgCB
 0qwhwfeSbdZ/4PHyUyw+AmW7q4vNvCHh0G7yJ/wR93QCnEa/C9rcriCg6iPXDLZzbtLx
 v071E4ilocg02XX5OtsztRR6ExD2CisSrltbd8KwBBNAYwFLtSiUZVu8SQ7FffDhLbEs
 RMwF3yV44KHQlDSPHt6FeqdXODsSkeCqjrsfT60Fjp0HDhrLNb69pfKEeM6M12MF1zYp
 Yo/w==
X-Gm-Message-State: ACgBeo23s3jFSfqkpLupm06G9WHytVrwysp7o0LBfDConwVgzu0Tdcsf
 ufHfFCGFLzy95YfzvSm1twa7fA==
X-Google-Smtp-Source: AA6agR4xVAukvcaWllAijmuqOnA2x/hHl+myh1R2qfTpY7GoO7sLz9cKdE73/dUbiPyLwAA7J5SLsQ==
X-Received: by 2002:a2e:bd0e:0:b0:261:e718:e902 with SMTP id
 n14-20020a2ebd0e000000b00261e718e902mr4250918ljq.435.1662734872291; 
 Fri, 09 Sep 2022 07:47:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m18-20020ac24252000000b0048a85bd4429sm108378lfl.126.2022.09.09.07.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 07:47:51 -0700 (PDT)
Message-ID: <541b11a1-6b5a-cae0-73d9-f1fe8c961a15@linaro.org>
Date: Fri, 9 Sep 2022 16:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/10] ASoC: cs42l83: Extend CS42L42 support to new part
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-10-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909135334.98220-10-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/09/2022 15:53, Martin Povišer wrote:
> The CS42L83 part is a headphone jack codec found in recent Apple
> machines. It is a publicly undocumented part but as far as can be told
> it is identical to CS42L42 except for two points:
> 

(...)


> +	regmap = devm_regmap_init_i2c(i2c_client, &cs42l83_regmap);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
> +		return ret;

Use dev_err_probe()

> +	}
> +
> +	cs42l83->devid = CS42L83_CHIP_ID;
> +	cs42l83->dev = dev;
> +	cs42l83->regmap = regmap;
> +	cs42l83->irq = i2c_client->irq;
> +
> +	ret = cs42l42_common_probe(cs42l83, &cs42l42_soc_component, &cs42l42_dai);
> +	if (ret)
> +		return ret;
> +
> +	ret = cs42l42_init(cs42l83);
> +	if (ret)
> +		cs42l42_common_remove(cs42l83);
> +
> +	return ret;
> +}
> +
> +static int cs42l83_i2c_remove(struct i2c_client *i2c_client)
> +{
> +	struct cs42l42_private *cs42l83 = dev_get_drvdata(&i2c_client->dev);
> +
> +	cs42l42_common_remove(cs42l83);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cs42l83_i2c_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = cs42l42_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	cs42l42_resume_restore(dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cs42l83_i2c_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
> +};
> +
> +static const struct of_device_id __maybe_unused cs42l83_of_match[] = {
> +	{ .compatible = "cirrus,cs42l83", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs42l83_of_match);
> +
> +static struct i2c_driver cs42l83_i2c_driver = {
> +	.driver = {
> +		.name = "cs42l83",
> +		.pm = &cs42l83_i2c_pm_ops,
> +		.of_match_table = of_match_ptr(cs42l83_of_match),

This should complain with compile testing. Usually it comes with
__maybe_unused/


Best regards,
Krzysztof
