Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850D1F65DF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 12:42:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05DD2167C;
	Thu, 11 Jun 2020 12:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05DD2167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591872166;
	bh=UkChEr0cED74MuozXkHO6sYdI6G1aWz7incHwhcfjps=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9xJJUmifEoJQnxWsJz2dkqRvwYRmHWuomD2tyshXPFkno6wLVEKq15gTJvCaxEKl
	 YGbbftgh82SR7Pb0rJPNyIqwnTE3ryQNNIYup7FSD9R8EnsuWzeAzkGFSVliD4CJAy
	 Dr5CPbLe59Yq48SoHTGANzEpRNsdnzGEmOOTgVdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD18F80278;
	Thu, 11 Jun 2020 12:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8AE9F8028C; Thu, 11 Jun 2020 12:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992E7F80149
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 12:40:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 28CC4A0040;
 Thu, 11 Jun 2020 12:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 28CC4A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591872054; bh=DwzRYk4RWjYp+Vj1nO3V2LYlM4Go4n5SvcpAu4c3ZZg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LK9HwhOIXTUqmdhONs3IB+irxcwKiU+DEpd3dKQyOO022jZEKH+R5goXc2rWVyeQF
 2OA6LCk8dnqGkyxV16xd9+ht6DE9i61nGjZH8B8mGPXSRFWMNIpYg1YxpNReIrJHXN
 PmydBBr435ULE823AdjPSBxwQzPSEPVC94pwNG5s=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Jun 2020 12:40:47 +0200 (CEST)
Subject: Re: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
To: Vinod Koul <vkoul@kernel.org>
References: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
 <817d009e-fa09-e897-cfc3-997bf1dd5e30@perex.cz>
 <20200610105820.GA1393454@vkoul-mobl>
 <20200611084659.GO71940@ediswmail.ad.cirrus.com>
 <6a984302-ff01-e326-d338-e50e1f532cd9@perex.cz>
 <20200611094423.GB1393454@vkoul-mobl>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8bba7e36-af15-33ac-bfc7-d436030f08b7@perex.cz>
Date: Thu, 11 Jun 2020 12:40:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611094423.GB1393454@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 11. 06. 20 v 11:44 Vinod Koul napsal(a):
> On 11-06-20, 11:09, Jaroslav Kysela wrote:
>> Dne 11. 06. 20 v 10:46 Charles Keepax napsal(a):
>>> On Wed, Jun 10, 2020 at 04:28:20PM +0530, Vinod Koul wrote:
>>>> On 10-06-20, 12:40, Jaroslav Kysela wrote:
>>>>> Dne 10. 06. 20 v 12:07 Srinivas Kandagatla napsal(a):
>>>>>> For gapless playback call to snd_compr_drain_notify() after
>>>>>> partial drain should put the state to SNDRV_PCM_STATE_RUNNING
>>>>>> rather than SNDRV_PCM_STATE_SETUP as the driver is ready to
>>>>>> process the buffers for new track.
>>>>>>
>>>>>> With existing code, if we are playing 3 tracks in gapless, after
>>>>>> partial drain finished on previous track 1 the state is set to
>>>>>> SNDRV_PCM_STATE_SETUP which is then moved to SNDRV_PCM_STATE_PREPARED
>>>>>> after data write. With this state calls to snd_compr_next_track() and
>>>>>> few other calls will fail as they expect the state to be in
>>>>>> SNDRV_PCM_STATE_RUNNING.
>>>>>>
>>>>>> Here is the sequence of events and state transitions:
>>>>>>
>>>>>> 1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
>>>>>> 2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
>>>>>> 3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
>>>>>> 4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
>>>>>> 5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
>>>>>> 6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
>>>>>> 7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
>>>>>> 8. set_metadata (Track 3), no state change, state = SNDRV_PCM_STATE_PREPARED
>>>>>> 9. set_next_track (Track 3), !! FAILURE as state != SNDRV_PCM_STATE_RUNNING
>>>>>
>>>>>
>>>>> The snd_compr_drain_notify() is called only from snd_compr_stop(). Something
>>>>> is missing in this sequence?
>>>>
>>>> It is supposed to be invoked by driver when partial drain is complete..
>>>> both intel and sprd driver are calling this. snd_compr_stop is stop
>>>> while draining case so legit
>>>>
>>>
>>> Not sure I follow this statement, could you elaborate a bit?
>>> snd_compr_stop putting the state to RUNNING seems fundamentally
>>> broken to me, the whole point of snd_compr_stop is to take the
>>> state out of RUNNING.
>>
>> Yes. I agree. It seems that the acknowledge for the partial drain should be
>> handled differently.
> 
> Yeah sorry I overlooked that case and was thinking of it being invoked
> from driver!
> 
> Yes this would make the snd_compr_stop() behave incorrectly.. so this
> cant be done as proposed.
> 
> But we still need to set the draining stream state properly and I am
> thinking below now:
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 509290f2efa8..9aba851732d7 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -929,7 +929,9 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
>          }
>   
>          stream->next_track = false;
> -       return snd_compress_wait_for_drain(stream);
> +       retval = snd_compress_wait_for_drain(stream);
> +       stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
> +       return retval;
>   }

I see a race possibility when the last track is too small and the driver 
signals the end-of-track twice. In this case the partial drain should not end 
with the running state. It would be probably better to separate partial / last 
track acknowledgements.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
