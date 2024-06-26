Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB79177B7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 06:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D6F93A;
	Wed, 26 Jun 2024 06:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D6F93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719377866;
	bh=YWCP4XS9NCMeFl42NORBvKgAR97zTeSKqwDJJ42RPHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TjGbXkp9WHrIwKhSXOkVkHSg7gzR8HqViWbaRlMRrCkuCQVKSSX3UhCeLym/xGcXl
	 qItTpIqJOHdPJPXVvpAztkw7M3W/erfEnCsokuhgR3Gaq3OmvuIe2FiKZuKxkuAPXv
	 1r9pIUptereyjQ7WxBCUnB/BLUggMBPNxf4dMpqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C5BF805AD; Wed, 26 Jun 2024 06:57:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB501F805AF;
	Wed, 26 Jun 2024 06:57:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D32BF80423; Wed, 26 Jun 2024 06:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44F74F8013D
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 06:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44F74F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PWfBOzV4
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so1901986e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 21:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377528; x=1719982328;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lc/ad8AuMtJ2+wNqYmI1VVXdrc0waVEdjHmQ67idPjs=;
        b=PWfBOzV4hkGP+z04cW+8YJGvsF51mV+qR02GhNBum9ssgqEswnU/ak7R5xAVBoikiA
         nXpNK2ALMQM/oS1r5Jzb72xM6X1kYf7BtGmFvryjasDcL/XdesgEyWfnwTdw8D5BVhLm
         mZ0134nhnXDS+Q6i7xARmzWdDwwyAyWqxp2HLh4qjWVjpr8EeoGogNku8bMNn2svsNTr
         8g1jQExhve2VxxWmYIWXLyRw9/+A19fQWn+mh/ACwMjekwyzrBM0K6ebgT4m2o67wBpK
         KkZhxv2gPvqcrRFaGCGeSAnVzFstSQ+NjnLTUCjOwGZ5pp8kY8DuKeXK1WFYa4275iwr
         Sw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377528; x=1719982328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc/ad8AuMtJ2+wNqYmI1VVXdrc0waVEdjHmQ67idPjs=;
        b=FmvLlQurU8AiWZX1W6JeWV87D8Lg1+XiLwH+0Uo6PUGjd8DDU3CTycMgTYX0bto9nR
         5F5QhFB9AB87MnvGff+Efee0zn2q+HUJe8TWXix9/O6zGk5+Rb41SOdqdfePlZFt+NXr
         28gGeTdx4nesqOTBikkLqQ+mj2ainJ8I7K+e0Eo0rNP3sLUuR6t5JGxr+J7MpfP/RGbR
         XsKfsJhXj8at6o9A5vIDVeIfppXyiyYn8yw8KnWh06+c+8xm1t58siIUbwC5Vq/HRy/2
         7wGtPYIG+EEWKH6Lran6uKWGz8jX9Wz7MPQv3RYHWA77p8xRViJZ89Vw9OSZhsgvn5Md
         /L1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Cy59Rtojw2RkrUhzJRPP6aG8+d2yAuoVNtxB8SWuF6YJ3NAkWSbBpBjthkbr69ikVAjOrI5LeTXYbtNHxNGfy66oj9Vb5hIp/NE=
X-Gm-Message-State: AOJu0Yw8d2prg1J/HHlnJOqFaLj1a4IzNqM6eRtFEkVwVdrs4WhJcbbH
	MKe6XMjhkrkKHjmVDlmt1Bu+fED1/jvZgG5dv1l+bwHWmvZCw5VTXHQ362hk8io=
X-Google-Smtp-Source: 
 AGHT+IFZ09iILP6kHgbKBpqNhbwz7AeISIrZ1LRcAxMhjyJ00DcvGAljOBBjtcKB7z+S0JfJ25G87Q==
X-Received: by 2002:ac2:544f:0:b0:52c:d626:77aa with SMTP id
 2adb3069b0e04-52ce18644a1mr5111412e87.58.1719377527612;
        Tue, 25 Jun 2024 21:52:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd810d633sm1394422e87.165.2024.06.25.21.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:52:07 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown
 version
Message-ID: <6b4rnvhqnqf2w6kbafceaclri2gq7x7lttusllqswy4nkxzqg7@bqtmns4m3ghs>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: JGNHZWP4NNZWCZDL34RE4UXFMWMAZELI
X-Message-ID-Hash: JGNHZWP4NNZWCZDL34RE4UXFMWMAZELI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGNHZWP4NNZWCZDL34RE4UXFMWMAZELI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 25, 2024 at 06:57:35PM GMT, Krzysztof Kozlowski wrote:
> Qualcomm LPASS macro codec driver parses registers in order to
> detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
> we know that there are earlier versions and 'enum lpass_codec_version'
> has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
> version, driver will use random value from the stack as the codec
> version.
> 
> Fix it by mapping such cases to an enum of value 0:
> LPASS_CODEC_VERSION_UNKNOWN.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.h | 3 ++-
>  sound/soc/codecs/lpass-va-macro.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
