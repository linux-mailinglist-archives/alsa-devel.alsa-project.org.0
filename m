Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F4F806136
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 23:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31236827;
	Tue,  5 Dec 2023 23:00:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31236827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701813643;
	bh=D9EtR6Py7ooGLOmKmiVsc4WAuKZzq54r1HkSKwjte8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kd0MS8g4NDJIl1ZYl8CSvHRvkddzFBNG1pjcAeJL0dNZ61+d8w4CS9uqh3MBAPjXo
	 pTNLxYaD6VmKM4PYWyAeUfEmSgDJF82rnwJ7GjpvwKVueO3A4P/nzRkb2HVen7+Pfw
	 JSyv1zr2KkeUWR0JM7u+Lg/tceGCqrNCPeHIcFHY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6992BF805AA; Tue,  5 Dec 2023 23:00:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A3DF80570;
	Tue,  5 Dec 2023 23:00:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52C15F8024E; Tue,  5 Dec 2023 22:57:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7B87F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 22:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B87F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nc2cEl+I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701813425; x=1733349425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9EtR6Py7ooGLOmKmiVsc4WAuKZzq54r1HkSKwjte8A=;
  b=nc2cEl+IamINcL0Bu5P2zJfuMWOBuYUTjxqUoncHfAHWVZOr4ZZpIlTZ
   4Kxnq382Cxivgq4snn4hd+LzzB62PMRjNbsfko7Wc3Hcjk4mjPdLNAfUZ
   unmohIeEiYFXLv5e3HuVZ0vibDKQ/Br0mOx3/3AHkj+JVfzcRBBQ6HszV
   UPpZ8loKivAPjhEOJ1Y2RjT8HmQi8xNISyziu1mZgLoK9Nj37rXNpPJyJ
   3JdVqhoFzdn7qUJWYZZxRO71EPDWoeP8cS0EygBETNISLBBVbwC2xSgOw
   8k2wS3WzdFCAivE7hO+Vm9Az90oDod7629+lX3sIr0AuSt2hCr2eLFKno
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392833558"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600";
   d="scan'208";a="392833558"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747388076"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600";
   d="scan'208";a="747388076"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Dec 2023 13:56:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdPQ-0009ma-0g;
	Tue, 05 Dec 2023 21:56:52 +0000
Date: Wed, 6 Dec 2023 05:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski@linaro.org,
	broonie@kernel.org, agross@kernel.org, andersson@kernel.org,
	quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	quic_phaniu@quicinc.com, quic_avangala@quicinc.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
Message-ID: <202312060522.gxYr8k2D-lkp@intel.com>
References: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
Message-ID-Hash: KWWBNX2VJOYV7DXAQTMZEZ73A3LAMCUD
X-Message-ID-Hash: KWWBNX2VJOYV7DXAQTMZEZ73A3LAMCUD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWWBNX2VJOYV7DXAQTMZEZ73A3LAMCUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/ASoC-codecs-wcd937x-Add-wcd937x-codec-driver/20231205-203631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231205123400.6353-1-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
config: i386-buildonly-randconfig-005-20231206 (https://download.01.org/0day-ci/archive/20231206/202312060522.gxYr8k2D-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060522.gxYr8k2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060522.gxYr8k2D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/wcd937x.c:1024:6: warning: variable 'pre_off_event' set but not used [-Wunused-but-set-variable]
           int pre_off_event = 0, post_off_event = 0;
               ^
   sound/soc/codecs/wcd937x.c:1024:25: warning: variable 'post_off_event' set but not used [-Wunused-but-set-variable]
           int pre_off_event = 0, post_off_event = 0;
                                  ^
   sound/soc/codecs/wcd937x.c:1025:6: warning: variable 'post_on_event' set but not used [-Wunused-but-set-variable]
           int post_on_event = 0, post_dapm_off = 0;
               ^
   sound/soc/codecs/wcd937x.c:1025:25: warning: variable 'post_dapm_off' set but not used [-Wunused-but-set-variable]
           int post_on_event = 0, post_dapm_off = 0;
                                  ^
   sound/soc/codecs/wcd937x.c:1027:6: warning: variable 'post_dapm_on' set but not used [-Wunused-but-set-variable]
           int post_dapm_on = 0;
               ^
>> sound/soc/codecs/wcd937x.c:2909:34: warning: unused variable 'wcd937x_of_match' [-Wunused-const-variable]
   static const struct of_device_id wcd937x_of_match[] = {
                                    ^
   6 warnings generated.


vim +/wcd937x_of_match +2909 sound/soc/codecs/wcd937x.c

  2908	
> 2909	static const struct of_device_id wcd937x_of_match[] = {
  2910		{ .compatible = "qcom,wcd9370-codec" },
  2911		{ }
  2912	};
  2913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
