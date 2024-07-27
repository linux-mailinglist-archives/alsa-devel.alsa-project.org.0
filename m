Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96E493DF05
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 13:05:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F323714E7;
	Sat, 27 Jul 2024 13:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F323714E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722078327;
	bh=YuxfSJ4lv/oCw60ifWm2XJgjH+1otX685tSUrnHE5HY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EjTdm+wJgNcGVzdlcdLe8/tBYsUsIfHNmKIDitvcUZti9FGdezgATR9ISw7JxfsVR
	 3rrp/hC/+5h6+/2bZfZED02LrieYKUBCBh/R5OSzC9bXia4lwrygNi6zg+5KzXetGn
	 3F1TceFWlN6m6Ho/G4Wbfpu+2P/qLBqF8c+R0xKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B3FDF8061E; Sat, 27 Jul 2024 13:04:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24D8CF80616;
	Sat, 27 Jul 2024 13:04:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1FA5F80579; Sat, 27 Jul 2024 12:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89B20F8057A
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B20F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=woz2mE1R
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef2fbf1d14so21095111fa.1
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077383; x=1722682183;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jcXVWcmcbsKQzq4sH6RxYyKF6535bLDAYqbqnjhWxI=;
        b=woz2mE1RxqhkyTrz985Cqg/SnvSIAVttA3dFZufqW54LU0NIVakhj8r/wWRCOgXYmA
         Oui/So/ciwYrCU7n2nmWJoFq+yALP5B9dE50SzijOu7X8xtFpQC4DLdO6AInY4Iow/DC
         9Ri8O1tCYsFBoL+51YpMncnDG/GG7LfFhAi5uKQgTdU0L01BFfWe9adyJYxuognmWlpg
         B0OHJIvxuUN7LahQDPZIDhl10vrsemIkJzC0eLhf+h7LIj0zbicRMTnhqs4Ov294Ay1q
         A/tg/FpcksRrT+NlsUt2NShHFmgZaG+jGNnpKdR4A3eG+LUFUGhK8hxVpGxy0ThIYQe+
         ZPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077383; x=1722682183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jcXVWcmcbsKQzq4sH6RxYyKF6535bLDAYqbqnjhWxI=;
        b=UAw2lJ6mlyWj7v9DfzUztpu1ej0enSJMEgVPD+IIqgmN7w7HZ9fnfiTsO6K6U1fQao
         HnfHPmLvwXBiFtAU52SWFLNPLM9WubT8+ZoDm+bx7WzRKN0/zLrbBhD+icUJfMS2tJi6
         6oPyu6+fQnBPg4ve0F4wmlDXLD95olkaYUEA3dFBPF5EH+vtWsjxYIgSNJkDwaljZHDM
         3+v85DCqZdk3Jt0BRhFq41eJeKnK105QSrP7FZ/bX2R9mG3JvaKpo7DBZbWPem/SnKTL
         UyGMFdqCjy91rS16dPDSoiZ0kcIlbOPBKv2Rhghpxxw53VCSDyCWjEOCQ/GXTzaVBmxM
         1Pmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo6zYQdZt22TjEvvGxTx00qVAdipnCZpgH70/RfwqQWf31HpVLc8km1YZUotBGh6GuHDsB4J4TtkUO7bouJQiFL94+nkjgI/NTQ2o=
X-Gm-Message-State: AOJu0YwQnsIvpFiS6wvxFWV8spYiVUkJejeFvzOSX3Z+Tyi+dI4QmvLq
	B2a3LjmWmmpY+EdAU6EYpFCKYtMeaJ1Ba8/oNXKACIGwFT0StSQX/9k0bp/KGWQ=
X-Google-Smtp-Source: 
 AGHT+IHnIkK+HB2IdwYErth4W4SCHl2kIZXcIUCxD+QuK/EAVa9ImrPRHZ+ao6U85UaV4uncB6qJdg==
X-Received: by 2002:a2e:311:0:b0:2ee:df8f:652d with SMTP id
 38308e7fff4ca-2f12f084567mr5772381fa.2.1722077383159;
        Sat, 27 Jul 2024 03:49:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d075489sm6626471fa.115.2024.07.27.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:42 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ASoC: codecs: wcd939x: Move max port number defines
 to enum
Message-ID: <h4f5c5ecsum3qdphmqvufmumqkrshrivn2qgkdgr243jgsoibn@zcngoula4vsy>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-7-80a03f440c72@linaro.org>
Message-ID-Hash: EAQEXYOH4VONERGDISZPM752HTRV67QB
X-Message-ID-Hash: EAQEXYOH4VONERGDISZPM752HTRV67QB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAQEXYOH4VONERGDISZPM752HTRV67QB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:49PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd939x.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
