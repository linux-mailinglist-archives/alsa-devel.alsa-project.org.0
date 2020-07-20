Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEDC22622E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 16:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68DA91614;
	Mon, 20 Jul 2020 16:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68DA91614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595255533;
	bh=uLZdOx+ugO3fAAgHDNsz+6h/1/RsOEwJYSUL0Q8KoUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aUstsJW946fvM2e2LxunWIQiWCZUm/NNuGT0ISUnl4wjMCC4arSd4/eaL2HJi8s84
	 hnAUPnIFCmJMfUKUcCy364gnAYS42HixiL+HVt0lcn7Ore4/wpetG6+XHZTLN6wnym
	 ABwUAYnOpoIUviXkpDf1kZpV9XpSRY0U7SOS1dsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86063F80125;
	Mon, 20 Jul 2020 16:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF22F800F5; Mon, 20 Jul 2020 16:30:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BEFDF800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 16:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BEFDF800BF
Received: by mail-ej1-f65.google.com with SMTP id w6so18264208ejq.6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 07:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vg62TiVK1fLPM3VJFvJufp+q6lBcbIw2n/ZWrxz9ifw=;
 b=CQkFc8onvOR+ac+H72U0qiAEck1GC1ne8zBh+iPrxT2bwF9qxLNtcXKsQ9O+vxikAX
 UxU4ylGqM5xTUaZ7MLssvTpuep56MuyDm8nHQIJ0YehhgAB5hG2cu+0D2hhLb8uanzqw
 /e+OFttzFrMjSOHxeF+63lPPElU4KcDDimqO0EPNIMbo9kYRZyWbwXP3kHHjdGVbWEmK
 shIdxg2fpxbEOkn7dShRh9vVOS4PjygIrg1c9F59hXiTRCypEX0xPYFX5bj6qKMoAtzb
 bBlgeUuN9YLERv4fh/DctGw71Wp0UqjIorQP+L3vkAMK3LZJ9XJM8M/r3KmXoMsAMAhK
 x/BA==
X-Gm-Message-State: AOAM533zMJOjyKzyyJPo6tRCaK8O15Fr6iX/CGSMe6cYLASV7/9I6fd+
 HqJG7MzX8haebkqwxqL54m8=
X-Google-Smtp-Source: ABdhPJxGqJjPlBcTJ4tDcgq0yl0vCLwNrgvT0pmiXL2brT9v+CjPAHofyWuzcsnq711IlFM8YzA+rg==
X-Received: by 2002:a17:906:4145:: with SMTP id
 l5mr21191590ejk.334.1595255417451; 
 Mon, 20 Jul 2020 07:30:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
 by smtp.googlemail.com with ESMTPSA id kt1sm14639230ejb.78.2020.07.20.07.30.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 07:30:16 -0700 (PDT)
Date: Mon, 20 Jul 2020 16:30:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] ASoC: samsung: Add sound support for Midas boards
Message-ID: <20200720143014.GA22554@kozik-lap>
References: <20200710173500.22365-1-s.nawrocki@samsung.com>
 <CGME20200710173517eucas1p20c325719e385995f9f094f12d87e1dcb@eucas1p2.samsung.com>
 <20200710173500.22365-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710173500.22365-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On Fri, Jul 10, 2020 at 07:34:59PM +0200, Sylwester Nawrocki wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> This patch adds support for voice and BT calls, along with standard
> audio output via the speaker, earpiece, headphone jack, HDMI, and
> any accessories compatible with Midas boards. This patch also supports
> headphone/headset detection and headsets with inline buttons.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> [m.szyprowski: adaptation to v5.1+ kernels (DAI links initialization)]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> [s.nawrocki: removal of the clk API calls for CODEC MCLK, the jack data
>  structure moved to struct midas_priv, coding style and typo fixes,
>  conversion to new cpu/codec/dai-node binding]
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/Kconfig        |   8 +
>  sound/soc/samsung/Makefile       |   2 +
>  sound/soc/samsung/midas_wm1811.c | 543 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 553 insertions(+)
>  create mode 100644 sound/soc/samsung/midas_wm1811.c

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

