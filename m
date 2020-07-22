Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9B822944E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDF914E;
	Wed, 22 Jul 2020 11:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDF914E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595408488;
	bh=kg0QLdnUWE2k59/lU4a5VfgB9hnSu/Nloy2Vmh3pYKs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ew2uxgxMiU7exDh2Q9Y1+F+1GrV2vxQeRqEeaFIb6COxraYq5ZQZSXd/NRgLUVLBN
	 L8jZR3omAg4JS2a41zhqPSY9ORhRSe0N1oJrKvft67h+Y09jwcNp8n/ryCKTQv4dXU
	 wZFuyvvQiddnIaDgB46eP+pMVujPPtiQ/qTxDl24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 137F0F80161;
	Wed, 22 Jul 2020 10:59:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1047F80161; Wed, 22 Jul 2020 10:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18F1BF80290
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18F1BF80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l5yOvdZO"
Received: by mail-wm1-x343.google.com with SMTP id 184so1241637wmb.0
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SP0c2GvVtx+b6Ros2vCvfF+tahmqr0w4KW5Dw5alhsY=;
 b=l5yOvdZOx14odmspvktZ7ZTu76/nmkS1cWsDzX94SFiOkrV0hbJwcFFPbgt8paY0RL
 G1SbejDEbKDVq9SsZl0fdpJOqtk3oocOJgfonM9TBE7wkMa3H7RAQe0zbleqzmVedyc+
 SLb9mLEP1prpZcd5DLiAnfeUMZKCqN/21rQO0/HnykTap37/0POixzHi9BAZCD57vFpg
 ebdKo+HmKBZ2H0rN/G98XncTWXqd2ZhYlA2aZ0C0N4DTTOCPIxLC5iuRcN1rejeiCcrc
 PV0FI8DvfpPLdoEuGMBSHDMr/hG6yy+M/CA8US5yAbawyh9TB3CpIbN62RHJ+UiTDOe0
 Iv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SP0c2GvVtx+b6Ros2vCvfF+tahmqr0w4KW5Dw5alhsY=;
 b=GFORDebtwgiKJqMXgL3hP5axitXUnc3LC+Bu+hkko8y1jme4cJd35REHE3GiO51zq1
 qqfl4TO7/eO1EXZaAXArHrIzKPqo9vn9xI5JSfZN4d1C0y8hWalpv1vMexHovYSv6O9p
 619ksyGXmxNvqUIpNlj8l5FW45GM6PGu5fkAkYdtQbzLgq7SD5HaGm36vTQTOKnxJ2p+
 Y9OUCSKPZ5QulG30CZV/9hl2zOzLkRnzxBWaTW3Mrt/Bjz1IuVWZkJ14s84bPa9rds4+
 p2LbJcBqP2t4OViZSYlyQz1Li7glIFUfO/jhchKAzqN3eMe78wpAlzox1a31Z6Ej5tqd
 Na6Q==
X-Gm-Message-State: AOAM531Dfeevk9EkUW7+EnHLCewvI2akDz0pP/P6ZLrkTvkzdOf1j+My
 61WG+wKOGk2qEYtde8CIJv/wWg==
X-Google-Smtp-Source: ABdhPJzcZw2BFFndFeBVpKiOt0sEkVRTdh8x+EnHzkiSU67L4IGJk2d97MA+9BAcg+AS+XqaVp3Psw==
X-Received: by 2002:a1c:4987:: with SMTP id w129mr7591733wma.9.1595408388682; 
 Wed, 22 Jul 2020 01:59:48 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t14sm28577281wrv.14.2020.07.22.01.59.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 01:59:47 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] ASoC: q6asm: make commands specific to streams
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
 <20200721165306.29082-3-srinivas.kandagatla@linaro.org>
 <52075b51-2053-573a-4cd0-685d3d469bdf@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2a1e0045-84b9-6c8b-74be-aa5cbf318427@linaro.org>
Date: Wed, 22 Jul 2020 09:59:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <52075b51-2053-573a-4cd0-685d3d469bdf@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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

Thanks Pierre for review,

On 21/07/2020 20:31, Pierre-Louis Bossart wrote:
> 
> 
> 
>> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c 
>> b/sound/soc/qcom/qdsp6/q6asm-dai.c
>> index 941f3216399c..fb0488e7beb9 100644
>> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
>> @@ -67,6 +67,8 @@ struct q6asm_dai_rtd {
>>       uint16_t bits_per_sample;
>>       uint16_t source; /* Encoding source bit mask */
>>       struct audio_client *audio_client;
>> +    /* Active */
> 
> nit-pick: what does this 'Active' comment try to say? the stream_id 
> seems to be used for RUN/EOS/CLOSE operations.

Active mean its the active stream id which is consuming the data at the 
point in time. As we toggle stream ids between 1 and 2. This active 
stream_id is used for every command sent to dsp.

> 
>> +    uint32_t stream_id;
>>       uint16_t session_id;
>>       enum stream_state state;
>>   };
>> @@ -184,8 +186,8 @@ static void event_handler(uint32_t opcode, 
>> uint32_t token,
>>       switch (opcode) {
>>       case ASM_CLIENT_EVENT_CMD_RUN_DONE:
>>           if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> -            q6asm_write_async(prtd->audio_client,
>> -                   prtd->pcm_count, 0, 0, NO_TIMESTAMP);
>> +            q6asm_write_async(prtd->audio_client, prtd->stream_id,
>> +                   prtd->pcm_count, 0, 0, 0);
> 
> In the V1 review we discussed this
> 

Sorry, I missed that! will address this in next version!

> "
>  > sound/soc/qcom/qdsp6/q6asm.h:#define NO_TIMESTAMP    0xFF00
>  >
>  > is the change on the previous line intentional?
> 
> May be not!
> 
> Plan is that the users of these apis will send flags directly instead of 
> boiler plating this!
> 
> This change should go as part of next patch("[PATCH 04/11] ASoC: q6asm: 
> use flags directly from asm-dai") which would make it much clear!
> "
> 
> doesn't look like there was a change here?
> 
> 
