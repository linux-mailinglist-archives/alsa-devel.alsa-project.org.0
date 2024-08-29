Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC37963F71
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2024 11:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FE8105F;
	Thu, 29 Aug 2024 11:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FE8105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724922290;
	bh=Q9bYj/5f0M7H1HvllWqBlYFk/0euewRtVGILkmAMdCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aQzATQLUaDBTxSyG/qVKGr7iqwxjxraxJhSOR9d5U7yjEMIMxNYpxR4TRNBRDX5Sd
	 koP9l5UW1u2W6teljYZL6SkzmwdoDp5Vy9Lf4SjQ+nSGbE1MWTGuo6kuCg0EGKaCZs
	 TsiS0mogdvda3uWH3cmikuWtgg0WgnnLjRAJrjhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6486EF805BF; Thu, 29 Aug 2024 11:04:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0B3F80518;
	Thu, 29 Aug 2024 11:04:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D338EF80518; Thu, 29 Aug 2024 11:04:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2E0BF8025E
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 11:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E0BF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IJL4zcga
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so4800431fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Aug 2024 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922249; x=1725527049;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQhYCSAf0lZ9zTdJ5ehTCVXsoJJBlJOqEhmha6ZTv8Y=;
        b=IJL4zcgaAV18oeNR/zUJRUGHVpc60HFVr0yW+lCeJhJdTZgvkMQELuXiJaQG1ZoOuU
         HCB8Hj1aVWO+5xVsD9F5iuaC//xk8VMetJuBtMzu+9i/sv14UZOaJQfIHcBfPyCM2P+v
         lKc4Qc7ZxASCtEQtkzfu19wgdk51bIGpH9KQLRe/oUZt1Zyo48sPCo9kDRv0JMGq51El
         HVe6BzgipUiSvaZLw8vqY2LQrpFn1Tz8aV/T3DN1XY61gSJGvhk9h3oSigo8oir+ZE0z
         QyZ0YC9majz+i55ShOZAy3I8fjFlOO5LjiFH27IKIRQUR7/0Z0zJt9MVjNXGLi6xCyMe
         n+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922249; x=1725527049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQhYCSAf0lZ9zTdJ5ehTCVXsoJJBlJOqEhmha6ZTv8Y=;
        b=LrNeHBaYxFDy3Y6Dq+0k8OcBhw5ItbFojAU6SNyjpYZcp7HlRxvMzB05vsTNiTP4Pm
         OYtchMteX9tb50MmKGsiSukR+Vfm10FUHRI8kM6i3oKj0lToYFLPpl8AektBO08a0MSc
         nOjycoYDsVv7QOP1l+jqXIBKDWp2a+TRFoesU/8fczWToe7fiIBfKtCKS2QJePG6LDOQ
         c/Y6JbF4ScgMZf+kMY0wL+8GKXXQMchV35NjkdLfVxfZKT+FbW7WsVgJv5izdnLp9EqM
         EygHDs4LTAXiwGUmFggiYion7kOGB049J4cInyd/F7DamIuKle1FuMHzFV0gVZ9+fcww
         xFYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdLVM04UIwxr61llk1ba3+7ooclOxEheJVK3YcImYaYZEILE8fJV/v7YK3Cx0QzY51RmR9BATKOxs6@alsa-project.org
X-Gm-Message-State: AOJu0YzgegdhdGXtcofZVT6NdPL343HLt/ZFfNteHOrUHMJulbA6eSAv
	ZpTH5szEzQablGzS2z1WHNzYDqFOQ3BsfabZwl8P6qTjAAuxzSdGbU3TskEDvIM=
X-Google-Smtp-Source: 
 AGHT+IE/qXx2q84dxT76THTRzMY5sKyc3VDj8MyI+BTpt6oDqkE11zyAxjt+tBhXkDbZgXuT7jScDg==
X-Received: by 2002:a05:6512:31d4:b0:52e:fdeb:9381 with SMTP id
 2adb3069b0e04-5353e5acb08mr1393344e87.43.1724922248778;
        Thu, 29 Aug 2024 02:04:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079b729sm100734e87.49.2024.08.29.02.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:04:08 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:04:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	linux@mainlining.org
Subject: Re: [PATCH 1/1] ASoC: qcom: sm8250: enable primary mi2s
Message-ID: <egicpgs2l4wkthb72hp2clleh2yajhjrkmuceok5hbjnfbbqft@64aendbltnls>
References: <20240826134920.55148-1-adrian@travitia.xyz>
 <20240826134920.55148-2-adrian@travitia.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826134920.55148-2-adrian@travitia.xyz>
Message-ID-Hash: O7HDZNIGYI66XF4X3WBIPDNTXVYBJZS6
X-Message-ID-Hash: O7HDZNIGYI66XF4X3WBIPDNTXVYBJZS6
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O7HDZNIGYI66XF4X3WBIPDNTXVYBJZS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 26, 2024 at 03:49:20PM GMT, Jens Reidel wrote:
> When using primary mi2s on sm8250-compatible SoCs, the correct clock
> needs to get enabled to be able to use the mi2s interface.
> 
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
