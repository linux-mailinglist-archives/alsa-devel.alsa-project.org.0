Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23232DEA02
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 12:47:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF73B166B;
	Mon, 21 Oct 2019 12:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF73B166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571654833;
	bh=MFSN+0RiY7xF86JCbkT6KXV2SGVEmj5KeSnQEgXF/Is=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UQzfSJjJRwcxcvfLAQO2AOYc4MfZLFAeG1aCHEShqij+VJJyYvgbRhzfVFq9eIBpQ
	 VC9ZiELUd0d9THSG3mq5BUHhA6eaD9tHBmjqz4IOBLxY8LoAGoo8KjUjn24zFyT6Dd
	 eLmc6OjJjS4iunCQ9Yy25rNDjGBmnvDeSpTyGEeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0961DF801EB;
	Mon, 21 Oct 2019 12:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27E2AF80368; Mon, 21 Oct 2019 12:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E852F801EB
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 12:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E852F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qJXdcRG7"
Received: from localhost (unknown [122.167.89.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47AFA2067B;
 Mon, 21 Oct 2019 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571654721;
 bh=sT9pX/gwU+CaMu7PFUa8JWcCjc7jIsrtA0yriKQl7V4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJXdcRG7Wsq3Us8fBuiMDP1bPQIkErXxegB3vUTy4+//Zqa7SPsGFmG56UcCw8D//
 hFBgW7sOi4kd975enHpyXSN2wUDVJb3acsykAxUAs1R8VMMNpC7T1R8qyMHhb7Z9xi
 oHSrV9f67Rj1aEyWPiRyp7AcqGTHpLwMSUhbEPRY=
Date: Mon, 21 Oct 2019 16:15:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191021104511.GD2654@vkoul-mobl>
References: <20191021095432.5639-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021095432.5639-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, tiwai@suse.com, broonie@kernel.org,
 Xiaojun Sang <xsang@codeaurora.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: compress: fix unsigned integer
	overflow check
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

On 21-10-19, 10:54, Srinivas Kandagatla wrote:
> From: Xiaojun Sang <xsang@codeaurora.org>
> 
> Parameter fragments and fragment_size are type of u32. U32_MAX is
> the correct check.

Acked-by: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Xiaojun Sang <xsang@codeaurora.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/core/compress_offload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 41905afada63..f34ce564d92c 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -528,7 +528,7 @@ static int snd_compress_check_input(struct snd_compr_params *params)
>  {
>  	/* first let's check the buffer parameter's */
>  	if (params->buffer.fragment_size == 0 ||
> -	    params->buffer.fragments > INT_MAX / params->buffer.fragment_size ||
> +	    params->buffer.fragments > U32_MAX / params->buffer.fragment_size ||
>  	    params->buffer.fragments == 0)
>  		return -EINVAL;
>  
> -- 
> 2.21.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
