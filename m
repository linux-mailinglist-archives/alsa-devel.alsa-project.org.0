Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE44470763
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 18:34:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E781FCD;
	Fri, 10 Dec 2021 18:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E781FCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639157685;
	bh=c5XZKzQpM3T4K/Gncs8Msjc1I4BAyaown97XLRP6Eyk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtySdQ8MFZsEepU29T5f0bqlV6T0gsqZNiUk01qZfNbGb2cESUgBNJwPXrNZaim+n
	 1G+gsjF2pciDciRgfgMyH1+tFY524udbY8j+kYkdBpzk5504bp5Z7M87jM2PhXdx2J
	 VuiIXV81ttxZvdTvqhZHodx2xP7C3yPuea6ERyGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9522F804ED;
	Fri, 10 Dec 2021 18:33:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF647F804EC; Fri, 10 Dec 2021 18:33:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F266FF804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 18:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F266FF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="egBEXBop"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639157607; x=1670693607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c5XZKzQpM3T4K/Gncs8Msjc1I4BAyaown97XLRP6Eyk=;
 b=egBEXBopm4MYeNuQyz/9ezZUOM3v/UVYMUcX6Dnxf5+VG24cFrodUyCH
 FotOAoSyAEdnnOL6zbYNyKhQcqHTbljTW6/F1nlHQS5FebeUEAD7zgJD0
 MXQh3V4ysx5avJOT3NFGCyRL7eiJInZNPVTtSUE0BaLyUpF0hVQbv26AN
 jI0ZiI7hRTUAK+mV0wKBZxNoAQKe4uJaeIsy8S8oFJ31a3Bqh2/iqmGgh
 b2OcJdOoTT86yRHlP1GOEuv2bknylFpkSzOP7O2Rhf4DlUF1vacEZhHWp
 XEK1atyBLh4EJF/P/6tcRG+7dDpvQhQnKuTtlbXhH0eW0HnMo9UYZKBSt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="299181518"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="299181518"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 09:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="753241002"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 10 Dec 2021 09:33:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mvjlg-0003Rl-Ce; Fri, 10 Dec 2021 17:33:12 +0000
Date: Sat, 11 Dec 2021 01:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Shumin Chen <chenshumin86@sina.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [PATCH 1/2] ASoC: add ES8156 codec driver
Message-ID: <202112110101.i4FDNZ9c-lkp@intel.com>
References: <20211210151041.108751-2-chenshumin86@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210151041.108751-2-chenshumin86@sina.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Shumin Chen <chenshumin86@sina.com>
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

Hi Shumin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shumin-Chen/This-patches-provide-ASoc-codec-support-for-ES8156/20211210-231527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: x86_64-buildonly-randconfig-r003-20211210 (https://download.01.org/0day-ci/archive/20211211/202112110101.i4FDNZ9c-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/4ea33be548d361d7097073473fb018e016091622
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Shumin-Chen/This-patches-provide-ASoc-codec-support-for-ES8156/20211210-231527
        git checkout 4ea33be548d361d7097073473fb018e016091622
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8156.c:402:5: warning: no previous prototype for 'es8156_headset_detect' [-Wmissing-prototypes]
     402 | int es8156_headset_detect(int jack_insert)
         |     ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/es8156.c:421:13: warning: 'hp_work' defined but not used [-Wunused-function]
     421 | static void hp_work(struct work_struct *work)
         |             ^~~~~~~
   sound/soc/codecs/es8156.c:386:20: warning: 'es8156_irq_handler' defined but not used [-Wunused-function]
     386 | static irqreturn_t es8156_irq_handler(int irq, void *data)
         |                    ^~~~~~~~~~~~~~~~~~


vim +/es8156_headset_detect +402 sound/soc/codecs/es8156.c

   395	
   396	/*
   397	 * Call from rk_headset_irq_hook_adc.c
   398	 *
   399	 * Enable micbias for HOOK detection and disable external Amplifier
   400	 * when jack insertion.
   401	 */
 > 402	int es8156_headset_detect(int jack_insert)
   403	{
   404		struct es8156_priv *es8156;
   405	
   406		if (!es8156_codec)
   407			return -1;
   408	
   409		es8156 = snd_soc_component_get_drvdata(es8156_codec);
   410	
   411		es8156->hp_inserted = jack_insert;
   412	
   413		/* enable micbias and disable PA */
   414		if (jack_insert)
   415			es8156_enable_spk(es8156, false);
   416	
   417		return 0;
   418	}
   419	EXPORT_SYMBOL(es8156_headset_detect);
   420	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
