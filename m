Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D215A187
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 08:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687111662;
	Wed, 12 Feb 2020 08:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687111662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581491336;
	bh=b5j+0j7g6tN/Hs6TXWzoEFdxbTVRBM9QCz/Wc/KC6ig=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojV85k8S1AB5kkFz7SFmNnUYN+v32gJvuTdvgfv+UFqrxBAcz2HHg+6bf+0nuJ/0s
	 DVBp9Z2VnXlApFxbtXHLmij2uGJ8J0psnkUID/iazgLvYHBViE5xSznxBQeDStjwCr
	 heHiiNsx2uOLVuDRgQ9fbJ2SuJWvrr8rOIPvLRTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7191CF800E7;
	Wed, 12 Feb 2020 08:07:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E02EEF80157; Wed, 12 Feb 2020 08:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BA4BF800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 08:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA4BF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jwdFiFV/"
Received: by mail-qt1-x842.google.com with SMTP id d5so883163qto.0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 23:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0AxOxOz3N9F0K8mLSxL0hnOp0DZT57bazsTbRp6sLU0=;
 b=jwdFiFV/SfJKDeMxz405XK6dPGTtFwNKTaHgkG0RaH9AAZhyLyb3UYl8lLUBbog+un
 Bxr9qpp0GK52dG6zRcljoyLZac2+nISQ7dsMOoR11skKDkTia4fZdTVXnT2ojDov7f3a
 qDHqO5YuQsucYHMro4CDzLMC624oWN53GIS3OnjhbJqV8sSdmKXvxrTsIVI+tX6Sc2t3
 AgqJxatpZIQVkjXV5PGTTL6g3jUSHqt4xa2Dvu+9sPdyDu8Ay82093uv13ND0BFsBiyO
 VaEv96dr4ZagKvEQxY9Y6mHLYXAm5qMMKrElRAOWBfEp/l7IFg5VDrP+vHA1e5CGcOsC
 TXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0AxOxOz3N9F0K8mLSxL0hnOp0DZT57bazsTbRp6sLU0=;
 b=ivRvFQPBeUW6CpKrlipDCKsXT+jAEuoxkVx77DXOSQDhvGiPAeuEIS2r4bOGLgMOxs
 22tRufG7z8ympg/zFC1/dU76GWAd9ZzKRSFfcWIKIGMSMYgasHBHMKyjbqV38cAauCK1
 sGDJqSinYVDbk2IkB2m+SVDqcxQKnHQaOQJDUS6X8FeOk1Aa//yGZnuHW3WPDYPgiyCM
 LMYyJTs5i/fa22isUPZv11typShUlgVudByF+iw+c8jDrWIspAy3l4ZmNJQsw8yPgDpz
 cF2rzTP9xqC0LUF2VKiml3Hp+pMAB/bSqrBeFy8z71pWhivvoY5pIbC3sgiqWa6kvZ+Z
 EcnQ==
X-Gm-Message-State: APjAAAXSa+y3QGDytUR8QypDF9brU62LdMYdp6YapPTIOhHOz0D5G4hG
 VmaRZds+gTBHJzwPjE2AVW7/w7HgTfHvlq85KOU=
X-Google-Smtp-Source: APXvYqzFAhN/zmGH/qPNyu/UPaVQNVYCHk9/jtr+7frBaquyjhJMAItJOS022rDz7+Fs6rLuRzdouhsz6E39O1t+j3E=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr18086333qte.204.1581491224261; 
 Tue, 11 Feb 2020 23:07:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
 <2ab5cc65-026a-10fd-1216-b0d83baf37a6@infradead.org>
In-Reply-To: <2ab5cc65-026a-10fd-1216-b0d83baf37a6@infradead.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Feb 2020 15:06:52 +0800
Message-ID: <CAA+D8ANsA4kaT_48F=3Jey-NjJd5HO+XD38TnQD3XBu9bg2WFQ@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/3] Add new module driver for new ASRC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Feb 12, 2020 at 1:13 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/11/20 8:30 PM, Shengjiu Wang wrote:
> > Add new module driver for new ASRC in i.MX815/865
> >
> > Shengjiu Wang (3):
> >   ASoC: fsl_asrc: Move common definition to fsl_asrc_common
> >   ASoC: dt-bindings: fsl_easrc: Add document for EASRC
> >   ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and platform drivers
> >
> >  .../devicetree/bindings/sound/fsl,easrc.txt   |   57 +
> >  sound/soc/fsl/fsl_asrc.h                      |   11 +-
> >  sound/soc/fsl/fsl_asrc_common.h               |   22 +
> >  sound/soc/fsl/fsl_easrc.c                     | 2265 +++++++++++++++++
> >  sound/soc/fsl/fsl_easrc.h                     |  668 +++++
> >  sound/soc/fsl/fsl_easrc_dma.c                 |  440 ++++
> >  6 files changed, 3453 insertions(+), 10 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
> >  create mode 100644 sound/soc/fsl/fsl_asrc_common.h
> >  create mode 100644 sound/soc/fsl/fsl_easrc.c
> >  create mode 100644 sound/soc/fsl/fsl_easrc.h
> >  create mode 100644 sound/soc/fsl/fsl_easrc_dma.c
> >
>
> Hi,
>
> Is this patch series missing Kconfig, Makefile, and possibly
> MAINTAINERS patches?
>
yes, Kconfig, Makefile is missed, will add in next version, and
no maintainers patch.

best regards
wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
