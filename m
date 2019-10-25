Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEEE55A8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 23:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72DF018B6;
	Fri, 25 Oct 2019 23:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72DF018B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572037949;
	bh=BW+A0UHSF1WbDUYsdY9c4U6zjEX7HPWkE6jflGIn1mw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bx+uroxhLuYjeL0cdEeYDT7/8dZWSW9A+b/tuffxMjNAUJjK5sEoOgHwOS3glhFgS
	 brnW5RWE2E/Au2Efn7MZjaGitIkz5T8hdzIrTi+TSSUCKr1yxwdnepii8uFW5W9+Jq
	 CAvnGqy0/h3l1p45rZ1q5kUoRvnFuAc44+7cPi9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38042F80274;
	Fri, 25 Oct 2019 23:10:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87695F8036F; Fri, 25 Oct 2019 23:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDEA8F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 23:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDEA8F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M9n9pfj8"
Received: by mail-pf1-x443.google.com with SMTP id b25so2380622pfi.13
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4SQYqLXX0XdL1+ct2NCqP0blLyo4HQV7tsLhnLw7hQs=;
 b=M9n9pfj8q7l6P50lkgGdxZehMpVLDK8ZmI6h116XJC4/64SSNK/YYVX+xv3DRF2ivG
 Zzgg3mBivr6x3cWPjemy+EWNbPRXm/iIW8aNbCrb94Ls9MlU5jU/jb0mn3yNCTdBo9Wa
 GmH4WJ6y/7gjeq5BRvdgW8izUhckGGyiGd6AsuGFEcjVRuFiy4McVtTy2Z+/FH/qAd80
 pmDXrACAkqPxzboLhwXjbCgOhhFJ9jplmG2pc5ZjNF2ksSd46aYvZ0QbZ6CgvzGvsiCH
 EPNUqMYwahXzG8Vj/dr8l6pm6uxAspTidvfzU2fWuZvxPsaWFfUfz3wbEzJum84O0QfG
 vMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4SQYqLXX0XdL1+ct2NCqP0blLyo4HQV7tsLhnLw7hQs=;
 b=UF3eS/ztzks1Axyq/LY6ZvgFaOP5CL+Sjp0NR9N2PRRHp4DiFE4DUF1wfRvS3k04nf
 Gac0zstK+Ca5QY8000KdnsRXtMAviwxZS/NkMlxPo3tzPXbjWsjn7UYgJf95lLJtm5Qr
 3SGaEqMgEgvsVbgMup4iSbO6VMeD/OzBGpuImy9WG5fFSzlbo8Dd6iHfcAWyI2LhHZZR
 gQD5RX7ot4vPaYSY8fMQJWuauv+wcwdFvLBR1HYnUvQnFiKtRMS4FBPAMxiIlwx1qsQF
 Rs1AW1dc15kLcxqpFwqS01zsDv9K4KRX3aTV9zhGGiQXb9tUr6/NG2CIdv6aJJ1io60H
 h8EA==
X-Gm-Message-State: APjAAAVQEKGjyaz+Vxjp4MvOW6PnMCE+XGaqQLen50NyUnDj36hjvF0O
 JXE7XJlZirMT3dfyz7uXHg0=
X-Google-Smtp-Source: APXvYqzzjTnv2D4OYrUqWzMN8fCAnpjvEbjHAwrTNhaiVf/2Enfk58DhQ/EGZoxwOZADuV5bHAi7cw==
X-Received: by 2002:a63:e056:: with SMTP id n22mr6675498pgj.73.1572037836935; 
 Fri, 25 Oct 2019 14:10:36 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z13sm3550450pfg.172.2019.10.25.14.10.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Oct 2019 14:10:36 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:10:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191025211013.GA15101@Asurada-Nvidia.nvidia.com>
References: <36e1d0157d2b71985b88e841d416d04c584c04fe.1571986436.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36e1d0157d2b71985b88e841d416d04c584c04fe.1571986436.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2] ASoC: fsl_esai: Add spin lock to
 protect reset, stop and start
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

On Fri, Oct 25, 2019 at 03:13:53PM +0800, Shengjiu Wang wrote:
> xrun may happen at the end of stream, the
> trigger->fsl_esai_trigger_stop maybe called in the middle of
> fsl_esai_hw_reset, this may cause esai in wrong state
> after stop, and there may be endless xrun interrupt.
> 
> This issue may also happen with trigger->fsl_esai_trigger_start.
> 
> So Add spin lock to lock those functions.
> 
> Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Some small comments inline. Once they are addressed, please add:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
> Change in v2
> -add lock for fsl_esai_trigger_start.
> 
>  sound/soc/fsl/fsl_esai.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 37b14c48b537..9b28e2af26e4 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -33,6 +33,7 @@
>   * @fsysclk: system clock source to derive HCK, SCK and FS
>   * @spbaclk: SPBA clock (optional, depending on SoC design)
>   * @task: tasklet to handle the reset operation
> + * @lock: spin lock to handle reset and stop behavior

Should be "between hw_reset() and trigger()" now.

>   * @fifo_depth: depth of tx/rx FIFO
>   * @slot_width: width of each DAI slot
>   * @slots: number of slots
> @@ -56,6 +57,7 @@ struct fsl_esai {
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
>  	struct tasklet_struct task;
> +	spinlock_t lock; /* Protect reset and stop */

We can drop the comments here since you add it to the top.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
