Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593499B0DCA
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2024 20:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55486BC0;
	Fri, 25 Oct 2024 20:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55486BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729882510;
	bh=4e4g5vnXgjZ54S/Th13nMRlhaLWJhmMK6gRO2PJa3e8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ATi1RqUB4OHME7rNEyzMtzgIymGtPnHAHzLzTtaoOCzrndD9cYuMdBWWISgAwqa9/
	 oaK1efLy8fhdl39MJaAXYpxqaeoL/JSewc34JCbDSrK52AnD+0ARaqjw83u3Q/Bsl6
	 uusnlRKQ4JDBSDGXaVJ1meT8jkS5TKCvkSjKztC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D63EF805B5; Fri, 25 Oct 2024 20:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A38DCF8058C;
	Fri, 25 Oct 2024 20:54:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2017F8016C; Fri, 25 Oct 2024 20:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FD2AF80104
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 20:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD2AF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XqT2joso
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729882472; x=1761418472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4e4g5vnXgjZ54S/Th13nMRlhaLWJhmMK6gRO2PJa3e8=;
  b=XqT2josoSJ9FfPSVMQRBtP6ku4zAByjA4rclebcZwu6nYUUX2qxayoEW
   aQ/So2M14WcxUuKLPlWBY4MJ6qt5BlzlNGs6u9uxDa+G/VuOS5LAh/rkI
   EPpsxImxUp2vIMTAE9XNLizo+71qmtldt+zyKxzA8Ed1Bz/Q21aga4pJq
   eD/qq3acDLdQZ+0ViF81cCpuNiyFEe9Yi13raXgyIo6mQlUBEPYZVmd0X
   fyPpz7QPfK+LAwXQvP2A2cH9aNGc70XjnyyanX56+iX6T4t7Od39wnBnB
   K15vqo8NwAC+uVvJ9/tAG11SwjTBPb1wjGfvUV58P5vDxu60RaSm28pnr
   Q==;
X-CSE-ConnectionGUID: caT/GAI/RIWCS6PEa9UUYg==
X-CSE-MsgGUID: aR0yNsLdSmmyDpk8MXYgWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40938769"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800";
   d="scan'208";a="40938769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 11:54:26 -0700
X-CSE-ConnectionGUID: 365gZtB1TrSQz6A+3/Pf6A==
X-CSE-MsgGUID: FxE0cn5XSymIacCvdTa/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800";
   d="scan'208";a="85781594"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 11:54:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4PS2-000YlU-05;
	Fri, 25 Oct 2024 18:54:22 +0000
Date: Sat, 26 Oct 2024 02:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: [tiwai-sound:topic/compress-accel 1/1]
 sound/core/compress_offload.c:409:35: warning: variable 'runtime' set but
 not used
Message-ID: <202410260257.PNGCF9yq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: DOHLF3I35KYI46QLYW77UQN6WDWS3UAZ
X-Message-ID-Hash: DOHLF3I35KYI46QLYW77UQN6WDWS3UAZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOHLF3I35KYI46QLYW77UQN6WDWS3UAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/compress-accel
head:   04177158cf98a79744937893b100020d77e6f9ac
commit: 04177158cf98a79744937893b100020d77e6f9ac [1/1] ALSA: compress_offload: introduce accel operation mode
config: arm-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260257.PNGCF9yq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260257.PNGCF9yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260257.PNGCF9yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/compress_offload.c: In function 'snd_compr_poll':
>> sound/core/compress_offload.c:409:35: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
     409 |         struct snd_compr_runtime *runtime;
         |                                   ^~~~~~~


vim +/runtime +409 sound/core/compress_offload.c

   404	
   405	static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
   406	{
   407		struct snd_compr_file *data = f->private_data;
   408		struct snd_compr_stream *stream;
 > 409		struct snd_compr_runtime *runtime;
   410		size_t avail;
   411		__poll_t retval = 0;
   412	
   413		if (snd_BUG_ON(!data))
   414			return EPOLLERR;
   415	
   416		stream = &data->stream;
   417		runtime = stream->runtime;
   418	
   419		guard(mutex)(&stream->device->lock);
   420	
   421		switch (stream->runtime->state) {
   422		case SNDRV_PCM_STATE_OPEN:
   423		case SNDRV_PCM_STATE_XRUN:
   424			return snd_compr_get_poll(stream) | EPOLLERR;
   425		default:
   426			break;
   427		}
   428	
   429		poll_wait(f, &stream->runtime->sleep, wait);
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
