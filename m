Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAC78A268
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 17:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C7361678;
	Mon, 12 Aug 2019 17:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C7361678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565624305;
	bh=eElLAhc5XoAfUyjwh2PEW8549xHX1v+rN6QF7BMcuqI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ur+8A/okDGh3cx9MyD8HOhHkFkGLRJHBqe53bzQkWdVwbopieJGeRlklVPVg5zhFP
	 EE4wcHAagP/u3vamop3GFOpRnzRwmtXs6ygb3XDEW1a+5KT2Y3ZWNeBGuJvsuXltZG
	 DEVgglVGgy67C1bRgMD+C6hxLxw9IlLFkGmD6i6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C60E5F801EB;
	Mon, 12 Aug 2019 17:36:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67D41F80213; Mon, 12 Aug 2019 17:35:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE4F5F8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 17:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE4F5F8015B
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 08:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
 d="gz'50?scan'50,208,50";a="183600602"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2019 08:35:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hxCMC-000GLj-CC; Mon, 12 Aug 2019 23:35:36 +0800
Date: Mon, 12 Aug 2019 23:34:59 +0800
From: kbuild test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <201908122356.TFAqJdGy%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oq433ghoen72p6f5"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: [alsa-devel] [asoc:for-5.4 195/232]
 sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared
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


--oq433ghoen72p6f5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/broonie/sound.git for-5.4
head:   6fa4e0cae684d268d309d1b1f929d52e3df5649c
commit: c2f16a94a80497e4b28c27f9ca2cd6cd60706fb6 [195/232] Merge branch 'topic/hda-bus-ops-cleanup' of https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound into asoc-5.4
config: x86_64-randconfig-s0-08121238 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
reproduce:
        git checkout c2f16a94a80497e4b28c27f9ca2cd6cd60706fb6
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:19:0,
                    from include/linux/device.h:16,
                    from include/sound/hdaudio.h:9,
                    from include/sound/hdaudio_ext.h:5,
                    from sound/soc/sof/intel/hda-dsp.c:18:
   sound/soc/sof/intel/hda-dsp.c: In function 'hda_resume':
>> sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared (first use in this function)
     list_for_each_entry(hlink, &bus->hlink_list, list)
                         ^
   include/linux/list.h:577:7: note: in definition of macro 'list_for_each_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
          ^~~
   sound/soc/sof/intel/hda-dsp.c:360:22: note: each undeclared identifier is reported only once for each function it appears in
     list_for_each_entry(hlink, &bus->hlink_list, list)
                         ^
   include/linux/list.h:577:7: note: in definition of macro 'list_for_each_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
          ^~~
   In file included from include/linux/list.h:9:0,
                    from include/linux/kobject.h:19,
                    from include/linux/device.h:16,
                    from include/sound/hdaudio.h:9,
                    from include/sound/hdaudio_ext.h:5,
                    from sound/soc/sof/intel/hda-dsp.c:18:
