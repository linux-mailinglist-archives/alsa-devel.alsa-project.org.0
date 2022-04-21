Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4835097FC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 08:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF221AB6;
	Thu, 21 Apr 2022 08:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF221AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650523622;
	bh=d56EZMIwbjmdjAsTMOqY9tnXTgEE6d1SLlZhiwnBP+0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGsQCKUcGnGD5kxmT3YmiflUzX0UF1MZtKxPlz1qpGKF4s9lZaFLRUdJVaF7+moCG
	 YWe+9av8E9I1L52s41QAXLEb5opL9vVsT9q/uA3Xc/NAoeOVrVm3yO6HnMroct6pfh
	 YdwjkWjWZ9mfLqh7hLykgLvzvUigHPegOz0vKMlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB39F8047D;
	Thu, 21 Apr 2022 08:46:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AFFDF8032D; Thu, 21 Apr 2022 08:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D34DAF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34DAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S/UUC76r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650523558; x=1682059558;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d56EZMIwbjmdjAsTMOqY9tnXTgEE6d1SLlZhiwnBP+0=;
 b=S/UUC76rDQzh1c9BbgBrZWXQ/wNO4V4QogjMQvD6gN9MZ3IhpF1kXFLI
 Yd64GQQc4A76oukdmVDo6OqDray5O8S/j9r0eTatD0JDxLsT8++/BFwrG
 IZCik2TxBW/ZumQZzPK7Ek5q65yMkbfQVYL2sFBUOf3pY7ywmdoIFg0KO
 +oN9Yg6FZH1DHZdW0PZJrvi445eH+RrerGUflRNO9lGud8nHgFUJqTDVu
 OEZh3fCqLgatBVMWX+Aei5eCByiKoe3qt8Fnxzc4n8sNZUzJD6WD8Kzy0
 6vgC5TzcSfCzBhOtMeuyjJUr2PDPDo6TJ8mICsmcS1rQA29xMdiliXhMZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263723418"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="263723418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 23:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="555609883"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 23:45:52 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhQZb-00082P-JU;
 Thu, 21 Apr 2022 06:45:51 +0000
Date: Thu, 21 Apr 2022 14:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Kaehn <kaehndan@gmail.com>, tiwai@suse.com
Subject: Re: [PATCH 2/2] Add generic serial MIDI driver using serial bus API
Message-ID: <202204211211.RPFL9E3X-lkp@intel.com>
References: <20220420194747.490542-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420194747.490542-3-kaehndan@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org
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

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.18-rc3 next-20220420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Kaehn/Add-generic-serial-MIDI-driver-using-serial-bus-API/20220421-035024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20220421/202204211211.RPFL9E3X-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/65e00db0913a4019c3158e31aa6b2fd2c28ba03f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Kaehn/Add-generic-serial-MIDI-driver-using-serial-bus-API/20220421-035024
        git checkout 65e00db0913a4019c3158e31aa6b2fd2c28ba03f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash sound/drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/drivers/serial-generic.c:192:6: warning: no previous prototype for 'snd_serial_generic_write_wakeup' [-Wmissing-prototypes]
     192 | void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snd_serial_generic_write_wakeup +192 sound/drivers/serial-generic.c

   191	
 > 192	void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
   193	{
   194		struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
   195	
   196		if (!snd_rawmidi_transmit_empty(drvdata->midi_output))
   197			snd_serial_generic_output_write(drvdata->midi_output);
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
