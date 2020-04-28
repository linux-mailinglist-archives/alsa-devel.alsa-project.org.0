Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97721BC425
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 17:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D873168C;
	Tue, 28 Apr 2020 17:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D873168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588089234;
	bh=iHgphTzQx4OdJqEPN0gPCGiUqJ1TeECU8kb+ZmK/Aes=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7IhECkrKHTbiNapu7jNSL7AdmD6mAozxzcuQ1TRNf99p2vVNWmczqOr9NCl3fmSH
	 ZIXP209DlhTEKe5ZQ/HmEFMKTTD2Ns5pEbPymouwXuwHbUGrWRoLVWdN0k1cnXVktY
	 QBkYsWfVXqn4I3xJRTfKrIq+1YkBERCjA+WIhuRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BAAAF801DB;
	Tue, 28 Apr 2020 17:52:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9748F801DB; Tue, 28 Apr 2020 17:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54086F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 17:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54086F800B8
IronPort-SDR: fIoGAizaPLu0prWZQ+X8X1uUPESgArKJlaagKeQnHYrBigH+DCCzZwBs4vMNRmA4qEUpMcTlMA
 +dk4eFphCnaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 08:52:03 -0700
IronPort-SDR: 7QYS8B33nuswxisYRyX6NgFGmcXzGcWc17qz2xunWrMYRbi9mMTOAbb5udhQVvj0UWS2Fgnzdz
 eheZgXXBYvIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="275880001"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 28 Apr 2020 08:52:02 -0700
Date: Tue, 28 Apr 2020 18:52:02 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: robert rozee <rozee@mail.com>
Subject: Re: underrun problems after setting parameters with
 snd_pcm_set_params()
In-Reply-To: <trinity-86378cc8-0b7e-4b09-ae35-8342d01fae5c-1588059797517@3c-app-mailcom-lxa01>
Message-ID: <alpine.DEB.2.21.2004281842250.2957@eliteleevi.tm.intel.com>
References: <trinity-86378cc8-0b7e-4b09-ae35-8342d01fae5c-1588059797517@3c-app-mailcom-lxa01>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hey,


On Tue, 28 Apr 2020, robert rozee wrote:

> the problem only occurs with SHORT sound clips. i found that clips longer than 
> 1111ms played without flaw. clips less that 500ms generally failed to play to 
> the end, but there was no error code returned.

in general, given you have sources available to all the popular apps, it's 
good to check how other apps use the API. I.e. aplay.c may be useful 
simple additional reference for you to see how to use the interfaces.

I think you are missing draining the samples at the end, and then 
your latency is setting is incorrect. I.e.

> snd_pcm_set_params(handle, SND_PCM_FORMAT_U8,
>                            SND_PCM_ACCESS_RW_INTERLEAVED,
>                            1,                           // number of channels
>                            48000,                       // bitrate (bps)
>                            1,                           // resampling on/off
>                            min(500000, sample_length)); // latency

That sample_length does not look, the unit is usecs here. Please try
just putting latency of 500000 (i.e. 0.5sec).

> // send out current buffer content
>   frames=snd_pcm_writei(handle, @buffer, frames_to_write_now);
>   if frames<0 then frames=snd_pcm_recover(handle, frames, 0);
>   if frames<0 then break;
> }

When you have finished writing the audio samples to the ALSA device, you 
need to wait until ALSA has a chance to play all samples out. If you look 
at playback_go() in aplay.c, you'll see:

       snd_pcm_nonblock(handle, 0);
       snd_pcm_drain(handle);
       snd_pcm_nonblock(handle, nonblock);

... at the end. 

Br, Kai
