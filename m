Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BD1E06B5
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 08:13:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E881A1712;
	Mon, 25 May 2020 08:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E881A1712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590387220;
	bh=WtukZhKPPhO/gp9fV6TxKoQdtmCNE0N/bpKaDGrPTtY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsIwpOaht/J9xCoF/wA9M2ifqW4fmU5+ymM0lLL3ma3iTXUaIcF02YDWdms/R623b
	 Nq7+lo2IqLBWoT0mhQqyb7ZJmfTN93qa60Cv+LI/+KfOisNJZKu+M1zuMqXYQLa1o0
	 VDMLRpvaPQmf02HNO1GKaPjlQlb8wUmCL6WndZeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17030F8014A;
	Mon, 25 May 2020 08:11:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF24EF8016F; Mon, 25 May 2020 08:11:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6331F8014A
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 08:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6331F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gmZ8Vunc"
Received: by mail-qk1-x741.google.com with SMTP id f189so16649254qkd.5
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 23:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zE6QF3wBuG+bbFky4XNH1ls+bDYS3myqBI0CKs9XLgY=;
 b=gmZ8VuncLIfL+xQ1uVR/HNEXvNFmcIL7W5Uce9o/Ajf7J1PDFBxeCDlCWbnUpHE6ew
 puJM4g0cpV7xMRSGDzwlLFFr5698CMId+R2S2OAHxbid2eP9t36+yRSdrVhVV8snbrxd
 6rsVpBMPe71+h9AvFol2x+TtVwUSlkSzXspe5p+Z/Hu45Wbl0bLDcp/UnIKo3WJC6lkj
 9ku4sr5N4poBK1P76/+PeROWEIRrwOAZCh59hVy/dGSJKfucj/zaU28pOZIwYfDI9w4P
 oxQB6iRYVc+ONa7iQkF5QlPsVXJ4N14h1uyhvh4HkDuA5La1uzSRNtP7DQZM9lno5YQs
 YYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zE6QF3wBuG+bbFky4XNH1ls+bDYS3myqBI0CKs9XLgY=;
 b=VRr8oO1NBoAilrU130+FGp0xVdx9VyJgeMHH4cZUsMKNuMzdTiRdl6ree0caZwNTaw
 0YgtzOrCRe/TxxvmbdaGcvp7L0QvN2k2Rd0RV1qWGvozereLDESWtf52haHPHkeqBuQE
 oJbLx0U0L3eC7nHGiFUpODyc04B0KS9Xs6T231JIUSH2bmxMZAho27DlqMKtNLDnDuNl
 kotR6k3mQtCz7b5opauEnzD7/OcDTZCYk/dYabXimUEzXn+GgUrbIhAJK6LUr/WfmFgS
 yfB75oD9ofQ354F+vOAPid4jYXm930VmndlEXQ5wFiT7wTvJ/AO2KhRcZOKbXSAKlCFP
 iRVw==
X-Gm-Message-State: AOAM5338AAuTTxyTwXaxC2Taybr3u9QG4Rbc6jTRP3Bu8tFe0VqRvAjp
 U1E8eSoV5MoDmT519kYQgQ6HRHzWFr76eF3VfBE=
X-Google-Smtp-Source: ABdhPJydMBgq/Pjn4/khBBaHIGx05CEfpOqguypnLj9qdpyApo26fr/GyQlog+GyRmcHhBgT4Rg6CgKdiB76ee7lE7c=
X-Received: by 2002:a37:b50:: with SMTP id 77mr22555339qkl.152.1590387105305; 
 Sun, 24 May 2020 23:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
 <20200525050950.GA1244@Asurada>
