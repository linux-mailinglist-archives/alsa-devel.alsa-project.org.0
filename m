Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF768833290
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 04:05:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C77E844;
	Sat, 20 Jan 2024 04:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C77E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705719925;
	bh=HkNmGdYxfNMbTkMvaQJwW4lWoGGgKtLMaiyiFu92SDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uD5OUL/oyD8d4iOYFJQCH3UwgE8G+Zb2ffCEExyFrcuBYuPRi9adLWhtCa8y2zhAm
	 pvbn9OCEG91ang/jQb4SSUjWDPuHH5PngebOkrqvOuiBrR3/U9kSabAYdsrQtMkAij
	 Towz7fwCLxipkeuicOP4mrzIz3ES1N+oIlAsy8js=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC654F8057D; Sat, 20 Jan 2024 04:04:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A70F8057E;
	Sat, 20 Jan 2024 04:04:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B2F6F801F5; Sat, 20 Jan 2024 04:04:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A4E3F80074
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 04:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4E3F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TpLmtxEO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705719873; x=1737255873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HkNmGdYxfNMbTkMvaQJwW4lWoGGgKtLMaiyiFu92SDI=;
  b=TpLmtxEO1ETacLJ4djvbfQVdvs5O35fM+xSZ5dAf/JtAw80YX96oBwza
   Y6IBeEVsLme6vEbMikGsMbVULaWAitF/yeGEYA7EIOR+6F6fZBXQoRIrP
   Z0Txext0hkMzFv7VA62OZJKg76ZAIw21BLYIpzVzb10G2YbdlXiJdyMsz
   O01XJpBI+JZoOieBXoj8XW7mINjwtHrGPp004vNo+RT0NIcNbIysAsiyy
   COnM+bRDni1M577VpxTXtrRFswD5IKY/J+k4s2Rk7oSXlLoRMmjqfIX9A
   +CQVedw2UIgf+e1GSzLwuvzxz5q5uBfGH/6pZTdC723OzLOGonYKMs7lj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7599619"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400";
   d="scan'208";a="7599619"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 19:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="819209913"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400";
   d="scan'208";a="819209913"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2024 19:04:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR1ef-0004fO-2R;
	Sat, 20 Jan 2024 03:04:21 +0000
Date: Sat, 20 Jan 2024 11:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com, zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Message-ID: <202401201033.SJS8Mtlr-lkp@intel.com>
References: <20240119112858.2982-4-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119112858.2982-4-zhuning0077@gmail.com>
Message-ID-Hash: LBN5NXSXCKJOISVJB73SRYFH3STGYOR2
X-Message-ID-Hash: LBN5NXSXCKJOISVJB73SRYFH3STGYOR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBN5NXSXCKJOISVJB73SRYFH3STGYOR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Zhu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master next-20240119]
[cannot apply to v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Ning/ASoC-codecs-ES8326-improving-crosstalk-performance/20240119-193247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240119112858.2982-4-zhuning0077%40gmail.com
patch subject: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401201033.SJS8Mtlr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201033.SJS8Mtlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201033.SJS8Mtlr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/es8326.c:16:
>> sound/soc/codecs/es8326.c:184:47: error: 'ES8326_DAC_VOL' undeclared here (not in a function); did you mean 'ES8326_DACR_VOL'?
     184 |         SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DAC_VOL, 0, 0xbf, 0, dac_vol_tlv),
         |                                               ^~~~~~~~~~~~~~
   include/sound/soc.h:34:17: note: in definition of macro 'SOC_DOUBLE_VALUE'
      34 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |                 ^~~~
   include/sound/soc.h:80:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      80 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/es8326.c:184:9: note: in expansion of macro 'SOC_SINGLE_TLV'
     184 |         SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DAC_VOL, 0, 0xbf, 0, dac_vol_tlv),
         |         ^~~~~~~~~~~~~~


vim +184 sound/soc/codecs/es8326.c

