Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 760977C7083
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 16:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469AA91;
	Thu, 12 Oct 2023 16:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469AA91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697121734;
	bh=a2EwLT97Y11bcyIh9PjOgFnjMkmwcv8p8D0zD80G9c8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMVyglQ0jzl15lplAi2xG4k6Q14PkuKZEKhlQM82osY7I5G7LfEIovBObq/qb1ZOa
	 TwxnG+LGPXLhRpqr1Fv8p8WVRg+XXh4fHJCe3bDychbzwbha2WiGGJ9QdpeA2xyXMO
	 846QkA4xF4vUREhlbKSciZBiLgWWLOs1ktv49GV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3292F80552; Thu, 12 Oct 2023 16:41:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E8E5F8019B;
	Thu, 12 Oct 2023 16:41:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7733F802BE; Thu, 12 Oct 2023 16:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7424AF8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 16:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7424AF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eaBvOOJY
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c1886777d9so12619621fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Oct 2023 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697121645; x=1697726445;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kw/R5D+s3aJanIgvu3nf4Gs9+0fYmqPraYbms7U3dY=;
        b=eaBvOOJYBBfZw8usSaQgi5DBeXRLv+IUzNrEwDC2uSZCqC950O7ZgcBLGZWxYXxPJT
         MwzuZmNJYFcCxcZz55/ILwq/oPNYbhznh/HHZW4pH+TXqY1pcVKBMgY6GmM3Q4ZHcGlA
         28qg9PhXpl3yxwZH+2l/+KUUk3lvOfnDibG7D+IMU1eQt7jtjtZgg1NZdGl+tb8Q/P6x
         i1mbE5i1e2LRHTNwzGe6OsrFBA8TxCYWPfOL9fSm5YekT13BUPI6Yp2RKFs02Wn+xFnp
         LMs7QYVs0rhSfPmot67iGH12TkzxOWz+i892riEUBtRA1MEY2yr11fNpcgJuHVKuKbek
         H62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697121645; x=1697726445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kw/R5D+s3aJanIgvu3nf4Gs9+0fYmqPraYbms7U3dY=;
        b=A9WH1csWuDa3Ur0JsYZdBr4nHuWpy4slZAvimnGLm9EeKrjYy2huwFaE4SbPF+vLFt
         xe+ce+J477v5t5yDdUKu2etndHGulRS7vbRfSZE+MoGNFHc0UxofQAcUEDeYF5dnPgGU
         oYN046N1H+3mZYrLFc8WrAQP5iC4bXNokL3CVqttK0uiNLux1q7D2JqIW+VB0L8FjJth
         qnNyiVCaJinWm83a5K4hOaZhtW1sA4Z1w0TzavI3Ip8AjDRzClZfPujcWWf9oms45GuX
         eWEUdfL1PpKi/qcQqbdyxvbOSEWVASr5E9+Sh2UZSinMJaSBeuhTqwylp6Rj47dYX/qN
         epeA==
X-Gm-Message-State: AOJu0Yxohyl7+rtFd8b4Hb1BMEAzeK+vVZMStU1V1mojIVAFqM64Nn15
	7FYMz8xllHtJjfVvXh8/Ock=
X-Google-Smtp-Source: 
 AGHT+IGH41yXs+O99grdygoszPTYW1zPKpN4EmD/LKIiUtotZlFPT/goo7+MpuARd/B4135q9i6NQg==
X-Received: by 2002:a05:6512:4002:b0:504:369d:f11c with SMTP id
 br2-20020a056512400200b00504369df11cmr24729653lfb.34.1697121644971;
        Thu, 12 Oct 2023 07:40:44 -0700 (PDT)
Received: from ?IPV6:2001:999:704:2143:20b5:8471:77bf:6204?
 ([2001:999:704:2143:20b5:8471:77bf:6204])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a056512025100b005042ae13de4sm2854806lfo.302.2023.10.12.07.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:40:44 -0700 (PDT)
Message-ID: <db511d14-f2fe-4b4e-bd13-223e7a33f933@gmail.com>
Date: Thu, 12 Oct 2023 17:41:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
To: Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>
Cc: bcousson@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com>
 <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
 <20230921121626.GT5285@atomide.com> <20231006102348.GK34982@atomide.com>
 <20231006213003.0fbac87a@aktux> <20231007062518.GM34982@atomide.com>
 <20231007091156.588d7ba1@aktux>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20231007091156.588d7ba1@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VPRY3JP6WDWWMMVLJ46E6KH3P75TPWI3
X-Message-ID-Hash: VPRY3JP6WDWWMMVLJ46E6KH3P75TPWI3
X-MailFrom: peter.ujfalusi@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPRY3JP6WDWWMMVLJ46E6KH3P75TPWI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/10/2023 10:11, Andreas Kemnade wrote:
>> OK good to hear it works, I'll send out fixes for omap4 and 5, seems
>> the runtime PM warning is something different.
>>
>>> omap-mcbsp 40124000.mcbsp: Runtime PM usage count underflow!
>>> # cat /sys/bus/platform/devices/40124000.mcbsp/power/runtime_status 
>>> active
>>>
>>> even with no sound.  
>>
> Well, it is a regression caused by your fix. Without it (and not reverting
> the already applied ignore patch), runtime is properly suspended. Don't know
> why yet.

I guess it is because of the pm_runtime_put_sync() in the
omap2_mcbsp_set_clks_src() around the fclk re-parenting.
That is a bit dubious thing for sure. We need to disable the device to
be able to re-parent the fclk but if we disable the device it is going
to be powered down, right? I think we have appropriate context handling,
so it might work, but it is certainly not a rock solid code... If you
have a stream running already, you don't really want to kill the McBSP.

The problem is that this mux is outside of the McBSP IP, so we need a
system level (iow, clk API) way to change it runtime.

What is the machine driver where this happens? If you set the sysclk in
hw_params of the machine driver, it will be OK, but if you do that in
probe time then it is likely going to fail as you experienced

-- 
Péter
