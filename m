Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2A23B56A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 09:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC901669;
	Tue,  4 Aug 2020 09:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC901669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596525032;
	bh=Bk+ZTL1kyiLhlOFgadplvSOWp7X1LrlvXZ9FR8tMcqs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTP1fjMU6NaEGA5xLZrtzYU+XvnvY2LFd314D2Gl3oXGeNt7azJrf5t7GqWAdxt39
	 RtacL+Hf2cauedQ05PmOEWq1jyJ9GyRy0g+vr6B8NPYw6j/LcgdIOX19Ft7H4iEl0O
	 pz5DXP16GS3hSAjJHhkUodEIL37M1L8Utl85xEgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0561CF8015A;
	Tue,  4 Aug 2020 09:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BA4F80150; Tue,  4 Aug 2020 09:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86050F800B7
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 09:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86050F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FJxWR+qO"
Received: by mail-pl1-x642.google.com with SMTP id t11so2498017plr.5
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mzXdPa02PNZzMci8IWENzcnutMB+4gkEmRjStQUBDRM=;
 b=FJxWR+qOBFsh8CQGiDEQC8hToTRhgA/qqWs7y8eQUAmKiS8qZGtnYHWm7UGrC4VXwI
 nKd/gEwt7T3y2Pc7p2FHBCPVC59iPibzT40Y6Sifh1NvqOV63ysCzcOAtLhqFmu2UoeQ
 uJ37ZDv4XOoXTEiz7UnGpDHuTqFMMYsywPgoOsx7X5eoQ6UYpBcAHD+jyvHyKr6qKcVK
 bqyYJyuXYBM1dazvCGekdJLZqof+OG8wgX3UGb54IMl/mO6V1jmdPROXI6Nt/3TCkntw
 buqZVTgvcIMZoLoJthtCGICijJk1BggUvkNb9hHEWEMSIPY3mQzfBwW7c91cKfQv7RUC
 aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mzXdPa02PNZzMci8IWENzcnutMB+4gkEmRjStQUBDRM=;
 b=MUloaOojfl2YP7XqQS1QFF11ICACKpnLMskzx1/Wge15rH+7TsQVtyi8fr0wR15mFl
 ye1X9TmORabLRYjgowabwmf6JmZGpFLRodpza19OxEc7V5NxY/FWTlL6VroQsCiTT9nn
 4CPFmsJ+8v998FYo3LLiygjn/Hf/nEReSm27CoB+dtx9V4OzJ49kvqV0WUdiqwL4Jtvs
 cMUm36wxKkU3/bM/KOKpS4ruwqGfo/E1LmpRcCPdi66s9fZxkuQLHXpP26E41u/9lDjl
 hp/+sVJfzDhTif5zwR1pvuL4ibWNbU/AFQT1BuB4PflXYvEtLcxY1hQggOGCWua6yHK8
 ky0Q==
X-Gm-Message-State: AOAM533fuJzStBsHTJOUHZr54MCSp5PoSNhfS5ZNKVGXrjB9BgxbLtY7
 qHUHp2enGhaWoDu+DpRc+Nk=
X-Google-Smtp-Source: ABdhPJzoO2sSiVYAeTFp6Xafg+M195gcnGBGyWqm7EBvLEW9UKTZpQq+/QC5jiS32PNmce7SBnexKg==
X-Received: by 2002:a17:902:fe10:: with SMTP id
 g16mr3514973plj.43.1596524916406; 
 Tue, 04 Aug 2020 00:08:36 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b22sm13846476pfb.52.2020.08.04.00.08.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 00:08:36 -0700 (PDT)
Date: Tue, 4 Aug 2020 00:08:25 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804070825.GB27658@Asurada-Nvidia>
References: <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
 <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
 <20200804070345.GA27658@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804070345.GA27658@Asurada-Nvidia>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Aug 04, 2020 at 12:03:46AM -0700, Nicolin Chen wrote:
