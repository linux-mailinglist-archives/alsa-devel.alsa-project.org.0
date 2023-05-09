Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB76FC1C8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 10:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12844101F;
	Tue,  9 May 2023 10:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12844101F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683621325;
	bh=q/BMkkxgdTsxRudYzNn01gkjO4c7fy19I0TVPFZhOCo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FNkAdtS5dm2MwRHFz1rwOXSFvdtK522ZScKNZDssdR8rNRLAwoji+qhBwnPk66nLb
	 czENPag5hCbhx9dDkiRLBSr/Lwaq9YwIMg8l7wmuj1y/2d+eeX8aZ5qE0komDu+mPL
	 10m01vupSOXgdUDNXU3T+oJn222CoJlIHfYaXPb8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DA5F80310;
	Tue,  9 May 2023 10:34:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AF81F8032D; Tue,  9 May 2023 10:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B7A3F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 10:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B7A3F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gBqC98LJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683621256; x=1715157256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q/BMkkxgdTsxRudYzNn01gkjO4c7fy19I0TVPFZhOCo=;
  b=gBqC98LJ3q3tJC6gJy/pTQ31AoUCxL4iEmJpa7JOMbdwT0tzqaj6CB25
   K9bbAe0wiL4nWdHc7/bQvapJ0D3Vpx2/I+GC2iTEV6k7Qm/Z/Xrz5bDBt
   3tHD3oK/EO99ekXYdpsMVSH0betPO5kU/7d4GdkV1I3ag+TaLGDgb5YZ7
   ttqNaKWry4rTIBiXf+wfoUGehWUQQxN+vyLneffmbtSubw64R7n+J4hbf
   A5n/y2MqZRXuWDkYqrgn6Dx9kT+m4SSfl3FAFp/9k1ECCFrxAzO2VtdtM
   WigpDaLJEnwTUXFt5WeGzRBdqaMtbDwiCc0LUgT18Aw0ytXrvia0Obf52
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348669160"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200";
   d="scan'208";a="348669160"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="731591229"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200";
   d="scan'208";a="731591229"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 May 2023 01:33:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwIn5-0001yk-26;
	Tue, 09 May 2023 08:33:47 +0000
Date: Tue, 9 May 2023 16:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Message-ID: <202305091640.yA163Rrh-lkp@intel.com>
References: <20230509061321.10218-1-quic_visr@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509061321.10218-1-quic_visr@quicinc.com>
Message-ID-Hash: LGL4CODDL7XCV5RNN2DKNE5TXCFQ7D6X
X-Message-ID-Hash: LGL4CODDL7XCV5RNN2DKNE5TXCFQ7D6X
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, quic_visr@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGL4CODDL7XCV5RNN2DKNE5TXCFQ7D6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Ravulapati,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ravulapati-Vishnu-Vardhan-Rao/ASoC-codecs-lpass-Fix-for-KASAN-use_after_free-out-of-bounds/20230509-141447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230509061321.10218-1-quic_visr%40quicinc.com
patch subject: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of bounds
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230509/202305091640.yA163Rrh-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83fb508f4eb95e9495f0e440b47226040e3b4efc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ravulapati-Vishnu-Vardhan-Rao/ASoC-codecs-lpass-Fix-for-KASAN-use_after_free-out-of-bounds/20230509-141447
        git checkout 83fb508f4eb95e9495f0e440b47226040e3b4efc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091640.yA163Rrh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_put_dec_enum':
