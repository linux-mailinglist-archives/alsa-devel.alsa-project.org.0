Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97329509C38
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 11:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CEC418B7;
	Thu, 21 Apr 2022 11:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CEC418B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650533553;
	bh=5VvMV/IJ16KPRtNLT+Ds7LBXwHxoAiOutxaMvU+khoo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wmf+QGyuc7lcDBEdsuTYmUR21vC1xm+2Eu3nUIDwPvh/b0sty0tbYCmJS2XnpWJHk
	 oZV3dE8pKVcdA6IeiotoxHkoDvTfHHzfNIOgtBEXVqN0p/DvQ2jURoU4VtpgY+QS5J
	 lC5ZvgVpgrfiDILU8E2HmMnLLfbWU49Kw9A2ea+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6EFF8047D;
	Thu, 21 Apr 2022 11:31:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE6CF8032D; Thu, 21 Apr 2022 11:31:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 563E2F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 11:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 563E2F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NY9XSGic"
Received: by mail-wm1-x330.google.com with SMTP id p189so2805988wmp.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NpVbGkWT0mxI2z+QAaSeB8XReImeuL8/00d31gyn1MM=;
 b=NY9XSGico1KIM7Fqq1EwGMyOn23m25iSrqopxZzF4wmajHZm5QZcwf++tU2uNOffNB
 UeVQd/I1bq4JozXtv6evYNUmcNwYfU/KfNtBG7MDWdWVG2JUYJIFJJHAM0H15lRuEZKa
 R9S3PYlmM9lI7sako+G/6+A4F4ltAbThft8OH+6SbmAVH38hR1PdfkQvBJOGJz5OSt1B
 oRx1boWIrxsw5sr7IU6KGuPsr1cOnaZuvL0KyAF8dmMrwqhEs803oPzeNQB8MlrYOMGT
 cbVboZi+ArEXiI1u2DpaENkXwf7cCecA0XbX8tQTiI38P52z3Gws4A5MFjd9jVeSaXlF
 HoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NpVbGkWT0mxI2z+QAaSeB8XReImeuL8/00d31gyn1MM=;
 b=14L/CAhj3t0JF0A5CYSG80uaukEyqglY96dPiIpBNktd+TRK84ENes8Fw1Vn5MAmeW
 4hvE0eo/046iMNxGjl4XmtPnVOkVaYri+7ofZlRrTz/pWTJJ2RuWT/pOFiALYYNZqm+i
 DVquI5wTvJN99dDFTM1MB1A+DWWQjtaiCLr9fT+B/q2l8CSLa7FyFcMLLhz/AEpVWv3H
 sXeJnFwoI5vOGF7l8vp5z2Ws3I9A/SPWiTD2VWwGBe75rHv+PVBnnUInelFeNhuV69s8
 P5bqAgvqiG5cqyYIp7xg1q4+Ok1nne4Buaw08PhRRGGUQWSIwXURCmMXmwoAkz1B8glH
 dstQ==
X-Gm-Message-State: AOAM532i2TdBOlHzPqVUKA3uqiKFx9djYwf5qKqZDW1tEEevSbFZb3jQ
 YE28PLmgy4+Q9gFzfeRRg39UUQ==
X-Google-Smtp-Source: ABdhPJxaoLhiuIhW9HJh8IcFoEychIb2KfG7PIpMWfHCfoHwz8QnTOir1Vnoo5J6Q0KLFVR7ZlZwjw==
X-Received: by 2002:a05:600c:a06:b0:392:a4f2:2097 with SMTP id
 z6-20020a05600c0a0600b00392a4f22097mr7718250wmp.97.1650533485120; 
 Thu, 21 Apr 2022 02:31:25 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 v13-20020a5d4b0d000000b00207a8815063sm1795043wrq.2.2022.04.21.02.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 02:31:24 -0700 (PDT)
Message-ID: <8a91822c-d68a-a2d8-6865-3985f2f85c0b@linaro.org>
Date: Thu, 21 Apr 2022 10:31:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] ASoC: codecs: wsa881x: add runtime pm support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20220228144235.24208-1-srinivas.kandagatla@linaro.org>
 <b1b0a8b9-5fc2-bfe1-dfde-692a0a7ac34a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <b1b0a8b9-5fc2-bfe1-dfde-692a0a7ac34a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 quic_srivasam@quicinc.com, linux-kernel@vger.kernel.org
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



On 20/04/2022 18:59, Pierre-Louis Bossart wrote:
> Hi Srini,
> 
>> +static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
>> +{
>> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>> +	struct regmap *regmap = dev_get_regmap(dev, NULL);
>> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
>> +
>> +	gpiod_direction_output(wsa881x->sd_n, 1);
>> +
>> +	wait_for_completion_timeout(&slave->initialization_complete,
>> +				    msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
> 
> while I was revisiting pm_runtime support, I also saw that this codec driver is the only one that doesn't check for errors
> 
> max98373-sdw.c: time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt1308-sdw.c:   time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt1316-sdw.c:   time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt5682-sdw.c:   time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt5682.c:                       &slave->initialization_complete,
> 
> rt700-sdw.c:    time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt711-sdca-sdw.c:       time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt711-sdw.c:    time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> rt715-sdw.c:    time = wait_for_completion_timeout(&slave->initialization_complete,
> 
> wsa881x.c:      wait_for_completion_timeout(&slave->initialization_complete,
> 
> 
> If the attachment fails for some reason, you probably want to avoid starting regmap syncs that will fail by construction, no?

Thanks Pierre for auditing the calls.

Yes syncs would fail on reg writes if initialization timeout.
Do you already have fix patch to this or do you want me to send one?

Am also trying to understand what is the expected behavior in the resume 
failure cases, should pm attempt to resume the codec after some time, if 
so returning -ETIMEOUT is the right error code?


--srini
> 
>> +
>> +	regcache_cache_only(regmap, false);
>> +	regcache_sync(regmap);
>> +
>> +	return 0;
>> +}
