Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C6D218425
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 11:47:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102A9168A;
	Wed,  8 Jul 2020 11:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102A9168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594201677;
	bh=NIX5e16maFnOjgP8Wzqm70MHvj+mzYBmbOgUVRlGIfM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbXk0+UaiYKFaAjzuUX5C8vR5bifqrnLTYgb+lgP1oz1yD1xnmVVOoUKEQUZVcwvK
	 +dqFUqAePXx5KHu6UFk4nStCWW1Yzg9+8ibh2JqMtKxjlzmYUc7e2I4SIbHU0IY+88
	 +RuDWYvkj8jYYn9X83bWnge7MNljS3dPpJ193/M0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2770FF8015D;
	Wed,  8 Jul 2020 11:44:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 021ABF802C2; Wed,  8 Jul 2020 11:44:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85D31F802A9
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 11:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D31F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ej7On6D1"
Received: by mail-wr1-x443.google.com with SMTP id a6so48168654wrm.4
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v9AIm6DN48ankAafEBRPujrUBGThinGUo487AT2ZYnI=;
 b=Ej7On6D1FjUedjzUMWW8M4FOFnY9gQuR2ByeadVXAG2kPNiLojZdHlwzjz0XdshZnr
 TquPfnDH5gTteLy0VV3GHyLVY+dGw8skM9V39sn5f8e+8A4QIZYNAZA3x0fILIhMrHr8
 e6ddlq7L0hr0FLqsKLwDXXLyHsKwmATfwN2s4fV/zFCrbJFXkm9rTENAlDwftT5i44U1
 SqqiC7BQS3v+GZkvdiJdt+HvW/fGrb5ZpOt09BaIbbWBfzOjVqs59IP3c0QN1irq9DID
 SHgo56RnjEnNQvTYEgtGLbw7z6ID8KIBl1argXOU3AfFqfICVwvjXKvSGESE3jJVvZv5
 gT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v9AIm6DN48ankAafEBRPujrUBGThinGUo487AT2ZYnI=;
 b=YGwfMkVnHm/3nn827JY4U8pHMaaCZO+FmlCndaymFMsqCuMcTAwEGNL8jqxxdhAR2G
 J8qy3HDBB1p0Hu30TrwUOuive6o0z+V+Vrw/LVGl7OI5PLN19MXIeoKP+MKeYPz/uYli
 2HDDQuUAaEoVTKRcAOA1vFfY4XCDQ+lJukZyHG43ZQ8UEfhv5vEeEV5vDhDaT4vHZR6g
 VlON+pvgwWFn40dJdDOz+9qrlLVOFHN3kpzWGNJL1CZZ2Dt7PmAHLXxyRhXdTDjlU8Ms
 u3g5JLrjHYk5wHlHVFmGF7qVivajplU9BOoFUpbw8a2jQMFjga3YkJX6ZOpWAvr0sKO8
 O1Dg==
X-Gm-Message-State: AOAM531WuOqPaDy0nERWBdWma5hpT2jMdO1gG/MvODw7i68qCWbEcT3M
 BlgzPYHRBSuuohJzL49jU8IiVg==
X-Google-Smtp-Source: ABdhPJwB1mMz13fdwTdLFRo94oXfjU9s2n7IjStxG+8rt5MiF3WPL9xa7EiW5xM+AuxznQKTH5Do/g==
X-Received: by 2002:a5d:504b:: with SMTP id h11mr56401217wrt.160.1594201477900; 
 Wed, 08 Jul 2020 02:44:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q7sm5567838wrs.27.2020.07.08.02.44.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jul 2020 02:44:37 -0700 (PDT)
Subject: Re: [PATCH 10/11] ASoC: qdsp6-dai: add gapless support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-11-srinivas.kandagatla@linaro.org>
 <62af11d3-db26-a31b-00c8-9d78b11862cc@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <04a7f696-e23d-5563-7cc3-aedfaf2c7636@linaro.org>
Date: Wed, 8 Jul 2020 10:44:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <62af11d3-db26-a31b-00c8-9d78b11862cc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 07/07/2020 18:07, Pierre-Louis Bossart wrote:
> 
> 
> On 7/7/20 11:36 AM, Srinivas Kandagatla wrote:
>> Add support to gapless playback by implementing metadata,
>> next_track, drain and partial drain support.
>>
>> Gapless on Q6ASM is implemented by opening 2 streams in a single asm 
>> stream
> 
> What does 'in a single asm stream' means?


So in QDSP6 ASM (Audio Stream Manager) terminology we have something 
called "asm session" for each ASoC FE DAI, Each asm session can be 
connected with multiple streams (upto 8 I think). However there will be 
only one active stream at anytime. Also there only single data buffer 
associated with each asm session.

For Gapless usecase, we can keep two streams open for one asm-session, 
allowing us to fill in data on second stream while first stream is playing.

> 
>> and toggling them on next track.
> 
> It really seems to me that you have two streams at the lowest level, 
> along with the knowledge of how many samples to remove/insert and hence 
> could do a much better job - including gapless support between unrelated 
> profiles and cross-fading - without the partial drain and next_track 
> mechanism that was defined assuming a single stream/profile.
At the end of the day its a single session with one data buffer but with 
multiple streams.

Achieving cross fade should be easy with this design.

We need those hooks for partial drain and next track to allow us to 
switch between streams and pass silence information to respective stream 
ids.

--srini
> 
