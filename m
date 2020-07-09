Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772F21A4E0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C111662;
	Thu,  9 Jul 2020 18:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C111662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312409;
	bh=hFgiIkIvE1j+4z+8aX5vg0ZjeRPYb5xwS1rXFMdxsto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kuA5gLlr3YuGgvn+aFyfsaofc44OYYfpyeIfB6i2goMPCis0m14UErUZE72T2t3t5
	 ueI+jlo6wWKs5jwpYtyT4RKhM70uX9yTOdznQw7YWPhJJARlmc+NuyxPZMqti7fYfi
	 xBLQgNX3J7lzamdESrfGIdjgU7YaXYb/uUgpLeWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00B2F802DD;
	Thu,  9 Jul 2020 18:28:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15F97F802DF; Thu,  9 Jul 2020 18:28:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5A18F80274
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A18F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UT1xEk7Q"
Received: from embeddedor (unknown [201.162.245.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3248207F9;
 Thu,  9 Jul 2020 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594312074;
 bh=hFgiIkIvE1j+4z+8aX5vg0ZjeRPYb5xwS1rXFMdxsto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UT1xEk7QWFuEjMQtyZY5+Ar5G8JXRTSli6nQ6eSX69NLSXyzIcCMxnINoJDWSVw9C
 PE55Blo+I12SLMs7jE2D79LWl6x/jQMM5l9h9UpCQ/1L6ags3hLaXkKw0km4kaSuLK
 kC5uBsUEEwl4cSjzVTx/w9xD/XwLUD4tLJIoeia8=
Date: Thu, 9 Jul 2020 11:33:26 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/3] ALSA: atmel: Remove invalid "fall through" comments
Message-ID: <20200709163326.GC15020@embeddedor>
References: <20200709111750.8337-1-tiwai@suse.de>
 <20200709111750.8337-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709111750.8337-2-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org
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

On Thu, Jul 09, 2020 at 01:17:48PM +0200, Takashi Iwai wrote:
> The comments about fall through in sound/atmel/ac97.c are just
> superfluous and rather confusing.  Let's remove them.
> 

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/atmel/ac97c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index a62f1cdad68f..1006458f7f85 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -219,7 +219,7 @@ static int atmel_ac97c_playback_prepare(struct snd_pcm_substream *substream)
>  	switch (runtime->format) {
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		break;
> -	case SNDRV_PCM_FORMAT_S16_BE: /* fall through */
> +	case SNDRV_PCM_FORMAT_S16_BE:
>  		word &= ~(AC97C_CMR_CEM_LITTLE);
>  		break;
>  	default:
> @@ -301,7 +301,7 @@ static int atmel_ac97c_capture_prepare(struct snd_pcm_substream *substream)
>  	switch (runtime->format) {
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		break;
> -	case SNDRV_PCM_FORMAT_S16_BE: /* fall through */
> +	case SNDRV_PCM_FORMAT_S16_BE:
>  		word &= ~(AC97C_CMR_CEM_LITTLE);
>  		break;
>  	default:
> -- 
> 2.16.4
> 
