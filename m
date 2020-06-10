Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1BB1F52B3
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 12:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE57B166F;
	Wed, 10 Jun 2020 12:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE57B166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591786728;
	bh=HMhrktpo/YQUDXVdZdGJRlVgDSVWSYAcmHLubWN87Vc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OwfiveI/LftnkuSwPmvSEyQJHB75b+9YNRWmXbuAJctqeopHIpw9a2ahKXB3y5ws9
	 vMQLmRbwzdmZpbhxZ0XswwtqRgtcwTsKSBdHDETr5YWsOCP4yJR9ufOpWciwdKMOQU
	 CrXDtVutWmZtM2hL9HKobjfsfg11eVeMBSZpZqKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D27C7F80088;
	Wed, 10 Jun 2020 12:57:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 784FFF8021C; Wed, 10 Jun 2020 12:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E831F80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 12:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E831F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rW5B41js"
Received: by mail-wr1-x443.google.com with SMTP id h5so1738457wrc.7
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gaoy82nx63ddYrD03WQdgMSQz0m1g7Mo1K4KeYxZPTk=;
 b=rW5B41jsRaHDL4Q3LVL6RPpznlkcuO9V/zbKOO5L/lfYeO86WLBOxNKT3/qYBJgPcZ
 XRZxbI8MOiCIMjV9LphZJCQMNxqZFrlKgBxhZissCgOQ6/wbmRwbEAfe+n1t6crxYn/F
 veHME6FuvAnjJ563h9YvBAJoWxWTPSUV0w4LdsLAY+uV9h9CiWsCLZOydAX9ctORnjDf
 FRP3Gj0gKrjTzV4I99uWAkZEcFm+t1dy6YX2Ky5nzL6QlK7JIEzCWOedl830AYNbbTYg
 K4VMnQHO8LiMy7RY/6Y28MhZ+ocOzEdPhTbvZ6M5MtiPPUesNMNhEjjw/R77vlGgSa6W
 XR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gaoy82nx63ddYrD03WQdgMSQz0m1g7Mo1K4KeYxZPTk=;
 b=gVa/0+4ZCbD88iT8qvqTaJOl9mqBfNC+CPwxZwQl4EJ+MLGVVFw/uewIf8k0qmmuRS
 jc3QP7XMPgE1s2MzQNS98bM6FRb8rvmF/+CZfu3i7Z+ZCDYmgtvFbEUUwzc7w1pF+8Ln
 KYGXJMzl3C7lmUQ897oOw8xuDCXKourCHBKHf95E6n3YN5u6j33bkZ+w/vx4fEWXUwl0
 OvzNiyCEMslXv1R0U3pivGkngmUcVDXjwBsO+N8fmYKdGlUjwxTimzfVVsg8nAP1uC47
 6LVQGIfv6cTTHkDg06yw2E8330elJJnFtXMFqY9Wl4OJdxi+vwFLX4KYIfJdvnWg+Ux1
 +yzw==
X-Gm-Message-State: AOAM532+nyyGtmR5p0NtrLQQugL9hzxBhAq0CrjSXGWfQXDQp33IZ2tJ
 4wjgPz/cesjVct1SKg8qo+XDlQ==
X-Google-Smtp-Source: ABdhPJy4IM5bOvr7G6mlIHkpIOr41yEzVIj2vB8swuFXNsuJQPwgY7PM1mFFLKX31Wm1APL7x/v9CQ==
X-Received: by 2002:a5d:4a04:: with SMTP id m4mr3293394wrq.153.1591786619510; 
 Wed, 10 Jun 2020 03:56:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id b19sm6988807wmj.0.2020.06.10.03.56.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 03:56:58 -0700 (PDT)
Subject: Re: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
To: Jaroslav Kysela <perex@perex.cz>, vkoul@kernel.org
References: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
 <817d009e-fa09-e897-cfc3-997bf1dd5e30@perex.cz>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <683a67bc-44e8-1e2b-b9a4-29e71ce86fdc@linaro.org>
Date: Wed, 10 Jun 2020 11:56:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <817d009e-fa09-e897-cfc3-997bf1dd5e30@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
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



On 10/06/2020 11:40, Jaroslav Kysela wrote:
> Dne 10. 06. 20 v 12:07 Srinivas Kandagatla napsal(a):
>> For gapless playback call to snd_compr_drain_notify() after
>> partial drain should put the state to SNDRV_PCM_STATE_RUNNING
>> rather than SNDRV_PCM_STATE_SETUP as the driver is ready to
>> process the buffers for new track.
>>
>> With existing code, if we are playing 3 tracks in gapless, after
>> partial drain finished on previous track 1 the state is set to
>> SNDRV_PCM_STATE_SETUP which is then moved to SNDRV_PCM_STATE_PREPARED
>> after data write. With this state calls to snd_compr_next_track() and
>> few other calls will fail as they expect the state to be in
>> SNDRV_PCM_STATE_RUNNING.
>>
>> Here is the sequence of events and state transitions:
>>
>> 1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
>> 2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
>> 3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
>> 4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
>> 5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
>> 6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
>> 7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
>> 8. set_metadata (Track 3), no state change, state = 
>> SNDRV_PCM_STATE_PREPARED
>> 9. set_next_track (Track 3), !! FAILURE as state != 
>> SNDRV_PCM_STATE_RUNNING
> 
> 
> The snd_compr_drain_notify() is called only from snd_compr_stop(). 
> Something is missing in this sequence?

snd_compr_drain_notify() can also be called by drivers to notify when 
partial drain is finished. In this case its called from qcom compress 
driver.

--srini

> 
>                      Jaroslav
> 
> 
> 
>>
>> Fixes: f44f2a5417b2 ("ALSA: compress: fix drain calls blocking other 
>> compress functions (v6)")
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>
>> I wonder who did gapless work on upstream so far?
>>
>>   include/sound/compress_driver.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/sound/compress_driver.h 
>> b/include/sound/compress_driver.h
>> index 6ce8effa0b12..eabac33864c2 100644
>> --- a/include/sound/compress_driver.h
>> +++ b/include/sound/compress_driver.h
>> @@ -182,7 +182,7 @@ static inline void snd_compr_drain_notify(struct 
>> snd_compr_stream *stream)
>>       if (snd_BUG_ON(!stream))
>>           return;
>> -    stream->runtime->state = SNDRV_PCM_STATE_SETUP;
>> +    stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
>>       wake_up(&stream->runtime->sleep);
>>   }
>>
> 
> 
