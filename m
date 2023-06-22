Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 994CA7397D3
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 09:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAADD823;
	Thu, 22 Jun 2023 09:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAADD823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687417662;
	bh=Ucz/cGBHZV0/08hkWPSC4dkuM9OUlC6Z+Ne26wBFqu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jhbjBNRyhj7hSNGcbU2oWgWf1Nw7faJQVba5YLcgCtWd54NvVj0KEiheMXKxHKYRs
	 zxx7MDUEAY1kRZ4eW1SK3O/LYp31lFFbIJQpDTmN63OfScT16n2n/aCn011LlXKpIS
	 kx0aWps1rcYUPq/UMbLdon5hlFk5tCAn34kuwXUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39E97F8051E; Thu, 22 Jun 2023 09:06:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7A1F80132;
	Thu, 22 Jun 2023 09:06:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FEC7F80141; Thu, 22 Jun 2023 09:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18640F80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 09:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18640F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lIliUlkd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687417600; x=1718953600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ucz/cGBHZV0/08hkWPSC4dkuM9OUlC6Z+Ne26wBFqu0=;
  b=lIliUlkdx69KvqlXlpDSjO51oUm/9orQYMD6rAA1JDXJHb608b/UbKu3
   AE8qFrL1qKLJdhVyMe0UgczQNNhcfkw/lb2w5IdQdWZLic+xQQtG1i3Xg
   uqWYZbEUAWVZkpVkfwzJq+k2O7QMG9nG2fe5IhRPFNVMRajE+6rz7Z75D
   KGXV5yF8ed7Ffay7c42k9QlEIn5B8XunMCRFNSnvXZ/XIKCUtinrnrRvV
   UCJkoJ9o+stiRADSx6M80ZuvTAxwn/FkVoQ0KiJCGNO3Rbmn3otA+WkNF
   4zTfLhyE33D4oPLju42Z5zUogievSXyL1rP+jKGeo9h5imbdFh7WSpTnr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="340746372"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400";
   d="scan'208";a="340746372"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 00:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="708979705"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400";
   d="scan'208";a="708979705"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Jun 2023 00:06:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCEOl-0007Oz-2P;
	Thu, 22 Jun 2023 07:06:31 +0000
Date: Thu, 22 Jun 2023 15:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 8/8] ALSA: emu10k1: add high-rate playback in E-MU D.A.S.
 mode
Message-ID: <202306221430.7QukSHhG-lkp@intel.com>
References: <20230613073822.1343234-9-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613073822.1343234-9-oswald.buddenhagen@gmx.de>
Message-ID-Hash: XMJSMPLOJEIUXSKE3ADXPSLVDN774RAV
X-Message-ID-Hash: XMJSMPLOJEIUXSKE3ADXPSLVDN774RAV
X-MailFrom: lkp@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMJSMPLOJEIUXSKE3ADXPSLVDN774RAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230621]
[cannot apply to tiwai-sound/for-linus linus/master v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-introduce-alternative-E-MU-D-A-S-mode/20230613-154242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230613073822.1343234-9-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 8/8] ALSA: emu10k1: add high-rate playback in E-MU D.A.S. mode
config: i386-randconfig-s002-20230621 (https://download.01.org/0day-ci/archive/20230622/202306221430.7QukSHhG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221430.7QukSHhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306221430.7QukSHhG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/emu10k1/emupcm.c:1180:45: sparse: sparse: cast removes address space '__user' of expression
>> sound/pci/emu10k1/emupcm.c:1182:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *src @@
   sound/pci/emu10k1/emupcm.c:1182:41: sparse:     expected void const volatile [noderef] __user *ptr
   sound/pci/emu10k1/emupcm.c:1182:41: sparse:     got unsigned int [usertype] *src

vim +/__user +1180 sound/pci/emu10k1/emupcm.c

  1146	
  1147	static int snd_emu10k1_efx_playback_copy_user(struct snd_pcm_substream *substream,
  1148						      int channel, unsigned long hwoff,
  1149						      void __user *buf, unsigned long bytes)
  1150	{
  1151		struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
  1152		struct snd_pcm_runtime *runtime = substream->runtime;
  1153		unsigned shift = emu->emu1010.clock_shift;
  1154		unsigned i, j, k, channels, subchans, voices, frame_size, frames;
  1155	
  1156		if (!shift) {
  1157			// Non-interleaved source
  1158			if (copy_from_user(get_dma_ptr(runtime, channel, hwoff), buf, bytes))
  1159				return -EFAULT;
  1160		} else {
  1161			// Interleaved source
  1162			channels = runtime->channels;
  1163			subchans = 1 << shift;
  1164			voices = channels << shift;
  1165			frame_size = voices << 2;
  1166			// It is recommended that writes are period-sized, and it appears
  1167			// unlikely that someone would actually use a period size which
  1168			// is not divisible by four, so don't bother making it work.
  1169			// This check should also prevent that hwoff becomes unaligned.
  1170			// Ideally, snd_pcm_sw_params.xfer_align would handle this ...
  1171			if (bytes % frame_size)
  1172				return -EIO;
  1173			frames = bytes / frame_size;
  1174			hwoff /= voices;
  1175			if (!user_access_begin(buf, bytes))
  1176				return -EFAULT;
  1177			for (i = 0; i < channels; i++) {
  1178				for (j = 0; j < subchans; j++) {
  1179					u32 *dst = get_dma_ptr_x(runtime, shift, i, j, hwoff);
> 1180					u32 *src = (u32 *)buf + j * channels + i;
  1181					for (k = 0; k < frames; k++, dst++, src += voices)
> 1182						unsafe_get_user(*dst, src, faulted);
  1183				}
  1184			}
  1185			user_access_end();
  1186		}
  1187		return 0;
  1188	
  1189	faulted:
  1190		user_access_end();
  1191		return -EFAULT;
  1192	}
  1193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
