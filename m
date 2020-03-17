Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9945218829C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 12:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36651186A;
	Tue, 17 Mar 2020 12:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36651186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584446128;
	bh=R3piO0Kx7BrISuOycIdzQpeM1DaSrZhkS3Ogz5Xz7Ng=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TssaH55OXYstCzlednz4cYIUDyM2IfmkN4drrLpTjiiPKlsYUU/md7hPVvXhE8Dxd
	 gvhuX5QTB/2+2yhzOGqV48yyIq+KIsfFrX7i7o5h/gDvY/W6/EHf9S3oCP4VM7biPr
	 C6eWZ5/xXPigzgSkIXHEWuXfjA+04ZXlxNamwRq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2141CF80058;
	Tue, 17 Mar 2020 12:53:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF9D5F8022B; Tue, 17 Mar 2020 12:53:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B74FCF800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 12:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74FCF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xbfmhxsd"
Received: by mail-wm1-x343.google.com with SMTP id 6so21108802wmi.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J/c4hDezw2pJMAgIZidLGyuedzPxiW9b3D9y8b4Q62k=;
 b=xbfmhxsdwy76E1h+JAWA7i6+WY9M6AVLfz0EC67dj0y1FQjWCs+3s0mfoYBeUGSXDG
 G2gSLFUTBRPcJKpYXSfRdUtramN2e2E7LlF6NvulC4dLgxvGlaARHJZlX39NPgiDQeMr
 SYxK95ovsqG3kHuzNsTAHXS7m2WCADVQAOW7Wo2lKO2oEqn4qqRqzIjIRFnqp2DxMjls
 Tf6rmnCvecvhlD9z2QpMwQXfxmL1vrS8wRbFvYrTz+hcTXRKnDccsomFs9S/BGAh9173
 zqAzMhDKzUXMt23c2SeOagCiy5ZE+edhfsPwifzuSZBWsUIE7BAdMacl0ljLBdk7mYwK
 3yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/c4hDezw2pJMAgIZidLGyuedzPxiW9b3D9y8b4Q62k=;
 b=cio57XYaozdL7gplTK6nXFulj87QixZM0ueLszxMmnjZm2ehJ89m9q2dcOatK6zXtW
 s0hPi0KFhfYlfmeOI0L/95Tc0CmcLwKRUPVOYnEG/x4o/eI5b4h6hVgcXMbQAEvJiCCp
 itstVtQshw28AIDNntFLbFlndP8PmCkTCbIxCrBgTg0UwZ5IklIZ8UKafLIaZTHoPAho
 98QZbLMe3j9PsAokpUGAEzJGLGOmSqAvVCoDBVLRtXOmTMkZl1tnGrGHbw8Vu9ohZE8R
 6Fn5nKZj+A0ssokKouST6ozR+AML7gNRxqKlfFCF5GaBZ3mdd4NErLQ9Nng2kJZAvtQ+
 ssjA==
X-Gm-Message-State: ANhLgQ3fz+0+J+JxndrOz7W90LhJdw4XyuVyGDO/70laEFPvOSxC6BnV
 pQy5OwvFAZXTdTg/z3R55Vzfaj9Sveo=
X-Google-Smtp-Source: ADFU+vurgldOqTe9OEVV89nGK9VasxRVg6EIC8mhyDRpvaUvg8jHL5WFxOjLyksahXRJPKOE3V8cLg==
X-Received: by 2002:a7b:cc8a:: with SMTP id p10mr4999051wma.10.1584446011818; 
 Tue, 17 Mar 2020 04:53:31 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w1sm3441167wmc.11.2020.03.17.04.53.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Mar 2020 04:53:30 -0700 (PDT)
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
Date: Tue, 17 Mar 2020 11:53:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Thanks Pierre for this patch,

On 17/03/2020 10:51, Pierre-Louis Bossart wrote:
> In a multi-cpu DAI context, the stream routines may be called from
> multiple DAI callbacks. Make sure the stream state only changes for
> the first call, and don't return error messages if the target state is
> already reached.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/stream.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 

This patch did not work for me as it is as wsa881x codec does prepare 
and enable in one function, which breaks some of the assumptions in this 
patch.

However with below change I could get it working without moving stream 
handling to machine driver.

---------------------------->cut<-------------------------------
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index be71af4671a4..4a94ea64c1c5 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1574,7 +1574,8 @@ int sdw_prepare_stream(struct sdw_stream_runtime 
*stream)

         sdw_acquire_bus_lock(stream);

-       if (stream->state == SDW_STREAM_PREPARED) {
+       if (stream->state == SDW_STREAM_PREPARED ||
+           stream->state == SDW_STREAM_ENABLED) {
                 /* nothing to do */
                 ret = 0;
                 goto state_err;
@@ -1754,7 +1755,8 @@ int sdw_disable_stream(struct sdw_stream_runtime 
*stream)

         sdw_acquire_bus_lock(stream);

-       if (stream->state == SDW_STREAM_DISABLED) {
+       if (stream->state == SDW_STREAM_DISABLED ||
+           stream->state == SDW_STREAM_DEPREPARED) {
                 /* nothing to do */
                 ret = 0;
                 goto state_err;
---------------------------->cut<-------------------------------

--srini

> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 1b43d03c79ea..3319121cd706 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1572,6 +1572,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
>   	sdw_acquire_bus_lock(stream);
>   
>   	if (stream->state == SDW_STREAM_PREPARED) {
> +		/* nothing to do */
>   		ret = 0;
>   		goto state_err;
>   	}
> @@ -1661,6 +1662,12 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
>   
>   	sdw_acquire_bus_lock(stream);
>   
> +	if (stream->state == SDW_STREAM_ENABLED) {
> +		/* nothing to do */
> +		ret = 0;
> +		goto state_err;
> +	}
> +
>   	if (stream->state != SDW_STREAM_PREPARED &&
>   	    stream->state != SDW_STREAM_DISABLED) {
>   		pr_err("%s: %s: inconsistent state state %d\n",
> @@ -1744,6 +1751,12 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
>   
>   	sdw_acquire_bus_lock(stream);
>   
> +	if (stream->state == SDW_STREAM_DISABLED) {
> +		/* nothing to do */
> +		ret = 0;
> +		goto state_err;
> +	}
> +
>   	if (stream->state != SDW_STREAM_ENABLED) {
>   		pr_err("%s: %s: inconsistent state state %d\n",
>   		       __func__, stream->name, stream->state);
> @@ -1809,6 +1822,12 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
>   
>   	sdw_acquire_bus_lock(stream);
>   
> +	if (stream->state == SDW_STREAM_DEPREPARED) {
> +		/* nothing to do */
> +		ret = 0;
> +		goto state_err;
> +	}
> +
>   	if (stream->state != SDW_STREAM_PREPARED &&
>   	    stream->state != SDW_STREAM_DISABLED) {
>   		pr_err("%s: %s: inconsistent state state %d\n",
> 
