Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967EC63514
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 13:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10B17165D;
	Tue,  9 Jul 2019 13:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10B17165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562672498;
	bh=VgqATVxU0KiYmQ2sPtS33mI9Qi/P4wkc4haywiscOxo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZiYnk7knXvv041wQZOTNs8TOAOYy9UL1ocv7hF6sdlI1omZvulyEoKFJW6W+e8aY
	 EBWhoDLCUF0uRl1AuVFlHLW7/EoNX9zKzWGNwzni7ierM8CAFQxQbLVkfepsyrS8HH
	 eV0c0VQkF0bigAYIhTIUylaHz9/ejGnWE0Oedb7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2B2F800E0;
	Tue,  9 Jul 2019 13:39:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CE6BF80274; Tue,  9 Jul 2019 13:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 250C6F800E0
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 13:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 250C6F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YMq6gadA"
Received: from localhost (unknown [49.207.58.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F87721537;
 Tue,  9 Jul 2019 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562672384;
 bh=7MFlqvML9/vU9365H4HFWcKpY0B3jpNOGcua5UnN7CQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YMq6gadAju+Y3SuHQX1Q+pkGqivC38flACghRwBb1s4IgP9sL7KqAABgVZb347mYm
 j8sZakQidRtefNlToQp+5MHMm/KDPdw5QWDRsLcE3fMvowDiZxSoLlKfYIrftJf/7g
 GOwMdqCghxvIKZpcui2RPZ+4ABJT1QJlHykJIAMc=
Date: Tue, 9 Jul 2019 17:06:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190709113633.GL2911@vkoul-mobl>
References: <20190709105211.11741-1-ckeepax@opensource.cirrus.com>
 <20190709105211.11741-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709105211.11741-3-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH 3/4] ALSA: compress: Don't allow drain
 operations on capture streams
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

On 09-07-19, 11:52, Charles Keepax wrote:
> Partial drain and next track are intended for gapless playback and
> don't really have an obvious interpretation for a capture stream, so
> makes sense to not allow those operations on capture streams. Drain

Sounds right

> would make sense on a capture stream but currently the implementation
> of drain involves the kernel waiting for the DSP to consume its
> available data, whereas a capture drain would involve waiting for
> user-space to consume the data available on the DSP. Disallow drain
> on capture streams until that is implemented.

Well it in unclear to me about the support required in kernel! Kernel
issues drain request to DSP and waits for that to be done. When DSP has
encoded and copied the data the notification should make drain complete.
So I dont see anything in kernel required for that

> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/core/compress_offload.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index e1a216fd832f9..c7d56cee0d510 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -829,6 +829,10 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
>  		break;
>  	}
>  
> +	/* drain not implemented for capture streams yet */
> +	if (stream->direction == SND_COMPRESS_CAPTURE)
> +		return -EPERM;
> +
>  	retval = stream->ops->trigger(stream, SND_COMPR_TRIGGER_DRAIN);
>  	if (retval) {
>  		pr_debug("SND_COMPR_TRIGGER_DRAIN failed %d\n", retval);
> @@ -847,6 +851,10 @@ static int snd_compr_next_track(struct snd_compr_stream *stream)
>  	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
>  		return -EPERM;
>  
> +	/* next track doesn't have any meaning for capture streams */
> +	if (stream->direction == SND_COMPRESS_CAPTURE)
> +		return -EPERM;
> +
>  	/* you can signal next track if this is intended to be a gapless stream
>  	 * and current track metadata is set
>  	 */
> @@ -874,6 +882,10 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
>  		break;
>  	}
>  
> +	/* partial drain doesn't have any meaning for capture streams */
> +	if (stream->direction == SND_COMPRESS_CAPTURE)
> +		return -EPERM;
> +
>  	/* stream can be drained only when next track has been signalled */
>  	if (stream->next_track == false)
>  		return -EPERM;
> -- 
> 2.11.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
