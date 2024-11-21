Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16B9D4E5E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2024 15:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687B01903;
	Thu, 21 Nov 2024 15:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687B01903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732198394;
	bh=Uw2FiaqGMl761SWfGXIHbx7lQuyHidBlVpgGWwm+k4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WxwMn3JU0kXls1K1hFCEqUVAnuXAR7np3gQONSY+Bfz0kKwShAvCOTe8ISwWoVSdg
	 mv9Mj6nZ5XsTV3HUj73P8E189qy6rZPWiU3TQCXbYjfeNEqbFGogoZKjknG9Rld3RL
	 aGxoNRJ2HELBJbBCPYV0NBud/jySqeVqFr+dcg7Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 891C3F805B0; Thu, 21 Nov 2024 15:12:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0141F805BE;
	Thu, 21 Nov 2024 15:12:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3653F80533; Thu, 21 Nov 2024 15:12:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF69FF800F0
	for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2024 15:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF69FF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HkSfXBXz
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so8323815e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Nov 2024 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732198295; x=1732803095;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5HJcVtwAACwC4uPS1IF8o+pGP7DKNM9J+dC2VSwrYbs=;
        b=HkSfXBXzVI32xhFvjgMG97aiYlm83oRKj0q0pfiIdR1HPGHtBhJiRTItgah466THNA
         ZNj1cyTUIXBWFkk2Ll0NV6sCAxm7mDhNPL6k1oYMdonlubZRQfjrvJKX5Qwd4V80hXgV
         AcRfCC1Sbhu4lyy6vTM7LDZIr800VPRjvEKt1s3w/cs9acLa9bN2nmjxFAdjTTKK61gL
         fTQn0/tQflyiQy2Qvf/vVlbeQbrWIwf53zbykrTooeXOJo+3HRv31hsg87pgZKsjEKVw
         0mqrCXpAtcfOkA0817QulCk1TUounkH5m52RPN18wHRuGY6agRTS5Mc6amgHzJhjJYEo
         KhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198295; x=1732803095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HJcVtwAACwC4uPS1IF8o+pGP7DKNM9J+dC2VSwrYbs=;
        b=l/m2NG33tsVB1FWUPxOH/NvcgnqNoOsehSHbVFvcwuRNAjcLQcHtJKKClAJuR/2+Ya
         PHKRJcWdNPQ0Wk7nZ5xW6cKMqEXJ42lFq6c1SFdukyot4Y1t9BG6+rrQ4OT8k/Vc+enH
         oQHNU+EOccIHzB+nYx6pW0n7YEFGcR/AiN2KedJVe2GN8vrgp1/j35zv+R9CVCaRIxMb
         cmuq9G2iGHGJwdBV4vn9OLyseXwabydE/+DBAuRulwhXSkmWes9m18QNEvveka3GCCig
         hBoJFdkwYIRgVWKjL+TM6rXTojTECxXsv8JYDLJHhl5qq64lFS/z0Ie7gNk29FBLD7ld
         fDow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd1LO2Mb7Fb8VymncWsEK/sNsIbPMHxDsDbq6PKWPGAEJI7IGcuh8+BJyGyNlZvGgQX/zvfBTwqC3J@alsa-project.org
X-Gm-Message-State: AOJu0YwUXRMji3mfbUwowpAoZ623lyn8Riw8Olz16Qkt+7Symgxo9T3E
	skxV6ee7e+GAwdzX1rHlC0Yu2uaC1jYAcuDqiysxJx32lnfsL1QeReb2tDqy9xE=
X-Gm-Gg: ASbGncuOB0AQ/NoWlbCFcFmQrJxVj8gDl9fOUN1uqeC4cHclRC++4U5J3o5qoeFHlDR
	lIq++DC3kalnPy0ckWn2qpMsJsIBLy9DzcLtzEhw0D1nmC+NkCOn7Q1LNtF3+ourAUsj1B5QTXf
	4J5PA55id3A5OX60YWHyw5o4HwkDFYiDM0XcB1mzfuBibTlOpP28N9ea9USTwBViribU009Ei6l
	PS1saiIYC/ybHsXBKVrkRNDMSs/klFCtG3ZYySCAoaCir81Lqt7eXKJCXFM
X-Google-Smtp-Source: 
 AGHT+IHJhwxxcRKJjxAsvH1hKFueQoCCj9Rk1klftfp0bdOZUzXmrqOdJxbga8Qwf4rziSS/MLDeQA==
X-Received: by 2002:a05:6000:210f:b0:382:3527:a14f with SMTP id
 ffacd0b85a97d-38254adedeemr3844751f8f.8.1732198293549;
        Thu, 21 Nov 2024 06:11:33 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:585:4e9c:5bc8:98f6])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825490c89asm5158683f8f.34.2024.11.21.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 06:11:33 -0800 (PST)
Date: Thu, 21 Nov 2024 15:11:29 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Fix second argument of
 apq8016_dai_init()
Message-ID: <Zz8_kZkKyetqnRr2@linaro.org>
References: <20241117232100.23760-1-spasswolf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117232100.23760-1-spasswolf@web.de>
Message-ID-Hash: 6MEQLC5BWTDZRDZHF66F7VKZIRAJOMRC
X-Message-ID-Hash: 6MEQLC5BWTDZRDZHF66F7VKZIRAJOMRC
X-MailFrom: stephan.gerhold@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MEQLC5BWTDZRDZHF66F7VKZIRAJOMRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Mon, Nov 18, 2024 at 12:20:58AM +0100, Bert Karwatzki wrote:
> Since commit a78a42fb48b8 the second argument of apq8016_dai_init() has
> to be an lpass id returned by qdsp6_dai_get_lpass_id().
> 
> Fixes: a78a42fb48b8 ("ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6")
> 
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 3023cf180a75..ddfcd4616895 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -150,7 +150,7 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> 
> -	return apq8016_dai_init(rtd, cpu_dai->id);
> +	return apq8016_dai_init(rtd, qdsp6_dai_get_lpass_id(cpu_dai));
>  }
> 

Hm no, the code is correct the way it is. There are two cases handled by
this driver:

 - ADSP bypass (lpass-* drivers, qcom,apq8016-sbc-sndcard): This one
   uses the LPASS IDs as DAI IDs, so cpu_dai->id already contains the
   correct value.

 - ADSP (qdsp6 drivers, qcom,msm8916-qdsp6-sndcard): This one uses the
   QDSP6 IDs (e.g. PRIMARY_MI2S_RX/TX instead of MI2S_PRIMARY), so
   qdsp6_dai_get_lpass_id() is used to translate that to the LPASS IDs.

The code you are changing here handles the first case (ADSP bypass),
the DAI IDs do not need any translation there.

Thanks,
Stephan
