Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B955407F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 04:23:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6EF1FCF;
	Wed, 22 Jun 2022 04:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6EF1FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655864620;
	bh=hgLT3oRHawdLqKpmYv8HkTRv5KUBCJZSRS2FwpeWMPE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EABZ0R1ojKEFnVwlk+s6Gh2QcqaVwC77b+w5Cpsmt97AvwT8l9adfeBCyPq8BPmT4
	 1koA2e/Nwrk3GWP/xI6okxG9ZmtgiLDEF2snKyOleQ3F93a0V1ehxpXWfYoM60lDuR
	 AMG3fi9jVoQpDNPDS5+7ZTbYr7y2B3Xp0TIEAtp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693D7F80100;
	Wed, 22 Jun 2022 04:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3198F8019B; Wed, 22 Jun 2022 04:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF6E8F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 04:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF6E8F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QeRDkA0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655864554; x=1687400554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hgLT3oRHawdLqKpmYv8HkTRv5KUBCJZSRS2FwpeWMPE=;
 b=QeRDkA0CXlUgyUq3eE1z9sP/iHcsAzjq9S+zOUC3paApZ9c1CQwZU+iD
 CqI/QcZ7V7RFCNcRHP2BLmZbHD36dkEq9ZVWjohDR8aOgOdEw8STh9pCo
 ytXW39hgxCxquaErcOHD2fdClKNNg8D5Zohn2s1JWzjJQsd9QgddOc6GC
 QG6VNAefJ3XIS7I8AZb3+nzMaHbhfuyV3RPYvFEQnaFoPrihtHA4HaJlU
 rEpRyOkuKL0Zx8KNGhcQvasAWDxZBjnTatnhTTnkz4pu9L/22VZQyWq79
 NnqIC7RxsUbacoIAT+gPL4mmjTayUdnIOSEkISW8lMCRBXMxld4YPv29Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260112606"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="260112606"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 19:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="620716476"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 21 Jun 2022 19:22:25 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3q0e-0000iY-If;
 Wed, 22 Jun 2022 02:22:24 +0000
Date: Wed, 22 Jun 2022 10:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v6 04/14] ALSA: hda: cs35l41: Add initial DSP support and
 firmware loading
Message-ID: <202206221009.dFR3qUz0-lkp@intel.com>
References: <20220621213801.2021097-5-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621213801.2021097-5-vitalyr@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Vitaly Rodionov <vitaly.rodionov@cirrus.com>
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

Hi Vitaly,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on linus/master v5.19-rc3 next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Rodionov/ALSA-hda-cirrus-Add-initial-DSP-support-and-firmware-loading/20220622-054218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220622/202206221009.dFR3qUz0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9a9e48e89004a7f0c7f21aae4dc45d34469cc789
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vitaly-Rodionov/ALSA-hda-cirrus-Add-initial-DSP-support-and-firmware-loading/20220622-054218
        git checkout 9a9e48e89004a7f0c7f21aae4dc45d34469cc789
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/pci/hda/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from include/sound/soc.h:14,
                    from sound/pci/hda/hda_cs_dsp_ctl.c:10:
   sound/pci/hda/hda_cs_dsp_ctl.c: In function 'hda_cs_dsp_add_kcontrol':