> On Tue, Aug 04, 2020 at 12:22:53PM +0800, Shengjiu Wang wrote:
> 
> > > > Btw, do we need similar change for TRIGGER_STOP?
> > >
> > > This is a good question. It is better to do change for STOP,
> > > but I am afraid that there is no much test to guarantee the result.
> 
> > Maybe we can do this change for STOP.
> 
> The idea looks good to me...(check inline comments)
>  
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 1c0e06bb3783..6e4be398eaee 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -517,6 +517,37 @@ static int fsl_sai_hw_free(struct
> > snd_pcm_substream *substream,
> >         return 0;
> >  }
> > 
> > +static void fsl_sai_config_disable(struct fsl_sai *sai, bool tx)
> > +{
> > +       unsigned int ofs = sai->soc_data->reg_offset;
> > +       u32 xcsr, count = 100;
> > +
> > +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> > +                          FSL_SAI_CSR_TERE, 0);
> > +
> > +       /* TERE will remain set till the end of current frame */
> > +       do {
> > +               udelay(10);
> > +               regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
> > +       } while (--count && xcsr & FSL_SAI_CSR_TERE);
> > +
> > +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> > +                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
> > +
> > +       /*
> > +        * For sai master mode, after several open/close sai,
> > +        * there will be no frame clock, and can't recover
> > +        * anymore. Add software reset to fix this issue.
> > +        * This is a hardware bug, and will be fix in the
> > +        * next sai version.
> > +        */
> > +       if (!sai->is_slave_mode) {
> > +               /* Software Reset for both Tx and Rx */
> 
> Remove "for both Tx and Rx"
> 
> >                 /* Check if the opposite FRDE is also disabled */
> >                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> > +               if (sai->synchronous[tx] && !sai->synchronous[!tx] && !(xcsr & FSL_SAI_CSR_FRDE))
> > +                       fsl_sai_config_disable(sai, !tx);
> 
> > +               if (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> > +                       fsl_sai_config_disable(sai, tx);
> 
> The first "||" should probably be "&&".
> 
> The trigger() logic is way more complicated than a simple cleanup
> in my opinion. Would suggest to split RMR part out of this change.
> 
> And for conditions like "sync[tx] && !sync[!tx]", it'd be better
> to have a helper function to improve readability:
> 
> /**
>  * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
>  *
>  * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
>  * or Receiver's for both streams. This function is used to check if clocks of
>  * current stream's are synced by the opposite stream.

Aww..this should be a generic function, so drop "current":

  * or Receiver's for both streams. This function is used to check if clocks of
  * the stream's are synced by the opposite stream.

>  *
>  * @sai: SAI context
>  * @dir: direction of current stream

Ditto:
   * @dir: stream direction

Thanks.
-----
   
>  */
> static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
> {
> 	int adir = (dir == TX) ? RX : TX;
> 
> 	/* current dir in async mode while opposite dir in sync mode */
> 	return !sai->synchronous[dir] && sai->synchronous[adir];
> }
> 
> Then add more comments in trigger:
> 
> static ...trigger()
> {
> 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> 	int adir = tx ? RX : TX;
> 	int dir = tx ? TX : RX;
> 
> 	// ....
> 	{
> 		// ...
> 
> 		/* Check if the opposite FRDE is also disabled */
> 		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> 
> 		/*
> 		 * If opposite stream provides clocks for synchronous mode and
> 		 * it is inactive, disable it before disabling the current one
> 		 */
> 		if (fsl_sai_dir_is_synced(adir) && !(xcsr & FSL_SAI_CSR_FRDE))
> 			fsl_sai_config_disable(sai, adir);
> 
> 		/*
> 		 * Disable current stream if either of:
> 		 * 1. current stream doesn't provide clocks for synchronous mode
> 		 * 2. current stream provides clocks for synchronous mode but no
> 		 *    more stream is active.
> 		 */
> 		if (!fsl_sai_dir_is_synced(dir) || !(xcsr & FSL_SAI_CSR_FRDE))
> 			fsl_sai_config_disable(sai, dir);
> 
> 		// ...
> 	}
> 	// ....
> }
> 
> Note, in fsl_sai_config_disable(sai, dir):
> 	bool tx = dir == TX;
> 
> Above all, I am just drafting, so please test it thoroughly :)
