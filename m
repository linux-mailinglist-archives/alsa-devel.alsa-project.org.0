Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFE0AD2AF4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 02:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D033B601F3;
	Tue, 10 Jun 2025 02:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D033B601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749516321;
	bh=NMy7hFOCpF4CfdXW/UipB5/YtB3t+rCXnrKV93p+IaY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JdxryE0xC6TGNM8uFdhDsAk2y9ySbQ1tsIYh/M69MsWiQ9XE5eeOfg2tOKFgcxiQ4
	 qSegTJsm9VvaxGirbMsxsCzrwLtVWVzKa4GgPIz0TM2rsUi9IfASU0ZDoKB5rEfxv/
	 lCMFvuutXAmhpEzH4rIlWhqZLwKseNtBkV1MEJmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11D4FF8052D; Tue, 10 Jun 2025 02:44:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8317F805C2;
	Tue, 10 Jun 2025 02:44:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1EE8F804B2; Tue, 10 Jun 2025 02:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A32CDF8025A
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 02:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A32CDF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XPVgJlnM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749516283; x=1781052283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMy7hFOCpF4CfdXW/UipB5/YtB3t+rCXnrKV93p+IaY=;
  b=XPVgJlnMMTKoHzFBDh6mP5eZ0nBasPJEo7b3DDQK39mKX876nWCtdaLu
   yC8TjGjWKcECWhngz/NstoTijSSTwL9hBxvNObv+St/M/z9HvjRyVlYgt
   GmyKHdAo+hWeg+R3/+6GFmtPKMLAWR6+rjm0xAOousCUVW9jxJlD1nJNv
   3QsAhB6Bfw4IlPF4A17s2RmxbcGfBpuhXMm+xDzb4lotHldiFG5uJM3+o
   7t9vM3VNIg8zLqmfcm9gtyUt3rd8r5d16WpepJnTURLRfgQ1j4MmfusqP
   teQ0LKuBPHCPmSe+/ybWZhrIEiy/jwvYMM38tFQ4Uxqdug/GmMTxCSQ4S
   g==;
X-CSE-ConnectionGUID: iC4LS082TzmtdfshDHOjTw==
X-CSE-MsgGUID: kIpV8clDQyi6XiXl96+/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61878666"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600";
   d="scan'208";a="61878666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 17:44:38 -0700
X-CSE-ConnectionGUID: AQv1bKVmTLOSUEFYs042UQ==
X-CSE-MsgGUID: pNmh3HXQRgefju0MDDwlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600";
   d="scan'208";a="151475825"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 17:44:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOn6Q-0007ap-1P;
	Tue, 10 Jun 2025 00:44:34 +0000
Date: Tue, 10 Jun 2025 08:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 12/13] sound/pci/hda/patch_ca0132.c:4388:22:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202506100842.d8lwwdwU-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: HV2ZLRN477Q7N6LKZSAXNV7JGRJPPSOY
X-Message-ID-Hash: HV2ZLRN477Q7N6LKZSAXNV7JGRJPPSOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HV2ZLRN477Q7N6LKZSAXNV7JGRJPPSOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   92f59aeb13252265c20e7aef1379a8080c57e0a2
commit: ed57a3d5a3118b9681de607692608fe573c5959d [12/13] ALSA: hda/ca0132: Enable hardware band EQ for Sound Blaster Core3D
config: i386-randconfig-061-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100842.d8lwwdwU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100842.d8lwwdwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100842.d8lwwdwU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/patch_ca0132.c:4388:22: sparse: sparse: Using plain integer as NULL pointer
   sound/pci/hda/patch_ca0132.c:4389:22: sparse: sparse: Using plain integer as NULL pointer

vim +4388 sound/pci/hda/patch_ca0132.c

