Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83B1A01D6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 01:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69491663;
	Tue,  7 Apr 2020 01:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69491663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586217005;
	bh=CkgHIQprh9YP35NkJjzLsMTP05q6TYwkweeq7yrJkuk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t4J0xWsTbfG4HAosFx1m9/lkJ5ga1hfMbkXWwkFqO0S3npxLQsLFfore+qJVbHOL9
	 ln1bRrih7ByoZ3PM1yKDyjlaYd55s2qAK6AoO+1Qha71isBNaMeipXNWCd8NCTu3r7
	 9F7dTg7LOtm/CZkPy221kDWGoA4XI6BQpAyNC3Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE774F80140;
	Tue,  7 Apr 2020 01:48:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D3CF80143; Tue,  7 Apr 2020 01:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE297F80140
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 01:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE297F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sK5Znhf+"
Received: by mail-pg1-x542.google.com with SMTP id g32so826909pgb.6
 for <alsa-devel@alsa-project.org>; Mon, 06 Apr 2020 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=psBSxuaBNWcdi2NVQndMbrRmw2QOSVTd4FihS4xTMPs=;
 b=sK5Znhf+DEGRMW9PNI6HsCghnazO3u7g0hr51W9/9isojiLKRVchov7ujMhuvk+wjA
 2UyAa7bidTy3ebHar7q9lCb9K5hfBqjbxwVu6RJYJNWCEYs998KAA/ccwQ5lHpvU9xK5
 n8zLnby7TbdOYK+kGmjyvzNUzF37cU2662HTXRFUFxmJY4FWhvofVewvcxT9zi1XLBit
 AoK40mxzLSXI+Pa94R3MmYxpgzvdOGOO+oPmq4oPveWUO3JlgG4EaM3ONIlVwKEfFLXC
 ol9xSkdhfYueNFiVAA+F0MijH0o4r0IPUsTuks1Ij43xYY/g8N1GEpXc2tTcDoG6U2Yp
 Ox6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=psBSxuaBNWcdi2NVQndMbrRmw2QOSVTd4FihS4xTMPs=;
 b=ZJrUHAYbVU2VvkrjwKr3Ka5NRZOyJCqFlYhlsq1vqZLxj5/q7T8xxdQobfbGYEUs+n
 IJv5sBECP3e5GlJx7cW9ie6BdqTZ/RBQd/pUOCkvRTpZyDPUIkdwkR9JtvsGDeD1qOuA
 bLQqdTTwnlP2AZLk57BJUgsCn3bG3XIIraNel5MSIPIAnGAHzPCRrPO4OKhtt4evLyHU
 8xd3OL56i6jiG/lg+nz8RhA5LosvINwsiExt0bMUn2717KE1d5vtG7otX3MYdhEnWXQI
 TbcrdBRKmwZn1VakCmggdZbP577IkSc5HMmNqdtTf+ZOogKsd+W8Bo9/eZEyUeiGTc+0
 yIqg==
X-Gm-Message-State: AGi0PuYxG44ylqKcA2b0BLmDq2acLYUwWURXR4j+ClRp6555sVGeI4dg
 oNF1fdfIa3wwNFscTM3fk3U=
X-Google-Smtp-Source: APiQypI465/ioBR3iYY/5HiEHM/tdrYAyoPeHWSHEtbZTA997lCuyYZm02hTkj/dL+M8Q+EoyZFZdA==
X-Received: by 2002:a62:7b84:: with SMTP id w126mr1923173pfc.202.1586216895626; 
 Mon, 06 Apr 2020 16:48:15 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w27sm12479257pfq.211.2020.04.06.16.48.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 16:48:15 -0700 (PDT)
Date: Mon, 6 Apr 2020 16:48:20 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
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

On Wed, Apr 01, 2020 at 04:45:38PM +0800, Shengjiu Wang wrote:

>  static int fsl_asrc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct fsl_asrc *asrc;
> +	struct fsl_asrc_priv *asrc_priv;

Could we move it before "struct fsl_asrc *asrc;"?

> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> new file mode 100644
> index 000000000000..5c93ccdfc30a
> --- /dev/null
> +++ b/sound/soc/fsl/fsl_asrc_common.h

> +#define PAIR_CTX_NUM  0x4
> +#define PAIR_PRIVAT_SIZE 0x400

"PRIVAT_" => "PRIVATE_"

> +/**
> + * fsl_asrc_pair: ASRC common data

"fsl_asrc_pair" => "fsl_asrc"

> + */
> +struct fsl_asrc {

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index b15946e03380..5cf0468ce6e3 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c

> @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
>  		return ret;
>  	}
>  
> -	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> +	pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);

If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
define in this file too, rather than in the header file.

And could fit 80 characters:

+	pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
