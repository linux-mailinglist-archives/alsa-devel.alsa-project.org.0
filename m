Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EAC173614
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 12:33:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 584A616DA;
	Fri, 28 Feb 2020 12:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 584A616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582889595;
	bh=YaQIckvk3yQad9OwpqmULudpDfXtLw2K1pm27Zaklmo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRIFonhcQeABw93gPDlrkZnawQjQTzglxxXyrervcmOuyTJH74qhbjQhuUUAfvnlv
	 jXVK/LbvwgYMC4iUXDS4WzoUn0o6DK3KGg65lPGn1EwofFwTSE+CWGgJULLyv4Z23l
	 n9Qkcv8F4pCgCvNDUpkvMMMEUAd7nPjhkcWl7EwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E56F8016F;
	Fri, 28 Feb 2020 12:31:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80361F8014E; Fri, 28 Feb 2020 12:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FCC3F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 12:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FCC3F80113
Received: by mail-ed1-f65.google.com with SMTP id g19so2919436eds.11
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 03:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s06gTDtg/+91iVR7SFC4D41arfeCaTJ8f9QzMxQOUv8=;
 b=Xjz/1U/tM/qHtGvbaMMn+FOv4LHAd3lKlZGS339JJDCnLB6WLEUvmL69nwN48YOImG
 7+XY0buFFZcYz8hwzDP26Ghk2t91hiISpNqeP3evofy4jyTKx2rPddmdD+ZT88aQO64f
 TQIEr9f8//HHR1vCV/c/7IAmfsINuayxg5FdpDsGom4a8CutHtZnhLKhT315qeHxwyqJ
 jconS7fewXET1A8y58T74dkixjTsQ1rueP4YO+O1lbtA1HbTcAxDDd65h1f+7cIUVmou
 VI9lb6S2bW2aLNvy4HvDd3tBvdEBomjYYaPt7/0GCHh9X8uNz9nUVQLrDNpiccKtsBRS
 eiEg==
X-Gm-Message-State: APjAAAWlnO0XhE3SvPiTbLsGE0mYCeP1DQY5KmZwzmRVZxJkg/BjuKg5
 Jj+3Y7/7FeXfCptNuMrjNAY=
X-Google-Smtp-Source: APXvYqzGBaIZxd3oIYOuotg30sQRx11BQSlHMicAEvdwujYgc/hpgMgWcI+FsNXjm2462AQIfMD8Cg==
X-Received: by 2002:aa7:d712:: with SMTP id t18mr3853034edq.0.1582889487948;
 Fri, 28 Feb 2020 03:31:27 -0800 (PST)
Received: from pi3 ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id t11sm518007edj.78.2020.02.28.03.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 03:31:26 -0800 (PST)
Date: Fri, 28 Feb 2020 12:31:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Message-ID: <20200228113124.GB9458@pi3>
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228101120.28819-1-m.szyprowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
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

On Fri, Feb 28, 2020 at 11:11:20AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> resources and registering card in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale.c        | 4 +++-
>  sound/soc/samsung/littlemill.c     | 2 +-
>  sound/soc/samsung/lowland.c        | 2 +-
>  sound/soc/samsung/odroid.c         | 4 +++-
>  sound/soc/samsung/smdk_wm8994.c    | 2 +-
>  sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
>  sound/soc/samsung/snow.c           | 4 +++-
>  sound/soc/samsung/speyside.c       | 2 +-
>  sound/soc/samsung/tm2_wm5110.c     | 3 ++-
>  sound/soc/samsung/tobermory.c      | 2 +-
>  10 files changed, 17 insertions(+), 10 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

