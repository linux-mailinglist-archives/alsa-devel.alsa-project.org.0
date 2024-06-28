Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9B91B8BD
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 09:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC0EC2342;
	Fri, 28 Jun 2024 09:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC0EC2342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719560749;
	bh=th+V9j6yh5My6EhP3guWXo/ea8Qg8OvNze7mhEtKnDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UKUg80eO6FAWgHskvENSsjO4m0iizHf+f/4ELSNwo3526ACmu2yw6eWPLYvOSx13D
	 pvFi1ELWYAdD1Fni1CDZ79RSFPi7Aesj0MpY0jpnyU1HILeQe/OzjCR+mK+4rYU64k
	 cki7SJi/CBRGBVJZEf9BT54T3MwiH+ByCHizIH70=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6AA2F804D6; Fri, 28 Jun 2024 09:45:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42AC0F80495;
	Fri, 28 Jun 2024 09:45:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B245DF80495; Fri, 28 Jun 2024 09:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3F2BF80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 09:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F2BF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mZF+J0Ex
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec408c6d94so2692761fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719560532; x=1720165332;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMm0osVyJZdmOeSmEoxSq8LLZPLRQtI4SNJ5X2YxpwA=;
        b=mZF+J0Ex+t6YxB1QHlZwj1hekL7sl9nY7myQu1nOMQrofd9wCLSuv7A6wdCNt4ZIgj
         VmGH/6IZ+tWwEDRBpMjgHdim6eWGL+wH++JVy43+tUxnn6WSinHJbgrMGuPR70A7j2gp
         ZxuCcQz1eSVnr275K8NdZHUi6hgFxhjuUQmxipl0dR34kO9ErVaCmWd4QqB8t62X5A09
         V4QFlLud5oX0jNpga3ypLr+eve6XFNwIJijP2mhegAYqFPCM/sQGgUoGMl9HPBTa57Yp
         bBTNT+whTifnV/vfPVD/ONJsMpyN429mde0wHPZ27hzx1ikUZpzdd7anDfhV7P3LZ890
         GD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719560532; x=1720165332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMm0osVyJZdmOeSmEoxSq8LLZPLRQtI4SNJ5X2YxpwA=;
        b=d3kQW9geDtanACiVmUcZMDOrSwqUDP5hYwvIIriuTSyz4LRrOt0xFDVRvCSWhzGQJb
         OTcGKtmHKCzDW8lKTdK2cfvaVqGHqjXP+yRO51lt8MOfeyECQrdjmsBQPhe+Dse4Uu85
         +ivzhh437BdNk4ej+f3D2pJHUqHdG9E9vPSQr5dh56HM44Y8EvjoRfnW9vRsKUmLqxYK
         SAp8HYBlx/hov31GsDP4jMi/pxZWbUhY6Oxjn6ORED3vuUDHHYj7bPFTlpQrUoAd1UB5
         5l4gxaXCZJrXGxMWlFrgoCtpaXCXKWeDVopPU7xjXSHsea9/Q0U9gJeAfFnu8x/FAaM3
         8VLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOiDu/ZfnloD/x4pKVl+B8X2+M6WTT7nuyXIfhKFCGRSX1PlJO1ZhVv4SKrGi50+T6yKklF63FfdbmvEPwWEjO2/gOcL0jAPr/aBs=
X-Gm-Message-State: AOJu0YyvcubeT5vD+SnkQkgH6dR5LIN3KSV9vW49V3HAm6elrgFTPyTe
	qLgd6mXA9/2+dJ/4zXPQ1Tnvr2WtrXRiS+9cbXpyk7p2yvLqFIMJt/Zrg2dDjnI=
X-Google-Smtp-Source: 
 AGHT+IG/qIByI+70l0XfVH63ki8U2sfazMwDB35r0gTgk96nZmuAEN8+w64PQMPGRrqKl8Wn8oYsAw==
X-Received: by 2002:a05:651c:1511:b0:2ee:4c66:6828 with SMTP id
 38308e7fff4ca-2ee4c6668femr28264571fa.24.1719560532124;
        Fri, 28 Jun 2024 00:42:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e737sm2091621fa.11.2024.06.28.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:42:11 -0700 (PDT)
Date: Fri, 28 Jun 2024 10:42:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org,
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm6115: add apr, its services and
 simple sound node
Message-ID: <nh3e4nfxfm45lj3wnaoqin4vdc7yfru4ro33ezi6tyhasdh7uo@tq5bm5xmuegp>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-5-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628010715.438471-5-alexey.klimov@linaro.org>
Message-ID-Hash: QTHKB4CQSGZUJDP4DYYVG4N32I4FLSUG
X-Message-ID-Hash: QTHKB4CQSGZUJDP4DYYVG4N32I4FLSUG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTHKB4CQSGZUJDP4DYYVG4N32I4FLSUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 28, 2024 at 02:07:12AM GMT, Alexey Klimov wrote:
> Add apr (asynchronous packet router) node and its associated services
> required to enable audio on QRB4210 RB2 platform.
> Also, add an empty sound{} device node. This allows board dts
> files to fill in required board specific properties.

There is no sound {} node. LGTM otherwise.

> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 59 ++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

-- 
With best wishes
Dmitry
