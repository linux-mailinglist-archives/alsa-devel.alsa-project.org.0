Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EF748AF2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 19:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E3B3E7;
	Wed,  5 Jul 2023 19:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E3B3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688579349;
	bh=UBCRISO5bvEzaroCbX4doD2mQ5QibjmGkyPvu/AjBxc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=exqYTjql9sjgy6mdqqkp2k5kdkdnC1LKj9HV8Glpu3DUSNK3eEkg+nYEPW2kwX0VX
	 UB+5iJBbhuawW6f9J44M5MqEtESywQCZvTHD5JQ6DRSqIcQVEW2N5WjaCSNh9HaJtK
	 zrY18bdY46j0PcglvrhkzRmSk4HKLtWsR0m9gew4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5321FF80153; Wed,  5 Jul 2023 19:48:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3E9F80124;
	Wed,  5 Jul 2023 19:48:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27754F80125; Wed,  5 Jul 2023 19:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08611F80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 19:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08611F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NaitRTqD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688579291; x=1720115291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBCRISO5bvEzaroCbX4doD2mQ5QibjmGkyPvu/AjBxc=;
  b=NaitRTqDv8M5f+UF4K+i5R2iQCQ3TBFGKJ3awbe8lx0qyF+5Pboyx6zf
   oZUlTqvskMLGQNTGWd4lXX4VraC53OioHPv3tB7UOdyRMJw0T0JmgYoxJ
   r969qnmzkrS00ZPX387ukQgiI+kwhAXhijpFviTUR1sU7upqHHwgJ3yw5
   PSnNgHtjnYPGrQRwqZLyVd7WNwhIDqsBztrzEBdOLMxnGuuf1IgnLkSn3
   Tv25woCsEvsAzWJ+f9uARiW9kD+Ycd9qm4pXHEibNdEan6ZCSzyXQmrZU
   +QhHwkk36IXcg+dQxtT1Xx7TnB7Me20j49Uz48M/VMPsx6Ebk05OodMYX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427088000"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="427088000"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 10:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669481729"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="669481729"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jul 2023 10:48:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH6bj-0000ko-0E;
	Wed, 05 Jul 2023 17:48:03 +0000
Date: Thu, 6 Jul 2023 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 40/54] htmldocs:
 ./include/sound/control.h:162: warning: expecting prototype for
 snd_ctl_find_id(). Prototype was for snd_ctl_find_id_mixer() instead
Message-ID: <202307060119.mTXEyy6N-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 5GCQS6O2NTUUNS7I2MAD3P6D45ASWDLM
X-Message-ID-Hash: 5GCQS6O2NTUUNS7I2MAD3P6D45ASWDLM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GCQS6O2NTUUNS7I2MAD3P6D45ASWDLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   9ad18619a06d551105bd84191dca5bb5295277c7
commit: 59444a29dbfd44718fef15083aa339c2c8b579b5 [40/54] ALSA: control: Introduce snd_ctl_find_id_mixer()
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060119.mTXEyy6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060119.mTXEyy6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/sound/control.h:162: warning: expecting prototype for snd_ctl_find_id(). Prototype was for snd_ctl_find_id_mixer() instead

vim +162 ./include/sound/control.h

   147	
   148	/**
   149	 * snd_ctl_find_id - find the control instance with the given name string
   150	 * @card: the card instance
   151	 * @name: the name string
   152	 *
   153	 * Finds the control instance with the given name and
   154	 * @SNDRV_CTL_ELEM_IFACE_MIXER. Other fields are set to zero.
   155	 *
   156	 * This is merely a wrapper to snd_ctl_find_id().
   157	 *
   158	 * Return: The pointer of the instance if found, or %NULL if not.
   159	 */
   160	static inline struct snd_kcontrol *
   161	snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
 > 162	{
   163		struct snd_ctl_elem_id id = {};
   164	
   165		id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
   166		strscpy(id.name, name, sizeof(id.name));
   167		return snd_ctl_find_id(card, &id);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
