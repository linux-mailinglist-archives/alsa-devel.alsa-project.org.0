Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96E80879A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 13:23:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4DC850;
	Thu,  7 Dec 2023 13:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4DC850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701951808;
	bh=Ujh58FHcb5tb2jGK1N8YKu30AfBLDN/psJSNOj5NXOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j6r8OzAjGuSOV6LfwtmGLLLEotVvxQcZbFZ7JeWtUBiNS9khAjNQgPB7dTxIWjcf7
	 zqUHkhIErhL17uQvCFn5RU335JffcoaB1GkXm5403iQIQGQqI2IZ/YwPgj1ci8fpez
	 imUHDG3EXx9eNYCXXZD7cfxIxulZMXlModZUq7uQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB194F80563; Thu,  7 Dec 2023 13:22:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA377F80571;
	Thu,  7 Dec 2023 13:22:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE119F8024E; Thu,  7 Dec 2023 13:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DCEAF800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 13:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DCEAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kaYuvgwS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701951766; x=1733487766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ujh58FHcb5tb2jGK1N8YKu30AfBLDN/psJSNOj5NXOI=;
  b=kaYuvgwStHQxxNnMtxlG1VYRnAIfm+ucKML3LCW2XMMRGdLz5Yysj18/
   eZ2H1up1kYzg+afIWT6tdjxIYFdHSRJUaxaJV+ZoDOWWBSvzXAIV/MIg9
   s74uvWwEiri8wIlQz2FGzP9fq7VXyZcpMJUzk/udGG/+DevKwusDP0iLe
   nY8QIETtrmCjhgTkItXVl7d5idmMpRFztgnbjBoj19gs2I2Qu/Z9T7+Zv
   G27dLBfHFUoda2IzSgpZaSoRlDhjKoshcAln6s7gvphvb5HhQdUekvejt
   A9BlqOhCz61CRXsTYWTw+5+6X2HN9074j5XE39N9VNdxdYCbvmhI6WcV5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7530810"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="7530810"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="945013859"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="945013859"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2023 04:22:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBDOk-000CDr-2t;
	Thu, 07 Dec 2023 12:22:34 +0000
Date: Thu, 7 Dec 2023 20:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
Message-ID: <202312072037.CYK5reOb-lkp@intel.com>
References: 
 <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer@irl.hu>
Message-ID-Hash: TOJA4P3YG7FJR6CDD5QAY2HTN2B3DZEY
X-Message-ID-Hash: TOJA4P3YG7FJR6CDD5QAY2HTN2B3DZEY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOJA4P3YG7FJR6CDD5QAY2HTN2B3DZEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Gergo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc4 next-20231207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gergo-Koteles/ALSA-hda-tas2781-leave-hda_component-in-usable-state/20231207-085947
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/8f16576930682297fd08bba5e063a9a1f3150388.1701906455.git.soyer%40irl.hu
patch subject: [PATCH 13/16] ALSA: hda/tas2781: remove sound controls in unbind
config: x86_64-randconfig-013-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072037.CYK5reOb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072037.CYK5reOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072037.CYK5reOb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/tas2781_hda_i2c.c: In function 'tas2781_runtime_resume':
>> sound/pci/hda/tas2781_hda_i2c.c:868:1: warning: label 'out' defined but not used [-Wunused-label]
     868 | out:
         | ^~~


vim +/out +868 sound/pci/hda/tas2781_hda_i2c.c

   852	
   853	static int tas2781_runtime_resume(struct device *dev)
   854	{
   855		struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
   856	
   857		dev_dbg(tas_hda->dev, "Runtime Resume\n");
   858	
   859		mutex_lock(&tas_hda->priv->codec_lock);
   860	
   861		tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
   862	
   863		/* If calibrated data occurs error, dsp will still works with default
   864		 * calibrated data inside algo.
   865		 */
   866		tasdevice_apply_calibration(tas_hda->priv);
   867	
 > 868	out:
   869		mutex_unlock(&tas_hda->priv->codec_lock);
   870	
   871		return 0;
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
