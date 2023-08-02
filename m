Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8676C39A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 05:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770C83E7;
	Wed,  2 Aug 2023 05:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770C83E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690947301;
	bh=eA9FZhqDubY7F2rAvuLG3N+t8DmGYvtDYbk+ECdalHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q4xTVM2QS8w0QlApQYFiEuaIEcNPfux09rP2JDejZkhx/xGLxfDiw9QN8JkL1Hxq/
	 nRVPi7NeZqf8ccCiqDoUti+qSbSjYwtzoUwb4/sI1c62BfawwM3i+0M8G+rAT+PkKf
	 Cms2sponY/ujtexgVGx0U9Z4i01J88NVhmVnJwGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62E8FF80551; Wed,  2 Aug 2023 05:34:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BAC8F8016D;
	Wed,  2 Aug 2023 05:34:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A6DCF80163; Wed,  2 Aug 2023 05:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53813F80163
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 05:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53813F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZTFiyRql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690947014; x=1722483014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eA9FZhqDubY7F2rAvuLG3N+t8DmGYvtDYbk+ECdalHk=;
  b=ZTFiyRqlfcgfPCwkvJvi6uEJDLx7w1uadD2VHru0B+e+Sp16zqOwQqUc
   vdBiEJKuHWx6dPCDAKMmNdXF3Pu95sPZYojpiF5I1Kk17p1koGvq0/1CY
   /tbusN+z/9W0A8Bq3KhhljigGZ0mvbXNWQs5SQXMwTllIqvVpYFJrDATH
   WbY2eJ8vdQHUWJXv0C0zh6PYq0QU3Cs7+wdXdbhpLJfKReE4HRDlRa+4x
   euJHr2mM023yXx5WB/J//sr8EI888gZ1kljj4TV73nAaAZmuksW7fN/O8
   n8l1gJGZ9eilMwMJdH5Jq9jOqI9QPvGR+CayblabqQ6bmfU9zfm8oLRSP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400416638"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200";
   d="scan'208";a="400416638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 20:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="706022839"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200";
   d="scan'208";a="706022839"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Aug 2023 20:30:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR2Ym-0000o3-1c;
	Wed, 02 Aug 2023 03:30:04 +0000
Date: Wed, 2 Aug 2023 11:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Curtis Malainey <cujomalainey@chromium.org>,
	Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>, Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
Message-ID: <202308021152.c3aRSumS-lkp@intel.com>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801171928.1460120-1-cujomalainey@chromium.org>
Message-ID-Hash: BU2ACDJEK5WMVOQWBT5UAOL67ZIWEJGY
X-Message-ID-Hash: BU2ACDJEK5WMVOQWBT5UAOL67ZIWEJGY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BU2ACDJEK5WMVOQWBT5UAOL67ZIWEJGY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.5-rc4 next-20230801]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cujomalainey-chromium-org/sound-core-fix-device-ownership-model-in-card-and-pcm/20230802-012331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey%40chromium.org
patch subject: [PATCH] sound: core: fix device ownership model in card and pcm
config: powerpc-randconfig-r014-20230801 (https://download.01.org/0day-ci/archive/20230802/202308021152.c3aRSumS-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021152.c3aRSumS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021152.c3aRSumS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/aoa/soundbus/i2sbus/pcm.c:975:51: error: member reference type 'struct device *' is a pointer; did you mean to use '->'?
     975 |                 dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].dev.parent =
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
         |                                                                 ->
   sound/aoa/soundbus/i2sbus/pcm.c:992:50: error: member reference type 'struct device *' is a pointer; did you mean to use '->'?
     992 |                 dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE].dev.parent =
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
         |                                                                ->
   2 errors generated.


vim +975 sound/aoa/soundbus/i2sbus/pcm.c

