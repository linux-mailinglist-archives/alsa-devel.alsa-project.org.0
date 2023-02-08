Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBA68F30D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 17:19:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55C6482C;
	Wed,  8 Feb 2023 17:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55C6482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675873182;
	bh=i5wiQk9WC9xvE/C0qbZGsEhSgL1Eg53js8pBjXRU6aA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q8k/i+zfwi6u5T8fACp5CvZeJUOGwHq0sMeAKfaTBlwjr7a9rnw4gOLldKB7Zy99A
	 +jfm2TXdvmIVtQUbem2llaFaJmz459RW5mxCish7WqIqWuKx12oSYMp16i4mDhf/R+
	 Rtwa4tuc/9CIPrR5cgX3srRF033fZ92nalzZUgFc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A14F800E4;
	Wed,  8 Feb 2023 17:18:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46748F8012B; Wed,  8 Feb 2023 17:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDEAEF8001E
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 17:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDEAEF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XUj17xYt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675873117; x=1707409117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i5wiQk9WC9xvE/C0qbZGsEhSgL1Eg53js8pBjXRU6aA=;
  b=XUj17xYtf+1CK6WfVDwiSMixLumz/olL/5EgNHwIKBbScySZ2c9HZRgB
   GfsfXKV9uxIcYGWwJb2nFLgnASo4p592UXeBR5iuNk/tdpwzQfTK0OetD
   QF1toOjnoPwadvBx7PToilasOZhSBrdz92yjhhqMWOrjOQLB2NT4svG8d
   QeypMtNFslUmU9yILFv/TtqlQ2mRDhFMGrXcjIFduYhKzEGLGGc+70CzQ
   yK98D7PhKZMOUjGuVpAezmlV7pZR34gV3CvR+n08iEFbQ8GED3dT6b/ti
   9NonBrPP/leAcoQneNFufU1BqVrY95FNJ2BiugkOMpfaxfVw4ZXBXhR1H
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310195996"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000";
   d="scan'208";a="310195996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 08:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="791264474"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000";
   d="scan'208";a="791264474"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 08:09:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPn0N-0004Wa-1m;
	Wed, 08 Feb 2023 16:09:07 +0000
