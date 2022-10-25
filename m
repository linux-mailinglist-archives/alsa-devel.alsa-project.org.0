Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD760CBAB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8164F65;
	Tue, 25 Oct 2022 14:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8164F65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666700405;
	bh=zO5lhBsH4jkb1KD7nfOrDgika+98FPQC/yfXl2KoAVI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHKL49EIUEhYuUH4mjLl3dw4vdCPCgHKoMCMBelcprI4fXY/RVWYJw5lIAD4afrul
	 7fsnVrskNYAbKh+2OshM9Zo+TQILpsYgyI19e6dJgSDBV49UW4sIXnDsm3nQ2kpjEr
	 Dz0aNuZ4Mq15hvlkKnDxaVY7OYaNUzAgRe/RxIHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A156F80448;
	Tue, 25 Oct 2022 14:19:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9EE6F80431; Tue, 25 Oct 2022 14:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49B77F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B77F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HMcCNMgI"
Received: by mail-qt1-x836.google.com with SMTP id f22so7332594qto.3
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qKDSkNGJdreMgm3y1fnkqMMOtoJ4CwGZ1aA+ETdnP5M=;
 b=HMcCNMgIMtRibFlfaeFOC1TUxpXIRLqgkjuYOfbW0nQP1Mg0YUKXcGkFu4ff4vS1/u
 7hSPHlr0F3rKCnREdTn/8uLk3gQQIyo/RTeCrE5ZBndZLlc7DfJXXOZUUaq4px+0VCLa
 Cv+smwbwojc282ovhmlzY+/caN8iDoi643eGii2QDUNTZub2jYSM0JvLAf1lTV/8BGUZ
 g51ttsT1CZvYC7a+ckbuUN7gsaCvJYPG5seh+/HYx1gfN77Cf7SkOXtA4LohMQUQ15PV
 jUdfp3aASg/HT7frCeDgDOYO8KF0XomYyfu8vpq2n2XGDLPdnQmD7jkMyKiBRyWACwuI
 xfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKDSkNGJdreMgm3y1fnkqMMOtoJ4CwGZ1aA+ETdnP5M=;
 b=JPRsbiX/v2tipYDSej8dPELmQIi+kSjjpystvL/ZU0ts9OVpIoTPUUDYAGgMIR8GDW
 kMtu5DX9TaIn1CynxCgal9mOc30BBjd3j9ltlBeSh2rr+XN1WjkJU6gdv3LGQbFjtSGM
 CWCw1eI+r4Wxg5vQMR3EE4fQ9CLN4gdNJ5RcDQuUX9kHG50iIHhcjqxxpien/7wQmyFU
 8HgTCn8zdK2uv+V1Q0LS1AjLn1nbMQRDsSbhzTu/btl3UyAtNxw0GrkA7XNEKuktKgBI
 M9PV3RrFE2UYo8TUJzI+DahWqI0hYNWu9Iq/DkJiQeE461rQEJM752iZlLu99kri04gw
 bl4g==
X-Gm-Message-State: ACrzQf3vczEpl7keLXfkSiAeG8JfVRPw8WBWbTneCFDdCAVr+9X8kaIx
 o2ovGge/u2anZdkUiVP+PyZebA==
X-Google-Smtp-Source: AMsMyM6CmOT2i+snHgfCM1wCFxDmt74cMIkOkNAQxWTW3eEk0hFvMogIjQc/QEtbABWr5V5GhkSnng==
X-Received: by 2002:ac8:5f10:0:b0:39d:290:3f6e with SMTP id
 x16-20020ac85f10000000b0039d02903f6emr26321959qta.108.1666700344432; 
 Tue, 25 Oct 2022 05:19:04 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05620a28c400b006ecf030ef15sm1956757qkp.65.2022.10.25.05.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:19:03 -0700 (PDT)
Message-ID: <38205667-d36f-e7a9-21b0-2e8597a662ff@linaro.org>
Date: Tue, 25 Oct 2022 08:19:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
 <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
 <hXRpArckbrXUelDdaJ3Y2SErmKiuycXt@localhost>
 <66c1a100-922e-4a33-e80c-fc80866acf03@linaro.org>
 <jZCUALhj8PoqVkuWdtLf8LnPAj1wDakF@localhost>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <jZCUALhj8PoqVkuWdtLf8LnPAj1wDakF@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
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

On 25/10/2022 05:14, Aidan MacDonald wrote:
>> Krzysztof
> 
> Device trees already use standardized enumerations in other areas so it
> isn't a new idea. Look under include/dt-bindings/clock. Every header
> there contains an arbitrary enumeration of a device's clocks. In fact
> most of include/dt-bindings is exactly for this purpose, to define
> standard values that are not "just numbers" but an enum, a flag, etc,
> with a special meaning. It is not specific to clocks.
> 
> There is no dt-binding for system clock ID, because prior to this patch
> they were not exposed to DT in any way. But the enumerations themselves
> already exist, eg. the IDs for nau8821 codec:
> 
>     /* System Clock Source */
>     enum {
>         NAU8821_CLK_DIS,
>         NAU8821_CLK_MCLK,
>         NAU8821_CLK_INTERNAL,
>         NAU8821_CLK_FLL_MCLK,
>         NAU8821_CLK_FLL_BLK,
>         NAU8821_CLK_FLL_FS,
>     };

OK, this looks good.

> 
> We would just be moving these into dt-bindings if somebody wants to
> use a codec with simple-card. Future drivers would add the enum into
> dt-bindings from the start because that's where it belongs.

And the remaining piece I don't get is that these are not bindings for
codec, but for sound audio card. You want to set "system-clock-id"
property for audio card, while putting clock from codec, which will be
used to pass back to the codec... so it is a property of the codec, not
of the audio card. IOW, NAU8821_CLK_* does not configure here the clock
of the system, but only, only clock of the codec.



Best regards,
Krzysztof

