Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DB397A22
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 20:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D5B16DC;
	Tue,  1 Jun 2021 20:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D5B16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622572547;
	bh=yvA+YLM+hJ9L1XXKyQgnwz0UVJa9BCAF1+w9Awcfppk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GadaXW2F9bnHCHkztI64zN3kkRt0Dayjc5aBRF0TL7YB/CmzrODPxWetypLzdwMuD
	 rUjoWjn7rDyM/B9g3DfDfAmBDfyfpz7u1Eksju+TgmJ/vHu4mUihherYqQdJd83tGi
	 cMXA4O8L+1GfcrndMoS7U1v1Q4YQvEQbhQvexL5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA6CF800B2;
	Tue,  1 Jun 2021 20:34:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35DAF80254; Tue,  1 Jun 2021 20:34:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC0F2F80141
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 20:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC0F2F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q+/PPq9L"
Received: by mail-ot1-x330.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so226192otl.3
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RzTOE/XOCVSzmLG98WEkmn6LNXza+BETZY5BVIMEZe0=;
 b=Q+/PPq9LSmL6xAIqiLbVwzxMGmJatzyUPqQWgztcCyifzWeWBetsFgfvnN98wO8Yg+
 MBu2uN+BJISOWSAaDsrPL0UpoVhf61o2Zjg3Ub2txRN+Z23rzGZyzxvHZNNwRI6GgPF8
 xPVsX14QMUC1iZi1vI3z+6mcMB9GW59esPReJGczcwYTkdhkmJirjjeb5M//oOC8A140
 I8ay9ZuLd9izlUotMqGaMxz3jPYqpQDA+VkagD9rXXuQPvGZOcmkt2b9oz9R4UoHwlq3
 EKFabv7GDKJvCGxvc51QM9nFDTYFLtUcas1pS8gLhT+mt2nU+1FRMpR+IRVNES0rVUCB
 +26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RzTOE/XOCVSzmLG98WEkmn6LNXza+BETZY5BVIMEZe0=;
 b=N/BytN15jNFLJ2UbA0H4rflptPlz918HVYnwDARZSKhXcmGGs7lv9ePz5ftR1+fxMs
 6A6AANN7aXRKB90eZqSp5cwOne9x+WDUAJkCQV+JKFqtH7R9jGlC8CoNUyxpI7dwruaJ
 x/9AFJidI4rB6612UL9bR4Y2NqFwPhuSrDepyVqlTJc8X9Z04RGMtFSJEEO5uwUxYwHB
 PO0kmOXkworOeM+wgzM6djrVvErvP46jyCpaYRpi+gUd+uyhTrZ8Cz83gq9Ql9VzPpJX
 7ilYSV5IgPXpK0eR9ggpkgAqmMxrQ5dX5gWu1esP5AG+/ek6KWNKTMYmKvF/2AC85H8S
 bsPg==
X-Gm-Message-State: AOAM530ZbaOa19TQB3iLlfsUpWzVaQHruPmK3yFwC80Wflszqfhr4r7m
 hO5VEIxezGw1qRdzqlsBt6I=
X-Google-Smtp-Source: ABdhPJxjBHoMhAl05mvgUMRUJ3hwUTLp13vifa+CyU+JOZkkyhO0RTyrual33v6kA5md3LS4ftGd/w==
X-Received: by 2002:a05:6830:1e21:: with SMTP id
 t1mr22465735otr.100.1622572436498; 
 Tue, 01 Jun 2021 11:33:56 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id r19sm1095965otn.37.2021.06.01.11.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 11:33:55 -0700 (PDT)
Date: Tue, 1 Jun 2021 13:33:51 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between MFD and ASoC due for the
 v5.14 merge window
Message-ID: <20210601183351.GA31227@wintermute.localdomain>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
 <20210601140145.GH543307@dell> <20210601155832.GC2165650@dell>
 <20210601171708.GA3529@wintermute.localdomain>
 <20210601173944.GA2173308@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601173944.GA2173308@dell>
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

On Tue, Jun 01, 2021 at 06:39:44PM +0100, Lee Jones wrote:
> On Tue, 01 Jun 2021, Chris Morgan wrote:
> 
> > On Tue, Jun 01, 2021 at 04:58:32PM +0100, Lee Jones wrote:
> > > On Tue, 01 Jun 2021, Lee Jones wrote:
> > > 
> > > > I've applied the non-Arm patches.
> > > > 
> > > > The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> > > > 
> > > >   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tb-mfd-asoc-v5.14
> > > > 
> > > > for you to fetch changes up to 437faaa6cebadf8ff4c2c28d7cb26ed4e34aeb14:
> > > > 
> > > >   dt-bindings: Add Rockchip rk817 audio CODEC support (2021-06-01 13:40:41 +0100)
> > > > 
> > > > ----------------------------------------------------------------
> > > > Immutable branch between MFD and ASoC due for the v5.14 merge window
> > > > 
> > > > ----------------------------------------------------------------
> > > > Chris Morgan (3):
> > > >       mfd: Add Rockchip rk817 audio CODEC support
> > > >       ASoC: Add Rockchip rk817 audio CODEC support
> > > >       dt-bindings: Add Rockchip rk817 audio CODEC support
> > > > 
> > > >  Documentation/devicetree/bindings/mfd/rk808.txt | 188 +++++++++
> > > >  drivers/mfd/rk808.c                             |  81 ++++
> > > >  include/linux/mfd/rk808.h                       |  81 ++++
> > > >  sound/soc/codecs/Kconfig                        |   6 +
> > > >  sound/soc/codecs/Makefile                       |   2 +
> > > >  sound/soc/codecs/rk817_codec.c                  | 539 ++++++++++++++++++++++++
> > > >  6 files changed, 897 insertions(+)
> > > >  create mode 100644 sound/soc/codecs/rk817_codec.c
> > > 
> > > Looks like the builders reported a W=1 warning introduced by the set.
> > > 
> > > Would you like me to fix it and submit a patch?
> > 
> > I can't seem to reproduce the warning, are there more details as to
> > what is causing it?
> 
> Yes, it's a W=1 warning.  Put that on your command line.

Got it. Want me to resubmit the patch? Looks like I was requesting a
return value from a function and not doing anything with it.

Thank you


> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
