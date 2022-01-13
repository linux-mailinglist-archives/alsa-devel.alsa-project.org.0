Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD548DCC3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 18:19:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C456C2037;
	Thu, 13 Jan 2022 18:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C456C2037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642094371;
	bh=jH2x3B1Xtz2t2nyF608bOzNqvgVjhgXTxGQiK32SvgU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MLnjWvPMp7VZUcvuus5tnrC6KghTTRSKJtsH9IvN3eNp+5zSWGU4UZa+J1214DZZQ
	 QsTPkvIDcZjdaLtF+VTLQjIc/Z4BkRdUQC7tNP7m16oHgt01O0O9shBESjlieahT/R
	 iUd3SSYLXiGKtEs9Wh3W+8iloxsTit2baHmdNwQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 333E8F80054;
	Thu, 13 Jan 2022 18:18:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E2B7F8013F; Thu, 13 Jan 2022 18:18:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E514F800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 18:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E514F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aymLssMz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB6C661CED;
 Thu, 13 Jan 2022 17:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32E5C36AEB;
 Thu, 13 Jan 2022 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642094293;
 bh=jH2x3B1Xtz2t2nyF608bOzNqvgVjhgXTxGQiK32SvgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aymLssMzgV7jy1kTo3cIjaG5KvxQSDuIsXsdlWZSYSu1qkGE/g/xm3AUKcHbrtWsL
 XGBRAJr8mV9dd808bW7mYQPdhLUZ3GTvL5uUQXG9l6hlJqfTXGiHZlXUnSVs2LU4Pl
 1P+A08/m7p8YNqsk09/TvPOVtF9o6voWQ0iz4ZEU0xQ+wZQt/qiEMgSJQt5VFNgJB7
 yO89pomFmCYAilzB7B1/mnGFUc4Gpfu9RfgDKsVosJAalLhiO9F2XijcYVoIR+yi/z
 mM4A4XjZGM7GSsiELj/F97zNR5xerr/3Kh81CSC7FG8LdL48SFlZYQTMALFimplFr3
 JzxrkCcA852zw==
Date: Thu, 13 Jan 2022 10:18:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: pcm: accept the OPEN state for snd_pcm_stop()
Message-ID: <YeBe0CDN3gCfNKlj@archlinux-ax161>
References: <20220113113130.1961332-1-perex@perex.cz>
 <202201140042.ARpH6f9U-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201140042.ARpH6f9U-lkp@intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>, kbuild-all@lists.01.org,
 Takashi Iwai <tiwai@suse.de>, llvm@lists.linux.dev,
 Pavel Hofman <pavel.hofman@ivitera.com>
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

