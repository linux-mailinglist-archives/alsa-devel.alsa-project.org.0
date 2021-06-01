Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5039786F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438C916D8;
	Tue,  1 Jun 2021 18:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438C916D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622566189;
	bh=ltlkz0p6pwGlQFlnOP7/Kiv2i8BVY2LYNBpn52fFEH8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gpxJVh2njJfyOkWPRPtijpztuPtSc2unDTML88osPp3U3wmQ45sE+v3f15qQyvWnv
	 2S9/kjKjenoAIO9KGmxkhRatrzCqAxXKnvTIxOmpj9uI/klF850jzztcrIDA0gZzVm
	 HGhnRZpcg+JM3bE25TfyWAkO0HiEhfcN2DKY7lNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D7B1F8025B;
	Tue,  1 Jun 2021 18:48:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC406F80254; Tue,  1 Jun 2021 18:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC8B0F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC8B0F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QJEPUhBN"
Received: by mail-ot1-x32f.google.com with SMTP id
 x41-20020a05683040a9b02903b37841177eso5208310ott.9
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZJrNStiRC3o/Jtcih0sDE1Ju7mSUxWw1odN8y2E3Q40=;
 b=QJEPUhBNGPtTSsGaEhDTpuleVPtslvjLb5WXb4NVTRTl7zgNtcCGycm790VduwHBxX
 p8oPK30Bl24/GJl6AHBVXZqFZjijatf/ObSXEyPiitOcn7LJWh1psE0pvNDgdvBNGJUt
 cH7tKKKo0REZVtW0CCfJ4c10ba3wA97YO5yJecHRXf1ehKFVlmFRLhk49i7/DaqFprtj
 Cdr+9W+ZuDZ/YD8shXCna4tYf7A2/dtwG9JBE4zmniTR8iYUK0uOuyhf21mionKBjkWt
 kQzAPXNxtIx3TWi3n2FGbtLMsNNDGNEzfYbbLwEQa/mS5T6njag8NvWjSwDE+9vdpq3g
 4j8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZJrNStiRC3o/Jtcih0sDE1Ju7mSUxWw1odN8y2E3Q40=;
 b=Pz0VjjP7HcLoYYIoOnBM8lI0xCkO923nbKQnPHEMn6ofPp8pr4eaTXKdzOyCzjik3E
 cZQ1yDvMSQYDcc4kYLCteK3qhRJJ6CLYSK2Zp/U4VCtljQGCwCiZr31KAz9RS42LhUNw
 0qoWLPTqmyAVsdH89HhCIhrmFuovMrIaCE3+d4nwRuVJhmmr6UHv0VDHS0iXYsZqh3+s
 LJ0fv9nxrTcb+6lLNM9tYIRFhltCmqkoJQuIMs728nD9AS9qQfQ2+g9kPENyTQOO6QSK
 tJuvIY2iBJ3whKwVclrZfFt3N9Jwc7Fp/zjCg0HyjUWjWu9l2yyXYom4c/hD3ZzOGfxh
 FgGQ==
X-Gm-Message-State: AOAM531oS3BHW02P3iTePq7N4hcXzf5RfJWwn+1yFi0tDrWbtVAplgMJ
 DQG9CdMIVo3mLFCrv/6sfkE=
X-Google-Smtp-Source: ABdhPJyQKrTDt9O97QsIXptl5eP/nuQUWjQWrP2J81xosFCU/bVV6p5Sed91mztsQtzaBhgihCdFQA==
X-Received: by 2002:a05:6830:2141:: with SMTP id
 r1mr22039795otd.13.1622566088279; 
 Tue, 01 Jun 2021 09:48:08 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id z25sm1732590oto.72.2021.06.01.09.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:48:07 -0700 (PDT)
Date: Tue, 1 Jun 2021 11:48:03 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between MFD and ASoC due for the
 v5.14 merge window
Message-ID: <20210601164803.GA40@wintermute.localdomain>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
 <20210601140145.GH543307@dell> <20210601155832.GC2165650@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601155832.GC2165650@dell>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 maccraft123mc@gmail.com
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

On Tue, Jun 01, 2021 at 04:58:32PM +0100, Lee Jones wrote:
> On Tue, 01 Jun 2021, Lee Jones wrote:
> 
> > I've applied the non-Arm patches.
> > 
> > The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> > 
> >   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tb-mfd-asoc-v5.14
> > 
> > for you to fetch changes up to 437faaa6cebadf8ff4c2c28d7cb26ed4e34aeb14:
> > 
> >   dt-bindings: Add Rockchip rk817 audio CODEC support (2021-06-01 13:40:41 +0100)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between MFD and ASoC due for the v5.14 merge window
> > 
> > ----------------------------------------------------------------
> > Chris Morgan (3):
> >       mfd: Add Rockchip rk817 audio CODEC support
> >       ASoC: Add Rockchip rk817 audio CODEC support
> >       dt-bindings: Add Rockchip rk817 audio CODEC support
> > 
> >  Documentation/devicetree/bindings/mfd/rk808.txt | 188 +++++++++
> >  drivers/mfd/rk808.c                             |  81 ++++
> >  include/linux/mfd/rk808.h                       |  81 ++++
> >  sound/soc/codecs/Kconfig                        |   6 +
> >  sound/soc/codecs/Makefile                       |   2 +
> >  sound/soc/codecs/rk817_codec.c                  | 539 ++++++++++++++++++++++++
> >  6 files changed, 897 insertions(+)
> >  create mode 100644 sound/soc/codecs/rk817_codec.c
> 
> Looks like the builders reported a W=1 warning introduced by the set.
> 
> Would you like me to fix it and submit a patch?

If it's a simple fix sure. I'm pulling the branch now and will confirm
the warning otherwise.

Thank you.

> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