>> sound/soc/codecs/lpass-tx-macro.c:801:57: warning: missing terminating " character
     801 |                                 dev_err(component->dev, "dmic for clk sel is wrong,
         |                                                         ^
   sound/soc/codecs/lpass-tx-macro.c:802:79: warning: missing terminating " character
     802 |                                         expected less than 4 but received %d\n", dmic);
         |                                                                               ^
   sound/soc/codecs/lpass-tx-macro.c:2199:23: error: unterminated argument list invoking macro "dev_err"
    2199 | MODULE_LICENSE("GPL");
         |                       ^
   sound/soc/codecs/lpass-tx-macro.c:801:33: error: 'dev_err' undeclared (first use in this function); did you mean '_dev_err'?
     801 |                                 dev_err(component->dev, "dmic for clk sel is wrong,
         |                                 ^~~~~~~
         |                                 _dev_err
   sound/soc/codecs/lpass-tx-macro.c:801:33: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/codecs/lpass-tx-macro.c:801:40: error: expected ';' at end of input
     801 |                                 dev_err(component->dev, "dmic for clk sel is wrong,
         |                                        ^
         |                                        ;
   ......
   sound/soc/codecs/lpass-tx-macro.c:801:33: error: expected declaration or statement at end of input
     801 |                                 dev_err(component->dev, "dmic for clk sel is wrong,
         |                                 ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:801:33: error: expected declaration or statement at end of input
   sound/soc/codecs/lpass-tx-macro.c:788:19: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     788 |                 } else if (val < 5) {
         |                   ^~~~
   sound/soc/codecs/lpass-tx-macro.c:788:19: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
   sound/soc/codecs/lpass-tx-macro.c:801:33: error: expected declaration or statement at end of input
     801 |                                 dev_err(component->dev, "dmic for clk sel is wrong,
         |                                 ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:801:33: error: expected declaration or statement at end of input
   sound/soc/codecs/lpass-tx-macro.c: At top level:
   sound/soc/codecs/lpass-tx-macro.c:737:12: warning: 'tx_macro_put_dec_enum' defined but not used [-Wunused-function]
     737 | static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
         |            ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:717:12: warning: 'tx_macro_mclk_event' defined but not used [-Wunused-function]
     717 | static int tx_macro_mclk_event(struct snd_soc_dapm_widget *w,
         |            ^~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:699:13: warning: 'tx_macro_mute_update_callback' defined but not used [-Wunused-function]
     699 | static void tx_macro_mute_update_callback(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:655:13: warning: 'tx_macro_tx_hpf_corner_freq_callback' defined but not used [-Wunused-function]
     655 | static void tx_macro_tx_hpf_corner_freq_callback(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:587:35: warning: 'tx_regmap_config' defined but not used [-Wunused-const-variable=]
     587 | static const struct regmap_config tx_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~
   In file included from include/sound/tlv.h:10,
                    from sound/soc/codecs/lpass-tx-macro.c:13:
   sound/soc/codecs/lpass-tx-macro.c:281:35: warning: 'digital_gain' defined but not used [-Wunused-const-variable=]
     281 | static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
         |                                   ^~~~~~~~~~~~
   include/uapi/sound/tlv.h:53:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      53 |         unsigned int name[] = { \
         |                      ^~~~
   sound/soc/codecs/lpass-tx-macro.c:281:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
     281 | static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +801 sound/soc/codecs/lpass-tx-macro.c

   736	
   737	static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
   738					 struct snd_ctl_elem_value *ucontrol)
   739	{
   740		struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
   741		struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
   742		struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
   743		unsigned int val, dmic;
   744		u16 mic_sel_reg;
   745		u16 dmic_clk_reg;
   746		struct tx_macro *tx = snd_soc_component_get_drvdata(component);
   747	
   748		val = ucontrol->value.enumerated.item[0];
   749		if (val < 0 && val > 15) {
   750			dev_err(component->dev, "Wrong value for DMIC configuration");
   751			return -EINVAL;
   752		}
   753	
   754		switch (e->reg) {
   755		case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
   756			mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
   757			break;
   758		case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
   759			mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
   760			break;
   761		case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
   762			mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
   763			break;
   764		case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
   765			mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
   766			break;
   767		case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
   768			mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
   769			break;
   770		case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
   771			mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
   772			break;
   773		case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
   774			mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
   775			break;
   776		case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
   777			mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
   778			break;
   779		default:
   780			dev_err(component->dev, "Error in configuration!!\n");
   781			return -EINVAL;
   782		}
   783	
   784		if (val != 0) {
   785			if (widget->shift) { /* MSM DMIC */
   786				snd_soc_component_write_field(component, mic_sel_reg,
   787							      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
   788			} else if (val < 5) {
   789				snd_soc_component_write_field(component, mic_sel_reg,
   790							      CDC_TXn_ADC_DMIC_SEL_MASK, 0);
   791			} else {
   792				snd_soc_component_write_field(component, mic_sel_reg,
   793							      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
   794				dmic = TX_ADC_TO_DMIC(val);
   795				if (dmic < 4) {
   796					dmic_clk_reg = CDC_TX_TOP_CSR_SWR_DMICn_CTL(dmic);
   797					snd_soc_component_write_field(component, dmic_clk_reg,
   798								      CDC_TX_SWR_DMIC_CLK_SEL_MASK,
   799									tx->dmic_clk_div);
   800				} else {
 > 801					dev_err(component->dev, "dmic for clk sel is wrong,
   802						expected less than 4 but received %d\n", dmic);
   803					return -EINVAL;
   804				}
   805	
   806			}
   807		}
   808		return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
   809	}
   810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