>> sound/pci/hda/hda_cs_dsp_ctl.c:101:43: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     101 |                 dev_err(cs_ctl->dsp->dev, "Control %s: length %lu exceeds maximum %d\n", ctl->name,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   sound/pci/hda/hda_cs_dsp_ctl.c:101:17: note: in expansion of macro 'dev_err'
     101 |                 dev_err(cs_ctl->dsp->dev, "Control %s: length %lu exceeds maximum %d\n", ctl->name,
         |                 ^~~~~~~
   sound/pci/hda/hda_cs_dsp_ctl.c:101:65: note: format string is defined here
     101 |                 dev_err(cs_ctl->dsp->dev, "Control %s: length %lu exceeds maximum %d\n", ctl->name,
         |                                                               ~~^
         |                                                                 |
         |                                                                 long unsigned int
         |                                                               %u


vim +101 sound/pci/hda/hda_cs_dsp_ctl.c

5c0e0c1e30c723 Stefan Binding 2022-06-21   92  
5c0e0c1e30c723 Stefan Binding 2022-06-21   93  static int hda_cs_dsp_add_kcontrol(struct hda_cs_dsp_coeff_ctl *ctl)
5c0e0c1e30c723 Stefan Binding 2022-06-21   94  {
5c0e0c1e30c723 Stefan Binding 2022-06-21   95  	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
5c0e0c1e30c723 Stefan Binding 2022-06-21   96  	struct snd_kcontrol_new *kcontrol;
5c0e0c1e30c723 Stefan Binding 2022-06-21   97  	struct snd_kcontrol *kctl;
5c0e0c1e30c723 Stefan Binding 2022-06-21   98  	int ret = 0;
5c0e0c1e30c723 Stefan Binding 2022-06-21   99  
5c0e0c1e30c723 Stefan Binding 2022-06-21  100  	if (cs_ctl->len > ADSP_MAX_STD_CTRL_SIZE) {
5c0e0c1e30c723 Stefan Binding 2022-06-21 @101  		dev_err(cs_ctl->dsp->dev, "Control %s: length %lu exceeds maximum %d\n", ctl->name,
5c0e0c1e30c723 Stefan Binding 2022-06-21  102  			cs_ctl->len, ADSP_MAX_STD_CTRL_SIZE);
5c0e0c1e30c723 Stefan Binding 2022-06-21  103  		return -EINVAL;
5c0e0c1e30c723 Stefan Binding 2022-06-21  104  	}
5c0e0c1e30c723 Stefan Binding 2022-06-21  105  
5c0e0c1e30c723 Stefan Binding 2022-06-21  106  	kcontrol = kzalloc(sizeof(*kcontrol), GFP_KERNEL);
5c0e0c1e30c723 Stefan Binding 2022-06-21  107  	if (!kcontrol)
5c0e0c1e30c723 Stefan Binding 2022-06-21  108  		return -ENOMEM;
5c0e0c1e30c723 Stefan Binding 2022-06-21  109  
5c0e0c1e30c723 Stefan Binding 2022-06-21  110  	kcontrol->name = ctl->name;
5c0e0c1e30c723 Stefan Binding 2022-06-21  111  	kcontrol->info = hda_cs_dsp_coeff_info;
5c0e0c1e30c723 Stefan Binding 2022-06-21  112  	kcontrol->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
5c0e0c1e30c723 Stefan Binding 2022-06-21  113  	kcontrol->private_value = (unsigned long)ctl;
5c0e0c1e30c723 Stefan Binding 2022-06-21  114  	kcontrol->access = wmfw_convert_flags(cs_ctl->flags);
5c0e0c1e30c723 Stefan Binding 2022-06-21  115  
5c0e0c1e30c723 Stefan Binding 2022-06-21  116  	kcontrol->get = hda_cs_dsp_coeff_get;
5c0e0c1e30c723 Stefan Binding 2022-06-21  117  	kcontrol->put = hda_cs_dsp_coeff_put;
5c0e0c1e30c723 Stefan Binding 2022-06-21  118  
5c0e0c1e30c723 Stefan Binding 2022-06-21  119  	kctl = snd_ctl_new1(kcontrol, NULL);
5c0e0c1e30c723 Stefan Binding 2022-06-21  120  	if (!kctl) {
5c0e0c1e30c723 Stefan Binding 2022-06-21  121  		ret = -ENOMEM;
5c0e0c1e30c723 Stefan Binding 2022-06-21  122  		goto err;
5c0e0c1e30c723 Stefan Binding 2022-06-21  123  	}
5c0e0c1e30c723 Stefan Binding 2022-06-21  124  	ctl->kctl = kctl;
5c0e0c1e30c723 Stefan Binding 2022-06-21  125  
5c0e0c1e30c723 Stefan Binding 2022-06-21  126  	ret = snd_ctl_add(ctl->card, kctl);
5c0e0c1e30c723 Stefan Binding 2022-06-21  127  	if (ret)
5c0e0c1e30c723 Stefan Binding 2022-06-21  128  		dev_err(cs_ctl->dsp->dev, "Failed to add KControl: %s - Ret: %d\n", kcontrol->name,
5c0e0c1e30c723 Stefan Binding 2022-06-21  129  			ret);
5c0e0c1e30c723 Stefan Binding 2022-06-21  130  	else
5c0e0c1e30c723 Stefan Binding 2022-06-21  131  		dev_dbg(cs_ctl->dsp->dev, "Added KControl: %s\n", kcontrol->name);
5c0e0c1e30c723 Stefan Binding 2022-06-21  132  
5c0e0c1e30c723 Stefan Binding 2022-06-21  133  err:
5c0e0c1e30c723 Stefan Binding 2022-06-21  134  	kfree(kcontrol);
5c0e0c1e30c723 Stefan Binding 2022-06-21  135  
5c0e0c1e30c723 Stefan Binding 2022-06-21  136  	return ret;
5c0e0c1e30c723 Stefan Binding 2022-06-21  137  }
5c0e0c1e30c723 Stefan Binding 2022-06-21  138  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
