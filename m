Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B91A70D0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 04:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8A215E5;
	Tue, 14 Apr 2020 04:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8A215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586830168;
	bh=Pd/p6F3bk8BOSZMkbRBN/QwFdBwVkvp1mX441KkYcBE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcXxgZCDbix8TMyGuMyvR3zdgM12d+AzryB4xu0MJq1gc1jqNOrRIAW+sczq50SM9
	 hTxpQEPIR3/mGMZqeI1EGtP4c4Bb/Ga4g2YVoOJaOee0uit856Nn4abhHmsSUSmlsJ
	 bTUbpD+yMq/jXqednXYI6mxDDWGI+1OiJonsia4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C29F80126;
	Tue, 14 Apr 2020 04:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2C69F8013D; Tue, 14 Apr 2020 04:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322C0F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 04:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322C0F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QqZbwjSj"
Received: by mail-pg1-x544.google.com with SMTP id g6so5321186pgs.9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5D/iZIZkZcDpS6kx/415RbCsRqRRwuRfxlRc0sHly4Y=;
 b=QqZbwjSjtSQpz3SlpqPldzbuhg+pariHVz063YbZ4QNr9Xz+hN6U5IXK6wCVyWLIv1
 oPKQ3EOsiwcSEXmEFvumckWdvyrHCNQ1pGubuZyHL6nP8oEhqyz6es8MI3/8nNZU5kk6
 vk+dFx8JFF93z87qrdOLMMGMSWOjEgD3ZPnOI/IUC+qVep5mOB9514q6OHOBmfT/B/vf
 okKTY4rNaBuRlKmOTYoF2/dRnATUq8OfPh5ML382ZwzwMhAuaJkut+dapH9nOuhGVCUc
 Qh/ZQsfd4d2EGHx1rgk2GmFcKtnBbSzVgSL+TQiWtxoxwnKTLZIo5/yj4qJKGHsftFzY
 YAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5D/iZIZkZcDpS6kx/415RbCsRqRRwuRfxlRc0sHly4Y=;
 b=aJmaI1oM377Ko+tAXPaOQs+IYg2lv9YPeuCPG0SUrkoDqXO2AisjE0xUSRe9q0cj4Z
 OVRHYYJgkQj9E5YAZg9I/CFCvoIIfExqZUrfjafo4zlzDXZDexEpJPerh3F7MY5R7d2e
 PiouKTjZ2vGEQusY4BchwYkaFJ47paSQRQk7RnjZm4B38DL3DTsS7wj55wuM1a5wJFEm
 iW4Os/bMfbHJLNHTNV1KawYSW3nPaXyzzU5oDY4/hG4vnN5tars3ImbdxEhLePpsSwDy
 ohU5tvflaoXUJdJS8xqzTrOoKefSXII7QwzoHGHNBDcG+lZmd4Ki1p4YHwAlrx1GRfvd
 KkKg==
X-Gm-Message-State: AGi0Pualp5nGmQnze9/Viodw12HClecfHoqjFntVPMmaY2cWaUS6Y/jy
 A1RyB0xMfYh16VgZ+M1Uvi4=
X-Google-Smtp-Source: APiQypLK639UxIA+FT+5Ot/3qPNoOsaHuQJ8finTEvj7k/GdLBDOknElzhbA4HM7L3jjPzj13KJKYA==
X-Received: by 2002:a63:5d7:: with SMTP id 206mr8048114pgf.136.1586830058811; 
 Mon, 13 Apr 2020 19:07:38 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y71sm9900161pfb.179.2020.04.13.19.07.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 19:07:38 -0700 (PDT)
Date: Mon, 13 Apr 2020 19:07:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v7 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
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

On Tue, Apr 14, 2020 at 08:43:07AM +0800, Shengjiu Wang wrote:
> There is a new ASRC included in i.MX serial platform, there
> are some common definition can be shared with each other.
> So move the common definition to a separate header file.
> 
> And add fsl_asrc_pair_priv and fsl_asrc_priv for
> the variable specific for the module, which can be used
> internally.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> +static size_t fsl_asrc_get_pair_priv_size(void)
> +{
> +	return sizeof(struct fsl_asrc_pair_priv);
> +}

Perhaps we haven't understood completely each other's point.

Yet, would the following change work?

> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> new file mode 100644
> index 000000000000..b15244e027d0
> --- /dev/null
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> +struct fsl_asrc {
> +	size_t (*get_pair_priv_size)(void);

+	size_t pair_priv_size;

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> @@ -992,25 +1012,32 @@ static int fsl_asrc_probe(struct platform_device *pdev)
> +	asrc->get_pair_priv_size = fsl_asrc_get_pair_priv_size;

+	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
>  		return ret;
>  	}
>  
> -	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> +	pair = kzalloc(sizeof(*pair) + asrc->get_pair_priv_size(), GFP_KERNEL);

+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
