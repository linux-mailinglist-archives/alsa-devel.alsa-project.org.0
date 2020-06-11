Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2301F6643
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 13:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7787C1689;
	Thu, 11 Jun 2020 13:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7787C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591873667;
	bh=5xztsiOiY57NOrldvHQaSbPHBI/nqb2sD9DT5pU4IM0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BU1MQtkETeLsq4ZcS9AtKYqOoQqNB8TN0mJyGni95U88674/lgCLvG3iJg1AQhfMh
	 CWPQ7aOyL2tE/Z+JUQ/AXSMS82TUQaTYDojfEYyNt41G54GRuuf8PEw6tBkel8J0JN
	 Buz6glfmol5gXmceN4p46+qnWWA+XvwoXU/h2/ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ADF5F80149;
	Thu, 11 Jun 2020 13:06:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F05E6F8028C; Thu, 11 Jun 2020 13:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E60F80149
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 13:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E60F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sWexdplg"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 806C220760;
 Thu, 11 Jun 2020 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591873560;
 bh=5xztsiOiY57NOrldvHQaSbPHBI/nqb2sD9DT5pU4IM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sWexdplgNcNA9c4C27/MCEKAPWZINpDcVLeeaYvTIVgXDrBgjurvVJdMDiH/K5ygC
 IvzTB6fA/KG/DMLc0BjkcTKlqTpulq+tcD3IssoXMrdXXX/c5Fb2TBAtABMKDMv/Ws
 qi4WZhhY4jCGHoYO82PMV2FX91TP3uncmzNzVdwg=
Date: Thu, 11 Jun 2020 16:35:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
Message-ID: <20200611110556.GD1393454@vkoul-mobl>
References: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
 <817d009e-fa09-e897-cfc3-997bf1dd5e30@perex.cz>
 <20200610105820.GA1393454@vkoul-mobl>
 <20200611084659.GO71940@ediswmail.ad.cirrus.com>
 <6a984302-ff01-e326-d338-e50e1f532cd9@perex.cz>
 <20200611094423.GB1393454@vkoul-mobl>
 <20200611104234.GQ71940@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611104234.GQ71940@ediswmail.ad.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 11-06-20, 10:42, Charles Keepax wrote:
> On Thu, Jun 11, 2020 at 03:14:23PM +0530, Vinod Koul wrote:
> > On 11-06-20, 11:09, Jaroslav Kysela wrote:
> > > Dne 11. 06. 20 v 10:46 Charles Keepax napsal(a):
> > > > On Wed, Jun 10, 2020 at 04:28:20PM +0530, Vinod Koul wrote:
> > > > > On 10-06-20, 12:40, Jaroslav Kysela wrote:
> > > > > > Dne 10. 06. 20 v 12:07 Srinivas Kandagatla napsal(a):
> > > > > > > Here is the sequence of events and state transitions:
> > > > > > > 
> > > > > > > 1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
> > > > > > > 2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
> > > > > > > 3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
> > > > > > > 4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
> > > > > > > 5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
> > > > > > > 6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
> > > > > > > 7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
> > > > > > > 8. set_metadata (Track 3), no state change, state = SNDRV_PCM_STATE_PREPARED
> > > > > > > 9. set_next_track (Track 3), !! FAILURE as state != SNDRV_PCM_STATE_RUNNING
> > Yeah sorry I overlooked that case and was thinking of it being invoked
> > from driver!
> > 
> > Yes this would make the snd_compr_stop() behave incorrectly.. so this
> > cant be done as proposed.
> > 
> > But we still need to set the draining stream state properly and I am
> > thinking below now:
> > 
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> > index 509290f2efa8..9aba851732d7 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -929,7 +929,9 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
> >         }
> >  
> >         stream->next_track = false;
> > -       return snd_compress_wait_for_drain(stream);
> > +       retval = snd_compress_wait_for_drain(stream);
> > +       stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
> > +       return retval;
> 
> This is looking better, I think you probably need to make the
> switch to RUNNING conditional on snd_compress_wait_for_drain
> succeeding, as the state should remain in DRAINING if we are
> interrupted or some such.

Hmmm, only interrupt would be terminate, so yes we should not do running
conditionally here..

> I also have a slight concern that since
> snd_compress_wait_for_drain, releases the lock the set_next_track
> could come in before the state is moved to RUNNING, but I guess
> from user-spaces perspective that is the same as it coming in
> whilst the state is still DRAINING, so should be handled fine?

yeah userspace is blocked on this call, till signalling for partial
drain is done. So it should work. But next_track 'should' be signalled
before this, but yes we need to recheck this logic here and ensure no
gaps are left in gapless :-)

-- 
~Vinod
