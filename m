Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52E25B9EA
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 06:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8438E18C5;
	Thu,  3 Sep 2020 06:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8438E18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599108621;
	bh=xUN/KEIOO4iwgVPaPQrHDkQ9DyzJ78QljMI623UURTY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDKIxHN9Uy+pLvzd4Mrm2xzsmDoEGTGO1ecylawpabGUApnvdwYWJJyx7hFVbqedU
	 j1j1UH2GSpvkiycQId5GuXIy1w4aOl0jDCkiualmgEAWP+yDLx0vdPcT5UjQ6yGFLB
	 XGt94mD1eAjL6P39PNtVwopBxD4nO0LQGpIMBsLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B8CF8021D;
	Thu,  3 Sep 2020 06:48:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B512F80278; Thu,  3 Sep 2020 06:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3346AF8021D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 06:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3346AF8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k56V4zjO"
Received: from localhost (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9E4420758;
 Thu,  3 Sep 2020 04:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599108474;
 bh=xUN/KEIOO4iwgVPaPQrHDkQ9DyzJ78QljMI623UURTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k56V4zjOU2jV2CXTkdtp+1YrI/IuAbDxN9M5fkVV2ub04/O79eOGt0hoXzku5rCeB
 uqDeqDTsxmC5eHy3lzwkBfaiCWQg0Bb7ps6vwauMnMWn3mF18SN5W4IRXgbS0VzKKI
 8HmyWjZbd+5uwU1z1hiqTmdvTPq7syhHU/vCD6Ig=
Date: Thu, 3 Sep 2020 10:17:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 06/18] ALSA: compress_offload: dereference after checking
 for NULL pointer
Message-ID: <20200903044750.GD2639@vkoul-mobl>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
 <20200902212133.30964-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902212133.30964-7-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On 02-09-20, 16:21, Pierre-Louis Bossart wrote:
> Fix cppcheck warning and only dereference once the initial checks are
> done:
> 
> sound/core/compress_offload.c:516:38: warning: Either the condition
> '!stream' is redundant or there is possible null pointer dereference:
> stream. [nullPointerRedundantCheck]
>  struct snd_compr_runtime *runtime = stream->runtime;
>                                      ^
> sound/core/compress_offload.c:518:17: note: Assuming that condition
> '!stream' is not redundant
> if (snd_BUG_ON(!(stream) || !(stream)->runtime))
>                 ^
> sound/core/compress_offload.c:516:38: note: Null pointer dereference
>  struct snd_compr_runtime *runtime = stream->runtime;
>                                      ^

Acked-By: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/core/compress_offload.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 0e53f6f31916..e3eb314acb10 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -513,10 +513,11 @@ EXPORT_SYMBOL(snd_compr_malloc_pages);
>  
>  int snd_compr_free_pages(struct snd_compr_stream *stream)
>  {
> -	struct snd_compr_runtime *runtime = stream->runtime;
> +	struct snd_compr_runtime *runtime;
>  
>  	if (snd_BUG_ON(!(stream) || !(stream)->runtime))
>  		return -EINVAL;
> +	runtime = stream->runtime;
>  	if (runtime->dma_area == NULL)
>  		return 0;
>  	if (runtime->dma_buffer_p != &stream->dma_buffer) {
> -- 
> 2.25.1

-- 
~Vinod
