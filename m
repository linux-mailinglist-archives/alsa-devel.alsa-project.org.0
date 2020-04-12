Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 376961A5BFA
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 04:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83C516BF;
	Sun, 12 Apr 2020 04:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83C516BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586657424;
	bh=Yfc3mhkxykFzf9NtM05Fdhb+YUi16ObK6JBlK3ix/yE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1zlMlzBrEApgMgIV51Z0wfDem1J0CL4saoExFLxelXr9CS0hI2hsmEk3ejhcGD3T
	 xIuU7IOvckiWNDcY90XD8//TpKtUEAZHCBRfQJzOrqX7eZ//PbQot83hKYfGzCAlCB
	 R5lkeLrnNg5W70r9UnMUiChPG6IsyPJF8d9HTYvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB73EF8014E;
	Sun, 12 Apr 2020 04:08:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77ADAF8013D; Sun, 12 Apr 2020 04:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEF2EF800B9
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 04:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF2EF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lDpwEbYH"
Received: by mail-pf1-x444.google.com with SMTP id a13so2945274pfa.2
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 19:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2XTiPR3NjTU2y5mQ5J0Pv6fdfmC7aqoQXGxB8xurXAY=;
 b=lDpwEbYHC9at0O1/B5PbecUoT+1zLNbJJBOjARMz1vPiPAZBxvUrVH5hV342v8CaFt
 a+I5t0MMp3yKWm1/XhdBCF5fMcDcvldG3YzNzo+98u9VjmM3qkmwU2LEH1R5FVaSneic
 7+y6w8ZmazEseq6ypQ+mk1+A5Yc9E34zL7pYLna9QbmUpef2c50w7XcQPXQXgPs9c84L
 YuZFpYEZ1xgZfskMHnj0FcLrXcK3dxQEc9RdlUv+5pH0JvRJHiFGrlGfuJwKfUeRJVPG
 xtDq/X8ZmLWtOjlWR5J0H7sDNy2S02+b8TZnC5h3QRrLCz80U5KzDaIU5uriOG0mmL0J
 KDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2XTiPR3NjTU2y5mQ5J0Pv6fdfmC7aqoQXGxB8xurXAY=;
 b=A1ya/VJ53qg7aUrxmwsjSoh8EpGflLyMRBVwXi/FNWsjNAlwLssOTZ4s9Ksu2lGL7K
 Jzk8JZ31BvQr9BrniyRkg5JX9F5PYM+VzRPnQUFNEL2s/NNmdIJH9svpIH4wsuTHd9b8
 mIoKRirsCO5xTQppzH3oqC8c6lp/9ng+agDESprslVNi7F4p85oJl2CZBAmdI+a6zM7L
 zmKbW2qzs76rM+7fc6iKKGbcTzK57akzVSDtp529in84ra6J41BrtSW+6ivGRnaU0S2z
 jjnhYWy0qi/EgIp4A2tNIZi+ZrH/rXc/Gi6nVVdEYDFUM9UBVK7kiAHzWcerxhZF0y8X
 nrOg==
X-Gm-Message-State: AGi0PuYSzb4ji2IpcBD4P80Db+yoU/ynt45aGtgNu+8M0VQoiQ5LrWJQ
 rIQpUbQS6vlWSBpg/h/F1+0=
X-Google-Smtp-Source: APiQypJ60bO+ukorWl/8JR2FaX5qNy91w61uKW994f9Dy9yVPv9w6abyS3PWd2+Up8uTp/PFc4Ngxw==
X-Received: by 2002:a62:cf82:: with SMTP id b124mr7362893pfg.124.1586657312126; 
 Sat, 11 Apr 2020 19:08:32 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 b16sm5148188pfb.71.2020.04.11.19.08.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 19:08:31 -0700 (PDT)
Date: Sat, 11 Apr 2020 19:08:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200412020814.GA5984@Asurada>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
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

On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:

> > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > > index b15946e03380..5cf0468ce6e3 100644
> > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> >
> > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> > >               return ret;
> > >       }
> > >
> > > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> >
> > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > define in this file too, rather than in the header file.
> >
> > And could fit 80 characters:
> >
> > +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);

> I will use a function pointer
>     int (*get_pair_priv_size)(void)

Since it's the size of pair or cts structure, could be just a
size_t variable?
