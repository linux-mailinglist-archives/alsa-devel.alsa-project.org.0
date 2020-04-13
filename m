Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD101A6232
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 06:33:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4D916D9;
	Mon, 13 Apr 2020 06:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4D916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586752419;
	bh=mZOttr3qNbHTmJx7k2mFXAPRFd77hbUOus2deq4fjQc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zhux7OBwiePuKSvBMRuyR4Wxl3kIMCcT0kD0uBDOehsmtpGA/OV4YYIQp+dpa1nbm
	 yD1qAVKhqIRqrnXNKRc5bJ8PrNxENy7EmDvd1IggegrBsbL/ZwU6YksdHE4O1/yaRg
	 /+02qEjZrWpRoM5Vnqyr73VcxgIOAzyChUyZ9mLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECD84F8025F;
	Mon, 13 Apr 2020 06:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C4C2F80245; Mon, 13 Apr 2020 06:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67258F800B9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 06:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67258F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eBiubb27"
Received: by mail-pj1-x1042.google.com with SMTP id cl8so2185909pjb.3
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 21:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cncGDqt7fHMkXaI3l27jxuKAAcyo4TLpPS8jKmBxrB8=;
 b=eBiubb27eRyfe+lqxro+fYFl17BREZ/tw3ox6LXKc1U/ONkBvPz2I8GVeROXQJ7wDj
 73JzWAIKxOS6cEpL+iXc7cNlFy4hOHVYSpV2w2OIpeUVoVobgJyP9i2q44KFCf+GPyTA
 GEmZWDuoMpA/fBn/CbKSP/HizQZT8hPsyzwWOuSvUMHbN5NJrtiAmVQlR5zSrtAMfkI8
 mJS7YB+LNizev96VgVNzWAlIAP3/zo/zBcFnaNiAITdOTfpSuS931MEfKZxM4IJAtaM1
 Ia/LZKRL2Y0qjmSeQ4mOprXlig5OGHKdATdfieX4b1exDKqvz7H5VVd0obql2UrtLT+m
 Ppsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cncGDqt7fHMkXaI3l27jxuKAAcyo4TLpPS8jKmBxrB8=;
 b=NDcKZb8lZsoX0qr/EZPblMh30of212A31zrwyr0E4aYutNJ2YQ8WaoVV3EBodF4CLh
 BBEzdy2+RQ0yErZ32Qds325+IcFX7xmf99GoXDNBA0ACgzMeYLZMD1g++gUKyhem8vW8
 fcsrvZWhJrV218wSMcKulJz6ZTsR2DdKiJkQnsRS10x9E7HJ/i8Dyl5ZlNT8xVV6hOPw
 +dVnPvP1EYLbI0xpc9p12yHTMQrr8uIT23TDJ1qD++qmkYuAW+LRRX2xMneFunKDrhEx
 wiH/s9sZ/fpQLDX2l9nnEyyyyguvGM2QxkrZfqzNQ0eMh1jS2j+5ANnepB2mLZSoU5Lu
 GmZA==
X-Gm-Message-State: AGi0PuY9X3gpF0OpP5jYar3FcjNwcjTlgDta0drULaQPeqh5uguOocGB
 ATiiMs/gssKNlcPQviGsdhA=
X-Google-Smtp-Source: APiQypIRcMeZlHWm/EdnTHFU5olUz6v2AbqayudJLIZ+rDTXU5dozNE4arV7AQtDkr6IOFCAM0uXRg==
X-Received: by 2002:a17:902:784c:: with SMTP id
 e12mr15604537pln.191.1586752309748; 
 Sun, 12 Apr 2020 21:31:49 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 m9sm7546835pff.93.2020.04.12.21.31.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 Apr 2020 21:31:49 -0700 (PDT)
Date: Sun, 12 Apr 2020 21:31:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200413043143.GA9116@Asurada>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
 <20200412020814.GA5984@Asurada>
 <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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

On Mon, Apr 13, 2020 at 11:16:31AM +0800, Shengjiu Wang wrote:
> On Sun, Apr 12, 2020 at 10:08 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:
> >
> > > > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > > > > index b15946e03380..5cf0468ce6e3 100644
> > > > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > > >
> > > > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> > > > >               return ret;
> > > > >       }
> > > > >
> > > > > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > > > > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> > > >
> > > > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > > > define in this file too, rather than in the header file.
> > > >
> > > > And could fit 80 characters:
> > > >
> > > > +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> >
> > > I will use a function pointer
> > >     int (*get_pair_priv_size)(void)
> >
> > Since it's the size of pair or cts structure, could be just a
> > size_t variable?
> 
> Yes, should be "size_t (*get_pair_priv_size)(void)"

Does it have to be a function? -- how about this:

struct pair {
	...
	size_t private_size;
	void *private;
};

probe/or-somewhere() {
	...
	pair->private = pair_priv;
	pair->private_size = sizeof(*pair_priv);
	...
}
