Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445AE93DEEF
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 12:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721A4E64;
	Sat, 27 Jul 2024 12:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721A4E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722077962;
	bh=fa7kLGj++0G0Eg231uyiEToWORgo2WWIgnIiDtLOJqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S+J4hVHJ0fkC4FhCEe6JMw5RoC9aXWyS6TaCVJx9C6eKlREejoRO74WJ5qNlPBQV4
	 kHEzb2PElmXKnI06l/Tc7OK8zApicT4cfP53s/ExB++4VKi+0V4yDIM/jopgMTi05y
	 +d24VnpZBOGi6jC/eoMayRGgJFxJ6zrtxGVlGwmo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80DCEF805E6; Sat, 27 Jul 2024 12:59:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE82F805AF;
	Sat, 27 Jul 2024 12:58:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE389F80589; Sat, 27 Jul 2024 12:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7052BF8013D
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7052BF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CEathMHk
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52f04c29588so3525709e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077188; x=1722681988;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ/xr1RKgXgl0tJIEKuoNjq+bUa/0Y66j4NiEBoptb8=;
        b=CEathMHkW2j/3rKvLm2OGcosOCyZ3wukZpxywVzj30Wl61W4MDfzyyOh/x2Bzvd7Dd
         35rRxPLWRzihiPinTn1KP2wBWsV6rncmk+8A7WiUiM+gDeqzX1ta49Nz0VMn02Vc/3Vr
         U1v57pOKYx/oa1kRO7h5PPL/h33e/pu33JTd9AfDp2j8NhbvFX0ASVvyWMUBHJue0WS0
         nnHA5IdPjoRX7ts08yqlVdIh8ny2IUFwkNbm2sAKoX/L/POw4xvWnrb/4KDCfdBHHaeU
         XuaMq/JRDKx4iju+T6CYCImpSeGFU2ON4ZVNw3g0Ttedv7AcQM3qyKHGh496eSREpLYB
         IK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077188; x=1722681988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ/xr1RKgXgl0tJIEKuoNjq+bUa/0Y66j4NiEBoptb8=;
        b=lfWGEfcqZc9eubqcI/CgIp3sgdRJqdB3m2gCXLSq11M38vmne8yof7GMWlC0Q3g3tc
         75JyslPP2luA/ERoj1WRZkBMBBSFIjHMJ1jcAphDBi3z3qPaEnqFUJWrVmLqDRboe0EU
         gwpxzCWwf9i6FbUJoZN7rht61vMz8uhivsJBG152y1OxNgMun1dHPdj8r5QdEFIQTn25
         +tQakmZo0NeXu1ITsTdj/xLpOrLY84+co3u5TUhaLS+VB7wNHkW/O4nHDuzEdhbZxy7c
         lbwkEa/P6BJP/vvGkhym2pJ9l/4hTg4grr+7+BToosH1XgLPHZ30vyc3iQyP91f9F88+
         BZIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtrlcmPl6dk4QmIhiOOFXSUbmQMQKEU2AVhEoIJPmQsn9QnZv5tmKottXwK9oMl1NQ+zk8WZnD8sj2RTx+bVQBj0yYp7eUcFK9Qd0=
X-Gm-Message-State: AOJu0YzZ3J3Bgbobpz5aMUjeunKuvL7e/WH5O34WwxUD5zcSu+GZP1Lb
	eVBurjyn2OynAang7cs88sT3/ma6rC2PT5ybvMw1iWmHmBGxyS85ejx5KQo/6Nc=
X-Google-Smtp-Source: 
 AGHT+IGGP1B2SaB4xulY6ueyuAVpyf5RWWcSGeN89eSnIuMZurceJMYLWHdDgl7Jret0zGlTBndyrg==
X-Received: by 2002:a05:6512:128b:b0:52d:582e:4117 with SMTP id
 2adb3069b0e04-5309b2ce92dmr1450181e87.54.1722077188458;
        Sat, 27 Jul 2024 03:46:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c09109sm729450e87.178.2024.07.27.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:28 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ASoC: codecs: wsa881x: Use designator array
 initializers for Soundwire ports
Message-ID: <bsnfiskyvzf2zrsarek47irjmt3feqyqxi5b6s7zbanagkh7dl@yhqpncgaxgtv>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>
Message-ID-Hash: OBUYD7TJ3G7YHRSEUTIROE2FNLR4K7QO
X-Message-ID-Hash: OBUYD7TJ3G7YHRSEUTIROE2FNLR4K7QO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBUYD7TJ3G7YHRSEUTIROE2FNLR4K7QO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:43PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa_port_ids, e.g.
> WSA881X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa881x.c | 42 ++++++++++++++++++++++--------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
