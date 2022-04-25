Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B853850E73F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EE5817C9;
	Mon, 25 Apr 2022 19:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EE5817C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907737;
	bh=jGcTuSTntuAHYCdhP0sz0aVcA3gK8ccr+Nxg4lSLwFk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjZIrYon/MZsmsF+Lsr9VZ6+IwaMB1cO2ac+kxsb014YyFp7Q3aVPkzd6KV/I6DLn
	 rd/LAqv+4MWvULhBZ8XGfJ8ncfpl1Vx7wZjr8ygHTQmuIWlGzqixjj6PGxbobpF9K0
	 T/qE8h0EFWq/BabHY5HLynsMbnnBtlFHQ7k14GMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACDCFF8049C;
	Mon, 25 Apr 2022 19:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DDCBF8016B; Mon, 25 Apr 2022 19:25:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A87F8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A87F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n4PyZxl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650907535; x=1682443535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jGcTuSTntuAHYCdhP0sz0aVcA3gK8ccr+Nxg4lSLwFk=;
 b=n4PyZxl02/MENBekJ6LViijVt2Y78WdH5DJpzJk+IKD177fSGeSDnFnL
 gESUcNIhA4c3E2GTVOzL1YNpZkAXyWhLTtl0XrIAteGG+WrVpNJo5th94
 SDR2YTcQVOzm6d43AUffGeAkdw4gGGfaDF2RK7HuGXoQgpJkP1ElgQwd3
 jrtUfVI82wDt5qwDJvUppmyGc+4a6M/EqnorthLN2ruPtfuIJdOFQ55er
 JeT86JKpGMQr/vC9mMEfhBNbdvCXJAvN2r7RmtAtZ/RSu+ZT9ffDdBFwO
 CtU+KuhjWY9lgELh7gmITKSrh2F3PAUekM1cPeoewuH0e9R3A7FTtewLg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="351760014"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="351760014"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 10:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="579392827"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 25 Apr 2022 10:25:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nj2Sh-0002jU-0O;
 Mon, 25 Apr 2022 17:25:23 +0000
Date: Tue, 26 Apr 2022 01:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Kaehn <kaehndan@gmail.com>, tiwai@suse.com
Subject: Re: [PATCH 2/2] Add generic serial MIDI driver using serial bus API
Message-ID: <202204260120.TIXTqkq1-lkp@intel.com>
References: <20220420194747.490542-3-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420194747.490542-3-kaehndan@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, kbuild-all@lists.01.org
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
[also build test WARNING on v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Kaehn/Add-generic-serial-MIDI-driver-using-serial-bus-API/20220421-035024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220426/202204260120.TIXTqkq1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/65e00db0913a4019c3158e31aa6b2fd2c28ba03f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Kaehn/Add-generic-serial-MIDI-driver-using-serial-bus-API/20220421-035024
        git checkout 65e00db0913a4019c3158e31aa6b2fd2c28ba03f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/acpi/arm64/ sound/drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/drivers/serial-generic.c:192:6: warning: no previous prototype for function 'snd_serial_generic_write_wakeup' [-Wmissing-prototypes]
   void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
        ^
   sound/drivers/serial-generic.c:192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
   ^
   static 
   1 warning generated.


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
