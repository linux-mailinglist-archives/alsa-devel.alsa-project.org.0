Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1B83EDE0F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 21:47:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BE283B;
	Mon, 16 Aug 2021 21:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BE283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629143270;
	bh=03fq3tZ0kCkWt1NnsXmMTvE64rw1F3jImvM9Ro5+mMA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YMxvkfBKN7MvdXSewjBe0nFpGvL7Eaos1/XuyfyOVm65VWn4w4F6s4/GjnQu+ZuXg
	 c0cV8pKnxRvXjj3jgSh8AbRWLpbvJu/NkdLytkGhHtFu06ySDTEy48OR75TaKsJgwh
	 645P8MV88gOI0xnMVPkNjtrzAj4tnoJ0az93suXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4563BF80259;
	Mon, 16 Aug 2021 21:46:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE198F80249; Mon, 16 Aug 2021 21:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49D21F80154
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 21:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D21F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qzl2TNvG"
Received: by mail-pj1-x1032.google.com with SMTP id w14so28172914pjh.5
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q5y3Diy0bSS1qtfw8LXMZxlhAkCPsRISdhkpjPubqdw=;
 b=Qzl2TNvGY4kPSuJe2Kx778muWJ3IC/XdfyAQtvUDaGu+uehK9xfVadHtHQwRyJtum2
 zlnbEFbnVJ8q6LMdFTxLh3gIzLDITPoWRgb6SqwNj0hsbDZCFoWt62ZPJKqneIwDEiaZ
 hhevSHMteX+wgEtoQTK9c42dknM/uL5zAnKwaRIb3yBnMNe69xVft3mEQSnKS/sThekB
 OPQPh2RYkZFuHir4l8kps2QOdTc3oq6cn8Yk+L/nDQr3cjdpzLjk+GoUPBThnoRXfEE1
 n8kVdkhcAuF/0ikoseAmEPpE8iOn0X6SwuvblE7WT2uYAQAzJ8R9X/M0kBfNph385y02
 EmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q5y3Diy0bSS1qtfw8LXMZxlhAkCPsRISdhkpjPubqdw=;
 b=q8y9xXNj6j2th165K1nYdBY/BrsQzF+l2hVyZ5+CSiipW0V5vdacalZ8bgju+ajz49
 PVf+LYk1xmfmatQeElcCLfrOUq9pZol4ornXkT2nexPT9lZdbv9DURVCgJzHyPYFGvw4
 XF0ZNFOePQiNU2li/wnSiiuv4zP/ELK7u9IcKZqCLECawBK3DzJ4I/MYIqsOf0kxGutQ
 5+b0rWeGUsOM1X5zbq0jD1XsfpkoH+mMazbK56MlO/skABw1aV0hgH+ZwSl/2mZV9igx
 ykQAd10q6v+zC47pAqrUymbPDAwtA5mNtC/w+5l5iUoIB3iANl+qBzqf7ucQgy2tmMOq
 qUwA==
X-Gm-Message-State: AOAM531a6C5wjI0fL2uaSzno4PSdlRGCXW3qn7gkIV4h+C43N3Cdgvlo
 NVI+mnaPrKcwK49VCrN+LNc=
X-Google-Smtp-Source: ABdhPJzTDgwZNRMVildoG+vBvtMZqvHi8155Vl8sXOW5IrmWcqyis3Cwo0UUNdbMARZrZ+bp/394pQ==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr435187pgj.412.1629143185449; 
 Mon, 16 Aug 2021 12:46:25 -0700 (PDT)
Received: from localhost ([49.207.137.16])
 by smtp.gmail.com with ESMTPSA id r9sm181910pfh.135.2021.08.16.12.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:46:24 -0700 (PDT)
Date: Tue, 17 Aug 2021 01:16:21 +0530
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816194621.mrudqykxvkbt3a2w@xps.yggdrasil>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
 <20210816183906.GC4253@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816183906.GC4253@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <bjorn@helgaas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org
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

On 21/08/16 07:39PM, Mark Brown wrote:
> On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:
> 
> > -	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
> > +	match = of_device_get_match_data(&pdev->dev);
> >  	if (!match)
> 
> Thierry, are you sure about your review here?  As others have been
> pointing out of_device_get_match_data() returns match->data while
> of_match_device() returns the device.

Sorry for the confusion, and the glaring mistake.
Will fix and send v2.

Thanks,
Aakash Hemadri.
