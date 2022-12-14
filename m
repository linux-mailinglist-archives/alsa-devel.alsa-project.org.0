Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AB64CE3E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 17:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 534362A18;
	Wed, 14 Dec 2022 17:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 534362A18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671036069;
	bh=miQV7Ovr9cjfS7SXFTg/vmu5MJtUPHGv/PV8WzvmHAk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y3b97S4dmug4yROPRNLfjvaYXxrAsg+SO+PRu4067lMtyaBG0ZtVbtIKe2MsRWeUq
	 0A8akl6SQGjIyxy2lIwUsywkTVD4IJBKV+N2AxFkHMS872lqKP712k1B/g+Snm20JD
	 KPftEMDi0ZoTYDsSi1xEEpaXeBCUOLmADo2L6wNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC88F80310;
	Wed, 14 Dec 2022 17:40:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E103F804D7; Wed, 14 Dec 2022 17:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A45F801D5
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 17:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A45F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=O3GKHlfC
Received: by mail-io1-xd32.google.com with SMTP id d123so3678668iof.6
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 08:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WKOOiUPKftict/8DhQFtuAp51sa4ovrd2kJ1MyabHJw=;
 b=O3GKHlfCENCpCId9rzfgQyNazbXImgRjhe1IswoXuSD+obIOxQMzCJvjjn4DSO8TfB
 pnhJIYsu7L+bfp85STMCZNRGPLJsWYDIbGEnTiTNqiQ6QQMWtnc1xXP3s/hb29i0HQx8
 xLGWppNpMlvdaaE09ISsLcVZ+umUpgvV1+VKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WKOOiUPKftict/8DhQFtuAp51sa4ovrd2kJ1MyabHJw=;
 b=YqA0MFNBLeOjIO2R8Sg48sy8PK+MlmRN0jX45ba6/EQH0mMUaM4P9K2FVWsgJ494nR
 AknM4Mp8BnxOwuqaZHcr+VyWk/R4ZNAz0/0pPiFu3zkn09pIq+JtP6IsvrXkkuaWsROQ
 fvgFW8GTr8CEeXLCzEVnWurPZoygNPD0i2WtjCZbN6TuxklxGu+GclTyp4jPQrRmqh31
 Go5JrXnF6R13kWCAGoQFnZ5Voqs/5/y5LvYpD+2KHhFhldzIpT65+/UbPN5Hu4lyVazI
 SK8gxqbF7Ue56hkCLwR7b9VweSP7nlTx4xIpbCqURY9+X+WbGoAiOIqWUS/pAUGqzF9i
 oq5g==
X-Gm-Message-State: ANoB5pnpGfncXN14lTyKOGv0Nj68MX9XceLRZjF5iy6DaIDR70Y+quCr
 lFY+Qsq13TSf7mQ/6nDqY+FX7A==
X-Google-Smtp-Source: AA0mqf4uk2vQ/34IoSVvV22g4d7cg9twWjLWq2DpSCNefcinONz0Gv+PJabIJlO243XLGuqdLtAuPg==
X-Received: by 2002:a6b:500e:0:b0:6e2:d3f7:3b60 with SMTP id
 e14-20020a6b500e000000b006e2d3f73b60mr2416935iob.2.1671036003942; 
 Wed, 14 Dec 2022 08:40:03 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 c17-20020a023311000000b0038a0182e0casm1939716jae.11.2022.12.14.08.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 08:40:03 -0800 (PST)
Message-ID: <808f35bf-2800-c34b-cae9-4d8eaa11294d@linuxfoundation.org>
Date: Wed, 14 Dec 2022 09:40:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] kselftest/alsa: Increase kselftest timeout
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221214130353.1989075-1-nfraprado@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221214130353.1989075-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 Shuah Khan <shuah@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/14/22 06:03, Nícolas F. R. A. Prado wrote:
> The default timeout for kselftests is 45 seconds, but that isn't enough
> time to run pcm-test when there are many PCMs on the device, nor for
> mixer-test when slower control buses and fancier CODECs are present.
> 
> As data points, running pcm-test on mt8192-asurada-spherion takes about
> 1m15s, and mixer-test on rk3399-gru-kevin takes about 2m.
> 
> Set the timeout to 4 minutes to allow both pcm-test and mixer-test to
> run to completion with some slack.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
> Changes in v2:
> - Reduced timeout from 10 to 4 minutes
> - Tweaked commit message to also mention mixer-test and run time for
>    mixer-test on rk3399-gru-kevin
> 

What I have in mind is that the default run can be limited scope.
Run it on a few controllers and in the report mention that a full
test can be run as needed.

There are a couple of examples of default vs. full test runs - cpu
and memory hot-lug tests.

thanks,
-- Shuah
