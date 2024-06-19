Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE990E134
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 03:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8005E9F6;
	Wed, 19 Jun 2024 03:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8005E9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718760081;
	bh=YAOHYSF2kfOC5GvJiRI6/Eu1rzyWRuWM8z0fAkNkmgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pBtotmxLQnFY+FFnhMnO78xvf9g4tlDWW32078LItoZecMoDX6vhy7x1YoBv4N2VB
	 wY/fVDaZ5Ymj8mijnqd/VAfwyJJNjuFF5aexkjApA+CydxVX8prloGoxPWv08VS+DZ
	 uHfaT1ggdlEvhXWlbGTaT6WczyaGsug2osdDTotM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9033BF80588; Wed, 19 Jun 2024 03:20:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D41F805AF;
	Wed, 19 Jun 2024 03:20:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE73F8023A; Wed, 19 Jun 2024 03:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4686F80154
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 03:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4686F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y0E/o122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718760039; x=1750296039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YAOHYSF2kfOC5GvJiRI6/Eu1rzyWRuWM8z0fAkNkmgU=;
  b=Y0E/o122ogt15YhCp+qxb5iXESBt+tRPYeuw9l/1Q7Dg5Z0aOReYETHr
   1yp7iENBhzOVu0eK4C/AZDROCHKXqLlqR3wz9Y+pAYovwEQpXfWzhwleQ
   PonRsaHMfFz3wHHH+Nyvf1RYa3C+JABl55L+Qv+W73sQ5zaP/OhUZ8mQn
   5d9F42dHVJBUei9tIfr/bJTmD1FvATLiwR9UnLJlGwL9zzUfkRaFRtM+G
   UZffs3tMy5LULHI+ZAQZy0sD+DXCN/t1yuT7d/1o3NTXHU51PX2gWp2cO
   +cxZVie0m+BcA8XENMBQnK2pEeX6mAdKNkO7GtSNzH98cHV/tiL744G3+
   w==;
X-CSE-ConnectionGUID: r2bCpY+nQJy/F2KqgO9eIw==
X-CSE-MsgGUID: M50sUm+/R0eyeLKqQM15vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15805307"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000";
   d="scan'208";a="15805307"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 18:20:35 -0700
X-CSE-ConnectionGUID: 6V5X6AoMTPKvwSDudaZOxw==
X-CSE-MsgGUID: sMe9BSUcRACrxbiuh7slWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000";
   d="scan'208";a="42430221"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jun 2024 18:20:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJjzx-00067k-2w;
	Wed, 19 Jun 2024 01:20:29 +0000
Date: Wed, 19 Jun 2024 09:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Message-ID: <202406190857.mozJxHDO-lkp@intel.com>
References: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>
Message-ID-Hash: HLGUSTNQIHRIIA7CAPX6H4NII5PHTTR3
X-Message-ID-Hash: HLGUSTNQIHRIIA7CAPX6H4NII5PHTTR3
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLGUSTNQIHRIIA7CAPX6H4NII5PHTTR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-lpass-wsa-macro-Fix-vi-feedback-rate/20240618-221030
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240618-lpass-wsa-vi-v1-1-416a6f162c81%40linaro.org
patch subject: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
config: i386-buildonly-randconfig-002-20240619 (https://download.01.org/0day-ci/archive/20240619/202406190857.mozJxHDO-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190857.mozJxHDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190857.mozJxHDO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/lpass-wsa-macro.c:999:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     999 |         default:
         |         ^
   sound/soc/codecs/lpass-wsa-macro.c:999:2: note: insert 'break;' to avoid fall-through
     999 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +999 sound/soc/codecs/lpass-wsa-macro.c

809bcbcecebff8 Srinivas Kandagatla 2020-11-05   976  
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   977  static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   978  			       struct snd_pcm_hw_params *params,
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   979  			       struct snd_soc_dai *dai)
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   980  {
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   981  	struct snd_soc_component *component = dai->component;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   982  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   983  	int ret;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   984  
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   985  	switch (substream->stream) {
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   986  	case SNDRV_PCM_STREAM_PLAYBACK:
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   987  		ret = wsa_macro_set_interpolator_rate(dai, params_rate(params));
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   988  		if (ret) {
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   989  			dev_err(component->dev,
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   990  				"%s: cannot set sample rate: %u\n",
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   991  				__func__, params_rate(params));
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   992  			return ret;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   993  		}
809bcbcecebff8 Srinivas Kandagatla 2020-11-05   994  		break;
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   995  	case SNDRV_PCM_STREAM_CAPTURE:
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   996  		if (dai->id == WSA_MACRO_AIF_VI)
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   997  			wsa->pcm_rate_vi = params_rate(params);
2881dae5fbb091 Srinivas Kandagatla 2024-06-18   998  
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  @999  	default:
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1000  		break;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1001  	}
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1002  	return 0;
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1003  }
809bcbcecebff8 Srinivas Kandagatla 2020-11-05  1004  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
