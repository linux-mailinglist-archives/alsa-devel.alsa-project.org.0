Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDCF53BF39
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 22:02:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37E4217FD;
	Thu,  2 Jun 2022 22:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37E4217FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654200121;
	bh=LhfFstmU8umuCBkObaNVgZTt4U6is+wjbx1RU6J1Iwg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peTvn4SYltjEjBqpp5NjTMSOFaEYqUNWGTLI9epifWveWipLS0rmeeVmoFt1BiU9Q
	 fcMRY8Vo+cFp7ZYmZBd9iHC5HQSd40zZohayBcaQeCAupvp5fuleJTC4KgOHty5HSm
	 OMbmqUp8qhsyt9sjMIExn7U3AH/dXJ2AEfNi7wpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2465F8025E;
	Thu,  2 Jun 2022 22:01:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83002F80236; Thu,  2 Jun 2022 22:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3594AF80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 22:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3594AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H49Sbuyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654200055; x=1685736055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LhfFstmU8umuCBkObaNVgZTt4U6is+wjbx1RU6J1Iwg=;
 b=H49Sbuyx/yV85fDtWhQv9yL1r9wQGxRiavDjQPh1rHn7hBTsXSNwXYxB
 eqix6Az5/2V1gTKLgJY/kfPKRF1u1aPGmgznn+oc2w9cy3ut6zls1ycMb
 1Q0ahZNKEwCkqMl6dTFqZHhW5cMzemrHMbpX328GWhAfcxG+35zvVnkmO
 P9+OHwaG51OmORvZRfODHVlVowtE/QVAyGzmNSvRstLfab8TgSeJV0oGD
 54OVJjMa1zmBZADltVn6Y07SuM7p6GJArk1iX3galf8iEz3q0RPEzxK1n
 r9KIQkBN70ztPdV2aMMIRIhWdi5u1RtwoNMPwE1Ievcwm2TiXAsud1FHA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="255930477"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="255930477"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="668144480"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2022 13:00:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nwqzu-0005PB-54;
 Thu, 02 Jun 2022 20:00:46 +0000
Date: Fri, 3 Jun 2022 04:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 15/20] ASoC: tlv320aic23: Use modern ASoC DAI format
 terminology
Message-ID: <202206030307.ZnUCVGoC-lkp@intel.com>
References: <20220602135316.3554400-16-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602135316.3554400-16-broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on v5.18 next-20220602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/ASoC-DAI-clocking-terminology-modernisation/20220602-220124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220603/202206030307.ZnUCVGoC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3ef04fe7b323f8132d917a0f3b54ff93e003db5c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Brown/ASoC-DAI-clocking-terminology-modernisation/20220602-220124
        git checkout 3ef04fe7b323f8132d917a0f3b54ff93e003db5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tlv320aic23.c:432:16: error: use of undeclared identifier 'SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK'
           switch (fmt & SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK) {
                         ^
   1 error generated.


vim +/SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK +432 sound/soc/codecs/tlv320aic23.c

   423	
   424	static int tlv320aic23_set_dai_fmt(struct snd_soc_dai *codec_dai,
   425					   unsigned int fmt)
   426	{
   427		struct snd_soc_component *component = codec_dai->component;
   428		u16 iface_reg;
   429	
   430		iface_reg = snd_soc_component_read(component, TLV320AIC23_DIGT_FMT) & (~0x03);
   431	
 > 432		switch (fmt & SND_SOC_DAIFMT_CLOCk_PROVIDER_MASK) {
   433		case SND_SOC_DAIFMT_CBP_CFP:
   434			iface_reg |= TLV320AIC23_MS_MASTER;
   435			break;
   436		case SND_SOC_DAIFMT_CBC_CFC:
   437			iface_reg &= ~TLV320AIC23_MS_MASTER;
   438			break;
   439		default:
   440			return -EINVAL;
   441	
   442		}
   443	
   444		/* interface format */
   445		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
   446		case SND_SOC_DAIFMT_I2S:
   447			iface_reg |= TLV320AIC23_FOR_I2S;
   448			break;
   449		case SND_SOC_DAIFMT_DSP_A:
   450			iface_reg |= TLV320AIC23_LRP_ON;
   451			fallthrough;
   452		case SND_SOC_DAIFMT_DSP_B:
   453			iface_reg |= TLV320AIC23_FOR_DSP;
   454			break;
   455		case SND_SOC_DAIFMT_RIGHT_J:
   456			break;
   457		case SND_SOC_DAIFMT_LEFT_J:
   458			iface_reg |= TLV320AIC23_FOR_LJUST;
   459			break;
   460		default:
   461			return -EINVAL;
   462	
   463		}
   464	
   465		snd_soc_component_write(component, TLV320AIC23_DIGT_FMT, iface_reg);
   466	
   467		return 0;
   468	}
   469	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
