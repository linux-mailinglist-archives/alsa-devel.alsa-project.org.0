Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436EC1D4A5E
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 12:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C230F1666;
	Fri, 15 May 2020 12:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C230F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589537041;
	bh=fvNOk4BaanaoHJdF1JQojNamflMDXhUQDVi6uvk2GD0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOMLJFGBiokIo2Kj64IAqtrYXSz4pd3vsT3WS77Qibp1DBxGk8e2uskBd+XyJQmZH
	 AHTk40mWzQ9LLX9SnO2Exerezs1xRYrI6cJZ/wc9yGakvp8wk4EbKEMA7oYAlGSFKn
	 jgabgaysY0U4z8VVb5K2L6VR9qAUbVNvmg3jbOT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBD65F800B8;
	Fri, 15 May 2020 12:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD632F80247; Fri, 15 May 2020 12:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3103FF80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 12:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3103FF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="r8YCpftd"
Received: by mail-qt1-x841.google.com with SMTP id i68so1423517qtb.5
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcUXaEpbXUpVL01oFB6hRlgR7PeeYt7QBRNoruvyCbY=;
 b=r8YCpftd/P5xTvlYz3ynLdKuAbb+OBjgoQ+380Hvgp8upI9U0p29w3r2M23HNeCgny
 McaR//XORw7nRXahwn89WFF8xUs69HoY61LqdifB+ntJhZBcgCEhRowcUg3hY3cYjKZ0
 6F59Y/UK6GcZ4mbkdZLbEumgJq5MUdfRZhRLqfiwOq51Dbl3T7F8lYTDBhMspj1vAuvq
 nJydlHTEGiCKCqeftb0h7NchqDXRkBxaHSPSCfSS0nO5gwg6en13tc786ZnofttzAwsx
 pTizqaZb2nXkk1NFaVceiuZLCPW0zb3K6jE3itFdgovcgWjul7Fb0avWf1RtyBzW0gE8
 lonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcUXaEpbXUpVL01oFB6hRlgR7PeeYt7QBRNoruvyCbY=;
 b=Lc0cXFpYi6WhT7uKCtTU1Pz9cYYuHvRq/Kaf3L0mpIGpDUcHMvZyGkf+QFnWp+JsjT
 H/uah5OWE4uyPeLDFDvLdZpBu3jvuAgQv2ufMXMEJMwV0mdBSVEnmaq6l20GFnObfzD4
 CAhw2+gRAvQEOIwAOG2YofS+OISNxIgxYJkOmy6eW1hSHqhfQOBlkoptnZvbm1UmHEk1
 whJjyxiSXUGTW4OeANbGt0pFHze5KKCkLPHZC6MXqnmaEPlYP7PvNWaKNprUgRgPkWp0
 QbvFs700C98uSH7v92MilEDO0+E2NvmIglEKphW8B76R7+oEXV7W54uOrqg/QM5wElzX
 Gd5A==
X-Gm-Message-State: AOAM5311AxHKb1BgZDaZCobSRrDqCqXRJ5nCC/TbWOEoffL0tAEtMXgM
 1wsDVHx2CY5isc/cMHRdNd+B1vfWUbzheCPf/jU=
X-Google-Smtp-Source: ABdhPJyznFMUdqKh5MEAtGN+Z5aVH5R/r5Mj4195QZGvA37EfsjjNUwLr+rQki1u4TDjULiTD0B2I6/8TxiO06OU3cA=
X-Received: by 2002:ac8:302f:: with SMTP id f44mr2485555qte.121.1589536931527; 
 Fri, 15 May 2020 03:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
 <20200501102158.GA5276@sirena.org.uk>
 <CAA+D8ANDHHejFD1rYmFOG24yivpEJa+xO-WpVr=Vzfz9yW9H7g@mail.gmail.com>
 <CAA+D8ANK+Sd=nPeDZpd_=fQRFOdLtKgvsCmfQ_fRU3RCjMY+rQ@mail.gmail.com>
 <20200512123801.GG5110@sirena.org.uk>
In-Reply-To: <20200512123801.GG5110@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 May 2020 18:01:57 +0800
Message-ID: <CAA+D8ANTv3R-vDki3No0rG++u4OKrNFGh_Eq3DNLSAQ4f=mLwQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

On Tue, May 12, 2020 at 8:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 12, 2020 at 10:48:41AM +0800, Shengjiu Wang wrote:
> > On Wed, May 6, 2020 at 10:33 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > > On Fri, May 1, 2020 at 6:23 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > > > EDMA requires the period size to be multiple of maxburst. Otherwise
> > > > > the remaining bytes are not transferred and thus noise is produced.
>
> > > > If this constraint comes from the DMA controller then normally you'd
> > > > expect the DMA controller integration to be enforcing this - is there no
> > > > information in the DMA API that lets us know that this constraint is
> > > > there?
>
> > > No, I can't find one API for this.
> > > Do you have a recommendation?
>
> > could you please recommend which DMA API can I use?
>
> Not off-hand, you'd probably need to extend the API to export the
> information.

Thanks.  I will think about if I can find a better solution.
And I will drop this change and send v2 of this patch-set.
