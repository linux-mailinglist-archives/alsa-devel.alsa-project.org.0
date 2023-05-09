Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C36FC1DF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 10:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910C51052;
	Tue,  9 May 2023 10:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910C51052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683621951;
	bh=CxchOLSb2uQiQ0wq39RpL59EhQg6Bj3Eg9bjmW5VqwU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ugQG2wI+Z50oNzUXur1SsDckMhmKE95Fm4JiKxkpiKr2jvNH6ClihsHwIMY7X3Ld0
	 a3om3yYFxiCm4DAu702c2mHHk4nztb0aswNlUSHFxiTkHXtWbQR7Bh5AvUvPl9gcA6
	 gFXmMOrcfJ6ZDDL0ixUSRMxpzW3kIu4UKUSWgONM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2BA5F8014C;
	Tue,  9 May 2023 10:45:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66FC3F8032D; Tue,  9 May 2023 10:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5646CF80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 10:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5646CF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gQpjqFtG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683621895; x=1715157895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CxchOLSb2uQiQ0wq39RpL59EhQg6Bj3Eg9bjmW5VqwU=;
  b=gQpjqFtGQ4o1d+OrxQCnuyz0/ZoctLRviGo320PjlFW4eHsU0yz6c3Lh
   n1XysZ9hv3+KYOgCFQZRKIgly3znTil+I0IhgPv3ygPxVBR6srF2cixnr
   p8gqRIfWGsPzoc1yf74dywgvTx27/VdYSpnwbogYEgnwWwQICtkUerMT1
   MvlES1Jki82tME+4HfjT6K6jzWVp0utGnInQndZuT4WzZXrCedN8acjbr
   c0Uw66i9gXmN3JwDAFxEgfVFbPb1PBcDnDzRu49m01ejSQZKDjnR8dpjp
   iiYeUPRsZBGiZysp5iwQ6R4G18n3GKFMVuo0D5q9WjPXgj1UaEZY20AVR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436163464"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200";
   d="scan'208";a="436163464"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 01:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763733944"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200";
   d="scan'208";a="763733944"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 01:44:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwIxk-0001zE-2r;
	Tue, 09 May 2023 08:44:48 +0000
Date: Tue, 9 May 2023 16:43:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Message-ID: <202305091655.6KwfcuWa-lkp@intel.com>
References: <20230509061321.10218-1-quic_visr@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509061321.10218-1-quic_visr@quicinc.com>
Message-ID-Hash: AREVOZHPCTKQEBLTW5V352I2ZMGYJDYQ
X-Message-ID-Hash: AREVOZHPCTKQEBLTW5V352I2ZMGYJDYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AREVOZHPCTKQEBLTW5V352I2ZMGYJDYQ/>
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
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230509/202305091655.6KwfcuWa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/83fb508f4eb95e9495f0e440b47226040e3b4efc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ravulapati-Vishnu-Vardhan-Rao/ASoC-codecs-lpass-Fix-for-KASAN-use_after_free-out-of-bounds/20230509-141447
        git checkout 83fb508f4eb95e9495f0e440b47226040e3b4efc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091655.6KwfcuWa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/lpass-tx-macro.c: In function 'tx_macro_put_dec_enum':
   sound/soc/codecs/lpass-tx-macro.c:801:57: warning: missing terminating " character
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
   At top level:
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
>> sound/soc/codecs/lpass-tx-macro.c:587:35: warning: 'tx_regmap_config' defined but not used [-Wunused-const-variable=]
     587 | static const struct regmap_config tx_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~
   In file included from include/sound/tlv.h:10,
                    from sound/soc/codecs/lpass-tx-macro.c:13:
>> sound/soc/codecs/lpass-tx-macro.c:281:35: warning: 'digital_gain' defined but not used [-Wunused-const-variable=]
     281 | static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
         |                                   ^~~~~~~~~~~~
   include/uapi/sound/tlv.h:53:22: note: in definition of macro 'SNDRV_CTL_TLVD_DECLARE_DB_SCALE'
      53 |         unsigned int name[] = { \
         |                      ^~~~
   sound/soc/codecs/lpass-tx-macro.c:281:14: note: in expansion of macro 'DECLARE_TLV_DB_SCALE'
     281 | static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
         |              ^~~~~~~~~~~~~~~~~~~~


vim +/tx_regmap_config +587 sound/soc/codecs/lpass-tx-macro.c

c39667ddcfc516 Srinivas Kandagatla 2021-02-11  586  
c39667ddcfc516 Srinivas Kandagatla 2021-02-11 @587  static const struct regmap_config tx_regmap_config = {
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  588  	.name = "tx_macro",
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  589  	.reg_bits = 16,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  590  	.val_bits = 32,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  591  	.reg_stride = 4,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  592  	.cache_type = REGCACHE_FLAT,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  593  	.max_register = TX_MAX_OFFSET,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  594  	.reg_defaults = tx_defaults,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  595  	.num_reg_defaults = ARRAY_SIZE(tx_defaults),
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  596  	.writeable_reg = tx_is_rw_register,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  597  	.volatile_reg = tx_is_volatile_register,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  598  	.readable_reg = tx_is_rw_register,
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  599  };
c39667ddcfc516 Srinivas Kandagatla 2021-02-11  600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
