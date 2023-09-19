Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E947A6AB0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 20:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F05A4B;
	Tue, 19 Sep 2023 20:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F05A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695148008;
	bh=xIHY9OJCgFr8Idx8jERHga7rv0UyQ6Kqe+Jha8XV/sM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tA/79JEIu1FF6rakcdAh233fgT4nmi3m1Jll86AXWJAADwXV/usO9Q2W7WoGCQqfS
	 ymc8n6gjoH4YsrNuq1tG+JuIIoU0vu02HuYxlIvMdItrfCRJB2ic+U96Xo7u4+gUuo
	 heUdp6C4dOS+myUsTS5tXQbPf+G3O1MPwvZmePto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02494F80125; Tue, 19 Sep 2023 20:25:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98944F801F5;
	Tue, 19 Sep 2023 20:25:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6180DF8025A; Tue, 19 Sep 2023 20:25:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B353F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 20:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B353F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=S2bjxfRR
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50317080342so4136735e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695147945; x=1695752745;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohVVUXRSTVuwmwAI3dwryx4B5iagEHAMRt/He7o75f4=;
        b=S2bjxfRRFoRM4WeNg1NW1uHGWbzEDDDMD9gZ85MIOfpD6JkkEgzH2KazlkA33MrRct
         REtAL4ohnptgoFh5LR3NZpgZxr7F7ur0Xi7fyT1JoAqnQEYdQroIqLE3p7/l5zjJHWa5
         E+FQaKo4y7WQPBs37B4vUJjz2FajpeDWh2jrZuLA+v4Sn3InvzRUencW0sKPr7ftbl9B
         6uOu9zGWzzcPOsDgqM7DMap5fPX3eUaawXPnFQA9ePNdEP6VfBPbdqKWHlyh+EJQQaQc
         dHzkXku2C77utrGIDULuYuLr8G0i5T9sknpErwUNo7UQhdkU+H6JkXLoEo8/GOav8Dud
         MNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695147945; x=1695752745;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohVVUXRSTVuwmwAI3dwryx4B5iagEHAMRt/He7o75f4=;
        b=nUMmwFpLgTbwJryi6ywACsENnhz6dQHscvioIltlUfWpTjYyRp87Kgo2jD+ZxOJX/R
         iba+Oz76P/G7dqHWrsow5qpuWF2NSaHIN4bZlzUNUvcxQcjG98GFIqM0w+TpxG8JdIh7
         gKNpbrtFgDXgApePGGN/5+nxjwzd2NqrHRmmogplJuPQVlrqkN//S5HL5iPzQBzHp2do
         uAnZ2C0CDaYrBXeiJpoavpQG7VmJQuTUeLsvt2Z7mEgUD9ngb/kfb07ARp8TXbKBrNz4
         /z1O7OahxpdYazzlpY2Aukhbeo3Y2z5vhqdb0wUR1EoST67E/s/EWogBYpms+qDQdt4S
         O+VA==
X-Gm-Message-State: AOJu0YzBidntPT+WHu8BUORQ1b9ePvmOry4Z1kO7voQJ4PQ+z214SNDR
	eqKexPMbih3m7fx86bkQFRc=
X-Google-Smtp-Source: 
 AGHT+IHS2kHXLsSi9+Qc6kPfDaaUR2ud2Y+VIWJcZzSIwgpvpy69kUc/3cPfs//vca3zpn1ZEjnE9A==
X-Received: by 2002:a05:6512:3da7:b0:502:fd1a:9fa0 with SMTP id
 k39-20020a0565123da700b00502fd1a9fa0mr515169lfv.53.1695147944529;
        Tue, 19 Sep 2023 11:25:44 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-92-32.kaisa-laajakaista.fi.
 [85.29.92.32])
        by smtp.gmail.com with ESMTPSA id
 m30-20020a056512015e00b004fbad09317csm2370415lfo.189.2023.09.19.11.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 11:25:44 -0700 (PDT)
Message-ID: <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
Date: Tue, 19 Sep 2023 21:25:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Content-Language: en-US
To: Andreas Kemnade <andreas@kemnade.info>, bcousson@baylibre.com,
 tony@atomide.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, jarkko.nikula@bitmer.com,
 dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20230705190324.355282-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RYNH3JMFFSJQLVFX3H6BYUGIMRYGE3DL
X-Message-ID-Hash: RYNH3JMFFSJQLVFX3H6BYUGIMRYGE3DL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYNH3JMFFSJQLVFX3H6BYUGIMRYGE3DL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/5/23 22:03, Andreas Kemnade wrote:
> Commit 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap4 mcbsp")
> dropped prcm_fck for omap4,

it also dropped the pad_fck for that matter.

> so the clk_src might not be >available making the
> clk_get(src) fail.

Wow, so OMAP4 audio is pretty broken if would ever need to select FCLK?
By default we don't on OMAP4, but this is astonishing.

> In such cases, rely on the devicetree to assign
> the correct parent.

You cannot rely on DT to dynamically select the FCLK parent for
different use cases.
The dai_set_dai_sysclk() cannot select between internal or external
source of the reference clock and DT cannot handle this.
If one sampling frequency is available with pad_fck while other is only
possible with internal clock then this is no longer possible.

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  sound/soc/ti/omap-mcbsp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 21fa7b9787997..f9fe96b61852b 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -70,8 +70,8 @@ static int omap2_mcbsp_set_clks_src(struct omap_mcbsp *mcbsp, u8 fck_src_id)
>  
>  	fck_src = clk_get(mcbsp->dev, src);
>  	if (IS_ERR(fck_src)) {
> -		dev_err(mcbsp->dev, "CLKS: could not clk_get() %s\n", src);
> -		return -EINVAL;
> +		dev_info(mcbsp->dev, "CLKS: could not clk_get() %s\n", src);
> +		return 0;

I would rather have some clock alias for OMAP4/5 to provide the clocks
that we need for the fclk.
If we did not got the clock we needed to select we cannot say that all
is good, carry on.
Normally the machine driver does this and it thinks that we switched
clocks while we did not and the clocking is all wrong now.

>  	}
>  
>  	pm_runtime_put_sync(mcbsp->dev);

-- 
Péter
