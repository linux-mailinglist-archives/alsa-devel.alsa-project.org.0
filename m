Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1AF20CC98
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 07:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02138165D;
	Mon, 29 Jun 2020 07:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02138165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593407935;
	bh=crmtCeTm/UluhEluBQPykauUvFRi/Z9kzPRAWcvYg0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NYjPCY2woQmO2Xcp8yrgbIqbWP7k/NRfM8jg9lyxdqXqIoojBV+Y2+MO9Y1+EYKkM
	 5AWojrDt/DTppt5CGTGDjHp6wCNFace4K1Bc70DJz8gdBB3AOcXtqag9iRUVhO8iFl
	 fE6jCEfHuuTSTM8iku89MMCRc8pgK8c9LHOXC3b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9E1CF800BA;
	Mon, 29 Jun 2020 07:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3871F8020C; Mon, 29 Jun 2020 07:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5248FF800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 07:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5248FF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i5YR6pw/"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D53423125;
 Mon, 29 Jun 2020 05:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593407824;
 bh=crmtCeTm/UluhEluBQPykauUvFRi/Z9kzPRAWcvYg0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5YR6pw/aFV2iOyU/9vkfAejtQ2CzfxmUzysh7DBmuU5k6mThFvvnOO3/Y85M8IJN
 gKHLvO4LX3X6YXz+O5+Jhj6+78ejPHVSmLwVUt+KgCUsBjEjnlYYtRBU1mymTpk1/z
 VaXloID+owO3dQOa4GY9oSltJigVxf44g4Sp0H9s=
Date: Mon, 29 Jun 2020 10:46:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 3/3] ALSA: compress: fix partial_drain completion state
Message-ID: <20200629051659.GB376808@vkoul-mobl>
References: <20200625154651.99758-1-vkoul@kernel.org>
 <20200625154651.99758-4-vkoul@kernel.org>
 <20200626103549.GB71940@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626103549.GB71940@ediswmail.ad.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 26-06-20, 10:35, Charles Keepax wrote:

> > -	stream->runtime->state = SNDRV_PCM_STATE_SETUP;
> > +	mutex_lock(&stream->device->lock);
> > +	/* for partial_drain case we are back to running state on success */
> > +	if (stream->partial_drain) {
> > +		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
> > +		stream->partial_drain = false; /* clear this flag as well */
> > +	} else {
> > +		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
> > +	}
> > +	mutex_unlock(&stream->device->lock);
> 
> You have added locking here in snd_compr_drain_notify but....
> >  
> >  	wake_up(&stream->runtime->sleep);
> >  }
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> > index e618580feac4..1c4b2cf450a0 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -803,6 +803,9 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
> >  
> >  	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_STOP);
> >  	if (!retval) {
> > +		/* clear flags and stop any drain wait */
> > +		stream->partial_drain = false;
> > +		stream->metadata_set = false;
> >  		snd_compr_drain_notify(stream);
> 
> that can be called from snd_compr_stop here which is already
> holding the lock resulting in deadlock.

Thanks Charles, right somehow my testing missed this, have verified that
it is the case.

I will remove the locks here, and we should add a comment to note this..

Thanks

-- 
~Vinod
