Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59388965983
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 10:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB18844;
	Fri, 30 Aug 2024 10:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB18844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725005287;
	bh=djhJwdPEBClU58p/NBjRr2izhAJvns+9St76RaABT5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nFDHNfOlsCX7XpolnKHci6rlDfihNXG+8VuiUhWOTkwOi1saPfER3WnZiDih3rBCZ
	 zwgB5vMp5RaG8fZNpbZOxQ2TT9mm4+6+1ufVEtjUSHjh3zSdV0ChoHSpUSDegs4Qwf
	 mN80eQ8HjTfc+47sN4Sg+4G7kfZnc8If6hbcrsKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6433CF805B6; Fri, 30 Aug 2024 10:07:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF38F805AD;
	Fri, 30 Aug 2024 10:07:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18855F80518; Fri, 30 Aug 2024 10:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46CFBF80087
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 10:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46CFBF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bc2TEM4G
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2f3f90295a9so16850971fa.0
        for <alsa-devel@alsa-project.org>;
 Fri, 30 Aug 2024 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725005247; x=1725610047;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eF2+sx/rSYChOj/2mau28Wj23L44k4ntysCb18YnwTo=;
        b=bc2TEM4G+ceB+s2Fm8CcZhDuIJiwSOpfpp/WGfqs4SltqKn9M6ZQvQYT7kJI6XhpXH
         R3uuYvC/9VcasuaPTBEajKrGjn6gZ8bg+3MS7YWwpWeBDkMnqhNFWxMhWNCMG/2Askjw
         O8/Jml6YSp/Uf3voIvGZVrGJRxtzrY8suQ2ilEmTAXeBRolw4j7BYUUOQzPv1RKi5nIB
         jWOE/ZTQHkLZli6HktVwqD339auLqJEkJUHz1GFOP4EDFYyYqpybUvvhK4BsOcnyKfre
         OpKPrfSwdXGjdno2W7c4u1XuRUJzcslkri6YtxUkv6n6E/KCx/3/qf7zdMj/6pxcYOei
         fkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725005247; x=1725610047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF2+sx/rSYChOj/2mau28Wj23L44k4ntysCb18YnwTo=;
        b=nhIE9fxnw0tBe1YfoDlEDzs4WqqHZRKQz+rHUwO2/UmIm0JxJqhvIL8QNuCuWnu6FX
         dwypd88AhMPTDA6MqWX8NsnJXVhk50DviDjAz+ME7N/L5R9YoKA+zI8MWr9ouVVKnd4q
         PR4YlbCvsVdQEoCLE+S/KdLul4z0pXCms6F0K4QmdtGMrdRa9ypUiIZVNIerUu0jL37M
         Ic9m50K1gQlntBadx7qY5PZiRKurKlGhjunFwZsPaTBEpaQMhs9apNf91vM0VldepkyB
         hl116rGqOCP2sN/WlClY5hl/GNMu//1oBy6CcJnE5hFqDFgD6Rt5NNEKcfo3/GxXfq7E
         H9VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt6WuMT1ziUS5r5B3bO3PQp1UpJ0l3Jhs0c337h/vG4cyQrZvfRpdg2izC2qjQARbp68DIHlMEbtyN@alsa-project.org
X-Gm-Message-State: AOJu0Ywp4ch/0BLxH1oeHDcVr+owZEGCUfDmehkqNTN8sNgz3T5lR4/b
	32nIOFrA58o6/GA5XzhdenhcGAo6L3qevtbkqIACH0juOrRKw7U8hAVRTlrCt60=
X-Google-Smtp-Source: 
 AGHT+IGLGyFncOCO8wysxVTyS2DCKX0ca/6jgHo5yOoDP9+DIjbDvXHAA6oekjEyFn5hFdhhY5PoUA==
X-Received: by 2002:a2e:701:0:b0:2ef:27ab:40e6 with SMTP id
 38308e7fff4ca-2f61055b5d9mr33274671fa.49.1725005246070;
        Fri, 30 Aug 2024 01:07:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f4ac91sm5326961fa.72.2024.08.30.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:07:25 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:07:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, amit.pundir@linaro.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Message-ID: <rlb53soai6dhhfcnpwmdyqgblsbofngh2ewub6hphh2d43oofy@arcqq7edrm6c>
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: GT6X2IXQNGGU75DFBC7VQ4UNI5ZYNQOH
X-Message-ID-Hash: GT6X2IXQNGGU75DFBC7VQ4UNI5ZYNQOH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GT6X2IXQNGGU75DFBC7VQ4UNI5ZYNQOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 16, 2024 at 10:12:10AM GMT, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> Add the version info into of_data, so that driver does not need to use
> core_id registers to get version number for such situations.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
> 	- updated commit text to add more details
> 
>  sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
