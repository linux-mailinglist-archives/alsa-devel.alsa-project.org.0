Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D7523B559
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 09:05:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54193166A;
	Tue,  4 Aug 2020 09:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54193166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596524757;
	bh=6R2qgO+u8lXe+cmrLzissgZfSSzypC1b6ThYU9HzWOQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CQz7KVtqcTcKZTkmjD/Uf0rYKoE8RMwUWmne2Ta3TfA02LuQCTmh5zljiUQfEXqp9
	 jqNKV+yTNGFfOrC05t5h4BDEqN8oJT6kmfLZbcsaGfPQL25kf78YJVj8olAGeWsBA3
	 kt42mf/uxAD2PcuClmh0w3TSO3mWAGdALgHdDOhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC285F80148;
	Tue,  4 Aug 2020 09:04:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B03F80150; Tue,  4 Aug 2020 09:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D04FCF80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 09:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D04FCF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="las3ya+y"
Received: by mail-pf1-x442.google.com with SMTP id d22so1347834pfn.5
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 00:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7rgf9ZDWcgim9KmP/Dkpn+5XAX3gGbMuw5yC7kTtCN0=;
 b=las3ya+yQ5IzlPU9pUDteEf6iEenUhEN9huaguWQhjgL9LmtNWPSSHbzR4rmZkoIyt
 as2mWRlW3SwqwryRDMWqySjxdUVG1JQlVQ/IA3Bw7ZnyxAi7OClmjj/PJ+WImZrCg1dt
 sf58RJLyY3tb2u/w9Pmj2ZQRfvHJ7p8Y2rzkVXq+EESnS1UV3LWTqlJauLd5bSyYEQ3S
 kFbPKPadP8ehIUbeJr68HapO9KfCrgEnwTwkrUtfUzgQ1byahZobh7TEVhltolX9MzJ1
 nKAP2Gy5U/BgAEu2DWhHOBjGXdYjXBUZ7tn3T6eMTA8ub3ekiajMiJdqe4JQe2k0qDey
 dvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7rgf9ZDWcgim9KmP/Dkpn+5XAX3gGbMuw5yC7kTtCN0=;
 b=WhnjWFQv757kvvpUh5sxJLUs3pZyszi76YRvuwnraCZ0fF+ZJXYqiFFazVf/oSG9Q8
 Qj9L7Z1BB/v/5DSclBlwH80r4qnLwsk7MJ0IHmrDCJ8sjabZvsnTAFkAXWVOoSxYLUKj
 0rvI698ZaPkEJhr8LnNrkiDt8euX8ssWecpbMQwiWR2+JXNfyHsbqNujfTO5oTEVApTJ
 MPRBVldcFZskqM7qY+zeiYEx2Sl59ABe0u51mAjBhHEouGIh36GMV0ioeAOuU1myeiGc
 6lApMriT/G6glv2briYL5BgVkjVEn53SAYjLV1aXom6wD5iBU18n+lKEiIqZge3fy48L
 +e+g==
X-Gm-Message-State: AOAM532Srqx9YcSVUqVo/kD1/jvgQh/X2tZMWzfbQrkNg1cuQadZ/33P
 VBgIFdhKwqGj0txxseKcJmo=
X-Google-Smtp-Source: ABdhPJyolTMgvR6vhnnh/ll6ddmuWsu5pD8jeTYjHz/0KNZQ5ZkQwrcoeX1i+fEFcE8Sy5vBkJtMHg==
X-Received: by 2002:a65:6447:: with SMTP id s7mr18478361pgv.320.1596524639650; 
 Tue, 04 Aug 2020 00:03:59 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id 77sm21698139pfx.85.2020.08.04.00.03.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 00:03:59 -0700 (PDT)
Date: Tue, 4 Aug 2020 00:03:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804070345.GA27658@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
 <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
 <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AP=27SdR68T-LiQHkJ0_dJaqtgcS-oi9d8arUzvTz5GwA@mail.gmail.com>
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

