Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B450D25B953
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 05:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3907418AF;
	Thu,  3 Sep 2020 05:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3907418AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599104576;
	bh=RNBo5aazOP7jvlyL/Hrlefcd0rUPVHb1lnex+OxmZ6I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PURFJHQacOpnjYG3j5/hg3ZsjzCwugHTnN88R9oY4Q790xeKAGDkw0gPLRK0OM/PH
	 pPV7d3fjPlPkWPWLyr9pas2/da7GcHXFf1zVfstujEeGqrn86puyK7hWOWR8YFk4gq
	 FB9+guWJCP4+FbFb5Uc8tVbVICnuz1cfsYKU7znU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60DEDF800BA;
	Thu,  3 Sep 2020 05:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F34F80217; Thu,  3 Sep 2020 05:41:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B31C2F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 05:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B31C2F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lvyXWN2O"
Received: by mail-pg1-x541.google.com with SMTP id l191so976844pgd.5
 for <alsa-devel@alsa-project.org>; Wed, 02 Sep 2020 20:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZBeaj4GslqMe7lBSDn/HfENqDsSeU06fhFfemnqQHrs=;
 b=lvyXWN2OCgC6gJzpb3Z1iQXwUlrghIjBMO3LVlTBotvEtrri2tbmSI+QbAcu9NNk+3
 xD8WkDH7VB8w5fWoJFXkRBzc6PwVWRVy2CJUBQwZYa+AHVfTiful/lvI21qyMGPcvK9M
 fRdJGomPzh9cVQIQcRRGEZqV+JcnfruIZJ3P2I0lLoNGHtL0uSEONY/cCPrIpb/ZMLMr
 fYLJRqg+xeZaD6sTMJmxwfsj5i+S8j0b7uUkgTEuoWYkV32rXAgx8QfhbHwd2EwLMx7R
 FqSaz/cd0d69vDp4XhTzuBrNYbnu0CwDJ7pkkTdVqAWh2TN8FU2N43NAbqKJ9hYpBixf
 YZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZBeaj4GslqMe7lBSDn/HfENqDsSeU06fhFfemnqQHrs=;
 b=In4sxDFmanWCJ8MSbGEJXbdjcUCbLN8XOC27sUQt3tI4e8KoMQRLHwlz5LvtrrP8yP
 LTzacSQ1nPH3p7TSj26n/tyLOMxPbUyFaZRIKUfk/2JCnwLMw3uDSjwhi8wWE0Qq6sEP
 m46qH5vlMwXwRXlL48lvVKw8Bt2AGjIk5Xocyj+pZPSlzgQZ2Jty3OkS6vv0FFgHcr5Y
 TVTgYUZssy2yyxtBtLytevGBycyBu2nnmWcJ1DwnreAmabc15pU91R90xkt+asg3s5IJ
 vzeQ5P4VhnZ0/Qg6T4AfHUrr/lbtArPHOzkt+AjgYBRZDoXUBg9EAs0oIx/7lbnI4Bed
 RwQg==
X-Gm-Message-State: AOAM532RBs83CpLhG/k27olXjGorq/7ao0yy97C/mwVm/PwudwvoGpiN
 seGnoOUJDl6E5g9xJ3nhQuk=
X-Google-Smtp-Source: ABdhPJya4MbfYMPJGamccyeZvWUKTgUg99OxovxOa46VtlzI1OXbxU1wx4FTT7tNScnfNz4lR9HKCg==
X-Received: by 2002:a63:4a09:: with SMTP id x9mr1069530pga.291.1599104463748; 
 Wed, 02 Sep 2020 20:41:03 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 187sm1067061pfx.174.2020.09.02.20.41.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Sep 2020 20:41:03 -0700 (PDT)
Date: Wed, 2 Sep 2020 20:40:19 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to Output Mode
Message-ID: <20200903034018.GC4517@Asurada-Nvidia>
References: <1599102555-17178-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599102555-17178-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, Sep 03, 2020 at 11:09:15AM +0800, Shengjiu Wang wrote:
> Transmit data pins will output zero when slots are masked or channels
> are disabled. In CHMOD TDM mode, transmit data pins are tri-stated when
> slots are masked or channels are disabled. When data pins are tri-stated,
> there is noise on some channels when FS clock value is high and data is
> read while fsclk is transitioning from high to low.
> 
> Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Though one nit inline:

> ---
>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++--
>  sound/soc/fsl/fsl_sai.h |  2 ++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 62c5fdb678fc..33b194a5c1dc 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -486,6 +486,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
>  
>  	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
>  
> +	/* Output Mode - data pins transmit 0 when slots are masked
> +	 * or channels are disabled
> +	 */

Coding style for multi-line comments. Yet, probably can simplify?

	/* Set to output mode to avoid tri-stated data pins */
