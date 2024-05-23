Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37D8CCA21
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 02:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 508B5839;
	Thu, 23 May 2024 02:35:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 508B5839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716424530;
	bh=wlmiNa4yixIHq02Pa+8n0/U3cxlS65UlbQLYeMK4uZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DkA96u89453egP1Lck2UAJfDRWth4dcz2CdzpW8I0wO9G6cHxHXOshIN0mpEM/cC6
	 HPIyDgIc8yuoqB8rxxkIc0P0T0L01pIOXzPd9VtLK6yMkvLlaDteGU0KhjkxUT8mkM
	 KB1MrUiznEmSoefkBbMOAHVQDd6i7W3eO4juA7OQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 659E6F805AA; Thu, 23 May 2024 02:34:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85532F805A9;
	Thu, 23 May 2024 02:34:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15926F801F5; Thu, 23 May 2024 02:34:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 631B8F800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 02:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 631B8F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YzE9M3H+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716424480; x=1747960480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wlmiNa4yixIHq02Pa+8n0/U3cxlS65UlbQLYeMK4uZY=;
  b=YzE9M3H+tAPz8b3YGQjrxPzosmeKcoXtKm6gK0jV3KveWVDSrCA9uYO4
   ScEROtcp+v5FQtVh8k9jk4ooPFdyk4zIJARpgA0SimOWsPCgn55gOBpjA
   G2uQEKisTNibh1HsISghQADUgF/97y4RAGB/4mLMTgDpu2bhJQWzR5Q+X
   2jrYOo+MQmtFPyBv5OwoWDizQvXNrBfjZFQQeNSNWDbd+wS1jIma/ydU0
   ZgW+0uTl2jA1AGYj897VnMODhAG4zNmZiMO07nQE4ghsg31qxyaR1Jhoj
   IHaYwHhZF7Bq/6aKn6i1LQ9d8VnHntWsbk+JvRjPtGaWMkv+1NJtHtTPB
   w==;
X-CSE-ConnectionGUID: ghS6Eh6lQNGAENdbcqCVmw==
X-CSE-MsgGUID: WIXkSH1KR9mLQFLF6qY8jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12888577"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000";
   d="scan'208";a="12888577"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 17:34:36 -0700
X-CSE-ConnectionGUID: 22O9Hw7ORXevWs+RCus2tA==
X-CSE-MsgGUID: lIAMabroRnizz0TmLSDxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000";
   d="scan'208";a="38441829"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2024 17:34:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9wPb-0002I9-24;
	Thu, 23 May 2024 00:34:27 +0000
Date: Thu, 23 May 2024 08:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	judyhsiao@google.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, kevin-lu@ti.com,
	yuhsuan@google.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoc: tas2781: Add Calibration Kcontrols and tas2563
 digtial gain for Chromebook
Message-ID: <202405230838.bJI1Z9EJ-lkp@intel.com>
References: <20240522112942.994-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522112942.994-1-shenghao-ding@ti.com>
Message-ID-Hash: 4CKPRB35VWQXC3GP7GAM2EXWW4MOVQOJ
X-Message-ID-Hash: 4CKPRB35VWQXC3GP7GAM2EXWW4MOVQOJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CKPRB35VWQXC3GP7GAM2EXWW4MOVQOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20240522]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoc-tas2781-Add-Calibration-Kcontrols-and-tas2563-digtial-gain-for-Chromebook/20240522-193315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240522112942.994-1-shenghao-ding%40ti.com
patch subject: [PATCH v1] ASoc: tas2781: Add Calibration Kcontrols and tas2563 digtial gain for Chromebook
config: mips-randconfig-r081-20240523 (https://download.01.org/0day-ci/archive/20240523/202405230838.bJI1Z9EJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230838.bJI1Z9EJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230838.bJI1Z9EJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-i2c.c:696:31: error: use of undeclared identifier 'tas2563_dvc_table'
                   ar_mid = get_unaligned_be32(tas2563_dvc_table[mid]);
                                               ^
   sound/soc/codecs/tas2781-i2c.c:703:28: error: use of undeclared identifier 'tas2563_dvc_table'
           ar_l = get_unaligned_be32(tas2563_dvc_table[l]);
                                     ^
   sound/soc/codecs/tas2781-i2c.c:704:28: error: use of undeclared identifier 'tas2563_dvc_table'
           ar_r = get_unaligned_be32(tas2563_dvc_table[r]);
                                     ^
   sound/soc/codecs/tas2781-i2c.c:737:29: error: use of undeclared identifier 'tas2563_dvc_table'
           volwr = get_unaligned_be32(tas2563_dvc_table[vol]);
                                      ^
   sound/soc/codecs/tas2781-i2c.c:746:21: error: use of undeclared identifier 'tas2563_dvc_table'
                           (unsigned char *)tas2563_dvc_table[vol], 4);
                                            ^
>> sound/soc/codecs/tas2781-i2c.c:790:3: error: use of undeclared identifier 'tas2563_dvc_tlv'
                   tas2563_dvc_tlv),
                   ^
   sound/soc/codecs/tas2781-i2c.c:788:17: error: use of undeclared identifier 'tas2563_dvc_table'
                   0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
                                 ^
   sound/soc/codecs/tas2781-i2c.c:788:17: error: use of undeclared identifier 'tas2563_dvc_table'
   sound/soc/codecs/tas2781-i2c.c:788:17: error: use of undeclared identifier 'tas2563_dvc_table'
   sound/soc/codecs/tas2781-i2c.c:1433:4: error: invalid application of 'sizeof' to an incomplete type 'const struct snd_kcontrol_new[]'
                           ARRAY_SIZE(tas2563_snd_controls));
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
   10 errors generated.


