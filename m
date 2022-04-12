Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC34FE6A6
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 19:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5B11785;
	Tue, 12 Apr 2022 19:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5B11785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649783777;
	bh=2Pz6OEw74Mlmz5jY7tzAq+2wvQR0bnhMVaceduyaDno=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDSsXbQYdUv+rc59TLRpjkzNj/vzq9hu5izQC7ALgjCyx71rbtAotjkS/aTCC9A8H
	 8+ucS/nzAhPJ5+m4e9YdvoLeM8CQfl+QJz5kxWL40m+KonEErq9Eq7g7d2oUji5TpC
	 SoN3xqlOrB0pgko/VB2mzjEof49IMTJuPz9yBuoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E92A3F80245;
	Tue, 12 Apr 2022 19:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95097F80109; Tue, 12 Apr 2022 19:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07321F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 19:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07321F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SfdsEp/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649783710; x=1681319710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2Pz6OEw74Mlmz5jY7tzAq+2wvQR0bnhMVaceduyaDno=;
 b=SfdsEp/7+9gZuQvejLm+Ge1ZN9zzciUM8RJSEclLfqz6pp5RY8gyL3qa
 mM/9IdQOy3xseNJxtLmUOa/9zpMZnF62YpcdkCCsUU6OVN/VwsJWI+hnA
 TwlJkL/vS42WQRmHWMdjMN2kYLuagvbFFi7uLAIg89k5zj58sVYCOZbyf
 +qR6W4YXKzw6VUXELacEuc7YmUxDHeK4CY707B9Jri74mIM0ui/latS/o
 KnmvvFOvrAqLlcmhWJrMe3uRN0liuVzvyXIw/p3dBIBSk7Q/+MIFaTfMh
 SFVZID5oLI7VwggHe1j0ovrvcqevlE4ybjzG5WfHze5aOHjUOpPIhfsEd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="322890564"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="322890564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 10:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="644830139"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2022 10:15:01 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1neK6W-00031W-Lu;
 Tue, 12 Apr 2022 17:15:00 +0000
Date: Wed, 13 Apr 2022 01:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 26/39] ALSA: intel_hdmi: Fix the missing snd_card_free()
 call at probe error
Message-ID: <202204130129.SNA1B1hM-lkp@intel.com>
References: <20220412102636.16000-27-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412102636.16000-27-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kbuild-all@lists.01.org
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

Hi Takashi,

I love your patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v5.18-rc2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-Fix-error-handling-order-at-probe-error/20220412-183941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: i386-randconfig-a016-20220411 (https://download.01.org/0day-ci/archive/20220413/202204130129.SNA1B1hM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9e76730fee819f96c44f07e9a100c907457aed8b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-Fix-error-handling-order-at-probe-error/20220412-183941
        git checkout 9e76730fee819f96c44f07e9a100c907457aed8b
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/x86/intel_hdmi_audio.c: In function 'hdmi_lpe_audio_probe':
>> sound/x86/intel_hdmi_audio.c:1820:16: error: implicit declaration of function 'snd_card_free_on_error'; did you mean 'snd_ctl_free_one'? [-Werror=implicit-function-declaration]
    1820 |         return snd_card_free_on_error(&pdev->dev, __hdmi_lpe_audio_probe(pdev));
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                snd_ctl_free_one
   cc1: some warnings being treated as errors


vim +1820 sound/x86/intel_hdmi_audio.c

  1817	
  1818	static int hdmi_lpe_audio_probe(struct platform_device *pdev)
  1819	{
> 1820		return snd_card_free_on_error(&pdev->dev, __hdmi_lpe_audio_probe(pdev));
  1821	}
  1822	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
