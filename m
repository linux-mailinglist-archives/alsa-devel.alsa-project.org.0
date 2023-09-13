Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8079E061
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B31B293A;
	Wed, 13 Sep 2023 09:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B31B293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694588601;
	bh=Sb0PFk0RapI8RDMPiMRZCYA3QWc6Ehl2J4NzA9e4XWU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=j2gJqz2Kli13wWx0RaDC87pvffeitH58HIiJLYdDVfiH0rHb2ANbM9ngFT8CknFuO
	 DZvYhQI9CW+6R+FcPWwyFbJm53X86/977bYtFPnWMuH5iOh82dTmyc7q5DhllFCThr
	 +wtz/5nuxpNuNUDdJcIZ3fPnkKffCfiRnJHuwoM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECA44F8047D; Wed, 13 Sep 2023 09:02:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96A9AF80246;
	Wed, 13 Sep 2023 09:02:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A6EDF80425; Wed, 13 Sep 2023 09:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8654FF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8654FF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EN2j1xi6
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9aa2c6f0806so376644266b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694588540; x=1695193340;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1rc1LzbJvJ0G+OA+LqqEMmtttFt0Qb849U5LVF5BIk=;
        b=EN2j1xi6Lp2+wjUYd56Sph08WJlahMwxZDGoDqGp/Y9qbMleh2KvU7Ib67tB74O67m
         ZWvUAdCgIbukXaSCJpsdAfNrspBAV5/lnHUSjKVJ84hii+CYkokx2+Jayi/ykpmY6Ch6
         BkW3wrtYmDs0sCw/1PL/43N0BBKpjnsdtFozkURFU3HUyksW+MiiyX3qYnSi1D+7wK0s
         UMoWo7hJa+dg83KFjr3y1/c1Kz8cMVWJe7qPe3PPU97MOLdE9yPthj/GWGg6BmqbkXoC
         xnV61FEeVW8cIJcNy7U2mkA8GC1iGtnUt3brPh7oMVeMYJeGNUG7ZzmeN6joYPa8QSbl
         1/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694588540; x=1695193340;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1rc1LzbJvJ0G+OA+LqqEMmtttFt0Qb849U5LVF5BIk=;
        b=Lo9L1bkZjR5iSbAh6gFLrQ1QEP/GrauaIfxZBrmFm5BnFiWXxPteHSy8RmofVd0NmD
         30YZwYjbw0MiG5fcx4cQr+//wlmnzHcz7R3z9X4rMFLzYisbV+pIowpDImRMybw5luvW
         16vR0iwzUSjNH/QMmSyIlhDvvgDOfHblcSkHzgIHAEtlC0W3w/6eSeEjPjyUcjbCCSQ1
         VS3Pb/6UoqAcqJyioqzuOuQRDcWcTLzZeikYMefhlpjtSFL/NOVRK4DWswL87/pxaITU
         AdlMCQlQrMofMOzs/53DyUtq2/ZhinEXJ6NTEtwmKKJArb5zVZQOsSJgRyoy9cuuy2Cy
         zHUA==
X-Gm-Message-State: AOJu0YxYaz1GkiozGuAuvPF4YWariEUUL0JZX1SVBW7b+UgOyPnTq3FS
	/RmhInhIWJtLBi/qzl/xXe0g1w==
X-Google-Smtp-Source: 
 AGHT+IHnEJGHmwstPMJ15Zy3Rri6suCLCTKqHXLKWj9VzFdV1R44d+EmH96hsTtvp4FgjExxgPAXPg==
X-Received: by 2002:a17:906:1da9:b0:9a1:d087:e0c0 with SMTP id
 u9-20020a1709061da900b009a1d087e0c0mr1099470ejh.42.1694588540407;
        Wed, 13 Sep 2023 00:02:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 q24-20020a170906941800b0098921e1b064sm7871387ejx.181.2023.09.13.00.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:02:19 -0700 (PDT)
Message-ID: <cc6ad994-a3c3-03d6-6095-14e43f105314@linaro.org>
Date: Wed, 13 Sep 2023 09:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 1/5] ASoC: dt-bindings: Adds properties to
 "awinic,aw88395"
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, ckeepax@opensource.cirrus.com,
 herve.codina@bootlin.com, 13916275206@139.com, ryans.lee@analog.com,
 linus.walleij@linaro.org, sebastian.reichel@collabora.com,
 fido_max@inbox.ru, povik+lin@cutebit.org, arnd@arndb.de,
 harshit.m.mogalapalli@oracle.com, liweilei@awinic.com,
 yijiangtao@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230912065852.347000-1-wangweidong.a@awinic.com>
 <20230912065852.347000-2-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912065852.347000-2-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7RGCFR6NSNZOVSAJGD5RHBVOUOTTEQMX
X-Message-ID-Hash: 7RGCFR6NSNZOVSAJGD5RHBVOUOTTEQMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RGCFR6NSNZOVSAJGD5RHBVOUOTTEQMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/09/2023 08:58, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Adds properties to "awinic,aw88395" to make files more complete
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw88395.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> index 4051c2538caf..4965aa4a5370 100644
> --- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> @@ -32,11 +32,28 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  awinic,audio-channel:
> +    description:
> +      It is used to distinguish multiple PA devices, so that different
> +      configurations can be loaded to different PA devices
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +
> +  awinic,sync-flag:
> +    description:
> +      Flag bit used to keep the phase synchronized in the case of multiple PA
> +    $ref: /schemas/types.yaml#/definitions/uint32

Looks like bool, not uint32. If you made it uint32 for some future
purpose, then the name "flag" is misleading and anyway what would be the
third option here for sync?

Best regards,
Krzysztof

