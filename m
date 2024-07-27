Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B5193DEF0
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 12:59:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F756E85;
	Sat, 27 Jul 2024 12:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F756E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722077973;
	bh=eOfry3nuvu3HHLuEem2iFGqJmfkmEBKnxmiPgO/CPE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iB+AxTqEQR0QeOJfjbNVyNi33/1kXAWkrfqREyq5Vfs7j010lqp19H888mSOVueIM
	 +cb76Sx48TnEhyoIUlv3nVijGYdKy4Hq2k2L1tgs7UHzXJHbbBVnxogPelFMi2MG38
	 37ZZbRHir+vXSmbV4PS1B6EWna8jId6sTdWtbqKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E61D9F805A8; Sat, 27 Jul 2024 12:59:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E080F805BE;
	Sat, 27 Jul 2024 12:59:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73706F80588; Sat, 27 Jul 2024 12:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84E9BF800AE
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E9BF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TUyyWeH+
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52fc14d6689so2114442e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077202; x=1722682002;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVI8E/Sy9x/V5MZN8kodRJsfEHReFS0Uyz6SOoGkWt0=;
        b=TUyyWeH+LNgYYF5FCUlArWClQSh9u3BgBU7bZ7Jnx3/xFlNGSkPtd0i0OU95hTv9vK
         FoIR1y96+gZjAa14WZYfqW3yfxtDlgnds1mUjiOIHwe3hwpC+xsY17Xm8HU4F7irswEQ
         /pOpsDWLqUoaij/geTM65G6E/vVmtwJnhtZKyiUev/ydnPXmg2EYWIdBL8q9aOwtsuCT
         JY6QXThZNsL1rd8VuJT2y1sG9x4H+AkvC3JVHI7yal6J2aacVPrmq0K4w4j3ZbvWolch
         GLE4OehcQhTdcIZJs3qyiZDWF4HcsC8OzMkV4Ue2GYeIqdc704oJPOIIoDXDQ+VDgB9K
         BIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077202; x=1722682002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVI8E/Sy9x/V5MZN8kodRJsfEHReFS0Uyz6SOoGkWt0=;
        b=nQCoTqTW392z7jabW1PC9Omv9a3qANvhfFXow/s+gBL+4vRKMHNyBUhTfVDmLr6o32
         B8wiAzT/hi/ThkAVwnNzq3CH0E1FbG5+3nWnN8VX/URAVmdGn65J4j0EkeviIK0e/CTN
         iT1McDpiVuPVAiOwVT7U0fzMQlgEoJgtLSrSsaQk4ljVtYKu57Iwx2dnky98Y6yNOEVc
         Dmezy3KWndLFMiNQfMrcWShPG6teBlp56i4zEtkJUHDS+03yQ7ugmKqlElUYm6CpfZja
         O1py9E5dzm2PI2WjfCaDmsJ4qJQ6UBKdVOiedDet1WgaN4z0rFLDLZrgrUde2CIPRq9S
         rHEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Z58JlKaGyT2q0KidAxRx5GOCgeO+JmOwGt1gTEQWB80CtvmU6Oi7jp05YG7M3lSBEIyPItZQUKCFsnCpWKWdPqC0qh6Bf3aw2Sc=
X-Gm-Message-State: AOJu0YyWWNe80ymnVA/BHILLQwSV7rpgm17Ni48clYKbrDhezIz617YR
	HHPrHLp3LgZFnqxIyE5hsJ1+sXpf1LcqAKbRPXbjFII9P+a49krjqXb6XVxm1A8=
X-Google-Smtp-Source: 
 AGHT+IEJNsQBjiCy50HzlScOL2HDolaoWtEKLNxWFk06ri5hkBtcRmQ7gig1E9sGyOIgWavI8qXGNw==
X-Received: by 2002:a05:6512:2144:b0:52c:e0e1:9ae3 with SMTP id
 2adb3069b0e04-5309b2c79fbmr1374032e87.57.1722077201922;
        Sat, 27 Jul 2024 03:46:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bd11dasm727514e87.85.2024.07.27.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: wsa883x: Use designator array
 initializers for Soundwire ports
Message-ID: <dd7h6dg6uutup4av2dxvmtr6ucxhojmicsfnxoj5y7wtglnuwn@r4u3httvsn63>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-2-80a03f440c72@linaro.org>
Message-ID-Hash: ZGLOAJQKUG6MKTQIMY67RM5LINTVO43L
X-Message-ID-Hash: ZGLOAJQKUG6MKTQIMY67RM5LINTVO43L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGLOAJQKUG6MKTQIMY67RM5LINTVO43L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:44PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa_port_ids, e.g.
> WSA883X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