On Fri, Jan 14, 2022 at 01:10:23AM +0800, kernel test robot wrote:
> Hi Jaroslav,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on tiwai-sound/for-next]
> [also build test WARNING on v5.16 next-20220113]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Jaroslav-Kysela/ALSA-pcm-accept-the-OPEN-state-for-snd_pcm_stop/20220113-193304
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> config: hexagon-randconfig-r013-20220113 (https://download.01.org/0day-ci/archive/20220114/202201140042.ARpH6f9U-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/18b89b55d815ee4e4f78fa96507d2ad7a03c9c8c
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jaroslav-Kysela/ALSA-pcm-accept-the-OPEN-state-for-snd_pcm_stop/20220113-193304
>         git checkout 18b89b55d815ee4e4f78fa96507d2ad7a03c9c8c
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/core/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> sound/core/pcm_native.c:691:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>            case SNDRV_PCM_STATE_SETUP:
>            ^
>    sound/core/pcm_native.c:691:2: note: insert 'break;' to avoid fall-through
>            case SNDRV_PCM_STATE_SETUP:
>            ^
>            break; 
>    1 warning generated.
> 
> 
> vim +691 sound/core/pcm_native.c
> 
> 60f96aaecb19ca2 Takashi Sakamoto  2017-06-09  674  
> 877211f5e1b1196 Takashi Iwai      2005-11-17  675  static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
> 877211f5e1b1196 Takashi Iwai      2005-11-17  676  			     struct snd_pcm_hw_params *params)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  677  {
> 877211f5e1b1196 Takashi Iwai      2005-11-17  678  	struct snd_pcm_runtime *runtime;
> 9442e691e4aec85 Takashi Iwai      2006-09-30  679  	int err, usecs;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  680  	unsigned int bits;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  681  	snd_pcm_uframes_t frames;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  682  
> 7eaa943c8ed8e91 Takashi Iwai      2008-08-08  683  	if (PCM_RUNTIME_CHECK(substream))
> 7eaa943c8ed8e91 Takashi Iwai      2008-08-08  684  		return -ENXIO;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  685  	runtime = substream->runtime;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  686  	snd_pcm_stream_lock_irq(substream);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  687  	switch (runtime->status->state) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  688  	case SNDRV_PCM_STATE_OPEN:
> 18b89b55d815ee4 Jaroslav Kysela   2022-01-13  689  		if (atomic_read(&substream->queued_hw_free))
> 18b89b55d815ee4 Jaroslav Kysela   2022-01-13  690  			goto __badfd;

Small explanation in case there is some confusion on clang's warning.
There should be a break here. GCC accepts implicitly falling through to
cases with just a break or a return but the kernel requires all cases to
end with either a break, fallthrough, continue, goto, or return. See
Documentation/process/deprecated.rst.

Cheers,
Nathan

> ^1da177e4c3f415 Linus Torvalds    2005-04-16 @691  	case SNDRV_PCM_STATE_SETUP:
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  692  	case SNDRV_PCM_STATE_PREPARED:
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  693  		break;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  694  	default:
> 18b89b55d815ee4 Jaroslav Kysela   2022-01-13  695  __badfd:
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  696  		snd_pcm_stream_unlock_irq(substream);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  697  		return -EBADFD;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  698  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  699  	snd_pcm_stream_unlock_irq(substream);
> 8eeaa2f9e06dcfb Takashi Iwai      2014-02-10  700  #if IS_ENABLED(CONFIG_SND_PCM_OSS)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  701  	if (!substream->oss.oss)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  702  #endif
> 9c323fcbc51493f Takashi Iwai      2006-04-28  703  		if (atomic_read(&substream->mmap_count))
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  704  			return -EBADFD;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  705  
> 29bb274e9497466 Takashi Iwai      2021-02-06  706  	snd_pcm_sync_stop(substream, true);
> 1e850beea2781d3 Takashi Iwai      2019-11-17  707  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  708  	params->rmask = ~0U;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  709  	err = snd_pcm_hw_refine(substream, params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  710  	if (err < 0)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  711  		goto _error;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  712  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  713  	err = snd_pcm_hw_params_choose(substream, params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  714  	if (err < 0)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  715  		goto _error;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  716  
> f9a076bff053100 Takashi Sakamoto  2017-06-09  717  	err = fixup_unreferenced_params(substream, params);
> f9a076bff053100 Takashi Sakamoto  2017-06-09  718  	if (err < 0)
> f9a076bff053100 Takashi Sakamoto  2017-06-09  719  		goto _error;
> f9a076bff053100 Takashi Sakamoto  2017-06-09  720  
> 0dba808eae2627f Takashi Iwai      2019-11-17  721  	if (substream->managed_buffer_alloc) {
> 0dba808eae2627f Takashi Iwai      2019-11-17  722  		err = snd_pcm_lib_malloc_pages(substream,
> 0dba808eae2627f Takashi Iwai      2019-11-17  723  					       params_buffer_bytes(params));
> 0dba808eae2627f Takashi Iwai      2019-11-17  724  		if (err < 0)
> 0dba808eae2627f Takashi Iwai      2019-11-17  725  			goto _error;
> 0dba808eae2627f Takashi Iwai      2019-11-17  726  		runtime->buffer_changed = err > 0;
> 0dba808eae2627f Takashi Iwai      2019-11-17  727  	}
> 0dba808eae2627f Takashi Iwai      2019-11-17  728  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  729  	if (substream->ops->hw_params != NULL) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  730  		err = substream->ops->hw_params(substream, params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  731  		if (err < 0)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  732  			goto _error;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  733  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  734  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  735  	runtime->access = params_access(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  736  	runtime->format = params_format(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  737  	runtime->subformat = params_subformat(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  738  	runtime->channels = params_channels(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  739  	runtime->rate = params_rate(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  740  	runtime->period_size = params_period_size(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  741  	runtime->periods = params_periods(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  742  	runtime->buffer_size = params_buffer_size(params);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  743  	runtime->info = params->info;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  744  	runtime->rate_num = params->rate_num;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  745  	runtime->rate_den = params->rate_den;
> ab69a4904b5dd4d Clemens Ladisch   2010-11-15  746  	runtime->no_period_wakeup =
> ab69a4904b5dd4d Clemens Ladisch   2010-11-15  747  			(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
> ab69a4904b5dd4d Clemens Ladisch   2010-11-15  748  			(params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  749  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  750  	bits = snd_pcm_format_physical_width(runtime->format);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  751  	runtime->sample_bits = bits;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  752  	bits *= runtime->channels;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  753  	runtime->frame_bits = bits;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  754  	frames = 1;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  755  	while (bits % 8 != 0) {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  756  		bits *= 2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  757  		frames *= 2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  758  	}
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  759  	runtime->byte_align = bits / 8;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  760  	runtime->min_align = frames;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  761  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  762  	/* Default sw params */
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  763  	runtime->tstamp_mode = SNDRV_PCM_TSTAMP_NONE;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  764  	runtime->period_step = 1;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  765  	runtime->control->avail_min = runtime->period_size;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  766  	runtime->start_threshold = 1;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  767  	runtime->stop_threshold = runtime->buffer_size;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  768  	runtime->silence_threshold = 0;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  769  	runtime->silence_size = 0;
> ead4046b2fdfd69 Clemens Ladisch   2010-05-21  770  	runtime->boundary = runtime->buffer_size;
> ead4046b2fdfd69 Clemens Ladisch   2010-05-21  771  	while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
> ead4046b2fdfd69 Clemens Ladisch   2010-05-21  772  		runtime->boundary *= 2;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  773  
> add9d56d7b37815 Takashi Iwai      2019-12-11  774  	/* clear the buffer for avoiding possible kernel info leaks */
> 618de0f4ef11acd Takashi Iwai      2020-12-18  775  	if (runtime->dma_area && !substream->ops->copy_user) {
> 618de0f4ef11acd Takashi Iwai      2020-12-18  776  		size_t size = runtime->dma_bytes;
> 618de0f4ef11acd Takashi Iwai      2020-12-18  777  
> 618de0f4ef11acd Takashi Iwai      2020-12-18  778  		if (runtime->info & SNDRV_PCM_INFO_MMAP)
> 618de0f4ef11acd Takashi Iwai      2020-12-18  779  			size = PAGE_ALIGN(size);
> 618de0f4ef11acd Takashi Iwai      2020-12-18  780  		memset(runtime->dma_area, 0, size);
> 618de0f4ef11acd Takashi Iwai      2020-12-18  781  	}
> add9d56d7b37815 Takashi Iwai      2019-12-11  782  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  783  	snd_pcm_timer_resolution_change(substream);
> 9b0573c07f278e9 Takashi Iwai      2012-10-12  784  	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
> 9442e691e4aec85 Takashi Iwai      2006-09-30  785  
> 5371a79be97caac Rafael J. Wysocki 2020-02-12  786  	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
> 5371a79be97caac Rafael J. Wysocki 2020-02-12  787  		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
> 137c171cf7ecf62 Takashi Iwai      2021-06-08  788  	usecs = period_to_usecs(runtime);
> 137c171cf7ecf62 Takashi Iwai      2021-06-08  789  	if (usecs >= 0)
> 5371a79be97caac Rafael J. Wysocki 2020-02-12  790  		cpu_latency_qos_add_request(&substream->latency_pm_qos_req,
> 5371a79be97caac Rafael J. Wysocki 2020-02-12  791  					    usecs);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  792  	return 0;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  793   _error:
> 25985edcedea639 Lucas De Marchi   2011-03-30  794  	/* hardware might be unusable from this time,
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  795  	   so we force application to retry to set
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  796  	   the correct hardware parameter settings */
> 9b0573c07f278e9 Takashi Iwai      2012-10-12  797  	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  798  	if (substream->ops->hw_free != NULL)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  799  		substream->ops->hw_free(substream);
> 0dba808eae2627f Takashi Iwai      2019-11-17  800  	if (substream->managed_buffer_alloc)
> 0dba808eae2627f Takashi Iwai      2019-11-17  801  		snd_pcm_lib_free_pages(substream);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  802  	return err;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  803  }
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  804  
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
