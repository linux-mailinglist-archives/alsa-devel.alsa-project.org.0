Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1C992137
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2024 22:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A72852;
	Sun,  6 Oct 2024 22:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A72852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728247082;
	bh=M8XFZ+XZu6P9eWWlD53BLavuApuWrkIDcfjsGz1vIG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GWZHIzYZxj04BG2FJoICvA8CclnaCKGdgKMxuAc9uwaDNUUcagRyxoHbdocd9VL9V
	 giN/oo9b72lQTZ/BVIqwQIdK6oUgplplWxE4ZPFquyxtzNZQ1iehVknS4tsSbn+vv1
	 7y+8bPQ1Xw/WnUZzuE9cA1YHU3iz9DmmPAORs4qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F194F805A0; Sun,  6 Oct 2024 22:37:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB52F805A0;
	Sun,  6 Oct 2024 22:37:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41364F80528; Sun,  6 Oct 2024 22:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD2FF80496
	for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2024 22:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD2FF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K0hrXksT
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so35486861fa.3
        for <alsa-devel@alsa-project.org>;
 Sun, 06 Oct 2024 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247044; x=1728851844;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KcY2mGkv8zON8tiPzPr+aw+bAMCypp/7m9sSR46t+M=;
        b=K0hrXksTc6qOz3eBSQgvAIo9We9a3M7saAdbAHkrmkiv2l50JQtSlNHYaZb9SNrDwM
         AHUB9TY4bfnS65cnmdw9l3S+lUmG4Ti3dCI6RvTUC0uSWPB65wkHKdxM5U2/WttCm2xt
         DzJiJBw/u7qCqnLGwE28L9FoHG0JJxiEN4GYIK1QMI3ymSv8CbYWVV0ao8Go0NTshzkG
         RsaJ5foIuD7MiZmTQWucaOtRDr9gl9U1JmWH0Nk2z1gtlwYeNWdTFX+ufxze0VGuZVND
         co6hm6bwODqGVx8wQEspYPQ8NrYj3byycrbanbVY8VU5LiOeSdg+yGbHrg02fu2r6u/t
         547g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247044; x=1728851844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KcY2mGkv8zON8tiPzPr+aw+bAMCypp/7m9sSR46t+M=;
        b=rVIOniHUMNL229mUiuBWipx9tECYwWctghDiijgCZrMUeBE5XDXxXNmUXO97lw/TH9
         i7VVFKsHLN2rRhGz9QlcFHdZyCuCr2zHH0aASpfRFuv3U5qcvDSHlD4K7vNGZXPjyHpm
         MudrZHJ4GWJkRrI93/wEf7ZqWqmwNFi8vFMO+G5FC4/l0+mOZm0nE46nacYehi6zgHU8
         i/Dayl8IVfX+GccevMxf+Z93LZqoedaHhT56nZ2j860SAputMdlHo+1RJW5LZu4p9bi+
         iXecv5HjcvBTS1pNNePXFcDtpJvredBJx+MsQD++966kvPWEIUvKJfzxEg3pLjuc3+B5
         T4yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKcA8yN9aD1oytdH8IRjM3nQm+55JaD2sZzJQZEL8KZWKAlMMhkPx1HmXoJtls49awUYuJXOorqUwP@alsa-project.org
X-Gm-Message-State: AOJu0YwUvr93k0YBbFOtrffAJhphWk3CRQZAS5KLA5iA0WSXocTNgACE
	Z3cewpnnC8kVNgt6n07HOJkSQLocveHq5MAIyPXPw/iKZQr66tdSCYO6l6+Lxs0=
X-Google-Smtp-Source: 
 AGHT+IHDxJfaAaiHj0TzwVkamnlQWohsnVF+S0nchkFV9KcYV06WShhTWAJdWVE2OCF/8RaOR/iHew==
X-Received: by 2002:a2e:be20:0:b0:2fa:e4ae:3362 with SMTP id
 38308e7fff4ca-2faf3c1403fmr36583341fa.6.1728247044068;
        Sun, 06 Oct 2024 13:37:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faf9ab19desm6156211fa.24.2024.10.06.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:37:22 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:37:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org,
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
Message-ID: <a3y3glcauxhsbpwzbglbrtr4khnyueoxvf6kitxn46zzpy3css@qmaircmfrlqd>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-8-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-8-alexey.klimov@linaro.org>
Message-ID-Hash: IGMR2A5RG3M2IINQNR4O6AEVEEPMK5ZU
X-Message-ID-Hash: IGMR2A5RG3M2IINQNR4O6AEVEEPMK5ZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGMR2A5RG3M2IINQNR4O6AEVEEPMK5ZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 02, 2024 at 03:20:15AM GMT, Alexey Klimov wrote:
> Add sound node and dsp-related piece to enable HDMI audio
> playback support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

[...]
> @@ -318,6 +365,14 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +/* SECONDARY I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */

Nit: LT9611UXC

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +&q6afedai {
> +	dai@20 {
> +		reg = <SECONDARY_MI2S_RX>;
> +		qcom,sd-lines = <0>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