Date: Thu, 9 Feb 2023 00:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <lucas.tanure@collabora.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v3 3/4] ALSA: cs35l41: Add shared boost feature
Message-ID: <202302090037.Ndp45WTg-lkp@intel.com>
References: <20230208141839.1097377-4-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208141839.1097377-4-lucas.tanure@collabora.com>
Message-ID-Hash: OOJEKAX7NH75KGW2VZEY7MQSN7P5N74V
X-Message-ID-Hash: OOJEKAX7NH75KGW2VZEY7MQSN7P5N74V
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Lucas Tanure <lucas.tanure@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOJEKAX7NH75KGW2VZEY7MQSN7P5N74V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lucas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.2-rc7 next-20230208]
[cannot apply to broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/ASoC-cs35l41-Only-disable-internal-boost/20230208-222109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230208141839.1097377-4-lucas.tanure%40collabora.com
patch subject: [PATCH v3 3/4] ALSA: cs35l41: Add shared boost feature
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230209/202302090037.Ndp45WTg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/87a5c357d253db3453537a973252d044ce02ad91
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Tanure/ASoC-cs35l41-Only-disable-internal-boost/20230208-222109
        git checkout 87a5c357d253db3453537a973252d044ce02ad91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/cs35l41-lib.c: In function 'cs35l41_global_enable':
>> sound/soc/codecs/cs35l41-lib.c:1212:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1212 |                 struct reg_sequence cs35l41_mdsync_down_seq[] = {
         |                 ^~~~~~
   sound/soc/codecs/cs35l41-lib.c:1217:46: error: 'cs35l45' undeclared (first use in this function)
    1217 |                 ret = regmap_multi_reg_write(cs35l45->regmap, cs35l41_mdsync_down_seq,
         |                                              ^~~~~~~
   sound/soc/codecs/cs35l41-lib.c:1217:46: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/codecs/cs35l41-lib.c:1231:25: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1231 |                         struct reg_sequence cs35l41_mdsync_up_seq[] = {
         |                         ^~~~~~


vim +1212 sound/soc/codecs/cs35l41-lib.c

  1190	
  1191	int cs35l41_global_enable(struct regmap *regmap, enum cs35l41_boost_type b_type, int enable,
  1192				  struct completion *pll_lock)
  1193	{
  1194		int ret;
  1195		unsigned int gpio1_func, pad_control, pwr_ctrl1, pwr_ctrl3;
  1196	
  1197		switch (b_type) {
  1198		case CS35L41_SHD_BOOST_ACTV:
  1199		case CS35L41_SHD_BOOST_PASS:
  1200			regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
  1201			regmap_read(regmap, CS35L41_GPIO_PAD_CONTROL, &pad_control);
  1202	
  1203			pwr_ctrl3 &= ~CS35L41_SYNC_EN_MASK;
  1204			pwr_ctrl1 = enable << CS35L41_GLOBAL_EN_SHIFT;
  1205	
  1206			gpio1_func = enable ? CS35L41_GPIO1_MDSYNC : CS35L41_GPIO1_HIZ;
  1207			gpio1_func <<= CS35L41_GPIO1_CTRL_SHIFT;
  1208	
  1209			pad_control &= ~CS35L41_GPIO1_CTRL_MASK;
  1210			pad_control |= gpio1_func & CS35L41_GPIO1_CTRL_MASK;
  1211	
> 1212			struct reg_sequence cs35l41_mdsync_down_seq[] = {
  1213				{CS35L41_PWR_CTRL3,		pwr_ctrl3},
  1214				{CS35L41_GPIO_PAD_CONTROL,	pad_control},
  1215				{CS35L41_PWR_CTRL1,		pwr_ctrl1, 3000},
  1216			};
  1217			ret = regmap_multi_reg_write(cs35l45->regmap, cs35l41_mdsync_down_seq,
  1218						     ARRAY_SIZE(cs35l41_mdsync_down_seq));
  1219			if (!enable)
  1220				break;
  1221	
  1222			if (!pll_lock)
  1223				return -EINVAL;
  1224	
  1225			ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
  1226			if (ret == 0) {
  1227				ret = -ETIMEDOUT;
  1228			} else {
  1229				regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
  1230				pwr_ctrl3 |= CS35L41_SYNC_EN_MASK;
  1231				struct reg_sequence cs35l41_mdsync_up_seq[] = {
  1232					{CS35L41_PWR_CTRL3,	pwr_ctrl3},
  1233					{CS35L41_PWR_CTRL1,	0x00000000, 3000},
  1234					{CS35L41_PWR_CTRL1,	0x00000001, 3000},
  1235				};
  1236				ret = regmap_multi_reg_write(cs35l45->regmap, cs35l41_mdsync_up_seq,
  1237							     ARRAY_SIZE(cs35l41_mdsync_up_seq));
  1238			}
  1239			break;
  1240		case CS35L41_INT_BOOST:
  1241			ret = regmap_update_bits(regmap, CS35L41_PWR_CTRL1, CS35L41_GLOBAL_EN_MASK,
  1242						 enable << CS35L41_GLOBAL_EN_SHIFT);
  1243			usleep_range(3000, 3100);
  1244			break;
  1245		case CS35L41_EXT_BOOST:
  1246		case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
  1247			if (enable)
  1248				ret = regmap_multi_reg_write(regmap, cs35l41_safe_to_active,
  1249							     ARRAY_SIZE(cs35l41_safe_to_active));
  1250			else
  1251				ret = regmap_multi_reg_write(regmap, cs35l41_active_to_safe,
  1252							     ARRAY_SIZE(cs35l41_active_to_safe));
  1253			break;
  1254		default:
  1255			ret = -EINVAL;
  1256			break;
  1257		}
  1258	
  1259		return ret;
  1260	}
  1261	EXPORT_SYMBOL_GPL(cs35l41_global_enable);
  1262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
