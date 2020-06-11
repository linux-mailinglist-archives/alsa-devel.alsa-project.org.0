Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50481F64E5
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 11:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D151674;
	Thu, 11 Jun 2020 11:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D151674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591868782;
	bh=6dGlga2y8rs+Zft++wIUw+5mJiFU392Srhnvy/j+baA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vQjyfr92TpQy6YVOsXlIyB84N5oI+VgRP9Q+V8AST9cJ+8ERWYHTTLUOSz1ZeXqmF
	 Ro4kb6B82Co+5cavAWIKZZndOLHLi+RcTCr+69BW9Ddk7D19jA9sPmhgc6QHbL/IN0
	 0s0vhj7sVidVgXsEQixjIykUsmLkzhFURnDXqXqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D12DF80149;
	Thu, 11 Jun 2020 11:44:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA058F8028C; Thu, 11 Jun 2020 11:44:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4BAF80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 11:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4BAF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iS63csge"
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4211A207C3;
 Thu, 11 Jun 2020 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591868669;
 bh=6dGlga2y8rs+Zft++wIUw+5mJiFU392Srhnvy/j+baA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iS63csgenQ2UIlmq3F8RtVppTk3Q3dC2Q98LgAd8E6EZj3G/iH8wqNBoU+tqhHIiV
 jrSaLwL0tEOws48ZCq3hfqsgVItkmxQSRynqncIHFRuC2acWnsD9hNEbpsEhs4HoPM
 bNm5tMTuV2Pz2+w3egb3tnrCDCa6kS5x5O3crTs0=
Date: Thu, 11 Jun 2020 15:14:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
Message-ID: <20200611094423.GB1393454@vkoul-mobl>
References: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
 <817d009e-fa09-e897-cfc3-997bf1dd5e30@perex.cz>
 <20200610105820.GA1393454@vkoul-mobl>
 <20200611084659.GO71940@ediswmail.ad.cirrus.com>
 <6a984302-ff01-e326-d338-e50e1f532cd9@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a984302-ff01-e326-d338-e50e1f532cd9@perex.cz>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
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

On 11-06-20, 11:09, Jaroslav Kysela wrote:
> Dne 11. 06. 20 v 10:46 Charles Keepax napsal(a):
> > On Wed, Jun 10, 2020 at 04:28:20PM +0530, Vinod Koul wrote:
> > > On 10-06-20, 12:40, Jaroslav Kysela wrote:
> > > > Dne 10. 06. 20 v 12:07 Srinivas Kandagatla napsal(a):
> > > > > For gapless playback call to snd_compr_drain_notify() after
> > > > > partial drain should put the state to SNDRV_PCM_STATE_RUNNING
> > > > > rather than SNDRV_PCM_STATE_SETUP as the driver is ready to
> > > > > process the buffers for new track.
> > > > > 
> > > > > With existing code, if we are playing 3 tracks in gapless, after
> > > > > partial drain finished on previous track 1 the state is set to
> > > > > SNDRV_PCM_STATE_SETUP which is then moved to SNDRV_PCM_STATE_PREPARED
> > > > > after data write. With this state calls to snd_compr_next_track() and
> > > > > few other calls will fail as they expect the state to be in
> > > > > SNDRV_PCM_STATE_RUNNING.
> > > > > 
> > > > > Here is the sequence of events and state transitions:
> > > > > 
> > > > > 1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
> > > > > 2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
> > > > > 3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
> > > > > 4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
> > > > > 5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
> > > > > 6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
> > > > > 7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
> > > > > 8. set_metadata (Track 3), no state change, state = SNDRV_PCM_STATE_PREPARED
> > > > > 9. set_next_track (Track 3), !! FAILURE as state != SNDRV_PCM_STATE_RUNNING
> > > > 
> > > > 
> > > > The snd_compr_drain_notify() is called only from snd_compr_stop(). Something
> > > > is missing in this sequence?
> > > 
> > > It is supposed to be invoked by driver when partial drain is complete..
> > > both intel and sprd driver are calling this. snd_compr_stop is stop
> > > while draining case so legit
> > > 
> > 
> > Not sure I follow this statement, could you elaborate a bit?
> > snd_compr_stop putting the state to RUNNING seems fundamentally
> > broken to me, the whole point of snd_compr_stop is to take the
> > state out of RUNNING.
> 
> Yes. I agree. It seems that the acknowledge for the partial drain should be
> handled differently.

Yeah sorry I overlooked that case and was thinking of it being invoked
from driver!

Yes this would make the snd_compr_stop() behave incorrectly.. so this
cant be done as proposed.

But we still need to set the draining stream state properly and I am
thinking below now:

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 509290f2efa8..9aba851732d7 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -929,7 +929,9 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
        }
 
        stream->next_track = false;
-       return snd_compress_wait_for_drain(stream);
+       retval = snd_compress_wait_for_drain(stream);
+       stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
+       return retval;
 }
 
-- 
~Vinod