44f0c9782cc6ab Ian Minett   2012-12-20  4376  
44f0c9782cc6ab Ian Minett   2012-12-20  4377  static int add_tuning_control(struct hda_codec *codec,
44f0c9782cc6ab Ian Minett   2012-12-20  4378  				hda_nid_t pnid, hda_nid_t nid,
44f0c9782cc6ab Ian Minett   2012-12-20  4379  				const char *name, int dir)
44f0c9782cc6ab Ian Minett   2012-12-20  4380  {
975cc02a904ae3 Takashi Iwai 2013-06-28  4381  	char namestr[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
44f0c9782cc6ab Ian Minett   2012-12-20  4382  	int type = dir ? HDA_INPUT : HDA_OUTPUT;
44f0c9782cc6ab Ian Minett   2012-12-20  4383  	struct snd_kcontrol_new knew =
44f0c9782cc6ab Ian Minett   2012-12-20  4384  		HDA_CODEC_VOLUME_MONO(namestr, nid, 1, 0, type);
44f0c9782cc6ab Ian Minett   2012-12-20  4385  
44f0c9782cc6ab Ian Minett   2012-12-20  4386  	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
44f0c9782cc6ab Ian Minett   2012-12-20  4387  			SNDRV_CTL_ELEM_ACCESS_TLV_READ;
44f0c9782cc6ab Ian Minett   2012-12-20 @4388  	knew.tlv.c = 0;
44f0c9782cc6ab Ian Minett   2012-12-20  4389  	knew.tlv.p = 0;
44f0c9782cc6ab Ian Minett   2012-12-20  4390  	switch (pnid) {
44f0c9782cc6ab Ian Minett   2012-12-20  4391  	case VOICE_FOCUS:
44f0c9782cc6ab Ian Minett   2012-12-20  4392  		knew.info = voice_focus_ctl_info;
44f0c9782cc6ab Ian Minett   2012-12-20  4393  		knew.get = tuning_ctl_get;
44f0c9782cc6ab Ian Minett   2012-12-20  4394  		knew.put = voice_focus_ctl_put;
44f0c9782cc6ab Ian Minett   2012-12-20  4395  		knew.tlv.p = voice_focus_db_scale;
44f0c9782cc6ab Ian Minett   2012-12-20  4396  		break;
44f0c9782cc6ab Ian Minett   2012-12-20  4397  	case MIC_SVM:
44f0c9782cc6ab Ian Minett   2012-12-20  4398  		knew.info = mic_svm_ctl_info;
44f0c9782cc6ab Ian Minett   2012-12-20  4399  		knew.get = tuning_ctl_get;
44f0c9782cc6ab Ian Minett   2012-12-20  4400  		knew.put = mic_svm_ctl_put;
44f0c9782cc6ab Ian Minett   2012-12-20  4401  		break;
44f0c9782cc6ab Ian Minett   2012-12-20  4402  	case EQUALIZER:
44f0c9782cc6ab Ian Minett   2012-12-20  4403  		knew.info = equalizer_ctl_info;
44f0c9782cc6ab Ian Minett   2012-12-20  4404  		knew.get = tuning_ctl_get;
44f0c9782cc6ab Ian Minett   2012-12-20  4405  		knew.put = equalizer_ctl_put;
44f0c9782cc6ab Ian Minett   2012-12-20  4406  		knew.tlv.p = eq_db_scale;
44f0c9782cc6ab Ian Minett   2012-12-20  4407  		break;
44f0c9782cc6ab Ian Minett   2012-12-20  4408  	default:
44f0c9782cc6ab Ian Minett   2012-12-20  4409  		return 0;
44f0c9782cc6ab Ian Minett   2012-12-20  4410  	}
44f0c9782cc6ab Ian Minett   2012-12-20  4411  	knew.private_value =
44f0c9782cc6ab Ian Minett   2012-12-20  4412  		HDA_COMPOSE_AMP_VAL(nid, 1, 0, type);
44f0c9782cc6ab Ian Minett   2012-12-20  4413  	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);
44f0c9782cc6ab Ian Minett   2012-12-20  4414  	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
44f0c9782cc6ab Ian Minett   2012-12-20  4415  }
44f0c9782cc6ab Ian Minett   2012-12-20  4416  

:::::: The code at line 4388 was first introduced by commit
:::::: 44f0c9782cc6ab71ea947f8f710a46f2078a151c ALSA: hda/ca0132: Add tuning controls

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
