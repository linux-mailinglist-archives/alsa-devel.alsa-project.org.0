Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41631206906
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 02:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED1117E8;
	Wed, 24 Jun 2020 02:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED1117E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592958449;
	bh=BNMAhWwDX1bcbun0PcVI3NdMH8VaEivh3aGkk6pzPVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCPDPDJvD+6cKHLdWc5N7zuIAMga9uv24mPY2xo18yPudmRJC5arg9uCXyx71T9D6
	 DWfkw80CsbCJTllSquXE0I2oz4yRuvWXOTm6EYHoWIRUyElF6ZxsmUzCwmWS7a9zT3
	 qh8twtEDZ9N8HCtwRl0tf7UoSzpy27hRi/HV1zpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E088F8010E;
	Wed, 24 Jun 2020 02:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C450F80234; Wed, 24 Jun 2020 02:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E1EDF8010E
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 02:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E1EDF8010E
IronPort-SDR: wne63ZIBaynSTHVe4xngx2XXWmjCDyuFIoMkbJP6IkHFHGfF+balngtuoczoIHFzaWBwuBuPV1
 5me/YUSSQ3Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="124528365"
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; d="scan'208";a="124528365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 17:25:36 -0700
IronPort-SDR: EoS4AuvFJZL6jk0vneFcOF0yEEDN0CxiVE4Lwaud5o6G3njbeInCTtepN3cryVUwCUcpye+5Py
 jzaZZ1sRwEDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; d="scan'208";a="385015282"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2020 17:25:34 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jntEL-0000bN-VP; Wed, 24 Jun 2020 00:25:33 +0000
Date: Wed, 24 Jun 2020 08:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Message-ID: <202006240840.T22JaACv%lkp@intel.com>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kai.vehmanen@intel.com, Harsha Priya <harshapriya.n@intel.com>,
 kbuild-all@lists.01.org, Emmanuel Jillela <emmanuel.jillela@intel.com>
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

Hi Harsha,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on sound/for-next]
[also build test ERROR on v5.8-rc2 next-20200623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Harsha-Priya/ALSA-hda-hdmi-Add-Intel-silent-stream-support/20200624-073425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-tinyconfig
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=1 build):
        make W=1 ARCH=i386  tinyconfig
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/pci/hda/Kconfig:258: unexpected 'if' within menu block
>> sound/pci/hda/Kconfig:260: unexpected 'menu' within if block
   sound/Kconfig:102: 'if' in different file than 'if'
   sound/pci/hda/Kconfig:2: location of the 'if'
   sound/Kconfig:104: 'if' in different file than 'if'
   sound/pci/hda/Kconfig:2: location of the 'if'
>> sound/Kconfig:106: unexpected 'if' within menu block
>> drivers/Kconfig:239: syntax error
   drivers/Kconfig:238: invalid statement
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1
   make[1]: *** [Makefile:606: oldconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> sound/pci/hda/Kconfig:258: unexpected 'if' within menu block
>> sound/pci/hda/Kconfig:260: unexpected 'menu' within if block
   sound/Kconfig:102: 'if' in different file than 'if'
   sound/pci/hda/Kconfig:2: location of the 'if'
   sound/Kconfig:104: 'if' in different file than 'if'
   sound/pci/hda/Kconfig:2: location of the 'if'
>> sound/Kconfig:106: unexpected 'if' within menu block
>> drivers/Kconfig:239: syntax error
   drivers/Kconfig:238: invalid statement
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1
   make[1]: *** [Makefile:606: olddefconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.
--
>> sound/pci/hda/Kconfig:258: unexpected 'if' within menu block
>> sound/pci/hda/Kconfig:260: unexpected 'menu' within if block
   sound/Kconfig:102: 'if' in different file than 'if'
   sound/pci/hda/Kconfig:2: location of the 'if'
   sound/Kconfig:104: 'if' in different file than 'if'
   sound/pci/hda/Kconfig:2: location of the 'if'
>> sound/Kconfig:106: unexpected 'if' within menu block
>> drivers/Kconfig:239: syntax error
   drivers/Kconfig:238: invalid statement
   make[5]: *** [scripts/kconfig/Makefile:71: allnoconfig] Error 1
   make[4]: *** [Makefile:606: allnoconfig] Error 2
   make[3]: *** [Makefile:336: __build_one_by_one] Error 2
   make[3]: Target 'allnoconfig' not remade because of errors.
   make[3]: Target 'tiny.config' not remade because of errors.
   make[2]: *** [scripts/kconfig/Makefile:109: tinyconfig] Error 2
   make[1]: *** [Makefile:606: tinyconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'tinyconfig' not remade because of errors.

vim +/if +258 sound/pci/hda/Kconfig

   243	
   244	config SND_HDA_INTEL_HDMI_SILENT_STREAM
   245		bool "Enable Silent Stream always for HDMI"
   246		depends on SND_HDA
   247		help
   248		  Intel hardware has a feature called 'silent stream', that
   249		  keeps external HDMI receiver's analog circuitry powered on
   250		  avoiding 2-3 sec silence during playback start. This mechanism
   251		  relies on an info packet and preventing the codec from going to
   252		  D3. (increasing the platform static power consumption when a
   253		  HDMI receiver is plugged-in). 2-3 sec silence at the playback
   254		  start is expected whenever there is format change. (default is
   255		  2 channel format).
   256		  Say Y to enable Silent Stream feature.
   257	
 > 258	endif
   259	
 > 260	endmenu

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
