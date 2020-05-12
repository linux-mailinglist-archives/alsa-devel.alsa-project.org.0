Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0371CF624
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 15:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD38216A9;
	Tue, 12 May 2020 15:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD38216A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589291283;
	bh=xdCdOaxPLyWFbB8EoPMvYXJXhSNUUtzXu2aJwSH4xPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0b9z+brPlttm//uItbh46QGIots+g964K+axjJyB5Md0i9lYbMh9gcSd0P4TPFT3
	 gwUxqSLr/UT4X4pIrUsGtNu4cFmeIqvQ6scLYfkovh/OqXnDCr7uU13nKxSV19hXfd
	 xbWLmOgl1mo6RCcF8Dcj8m5CJ2b8PdLPb6WuyeQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1D5AF800B7;
	Tue, 12 May 2020 15:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C94F8014C; Tue, 12 May 2020 15:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DA0EF800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 15:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA0EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a1KrS+t9"
Received: by mail-wm1-x342.google.com with SMTP id g12so23355374wmh.3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 06:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9B3E0RgxIgCwdVv22pNrFUUaMOckz38JYynDL0wlH+8=;
 b=a1KrS+t9U+XpGco/3pOd8hF2e6bszkjps9symqBwfePQ3ule3ZZyvqDuDyFbk+cUZf
 e+/1fICdstZkSV0lF/w8E/BE3Fz/37XkzsODP72JMOp72+Jr7inVYml5L0ozrq2sI7r5
 0VlrM+ic+c9ZAacenAmSZgUB2xjFneGK+Zp+ZeOltsugxuHH8QjaXCjTlExApbJnxjJ+
 1zAUJdbwa6Kv9O8GJL1JLvfcYxn2PrmFUL5VE3vf0cApHyqvm90Q6YHPlFVaGx2NTC2p
 JZk7vEiX9feLJFFDzzp/Ho1qtg6jz+O7HoFEonKK1m0PQpQcFW6MU2POadpLN5T/baf2
 K65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9B3E0RgxIgCwdVv22pNrFUUaMOckz38JYynDL0wlH+8=;
 b=UqFTUMDSch+oosqx81l0Lj6NzacAqB9FwSBSbmGcFA+iwWETyfcQF9skaGjR6GZK3+
 3X6IqhPAUUZ/zNgiBiIS7iJv5Az2FO8kt3yUeq7dyRP6H5odKaes+BilSI4PvIpdQGEG
 YcsZ2Kko4Dz1pl/ycfA2ReGqPZvCNyqlO1xqsjE9ao9Bl+R+2asIVisNnVai/BP17jmq
 5t9QdUa6bdgmMjwDJdANxA1A2Q5Dy4CuQipM1DwtKrVskM3yWxvKf7UXRsccuLIVGLQ8
 KKs9RXVtM+kN0/vQjm42PAXkat/tKCkPsB8+X8BsYs1Znd4AWqVMJ9IvXMhW2sEk2zzY
 g4TA==
X-Gm-Message-State: AGi0Pua40N0ktIjXJucJELkteHpx0zU6gmQY/Xktb53ekhJUsfD8EBJJ
 mtCUw2/9aTFox21it7sepdNMhiWil78tkgp6aPU=
X-Google-Smtp-Source: APiQypJtIlbQweYXDJ7aJK7yp7/HjxP5vF1agTyfrwegDuCMTppMWSWOMl+wYghuavk5kCIzpFUad6oLmyU7J9T4T7M=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr37589387wmh.39.1589291172605; 
 Tue, 12 May 2020 06:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
 <20200511212014.2359225-10-alexander.deucher@amd.com>
 <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
In-Reply-To: <3c131eb1-9f5c-fd37-687c-182888774e08@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2020 09:46:00 -0400
Message-ID: <CADnq5_NHzg5dVhbx9ZqNDgVZVWfGaUteVtxLRORCXVM6UOP1nQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>, Alex Deucher <alexander.deucher@amd.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>
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

On Mon, May 11, 2020 at 6:37 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > @@ -233,6 +234,11 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
> >               ret = PTR_ERR(adata->pdev);
> >               goto unregister_devs;
> >       }
> > +     pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
> > +     pm_runtime_use_autosuspend(&pci->dev);
> > +     pm_runtime_allow(&pci->dev);
> > +     pm_runtime_mark_last_busy(&pci->dev);
> > +     pm_runtime_put_autosuspend(&pci->dev);
>
> usually there is a pm_runtime_put_noidle() here?

I'm not sure.

>
> [...]
>
> >   static void snd_rn_acp_remove(struct pci_dev *pci)
> >   {
> >       struct acp_dev_data *adata;
> > @@ -260,6 +302,9 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
> >       ret = rn_acp_deinit(adata->acp_base);
> >       if (ret)
> >               dev_err(&pci->dev, "ACP de-init failed\n");
> > +     pm_runtime_put_noidle(&pci->dev);
> > +     pm_runtime_get_sync(&pci->dev);
> > +     pm_runtime_forbid(&pci->dev);
>
> doing a put_noidle() followed by a get_sync() and immediately forbid()
> is very odd at best.
> Isn't the recommendation to call get_noresume() here?
>

I'm not sure here either.  Is there some definitive documentation on
what exact sequences are supposed to be used in drivers?  A quick
browse through drivers that implement runtime pm seems to show a lot
of variation.  This sequence works.  I'm not sure if it's optimal or
not.

Alex

>
>
> >       pci_disable_msi(pci);
> >       pci_release_regions(pci);
> >       pci_disable_device(pci);
> > @@ -278,6 +323,9 @@ static struct pci_driver rn_acp_driver  = {
> >       .id_table = snd_rn_acp_ids,
> >       .probe = snd_rn_acp_probe,
> >       .remove = snd_rn_acp_remove,
> > +     .driver = {
> > +             .pm = &rn_acp_pm,
> > +     }
> >   };
> >
> >   module_pci_driver(rn_acp_driver);
> > diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
> > index a4f654cf2df0..6e1888167fb3 100644
> > --- a/sound/soc/amd/renoir/rn_acp3x.h
> > +++ b/sound/soc/amd/renoir/rn_acp3x.h
> > @@ -40,6 +40,8 @@
> >   #define TWO_CH 0x02
> >   #define DELAY_US 5
> >   #define ACP_COUNTER 20000
> > +/* time in ms for runtime suspend delay */
> > +#define ACP_SUSPEND_DELAY_MS 2000
> >
> >   #define ACP_SRAM_PTE_OFFSET 0x02050000
> >   #define PAGE_SIZE_4K_ENABLE     0x2
> >
