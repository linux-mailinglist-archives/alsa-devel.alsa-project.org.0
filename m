Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FF87293F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 22:17:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDED7207;
	Tue,  5 Mar 2024 22:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDED7207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709673455;
	bh=k3lbq9SSH8UrBjWLea184EF/re2YnLcUGUKOBhCs/kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OYGhiwQpXXMxGdP8QtZMBg85K8quZqu9JEs5q4hqLhI1tGSrpztctann4dz2/9sGW
	 PyEvk96MeYElim99Oak0lrxi2wlsv3Ztw3IMHB7AKoDKeN3PnaCzFUQwlBcsQE2orP
	 RntCL1Q+oKp4QTPXCozaR9OPGTh/ahhw9Oa3ch/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4E00F80587; Tue,  5 Mar 2024 22:17:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74D66F80587;
	Tue,  5 Mar 2024 22:17:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F3D3F8024E; Tue,  5 Mar 2024 22:17:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DD32F80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 22:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD32F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fx5dk1x8
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-512f3e75391so1232882e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Mar 2024 13:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709673415; x=1710278215;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVdcNBcoAiJYRV+66geixgS685+t5mEWuPqbixAd63s=;
        b=fx5dk1x8C2w3WZSUrvCbSp/jB9dSls+vl5qSzVUP9MVbc6zblhGkvpZ3DlZKt8FK8e
         Qd3g5XG+EPCq1DLBhOLsV4fEuIvu/SoaiejP4OucU2UPMFa1UxxoKK/74ms08wDF0dQO
         pdJPP9P4vvh3nHXbFumv7vsxhCGpRQWZKO+WTPflYNabEyqkN9w82WC/3DDluEsThd4i
         eHfNqh+p7llI6w/PGN4r27sedh4jBJDoSwrFSrvYmuGsxdh97ebhYYmmyelrqSGAKlM9
         8I5WIFqT3AoA3zlQDGI68+yhYF+qfGNch45RsMpfb78dSCsoDVDRmuJovGY9CfeID0Fj
         /p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673415; x=1710278215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVdcNBcoAiJYRV+66geixgS685+t5mEWuPqbixAd63s=;
        b=GX2lqRZSCp4Bq8AS9ZczjoPKYyQ/N5Tf2PtYJOaDd0CNkCgjNp0irdh+4v+xUNVWWA
         jha763O97mwZ9ZIzl/z/iOgYPXSbVS5VWQ44aMNvR91vaCaZ6UXsHMTCE088A//yY5o4
         YcFozS8sYn4hCqfxmK6Oo9zMtyP3j6mWeeZW0AxAe0IfBWzA8JxeKhaR/A5ipZXiR4Ys
         lplnTA4sWiVXiTZf+rxoNpaFS5pnB7OGWZLIDWz7RaCIRWK1+vYlOpSbyTCvaM8OT9K4
         3jvuQ8iDfRmLvQvPCR7BnkenlL/Ee8xSPiQArLGsV3rvIySu5ZhhaTdrC7sVr9mWmWpB
         QbyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5jBU49RziuJUwDIg4F+J4kwzSdjsIE40NebsaZSn5Z08ko1iZyhclfht9ot7qlV8hZcNgMlxlA4EpWkSPj4mTP1Rv/UxMvw9bzK8=
X-Gm-Message-State: AOJu0YwpTlsEKmNCZZKf7X/yygge2QlQzXIDxSY/Xs0WbAMojzJsGvI1
	7/WE04JH+1HaPq4kd7u1VqwjF2ky7yRakNexzbWswDT9a34t/is+Y/S69QhM/5M=
X-Google-Smtp-Source: 
 AGHT+IH3Hd0YBY5DKLui7FOvR0mfzUmy4ygWjHSTygOgSbAzcr4xkbf3ukYBlk9XCz0pNxVe8jB4HQ==
X-Received: by 2002:a05:6512:3055:b0:513:2ead:4f86 with SMTP id
 b21-20020a056512305500b005132ead4f86mr2610715lfb.12.1709673415066;
        Tue, 05 Mar 2024 13:16:55 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 i10-20020a198c4a000000b0051330fe710dsm1994042lfj.169.2024.03.05.13.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:16:54 -0800 (PST)
Message-ID: <d784e46d-974d-4bf3-a2d3-491e7ad19701@linaro.org>
Date: Tue, 5 Mar 2024 22:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240304135000.21432-1-quic_vdadhani@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304135000.21432-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZJEW2WC3NRIJL4JW65TYSXISM6TTLN3C
X-Message-ID-Hash: ZJEW2WC3NRIJL4JW65TYSXISM6TTLN3C
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJEW2WC3NRIJL4JW65TYSXISM6TTLN3C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/4/24 14:50, Viken Dadhaniya wrote:
> Currently we have auto suspend delay of 1s which is
> very high and it takes long time to driver for runtime
> suspend after use case is done.
> 
> Hence to optimize runtime PM ops, reduce auto suspend
> delay to 100ms.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

What determines 1s to be high and 100ms to be low enough? Could
you share some more reasoning?

>   drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index efeba8275a66..5de45a0e3da5 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -81,7 +81,7 @@
>   #define SLIM_USR_MC_DISCONNECT_PORT	0x2E
>   #define SLIM_USR_MC_REPEAT_CHANGE_VALUE	0x0
>   
> -#define QCOM_SLIM_NGD_AUTOSUSPEND	MSEC_PER_SEC
> +#define QCOM_SLIM_NGD_AUTOSUSPEND	(MSEC_PER_SEC / 10)

This could be a good opportunity to inline this value..

Konrad
