Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7014293DF04
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 13:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6851AF94;
	Sat, 27 Jul 2024 13:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6851AF94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722078302;
	bh=0oZ0fowpposgg1hmSxqfPXm1dtlRuKN3xpqiuu5rB6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i3jfh0hLvDwvJJxWf/XXtsNmw983I9nFMAwVV+nhpZ9EsvOYpxvMCtcYfA02idUeT
	 bKFYB9moRmrjUchNAUuyMnNJcOxqJwK+NHH9/onhERvdUudHgjMSornqSGxLBbelC4
	 01QANDZlH0lNTiLEd8K6LvkBmDuyhHSVhr+UjTV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BC1EF805F0; Sat, 27 Jul 2024 13:04:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7F5F805FD;
	Sat, 27 Jul 2024 13:04:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF92EF8026D; Sat, 27 Jul 2024 12:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F18FF80579
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F18FF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FyOHlBLr
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52f04150796so3254072e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077372; x=1722682172;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yNKzx3azHXxh3j5OMY+IqqDu+KTxQQhcMUOz9aaOMTQ=;
        b=FyOHlBLr4hRFyzkZYTj98aIBhkv31Vyxxqs4W/K50I57wIH2kuaLd8/H6/fANu5FBV
         IMaF90xzlS/xKJGHhiI9hKULEV8eexCpQvLuDiv02tt9bDoj0VSckuvj2+wTGrz3MMZW
         cvUdElqf4yLz9MgQNfSht3B18w4kDtg6Jh7UfFL9ICGQZQoJZhDCjzAOmU+nlQpTYooy
         XmqGvrVe5iiNnFBfGfoqAE+ZyPkO809d33twlVrxxEy14C0UPKmjUOP0Xt1PIa6WhzMz
         xVPotE9zV7813EN7uZPONOran8kifFuZ4aoG1uTGt11nHwAVwH/8LQzHkDsaj/LVO6Ck
         AOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077372; x=1722682172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNKzx3azHXxh3j5OMY+IqqDu+KTxQQhcMUOz9aaOMTQ=;
        b=AqIfUexKMEnDkeolObwh7gstXdMOoTRG31TvQyHpRR4Obv05SntVXehxVsVtQFCjA6
         J7ZtLmkSMVRaKq1EOQhbAmjsnqD0dZYaXIv90fhP+6erfaMRjTG1s496zh/OhfWZ/g8s
         YT54WaJBQNav7q1ongSjrJ5tc01Bl3rXc3fhE2m4MgL4myK6vWNkO6nkXPoQ/rWZmPM9
         ORtbE84FDw9iviYEX3yiWr1EZ3tprBGt3UUcsfcafsG3FrWxFry3FhgwQ4VgRsTcWDSF
         FZNjFO8iZCxRDXvac5/nfl4f7HkcvxPE96BkE7lKBYeggMB8K58G6nJajf6l6UfNk0M1
         2c4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUofduZBhKjMV+WsC2s9HAZZGjUptIpatCkqdbCjfJeSet+NRBTdNHobLrJI5C6MTn3xIsgJwIm6MU9dhYp8Hk7C6l0mMVx8vFqM0o=
X-Gm-Message-State: AOJu0YyyM9jNV/ZbCqS6jAdED+4igK5M67bJzXaI4mD58CazhnpIf5aP
	8+ql7R6gE3x0CMLp+RF5Ys70Jb1lrPrWIfPZDsSnsw4S64EwSoPmQ+ATTh8vgyE=
X-Google-Smtp-Source: 
 AGHT+IGxziVLosYTzs6fsYoTWkq3wWwSbcxZCa9nxslFM0uZIZe3gN9qbnNwurh64J1lmrZMg2moVg==
X-Received: by 2002:ac2:4f0f:0:b0:52c:cb8d:6381 with SMTP id
 2adb3069b0e04-5309b270661mr1909187e87.13.1722077371627;
        Sat, 27 Jul 2024 03:49:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c2c133sm734387e87.252.2024.07.27.03.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:31 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] ASoC: codecs: wcd938x: Move max port number defines
 to enum
Message-ID: <uc3zgtkfw2gbgy5cm5hyf4i7qq54uagirxnp7sqva45wfc3zrd@wlqsuhx7mhgb>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-6-80a03f440c72@linaro.org>
Message-ID-Hash: KDHLO3HNPHITJKHPO2IWKC24J5KDA2CO
X-Message-ID-Hash: KDHLO3HNPHITJKHPO2IWKC24J5KDA2CO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDHLO3HNPHITJKHPO2IWKC24J5KDA2CO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:48PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd938x.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
