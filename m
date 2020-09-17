Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F226CFD9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 02:15:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68C91663;
	Thu, 17 Sep 2020 02:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68C91663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600301716;
	bh=NFaAiARGmidn3iBhN9kwjaOf+pzetV6y7aACB8sH+MQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0ioOhOTmWF0+4/qlA0QzKwi2ooCU6dmOH2XNbfaoiNJEy2vOmbA/9OpLjVXZlSox
	 UOGNa64dAOafQpHVVQyI89o+DAP8QdsltDZn3cejTcZvJ3dQ8TcEmGPjTxpGYRcvFU
	 n0s3+x+3yl/4+T1Z8OvQBTX4uXHJFNA7hpQt6lqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 053A8F800BB;
	Thu, 17 Sep 2020 02:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D72BF8015A; Thu, 17 Sep 2020 02:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC609F800BB
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 02:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC609F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JC1Ik0dT"
Received: by mail-pg1-x542.google.com with SMTP id l191so299150pgd.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 17:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+L8r3i/llwp2Lmso2SJhe/RRr10LqwB0/nAV4JJW3s0=;
 b=JC1Ik0dTH25FUvJr+6hQ7ANFLhd84ikfThn/lnDI9H6v+KmSh8y0R5+6RDmpkXDNoS
 jrGyTNd/bMGzTyUALXM20m2tIv1i0eg2jUdFyK5P1SP0X1eKadn1e53/JCTcczHht8Z8
 3SgmdZ3PDrm1nhNNjoy0+mbFThR122+YFS83dknywKFKv9eft48bVcHo97iDUnvKjQzR
 9mhS4X/C3QT5FAPN8Vu0N7pwTZrrKxsQucrlMVaMsKXNWbHHWnymjZPby2YiyH2JGA1k
 GqL1mt9mdVOg/XNUiV/CMMVIOl0qCHSxIAn2tPIQLJ8fcW/pLs6o8WW1cpDbaV85nNVI
 Qe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+L8r3i/llwp2Lmso2SJhe/RRr10LqwB0/nAV4JJW3s0=;
 b=tRwY3FeJAnFDhOo62H1nq5t8HkkB6wqce+l8XDPSQOesR7A7WVgoFaySIfvmqA6Cp6
 S6rCJNJ8Lj37ZKVV1WquS2A0giKXEhpzXoGv94lomXKpNo6X3fyXUCbESNaAaHO0qVrP
 UcyYyTddGvB87iakQWZh3u7EQc3yhEbws76D/SgtwUhLj4ZKOotVv1PhZ8rqAmgQ3pRX
 KZRkUy4QMIOJbMgiZkNmevp0FLiCYQpB+8WijUk0NI5EON6qh4ogA9vlJ1+wJQYAaX7A
 4IazbsMh1t57R+mNud3mtQ4FkQAfEdfnrFE3pNP9dwF5i278UbRiiVZWcB7T2tq4m2K0
 jVrg==
X-Gm-Message-State: AOAM532zuso0taz8N3THOHr7+t3pcB4n4u5KggjhjLg1cogYCNZsJqZt
 AZQcwjDNlxtaBH9aBaJ4Qi8=
X-Google-Smtp-Source: ABdhPJwyRANoUnW2/ZYlnK9c+pZ3xu+Veuc7MK+f2qzGVSCXe5EsIqJOkORlG6/DMUY0bn9nyBY02g==
X-Received: by 2002:a62:10a:0:b029:142:2501:39e1 with SMTP id
 10-20020a62010a0000b0290142250139e1mr8640542pfb.48.1600301600950; 
 Wed, 16 Sep 2020 17:13:20 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z4sm18491615pfr.197.2020.09.16.17.13.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 17:13:20 -0700 (PDT)
Date: Wed, 16 Sep 2020 17:10:08 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_audmix: make clock and output src write only
Message-ID: <20200917001007.GA22566@Asurada-Nvidia>
References: <1600104274-13110-1-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600104274-13110-1-git-send-email-viorel.suman@oss.nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel@vger.kernel.org
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

On Mon, Sep 14, 2020 at 08:24:34PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> "alsactl -f state.conf store/restore" sequence fails because setting
> "mixing clock source" and "output source" requires active TDM clock
> being started for configuration propagation. Make these two controls
> write only so that their values are not stored at "alsactl store".
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_audmix.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index a447baf..7ad5925 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -199,10 +199,18 @@ static int fsl_audmix_put_out_src(struct snd_kcontrol *kcontrol,
>  
>  static const struct snd_kcontrol_new fsl_audmix_snd_controls[] = {
>  	/* FSL_AUDMIX_CTR controls */
> -	SOC_ENUM_EXT("Mixing Clock Source", fsl_audmix_enum[0],
> -		     snd_soc_get_enum_double, fsl_audmix_put_mix_clk_src),
> -	SOC_ENUM_EXT("Output Source", fsl_audmix_enum[1],
> -		     snd_soc_get_enum_double, fsl_audmix_put_out_src),
> +	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = "Mixing Clock Source",
> +		.info = snd_soc_info_enum_double,
> +		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
> +		.put = fsl_audmix_put_mix_clk_src,
> +		.private_value = (unsigned long)&fsl_audmix_enum[0] },
> +	{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name = "Output Source",
> +		.info = snd_soc_info_enum_double,
> +		.access = SNDRV_CTL_ELEM_ACCESS_WRITE,
> +		.put = fsl_audmix_put_out_src,
> +		.private_value = (unsigned long)&fsl_audmix_enum[1] },
>  	SOC_ENUM("Output Width", fsl_audmix_enum[2]),
>  	SOC_ENUM("Frame Rate Diff Error", fsl_audmix_enum[3]),
>  	SOC_ENUM("Clock Freq Diff Error", fsl_audmix_enum[4]),
> -- 
> 2.7.4
> 
