Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAF798089
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 04:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A8183A;
	Fri,  8 Sep 2023 04:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A8183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694139908;
	bh=vWYxEROFeGRB8VrHnYmibLGv0XZ+kdXsGRk0pYpQuME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sv6KnYJquNIlM54VFv7aeYnp1xKX7KczEcfg9poJIo2+xbWkv7G+dNO0CWNkIsF0d
	 cn9s77RcaSy48D/uxcaEw78xdXTYURp9V/W8gtEADwvYZOf9cRCLKgS97CU2bVJPWV
	 MWBcZz/B5CrAjG2KDX8b5+ODj2Z8PZHE27stP4JA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 097FCF80494; Fri,  8 Sep 2023 04:23:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71B96F8047D;
	Fri,  8 Sep 2023 04:23:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A1C8F80494; Fri,  8 Sep 2023 04:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5017CF80236
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 04:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5017CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NPxtZR8t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694139812; x=1725675812;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vWYxEROFeGRB8VrHnYmibLGv0XZ+kdXsGRk0pYpQuME=;
  b=NPxtZR8tl+tfKDZ/CWjXB4500DkKlf41uTIbEKj7SGbtvS6yltNE9Xnm
   1vpRb2YDjTw/Hq0P2tQV22uH1x4eTNT+ocHd8OyUdAjLzFZ5ohCKvrkIM
   7BJ731HN3ZFUaeZUNK8gyPVIxHOkzYRPnH0cJobKBWZrhE6gDG0cI/Ia5
   +Ja2vBTXTmowFfr8o/mtPnYiLvuH8x2tJmmj85Il2cC8VhqbMc/GEuZVd
   AQje7LnFAio1Z/ryPqUOo2cPFu6D3rqBNliTAm+7wK2NxVdcWvRpL8aAM
   HvkX1WX4WXIaNk03XPmhTAQDrMw8fiR8kdmLA1vjgOgjkcyEK95HAt/5I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376442411"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000";
   d="scan'208";a="376442411"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 19:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857153413"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000";
   d="scan'208";a="857153413"
Received: from zeweiwan-mobl1.amr.corp.intel.com (HELO [10.212.62.199])
 ([10.212.62.199])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 19:23:20 -0700
Message-ID: <76bf0f24-3d7c-0249-bf5c-3abb1a3641d0@linux.intel.com>
Date: Thu, 7 Sep 2023 22:20:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: sound/soc/soc-pcm.c:1082:1: warning: the frame size of 1324 bytes
 is larger than 1024 bytes
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <202309080339.rbPMLUjl-lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202309080339.rbPMLUjl-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PGXDQULULZLIP5TVIZZXXL5LXJKZTJXN
X-Message-ID-Hash: PGXDQULULZLIP5TVIZZXXL5LXJKZTJXN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGXDQULULZLIP5TVIZZXXL5LXJKZTJXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/7/23 15:23, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   4a0fc73da97efd23a383ca839e6fe86410268f6b
> commit: ac950278b0872c87bcef6153fd9c119265c8ba83 ASoC: add N cpus to M codecs dai link support
> date:   3 months ago
> config: i386-buildonly-randconfig-006-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080339.rbPMLUjl-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080339.rbPMLUjl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309080339.rbPMLUjl-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/soc-pcm.c: In function '__soc_pcm_hw_params':
>>> sound/soc/soc-pcm.c:1082:1: warning: the frame size of 1324 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>     }
>     ^

isn't this the same issue that Charles Keepax wanted to address with
"[PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params"?

That's clearly no longer an ARM-only issue and it does look like a
compiler issue.

