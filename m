Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451662982B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:08:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DFC916AD;
	Tue, 15 Nov 2022 13:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DFC916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668514112;
	bh=IRkf0Zfmp4i/5DjW8jR+DmclABUASvNBnjtCmrbcHeU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ue9E/Y6ydv8dRxrEGYvudnoKyC+N1fkxNuHNCegSgnqt4xsiAKGiAZuHACsBBuIuG
	 HEhIRkYRm/6WlirZMlb4q5u9yP0CiwAqkZoOaa6mxSvhCZcduOAitk7wAxt1Z79ucB
	 umSm8gTgHUNosXZTsuwcZcVTqdgYx1KeBGCvRZi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE6AEF8047C;
	Tue, 15 Nov 2022 13:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7801F80171; Tue, 15 Nov 2022 13:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44CFF800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44CFF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Vkh6FBln"
Received: by mail-lj1-x22f.google.com with SMTP id k19so17238558lji.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQSvUHF2mKz08VEEZmsndEu/bBIUnKZLMjnATxqD90U=;
 b=Vkh6FBlnHPSpnSxcHdDQAx7gCDoYV9NNpu2UstlfR6JGOhJKRnmplsfymFshPMWvaL
 zb5srr1PnYNuAGYsXSf/tb5FkuuFPJ9OlCW2WWO+RBI4kW/r/fVLp+mKJhl8rO1o7m4g
 yvOUxvdYZwhXg72CPXUeEcGasxPZ/Bfz+2MlesouXDmYjx5jKcWNxr3n6THVwfjao+bR
 rtvoA4R3XdO8A11neeQUQ9m/+2U9unblBzK4jpzNJimmK8LaF8AU+6bWEWQgbFjBp/sD
 2nz/nHx47pRhlKnl9zSHlm8/TBedEAuKcgiP4itJINVi3WF/Y/x3UVYnEdVc6SieuTn6
 xXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQSvUHF2mKz08VEEZmsndEu/bBIUnKZLMjnATxqD90U=;
 b=ZqDeveSyUH0LBck+m+WnVqGjEK/h+rqvs50170N3Ocn8fAEPGpsqBDJ9UxdJGTBYsS
 hgMumGKG6XK0b2g2PKukI3gLUh6SwJYpCQglb2Y807YP8CX9xwePr/htN2tXyomeOVJH
 tot5tAulPP6EsJAUk6qSt5fi6jUSaxtqRkGxExmYzYgNAxdx86rtNyO+NT7m1bbo9oKk
 q7dzJbZnWTgjyA54SB9iW2gjzn1r65SdxYFA+N+eQaNx6WMmvoWTZZTphpM4wvVA4weU
 PYTSIMS7/87WosSuzTbllk+to9xKU2uX681wgMpx2TBj72gXC8NrbEAL8IHbKec3geGT
 ztMQ==
X-Gm-Message-State: ANoB5pkQW6fEDIqkD6q/fzFnX2pYTP93OysyG4zT6vzBkQSlc+z8j1HV
 k3J5aoAlmyZ1+Df7/irC/p6aLw==
X-Google-Smtp-Source: AA0mqf4U9TM+GlYYuOcq0JeIeMaYDGuMt+O6BkP0FGSAdYbDlajVf6/NMTLnig1EblZQTu7RTpre+g==
X-Received: by 2002:a2e:a590:0:b0:277:3ca2:dac6 with SMTP id
 m16-20020a2ea590000000b002773ca2dac6mr5359644ljp.143.1668514047452; 
 Tue, 15 Nov 2022 04:07:27 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac25606000000b00499b27a329esm2190637lfd.300.2022.11.15.04.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 04:07:27 -0800 (PST)
Message-ID: <ea3b8fe5-2283-0386-c63a-e056a879776e@linaro.org>
Date: Tue, 15 Nov 2022 13:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Discuss [PATCH V4 6/6] ASoC:codecs:aw883xx corresponds to the
 modified Makefile and Kconfig
Content-Language: en-US
To: wangweidong.a@awinic.com, broonie@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, tiwai@suse.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com
References: <000801d8f8e8$1c8096c0$5581c440$@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000801d8f8e8$1c8096c0$5581c440$@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

On 15/11/2022 12:47, wangweidong.a@awinic.com wrote:
> Hi Krzysztof Kozlowski
> 
> Thank you very much for your advice, but there is still a problem I would like to discuss with you

Please press "Reply" when replying, so your message is properly
threaded. This does not get under a thread, so makes life of others
difficult.

> 
>> From: Weidong Wang <wangweidong.a@awinic.com>
>>
>> Modified the Makefile and Kconfig to compile aw883xx
>>
>> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
>> ---
>>  sound/soc/codecs/Kconfig  | 10 ++++++++++  sound/soc/codecs/Makefile 
>> |  7 +++++++
>>  2 files changed, 17 insertions(+)
> 
>> 1. Where is patch 5?
> 
> What does this mean? Did you not receive patch V4 5/6?

I did not get it.


Best regards,
Krzysztof

