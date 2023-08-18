Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE3F780599
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 07:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CF9D85D;
	Fri, 18 Aug 2023 07:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CF9D85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692336078;
	bh=IOT2930eA2wfbSFNQcDVrByiI/LfRNDHmlBhO4kydMI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NINodcmUoftL3pRiIk/a76J2PZ0wOBVLePhaIkIMl5A+1yHsZdUGXRZuU3eff7J1y
	 JSX51hv8PmZc08xkJ3JE+YHy/XAPiV0UvlqhAVsGZg3F2SVXXsVe87gyQgXQWJNtEQ
	 3xsME3ierDC+zxEl8BK6mAs7/kGVtPo2PBsHS7Ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A8C7F8016D; Fri, 18 Aug 2023 07:20:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B9CF8016D;
	Fri, 18 Aug 2023 07:20:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62424F801EB; Fri, 18 Aug 2023 07:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1764FF800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 07:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1764FF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HxIe8i9x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692335915; x=1723871915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IOT2930eA2wfbSFNQcDVrByiI/LfRNDHmlBhO4kydMI=;
  b=HxIe8i9xFwqbUNv3xLN6ik2z79n4yrlowvDZq2TMcpyU2Pv3s5wqNRWA
   sksoYr+b7vtHK/sO/1F4MFWlW4SevNUydwQLX98fgHPOUtQycnRqPaUr1
   lwpxk2LJ2dxV3vHO/E0x9gJUE/XxqQMafaNr0mE/7ypfhAzkJ8VisfujU
   RX/i85ucWG4dmtlqhHz09TbFfb7DnP/HXJVeJqtqg0/Baa7Y/JX9/mqe6
   YTLitxuweUDGv807/63iM1BZeYxpmzAL/ceXVtGXy7+gp3inZ3t162hTH
   bQMd1NnfmXgQ2kJQzHLKYxUNat2hCikTteMu66KeefGdZ1L9Hd3CnR6St
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375793783"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200";
   d="scan'208";a="375793783"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 22:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="805012377"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200";
   d="scan'208";a="805012377"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 22:18:11 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWrqT-000284-2d;
	Fri, 18 Aug 2023 05:16:36 +0000
Date: Fri, 18 Aug 2023 13:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/dev-split-kref 3/11]
 sound/aoa/soundbus/i2sbus/pcm.c:975:47: error: member reference type 'struct
 snd_pcm_str' is not a pointer; did you mean to use '.'?
Message-ID: <202308181347.q3XPr3Lm-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: WF4K4V7HE5THERCZX6JN7QIKQ4LZSFOO
X-Message-ID-Hash: WF4K4V7HE5THERCZX6JN7QIKQ4LZSFOO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WF4K4V7HE5THERCZX6JN7QIKQ4LZSFOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/dev-split-kref
head:   6e1b44385310dd465cae48213eae65d0b8095d13
commit: 7a3dce3fb37c25de3f3c347f4e69ba358cb81a3d [3/11] ALSA: pcm: Don't embed device
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230818/202308181347.q3XPr3Lm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181347.q3XPr3Lm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181347.q3XPr3Lm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/aoa/soundbus/i2sbus/pcm.c:975:47: error: member reference type 'struct snd_pcm_str' is not a pointer; did you mean to use '.'?
                   dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]->dev.parent =
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
                                                               .
>> sound/aoa/soundbus/i2sbus/pcm.c:975:52: error: member reference type 'struct device *' is a pointer; did you mean to use '->'?
                   dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]->dev.parent =
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
                                                                    ->
   sound/aoa/soundbus/i2sbus/pcm.c:992:46: error: member reference type 'struct snd_pcm_str' is not a pointer; did you mean to use '.'?
                   dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE]->dev.parent =
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
                                                              .
   sound/aoa/soundbus/i2sbus/pcm.c:992:51: error: member reference type 'struct device *' is a pointer; did you mean to use '->'?
                   dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE]->dev.parent =
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
                                                                   ->
   4 errors generated.


