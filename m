Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A66F68EE3B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 12:48:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0955829;
	Wed,  8 Feb 2023 12:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0955829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675856896;
	bh=5kU3wqaJ20/VwYQpQyjHZef6M022HHqkQEXk+jgj9l4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vu6IXVH0oY+0Nj71pDTbhwTPD7iKFmqXHCVZhc6dWAHWzkDGS4/ml88u04yyMGTcX
	 9Vu73gs4fiejVzYvKmIMnk/Fl+co1d5FwShFt2jXmBqxTenuX3UlW7cLtE90cONkgb
	 dwekJaVLA5dMDAEWikoCu3k1Z52RE2nDH9eJkoNM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C31A9F8012B;
	Wed,  8 Feb 2023 12:47:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F1D2F80152; Wed,  8 Feb 2023 12:47:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7DCFF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 12:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DCFF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Fx+ayA99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675856831; x=1707392831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kU3wqaJ20/VwYQpQyjHZef6M022HHqkQEXk+jgj9l4=;
  b=Fx+ayA99xi3P/sBW8So+/yOkvaKIvAnyk9p8zcl387h/uKJJeFWQvdWH
   PJbnYHMbeO6UrSNH48WEXCC6C1sT3z8JKMbpcSG1XfiFVvMjwSFur7cnH
   uY3GuXfynq5D2i9N9ffU53jfZzYVVBxAFA7PeFC5fJmHpvEfN4LE1C4o7
   AI441l0+zJaQ2Ad/Rx1ZEQvB7skjiNsm62OlqHI7hfYQ5B9Zw1R3SOL3t
   8SP1O4C9csZlmZxVax1+HJ7gysjyu9K4zAJ42o4UQc9UKSZiMX0/TuyxL
   TI23e2DFEuBG2qmXsc0ug3FHVTqQSrsKayYmS90t/8dggFx4TtPGskCq2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="328431598"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000";
   d="scan'208";a="328431598"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 03:47:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="756016285"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000";
   d="scan'208";a="756016285"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2023 03:47:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPiuk-0004QQ-2K;
	Wed, 08 Feb 2023 11:47:02 +0000
Date: Wed, 8 Feb 2023 19:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <lucas.tanure@collabora.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 1/2] ALSA: cs35l41: Add shared boost feature
Message-ID: <202302081911.MDwfUTfx-lkp@intel.com>
References: <20230207104021.2842-2-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207104021.2842-2-lucas.tanure@collabora.com>
Message-ID-Hash: UQTFFVN7HOO4PPSIAZ62L2KQQN7KM5SL
X-Message-ID-Hash: UQTFFVN7HOO4PPSIAZ62L2KQQN7KM5SL
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Lucas Tanure <lucas.tanure@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQTFFVN7HOO4PPSIAZ62L2KQQN7KM5SL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lucas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.2-rc7 next-20230208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/ALSA-cs35l41-Add-shared-boost-feature/20230207-184238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230207104021.2842-2-lucas.tanure%40collabora.com
patch subject: [PATCH 1/2] ALSA: cs35l41: Add shared boost feature
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230208/202302081911.MDwfUTfx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c1726800667180cd46986c3578e635bafa8bf01a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Tanure/ALSA-cs35l41-Add-shared-boost-feature/20230207-184238
        git checkout c1726800667180cd46986c3578e635bafa8bf01a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs35l41-lib.c:1160:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case CS35L41_SHD_BOOST_PASS:
                ^~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l41-lib.c:1169:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   sound/soc/codecs/cs35l41-lib.c:1136:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +1160 sound/soc/codecs/cs35l41-lib.c

  1132	
  1133	int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
  1134			       struct cs35l41_hw_cfg *hw_cfg)
  1135	{
  1136		int ret;
  1137	
  1138		switch (hw_cfg->bst_type) {
  1139		case CS35L41_SHD_BOOST_ACTV:
  1140			regmap_multi_reg_write(regmap, cs35l41_actv_seq, ARRAY_SIZE(cs35l41_actv_seq));
  1141			fallthrough;
  1142		case CS35L41_INT_BOOST:
  1143			ret = cs35l41_boost_config(dev, regmap, hw_cfg->bst_ind,
  1144						   hw_cfg->bst_cap, hw_cfg->bst_ipk);
  1145			if (ret)
  1146				dev_err(dev, "Error in Boost DT config: %d\n", ret);
  1147			break;
  1148		case CS35L41_EXT_BOOST:
  1149		case CS35L41_EXT_BOOST_NO_VSPK_SWITCH:
  1150			/* Only CLSA0100 doesn't use GPIO as VSPK switch, but even on that laptop we can
  1151			 * toggle GPIO1 as is not connected to anything.
  1152			 * There will be no other device without VSPK switch.
  1153			 */
  1154			regmap_write(regmap, CS35L41_GPIO1_CTRL1, 0x00000001);
  1155			regmap_multi_reg_write(regmap, cs35l41_reset_to_safe,
  1156					       ARRAY_SIZE(cs35l41_reset_to_safe));
  1157			ret = regmap_update_bits(regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
  1158						 CS35L41_BST_DIS_FET_OFF << CS35L41_BST_EN_SHIFT);
  1159			break;
> 1160		case CS35L41_SHD_BOOST_PASS:
  1161			regmap_multi_reg_write(regmap, cs35l41_pass_seq, ARRAY_SIZE(cs35l41_pass_seq));
  1162			break;
  1163		default:
  1164			dev_err(dev, "Boost type %d not supported\n", hw_cfg->bst_type);
  1165			ret = -EINVAL;
  1166			break;
  1167		}
  1168	
  1169		return ret;
  1170	}
  1171	EXPORT_SYMBOL_GPL(cs35l41_init_boost);
  1172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