vim +/tas2563_dvc_table +696 sound/soc/codecs/tas2781-i2c.c

   669	
   670	static int tas2563_digital_gain_get(
   671		struct snd_kcontrol *kcontrol,
   672		struct snd_ctl_elem_value *ucontrol)
   673	{
   674		struct soc_mixer_control *mc =
   675			(struct soc_mixer_control *)kcontrol->private_value;
   676		struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
   677		struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
   678		unsigned int l = 0, r = mc->max;
   679		unsigned int target, ar_mid, mid, ar_l, ar_r;
   680		unsigned int reg = mc->reg;
   681		unsigned char data[4];
   682		int ret;
   683	
   684		mutex_lock(&tas_dev->codec_lock);
   685		/* Read the primary device */
   686		ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
   687		if (ret) {
   688			dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
   689			goto out;
   690		}
   691	
   692		target = get_unaligned_be32(&data[0]);
   693	
   694		while (r > 1 + l) {
   695			mid = (l + r) / 2;
 > 696			ar_mid = get_unaligned_be32(tas2563_dvc_table[mid]);
   697			if (target < ar_mid)
   698				r = mid;
   699			else
   700				l = mid;
   701		}
   702	
   703		ar_l = get_unaligned_be32(tas2563_dvc_table[l]);
   704		ar_r = get_unaligned_be32(tas2563_dvc_table[r]);
   705	
   706		ucontrol->value.integer.value[0] =
   707			abs(target - ar_l) <= abs(target - ar_r) ? l : r;
   708	out:
   709		mutex_unlock(&tas_dev->codec_lock);
   710		return 0;
   711	}
   712	
   713	static int tas2563_digital_gain_put(
   714		struct snd_kcontrol *kcontrol,
   715		struct snd_ctl_elem_value *ucontrol)
   716	{
   717		struct soc_mixer_control *mc =
   718			(struct soc_mixer_control *)kcontrol->private_value;
   719		struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
   720		struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
   721		unsigned int reg = mc->reg;
   722		unsigned int volrd, volwr;
   723		int vol = ucontrol->value.integer.value[0];
   724		int max = mc->max, i, ret = 1;
   725		unsigned char data[4];
   726	
   727		vol = clamp(vol, 0, max);
   728		mutex_lock(&tas_dev->codec_lock);
   729		/* Read the primary device */
   730		ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
   731		if (ret) {
   732			dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
   733			goto out;
   734		}
   735	
   736		volrd = get_unaligned_be32(&data[0]);
   737		volwr = get_unaligned_be32(tas2563_dvc_table[vol]);
   738	
   739		if (volrd == volwr) {
   740			ret = 0;
   741			goto out;
   742		}
   743	
   744		for (i = 0; i < tas_dev->ndev; i++) {
   745			ret = tasdevice_dev_bulk_write(tas_dev, i, reg,
   746				(unsigned char *)tas2563_dvc_table[vol], 4);
   747			if (ret)
   748				dev_err(tas_dev->dev,
   749					"%s, set digital vol error in device %d\n",
   750					__func__, i);
   751		}
   752	
   753	out:
   754		mutex_unlock(&tas_dev->codec_lock);
   755		return ret;
   756	}
   757	
   758	static const struct snd_kcontrol_new tasdevice_snd_controls[] = {
   759		SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
   760			tasdev_force_fwload_get, tasdev_force_fwload_put),
   761	};
   762	
   763	static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
   764		SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
   765			tasdev_nop_get, tasdev_calib_stop_put),
   766		SND_SOC_BYTES_EXT("Amp TF Data", 5, tasdev_tf_data_get, NULL),
   767		SND_SOC_BYTES_EXT("Amp RE Data", 5, tasdev_re_data_get, NULL),
   768		SND_SOC_BYTES_EXT("Amp R0 Data", 5, tasdev_r0_data_get, NULL),
   769		SND_SOC_BYTES_EXT("Amp XMA1 Data", 5, tasdev_XMA1_data_get, NULL),
   770		SND_SOC_BYTES_EXT("Amp XMA2 Data", 5, tasdev_XMA2_data_get, NULL),
   771	};
   772	
   773	static const struct snd_kcontrol_new tas2781_snd_controls[] = {
   774		SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
   775			1, 0, 20, 0, tas2781_amp_getvol,
   776			tas2781_amp_putvol, amp_vol_tlv),
   777		SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
   778			0, 0, 200, 1, tas2781_digital_getvol,
   779			tas2781_digital_putvol, dvc_tlv),
   780	};
   781	
   782	static const struct snd_kcontrol_new tas2781_cali_controls[] = {
   783		SND_SOC_BYTES_EXT("Amp Latch Data", 2, tas2781_latch_reg_get, NULL),
   784	};
   785	
   786	static const struct snd_kcontrol_new tas2563_snd_controls[] = {
   787		SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2563_DVC_LVL, 0,
   788			0, ARRAY_SIZE(tas2563_dvc_table) - 1, 0,
   789			tas2563_digital_gain_get, tas2563_digital_gain_put,
 > 790			tas2563_dvc_tlv),
   791	};
   792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
