Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49E5075A9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 18:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0FB418C4;
	Tue, 19 Apr 2022 18:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0FB418C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650387431;
	bh=jTSMa6iGh+C6YFwRQ8IdRdPaNQgj+HJgpq8SK51bixg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCl3Dcc0lfKqEA4g89otNjkmkcf1zQMzIYOsMeTWwgejaTmzloRNJHrhAWlTS1rEt
	 RGOgfW1qOyXx/pfRJ4bPBiJFpYwELK/T5l9J9ZvsTu0j+uL3v6PdV/83PA6AV8PHu9
	 KyKH9VI8Sb/xrN28P908mTXVw8bCFKieFUac4NXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C72CF800C1;
	Tue, 19 Apr 2022 18:56:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43D42F8025D; Tue, 19 Apr 2022 18:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0320AF800C1
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0320AF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q1S+yCPs"
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e5c42b6e31so8184695fac.12
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 09:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cU3PsQ96m2bacgHlDzTdRKjnECW2W3GiF9D36CqZr/s=;
 b=Q1S+yCPs7SupLovMDFM3IQDosMFLbgc8WIsAM+J8qB90YWYU8VHVuB6N/G1ECvL8g4
 L0uxwo9lBC7+JxEuwKqpSEMAOGShHgjf/p+nLbhjP6Lje8tJzyu05YRZm0m1dtkqQKDn
 /HU2+grMoR6gH1AgaIZ4Yb7lgK7RhHMNM5TQMQN4LbcKlH2DEHGm4QEq/sZkeSBIKw29
 TMkUY3a+eyIl5KkCkTMk2E0Zmt8inqxI43pO/VnkQMCAhJRUfEMPceHZmuenV62nEUYg
 n8sgrwGe5DQrG8zaTMbEOyDmOSOE8iXobUOGiCoOYlj3W1TlhgCM2AUVLogdcEDHBKBP
 e+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cU3PsQ96m2bacgHlDzTdRKjnECW2W3GiF9D36CqZr/s=;
 b=awYmlqBCczYvJE9sRsvDuBgJTthu5ng1HEgzEqk2c4avJ2/KgCokfDfdyziazXmT8+
 FS2BW8kYoYy1JBi7IEf82aaOFCvHURdWUGSBpZ79UqjlimZqHyYEebpRwB3PfoF90zdG
 nb1hU68FGwYZHUkrbPeQ4/DjbBfvH6aLlqP46KgvXXzIUW/EPDsq0RiieHoVmmc9Lvzn
 yCpnV8KWzqQy+8ETBF6BRsZhS3qXhRSr1sycXgcJnqQuY12pU0dlKwG/8d6O5B9V2hkl
 mRvbNRR4LwTCo4z+xj/YvWI8PMV6exURY8PSdR6QzTPcP+VMlcFuVxGEh9hsPzOYWg6T
 2fhA==
X-Gm-Message-State: AOAM530eyKgSr5A5e65jcfypjFLvbt3nZ6idtcv9IgD/V+ryBDxmFNM9
 ccVlYu/y2r0IB+6pN6/XBMiSWw==
X-Google-Smtp-Source: ABdhPJxL2k0eDg181dJAp/Ef9UPRdb4j02W0Eb0mz77zIlm9opQ+gz1vRosQYbLVU7nl3PKWo1i46w==
X-Received: by 2002:a05:6870:208:b0:e6:134b:1b04 with SMTP id
 j8-20020a056870020800b000e6134b1b04mr2615508oad.85.1650387359485; 
 Tue, 19 Apr 2022 09:55:59 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a9d799a000000b00604d35aa374sm4482447otm.35.2022.04.19.09.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:55:58 -0700 (PDT)
Date: Tue, 19 Apr 2022 09:58:04 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yl7qHEIBrZhLzgfH@ripper>
References: <20220419113734.3138095-1-bryan.odonoghue@linaro.org>
 <20220419113734.3138095-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419113734.3138095-2-bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, krzk+dt@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue 19 Apr 04:37 PDT 2022, Bryan O'Donoghue wrote:

> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.
> 
> Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  sound/soc/qcom/lpass-apq8016.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 3efa133d1c64..10edc5e9c8ef 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -292,7 +292,7 @@ static struct lpass_variant apq8016_data = {
>  };
>  
>  static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
> -	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },

Removing this will break existing MSM8916 DTBs, so please retain this
entry with a comment that it's the deprecated compatible.

Regards,
Bjorn

> +	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
> -- 
> 2.35.1
> 
