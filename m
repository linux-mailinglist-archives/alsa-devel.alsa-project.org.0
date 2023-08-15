Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5377D56B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 23:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 761FA741;
	Tue, 15 Aug 2023 23:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 761FA741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692136699;
	bh=1ADvwf2HGuekaNoBBQq81m4JoPS9Dwg8yO0uDkBF2xI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DZZ8b3hnFaKp4oMrr+uZNg2LM117H4mm6QuXK/Juwqdid+8zQOnS+jJsbNJp3+nYy
	 0+5XiqPFRqHKiVYqDWgxECDQE21bRTxbyCF5a9hfIncn77rhmBRghC0kS9PjASumA3
	 s+SSiMZTpRgIAnwTUv8DLS1h8WT8hgdwcEQVUSGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1117F80254; Tue, 15 Aug 2023 23:57:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91259F800EE;
	Tue, 15 Aug 2023 23:57:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADC54F8016A; Tue, 15 Aug 2023 23:57:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 809EAF80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 23:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809EAF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YzVqBf4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692136641; x=1723672641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ADvwf2HGuekaNoBBQq81m4JoPS9Dwg8yO0uDkBF2xI=;
  b=YzVqBf4Eq8oNC/yemWF29tXaXFumu6rbu2h8NcgAHuFKLCZB9/yJapj5
   zH0SqLeixvv9laaS+X4kXsqb4EsgB3faYafZ9WrFj7GYdkvwH9Gl4w4qV
   G4MbDvdBjNJJedqqeD3CMExly5y7BNkJLOsW7jUuuRWml8aXiSh48hAhR
   FdAXhUMkSAPHqRa8nvEmc7JaDwpwc+xLkClt34OejP36Qw+Pce6rKXofg
   zIDrGiLc+wkefyM0yssCVPAD9KGrlrNGqhcbsA/db3yn73oWzQDQZ0Zpo
   qxwoa/MIsp5Tjew8ov+KVVKk9oA45wPovjOlAnPHegdaQJ3ajyIMeLMaL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403365269"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200";
   d="scan'208";a="403365269"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 14:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="768969299"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200";
   d="scan'208";a="768969299"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 14:57:14 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW22L-0001GB-1z;
	Tue, 15 Aug 2023 21:57:13 +0000
Date: Wed, 16 Aug 2023 05:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 28/28]
 sound/pci/hda/cs35l41_hda_property.c:64:59: warning: ordered comparison of
 pointer with integer zero
Message-ID: <202308160506.8lCEeFDG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: R2WY5DDXB6R66BXZGI76CDNJKBLK4FWR
X-Message-ID-Hash: R2WY5DDXB6R66BXZGI76CDNJKBLK4FWR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2WY5DDXB6R66BXZGI76CDNJKBLK4FWR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   ef4ba63f12b03532378395a8611f2f6e22ece67b
commit: ef4ba63f12b03532378395a8611f2f6e22ece67b [28/28] ALSA: hda: cs35l41: Support systems with missing _DSD properties
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230816/202308160506.8lCEeFDG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308160506.8lCEeFDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308160506.8lCEeFDG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/cs35l41_hda_property.c: In function 'cs35l41_add_dsd_properties':
>> sound/pci/hda/cs35l41_hda_property.c:64:59: warning: ordered comparison of pointer with integer zero [-Wextra]
      64 |         for (model = cs35l41_prop_model_table; model->hid > 0; model++) {
         |                                                           ^


vim +64 sound/pci/hda/cs35l41_hda_property.c

    58	
    59	int cs35l41_add_dsd_properties(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
    60				       const char *hid)
    61	{
    62		const struct cs35l41_prop_model *model;
    63	
  > 64		for (model = cs35l41_prop_model_table; model->hid > 0; model++) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
