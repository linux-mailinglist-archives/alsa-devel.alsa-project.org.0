Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F1181392
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 09:47:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B671663;
	Wed, 11 Mar 2020 09:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B671663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583916464;
	bh=UXxuoap7XCsbUVFGwacQFUBfJTOmizXGh8Sehvss0As=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VCEi/2G4nR9w/fmTRQXkSproo3EVB9z+/Y1r6rYFcv1NQo9zCbPK/jTlLLkjvhk3M
	 GBDWXkdd8aaIe8QQnkJfFqfNAMlLss8CnVLCCJjrYAqQqdLga2VyrNrr8OoXPCZ/cL
	 uPhBDcAlLs/ivjAmSuiGxXu8it0t5taFOxSuJHPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6FCF801F7;
	Wed, 11 Mar 2020 09:46:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CE9BF801EB; Wed, 11 Mar 2020 09:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EDDFF800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 09:45:57 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 70EC0A0040;
 Wed, 11 Mar 2020 09:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 70EC0A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583916354; bh=YdDNNrmMnqdOt9QwgG5jXlRhPPsePmWXfgUSmyIathI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=pkge8kUoAp+y32HzJVx+MV12yPAczUDUe4nxvOdFwgbC+s+6AEjzp6T8H13xBRpis
 UaMjEnuYl13MsxexVN42jV9kuBZojX/J7gEoyZCzrs6ylsI3SgzIvReWy90NxA3KRA
 EYK2lJfc7yygI+fmzQLolaV6iWETa//72JrSezPA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 11 Mar 2020 09:45:52 +0100 (CET)
Subject: Re: [PATCH] alsaloop: reduce cumulative error caused by non-atomic
 samples calculation
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>, alsa-devel@alsa-project.org
References: <1583785794-5173-1-git-send-email-ruslan.bilovol@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <2a443d5d-a07a-7193-178f-70cfa5c14642@perex.cz>
Date: Wed, 11 Mar 2020 09:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583785794-5173-1-git-send-email-ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 09. 03. 20 v 21:29 Ruslan Bilovol napsal(a):
> When doing loopback between two audio card with
> same sampling frequency, I noticed slow increase
> of pitch_diff.
> 
> When I changed order of get_queued_playback_samples()
> vs get_queued_capture_samples(), I noticed same drift
> of pitch_diff but if was decreasing this time.
> 
> This seems to be caused by non-atomic consecutive
> snd_pcm_delay() invocation for playback then for
> capture. snd_pcm_delay() measures delay between
> read/write call and actual ADC/DAC operation.
> 
> So while we get this value for playback path in
> get_queued_playback_samples(), next call to
> get_queued_capture_samples() will happen a little
> bit later so snd_pcm_delay() may return incorrect
> value.
> 
> Be interleaving get_queued_{playback,capture}_samples()
> order, we divide this small error between playback
> and capture paths. I do not see any issues anymore
> with one-way drift of pitch_diff.
> 
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>

Nice catch and implementation. Applied.

				Thank you,
					Jaroslav

> ---
>   alsaloop/pcmjob.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
> index b252486..1b7925a 100644
> --- a/alsaloop/pcmjob.c
> +++ b/alsaloop/pcmjob.c
> @@ -1951,8 +1951,16 @@ int pcmjob_pollfds_handle(struct loopback *loop, struct pollfd *fds)
>   	}
>   	if (loop->sync != SYNC_TYPE_NONE) {
>   		snd_pcm_sframes_t pqueued, cqueued;
> -		pqueued = get_queued_playback_samples(loop);
> -		cqueued = get_queued_capture_samples(loop);
> +
> +		/* Reduce cumulative error by interleaving playback vs capture reading order */
> +		if (loop->total_queued_count & 1) {
> +			pqueued = get_queued_playback_samples(loop);
> +			cqueued = get_queued_capture_samples(loop);
> +		} else {
> +			cqueued = get_queued_capture_samples(loop);
> +			pqueued = get_queued_playback_samples(loop);
> +		}
> +
>   		if (verbose > 4)
>   			snd_output_printf(loop->output, "%s: queued %li/%li samples\n", loop->id, pqueued, cqueued);
>   		if (pqueued > 0)
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
