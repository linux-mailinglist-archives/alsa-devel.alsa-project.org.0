Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E91691B8D8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 09:48:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B0FF2369;
	Fri, 28 Jun 2024 09:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B0FF2369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719560886;
	bh=TIn3dSD9Y/O5J9F3VJziLjzKGSBP8XVxfPmWbVXuIdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hsl+V5g89/H6U4ycBQHxFgTHed0E897Hq30ia5RnnN63pFw3YerPnZSxetXR3yU1j
	 F0K8/93fafTU0dz08M3fjyBywQ24AOwkG63NHvjsKF2GtdqnL9YgGtS7r/T7/AERbf
	 +ze+Ipe+yM4qtsT49fiYEic3NP5+6mGeS4CuJ0WA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5959DF80154; Fri, 28 Jun 2024 09:47:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB58F805AB;
	Fri, 28 Jun 2024 09:47:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84639F805AD; Fri, 28 Jun 2024 09:45:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D7B9F80423
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 09:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7B9F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zS3jYgRv
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso2504651fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560732; x=1720165532;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ta6pOQl7Ba5DSAPgv+iFZZAffaH8uQvfzLUSjfY48d8=;
        b=zS3jYgRv8XHa5xLtbL7Z5VHKKbyk+p75fjfR6g7qWUzmwDoaNl4g4y2JnzYYJ9OUK/
         AzG6/4BXXJMzQuxqLtSFt2d+dsKONC2EFU2eoCCW8sX5xoTJW94gyP5ZWiYmFg3hmaBs
         5quVk4qleV5KadBbzolIPI2rtRjtT1W8fWZsC7Oq1KqwcNORyl417xTzI/xpJvLxi9BP
         3IPAkeBfTn4zExzOgdrBcrubPlSH6v1XkH4aAZsIuxFcSeP0S09MHs2rukJk0XHYAsrY
         NI6VlCeOUDS0X48J/f9uX+u0vB8IgNNQV1zBMeCd7TmDAFLqgmPwJZqXoqUcaYIBO3F2
         hA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560732; x=1720165532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta6pOQl7Ba5DSAPgv+iFZZAffaH8uQvfzLUSjfY48d8=;
        b=FaeeYHlfpidnVcIETNfOAW/a9Cm0wyrw7z8rf632oUxl+ySnoaA4XfWrEzVWeGeohx
         x92upDOoeXND+6e3uEcM7oJTPiEd5Pgu8hc6mfkKplHh7QetlQEO0U1UwSVMEEVlupM/
         DOur1m89CGI27F9Z+y0niY2aO3JqhMrdSUIW9TmwWXPH94qgGYCV2S8VtKw0YFBFOqCw
         I9V8NRbUL1fiQ8X8TCh0ivF8CM+egJkes8zPLCAOIkcVnb4V3paG6AoNvsJLxwD0Peto
         TILy+6XCoOOh9/AaRw1Ky1Gr3ShOLThypuyOcJQ+BIwAzKMCXQsoS4u8pD9cJ/Vz7BCr
         oKAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8xEPrNY+TP9vbPqLQw6syC0WgCn24cYaROYFzSaOs4U3yYHMTtSNs46bbmRePAqlFMPQRhUVuxgoV9hdmw5aMv/jKc86mrrxUbvg=
X-Gm-Message-State: AOJu0Yykl2xYuXnYhsH0ZX8kPh7VIW1P6YO3RY8Zpt4EuYp8bi979VQ1
	sVRI1gNdVXf4PNHQD++nL1MqgAuuU4Q+pPbwXMeeNNunRO7RET995kUk3no+JUg=
X-Google-Smtp-Source: 
 AGHT+IHqmAR6Aan/s3t39wcFt4NqZCBUJkjEf/RYG6yrSKTVA4mH3xmpTPmcNJL1Afj2I7QNcp83Kw==
X-Received: by 2002:a05:651c:1046:b0:2ec:6756:e3ea with SMTP id
 38308e7fff4ca-2ec6756e4d7mr71538561fa.43.1719560732156;
        Fri, 28 Jun 2024 00:45:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee51680450sm2017551fa.76.2024.06.28.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:45:31 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:45:30 +0300
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
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6115: add description of
 lpi_i2s2 pins
Message-ID: <qe62q5k7r3wwlceqkapwntdwhpngbwtvpwhq5wxwslhke3h6lt@kaveepinffka>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-7-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-7-alexey.klimov@linaro.org>
Message-ID-Hash: EXCYFKKHIOR46AMAOBPFE6K4ZRDI6AV7
X-Message-ID-Hash: EXCYFKKHIOR46AMAOBPFE6K4ZRDI6AV7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXCYFKKHIOR46AMAOBPFE6K4ZRDI6AV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 28, 2024 at 02:07:14AM GMT, Alexey Klimov wrote:
> This is required to enable to HDMI audio playback on
> QRB4210 RB2 board.

Are they SoC-specific or board-specific? In the latter case it might be
more suitable to move them to the board DT file.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 34 ++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 


-- 
With best wishes
Dmitry
