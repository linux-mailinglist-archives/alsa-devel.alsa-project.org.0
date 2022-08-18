Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFA598865
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 18:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBFC6165E;
	Thu, 18 Aug 2022 18:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBFC6165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660839169;
	bh=uB0ENhl9wMGQGhx9XiDKe4YV+h3pljyOWY37PXK54CA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3tW2zTr3wjCdgEsDh2bMPl1gyeDWhY/f1enzv4kWwXtMCbUkbu6wol/TdXHo8OBd
	 qpKBtdpzF0QUZLZxRkRomLYSO/cdjUgNRtebc6VzARqeX+nWKmw0FCBXvjp+tdNdR6
	 x9wI7eZg45cP5repaJw+6umxxjo7pgEppAkqMPiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFABF80495;
	Thu, 18 Aug 2022 18:11:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F241F800EE; Thu, 18 Aug 2022 18:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF0CF800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 18:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF0CF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hWUTFYxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660839104; x=1692375104;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uB0ENhl9wMGQGhx9XiDKe4YV+h3pljyOWY37PXK54CA=;
 b=hWUTFYxHSCi/dHaHKJZYNLGEZCsYZJH/omyE0Krv0iA5QiD1mOk/FXMH
 BsGFJCqPrgkGpOn1qIrU7Ym9Je33nQovLAlOIbgRYJsnaqUO6bunMevjy
 WLP0E4EPclg+8SVye1BKaiIlZ/e5qrg8z4O1Spyaq9Ltkl3bjYrCOjkcJ
 ZM/OqlQN3fBGzlrTuFNq7bFqqtA7nnIfXmm4KlnoD0fnwIPwMEYuI0pZc
 AyiWotDtIiX6KBy2EAGZp5Z1HAzep0EHqaoyGmJLhrrDWWz7i0ggkBsiX
 Jy7JdbaLP3+r44IOJPw8HheEsbjplDfqBbFzrpxkP84t7v4lvJKp5eLK3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="279765163"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="279765163"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 09:11:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="935866979"
Received: from kumarasw-mobl.gar.corp.intel.com (HELO [10.249.42.78])
 ([10.249.42.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 09:11:34 -0700
Message-ID: <13ee0a40-2353-ef64-9bea-544a5dedac34@linux.intel.com>
Date: Thu, 18 Aug 2022 18:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: Buffers used in ASoC Intel Atom SST driver
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <874jy98snd.wl-tiwai@suse.de>
 <fdfd19f4-436b-bc1b-65f2-7b60f8e59277@intel.com>
 <87zgg17d4s.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87zgg17d4s.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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



On 8/18/22 18:03, Takashi Iwai wrote:
> On Thu, 18 Aug 2022 17:59:36 +0200,
> Cezary Rojewski wrote:
>>
>> On 2022-08-18 5:42 PM, Takashi Iwai wrote:
>>> Hi,
>>>
>>> while cleaning up / fixing the memory allocation code, I noticed that
>>> Intel SST driver is the only driver that currently uses the
>>> SNDRV_DMA_TYPE_CONTINUOUS pages for its PCM buffer.
>>>
>>> Is there any reason not to use the standard device buffer
>>> (SNDRV_DMA_TYPE_DEV)?  i.e. the change like below.
>>
>>
>> Hello,
>>
>> Does not hurt to check the change out. I'm not aware of such
>> limitation for any of Intel's AudioDSP solutions. I cannot test this
>> change though as ATOM devices are not part of my CI. Pierre, do you
>> have any devices where this change could be tested?
>>
>> Adding Hans as he is the key intel/atom maintainer too and I'm pretty
>> sure he has few devices on his own.
> 
> Oh yeah, thanks, Hans might be able to check.
> FWIW, the patch I asked is like below.


It's a 2011 contribution, commit d927fdae5cb2ca, probably from the
Medfield days. I doubt anyone in the Intel CC: list has context on this,
I was the only one on the Intel payroll at the time.

I vaguely remember than in early versions the PCM data was copied over
to the DSP SRAM with the .ack callback, it wasn't a straightforward DMA
transfer, and that created all kinds of issues for PulseAudio integration.

This was changed at some point IIRC, I don't see any reason why a
bog-standard DMA buffer wouldn't work with the released firmware for
Baytrail which is two generations newer and does use the DesignWare DMA.

The best would be to try, I can't volunteer since I don't have any
hardware available at the  moment.


> 
> 
> Takashi
> 
> -- 8< --
> 
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ASoC: Intel: sst: Switch to standard device pages
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index a56dd48c045f..c75616a5fd0a 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -676,10 +676,9 @@ static int sst_soc_pcm_new(struct snd_soc_component *component,
>  
>  	if (dai->driver->playback.channels_min ||
>  			dai->driver->capture.channels_min) {
> -		snd_pcm_set_managed_buffer_all(pcm,
> -			SNDRV_DMA_TYPE_CONTINUOUS,
> -			snd_dma_continuous_data(GFP_DMA),
> -			SST_MIN_BUFFER, SST_MAX_BUFFER);
> +		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +					       pcm->card->dev,
> +					       SST_MIN_BUFFER, SST_MAX_BUFFER);
>  	}
>  	return 0;
>  }
