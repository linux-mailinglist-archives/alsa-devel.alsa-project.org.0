Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E8658D4B9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 09:37:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9464E;
	Tue,  9 Aug 2022 09:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9464E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660030636;
	bh=gEli8/KpPGBI/WC4JFb2fKTtf8uUj61uieDerQJt/WM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=brmKhjyrhl8dBB8xoU08fiDI5NnW+2Q014LpBMmXbGXXVOMjPniWDDyEOHQTlh7l/
	 P52hgjDyKajb3da8RU/P4rFIM+OntLY2dKHG/EhjdSN7uBeFF82Wh2IN92gosWAPlS
	 gnmVrWuIsmqIAjyp67/0cGZRfEpQHb7ay/YFWtgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C6AF8049C;
	Tue,  9 Aug 2022 09:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B3AF8012A; Tue,  9 Aug 2022 09:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35633F8012A
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 09:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35633F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OEXdWA+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660030567; x=1691566567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gEli8/KpPGBI/WC4JFb2fKTtf8uUj61uieDerQJt/WM=;
 b=OEXdWA+WyGrLd5Psb21uYbN/17hPklhXMNR8svKFNYq/psap4kU4WjAh
 DCfYmZCbDpFrzpbNrQ0fTGAS6bkoK8cK5bwu0tPbBEgfEkC6F45qUBuGY
 5NQQ5gB7cNX0hz8oP5C05yR5OodWxuvjRUtGerjBIfYH+q4oshEjBjKQ0
 rDq804u7xUSFFa103Tp2F7drEr2urIZV8LEXrv5SxMMo20STSIZGHnN8D
 VlUNRlrdVT+rRS5hRRK+iamJgqnSCLmtZAa0L5CorRNxzT1gSdHjG3J+M
 gB1hMY23HY68X41bZjXFXACfxHsXs46cY1RK4ok33mqDoOmJy57fPjTR6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="316703724"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="316703724"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 00:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="672791451"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2022 00:35:44 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oLJmB-000Mpp-1B;
 Tue, 09 Aug 2022 07:35:43 +0000
Date: Tue, 9 Aug 2022 15:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Flax <flatmax@flatmax.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <202208091504.Z4NfNeeX-lkp@intel.com>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808214028.2502801-1-flatmax@flatmax.com>
Cc: broonie@kernel.org, kbuild-all@lists.01.org,
 Matt Flax <flatmax@flatmax.com>
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

Hi Matt,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next linus/master v5.19 next-20220809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: openrisc-randconfig-c023-20220808 (https://download.01.org/0day-ci/archive/20220809/202208091504.Z4NfNeeX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7a9219a8431d7740c0958e53078820cbfef4f3f7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matt-Flax/ASoC-codecs-add-uspport-for-the-TI-SRC4392-codec/20220809-054524
        git checkout 7a9219a8431d7740c0958e53078820cbfef4f3f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "src4xxx_remove" [sound/soc/codecs/snd-soc-src4xxx-i2c.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