In-Reply-To: <20200525050950.GA1244@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 25 May 2020 14:11:18 +0800
Message-ID: <CAA+D8AML7P3j+14w5PywPy4QEcxw09z1izZSZbrOB_nte+XDmA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, May 25, 2020 at 1:12 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, May 22, 2020 at 05:57:24PM +0800, Shengjiu Wang wrote:
> > With dedicated power domain for asrc, power can be disabled after
> > probe and pm runtime suspend, then the value of all registers need to
> > be restored in pm runtime resume. So we can merge suspend/resume function
> > to runtime_suspend/resume function and enable regcache only in end of
> > probe.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c | 70 ++++++++++++++++------------------------
> >  1 file changed, 27 insertions(+), 43 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 432936039de4..3ebbe15ac378 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
> > @@ -1100,6 +1100,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
> >       platform_set_drvdata(pdev, asrc);
> >       pm_runtime_enable(&pdev->dev);
> >       spin_lock_init(&asrc->lock);
> > +     regcache_cache_only(asrc->regmap, true);
> >
> >       ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
> >                                             &fsl_asrc_dai, 1);
> > @@ -1117,6 +1118,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
> >       struct fsl_asrc *asrc = dev_get_drvdata(dev);
> >       struct fsl_asrc_priv *asrc_priv = asrc->private;
> >       int i, ret;
> > +     u32 asrctr;
> >
> >       ret = clk_prepare_enable(asrc->mem_clk);
> >       if (ret)
> > @@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
> >                       goto disable_asrck_clk;
> >       }
> >
> > +     /* Stop all pairs provisionally */
> > +     regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> > +     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > +                        ASRCTR_ASRCEi_ALL_MASK, 0);
> > +
> > +     /* Restore all registers */
> > +     regcache_cache_only(asrc->regmap, false);
> > +     regcache_mark_dirty(asrc->regmap);
>
>
> I see you doing regcache_mark_dirty() in the resume() now,
> being different from previously doing in suspend()?
>
> Thanks
> Nic

Which is for probe -> runtime_resume case.
After probe, the power may be disabled, so move mark_dirtry
to runtime_resume, then regcache can re-write all the registers.

best regards
wang shengjiu

>
>
> > +     regcache_sync(asrc->regmap);
> > +
> > +     regmap_update_bits(asrc->regmap, REG_ASRCFG,
> > +                        ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
> > +                        ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
> > +
> > +     /* Restart enabled pairs */
> > +     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > +                        ASRCTR_ASRCEi_ALL_MASK, asrctr);
> > +
> >       return 0;
> >
> >  disable_asrck_clk:
> > @@ -1155,6 +1175,11 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
> >       struct fsl_asrc_priv *asrc_priv = asrc->private;
> >       int i;
> >
> > +     regmap_read(asrc->regmap, REG_ASRCFG,
> > +                 &asrc_priv->regcache_cfg);
> > +
> > +     regcache_cache_only(asrc->regmap, true);
> > +
> >       for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
> >               clk_disable_unprepare(asrc_priv->asrck_clk[i]);
> >       if (!IS_ERR(asrc->spba_clk))
> > @@ -1166,51 +1191,10 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
> >  }
> >  #endif /* CONFIG_PM */
> >
> > -#ifdef CONFIG_PM_SLEEP
> > -static int fsl_asrc_suspend(struct device *dev)
> > -{
> > -     struct fsl_asrc *asrc = dev_get_drvdata(dev);
> > -     struct fsl_asrc_priv *asrc_priv = asrc->private;
> > -
> > -     regmap_read(asrc->regmap, REG_ASRCFG,
> > -                 &asrc_priv->regcache_cfg);
> > -
> > -     regcache_cache_only(asrc->regmap, true);
> > -     regcache_mark_dirty(asrc->regmap);
> > -
> > -     return 0;
> > -}
> > -
> > -static int fsl_asrc_resume(struct device *dev)
> > -{
> > -     struct fsl_asrc *asrc = dev_get_drvdata(dev);
> > -     struct fsl_asrc_priv *asrc_priv = asrc->private;
> > -     u32 asrctr;
> > -
> > -     /* Stop all pairs provisionally */
> > -     regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> > -     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > -                        ASRCTR_ASRCEi_ALL_MASK, 0);
> > -
> > -     /* Restore all registers */
> > -     regcache_cache_only(asrc->regmap, false);
> > -     regcache_sync(asrc->regmap);
> > -
> > -     regmap_update_bits(asrc->regmap, REG_ASRCFG,
> > -                        ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
> > -                        ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
> > -
> > -     /* Restart enabled pairs */
> > -     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > -                        ASRCTR_ASRCEi_ALL_MASK, asrctr);
> > -
> > -     return 0;
> > -}
> > -#endif /* CONFIG_PM_SLEEP */
> > -
> >  static const struct dev_pm_ops fsl_asrc_pm = {
> >       SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
> > -     SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                             pm_runtime_force_resume)
> >  };
> >
> >  static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
> > --
> > 2.21.0
> >
