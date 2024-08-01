Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A08944701
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5481B3723;
	Thu,  1 Aug 2024 10:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5481B3723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502210;
	bh=Z/R/jE3UetsT6jIzeeUL2oO4nHocrgIt0QNSJ9yXa1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O7A2dldI/a1krSXbNon0n5eoNw+F6GCHFOaaLoicgcPbpnlnof3mphldiQc7Jzafy
	 RlHcjIx3YeyRG9LhtTWdMDUAn0y218Zxl2Z447eS/nx7wnADPiriGDodg1lkTrndnM
	 vVNlmEE1hd6V9xuEFCxK4zGn/78VKAIXyhd+n1nk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC4EF8062D; Thu,  1 Aug 2024 10:49:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B90F8063C;
	Thu,  1 Aug 2024 10:49:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA5F9F8026A; Thu,  1 Aug 2024 10:21:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1449BF800E3
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 10:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1449BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LjNqK8yo
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso84228621fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500463; x=1723105263;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WwtmoHKhwxmQ7ba/RVWyEJFACGd+bpfz3WwZuXqhvo4=;
        b=LjNqK8yoVesiE+HNEorM6/FlFIoKOmb7JYGuBuSHryFHmwHomw6VbzqfrtfdoRlCT/
         S0mNWynajbVdFvlRntvHGHRn7HHTskBSDj0x/byaNO4iQ4G2w7LnPLtROHah7/4/lLN+
         VnWJ+fHiGlbNrCHSXz0U3tDzhyqLF5y53hymS7lbwI98UM35F6uxaMZdfdXlFhUHnm/v
         Eo/rWXVZiaDhD/KAJ6zcFqYbuozulWO9plFOtY+2WczdCvV+fAM7oFE/e+as8eCRUeqo
         5mVPvqflPdwkJRVENuu326ZDpzl1mLqhanJLKTS4Q7fq5xhwTZFa4AvBv47nonopTtLz
         NM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500463; x=1723105263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwtmoHKhwxmQ7ba/RVWyEJFACGd+bpfz3WwZuXqhvo4=;
        b=djefghKhWKzccsSgGq6m7tXQLseu+znvb8MOKW3pzOsb2CcVf/wk79URbOcYczhtmK
         q3dUIn2kD36B++az/HjZDDdcHmlDnqMFPj/J8UXwhmgP6jp3tZJWsHcz4irUuHyE8cvu
         NeYwQbcHfJNXEa+EGQ9JqB/WHXQJwZSUPam3kCo/MTafisEBVYyTObiUhqmQcjavD4no
         7se8Ur7Ee1e0pLFfP7S3CkkJ5U4KvUmSH0A8XLRQBw642hYgdn4p9zzFVPPJFfHcEmSP
         MEAteNipVUxkSpv2MJSyu8Iq9y2ii1+ZGYuxrZQXdaW6GjHbm29L4/CNYG9AnOMyJLir
         nSTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt4FBbhwbsxyINsvM8SQZor4E3Ktj/P1FbKqhGNs3C18d4yHvv+GIJrX2ubi64gDprhXNa+yqnIudOANOZ8Juvc9s3ebVy3ryB9MQ=
X-Gm-Message-State: AOJu0YwN+dgwmtEV3qFV+P3GhvxISO0CVuRx+HGYiB1NTSZjNHPpmPwC
	kxndcH5LVBswsotug3CnyGut5amzeT7rKEsFP/JWcH2+pWFrX+SY0hDW9KIj/+U=
X-Google-Smtp-Source: 
 AGHT+IH2rrp/DcZo+alL+PQQLhSzxuBc4O3JwWhJX/xYrbDZk4ReJ8Td8cb1JnBDOgBdEencF/BngA==
X-Received: by 2002:a2e:9b1a:0:b0:2ee:8d19:85af with SMTP id
 38308e7fff4ca-2f1532d3daemr12584361fa.36.1722500461234;
        Thu, 01 Aug 2024 01:21:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d074b19sm22171011fa.110.2024.08.01.01.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:21:00 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:20:59 +0300
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
 devicetree@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Message-ID: <fm6wqsznxxxlofht2nouqtaryl7delloatc2v3b737unt7hqd4@l46iayvs64ru>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
Message-ID-Hash: IUEVZDJROE34CQAHUF7JIXOXIOUPEH2A
X-Message-ID-Hash: IUEVZDJROE34CQAHUF7JIXOXIOUPEH2A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUEVZDJROE34CQAHUF7JIXOXIOUPEH2A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:25PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add support for configuring Quinary Mi2S interface
> it will be used on MSM8953 and MSM8976 platform.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Split from MSM8953 support patch,add msg]
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
