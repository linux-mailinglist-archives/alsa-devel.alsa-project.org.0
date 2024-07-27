Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3479A93DF03
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 13:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C51BC0;
	Sat, 27 Jul 2024 13:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C51BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722078283;
	bh=CxQCaVkPKiM+dSjOjWGM0B5dxgOP8eZ7QW6Iaue7xE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L2tl+rwDgMY/cqBA3TembOJXgNeyFlpFWwdBp1gkfK2h7r6ffZCxcgr7Qv86b/r15
	 TjoVzTwr4VrcHJbQj4qDq24ZjEZWbSvYzsjqAB/1qhDMVnDSATUL0FWk72S+Ax1CTQ
	 EBTz7acpXgbbhckNba+vZ4IAKw7nNOPepSH+5Y24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E545BF805C4; Sat, 27 Jul 2024 13:04:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F10F805D9;
	Sat, 27 Jul 2024 13:04:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE1EBF80482; Sat, 27 Jul 2024 12:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0123F8026D
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0123F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jBPjoP72
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52f042c15e3so1826858e87.0
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077262; x=1722682062;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PgZxzidyEshqEQG3bGebzLz9u8Tr8K9k35MYbayHhxk=;
        b=jBPjoP72nlbt5+jn2CNPKntpQPYh5yWVpLhlasS0gERSOYPQJtYnrFntZ/Cz1Lf30I
         3e/1SnOJdYIL5Ox1SgEDCDqj5a+KxobliPOcGOqfWuYTz2x/0gpzT1+jv0A5Ph5Jh1/P
         UGR82yqWCwrIeCLjMP7h40GbpiadKBeKuD86Pr/D/cwg1JLE+zSQBYCiTNgWZDUOM2Z9
         ENXXOvg1V7totQjQ6ShlcTxixzRIccpaKBsR00TdD/IL/CKmd0RPjO6+Fd/WYdtZ21HD
         ACoMYitzZWKauyGJ62AELXGsmqvFB99Bxej3JkoxBAGsUAKNzUHrCa/zWnglBA+/jUu1
         fDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077262; x=1722682062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgZxzidyEshqEQG3bGebzLz9u8Tr8K9k35MYbayHhxk=;
        b=aF1hIQEw31u9YuK3EVjoj24S5yZv5EhWzl4T8sYZ5DnDKciMBJFbXrmuEyHBAcHlj0
         Rl5DjMIxOuoGl9VWUfGLqt7AdulnVW1chkDHxW1ugej+aEAvvmZiZ3zRLcWJmtLUrmZP
         I8aVSYu9ozkRBwYOe/GZF7/Rbw8F1ch/lIVCqWSPNWeQNveITXedivv1EqpSK+oAx9FZ
         RE9zf3/vYiE1momW7Y+NFHEJT1FGYM7Q7V4P3CPAgkHTqSH4A0VqhdIgmGb7Icjvyzq1
         ddoJ34QKghl+WmNYfMycZImQcMfN5NY4s6QIoWqpj6QXrQSMI1015J63B58dzPOJ57+n
         rM+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpubbR3HWdjz2LAp5cj5chGufftMO8ZWBbenhu9QtYuJVEpaJ16FhF35ULl6JtATwf08EDxaHG+STdfEySWCyjDX1Op2MjgFf2Gz4=
X-Gm-Message-State: AOJu0YxSFhGSEXwaoWx4Jf9zXlgcqEWmf1W8Zi6ASY9CNfPy8vWxfLLJ
	vyMIgr6C+Sv21R3CNXt6yVi24LZA/9yU1GdhPJyDzjC/uFjBi66LjON5b2FxKdk=
X-Google-Smtp-Source: 
 AGHT+IFinSpQ7BYm+GtIK2AR4f2kI+7iSE/VNTey3Ki9zIDB4o0fctoD8bK6ZZn9hTNYPBvsFYkIVA==
X-Received: by 2002:ac2:5e23:0:b0:52c:caf3:98ed with SMTP id
 2adb3069b0e04-5309b718d49mr435661e87.24.1722077261761;
        Sat, 27 Jul 2024 03:47:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19ee3sm729586e87.220.2024.07.27.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:47:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
Message-ID: <vcufh3cp5ulm3phbgucsofqapfrv77bqgf2e26qolftviia4wj@aztjalnuxqby>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-4-80a03f440c72@linaro.org>
Message-ID-Hash: FJCN2E4WY2UAZVHRXB5ZNTNU2YCPZ7MK
X-Message-ID-Hash: FJCN2E4WY2UAZVHRXB5ZNTNU2YCPZ7MK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJCN2E4WY2UAZVHRXB5ZNTNU2YCPZ7MK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:46PM GMT, Krzysztof Kozlowski wrote:
> Drop defines and enums not used in the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wcd938x.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
