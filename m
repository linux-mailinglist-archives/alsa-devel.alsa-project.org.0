Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 965D8AF9F61
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Jul 2025 11:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08F58601FF;
	Sat,  5 Jul 2025 11:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08F58601FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751708365;
	bh=NjIeY1DkpP0LAKTYwpJdguSJjLPT23TJ/cGrednR9wM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gv5kUTQajn4xvyZABzYv6ipcKNUVZfXNR4peRh9uukTYV95TesrkrIKAOfEwUR6Bv
	 rkTzmFVUAFNtteUAAQlODFUI2SalsRWmhNTUk+DPno/Ta0KPTo1X0SZFYKaAMJDJhS
	 xs7Ia59W34rRiP/SUTrBYggx7cljjDo++rXQX2mY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF0A4F805BD; Sat,  5 Jul 2025 11:38:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E07F7F805C6;
	Sat,  5 Jul 2025 11:38:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EF44F804CF; Sat,  5 Jul 2025 11:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3E49F80236
	for <alsa-devel@alsa-project.org>; Sat,  5 Jul 2025 11:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E49F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D0EHyceO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751708327; x=1783244327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjIeY1DkpP0LAKTYwpJdguSJjLPT23TJ/cGrednR9wM=;
  b=D0EHyceOvRFTEuYMuZAkfTSocNOYjXpStFcTARNQCz6ApLnXjO16UNpn
   QQ951gubdba2kUSJHJxI4SQnhcJY335t0kt4DWQNhNiBHxDmBStgIND/a
   FniWJYlncMqridUaabDj9eGRDRFn+Nysbk/RdChDz6/OmDo8HB/85iQz9
   75zXA6xqWejdLhi6PPVFqqEAaEFLT0npnV0t64HhVzqprWlkmbuhJYwIQ
   mFr+8VDclfwYKsu+dhD9uf9dJpuU/NqSQnRK2PU8oooaHax39ziBmbdIs
   gbvv+CmGJE7XhX+7ggEal1TofQWUjRqJNx3nvwWk+fqc2FC2OAuFbqcMK
   Q==;
X-CSE-ConnectionGUID: gzZTwy8pTKe/XEfBtFCoaw==
X-CSE-MsgGUID: rCSRFk2USz6BTzn3t1Nonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53873528"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600";
   d="scan'208";a="53873528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2025 02:38:42 -0700
X-CSE-ConnectionGUID: e34Hf/IZQ3C07A3oWW4pGw==
X-CSE-MsgGUID: 7unZSAMGSKetG0B4FJmTLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600";
   d="scan'208";a="185816999"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2025 02:38:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXzLy-0004QV-21;
	Sat, 05 Jul 2025 09:38:38 +0000
Date: Sat, 5 Jul 2025 17:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/hda-reorg 41/53]
 sound/hda/codecs/cirrus/cs421x.c:561:35: warning: 'cs421x_codec_ops' defined
 but not used
Message-ID: <202507051737.DMAkxayN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: NBRTH2OWPAZNLE3AVZLPTN5NDOPUPWQN
X-Message-ID-Hash: NBRTH2OWPAZNLE3AVZLPTN5NDOPUPWQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBRTH2OWPAZNLE3AVZLPTN5NDOPUPWQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/hda-reorg
head:   6119728edf86cefcbf7b20e000414c85916e900d
commit: 484072d3f99c402030fcee94e28ab3ea76d04247 [41/53] ALSA: hda/cirrus: Split to cs420x and cs421x drivers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051737.DMAkxayN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051737.DMAkxayN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051737.DMAkxayN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/hda/codecs/cirrus/cs421x.c:561:35: warning: 'cs421x_codec_ops' defined but not used [-Wunused-const-variable=]
     561 | static const struct hda_codec_ops cs421x_codec_ops = {
         |                                   ^~~~~~~~~~~~~~~~


vim +/cs421x_codec_ops +561 sound/hda/codecs/cirrus/cs421x.c

   560	
 > 561	static const struct hda_codec_ops cs421x_codec_ops = {
   562		.probe = cs421x_probe,
   563		.remove = snd_hda_gen_remove,
   564		.build_controls = snd_hda_gen_build_controls,
   565		.build_pcms = snd_hda_gen_build_pcms,
   566		.init = cs421x_init,
   567		.unsol_event = snd_hda_jack_unsol_event,
   568		.suspend = cs421x_suspend,
   569		.stream_pm = snd_hda_gen_stream_pm,
   570	};
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
