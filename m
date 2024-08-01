Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B0944705
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3218D373F;
	Thu,  1 Aug 2024 10:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3218D373F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502231;
	bh=UoQSyuIzYrJk4Fh/zjMGo2XwjtgAN5edcsp1gl8VrW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vnsWuvcwLNU8DbezGvj5deyprSmSeTNznxhUWLHTsMUtktspyDrrq0YKcJk5FDDqi
	 XXwjdr/DHXensKS+nJwzunSvCRLFa37tetOBV9WkZlAtRGEfeBXiQwchqHthm475FX
	 XrpJI55eBIgJZNbTdiO+Hd+LCAzxGctvwGDdgUyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3958BF8067E; Thu,  1 Aug 2024 10:49:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B4EF80673;
	Thu,  1 Aug 2024 10:49:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A6FDF8026A; Thu,  1 Aug 2024 10:22:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C0E29F800E3
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 10:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0E29F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EkoI1/7G
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so9711882e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500512; x=1723105312;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQu81mOBzzOWipOlZKpoZPnN6w6xjj6nnqcvweSDhgA=;
        b=EkoI1/7GS8FGQ2HgmFoWEIz5xPjowZZcivjCXfsejPBn4svKE1S50LVD2vIvQ88vCd
         4WdrUCY1+YUecWGH9meBlHaw05ZpiryucOUUBb8WUCh6Y9jNGtdrbRGb4IPkHv3yaj5e
         s0R5b8a9YKfBJ4Kv8ZL2HK/9/ONkAsaPxQ0WkK+BPk3++mHebip6qflpoCMlAifyqUB3
         ewLaTLNmZiRsHHHHqRwAaJRJ/PvbOU2wPJqzLx/6aiFnEecMku4hKuMJn7Ljp/jCzBKG
         R13QzymWfX02JEUTvljq1Vx/YiSfhLMV51wU9rBl/v3myHFoxrUY43ufee9o6KmA0Jg3
         0/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500512; x=1723105312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQu81mOBzzOWipOlZKpoZPnN6w6xjj6nnqcvweSDhgA=;
        b=aCYz4FgBAe5/hy3TlmwDHBkO5/ovTYLtHXIk7xmMDonxgQUyBNs//4MprY4Is+IWaX
         jpkb7XLfj1qX/3h+Zhhtz6Ok6/ZJyTTdHVM69/weAiV1AuE9HnkEKTNNc+gh2l7SAZEk
         Jriry4iu+SwCof1ibYmR+8Q5PejniaqY/pjgEPcCASe3+0puDv2fir6xWAcs66Mx1M7G
         LWkhwX+OVDq3lAMVKnhyoPxsAL753GLyNRrOMN+YibfIDyhJQWaYgJz2TRSTN9UUotuM
         u8lSx0wQdYth4G2XGZY3XfOPQ9zb434s9eGlK56SkkZX5qAyPiM+xN/YHvdNn5B0NoGv
         MDdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQANn2uVWzmsA1oddku9PXyTwoKWYtHk4yPUKMcdDmp0Vc6tPATsp2N1VQG7L40EiLTziZ/Sw9/MJuEzgylbWUXEbWMJ4NQWOBNeE=
X-Gm-Message-State: AOJu0YycnaH981V8SQ/rs3T3PSctwifWZ5/w+lvCfphgy4O9YYaenBGh
	YG2HpvNvMMGEtMRE/+lMdH6OUrARMe56JlbumNOs/mp0O3XBhcfTmW37ItEJpaI=
X-Google-Smtp-Source: 
 AGHT+IGCjn18yTuRNfOwsOFNz0Fkpj4M64OUkHF6jkjiHZXaoXhEToRN+DzmYsOikMX79YcrO2lmHw==
X-Received: by 2002:a05:6512:110d:b0:52d:582e:410f with SMTP id
 2adb3069b0e04-530b61ed210mr1013825e87.46.1722500512059;
        Thu, 01 Aug 2024 01:21:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530ad7faa08sm649248e87.214.2024.08.01.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:21:51 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:21:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/8] ASoC: msm8916-wcd-analog: add pm8950 codec
Message-ID: <estrecxmj6im5wk5iy2eahcqf74mw6ydnvbpuselmrvb2paggc@u2dsyrn3wki2>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-3-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-3-163f23c3a28d@gmail.com>
Message-ID-Hash: KCNFC7RJBYWNIDCAGDLTKUJQCJO265BA
X-Message-ID-Hash: KCNFC7RJBYWNIDCAGDLTKUJQCJO265BA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCNFC7RJBYWNIDCAGDLTKUJQCJO265BA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:27PM GMT, Adam Skladowski wrote:
> Add regs overrides for PM8950 codec and implement matching reg overrides
> via compatible.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 52 ++++++++++++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