b7cd5a85ede3b0 Zhu Ning 2024-01-19  170  
5c439937775d77 Zhu Ning 2022-08-16  171  static const struct soc_enum dacpol =
5c439937775d77 Zhu Ning 2022-08-16  172  	SOC_ENUM_SINGLE(ES8326_DAC_DSM, 4, 4, dacpol_txt);
5c439937775d77 Zhu Ning 2022-08-16  173  static const struct soc_enum alc_winsize =
5c439937775d77 Zhu Ning 2022-08-16  174  	SOC_ENUM_SINGLE(ES8326_ADC_RAMPRATE, 4, 16, winsize);
5c439937775d77 Zhu Ning 2022-08-16  175  static const struct soc_enum drc_winsize =
5c439937775d77 Zhu Ning 2022-08-16  176  	SOC_ENUM_SINGLE(ES8326_DRC_WINSIZE, 4, 16, winsize);
b7cd5a85ede3b0 Zhu Ning 2024-01-19  177  static const struct soc_enum hp_vol =
b7cd5a85ede3b0 Zhu Ning 2024-01-19  178  	SOC_VALUE_ENUM_DOUBLE(ES8326_HP_VOL, 4, 0, 7,
b7cd5a85ede3b0 Zhu Ning 2024-01-19  179  			ARRAY_SIZE(hpvol), hpvol, hp_vol_values);
b7cd5a85ede3b0 Zhu Ning 2024-01-19  180  static const struct soc_enum hpvol_spkvol_switch =
b7cd5a85ede3b0 Zhu Ning 2024-01-19  181  	SOC_ENUM_SINGLE(ES8326_HP_MISC, 6, 4, hp_spkvol_switch);
5c439937775d77 Zhu Ning 2022-08-16  182  
5c439937775d77 Zhu Ning 2022-08-16  183  static const struct snd_kcontrol_new es8326_snd_controls[] = {
5c439937775d77 Zhu Ning 2022-08-16 @184  	SOC_SINGLE_TLV("DAC Playback Volume", ES8326_DAC_VOL, 0, 0xbf, 0, dac_vol_tlv),
5c439937775d77 Zhu Ning 2022-08-16  185  	SOC_ENUM("Playback Polarity", dacpol),
5c439937775d77 Zhu Ning 2022-08-16  186  	SOC_SINGLE_TLV("DAC Ramp Rate", ES8326_DAC_RAMPRATE, 0, 0x0f, 0, softramp_rate),
5c439937775d77 Zhu Ning 2022-08-16  187  	SOC_SINGLE_TLV("DRC Recovery Level", ES8326_DRC_RECOVERY, 0, 4, 0, drc_recovery_tlv),
5c439937775d77 Zhu Ning 2022-08-16  188  	SOC_ENUM("DRC Winsize", drc_winsize),
5c439937775d77 Zhu Ning 2022-08-16  189  	SOC_SINGLE_TLV("DRC Target Level", ES8326_DRC_WINSIZE, 0, 0x0f, 0, drc_target_tlv),
5c439937775d77 Zhu Ning 2022-08-16  190  
5c439937775d77 Zhu Ning 2022-08-16  191  	SOC_DOUBLE_R_TLV("ADC Capture Volume", ES8326_ADC1_VOL, ES8326_ADC2_VOL, 0, 0xff, 0,
5c439937775d77 Zhu Ning 2022-08-16  192  			 adc_vol_tlv),
5c439937775d77 Zhu Ning 2022-08-16  193  	SOC_DOUBLE_TLV("ADC PGA Volume", ES8326_ADC_SCALE, 4, 0, 5, 0, adc_pga_tlv),
5c439937775d77 Zhu Ning 2022-08-16  194  	SOC_SINGLE_TLV("ADC PGA Gain Volume", ES8326_PGAGAIN, 0, 10, 0, adc_analog_pga_tlv),
5c439937775d77 Zhu Ning 2022-08-16  195  	SOC_SINGLE_TLV("ADC Ramp Rate", ES8326_ADC_RAMPRATE, 0, 0x0f, 0, softramp_rate),
5c439937775d77 Zhu Ning 2022-08-16  196  	SOC_SINGLE("ALC Capture Switch", ES8326_ALC_RECOVERY, 3, 1, 0),
5c439937775d77 Zhu Ning 2022-08-16  197  	SOC_SINGLE_TLV("ALC Capture Recovery Level", ES8326_ALC_LEVEL,
5c439937775d77 Zhu Ning 2022-08-16  198  			0, 4, 0, drc_recovery_tlv),
5c439937775d77 Zhu Ning 2022-08-16  199  	SOC_ENUM("ALC Capture Winsize", alc_winsize),
5c439937775d77 Zhu Ning 2022-08-16  200  	SOC_SINGLE_TLV("ALC Capture Target Level", ES8326_ALC_LEVEL,
5c439937775d77 Zhu Ning 2022-08-16  201  			0, 0x0f, 0, drc_target_tlv),
5c439937775d77 Zhu Ning 2022-08-16  202  
e21a9e2701cda5 Zhu Ning 2024-01-19  203  	SOC_SINGLE_EXT("CROSSTALK1", SND_SOC_NOPM, 0, 31, 0,
e21a9e2701cda5 Zhu Ning 2024-01-19  204  			es8326_crosstalk1_get, es8326_crosstalk1_set),
e21a9e2701cda5 Zhu Ning 2024-01-19  205  	SOC_SINGLE_EXT("CROSSTALK2", SND_SOC_NOPM, 0, 31, 0,
e21a9e2701cda5 Zhu Ning 2024-01-19  206  			es8326_crosstalk2_get, es8326_crosstalk2_set),
b7cd5a85ede3b0 Zhu Ning 2024-01-19  207  
b7cd5a85ede3b0 Zhu Ning 2024-01-19  208  	SOC_SINGLE_TLV("HPL Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
b7cd5a85ede3b0 Zhu Ning 2024-01-19  209  	SOC_SINGLE_TLV("HPR Playback Volume", ES8326_DACR_VOL, 0, 0xbf, 0, dac_vol_tlv),
b7cd5a85ede3b0 Zhu Ning 2024-01-19  210  	SOC_SINGLE_TLV("SPKL Playback Volume", ES8326_SPKL_VOL, 0, 0xbf, 0, dac_vol_tlv),
b7cd5a85ede3b0 Zhu Ning 2024-01-19  211  	SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),
b7cd5a85ede3b0 Zhu Ning 2024-01-19  212  
b7cd5a85ede3b0 Zhu Ning 2024-01-19  213  	SOC_ENUM("HP Volume", hp_vol),
b7cd5a85ede3b0 Zhu Ning 2024-01-19  214  	SOC_ENUM("HPVol SPKVol switch", hpvol_spkvol_switch),
5c439937775d77 Zhu Ning 2022-08-16  215  };
5c439937775d77 Zhu Ning 2022-08-16  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
