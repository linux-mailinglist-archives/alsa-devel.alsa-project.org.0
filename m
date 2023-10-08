Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887827BCFCD
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Oct 2023 21:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3152E91;
	Sun,  8 Oct 2023 21:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3152E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696793296;
	bh=iq5x1bYlPRfmYak8QHNAZvk+UNMcEQQ5aTjTjfAOFhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vRf4HsjB4eO9FMqbVCHC4w4yfQHGjTCo37RBdjy1cyIJX/Wz642kDP2JFcB5MFp/t
	 HqQ3hw/Q8U45XKkr6IEHRuw81oXcGCLZUEB6eKaF6GM/NUmloF+AuQdGG7UvFOcFJi
	 bRM9ixYcLGFI3NvWd/nPuZ5A3ieUy0mVE4yB1VLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA35EF8019B; Sun,  8 Oct 2023 21:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF2EF8027B;
	Sun,  8 Oct 2023 21:27:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CDC8F8019B; Sun,  8 Oct 2023 21:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F2D0F8019B
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 21:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F2D0F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=StN3EGTd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696793179; x=1728329179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iq5x1bYlPRfmYak8QHNAZvk+UNMcEQQ5aTjTjfAOFhs=;
  b=StN3EGTdAXQQ7rMSWNHKKQEB030RJagtUBciQxt0ZYKo03NUhWHKFstA
   7s6XUY2uewr1LSO8DI1AYc3ehwS/DAr2fFzsEMVvklkaqygMsf/JO0S7X
   kW9E5TemFaUNKcQOFC7kr5XX6pJHYd3Lp2d8XeGk1pYjL85yK1PAxhTlP
   lfObVH3afN65VOqmxSdyunlChVECW2HjZ+OoaYIwcI1qbb9o8ncoUGdu7
   SxObWLlTfuwK5bonmCeWzMTRQWtm7cWIcmblb5hHRvhcJkyzPObv+bjLd
   ieJGoa9ZXHp5eQyscEWpXv9ntIHtzdmEyJdPX415LS11QWNY4CBbABJ/o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="387893975"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200";
   d="scan'208";a="387893975"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 12:26:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084103886"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200";
   d="scan'208";a="1084103886"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2023 12:26:10 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpZPk-0005fz-2W;
	Sun, 08 Oct 2023 19:26:08 +0000
Date: Mon, 9 Oct 2023 03:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Message-ID: <202310090325.xWWpQOHP-lkp@intel.com>
References: <20231008135601.542356-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008135601.542356-1-jmkrzyszt@gmail.com>
Message-ID-Hash: CBYOPVOTZZ7KY5RE23CEBOVN3XY35UWZ
X-Message-ID-Hash: CBYOPVOTZZ7KY5RE23CEBOVN3XY35UWZ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBYOPVOTZZ7KY5RE23CEBOVN3XY35UWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Janusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janusz-Krzysztofik/ASoC-ti-ams-delta-Allow-it-to-be-test-compiled/20231008-215910
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231008135601.542356-1-jmkrzyszt%40gmail.com
patch subject: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231009/202310090325.xWWpQOHP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090325.xWWpQOHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090325.xWWpQOHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/ti/ams-delta.c:401:24: error: initialization of 'void (*)(struct tty_struct *, const u8 *, const u8 *, size_t)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const unsigned char *, long unsigned int)'} from incompatible pointer type 'void (*)(struct tty_struct *, const u8 *, const char *, int)' {aka 'void (*)(struct tty_struct *, const unsigned char *, const char *, int)'} [-Werror=incompatible-pointer-types]
     401 |         .receive_buf = cx81801_receive,
         |                        ^~~~~~~~~~~~~~~
   sound/soc/ti/ams-delta.c:401:24: note: (near initialization for 'cx81801_ops.receive_buf')
   cc1: some warnings being treated as errors


vim +401 sound/soc/ti/ams-delta.c

6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  393  
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  394  static struct tty_ldisc_ops cx81801_ops = {
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  395  	.name = "cx81801",
fbadf70a8053b3 sound/soc/ti/ams-delta.c   Jiri Slaby         2021-05-05  396  	.num = N_V253,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  397  	.owner = THIS_MODULE,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  398  	.open = cx81801_open,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  399  	.close = cx81801_close,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  400  	.hangup = cx81801_hangup,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29 @401  	.receive_buf = cx81801_receive,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  402  	.write_wakeup = cx81801_wakeup,
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  403  };
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  404  
6d7f68a1eab3d5 sound/soc/omap/ams-delta.c Janusz Krzysztofik 2009-07-29  405  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
