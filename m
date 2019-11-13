Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E24FBADD
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5892A1660;
	Wed, 13 Nov 2019 22:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5892A1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573680703;
	bh=b1rADQJjIqI0r/nUUzCkm0XmSeeeO9L8OTYtFbBje9k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eQCO1WfTL1nn48WAuCFztEtWoV8ICIoeik9O1gd6r7KwhR0MchOo5+0CpAcbh5P4p
	 2nXBGUfev3/b4GkjlC5/B07zb/b4MKNZs9XWBMeJAnZNMLVtEHSbB+AvJFOvi4d5a5
	 7jwPpsQCWQKWGbfphBDjn9/v5QqyENbVSle+6LLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C1B1F80084;
	Wed, 13 Nov 2019 22:29:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87D06F80086; Wed, 13 Nov 2019 22:29:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37577F8007E
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 22:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37577F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uY58BuYH"
Received: by mail-pf1-x441.google.com with SMTP id b19so2531556pfd.3
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 13:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AVqWPleKaz31XmHuM5Ar+WLW3xPppIUP+VoAlnFtLBw=;
 b=uY58BuYHB8vwpNFQzLSanEitfWdr1sIaJEBa/ZXgEaCMCR0/3DKmOvMRfQsyzmihsX
 zZz40DxW/ddhUtb/HBbeBAJYAo76JfnZFs9RYhC70nS8EPxvsJ5hDWRyin8MiNeb4zpm
 CojDvqLC5OAcBUFlepvACs7RRLbJopc+6cp6LW93+YyquBehtxfcVF4F9CCJjEIBbaV0
 pmgu6m/9du0C+uIHqW4LUs8TYM/tvVenFp//abs9ORws8Cu+D81AlGQ7glmA2iUMzoZW
 +UgL/36jDRb3kGLRMg54m5p+8ghrBjeDW7eBENqfxBZ+foBUi3PLtH0BGdp/SUf7Of+Z
 UxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AVqWPleKaz31XmHuM5Ar+WLW3xPppIUP+VoAlnFtLBw=;
 b=ZwW6s4xEzqTpc/1ZP7IMmUut95cQ4XAz0/TecGIE8kdSD8BA6m/dotnqy6oADXHRo7
 iztq3kXuoDU2MpaJQt92GUdBsKBVaK2vDk5qhcCgIIdowqwyokgR6KmtiOzV6mLUVKlq
 3GtURbdChy5W+gubwGQX0SkPyj+iFe9YjaEoJhJKzQGyNBvonOtHpUEvKjzghbowuaip
 /wf50p3lC39JcG0blaoWLdalCkXJMQPaaWS5mUahB40euSWVcuy/aVb755BtmvRlpAq9
 THH1XhsYJQZwUYzAo+eD80w610e69IQp9ZLbhcRD3Ef3X2mnAdFjfh5JnFX5OzevrbrL
 GsGw==
X-Gm-Message-State: APjAAAWR+h6M5oyFGtftxEPtylpREvQBBVK0ELgFhtqUfP4eM7FIgxS3
 COWuuZvD4q/dVQ5aFAcqotw=
X-Google-Smtp-Source: APXvYqy9XSFSBUmcN5u6GCN8pPVS5+DCHCUev3ISERx87mJ8d3APZRegPuspjAPxngMAq5PvUtPRHg==
X-Received: by 2002:a63:535c:: with SMTP id t28mr6226419pgl.173.1573680588338; 
 Wed, 13 Nov 2019 13:29:48 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id t12sm3519512pgv.45.2019.11.13.13.29.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 13 Nov 2019 13:29:46 -0800 (PST)
Date: Wed, 13 Nov 2019 13:27:44 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191113212743.GA2844@Asurada-Nvidia.nvidia.com>
References: <b1c922b3496020f611ecd6ea27d262369646d830.1573462647.git.shengjiu.wang@nxp.com>
 <3c3e59ae7adde852f133a5d7c2cbb2730362fc53.1573462647.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c3e59ae7adde852f133a5d7c2cbb2730362fc53.1573462647.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V3 2/2] ASoC: fsl_asrc: Add support for
	imx8qm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 11, 2019 at 05:18:23PM +0800, Shengjiu Wang wrote:
> There are two asrc module in imx8qm, each module has different
> clock configuration, and the DMA type is EDMA.
> 
> So in this patch, we define the new clocks, refine the clock map,
> and include struct fsl_asrc_soc_data for different soc usage.
> 
> The EDMA channel is fixed with each dma request, one dma request
> corresponding to one dma channel. So we need to request dma
> channel with dma request of asrc module.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Two small comments inline. Once they are addressed,

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
> changes in v2
> - use !use_edma to wrap code in fsl_asrc_dma
> - add Acked-by: Nicolin Chen
> 
> changes in v3
> - remove the acked-by for commit is updated
> - read "fsl,asrc-clk-map" property, and update table
>   clk_map_imx8qm.
> 
>  sound/soc/fsl/fsl_asrc.c     | 112 ++++++++++++++++++++++++++++-------
>  sound/soc/fsl/fsl_asrc.h     |  64 +++++++++++++++++++-
>  sound/soc/fsl/fsl_asrc_dma.c |  42 +++++++++----
>  3 files changed, 183 insertions(+), 35 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index a3cfceea7d2f..03de33de8633 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -964,14 +1001,33 @@ static int fsl_asrc_probe(struct platform_device *pdev)

> +	} else if (of_device_is_compatible(np, "fsl,imx8qm-asrc")) {

> +		ret = of_property_read_u32(np, "fsl,asrc-clk-map",
> +					   &map_idx);

This seems to fit a single line?

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index d6146de9acd2..f871fdb9d1c6 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -197,21 +197,37 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,

> +	/*
> +	 * For EDMA DEV_TO_DEV channel, we don't need to configure
> +	 * dma_request and dma_request2, we can get dma channel through
> +	 * dma_request_slave_channel directly.
> +	 * Compare with SDMA channel, EDMA channel is bound with dma
> +	 * request event of each peripheral, and it is fixed. Not like SDMA,
> +	 * the channel is allocated dynamically. So when DMA is EDMA, we
> +	 * can only get EDMA channel through dma-names of Front-End device.
> +	 */

Just trying to make it concise :)

+	/*
+	 * An EDMA DEV_TO_DEV channel is fixed and bound with DMA event of each
+	 * peripheral, unlike SDMA channel that is allocated dynamically. So no
+	 * need to configure dma_request and dma_request2, but get dma_chan via
+	 * dma_request_slave_channel directly with dma name of Front-End device
+	 */
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
