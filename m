Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B659693DEF1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 13:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434F8B65;
	Sat, 27 Jul 2024 12:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434F8B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722078003;
	bh=u29x3z9nNj7e32wU/R5WeTPNlM66fftlY+D73KLs8v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sz1x8GY0gv6LxyST40Qjz9oB9T6Qz7GPuqX/xLel0B6Uq86xiNiVxqBJ6qIpJJ9Mc
	 UQzvYsyoPJylg7bIy9kpGarUb2Je08z0P8Hy2l5AdouupEKc3p3IJCBpw8gDxgiljy
	 WrAF0gMcL9hQYJj0K0sPczOnO5WejyTduAeC+lmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2FDEF805D9; Sat, 27 Jul 2024 12:59:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D62EF805FF;
	Sat, 27 Jul 2024 12:59:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C1DAF80580; Sat, 27 Jul 2024 12:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D95F4F80482
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D95F4F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LW+ow2El
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ef2cb7d562so26227031fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077359; x=1722682159;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=geCRQMjPSwcsby6sgvnZan39KM22MCRt7HcUFv8NB60=;
        b=LW+ow2Elg+3G976GkkGQrVX0zIO8jYpuN17K6bwKj5GQiRZee7EbUPC+vknezXfJy6
         E2G2BsLizsVK7RNkcFVT0LDcM/1YrGej/yYTS9wT3JRQwFOOdf8RSPmshYa0Ruy3q2i7
         79HXEiPXh4Lv6KeKUoAHMPmvm7gUR7qQVAjDCvc3svya1xsPZoYKSVvOt0rEYemO9RqC
         5nVPDcBQrC5Xm7q0hGzaw6rBLAHbsFuFuWB3KXOHMnEWjg6zOQ8SNh819GCtGKHjp6hp
         8HsAUBsyymRk2pXxpVgHE72MPL320+v3tJjKXTUQ3hIXGOKls4Vt2JvaS8cUrdQTIEFR
         mgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077359; x=1722682159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=geCRQMjPSwcsby6sgvnZan39KM22MCRt7HcUFv8NB60=;
        b=tOp9jnSiuQiaB5YdcUP+LJAwf0ppzU7cxjBuehtHkddemLI0alhp5ez7Bz6/aj4UVd
         SU2fxvBlqF3AApnPNbH0/PnE2AKU1fWcFLkWx/JwW75oPaUr416GSAWj8QN2F+JBLzDA
         +JOATUYH6v0dvnqWRpITGoKPuwdSzkffzBo8USlnoXKzfw+Y4619wHyN0CPmQKZSBGWs
         YqvscD1dpMhL+iCvswXEVEZ0nWNbChVprKutQSNIQGJh2KaSdJhnCPCrf7to8fNqVuNF
         d4PKth53o37mrbt0jYdTPHTyGe/jNEAl1aizMD80UafEKQBsZWazzmspPOrIuxJRU1S1
         F5GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlkexex0jwEcTBcBkebB6hQzK3ZTFDDv5KOWv/8UKWRtDNJZn6zifAUnDSWvBGN90yMFZII3wOPzBHDI1/LDZwDZ/rdy8ZRHxP5yk=
X-Gm-Message-State: AOJu0Yz+YKr+/MAiDHfdnEgII9crYJOOVPR3Lw4bIGMZVIaN+OGxUxog
	XRlHn+lQe91CZco0eEk6cXc+/R6OsNMX/IkQNjPUH9L9eRN7YGnFrFL4dgPGNO8=
X-Google-Smtp-Source: 
 AGHT+IGAakSUy6drg7IAUAowlVvqX75jk6w0OUsoc5NIprF+xI64fMmRUUrOeW29bqgdNpmn/JjE+A==
X-Received: by 2002:a2e:2d02:0:b0:2ef:20ae:d111 with SMTP id
 38308e7fff4ca-2f12ebcaee1mr16162881fa.6.1722077359180;
        Sat, 27 Jul 2024 03:49:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf0f9ccsm6943211fa.14.2024.07.27.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:49:18 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:49:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] ASoC: codecs: wcd937x: Move max port number defines
 to enum
Message-ID: <lwgi3xhry2zz2filzdrivluexoyft6ohx5b6xfqsp3u3vx3qvg@hg6aq6tpmsmo>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>
Message-ID-Hash: CVHTNKHLZX6WII6VKHLDEU66YBCKKYYO
X-Message-ID-Hash: CVHTNKHLZX6WII6VKHLDEU66YBCKKYYO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVHTNKHLZX6WII6VKHLDEU66YBCKKYYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:47PM GMT, Krzysztof Kozlowski wrote:
> Instead of having separate define to indicate number of TX and RX
> Soundwire ports, move it to the enums defining actual port
> indices/values.  This makes it more obvious why such value was chosen as
> number of TX/RX ports.
> Note: the enums start from 1, thus number of ports equals to the last
> vaue in the enum.
> 
> WCD937X_MAX_SWR_PORTS is used in one of structures in the header, so
> entire enum must be moved to the top of the header file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
