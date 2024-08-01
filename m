Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E994470B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A9937B8;
	Thu,  1 Aug 2024 10:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A9937B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502278;
	bh=rK9+4xszQg7uMRd6Ykpz7uwRVsL3C1LMnad37+zazpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NCfM3r0+UISHYQntSVj+m/DY9Wm6DtpcFpRFbVFaaHmMcpEX9kK/3cz+o8u7XjrFy
	 AeYtokszTIMhSxc3ziA+I/Qsll7PSsB3picz3K53uQ3qfXzA3kb9/0KSoBFzpG8K1u
	 H1TipYS7NImLvk6SEDcBmQfFVppNdQi5MHvxnxdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77CBCF806B3; Thu,  1 Aug 2024 10:49:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF895F806B3;
	Thu,  1 Aug 2024 10:49:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C29F8026A; Thu,  1 Aug 2024 10:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B89FF800E3
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 10:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B89FF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=d9zpY1yZ
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ee920b0781so72590691fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500598; x=1723105398;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50e7wz/bvIR8jdrexV5sLmzxSxGtSe1Rc+ihQs4UK3I=;
        b=d9zpY1yZEMaz8dT79w3EmQjYWWx2q8hLsPvE+3f4w7EupZFkAnFIT5SkQWyg8ZzfL4
         nW5oOQjj8BG3drdUDqki6jbnvYRf1wGR8r5j5b7nK5vr1kUmHD0ffrEXQ91k+4SpMKeM
         Jo+PblJPw4BawSn1VDWlOoJVu5oO9VqXn+fK9cxxTifsH8z8uvSxVyBYVbdexLT2M98E
         lf6HFpWL/qJTnJYc1HIN2D2Y0w5t6LZMYCew7fJy1exhKgq76Xqk0z7VoTtoyYwQ9Yci
         oFTOvFX3vHemRpNp2uXNyfLTCIyjRE/Ca+KtNbBjH/EGQunTqQS4aNDDXGhyQWy87Weu
         bi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500598; x=1723105398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50e7wz/bvIR8jdrexV5sLmzxSxGtSe1Rc+ihQs4UK3I=;
        b=rZY7Ld0z7elvS7+ooO1C0GTbn/zDeYKztaV/XF9cnErURqqNd8QGKhwTAwHgV3HJfu
         rCGeBom5j8d7H5GRVKhHraUpzKUKFn2s649sClTypopKNbxMA1UpxNL0IwkUiS6XoSvC
         FUcjfLB29BbZxHifp2J938Ag6W8qOZWl0jg0/ElHrdemJoFsIasuDXLXeYj5nWgjEy7e
         DUeyD5hIZUvbAZwMipvTvFqH/yuARk/4ngggZiEmV4rg8qjMM7NvwMI/jk1nsavpwxB9
         Cd4OieKn/RZVM8EbHRR3iGgjpR4C/mbqMKsFHyUai3erPEMgc1GGQrzwPgJ3vsjaaCGV
         4B2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzdPpnqYEueS1WqQBKkm0z5yWH471Ss6omss0f9mDp71FKuM1vfbSv3wu8dSNeIiAAz+TgBRCZUFemdJjH1VXQuH4iGrWbqKWZg8Y=
X-Gm-Message-State: AOJu0YxVBS4wIGBEwiXPYq29EiCdUnTMTlggTQfiW5fbLtmYB9jvk4bl
	8KP3Mpg/Mz5LbpQoWImJhnuAxxWtLtQ3LwPN+IqaH/Of8BnDTWb+R8ozbdOpt7E=
X-Google-Smtp-Source: 
 AGHT+IG1pMfm6YPrJpMIq1jkLKGGURJ71PgP2FoNYW5t3JnWPlJG7+H3KkAZHgFPOV8oJmjfUNP5lA==
X-Received: by 2002:a05:6512:304f:b0:52c:e047:5c38 with SMTP id
 2adb3069b0e04-530b61afebbmr1125327e87.15.1722500598275;
        Thu, 01 Aug 2024 01:23:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19a40sm2498745e87.199.2024.08.01.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:23:17 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:23:16 +0300
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
Subject: Re: [PATCH v3 7/8] ASoC: qcom: apq8016_sbc: Add support for msm8976
 SoC
Message-ID: <o5k2oxabdewh6faf5xkmboyc34pqqieytbvoyngkowngkaonkz@ctqv6izs247z>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-7-163f23c3a28d@gmail.com>
Message-ID-Hash: SVUI2JMRY43PIVX5DPWBYJHN43A3H5HK
X-Message-ID-Hash: SVUI2JMRY43PIVX5DPWBYJHN43A3H5HK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVUI2JMRY43PIVX5DPWBYJHN43A3H5HK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:31PM GMT, Adam Skladowski wrote:
> Introduce support for audio card on MSM8976 platform.
> While MSM8976 falls into v1 category with MSM8916, digitial codec clock
> is not available in GCC so we have to set it in machine driver.
> For that reason for V1 clocks new boolean is added to check
> if we need to enable codec clock.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