f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   866  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   867  int
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   868  i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   869  		    struct codec_info *ci, void *data)
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   870  {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   871  	int err, in = 0, out = 0;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   872  	struct transfer_info *tmp;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   873  	struct i2sbus_dev *i2sdev = soundbus_dev_to_i2sbus_dev(dev);
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   874  	struct codec_info_item *cii;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   875  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   876  	if (!dev->pcmname || dev->pcmid == -1) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   877  		printk(KERN_ERR "i2sbus: pcm name and id must be set!\n");
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   878  		return -EINVAL;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   879  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   880  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   881  	list_for_each_entry(cii, &dev->codec_list, list) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   882  		if (cii->codec_data == data)
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   883  			return -EALREADY;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   884  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   885  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   886  	if (!ci->transfers || !ci->transfers->formats
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   887  	    || !ci->transfers->rates || !ci->usable)
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   888  		return -EINVAL;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   889  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   890  	/* we currently code the i2s transfer on the clock, and support only
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   891  	 * 32 and 64 */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   892  	if (ci->bus_factor != 32 && ci->bus_factor != 64)
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   893  		return -EINVAL;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   894  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   895  	/* If you want to fix this, you need to keep track of what transport infos
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   896  	 * are to be used, which codecs they belong to, and then fix all the
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   897  	 * sysclock/busclock stuff above to depend on which is usable */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   898  	list_for_each_entry(cii, &dev->codec_list, list) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   899  		if (cii->codec->sysclock_factor != ci->sysclock_factor) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   900  			printk(KERN_DEBUG
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   901  			       "cannot yet handle multiple different sysclocks!\n");
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   902  			return -EINVAL;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   903  		}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   904  		if (cii->codec->bus_factor != ci->bus_factor) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   905  			printk(KERN_DEBUG
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   906  			       "cannot yet handle multiple different bus clocks!\n");
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   907  			return -EINVAL;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   908  		}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   909  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   910  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   911  	tmp = ci->transfers;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   912  	while (tmp->formats && tmp->rates) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   913  		if (tmp->transfer_in)
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   914  			in = 1;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   915  		else
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   916  			out = 1;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   917  		tmp++;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   918  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   919  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   920  	cii = kzalloc(sizeof(struct codec_info_item), GFP_KERNEL);
37d122c5768b41 sound/aoa/soundbus/i2sbus/pcm.c        Zhen Lei      2021-06-17   921  	if (!cii)
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   922  		return -ENOMEM;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   923  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   924  	/* use the private data to point to the codec info */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   925  	cii->sdev = soundbus_dev_get(dev);
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   926  	cii->codec = ci;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   927  	cii->codec_data = data;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   928  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   929  	if (!cii->sdev) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   930  		printk(KERN_DEBUG
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   931  		       "i2sbus: failed to get soundbus dev reference\n");
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   932  		err = -ENODEV;
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   933  		goto out_free_cii;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   934  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   935  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   936  	if (!try_module_get(THIS_MODULE)) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   937  		printk(KERN_DEBUG "i2sbus: failed to get module reference!\n");
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   938  		err = -EBUSY;
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   939  		goto out_put_sdev;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   940  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   941  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   942  	if (!try_module_get(ci->owner)) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   943  		printk(KERN_DEBUG
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   944  		       "i2sbus: failed to get module reference to codec owner!\n");
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   945  		err = -EBUSY;
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   946  		goto out_put_this_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   947  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   948  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   949  	if (!dev->pcm) {
73e85fe8452b95 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   950  		err = snd_pcm_new(card, dev->pcmname, dev->pcmid, 0, 0,
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   951  				  &dev->pcm);
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   952  		if (err) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   953  			printk(KERN_DEBUG "i2sbus: failed to create pcm\n");
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   954  			goto out_put_ci_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   955  		}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   956  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   957  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   958  	/* ALSA yet again sucks.
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   959  	 * If it is ever fixed, remove this line. See below. */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   960  	out = in = 1;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   961  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   962  	if (!i2sdev->out.created && out) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   963  		if (dev->pcm->card != card) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   964  			/* eh? */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   965  			printk(KERN_ERR
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   966  			       "Can't attach same bus to different cards!\n");
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   967  			err = -EINVAL;
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   968  			goto out_put_ci_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   969  		}
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   970  		err = snd_pcm_new_stream(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK, 1);
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   971  		if (err)
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   972  			goto out_put_ci_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   973  		snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK,
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   974  				&i2sbus_playback_ops);
ef46c7af93f98d sound/aoa/soundbus/i2sbus/pcm.c        Takashi Iwai  2015-01-29  @975  		dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].dev.parent =
ef46c7af93f98d sound/aoa/soundbus/i2sbus/pcm.c        Takashi Iwai  2015-01-29   976  			&dev->ofdev.dev;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   977  		i2sdev->out.created = 1;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   978  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   979  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   980  	if (!i2sdev->in.created && in) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   981  		if (dev->pcm->card != card) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   982  			printk(KERN_ERR
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   983  			       "Can't attach same bus to different cards!\n");
3d3909ffe57174 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Takashi Iwai  2007-11-23   984  			err = -EINVAL;
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   985  			goto out_put_ci_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   986  		}
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   987  		err = snd_pcm_new_stream(dev->pcm, SNDRV_PCM_STREAM_CAPTURE, 1);
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   988  		if (err)
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05   989  			goto out_put_ci_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   990  		snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_CAPTURE,
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   991  				&i2sbus_record_ops);
ef46c7af93f98d sound/aoa/soundbus/i2sbus/pcm.c        Takashi Iwai  2015-01-29   992  		dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE].dev.parent =
ef46c7af93f98d sound/aoa/soundbus/i2sbus/pcm.c        Takashi Iwai  2015-01-29   993  			&dev->ofdev.dev;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   994  		i2sdev->in.created = 1;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   995  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   996  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   997  	/* so we have to register the pcm after adding any substream
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   998  	 * to it because alsa doesn't create the devices for the
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21   999  	 * substreams when we add them later.
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1000  	 * Therefore, force in and out on both busses (above) and
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1001  	 * register the pcm now instead of just after creating it.
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1002  	 */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1003  	err = snd_device_register(card, dev->pcm);
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1004  	if (err) {
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1005  		printk(KERN_ERR "i2sbus: error registering new pcm\n");
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1006  		goto out_put_ci_module;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1007  	}
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1008  	/* no errors any more, so let's add this to our list */
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1009  	list_add(&cii->list, &dev->codec_list);
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1010  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1011  	dev->pcm->private_data = i2sdev;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1012  	dev->pcm->private_free = i2sbus_private_free;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1013  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1014  	/* well, we really should support scatter/gather DMA */
9b2433a9c5b392 sound/aoa/soundbus/i2sbus/pcm.c        Takashi Iwai  2019-12-09  1015  	snd_pcm_set_managed_buffer_all(
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1016  		dev->pcm, SNDRV_DMA_TYPE_DEV,
3ca5fc0664ec47 sound/aoa/soundbus/i2sbus/pcm.c        Takashi Iwai  2019-11-05  1017  		&macio_get_pci_dev(i2sdev->macio)->dev,
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1018  		64 * 1024, 64 * 1024);
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1019  
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1020  	return 0;
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1021   out_put_ci_module:
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1022  	module_put(ci->owner);
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1023   out_put_this_module:
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1024  	module_put(THIS_MODULE);
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1025   out_put_sdev:
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1026  	soundbus_dev_put(dev);
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1027   out_free_cii:
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1028  	kfree(cii);
d595ee7e0162ae sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-10-05  1029  	return err;
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1030  }
f3d9478b2ce468 sound/aoa/soundbus/i2sbus/i2sbus-pcm.c Johannes Berg 2006-06-21  1031  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
