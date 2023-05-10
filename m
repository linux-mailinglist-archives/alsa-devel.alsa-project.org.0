Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 469EB6FDAFD
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 11:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3E010A7;
	Wed, 10 May 2023 11:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3E010A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683711877;
	bh=vneA6Bzg5q3YdvaBP1cqZUP2nVUoSSSgg5zP6JZKWOo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BN9VCcVA3mQ8XGLtkqLtjVyYSP40isB5LChFhH6O1PlMSUpYYZ6w0GwbihVvJ8GQ1
	 yxxdFhrDKwB2i4x47CZH9oJPF/d0zxmZBbEXmQbROb3W8wQSMSj6etsMaxDYKLOUfl
	 4ZXOzc9ulf86eQYC03gWKlPVAtmpiW1gcSI53Jnk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A20F80310;
	Wed, 10 May 2023 11:43:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39428F8032D; Wed, 10 May 2023 11:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 133E3F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 11:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 133E3F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S3InzDI0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683711812; x=1715247812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vneA6Bzg5q3YdvaBP1cqZUP2nVUoSSSgg5zP6JZKWOo=;
  b=S3InzDI0lePcg382TuZxjrKuols9Jozd8L73n1P8z55VoYV6eX1ojZLv
   43MSGj4MjxuTTPvGgtDRBB5ui9sjmdWPwoiiYClcdJqDnvBaQFpzItqvn
   nb46q0VgRKMAHQNvbjoM+auwpxj4z4gIIRMXeps6hPkVFiuGH4t4T43ay
   j0tDN8eNDkR3G2/GrdF7kYOVOngDpVm9cudY17o9/bD7I8VCcAcZTlXFZ
   52dozuF7TTDZhqOoLUYQDGSw65vspckMV+8qjI+SBWqmSPZmHZls6V3FD
   1ikTe3tv33wy1V1EhviSlzwpr9UiWUju+xuwNKXbXrM5VaXiYezzN14+u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="329793441"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200";
   d="scan'208";a="329793441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 02:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843444436"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200";
   d="scan'208";a="843444436"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 May 2023 02:43:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwgM0-000374-08;
	Wed, 10 May 2023 09:43:24 +0000
Date: Wed, 10 May 2023 17:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, perex@perex.cz, tiwai@suse.com,
	oswald.buddenhagen@gmx.de, axboe@kernel.dk, 42.hyeyoo@gmail.com,
	surenb@google.com
Subject: Re: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
Message-ID: <202305101732.PILWtd0A-lkp@intel.com>
References: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510072726.435247-1-ivan.orlov0322@gmail.com>
Message-ID-Hash: 2MPJO4IGJS54NONLRM3SAQOGEYHOIKE4
X-Message-ID-Hash: 2MPJO4IGJS54NONLRM3SAQOGEYHOIKE4
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Ivan Orlov <ivan.orlov0322@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MPJO4IGJS54NONLRM3SAQOGEYHOIKE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Orlov/ALSA-PCM-Fix-codestyle-issues-in-pcm_native-c/20230510-152814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230510072726.435247-1-ivan.orlov0322%40gmail.com
patch subject: [PATCH] ALSA: PCM: Fix codestyle issues in pcm_native.c
config: csky-randconfig-r004-20230509 (https://download.01.org/0day-ci/archive/20230510/202305101732.PILWtd0A-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6099cbeae29e29487828a858f8b0e866bec90ab1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ivan-Orlov/ALSA-PCM-Fix-codestyle-issues-in-pcm_native-c/20230510-152814
        git checkout 6099cbeae29e29487828a858f8b0e866bec90ab1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101732.PILWtd0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/pcm_native.c: In function 'snd_pcm_hw_params_choose':
>> sound/core/pcm_native.c:660:94: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     660 |                         trace_hw_mask_param(pcm, *v, 0, &old_mask, hw_param_mask(params, *v));
         |                                                                                              ^


vim +/if +660 sound/core/pcm_native.c

   607	
   608	/**
   609	 * snd_pcm_hw_params_choose - choose a configuration defined by @params
   610	 * @pcm: PCM instance
   611	 * @params: the hw_params instance
   612	 *
   613	 * Choose one configuration from configuration space defined by @params.
   614	 * The configuration chosen is that obtained fixing in this order:
   615	 * first access, first format, first subformat, min channels,
   616	 * min rate, min period time, max buffer size, min tick time
   617	 *
   618	 * Return: Zero if successful, or a negative error code on failure.
   619	 */
   620	static int snd_pcm_hw_params_choose(struct snd_pcm_substream *pcm,
   621					    struct snd_pcm_hw_params *params)
   622	{
   623		static const int vars[] = {
   624			SNDRV_PCM_HW_PARAM_ACCESS,
   625			SNDRV_PCM_HW_PARAM_FORMAT,
   626			SNDRV_PCM_HW_PARAM_SUBFORMAT,
   627			SNDRV_PCM_HW_PARAM_CHANNELS,
   628			SNDRV_PCM_HW_PARAM_RATE,
   629			SNDRV_PCM_HW_PARAM_PERIOD_TIME,
   630			SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
   631			SNDRV_PCM_HW_PARAM_TICK_TIME,
   632			-1
   633		};
   634		const int *v;
   635		struct snd_mask old_mask __maybe_unused;
   636		struct snd_interval old_interval __maybe_unused;
   637		int changed;
   638	
   639		for (v = vars; *v != -1; v++) {
   640			/* Keep old parameter to trace. */
   641			if (trace_hw_mask_param_enabled()) {
   642				if (hw_is_mask(*v))
   643					old_mask = *hw_param_mask(params, *v);
   644			}
   645			if (trace_hw_interval_param_enabled()) {
   646				if (hw_is_interval(*v))
   647					old_interval = *hw_param_interval(params, *v);
   648			}
   649			if (*v != SNDRV_PCM_HW_PARAM_BUFFER_SIZE)
   650				changed = snd_pcm_hw_param_first(pcm, params, *v, NULL);
   651			else
   652				changed = snd_pcm_hw_param_last(pcm, params, *v, NULL);
   653			if (changed < 0)
   654				return changed;
   655			if (changed == 0)
   656				continue;
   657	
   658			/* Trace the changed parameter. */
   659			if (hw_is_mask(*v))
 > 660				trace_hw_mask_param(pcm, *v, 0, &old_mask, hw_param_mask(params, *v));
   661			if (hw_is_interval(*v)) {
   662				trace_hw_interval_param(pcm, *v, 0, &old_interval,
   663							hw_param_interval(params, *v));
   664			}
   665		}
   666	
   667		return 0;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
