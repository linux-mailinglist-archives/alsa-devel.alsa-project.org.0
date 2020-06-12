Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B731F7345
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 07:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0ED4167A;
	Fri, 12 Jun 2020 07:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0ED4167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591938288;
	bh=aIAzVpEvk28DqBxzn/0BzH1p0/1hlVCPiodVVoC3QS0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V3n9KShpHI6iFekEy8k3NE45QRbEGDjJqMUXPT1EMZuAnFyt58rJzCgM878JgwebL
	 Vf4vo2a793h+5Pu0GFyjZHBzn5vymxwyNdSH5Ta/w4EICD0Ff7whParpBZhJdwZO7q
	 Zw2PZda3dk1adw4ItjlZn0eC9o1sPTAKDAMsZHo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6939F80058;
	Fri, 12 Jun 2020 07:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4075BF8021C; Fri, 12 Jun 2020 07:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C80A1F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 07:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C80A1F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q01Sv3tA"
Received: by mail-pj1-x1044.google.com with SMTP id s88so3361304pjb.5
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 22:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AQb3my+JsHlPPhTUgek4A/JfdbCiC4/wHqfCQrXHjrU=;
 b=q01Sv3tAmgbAnD8CpTMm/o03irTJ7C9U+SvSNziUnrthARWPJYAHa+QPqOIvkTh6QR
 no4O2hrQdkvUupP2diATC+WeE8zHFg5Z7B2bRDjTf1OHqN1lk9NsKfdNlQObU1InoXUw
 2A4MuUdDhIMNhy8XZYAZb6Nedh0e7AxbreTaiJr/him4Edt1Q345hVImR/g8Kbbc+Uym
 u0evKTdygrq7aUwfb/rkAxmVz0ZIDw++Z3xruuZc4cwf3IzIzQAMXpLnppl51Jc40Ove
 kI9LCyxnPeCzAoB1Eo3kkJlxAQ6o/5/HrUpoluPDcm2kg4ysQZPTDnOHRYs4UAKmkXBw
 bQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AQb3my+JsHlPPhTUgek4A/JfdbCiC4/wHqfCQrXHjrU=;
 b=T+okJZpvs5177t3PcdSh39keMtgAi7leRJZ0wAA9M4cMA3xFr6zy3W3Y3zqGBrjd57
 HnCg/+JXB6ItMguxDzdZqOI3P0KNrLUnD/T8NvUWWK1/gOo8lC2GjE+Ssg19jyURfL4g
 2qFgaOah+nI5CFHT4hlEGaMxPRo+R1IfJrvKMOx3F5QRPJnXJJddIpH7fnlurI2Zrj1r
 8bt06cWY5bNvcpt+IQ9eRPj3otS1T0eS8y4Fm1m8r2IMFAGHagad5v591DZY/wB5ZwGC
 1xpi2dgkFwUvp1xyLsmu92qECFLKqCqCp21BtBSjBa53EWrpbsMhGJRIPklc4W60DZM8
 Ve1A==
X-Gm-Message-State: AOAM531zNNen5NPwiWzPCAVuwINBa+i8N3hW2KdKhJXO0Df5PyCcCbIh
 GnmePchaSm4yD+7s+4/SCHQ=
X-Google-Smtp-Source: ABdhPJwjToNwD3VazGS7MHp3JaSxFxVaFsE6O2sMauxx8tbjvDPH4tb7qxRuOF0NFqhRYZWr3cMqNw==
X-Received: by 2002:a17:902:9f8d:: with SMTP id
 g13mr9910233plq.292.1591938177195; 
 Thu, 11 Jun 2020 22:02:57 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n4sm4088751pjt.48.2020.06.11.22.02.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jun 2020 22:02:56 -0700 (PDT)
Date: Thu, 11 Jun 2020 22:02:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [RFC PATCH v2 3/3] ASoC: fsl_asrc_dma: Reuse the dma channel if
 available in Back-End
Message-ID: <20200612050245.GA18921@Asurada-Nvidia>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
 <0473d4191ae04ab711d63c5c875e47f45f598137.1591783089.git.shengjiu.wang@nxp.com>
 <20200612003103.GA28228@Asurada-Nvidia>
 <CAA+D8ANbr-nAzY436-AFPOzwGb2LBaZSb40VwoEQrYScKr=0NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANbr-nAzY436-AFPOzwGb2LBaZSb40VwoEQrYScKr=0NA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Fri, Jun 12, 2020 at 10:17:08AM +0800, Shengjiu Wang wrote:

> > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h

> > > + * @req_dma_chan_dev_to_dev: flag for release dev_to_dev chan
> >
> > Since we only have dma_request call for back-end only:
> > + * @req_dma_chan: flag to release back-end dma chan
> 
> I prefer to use the description "flag to release dev_to_dev chan"
> because we won't release the dma chan of the back-end. if the chan
> is from the back-end, it is owned by the back-end component.

TBH, it just looks too long. But I wouldn't have problem if you
insist so.

> > > @@ -273,19 +299,21 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
> > >  static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
> > >                               struct snd_pcm_substream *substream)
> > >  {
> > > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> > >       struct snd_pcm_runtime *runtime = substream->runtime;
> > >       struct fsl_asrc_pair *pair = runtime->private_data;
> > > +     u8 dir = tx ? OUT : IN;
> > >
> > >       snd_pcm_set_runtime_buffer(substream, NULL);
> > >
> > > -     if (pair->dma_chan[IN])
> > > -             dma_release_channel(pair->dma_chan[IN]);
> > > +     if (pair->dma_chan[!dir])
> > > +             dma_release_channel(pair->dma_chan[!dir]);
> > >
> > > -     if (pair->dma_chan[OUT])
> > > -             dma_release_channel(pair->dma_chan[OUT]);
> > > +     if (pair->dma_chan[dir] && pair->req_dma_chan_dev_to_dev)
> > > +             dma_release_channel(pair->dma_chan[dir]);
> >
> > Why we only apply this to one direction?
> 
> if the chan is from the back-end, it is owned by the back-end
> component, so it should be released by the back-end component,
> not here. That's why I added the flag "req_dma_chan".

Ah...I forgot the IN and OUT is for front-end and back-end. The
naming isn't very good indeed. Probably we should add a line of
comments somewhere as a reminder.

Thanks
