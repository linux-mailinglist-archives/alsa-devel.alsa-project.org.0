Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD785612DF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 09:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA0D16C5;
	Thu, 30 Jun 2022 09:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA0D16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656572530;
	bh=17t2k56UOeWu8jxEEfxRfJwMlujHHt90r1sht+N1ygM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6ehg0ek/RXB0l67LPB4JJ9EoPz+uAxcj2x1Jg2qixjiyjCel72IF1bBwfPP7m+yZ
	 FRurRI1Mh2/+maKM7f56nYWLyS27cjp8BJVSGytvdcvVaxKKiVtZSGbuuTxJmHI2Qc
	 82x/XbY2Z2uTFgpjUC0khDOZ12gfmUce/utzKFsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD92F804E5;
	Thu, 30 Jun 2022 09:01:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFED2F804E5; Thu, 30 Jun 2022 09:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D6F5F8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 09:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D6F5F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ESyenbJN"
Received: by mail-ed1-x52d.google.com with SMTP id ej4so25272103edb.7
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 00:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4havqDPfkE39qEzmUo4R6ZOB4ks9d4XISp0Vg25orCk=;
 b=ESyenbJNerQxyg45Hhrne3TpmXrAgFhQ+9b6lJGxP6o/wpuQ6cAvD5LgxnbfNtvQvT
 XMw2BX8fNwTHhDkmtHSucgkcg1V50uiAoHBupaWnB84utVOV5Seb7bCnPTP6V9IDPXfb
 GZAohrcAH97stGZ2Mgd4Ptu5wYLXjA6vAfGyo/r+4wRCkMkOXngAkt39sfrxlBhF8lTk
 KC4VEHmE5A8p6pJv8FYCmBhwGQFuduZ4+j5uFKJ0nfZz7K/+XnmEwJ7bxzH0m46/aXeQ
 hSH0LQCQk3b0gH2BygZLPs+dRHBLSClYWmTm+1B+bjRwSjGQv5hSufAmqRWB04R9bYM3
 Cs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4havqDPfkE39qEzmUo4R6ZOB4ks9d4XISp0Vg25orCk=;
 b=q9BDHj7RTb3t7+x8dNROJBaiNWr2n09nKoO9SG1JyUVRMZcYhd0rGV2tZsS1Ju4S3Z
 lZQTgGA2fZiFQ+g0YCZbC80nOGyTinKpHm1pqdMEksAHge070JsMXsr95Kdd0qhHJExU
 1EyWqz+hdwxcp6ut21XEu6ErW/8TUE6NDbJ4PRqvi3bsXr6jrVf+nSw/sSnWuZ8Wy+78
 MPtxdqFMJEVpT7YfOWJBkond28HfP8Nw2+zKDvSUSy6ClD7AVx+UP/y6wxGFvqHu5sc5
 5Du+/GbHMZCW0K4HzcRtVP7k/Dq3Xl+X31ch9in2miPOPo3Hj2mIkLyZ1p35bhz7n87P
 5bbg==
X-Gm-Message-State: AJIora/HKLbIgJaLqjsWNzQh9y3JR3BSiMXFOhdEhxmf3CCl9I7lZIVu
 OgOywZM8Hqq1v4QapELFK5Gd2g==
X-Google-Smtp-Source: AGRyM1uc1/mOfzibDoU7I3yoNDX5A5kAfZ70naoDZLeJmJZLOARoJjnXezRj5l0jWnMD1zMhzoVc3g==
X-Received: by 2002:a50:ef12:0:b0:435:81f3:a93a with SMTP id
 m18-20020a50ef12000000b0043581f3a93amr9224461eds.80.1656572469783; 
 Thu, 30 Jun 2022 00:01:09 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 bq15-20020a056402214f00b00435a742e350sm12695189edb.75.2022.06.30.00.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 00:01:07 -0700 (PDT)
Message-ID: <a8f8fbbd-60ac-3e45-6fc3-a128ba533683@linaro.org>
Date: Thu, 30 Jun 2022 09:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: samsung: change gpiod_speaker_power and
 rx1950_audio from global to static variables
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, s.nawrocki@samsung.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, arnd@arndb.de
References: <20220629185345.910406-1-trix@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629185345.910406-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 29/06/2022 20:53, Tom Rix wrote:
> sparse reports
> sound/soc/samsung/rx1950_uda1380.c:131:18: warning: symbol 'gpiod_speaker_power' was not declared. Should it be static?
> sound/soc/samsung/rx1950_uda1380.c:231:24: warning: symbol 'rx1950_audio' was not declared. Should it be static?
> 
> Both gpiod_speaker_power and rx1950_audio are only used in rx1950_uda1380.c,
> so their storage class specifiers should be static.
> 
> Fixes: 83d74e354200 ("ASoC: samsung: rx1950: turn into platform driver")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