vim +975 sound/aoa/soundbus/i2sbus/pcm.c

   866	
   867	int
   868	i2sbus_attach_codec(struct soundbus_dev *dev, struct snd_card *card,
   869			    struct codec_info *ci, void *data)
   870	{
   871		int err, in = 0, out = 0;
   872		struct transfer_info *tmp;
   873		struct i2sbus_dev *i2sdev = soundbus_dev_to_i2sbus_dev(dev);
   874		struct codec_info_item *cii;
   875	
   876		if (!dev->pcmname || dev->pcmid == -1) {
   877			printk(KERN_ERR "i2sbus: pcm name and id must be set!\n");
   878			return -EINVAL;
   879		}
   880	
   881		list_for_each_entry(cii, &dev->codec_list, list) {
   882			if (cii->codec_data == data)
   883				return -EALREADY;
   884		}
   885	
   886		if (!ci->transfers || !ci->transfers->formats
   887		    || !ci->transfers->rates || !ci->usable)
   888			return -EINVAL;
   889	
   890		/* we currently code the i2s transfer on the clock, and support only
   891		 * 32 and 64 */
   892		if (ci->bus_factor != 32 && ci->bus_factor != 64)
   893			return -EINVAL;
   894	
   895		/* If you want to fix this, you need to keep track of what transport infos
   896		 * are to be used, which codecs they belong to, and then fix all the
   897		 * sysclock/busclock stuff above to depend on which is usable */
   898		list_for_each_entry(cii, &dev->codec_list, list) {
   899			if (cii->codec->sysclock_factor != ci->sysclock_factor) {
   900				printk(KERN_DEBUG
   901				       "cannot yet handle multiple different sysclocks!\n");
   902				return -EINVAL;
   903			}
   904			if (cii->codec->bus_factor != ci->bus_factor) {
   905				printk(KERN_DEBUG
   906				       "cannot yet handle multiple different bus clocks!\n");
   907				return -EINVAL;
   908			}
   909		}
   910	
   911		tmp = ci->transfers;
   912		while (tmp->formats && tmp->rates) {
   913			if (tmp->transfer_in)
   914				in = 1;
   915			else
   916				out = 1;
   917			tmp++;
   918		}
   919	
   920		cii = kzalloc(sizeof(struct codec_info_item), GFP_KERNEL);
   921		if (!cii)
   922			return -ENOMEM;
   923	
   924		/* use the private data to point to the codec info */
   925		cii->sdev = soundbus_dev_get(dev);
   926		cii->codec = ci;
   927		cii->codec_data = data;
   928	
   929		if (!cii->sdev) {
   930			printk(KERN_DEBUG
   931			       "i2sbus: failed to get soundbus dev reference\n");
   932			err = -ENODEV;
   933			goto out_free_cii;
   934		}
   935	
   936		if (!try_module_get(THIS_MODULE)) {
   937			printk(KERN_DEBUG "i2sbus: failed to get module reference!\n");
   938			err = -EBUSY;
   939			goto out_put_sdev;
   940		}
   941	
   942		if (!try_module_get(ci->owner)) {
   943			printk(KERN_DEBUG
   944			       "i2sbus: failed to get module reference to codec owner!\n");
   945			err = -EBUSY;
   946			goto out_put_this_module;
   947		}
   948	
   949		if (!dev->pcm) {
   950			err = snd_pcm_new(card, dev->pcmname, dev->pcmid, 0, 0,
   951					  &dev->pcm);
   952			if (err) {
   953				printk(KERN_DEBUG "i2sbus: failed to create pcm\n");
   954				goto out_put_ci_module;
   955			}
   956		}
   957	
   958		/* ALSA yet again sucks.
   959		 * If it is ever fixed, remove this line. See below. */
   960		out = in = 1;
   961	
   962		if (!i2sdev->out.created && out) {
   963			if (dev->pcm->card != card) {
   964				/* eh? */
   965				printk(KERN_ERR
   966				       "Can't attach same bus to different cards!\n");
   967				err = -EINVAL;
   968				goto out_put_ci_module;
   969			}
   970			err = snd_pcm_new_stream(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK, 1);
   971			if (err)
   972				goto out_put_ci_module;
   973			snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_PLAYBACK,
   974					&i2sbus_playback_ops);
 > 975			dev->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK]->dev.parent =
   976				&dev->ofdev.dev;
   977			i2sdev->out.created = 1;
   978		}
   979	
   980		if (!i2sdev->in.created && in) {
   981			if (dev->pcm->card != card) {
   982				printk(KERN_ERR
   983				       "Can't attach same bus to different cards!\n");
   984				err = -EINVAL;
   985				goto out_put_ci_module;
   986			}
   987			err = snd_pcm_new_stream(dev->pcm, SNDRV_PCM_STREAM_CAPTURE, 1);
   988			if (err)
   989				goto out_put_ci_module;
   990			snd_pcm_set_ops(dev->pcm, SNDRV_PCM_STREAM_CAPTURE,
   991					&i2sbus_record_ops);
   992			dev->pcm->streams[SNDRV_PCM_STREAM_CAPTURE]->dev.parent =
   993				&dev->ofdev.dev;
   994			i2sdev->in.created = 1;
   995		}
   996	
   997		/* so we have to register the pcm after adding any substream
   998		 * to it because alsa doesn't create the devices for the
   999		 * substreams when we add them later.
  1000		 * Therefore, force in and out on both busses (above) and
  1001		 * register the pcm now instead of just after creating it.
  1002		 */
  1003		err = snd_device_register(card, dev->pcm);
  1004		if (err) {
  1005			printk(KERN_ERR "i2sbus: error registering new pcm\n");
  1006			goto out_put_ci_module;
  1007		}
  1008		/* no errors any more, so let's add this to our list */
  1009		list_add(&cii->list, &dev->codec_list);
  1010	
  1011		dev->pcm->private_data = i2sdev;
  1012		dev->pcm->private_free = i2sbus_private_free;
  1013	
  1014		/* well, we really should support scatter/gather DMA */
  1015		snd_pcm_set_managed_buffer_all(
  1016			dev->pcm, SNDRV_DMA_TYPE_DEV,
  1017			&macio_get_pci_dev(i2sdev->macio)->dev,
  1018			64 * 1024, 64 * 1024);
  1019	
  1020		return 0;
  1021	 out_put_ci_module:
  1022		module_put(ci->owner);
  1023	 out_put_this_module:
  1024		module_put(THIS_MODULE);
  1025	 out_put_sdev:
  1026		soundbus_dev_put(dev);
  1027	 out_free_cii:
  1028		kfree(cii);
  1029		return err;
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
