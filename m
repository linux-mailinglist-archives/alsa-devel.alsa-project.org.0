Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D270D64F48
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 01:37:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1BE16B8;
	Thu, 11 Jul 2019 01:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1BE16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562801848;
	bh=/TjMOVwCQ1h0B7NsyWnkFy4nn1L+8GQ5XBuivDzP3I0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJpXgO0XW6Ky/eeVDKbKhz+/wX+1St7ERtpuyMgJs0YmuKCNxevTaCNqDPAXGfSpU
	 j6wrmMB4V1ETt7w+lTcRnqmAzbuQdyAR9+Q816bSo8xZ7yH1p4OgK2nfFEDfFJ+Pox
	 5yAbRWbaGQk041W4MyT0ZeSC114uNNexVHedMn6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DCDF802A1;
	Thu, 11 Jul 2019 01:35:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99422F802A1; Thu, 11 Jul 2019 01:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EB3FF801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 01:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB3FF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="brITT/5d"
Received: by mail-pg1-x52d.google.com with SMTP id i8so1949405pgm.13
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Fo3zNx7q8KOphF4/0k8ry1Exilbv+0XYzkMqa1pkdPw=;
 b=brITT/5d5a9WyodVg5ZUQsakATJo0F+/1F0NZxiiEO4WZQws6EdiwGGKUFKY2pt/Zo
 CYrZAOfPL/cCfxp3dHvE1aabIU8b7cgowtd3fXrrYR35j+w9wSFI4/MnhtzBbTlu/r6f
 JEKXEkQJ8j3TQqvb0K33a80yiZ+zyjPj5Z0pWmtYCvMAWLp/UJAgsVYiQ8MZ2pqd06Fp
 zjAAh5jbOtcdf3eu7kihy5eqVXw3cEWFA1QhWDw/g3HaPszaNu2XlkvfcZEoFxHBZ2vN
 4/RaulelQD0Ma3GGYGzUZGqEEk/VKTIwXHs0hbdk8/rAh81ECwzdFDbV1PeVNjYcWwM+
 vBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Fo3zNx7q8KOphF4/0k8ry1Exilbv+0XYzkMqa1pkdPw=;
 b=dNHCnJqgRCu9XXZTc1+Y7c91ukP/N8hhIhUESdw6nndCdfqFsYeG/GLV4yw64r6rUD
 AtrnaMmba6MvQUM2BuzQaK5lRWVjFCt+CWcXkP8y+QQVTALRlCjbMClIYKroPJS34mzm
 YwjzinLqFs/LGIwxWml3x/FeyQ0DVcK+PdPgHa93IAtlv5kMFI2Go7NWedBbpK77Nyba
 jvpoqODz1pxFBPEEeZE0hJmFVD0o5D8wl+NTbNCIg5Prt3n5KjOK48It8IdYpyNIg/Ix
 2x5p6oAsleiKXf6Kr4qgIlK0ddhn7SOrJiGWSRkTqKNBbDwoMB0wRrHfSTfw/29HpVQV
 /M5w==
X-Gm-Message-State: APjAAAXsJOjK5+rlXBXIpzwJDxY+z8oBhIwf9OkXpGcYi5Dy95ySiMWL
 0JXHs0EMgElFSxykGcNF/f0=
X-Google-Smtp-Source: APXvYqxyqTCbrq1xdCzkoYVL+c48dQADntW+6Bi3tN/r4jmGUpVWI/udlq43jQcwlgvVT5ebKnuk1w==
X-Received: by 2002:a17:90a:36e4:: with SMTP id
 t91mr1101282pjb.22.1562801735794; 
 Wed, 10 Jul 2019 16:35:35 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q1sm6318517pfn.178.2019.07.10.16.35.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jul 2019 16:35:35 -0700 (PDT)
Date: Wed, 10 Jul 2019 16:36:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com
Message-ID: <20190710233605.GA9886@Asurada-Nvidia.nvidia.com>
References: <cover.1562566531.git.shengjiu.wang@nxp.com>
 <a055d9d590124aad2de70e97266e50d2bae752c8.1562566531.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a055d9d590124aad2de70e97266e50d2bae752c8.1562566531.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH V3 2/2] ASoC: fsl_esai: recover the channel
 swap after xrun
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

Hi Shengjiu,

Mostly looks good to me, just some small comments.

On Mon, Jul 08, 2019 at 02:38:52PM +0800, shengjiu.wang@nxp.com wrote:
  
> +static void fsl_esai_hw_reset(unsigned long arg)
> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	u32 saisr, tfcr, rfcr;
> +	bool tx = true, rx = false, enabled[2];

Could we swap the lines of u32 and bool? It'd look better.

> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, ESAI_xCR_xPR);

Let's add a line of comments for these two:
	/* Enforce ESAI personal resets for both TX and RX */

> +	/*
> +	 * Restore registers by regcache_sync, and ignore
> +	 * return value
> +	 */

Could fit into single-line?

> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK, 0);
> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
> +			   ESAI_PRRC_PDC_MASK, ESAI_PRRC_PDC(ESAI_GPIO));
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
> +			   ESAI_PCRC_PC_MASK, ESAI_PCRC_PC(ESAI_GPIO));

Could remove the blank line and add a line of comments:
	/* Remove ESAI personal resets by configuring PCRC and PRRC also */

Btw, I still feel this personal reset can be stuffed into one
of the wrapper functions. But let's keep this simple for now.

> +	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);

Why do we read saisr here? All its bits would get cleared by
the hardware reset. If it's a must to clear again, we should
add a line of comments to emphasize it.

Thank you
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
