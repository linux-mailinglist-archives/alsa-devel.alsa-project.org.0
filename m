Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3888FE89
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 13:02:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76F252C7D;
	Thu, 28 Mar 2024 13:02:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76F252C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711627333;
	bh=PeT1k7HFtdibwwcfqd/4kcbln3gTsY92u2mVuYqFY74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hpupBYmMKaF9Oy3bphLhilnJn7EsiMEBYL1UlKqaq5484LgQpzPllLxrM081yPIGM
	 w06Iqsjyzkr1/Wq8MiiQ6VRn2DJQO6PHsxTxwWGSJmgl8obQhFoNxxQ7OzFl+cLBGR
	 npm+Ydw2KN1FJ4dbQDTneUWhO/v0L4CKpXDL8e/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E750F8058C; Thu, 28 Mar 2024 13:01:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ADDEF8057C;
	Thu, 28 Mar 2024 13:01:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D719F8025F; Thu, 28 Mar 2024 13:01:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A020F80093
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 13:01:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A020F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZXPe2jmh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711627285; x=1743163285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PeT1k7HFtdibwwcfqd/4kcbln3gTsY92u2mVuYqFY74=;
  b=ZXPe2jmh9wWq2Gm54DvE2/ag51aZzpS+GoQ8Gccoewj5skNc+D100Gjo
   GYowghQbJl+/WakBV2xL22gISclF0PgI9Nt77MY2rJSeTX9gGOOKb5b1v
   Ux0GNRo/vk1IUm3MkfbObTMsLT0KGLxrympqqGRYv89vZlbH39ECFJP2T
   ojgRXvtVBcloZejSiBwGHFGOAgPB6WD2GhWxeIjfcNErqa9B2eLX5tWg1
   mmr0+FJWoIZzYEDL8rjwrbaN96A6KUxcS/6qcYP08rXQU1ppUhwWugRgT
   5oa69uDW4Y6Ka9c0t5QRmeWApTN/WB135bNTu9iOiOXykHqzIbzv39yyE
   g==;
X-CSE-ConnectionGUID: 9Se5UiipSl2hjNsht3KlTw==
X-CSE-MsgGUID: rmS+eXh5SkqfdEvK162Png==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17502929"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000";
   d="scan'208";a="17502929"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000";
   d="scan'208";a="16556261"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2024 05:01:07 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpoRM-00026y-0v;
	Thu, 28 Mar 2024 12:01:04 +0000
Date: Thu, 28 Mar 2024 20:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
	tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 3/3] ASoC: soc-card: Add KUnit test case for
 snd_soc_card_get_kcontrol
Message-ID: <202403281952.Sz5iE5Tm-lkp@intel.com>
References: <20240325125650.213913-4-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325125650.213913-4-rf@opensource.cirrus.com>
Message-ID-Hash: KK3V5KC2VDTODNLKPFBWRJZGNPSMM6YJ
X-Message-ID-Hash: KK3V5KC2VDTODNLKPFBWRJZGNPSMM6YJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KK3V5KC2VDTODNLKPFBWRJZGNPSMM6YJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.9-rc1 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ALSA-control-Introduce-snd_ctl_find_id_mixer_locked/20240325-210026
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240325125650.213913-4-rf%40opensource.cirrus.com
patch subject: [PATCH 3/3] ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol
config: powerpc-randconfig-r081-20240328 (https://download.01.org/0day-ci/archive/20240328/202403281952.Sz5iE5Tm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403281952.Sz5iE5Tm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281952.Sz5iE5Tm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-card-test.c:24:13: error: initializer element is not a compile-time constant
           SOC_SINGLE(test_control_names[0], SND_SOC_NOPM, 0, 1, 0),
                      ^~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:61:48: note: expanded from macro 'SOC_SINGLE'
   {       .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
                                                        ^~~~~
   1 error generated.


vim +24 sound/soc/soc-card-test.c

    22	
    23	static const struct snd_kcontrol_new test_card_controls[] = {
  > 24		SOC_SINGLE(test_control_names[0], SND_SOC_NOPM, 0, 1, 0),
    25		SOC_SINGLE(test_control_names[1], SND_SOC_NOPM, 1, 1, 0),
    26		SOC_SINGLE(test_control_names[2], SND_SOC_NOPM, 2, 1, 0),
    27		SOC_SINGLE(test_control_names[3], SND_SOC_NOPM, 3, 1, 0),
    28		SOC_SINGLE(test_control_names[4], SND_SOC_NOPM, 4, 1, 0),
    29		SOC_SINGLE(test_control_names[5], SND_SOC_NOPM, 5, 1, 0),
    30		SOC_SINGLE(test_control_names[6], SND_SOC_NOPM, 6, 1, 0),
    31		SOC_SINGLE(test_control_names[7], SND_SOC_NOPM, 7, 1, 0),
    32		SOC_SINGLE(test_control_names[8], SND_SOC_NOPM, 8, 1, 0),
    33		SOC_SINGLE(test_control_names[9], SND_SOC_NOPM, 9, 1, 0),
    34		SOC_SINGLE(test_control_names[10], SND_SOC_NOPM, 10, 1, 0),
    35		SOC_SINGLE(test_control_names[11], SND_SOC_NOPM, 11, 1, 0),
    36	};
    37	static_assert(ARRAY_SIZE(test_control_names) == ARRAY_SIZE(test_card_controls));
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
