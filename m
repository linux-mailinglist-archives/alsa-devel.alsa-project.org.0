Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AF74781A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 20:00:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1366120C;
	Tue,  4 Jul 2023 19:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1366120C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688493610;
	bh=Aa7FCgXRD9reRD2WqNCg9gIDPp09VfpjAxtBXt92zn4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qWWRsVEwsBO0NMpdPQyTlFRsIHLmbEvloMrkUsbavcAWEKbyd5/8csCPDu8ko/3XY
	 2V677R2F1WOiIwyDUCnByngKMbsRqG0ov38pAP36w9oa/+BBhalJsfHz8+dM7NHNNk
	 skiAUTw3J9E5uow3qrMgUe2hFTK0HCGGTBcTIHVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D04F80544; Tue,  4 Jul 2023 19:59:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 224FFF80124;
	Tue,  4 Jul 2023 19:59:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36634F80125; Tue,  4 Jul 2023 19:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4658AF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 19:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4658AF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XH3VRLOL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688493549; x=1720029549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aa7FCgXRD9reRD2WqNCg9gIDPp09VfpjAxtBXt92zn4=;
  b=XH3VRLOLxH69zqsME2UW6WiWWQ1u8HZpAf5hyo61IEbxvdYzv5ZhSwKz
   AO7n7B4QVa0KSEMUiqXd+rQwtGjcKEtt46AF8tGVE0yUuQYbhMQ+RZMJM
   8JNTRW67j55Dkd02UpyKWhodbGKO2C2nomsBs4cTFKUTJDMtw2lAf39Io
   LtUQbWimlDkdjEIL25oPTgVul2752M9SXx/6h+Wpd/7Ff5ZuSW/FjvLLh
   QUc9O010lGl3i+8XFX31BlNEWD2iqHMRYv7YfunkowjNmNcrlcMhmpVvI
   xdW1U4dEbG/37WL9oW5/Ztx3/bZIyyWzLlXx5B+pjRkDdAMv5FMDGnldb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="393917041"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200";
   d="scan'208";a="393917041"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 10:59:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965564049"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200";
   d="scan'208";a="965564049"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 10:59:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGkIn-000IQ7-1d;
	Tue, 04 Jul 2023 17:59:01 +0000
Date: Wed, 5 Jul 2023 01:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 33/38]
 sound/soc/codecs/sigmadsp.c:676:50: error: 'struct sigmadsp_control' has no
 member named 'kctl'
Message-ID: <202307050119.aWILsASi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: D5VQSLTQOZ45IF3MGJAYKYGCP3DLHIZZ
X-Message-ID-Hash: D5VQSLTQOZ45IF3MGJAYKYGCP3DLHIZZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5VQSLTQOZ45IF3MGJAYKYGCP3DLHIZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   6dd4ae925ae5b90ccfbcb11dce06fd505cc18bc8
commit: f6df559bc59a922fc6bd100cd018207323c3f9d1 [33/38] ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
config: nios2-randconfig-r026-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050119.aWILsASi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050119.aWILsASi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050119.aWILsASi-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/sigmadsp.c: In function 'sigmadsp_activate_ctrl':
>> sound/soc/codecs/sigmadsp.c:676:50: error: 'struct sigmadsp_control' has no member named 'kctl'
     676 |         changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
         |                                                  ^~


vim +676 sound/soc/codecs/sigmadsp.c

   667	
   668	static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
   669		struct sigmadsp_control *ctrl, unsigned int samplerate_mask)
   670	{
   671		struct snd_card *card = sigmadsp->component->card->snd_card;
   672		bool active;
   673		int changed;
   674	
   675		active = sigmadsp_samplerate_valid(ctrl->samplerates, samplerate_mask);
 > 676		changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
   677		if (active && changed > 0) {
   678			mutex_lock(&sigmadsp->lock);
   679			if (ctrl->cached)
   680				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
   681			mutex_unlock(&sigmadsp->lock);
   682		}
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
