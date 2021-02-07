Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F3312353
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 11:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51BB71676;
	Sun,  7 Feb 2021 11:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51BB71676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612692096;
	bh=QChENPIlkH+zjQM/raf4//4CNuuR/jKki8vT4LHXhJY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YaNlhvvQlPWNIT+A8goiWtWWoTJf/XhvrJ08qR0hwDUwK8Ur5YeoOjF8ZBtMLv+Up
	 IpRPgwMQ/sNf7H1gq0GbyUiaLzFoRNKjOU/qM8KMj7VFN9N1C1FD+rAr+OMHX1l0Nz
	 erZiLyBFXi0tt7IW55XFwYzW2kaX+z27Z9/6+Fh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F152CF801EB;
	Sun,  7 Feb 2021 11:00:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 375A3F801D5; Sun,  7 Feb 2021 11:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0193.hostedemail.com
 [216.40.44.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23921F80129
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 10:59:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23921F80129
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id F02B6182CED2A;
 Sun,  7 Feb 2021 09:59:50 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: horse82_230c2f7275f5
X-Filterd-Recvd-Size: 47852
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Sun,  7 Feb 2021 09:59:49 +0000 (UTC)
Message-ID: <59b9074db976e1dc94f61744bb9b6c102ebfdca4.camel@perches.com>
Subject: Re: [sound:for-next 76/104] powerpc-linux-ld: warning: orphan
 section `.data..LASANLOC27' from `sound/core/init.o' being placed in
 section `.data..LASANLOC27'
From: Joe Perches <joe@perches.com>
To: kernel test robot <lkp@intel.com>
Date: Sun, 07 Feb 2021 01:59:47 -0800
In-Reply-To: <202102071456.Q2SlOc6u-lkp@intel.com>
References: <202102071456.Q2SlOc6u-lkp@intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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

On Sun, 2021-02-07 at 14:16 +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> head:   3c4ab49ec59b94651dea7c7b0104c781c79c62b5
> commit: 75b1a8f9d62e50f05d0e4e9f3c8bcde32527ffc1 [76/104] ALSA: Convert strlcpy to strscpy when return value is unused
> config: powerpc64-randconfig-r032-20210207 (attached as .config)
> compiler: powerpc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=75b1a8f9d62e50f05d0e4e9f3c8bcde32527ffc1
>         git remote add sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>         git fetch --no-tags sound for-next
>         git checkout 75b1a8f9d62e50f05d0e4e9f3c8bcde32527ffc1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):

false positive ?

> 
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `drivers/tee/tee_core.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `drivers/tee/tee_core.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `drivers/tee/tee_core.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/tee/tee_shm.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/tee/tee_shm.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/tee/tee_shm_pool.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/tee/tee_shm_pool.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/mux/core.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/mux/core.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/mux/core.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/mux/core.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `drivers/mux/core.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `drivers/mux/core.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `drivers/mux/core.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/mux/adg792a.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/mux/adg792a.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/mux/adg792a.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/mux/adg792a.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `drivers/mux/adg792a.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/mux/adgs1408.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/mux/adgs1408.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/mux/adgs1408.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/mux/adgs1408.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `drivers/mux/adgs1408.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/mux/mmio.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/mux/mmio.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/mux/mmio.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/mux/mmio.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/counter/counter.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `drivers/counter/counter.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `drivers/counter/ti-eqep.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `drivers/counter/microchip-tcb-capture.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/sound_core.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/sound_core.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/sound_core.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/sound.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/sound.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/sound.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/sound.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/sound.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/sound.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/sound.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/sound.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/sound.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/sound.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/sound.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/init.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/init.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/init.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/init.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/init.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/init.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC14' from `sound/core/init.o' being placed in section `.data..LASANLOC14'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC15' from `sound/core/init.o' being placed in section `.data..LASANLOC15'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC16' from `sound/core/init.o' being placed in section `.data..LASANLOC16'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC17' from `sound/core/init.o' being placed in section `.data..LASANLOC17'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC18' from `sound/core/init.o' being placed in section `.data..LASANLOC18'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC19' from `sound/core/init.o' being placed in section `.data..LASANLOC19'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/init.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC20' from `sound/core/init.o' being placed in section `.data..LASANLOC20'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC21' from `sound/core/init.o' being placed in section `.data..LASANLOC21'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC22' from `sound/core/init.o' being placed in section `.data..LASANLOC22'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC23' from `sound/core/init.o' being placed in section `.data..LASANLOC23'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC24' from `sound/core/init.o' being placed in section `.data..LASANLOC24'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC25' from `sound/core/init.o' being placed in section `.data..LASANLOC25'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC26' from `sound/core/init.o' being placed in section `.data..LASANLOC26'
> > > powerpc-linux-ld: warning: orphan section `.data..LASANLOC27' from `sound/core/init.o' being placed in section `.data..LASANLOC27'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/init.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/init.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/init.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/init.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/init.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/init.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/init.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/memory.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/control.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/control.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/control.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/control.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/control.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/control.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/control.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/control.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/control.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/control.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/control.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/control.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/info.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/info.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/info.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/info.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/info.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/info.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/info.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/info.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/timer.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/timer.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/timer.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/timer.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/timer.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/timer.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC14' from `sound/core/timer.o' being placed in section `.data..LASANLOC14'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC15' from `sound/core/timer.o' being placed in section `.data..LASANLOC15'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC16' from `sound/core/timer.o' being placed in section `.data..LASANLOC16'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC17' from `sound/core/timer.o' being placed in section `.data..LASANLOC17'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC18' from `sound/core/timer.o' being placed in section `.data..LASANLOC18'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC19' from `sound/core/timer.o' being placed in section `.data..LASANLOC19'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/timer.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC20' from `sound/core/timer.o' being placed in section `.data..LASANLOC20'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC21' from `sound/core/timer.o' being placed in section `.data..LASANLOC21'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC22' from `sound/core/timer.o' being placed in section `.data..LASANLOC22'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC23' from `sound/core/timer.o' being placed in section `.data..LASANLOC23'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC24' from `sound/core/timer.o' being placed in section `.data..LASANLOC24'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/timer.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/timer.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/timer.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/timer.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/timer.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/timer.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/timer.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/hrtimer.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/hrtimer.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/hrtimer.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/hrtimer.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/hrtimer.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/pcm.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/pcm.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/pcm.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/pcm.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/pcm.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/pcm.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC14' from `sound/core/pcm.o' being placed in section `.data..LASANLOC14'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC15' from `sound/core/pcm.o' being placed in section `.data..LASANLOC15'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC16' from `sound/core/pcm.o' being placed in section `.data..LASANLOC16'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC17' from `sound/core/pcm.o' being placed in section `.data..LASANLOC17'
> > > powerpc-linux-ld: warning: orphan section `.data..LASANLOC18' from `sound/core/pcm.o' being placed in section `.data..LASANLOC18'
> > > powerpc-linux-ld: warning: orphan section `.data..LASANLOC19' from `sound/core/pcm.o' being placed in section `.data..LASANLOC19'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/pcm.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/pcm.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/pcm.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/pcm.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/pcm.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/pcm.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/pcm.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/pcm.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/pcm_native.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC14' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC14'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC15' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC15'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC16' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC16'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC17' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC17'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC18' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC18'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC19' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC19'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC20' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC20'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/pcm_native.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/pcm_lib.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/pcm_lib.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/pcm_lib.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/pcm_lib.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/pcm_lib.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/pcm_misc.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/pcm_misc.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/pcm_memory.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/pcm_memory.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/pcm_memory.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/pcm_memory.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/pcm_memory.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/pcm_memory.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/pcm_memory.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/memalloc.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq_device.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq_device.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq_device.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq_device.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/rawmidi.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC12'
> > > powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/rawmidi.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC14' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC14'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC15' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC15'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/seq/seq.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC12'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC13' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC13'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/seq/seq_clientmgr.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_memory.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_memory.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_memory.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/seq/seq_queue.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_fifo.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_fifo.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_fifo.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_prioq.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_prioq.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_timer.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_timer.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_system.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_system.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_system.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_system.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_system.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_ports.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_ports.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_ports.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_ports.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_ports.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_info.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_info.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_info.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_info.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC9' from `sound/core/seq/seq_midi.o' being placed in section `.data..LASANLOC9'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/seq/seq_midi_event.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC2' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC2'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC3' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC3'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC4' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC4'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC5' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC5'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC6' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC6'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC7' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC7'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC8' from `sound/core/seq/seq_virmidi.o' being placed in section `.data..LASANLOC8'
>    powerpc-linux-ld: warning: orphan section `.data..LASAN0' from `sound/drivers/dummy.o' being placed in section `.data..LASAN0'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC1' from `sound/drivers/dummy.o' being placed in section `.data..LASANLOC1'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC10' from `sound/drivers/dummy.o' being placed in section `.data..LASANLOC10'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC11' from `sound/drivers/dummy.o' being placed in section `.data..LASANLOC11'
>    powerpc-linux-ld: warning: orphan section `.data..LASANLOC12' from `sound/drivers/dummy.o' being placed in section `.data..LASANLOC12'
> ..
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


