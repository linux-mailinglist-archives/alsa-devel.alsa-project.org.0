Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4C560578
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 18:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9540F84B;
	Wed, 29 Jun 2022 18:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9540F84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656519039;
	bh=KkKCK6vyjQdpxEhsVTu0ztSmC8D/ggzzrMdnrucxEzo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aeptHotIOO9xzElDfcz+9ot1B3dt/MgyxKOOVMGjjAg5iXFHz93KF9g/u6OHNSG2m
	 qlvaJ1AAyr9THG7/of4W16/wWybcn3fjkare0lXU801QMabRwCq8/efwGaOy5BRTf0
	 kknzt6t0PUtbZRU+wYs7S2BJuKcrOrgd+0q/doY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5B3F80107;
	Wed, 29 Jun 2022 18:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91452F8020D; Wed, 29 Jun 2022 18:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE7DF80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 18:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE7DF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kws0GL/x"
Received: by mail-wm1-x334.google.com with SMTP id
 u12-20020a05600c210c00b003a02b16d2b8so9906877wml.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8I4xTuCAIj7p4jZTE7jxL30+O2A4Baj92YRuLJCD+2E=;
 b=kws0GL/xKMY13kVKn2OsJYtYy4FcSDfeIzROdP+wdqZkq3V9xeg2Uo5us2nn0FSe8Y
 civ8MIuPYUDEnjtQtD4+196WxZDhMcubB8zE42ZeZ4ohhZO3EzQvmfEquY6K+hyeXQsx
 hlYM0vK8Vp5pHQC/RXWRLUqKWky4TNHBrUlBMc9ty8YkjdLq9bz3HmbJ80l9WzMW/c1Y
 fP8DO/xp73Ov60anXHeO8shQa9Jz3CSV33sd5bha+Dwjat1znxuivO/pDKKeP+AXR6yo
 6HkErcYGeKZ2xjA0demS9oyMYHku3Rdj2QFhaTz70Arf80zeZ5qPYnIRLPr7mOCdlI4E
 HE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8I4xTuCAIj7p4jZTE7jxL30+O2A4Baj92YRuLJCD+2E=;
 b=Kel3FNZGCfUJqV2/8KR0nOzOsdHnlrZ4AsUq5fj/JYRQQo6v9Z1ITb8rE5aOg2mjJE
 NPzWG7RinBoPZU09ReOE7Ig8Dar6DY+AdF4PrrDl5kCV5jOzQxYAaJXprBMFR5+//IZk
 32RH0EJed3lyuuNiTfI27opyrEQHGyG8scK1yEllLWfDVGE6ZppWGlq6hJBoX4+Yxxd1
 81eCP6JNbI8foTavxxQyjjX8PeVuXgqPlxzFjiVd4DN9tTsh9X/EeyN+1D6940RctQzy
 +338lsYFsuF87Vdj6C9bIBy1+VXrK/CNuTQoe+fs7lZTP4EGmbO48AQCEo7pisTTWOjA
 D1IQ==
X-Gm-Message-State: AJIora9c4gS9kXuYgrF5O/QcJoW9OXjuRmJFRS77SU3lnZGTPO8qbZsm
 osLK6lEIeskaXN7OoH76pqMLKw==
X-Google-Smtp-Source: AGRyM1uyWk+rVr8oXOX4c4yI0mrtAqKSViVpKIZUxTVc4c/q+bxK6VZgfa6KJYmZLwBHnyQpgFgHHQ==
X-Received: by 2002:a7b:cc10:0:b0:3a0:7d75:b576 with SMTP id
 f16-20020a7bcc10000000b003a07d75b576mr4600543wmh.92.1656518970550; 
 Wed, 29 Jun 2022 09:09:30 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 r185-20020a1c2bc2000000b003a0484c069bsm4067034wmr.41.2022.06.29.09.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 09:09:29 -0700 (PDT)
Message-ID: <c12b67b3-2024-2133-9fdb-3d90410a4501@linaro.org>
Date: Wed, 29 Jun 2022 17:09:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] ASoC: codecs: add wsa883x amplifier support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
 <20220629090644.67982-3-srinivas.kandagatla@linaro.org>
 <352fac7e-597c-84af-d33b-bdff0e2acdb6@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <352fac7e-597c-84af-d33b-bdff0e2acdb6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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

Thanks Pierre,

On 29/06/2022 16:03, Pierre-Louis Bossart wrote:
> 
>> +/* 4 ports */
>> +static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
>> +	{
>> +		/* DAC */
>> +		.num = 1,
>> +		.type = SDW_DPN_SIMPLE,
>> +		.min_ch = 1,
>> +		.max_ch = 1,
>> +		.simple_ch_prep_sm = true,
>> +		.read_only_wordlength = true,
>> +	}, {
> 
> nit-pick: it's unusual to see such opening brackets for structure
> initialization, usually there are on a new line.
> 
>> +		/* COMP */
>> +		.num = 2,
>> +		.type = SDW_DPN_SIMPLE,
>> +		.min_ch = 1,
>> +		.max_ch = 1,
>> +		.simple_ch_prep_sm = true,
>> +		.read_only_wordlength = true,
>> +	}, {
>> +		/* BOOST */
>> +		.num = 3,
>> +		.type = SDW_DPN_SIMPLE,
>> +		.min_ch = 1,
>> +		.max_ch = 1,
>> +		.simple_ch_prep_sm = true,
>> +		.read_only_wordlength = true,
>> +	}, {
>> +		/* VISENSE */
>> +		.num = 4,
>> +		.type = SDW_DPN_SIMPLE,
>> +		.min_ch = 1,
>> +		.max_ch = 1,
>> +		.simple_ch_prep_sm = true,
>> +		.read_only_wordlength = true,
>> +	}
>> +};
> 
>> +static int wsa883x_update_status(struct sdw_slave *slave,
>> +				 enum sdw_slave_status status)
>> +{
>> +	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
>> +
>> +	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)
> 
> do you actually need to test if slave->dev_num is > 0?
> 
Few years back I think it was you who asked me to add this check.. :-)

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2073074.html


> if I look at drivers/soundwire/bus.c, update_status cannot really be
> invoked with dev_num == 0.
> 
>> +		wsa883x_init(wsa883x);
>> +
>> +	return 0;
>> +}
>> +
> 
>> +static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
>> +{
>> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>> +	struct regmap *regmap = dev_get_regmap(dev, NULL);
>> +	struct wsa883x_priv *wsa883x = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = regulator_enable(wsa883x->vdd);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable vdd regulator (%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	gpiod_direction_output(wsa883x->sd_n, 1);
>> +
>> +	wait_for_completion_timeout(&slave->initialization_complete,
>> +				    msecs_to_jiffies(WSA883X_PROBE_TIMEOUT));
> 
> check for success? You don't want to enable regmap sync below if the
> device never successfully attached and initialized.

Yes, that might be possible, I can spin a fix for this.

thanks,
--srini
> 
>> +
>> +	usleep_range(20000, 20010);
>> +	regcache_cache_only(regmap, false);
>> +	regcache_sync(regmap);
>> +
>> +	return 0;
>> +}
> 
