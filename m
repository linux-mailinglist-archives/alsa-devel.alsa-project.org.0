Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A12DE6A3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 16:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4159B17D4;
	Fri, 18 Dec 2020 16:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4159B17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608305620;
	bh=lYPoV/l8tu/E78eKMJsLQMtNcX7CZZvIkf1rVrOs10Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QD12IDmbVIPiZwoJM5+XT5L+XfngGGLhQEeUoBBODVhde6EdRZaliInL3vxPrfGXT
	 ojBDSev+qA/s6+A14JeOZ5kw/POv+mRyfEkzXLUqiqnevTjjjaUytz+CAHdKS2napR
	 tTuE2B/UV7b8K/esIUyXZpu23QeZHiKD4/IPGcvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC46F8014B;
	Fri, 18 Dec 2020 16:32:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD72BF80272; Fri, 18 Dec 2020 16:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2DBEF8014B
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 16:32:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2DBEF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="QbyKNMXh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=BEdswbSgN9H1JTquEIx9fR/oZXKuDP30x/Q4UpxZc+Q=; b=QbyKNMXhhDtYWrorWKNUW5stHN
 iQvgujUXPZ6weg82ZkzhTKJtTMkM27bp1uPbuIT76TMj4XScMOkFF62/VQNGeVkJPeV2/+PCe2GAG
 V1wImjjgKm/WPoB9II/OaNUe9yvYMBKd+WFGY8W2Kilnjw8W/As4MvyBapzZGmLoh8I3bjJVvofRA
 3X6F4oLyguDy0lK7hPEnvnEOpBokVM3KWvAvycAbkXO0AsX7VE877yLvehS8rHO4uV2YTP4gbsIfI
 IRRxcdG+ARdmFOnJKJVnEzFY2+IMsxBmiKYxaPQ7M4zrJkliv5iJm5u+TKHNpHzY++RlMdU88ycKu
 Oh6DJZIw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kqHjm-000D2Y-L7; Fri, 18 Dec 2020 16:32:10 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kqHjm-000MiY-H9; Fri, 18 Dec 2020 16:32:10 +0100
Subject: Re: [PATCH 2/2] ALSA: pcm: Clear the full allocated memory at
 hw_params
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20201218145625.2045-1-tiwai@suse.de>
 <20201218145625.2045-3-tiwai@suse.de>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <553a1da4-2dd8-3762-3a0c-57bbd90ae732@metafoo.de>
Date: Fri, 18 Dec 2020 16:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201218145625.2045-3-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26021/Fri Dec 18 13:56:31 2020)
Cc: Robin Gong <yibin.gong@nxp.com>
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

On 12/18/20 3:56 PM, Takashi Iwai wrote:
> The PCM hw_params core function tries to clear up the PCM buffer
> before actually using for avoiding the information leak from the
> previous usages or the usage before a new allocation.  It performs the
> memset() with runtime->dma_bytes, but this might still leave some
> remaining bytes untouched; namely, the PCM buffer size is aligned in
> page size for mmap, hence runtime->dma_bytes doesn't necessarily cover
> all PCM buffer pages, and the remaining bytes are exposed via mmap.
>
> This patch changes the memory clearance to cover the all buffer pages
> if the stream is supposed to be mmap-ready (that guarantees that the
> buffer size is aligned in page size).
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Lars-Peter Clausen <lars@metafoo.de>

> ---
>   sound/core/pcm_native.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 47b155a49226..9f3f8e953ff0 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -755,8 +755,13 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
>   		runtime->boundary *= 2;
>   
>   	/* clear the buffer for avoiding possible kernel info leaks */
> -	if (runtime->dma_area && !substream->ops->copy_user)
> -		memset(runtime->dma_area, 0, runtime->dma_bytes);
> +	if (runtime->dma_area && !substream->ops->copy_user) {
> +		size_t size = runtime->dma_bytes;
> +
> +		if (runtime->info & SNDRV_PCM_INFO_MMAP)
> +			size = PAGE_ALIGN(size);
> +		memset(runtime->dma_area, 0, size);
> +	}
>   
>   	snd_pcm_timer_resolution_change(substream);
>   	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);