> 
> 
> vim +1082 sound/soc/soc-pcm.c
> 
> 4662c59688b8db Kuninori Morimoto 2020-09-29   975  
> ddee627cf6bb60 Liam Girdwood     2011-06-09   976  /*
> ddee627cf6bb60 Liam Girdwood     2011-06-09   977   * Called by ALSA when the hardware params are set by application. This
> ddee627cf6bb60 Liam Girdwood     2011-06-09   978   * function can also be called multiple times and can allocate buffers
> ddee627cf6bb60 Liam Girdwood     2011-06-09   979   * (using snd_pcm_lib_* ). It's non-atomic.
> ddee627cf6bb60 Liam Girdwood     2011-06-09   980   */
> b7898396f4bbe1 Takashi Iwai      2021-12-07   981  static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
> b7898396f4bbe1 Takashi Iwai      2021-12-07   982  			       struct snd_pcm_substream *substream,
> ddee627cf6bb60 Liam Girdwood     2011-06-09   983  			       struct snd_pcm_hw_params *params)
> ddee627cf6bb60 Liam Girdwood     2011-06-09   984  {
> 19bdcc7aeed416 Shreyas NC        2020-02-25   985  	struct snd_soc_dai *cpu_dai;
> 0b7990e38971da Kuninori Morimoto 2018-09-03   986  	struct snd_soc_dai *codec_dai;
> 244e293690a6e0 Charles Keepax    2018-06-19   987  	int i, ret = 0;
> ddee627cf6bb60 Liam Girdwood     2011-06-09   988  
> b7898396f4bbe1 Takashi Iwai      2021-12-07   989  	snd_soc_dpcm_mutex_assert_held(rtd);
> 5cca59516de5df Shengjiu Wang     2019-11-12   990  
> 5cca59516de5df Shengjiu Wang     2019-11-12   991  	ret = soc_pcm_params_symmetry(substream, params);
> 5cca59516de5df Shengjiu Wang     2019-11-12   992  	if (ret)
> 5cca59516de5df Shengjiu Wang     2019-11-12   993  		goto out;
> 5cca59516de5df Shengjiu Wang     2019-11-12   994  
> 7cf3c5b4a04f4b Kuninori Morimoto 2020-05-25   995  	ret = snd_soc_link_hw_params(substream, params);
> a5e6c1090001b8 Kuninori Morimoto 2020-05-25   996  	if (ret < 0)
> ddee627cf6bb60 Liam Girdwood     2011-06-09   997  		goto out;
> ddee627cf6bb60 Liam Girdwood     2011-06-09   998  
> a4be4187b2bfc6 Kuninori Morimoto 2020-03-09   999  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> 2e5894d73789ee Benoit Cousson    2014-07-08  1000  		struct snd_pcm_hw_params codec_params;
> e15ff262e21238 Kuninori Morimoto 2023-01-31  1001  		unsigned int tdm_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
> 2e5894d73789ee Benoit Cousson    2014-07-08  1002  
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1003  		/*
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1004  		 * Skip CODECs which don't support the current stream type,
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1005  		 * the idea being that if a CODEC is not used for the currently
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1006  		 * set up transfer direction, it should not need to be
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1007  		 * configured, especially since the configuration used might
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1008  		 * not even be supported by that CODEC. There may be cases
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1009  		 * however where a CODEC needs to be set up although it is
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1010  		 * actually not being used for the transfer, e.g. if a
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1011  		 * capture-only CODEC is acting as an LRCLK and/or BCLK master
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1012  		 * for the DAI link including a playback-only CODEC.
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1013  		 * If this becomes necessary, we will have to augment the
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1014  		 * machine driver setup with information on how to act, so
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1015  		 * we can do the right thing here.
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1016  		 */
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1017  		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1018  			continue;
> cde79035c6cf57 Ricard Wanderlof  2015-08-24  1019  
> 2e5894d73789ee Benoit Cousson    2014-07-08  1020  		/* copy params for each codec */
> 2e5894d73789ee Benoit Cousson    2014-07-08  1021  		codec_params = *params;
> 2e5894d73789ee Benoit Cousson    2014-07-08  1022  
> 2e5894d73789ee Benoit Cousson    2014-07-08  1023  		/* fixup params based on TDM slot masks */
> e15ff262e21238 Kuninori Morimoto 2023-01-31  1024  		if (tdm_mask)
> e15ff262e21238 Kuninori Morimoto 2023-01-31  1025  			soc_pcm_codec_params_fixup(&codec_params, tdm_mask);
> 2e5894d73789ee Benoit Cousson    2014-07-08  1026  
> aa6166c2ac2839 Kuninori Morimoto 2019-07-22  1027  		ret = snd_soc_dai_hw_params(codec_dai, substream,
> aa6166c2ac2839 Kuninori Morimoto 2019-07-22  1028  					    &codec_params);
> 93e6958a3674d2 Benoit Cousson    2014-07-08  1029  		if(ret < 0)
> 4662c59688b8db Kuninori Morimoto 2020-09-29  1030  			goto out;
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1031  
> 2805b8bd3e0bdd Kuninori Morimoto 2020-12-11  1032  		soc_pcm_set_dai_params(codec_dai, &codec_params);
> 078a85f2806f0f Charles Keepax    2019-01-31  1033  		snd_soc_dapm_update_dai(substream, &codec_params, codec_dai);
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1034  	}
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1035  
> a4be4187b2bfc6 Kuninori Morimoto 2020-03-09  1036  	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> ac950278b0872c Bard Liao         2023-06-07  1037  		struct snd_pcm_hw_params cpu_params;
> ac950278b0872c Bard Liao         2023-06-07  1038  		unsigned int ch_mask = 0;
> ac950278b0872c Bard Liao         2023-06-07  1039  		int j;
> ac950278b0872c Bard Liao         2023-06-07  1040  
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1041  		/*
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1042  		 * Skip CPUs which don't support the current stream
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1043  		 * type. See soc_pcm_init_runtime_hw() for more details
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1044  		 */
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1045  		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1046  			continue;
> 0e9cf4c452ad7e Bard Liao         2020-02-25  1047  
> ac950278b0872c Bard Liao         2023-06-07  1048  		/* copy params for each cpu */
> ac950278b0872c Bard Liao         2023-06-07  1049  		cpu_params = *params;
> ac950278b0872c Bard Liao         2023-06-07  1050  
> ac950278b0872c Bard Liao         2023-06-07  1051  		if (!rtd->dai_link->codec_ch_maps)
> ac950278b0872c Bard Liao         2023-06-07  1052  			goto hw_params;
> ac950278b0872c Bard Liao         2023-06-07  1053  		/*
> ac950278b0872c Bard Liao         2023-06-07  1054  		 * construct cpu channel mask by combining ch_mask of each
> ac950278b0872c Bard Liao         2023-06-07  1055  		 * codec which maps to the cpu.
> ac950278b0872c Bard Liao         2023-06-07  1056  		 */
> ac950278b0872c Bard Liao         2023-06-07  1057  		for_each_rtd_codec_dais(rtd, j, codec_dai) {
> ac950278b0872c Bard Liao         2023-06-07  1058  			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
> ac950278b0872c Bard Liao         2023-06-07  1059  				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
> ac950278b0872c Bard Liao         2023-06-07  1060  		}
> ac950278b0872c Bard Liao         2023-06-07  1061  
> ac950278b0872c Bard Liao         2023-06-07  1062  		/* fixup cpu channel number */
> ac950278b0872c Bard Liao         2023-06-07  1063  		if (ch_mask)
> ac950278b0872c Bard Liao         2023-06-07  1064  			soc_pcm_codec_params_fixup(&cpu_params, ch_mask);
> ac950278b0872c Bard Liao         2023-06-07  1065  
> ac950278b0872c Bard Liao         2023-06-07  1066  hw_params:
> ac950278b0872c Bard Liao         2023-06-07  1067  		ret = snd_soc_dai_hw_params(cpu_dai, substream, &cpu_params);
> 93e6958a3674d2 Benoit Cousson    2014-07-08  1068  		if (ret < 0)
> 4662c59688b8db Kuninori Morimoto 2020-09-29  1069  			goto out;
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1070  
> 19bdcc7aeed416 Shreyas NC        2020-02-25  1071  		/* store the parameters for each DAI */
> ac950278b0872c Bard Liao         2023-06-07  1072  		soc_pcm_set_dai_params(cpu_dai, &cpu_params);
> ac950278b0872c Bard Liao         2023-06-07  1073  		snd_soc_dapm_update_dai(substream, &cpu_params, cpu_dai);
> 19bdcc7aeed416 Shreyas NC        2020-02-25  1074  	}
> ca58221d2212af Kuninori Morimoto 2019-05-13  1075  
> 3a36a64a2de469 Kuninori Morimoto 2020-09-29  1076  	ret = snd_soc_pcm_component_hw_params(substream, params);
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1077  out:
> 041107289c5ceb Kuninori Morimoto 2022-08-30  1078  	if (ret < 0)
> b7898396f4bbe1 Takashi Iwai      2021-12-07  1079  		soc_pcm_hw_clean(rtd, substream, 1);
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1080  
> 041107289c5ceb Kuninori Morimoto 2022-08-30  1081  	return soc_pcm_ret(rtd, ret);
> ddee627cf6bb60 Liam Girdwood     2011-06-09 @1082  }
> ddee627cf6bb60 Liam Girdwood     2011-06-09  1083  
> 
> :::::: The code at line 1082 was first introduced by commit
> :::::: ddee627cf6bb601aa980104fc17d4f84201380be ASoC: core - Separate out PCM operations into new file.
> 
> :::::: TO: Liam Girdwood <lrg@ti.com>
> :::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>
> 