On Tue, Aug 04, 2020 at 12:22:53PM +0800, Shengjiu Wang wrote:

> > > Btw, do we need similar change for TRIGGER_STOP?
> >
> > This is a good question. It is better to do change for STOP,
> > but I am afraid that there is no much test to guarantee the result.

> Maybe we can do this change for STOP.

The idea looks good to me...(check inline comments)
 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 1c0e06bb3783..6e4be398eaee 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -517,6 +517,37 @@ static int fsl_sai_hw_free(struct
> snd_pcm_substream *substream,
>         return 0;
>  }
> 
> +static void fsl_sai_config_disable(struct fsl_sai *sai, bool tx)
> +{
> +       unsigned int ofs = sai->soc_data->reg_offset;
> +       u32 xcsr, count = 100;
> +
> +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> +                          FSL_SAI_CSR_TERE, 0);
> +
> +       /* TERE will remain set till the end of current frame */
> +       do {
> +               udelay(10);
> +               regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
> +       } while (--count && xcsr & FSL_SAI_CSR_TERE);
> +
> +       regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> +                          FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
> +
> +       /*
> +        * For sai master mode, after several open/close sai,
> +        * there will be no frame clock, and can't recover
> +        * anymore. Add software reset to fix this issue.
> +        * This is a hardware bug, and will be fix in the
> +        * next sai version.
> +        */
> +       if (!sai->is_slave_mode) {
> +               /* Software Reset for both Tx and Rx */

Remove "for both Tx and Rx"

>                 /* Check if the opposite FRDE is also disabled */
>                 regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
> +               if (sai->synchronous[tx] && !sai->synchronous[!tx] && !(xcsr & FSL_SAI_CSR_FRDE))
> +                       fsl_sai_config_disable(sai, !tx);

> +               if (sai->synchronous[tx] || !sai->synchronous[!tx] || !(xcsr & FSL_SAI_CSR_FRDE))
> +                       fsl_sai_config_disable(sai, tx);

The first "||" should probably be "&&".

The trigger() logic is way more complicated than a simple cleanup
in my opinion. Would suggest to split RMR part out of this change.

And for conditions like "sync[tx] && !sync[!tx]", it'd be better
to have a helper function to improve readability:

/**
 * fsl_sai_dir_is_synced - Check if stream is synced by the opposite stream
 *
 * SAI supports synchronous mode using bit/frame clocks of either Transmitter's
 * or Receiver's for both streams. This function is used to check if clocks of
 * current stream's are synced by the opposite stream.
 *
 * @sai: SAI context
 * @dir: direction of current stream
 */
static inline bool fsl_sai_dir_is_synced(struct fsl_sai *sai, int dir)
{
	int adir = (dir == TX) ? RX : TX;

	/* current dir in async mode while opposite dir in sync mode */
	return !sai->synchronous[dir] && sai->synchronous[adir];
}

Then add more comments in trigger:

static ...trigger()
{
	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
	int adir = tx ? RX : TX;
	int dir = tx ? TX : RX;

	// ....
	{
		// ...

		/* Check if the opposite FRDE is also disabled */
		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);

		/*
		 * If opposite stream provides clocks for synchronous mode and
		 * it is inactive, disable it before disabling the current one
		 */
		if (fsl_sai_dir_is_synced(adir) && !(xcsr & FSL_SAI_CSR_FRDE))
			fsl_sai_config_disable(sai, adir);

		/*
		 * Disable current stream if either of:
		 * 1. current stream doesn't provide clocks for synchronous mode
		 * 2. current stream provides clocks for synchronous mode but no
		 *    more stream is active.
		 */
		if (!fsl_sai_dir_is_synced(dir) || !(xcsr & FSL_SAI_CSR_FRDE))
			fsl_sai_config_disable(sai, dir);

		// ...
	}
	// ....
}

Note, in fsl_sai_config_disable(sai, dir):
	bool tx = dir == TX;

Above all, I am just drafting, so please test it thoroughly :)
