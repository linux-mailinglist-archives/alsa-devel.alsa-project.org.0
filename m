Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E7179A35D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 08:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7615D852;
	Mon, 11 Sep 2023 08:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7615D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694412819;
	bh=vxC4RoL9uqtP6MXYD9XdnefL+iUNc1fmyBwL4Ew1NRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XmhwXzsPXob3zYUABymf5lyaSfXGuwj3/eT461rPxNRaCiWNH6DrNY9VOtas20p1Y
	 IfYD4uFdz+TzfxHRoOEoxOZmBH8sbO0oMAMFLzethoamhi2a7h5E0qKrsh8I3F96G/
	 /WJfvG43B3wleaBL0KJg1swz9UHz6jPktJ+VgBhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B0ADF80425; Mon, 11 Sep 2023 08:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 981D5F80246;
	Mon, 11 Sep 2023 08:12:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F387F80425; Mon, 11 Sep 2023 08:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54F7DF801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 08:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F7DF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GdHinTpO
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so4041337f8f.0
        for <alsa-devel@alsa-project.org>;
 Sun, 10 Sep 2023 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694412741; x=1695017541;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XezrCl8ZqDRyxio73LdcaLmnL38z1MHmy6zWkUdZX0c=;
        b=GdHinTpOqyha/jU6R1EKOA38LPjPeE6Yr9DBJ2XUIvhZ2UzXcSPOYKmLzVbDbAh9XQ
         FLqlXMGF3lLDBm1h62fSc+SBhzHG2BgmmWWXxCtI7LX6N3aBsOGuNTDamrK6DCEjYgTe
         HZ2ZjpfsQyrZTt/0gMjAuqjk3d93xKiP77unzhaDBxCX3rXxWMXzXzu0MuAkYcpuY/ZP
         4HiZLZBpL0zMUG88vgdj/0WiIVjXzKuIrsB7rX/dYR8XaNITscOGV6N3CbeBnBQaEHZw
         O1Rp0e9WwyA6uJgmNLE6/h6oR2nJDK5WlJILtUV7dRbl7xPK590CC5ibgZZv2+Z88PYt
         K+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694412741; x=1695017541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XezrCl8ZqDRyxio73LdcaLmnL38z1MHmy6zWkUdZX0c=;
        b=QjOR+4eHzrjIGH89ILxyRWKRDJiigEKDA+J/dbp1qHgAuk2e2wPUae0MO+6fPvcpQQ
         5zjMOV7DfyqPgsVGmMJj9X15JNr28qP2ETPsUwmdeQookqUM6dPTwYrIkKPA1bhYJCqW
         f8iRMK1/GxBOhiTUd1td4AdklLHIC3iOPBdgfL2giBKqL/fAlztuCTRmTeMSU3fbv2jY
         nEQNx1+2KRVa1LZ2Me3WQPx3UUu452ofZfXKO6dszqQDsOr5wJnsScnOAlltqCXHlizP
         kvTQFVQ1mDfxEnfEsjjqpi57Ry2+EIivrJ7IsHdkljJ09TrOaAMln2Lqd0PsAr34NObO
         DYcA==
X-Gm-Message-State: AOJu0Yy8RiMzloHlo5KNIeZkHz6+ko0lycAddZAFf5DSypi36e4HOPWk
	ILwBNcKN0PXuCqiibN8kp3L1mw==
X-Google-Smtp-Source: 
 AGHT+IE5Ebjr5i6VAf1KdNZGjQGiz4Iee/J02faavRwi1z0yfclTmtfOj/Jn0i8zTJzMyqK6vWlhfw==
X-Received: by 2002:adf:e68a:0:b0:317:5ed6:887 with SMTP id
 r10-20020adfe68a000000b003175ed60887mr6707475wrm.66.1694412741175;
        Sun, 10 Sep 2023 23:12:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 x5-20020a1c7c05000000b003fef5402d2dsm12227048wmc.8.2023.09.10.23.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 23:12:20 -0700 (PDT)
Message-ID: <bf43b771-35e3-1b37-24f5-e21b2c34a415@linaro.org>
Date: Mon, 11 Sep 2023 08:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ASoC: dwc: Add Single DMA mode support
Content-Language: en-US
To: Myunguk Kim <mwkim@gaonchips.com>, alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxim Kochetkov <fido_max@inbox.ru>, Xingyu Wu <xingyu.wu@starfivetech.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Uw_e_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org
References: <20230911024023.43833-1-mwkim@gaonchips.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911024023.43833-1-mwkim@gaonchips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Q6PSJYXQOHKSFXFITZEXFAEFL5OCRGYP
X-Message-ID-Hash: Q6PSJYXQOHKSFXFITZEXFAEFL5OCRGYP
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6PSJYXQOHKSFXFITZEXFAEFL5OCRGYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/09/2023 04:40, Myunguk Kim wrote:
> There is a SoC between dwc and DMA block (ie. PL330)
> that does not have a burst signal and supports only single.
> 
> So write not-support-burst property on dts, it support single DMA mode.
> 
> Signed-off-by: Myunguk Kim <mwkim@gaonchips.com>
> ---
>  .../bindings/sound/snps,designware-i2s.yaml          |  3 +++

Bindings are always separate patch.

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.


>  include/sound/designware_i2s.h                       |  1 +
>  sound/soc/dwc/dwc-i2s.c                              | 12 ++++++++++--
>  3 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> index a48d040b0a4f..43a46ba2a70c 100644
> --- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
> @@ -86,6 +86,9 @@ properties:
>        The phandle to System Register Controller syscon node and the I2S-rx(ADC)
>        enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register.
>  
> +  no-burst:
> +    description: Use single transaction only between DesignWare I2S and DMA IP.

This was not tested. Missing vendor prefix, type.

Anyway please provide some explanation why this cannot be deduced from
the compatible.


Best regards,
Krzysztof

