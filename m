Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E26BE1A4E42
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Apr 2020 07:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B50E16A0;
	Sat, 11 Apr 2020 07:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B50E16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586584312;
	bh=iFK+OueRe8bZNZ8r72jTWI4sA/VYaoTFHfbSuwd824g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FnsRBcKsX1QKkYMGkNwxXMf4KJTmgN0Ob3NrjFLc84ArGlmV2fP8jxczAXSX36SqR
	 JB6t5HVvz44hZyvwh8e16t7zaREKuIA3fEIEbdxtPYrooKwkq32QiPfRx2AVnEx/ae
	 gz8gy+txKiKlagJzkvHckH2QPieIN3MOGAxp9OJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E41F800CB;
	Sat, 11 Apr 2020 07:50:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555D4F801DA; Sat, 11 Apr 2020 07:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB333F800CB
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 07:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB333F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q5aneZKK"
Received: by mail-qv1-xf41.google.com with SMTP id du18so1501627qvb.4
 for <alsa-devel@alsa-project.org>; Fri, 10 Apr 2020 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJrtFPh2k7Ocn2F2h4jgSLlpNWoMCuHTn40DR2631os=;
 b=q5aneZKKA78xQ6o1kJ1rScGZMZivPxz9JT4IiA4AblcWrlcRjvjh6cpnmwnS62vv1T
 bEbtqMxoHQvxkLa8HHlRwa3jMgYPeNd/k/3r9FuIGLgF0li7N2q7/0bUM8SSWLn3NE1U
 Sh9VJhTkn84Wrr87C5rn69nla076gFroH9YBa/4+skYdmR+O380EnUnRCbREX4jQKHiO
 0NXSGQXZv5jP6nMOdq3WowIdE0WqqKGcY5OOGEMtgqcYVBklvd2oZ19bMWyt+TdLtNg9
 XZQbPs3z2fUy1Z+BidU3rnDt+GzWSSMIddxLw8EkUI9Exn9cRvtHi2azMDuvotyBa/Bk
 mkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJrtFPh2k7Ocn2F2h4jgSLlpNWoMCuHTn40DR2631os=;
 b=QXPpjcEiWdnvT5rnfbFT1QsXCt44So3FOHgw21jwd3UPYv/hvrjghzY4rVcNDAUb0Z
 OVwuooHEz2DY2EjcbMaiOUhfudE+CMG75QUVNNUlDvLc//zKEiWwKzMa2zCZPiAAZ6hS
 5hi1ntd4PxVaBhBPmJQUrQvW3re/fYo4/0cq6cJOyVWJwG7JocP4GyYTPw2siamBaB84
 zL2zlx9dsypyBuwkCM2yL0v+2EYDQx/HxMXfTbejOfdjqKosxJLjkpWKbFwPfCOSqoNo
 fiuZw1ATmRPSQkLJkihpNWXayG6mwvb7DwkV1RXeLeYMiSU2KsFf6htxUdrvgNh7hJV0
 k1yQ==
X-Gm-Message-State: AGi0PuZPrZniNDd0TwLy0MnOpkRWPykRy4fjUP7qTu2Wh5mOELxCHq0j
 cna/f0azHgxWygC4SH2HJ41RqzJ9lelYoCIHnxw=
X-Google-Smtp-Source: APiQypJ+BVKiXkyfqlXZ3G20bGDwTrRdeBK+2RCyToQfCR2IikaFnt/ESyQeRXUJ6JCeNWMvUq6ai+h+x7+pUzlEZaM=
X-Received: by 2002:ad4:4665:: with SMTP id z5mr8411234qvv.32.1586584194833;
 Fri, 10 Apr 2020 22:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 11 Apr 2020 13:49:43 +0800
Message-ID: <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
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

Hi

On Tue, Apr 7, 2020 at 7:50 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Apr 01, 2020 at 04:45:38PM +0800, Shengjiu Wang wrote:
>
> >  static int fsl_asrc_probe(struct platform_device *pdev)
> >  {
> >       struct device_node *np = pdev->dev.of_node;
> >       struct fsl_asrc *asrc;
> > +     struct fsl_asrc_priv *asrc_priv;
>
> Could we move it before "struct fsl_asrc *asrc;"?
>
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> > new file mode 100644
> > index 000000000000..5c93ccdfc30a
> > --- /dev/null
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
>
> > +#define PAIR_CTX_NUM  0x4
> > +#define PAIR_PRIVAT_SIZE 0x400
>
> "PRIVAT_" => "PRIVATE_"
>
> > +/**
> > + * fsl_asrc_pair: ASRC common data
>
> "fsl_asrc_pair" => "fsl_asrc"
>
> > + */
> > +struct fsl_asrc {
>
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > index b15946e03380..5cf0468ce6e3 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
>
> > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> >               return ret;
> >       }
> >
> > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
>
> If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> define in this file too, rather than in the header file.
>
> And could fit 80 characters:
>
> +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);

I will use a function pointer
    int (*get_pair_priv_size)(void)
to avoid definition of  PAIR_PRIVATE_SIZE. which is not safe.

best regards
wang shengjiu
