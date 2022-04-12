Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 081BB4FCC06
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 03:56:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD7B170E;
	Tue, 12 Apr 2022 03:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD7B170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649728615;
	bh=FDAhB2w8X/XtsQg5f8T6GsJolqHrHAU2P6CaVVlDNGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dhsPZFhSbXnTwnomtoI4ezU782XyYxI/8lS6xS+cSa+qcx1XIfeStv/tm6Ovsx9U/
	 wZBgLOCHhH+WAf6tBwesgKQmvop9pERET3+OQgrQQnahujspZ537QKg+7BCO1KSAvK
	 CZ96rV7bSNx3PV/omuiPldksxG3MCPi8I+2MbjHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2757F80109;
	Tue, 12 Apr 2022 03:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2825F80154; Tue, 12 Apr 2022 03:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 771F0F8011C;
 Tue, 12 Apr 2022 03:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 771F0F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zb4vAoTa"
Received: by mail-pj1-x102d.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso1215098pjf.5; 
 Mon, 11 Apr 2022 18:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zt2MCLsUynrF58WLZPge4c4aYr44Eqz2dZhYMmOS5Gs=;
 b=Zb4vAoTaQFmVRhNdwWW84ug07JoZNN/P11BIhmGxgU4EhfhHWHTZA1BQrrSL4t+H46
 +nANdwyZaWhFm7NkgHzFekxWn/wOiKqinjl4Th7KsSQpJTKtLI9xH+QKGq7SVqjRSsU4
 UTOm/lUNRH7AtJwCKhzsAkduSh50I5G06J1SxKDWghLBsl9ocz6EQX6+qSXh2clqL8R2
 bcECBZxaMHu9T3gDLTpo5an3lPR1shYfv6IJgsgV5hiySTpO6hAhrHyx7iVIMVNU8/ij
 EaBaCn7f+64QjjHjJDGzsEdc8uRqBomlgdNWs3nwpmSvEVvPCe9xBmc69PpnkJLlQl43
 jjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zt2MCLsUynrF58WLZPge4c4aYr44Eqz2dZhYMmOS5Gs=;
 b=pDmWpxFDa/6iEKXuu57nMHnVNH7AAEpsN5rKYhmtLgX/1ZZRyRr0Vi5ScQeaps6BvD
 nyS0e5so4jWugeKISU5bJ/dTw0EuAmOxDMrkdvkfSNalbGvDp8pOPWRhE3Ib2w+DQ1iK
 cIhEZN0dprzJI53JXg9yg+qv/9WmBnhusjDvbBErHtV7goAeR32tLs3Ovo4vYtzCp6SV
 6IAGK/kQEc0v2l6K2VXR4X+p9wA9GQ7fXMwZospXSIzglnP+7d65jC2sOTUaNSPqTr7D
 EwWPc/RJcr7jBs00hQ1fIOixraben54L2VFcqq3M57ndQuyeOgtyRp5Z2p0+4njG6a40
 qFbw==
X-Gm-Message-State: AOAM532KB0FWL/3Ycz88NTd5mtlMzcXLhnNtnA92qrrFo0UMS0mGGqqH
 Z/0mbNosQlvmHTjBVja3GgYdr278upd1yHO7og==
X-Google-Smtp-Source: ABdhPJw9JYxc9NsIoABpsHXytZeNM/RqLxmGvsIscLga/fao6CUd8ma4W2HTLy9D3XzNyhJwCLiWYgWp4gCEXTimDbs=
X-Received: by 2002:a17:903:18e:b0:158:6be6:fbb2 with SMTP id
 z14-20020a170903018e00b001586be6fbb2mr6555570plg.161.1649728542088; Mon, 11
 Apr 2022 18:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220409143950.2570186-1-zheyuma97@gmail.com>
 <18cb711a-de2a-69e3-d753-7012a67bf2a7@linux.intel.com>
In-Reply-To: <18cb711a-de2a-69e3-d753-7012a67bf2a7@linux.intel.com>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Tue, 12 Apr 2022 09:55:30 +0800
Message-ID: <CAMhUBjnQO1vtGWc-RjGUE0_PAN7RGp_J7VZbMim1DeTvukS4-Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Check the bar size before remapping
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 peter.ujfalusi@linux.intel.com, sound-open-firmware@alsa-project.org
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

On Tue, Apr 12, 2022 at 12:23 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 4/9/22 09:39, Zheyu Ma wrote:
> > The driver should use the pci_resource_len() to get the actual length of
> > pci bar, and compare it with the expect value. If the bar size is too
> > small (such as a broken device), the driver should return an error.
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > ---
> >  sound/soc/sof/intel/pci-tng.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
> > index 6efef225973f..7d502cc3ca80 100644
> > --- a/sound/soc/sof/intel/pci-tng.c
> > +++ b/sound/soc/sof/intel/pci-tng.c
> > @@ -75,7 +75,11 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
> >
> >       /* LPE base */
> >       base = pci_resource_start(pci, desc->resindex_lpe_base) - IRAM_OFFSET;
> > -     size = PCI_BAR_SIZE;
> > +     size = pci_resource_len(pci, desc->resindex_lpe_base);
> > +     if (size < PCI_BAR_SIZE) {
> > +             dev_err(sdev->dev, "error: I/O region is too small.\n");
> > +             return -ENODEV;
> > +     }
>
> May I ask how you found this issue?

Actually, I tested this driver via fuzzing in a simulated environment
and got a crash. Hence, I try to propose a patch and ask for the help
of maintainers to determine whether this is an issue.

Thanks,
Zheyu Ma