>> sound/soc/sof/intel/hda-dsp.c:360:30: error: 'bus' undeclared (first use in this function)
     list_for_each_entry(hlink, &bus->hlink_list, list)
                                 ^
   include/linux/kernel.h:972:26: note: in definition of macro 'container_of'
     void *__mptr = (void *)(ptr);     \
                             ^~~
   include/linux/list.h:490:2: note: in expansion of macro 'list_entry'
     list_entry((ptr)->next, type, member)
     ^~~~~~~~~~
   include/linux/list.h:577:13: note: in expansion of macro 'list_first_entry'
     for (pos = list_first_entry(head, typeof(*pos), member); \
                ^~~~~~~~~~~~~~~~
   sound/soc/sof/intel/hda-dsp.c:360:2: note: in expansion of macro 'list_for_each_entry'
     list_for_each_entry(hlink, &bus->hlink_list, list)
     ^~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/intel/hda-dsp.c:364:2: error: #else without #if
    #else
     ^~~~
>> sound/soc/sof/intel/hda-dsp.c:390:2: error: #endif without #if
    #endif
     ^~~~~

vim +/hlink +360 sound/soc/sof/intel/hda-dsp.c

747503b1813a3e Liam Girdwood 2019-04-12  334  
fd15f2f5e27214 Rander Wang   2019-07-22  335  static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
747503b1813a3e Liam Girdwood 2019-04-12  336  {
747503b1813a3e Liam Girdwood 2019-04-12  337  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
747503b1813a3e Liam Girdwood 2019-04-12  338  	struct hdac_bus *bus = sof_to_bus(sdev);
747503b1813a3e Liam Girdwood 2019-04-12  339  	struct hdac_ext_link *hlink = NULL;
747503b1813a3e Liam Girdwood 2019-04-12  340  #endif
747503b1813a3e Liam Girdwood 2019-04-12  341  	int ret;
747503b1813a3e Liam Girdwood 2019-04-12  342  
747503b1813a3e Liam Girdwood 2019-04-12  343  	/*
747503b1813a3e Liam Girdwood 2019-04-12  344  	 * clear TCSEL to clear playback on some HD Audio
747503b1813a3e Liam Girdwood 2019-04-12  345  	 * codecs. PCI TCSEL is defined in the Intel manuals.
747503b1813a3e Liam Girdwood 2019-04-12  346  	 */
747503b1813a3e Liam Girdwood 2019-04-12  347  	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
747503b1813a3e Liam Girdwood 2019-04-12  348  
747503b1813a3e Liam Girdwood 2019-04-12  349  	/* reset and start hda controller */
747503b1813a3e Liam Girdwood 2019-04-12  350  	ret = hda_dsp_ctrl_init_chip(sdev, true);
747503b1813a3e Liam Girdwood 2019-04-12  351  	if (ret < 0) {
747503b1813a3e Liam Girdwood 2019-04-12  352  		dev_err(sdev->dev,
747503b1813a3e Liam Girdwood 2019-04-12  353  			"error: failed to start controller after resume\n");
747503b1813a3e Liam Girdwood 2019-04-12  354  		return ret;
747503b1813a3e Liam Girdwood 2019-04-12  355  	}
747503b1813a3e Liam Girdwood 2019-04-12  356  
747503b1813a3e Liam Girdwood 2019-04-12  357  	hda_dsp_ctrl_misc_clock_gating(sdev, false);
747503b1813a3e Liam Girdwood 2019-04-12  358  
747503b1813a3e Liam Girdwood 2019-04-12  359  	/* Reset stream-to-link mapping */
747503b1813a3e Liam Girdwood 2019-04-12 @360  	list_for_each_entry(hlink, &bus->hlink_list, list)
19abfefd4c7604 Takashi Iwai  2019-08-07  361  		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
747503b1813a3e Liam Girdwood 2019-04-12  362  
747503b1813a3e Liam Girdwood 2019-04-12  363  	hda_dsp_ctrl_misc_clock_gating(sdev, true);
747503b1813a3e Liam Girdwood 2019-04-12 @364  #else
747503b1813a3e Liam Girdwood 2019-04-12  365  
747503b1813a3e Liam Girdwood 2019-04-12  366  	hda_dsp_ctrl_misc_clock_gating(sdev, false);
747503b1813a3e Liam Girdwood 2019-04-12  367  
747503b1813a3e Liam Girdwood 2019-04-12  368  	/* reset controller */
747503b1813a3e Liam Girdwood 2019-04-12  369  	ret = hda_dsp_ctrl_link_reset(sdev, true);
747503b1813a3e Liam Girdwood 2019-04-12  370  	if (ret < 0) {
747503b1813a3e Liam Girdwood 2019-04-12  371  		dev_err(sdev->dev,
747503b1813a3e Liam Girdwood 2019-04-12  372  			"error: failed to reset controller during resume\n");
747503b1813a3e Liam Girdwood 2019-04-12  373  		return ret;
747503b1813a3e Liam Girdwood 2019-04-12  374  	}
747503b1813a3e Liam Girdwood 2019-04-12  375  
747503b1813a3e Liam Girdwood 2019-04-12  376  	/* take controller out of reset */
747503b1813a3e Liam Girdwood 2019-04-12  377  	ret = hda_dsp_ctrl_link_reset(sdev, false);
747503b1813a3e Liam Girdwood 2019-04-12  378  	if (ret < 0) {
747503b1813a3e Liam Girdwood 2019-04-12  379  		dev_err(sdev->dev,
747503b1813a3e Liam Girdwood 2019-04-12  380  			"error: failed to ready controller during resume\n");
747503b1813a3e Liam Girdwood 2019-04-12  381  		return ret;
747503b1813a3e Liam Girdwood 2019-04-12  382  	}
747503b1813a3e Liam Girdwood 2019-04-12  383  
747503b1813a3e Liam Girdwood 2019-04-12  384  	/* enable hda bus irq */
747503b1813a3e Liam Girdwood 2019-04-12  385  	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
747503b1813a3e Liam Girdwood 2019-04-12  386  				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
747503b1813a3e Liam Girdwood 2019-04-12  387  				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
747503b1813a3e Liam Girdwood 2019-04-12  388  
747503b1813a3e Liam Girdwood 2019-04-12  389  	hda_dsp_ctrl_misc_clock_gating(sdev, true);
24b6ff686fce80 Zhu Yingjiang 2019-06-12 @390  #endif
747503b1813a3e Liam Girdwood 2019-04-12  391  
747503b1813a3e Liam Girdwood 2019-04-12  392  	/* enable ppcap interrupt */
747503b1813a3e Liam Girdwood 2019-04-12  393  	hda_dsp_ctrl_ppcap_enable(sdev, true);
747503b1813a3e Liam Girdwood 2019-04-12  394  	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
747503b1813a3e Liam Girdwood 2019-04-12  395  

:::::: The code at line 360 was first introduced by commit
:::::: 747503b1813a3e6e4c52d9c0b4bd462b64940940 ASoC: SOF: Intel: Add Intel specific HDA DSP HW operations

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--oq433ghoen72p6f5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--oq433ghoen72p6f5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--oq433ghoen72p6f5--
