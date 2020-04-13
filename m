Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BD1A61B7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 05:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C86281696;
	Mon, 13 Apr 2020 05:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C86281696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586747919;
	bh=dvse0COOrsfgfoczcCmGwHBjJaJmXMkMzR4XwPPgeKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fi1CXTAbDAK1F0kVojRIYzT9aJIB7NZ/2vV51tiGNitZUtU52/0saOLHIVC/NZozN
	 Jlz94LgehuTtFcI9u2UKQW4Pcncee7ofIuAFXUKJZLzkcGDMnHCxQXxGLJG4L/Z/0/
	 IeoNmqBhBMxdmnTEY7wn2hAX+ibfR8BHXaVNTpnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B28F8025F;
	Mon, 13 Apr 2020 05:16:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54444F80245; Mon, 13 Apr 2020 05:16:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F89F80115
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 05:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F89F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rN69rysV"
Received: by mail-qk1-x741.google.com with SMTP id m67so8210492qke.12
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E/j11TZfH7UZNApZvH4fEyzZjBApgpFuNvhfzAcUS4=;
 b=rN69rysVCPRtDzu9ocDB8luGscQ5EDAzFC2HUPBZoBmnadjkGd12CRKaUx5KCEmflo
 EjTtB+OZ2lBX7RZXRvyzxIqvKtDx/jgPV82ukKk4l3qRTVFmtWCScuIAIcWvHi+zUDww
 Cr7BAtYsbLMGPjM0IFFZx87NZcQUYIBsEaRTJDmxyRFWGIvQVX6iAisWS93MSXj07hrA
 FB3kyYhKxDxDChLwsHTilLFCicvIZSSBv1ehw6yEG2MMLACgwMJp58iqUHb7TfI55Qa4
 BVMIvw8KomziBHrkvm29KOnA7a6RWsgHHxhSdNWqrbO+XAg9rtixBd9DVRkw73jbvwkJ
 7/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E/j11TZfH7UZNApZvH4fEyzZjBApgpFuNvhfzAcUS4=;
 b=pghOr4yhsV0t7IifjFCYzbhyNrDD7SnQ8+6S0kGvPASv3SPCDdYLO4sjk+sgJXibEP
 +fKVkKz988ApwMoBME4D1ezBKwtcwZKXhdUftNQDN5X/II/425aaj5kzHknHev/c7OxH
 r2xlWjNzduJkxFljMG5w26OhittH7VUg1x+js5qlxcswplY9eckm4dZHwAzMnb0jpFf5
 4Nu7BoFvXP7j22Fx8pV2GPbVB2b5uRndjxjhdELU5KITnPtkRlRpEoyjqUDbsFn+uEak
 HE5oETPdFGResUQ5uc2GM/Vjdt7mhXqEe2YPzrlTyzX6jIcKgBMbBtLeltqyzfiS7fZ+
 2uEA==
X-Gm-Message-State: AGi0PuazNI/lDQlsjbjcG0xeagWhSTe80/4VTnlRwJnoSHtyXmuJa/vn
 BgWo/BCMGgD/Wqk6FHGcHZ8H+a7yNF+H63kT1h8=
X-Google-Smtp-Source: APiQypItGHPXPnsy1S/7ewXviLIp7ovweo1JzQvp+pRla6x2SM0Xc5ae+Mid29m10MeNtKBNayczigkmHxXihCVcmM0=
X-Received: by 2002:a37:4fd0:: with SMTP id
 d199mr14522999qkb.121.1586747802796; 
 Sun, 12 Apr 2020 20:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
 <20200412020814.GA5984@Asurada>
In-Reply-To: <20200412020814.GA5984@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 13 Apr 2020 11:16:31 +0800
Message-ID: <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Sun, Apr 12, 2020 at 10:08 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:
>
> > > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > > > index b15946e03380..5cf0468ce6e3 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > >
> > > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> > > >               return ret;
> > > >       }
> > > >
> > > > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > > > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> > >
> > > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > > define in this file too, rather than in the header file.
> > >
> > > And could fit 80 characters:
> > >
> > > +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
>
> > I will use a function pointer
> >     int (*get_pair_priv_size)(void)
>
> Since it's the size of pair or cts structure, could be just a
> size_t variable?

Yes, should be "size_t (*get_pair_priv_size)(void)"

best regards
wang shengjiu
