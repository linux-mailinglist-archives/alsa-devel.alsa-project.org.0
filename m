Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFE7A697A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 19:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC9F886;
	Tue, 19 Sep 2023 19:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC9F886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695143894;
	bh=IMVrmFyuKPFOVWG/YpycV0iXurYl6rY7eRe4aLg/v38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mD56Iqq8qm52Bja67hDEBbxml5Fk91XdZcDNOpdO5IceRettrorq/LEyBAwKgF2JT
	 1+ZUU/8Gxk2yHoo4Z2ilz1+4OOTMtzZ3pVNXLB+s/vHplWdOnQxUgoJXGo2oi102xv
	 0tJ0mU+MzKGp8JvMgXI34s2v11VLqayTd3uhbgXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 650EEF801F5; Tue, 19 Sep 2023 19:17:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D68F801F5;
	Tue, 19 Sep 2023 19:17:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D57FAF80124; Tue, 19 Sep 2023 19:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 959AFF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 19:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 959AFF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mQ479LMq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695143827; x=1726679827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IMVrmFyuKPFOVWG/YpycV0iXurYl6rY7eRe4aLg/v38=;
  b=mQ479LMqSdS/4wk1s7yZBcXFyBggHJMDXyI0Sq03RPJtkpZk7wh2H9TE
   DU7FMLJa7MztygFe5Po2rk/jdnFhNOux6ZNHv23PCnbl/NPq6QuTH56jt
   jhukJjJvUXH699GvzHi/fJfKiVmJkl/UKQNCgkXlkuBLYwL4FL/qYWUmn
   Je05ne80q/G2+w53oJIHf7r3g5xBZbnYpJJhxZh9SS4mP1Spmncrs0UN+
   Aefor5t0Pv7w4GUspplEKiYPWP01n5TejmcmqDM/bPdsaJoXRYbvwwyfE
   J5PH9VasWsb1uym/kRTNV2mJNlEZiHw2AQqooL3zD8xrliE1xrrdNir4D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410932920"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000";
   d="scan'208";a="410932920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 10:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816526426"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000";
   d="scan'208";a="816526426"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 10:16:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qieLJ-0007j3-2l;
	Tue, 19 Sep 2023 17:16:57 +0000
Date: Wed, 20 Sep 2023 01:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
	perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: hda_auto_parser: Always set codec->fixup_name
 when a quirk found
Message-ID: <202309200115.MPOBOM0E-lkp@intel.com>
References: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
Message-ID-Hash: M4Q2JFMDXORPW42SXFUNMD7X6FN3URRE
X-Message-ID-Hash: M4Q2JFMDXORPW42SXFUNMD7X6FN3URRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4Q2JFMDXORPW42SXFUNMD7X6FN3URRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc2 next-20230919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Ujfalusi/ALSA-hda-hda_auto_parser-Always-set-codec-fixup_name-when-a-quirk-found/20230919-223534
base:   linus/master
patch link:    https://lore.kernel.org/r/20230919132322.17352-1-peter.ujfalusi%40linux.intel.com
patch subject: [PATCH] ALSA: hda: hda_auto_parser: Always set codec->fixup_name when a quirk found
config: parisc-randconfig-002-20230919 (https://download.01.org/0day-ci/archive/20230920/202309200115.MPOBOM0E-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200115.MPOBOM0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200115.MPOBOM0E-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/hda/hda_auto_parser.c: In function 'snd_hda_pick_fixup':
>> sound/pci/hda/hda_auto_parser.c:1046:17: error: 'const struct snd_pci_quirk' has no member named 'name'
    1046 |         name = q->name;
         |                 ^~


vim +1046 sound/pci/hda/hda_auto_parser.c

20531415adf308 David Henningsson 2014-05-26   958  
95a962c36f6e3c Takashi Iwai      2014-10-29   959  /**
95a962c36f6e3c Takashi Iwai      2014-10-29   960   * snd_hda_pick_fixup - Pick up a fixup matching with PCI/codec SSID or model string
95a962c36f6e3c Takashi Iwai      2014-10-29   961   * @codec: the HDA codec
95a962c36f6e3c Takashi Iwai      2014-10-29   962   * @models: NULL-terminated model string list
95a962c36f6e3c Takashi Iwai      2014-10-29   963   * @quirk: zero-terminated PCI/codec SSID quirk list
95a962c36f6e3c Takashi Iwai      2014-10-29   964   * @fixlist: the fixup list
95a962c36f6e3c Takashi Iwai      2014-10-29   965   *
95a962c36f6e3c Takashi Iwai      2014-10-29   966   * Pick up a fixup entry matching with the given model string or SSID.
95a962c36f6e3c Takashi Iwai      2014-10-29   967   * If a fixup was already set beforehand, the function doesn't do anything.
95a962c36f6e3c Takashi Iwai      2014-10-29   968   * When a special model string "nofixup" is given, also no fixup is applied.
95a962c36f6e3c Takashi Iwai      2014-10-29   969   *
95a962c36f6e3c Takashi Iwai      2014-10-29   970   * The function tries to find the matching model name at first, if given.
a235d5b8e550fa Takashi Iwai      2021-08-23   971   * If the model string contains the SSID alias, try to look up with the given
a235d5b8e550fa Takashi Iwai      2021-08-23   972   * alias ID.
95a962c36f6e3c Takashi Iwai      2014-10-29   973   * If nothing matched, try to look up the PCI SSID.
95a962c36f6e3c Takashi Iwai      2014-10-29   974   * If still nothing matched, try to look up the codec SSID.
95a962c36f6e3c Takashi Iwai      2014-10-29   975   */
23d30f28275ddd Takashi Iwai      2012-05-07   976  void snd_hda_pick_fixup(struct hda_codec *codec,
23d30f28275ddd Takashi Iwai      2012-05-07   977  			const struct hda_model_fixup *models,
23d30f28275ddd Takashi Iwai      2012-05-07   978  			const struct snd_pci_quirk *quirk,
23d30f28275ddd Takashi Iwai      2012-05-07   979  			const struct hda_fixup *fixlist)
23d30f28275ddd Takashi Iwai      2012-05-07   980  {
23d30f28275ddd Takashi Iwai      2012-05-07   981  	const struct snd_pci_quirk *q;
f5662e1cbf3f09 David Henningsson 2014-07-22   982  	int id = HDA_FIXUP_ID_NOT_SET;
23d30f28275ddd Takashi Iwai      2012-05-07   983  	const char *name = NULL;
73355ddd877588 Takashi Iwai      2021-08-23   984  	const char *type = NULL;
0444f82766f0b5 Takashi Iwai      2022-01-27   985  	unsigned int vendor, device;
23d30f28275ddd Takashi Iwai      2012-05-07   986  
f5662e1cbf3f09 David Henningsson 2014-07-22   987  	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
f5662e1cbf3f09 David Henningsson 2014-07-22   988  		return;
f5662e1cbf3f09 David Henningsson 2014-07-22   989  
23d30f28275ddd Takashi Iwai      2012-05-07   990  	/* when model=nofixup is given, don't pick up any fixups */
23d30f28275ddd Takashi Iwai      2012-05-07   991  	if (codec->modelname && !strcmp(codec->modelname, "nofixup")) {
73355ddd877588 Takashi Iwai      2021-08-23   992  		id = HDA_FIXUP_ID_NO_FIXUP;
73355ddd877588 Takashi Iwai      2021-08-23   993  		fixlist = NULL;
4f7946eca787ba David Henningsson 2015-01-07   994  		codec_dbg(codec, "%s: picked no fixup (nofixup specified)\n",
7639a06c23c7d4 Takashi Iwai      2015-03-03   995  			  codec->core.chip_name);
73355ddd877588 Takashi Iwai      2021-08-23   996  		goto found;
23d30f28275ddd Takashi Iwai      2012-05-07   997  	}
23d30f28275ddd Takashi Iwai      2012-05-07   998  
73355ddd877588 Takashi Iwai      2021-08-23   999  	/* match with the model name string */
23d30f28275ddd Takashi Iwai      2012-05-07  1000  	if (codec->modelname && models) {
23d30f28275ddd Takashi Iwai      2012-05-07  1001  		while (models->name) {
23d30f28275ddd Takashi Iwai      2012-05-07  1002  			if (!strcmp(codec->modelname, models->name)) {
73355ddd877588 Takashi Iwai      2021-08-23  1003  				id = models->id;
73355ddd877588 Takashi Iwai      2021-08-23  1004  				name = models->name;
4f7946eca787ba David Henningsson 2015-01-07  1005  				codec_dbg(codec, "%s: picked fixup %s (model specified)\n",
7639a06c23c7d4 Takashi Iwai      2015-03-03  1006  					  codec->core.chip_name, codec->fixup_name);
73355ddd877588 Takashi Iwai      2021-08-23  1007  				goto found;
23d30f28275ddd Takashi Iwai      2012-05-07  1008  			}
23d30f28275ddd Takashi Iwai      2012-05-07  1009  			models++;
23d30f28275ddd Takashi Iwai      2012-05-07  1010  		}
23d30f28275ddd Takashi Iwai      2012-05-07  1011  	}
73355ddd877588 Takashi Iwai      2021-08-23  1012  
73355ddd877588 Takashi Iwai      2021-08-23  1013  	if (!quirk)
73355ddd877588 Takashi Iwai      2021-08-23  1014  		return;
73355ddd877588 Takashi Iwai      2021-08-23  1015  
a235d5b8e550fa Takashi Iwai      2021-08-23  1016  	/* match with the SSID alias given by the model string "XXXX:YYYY" */
a235d5b8e550fa Takashi Iwai      2021-08-23  1017  	if (codec->modelname &&
a235d5b8e550fa Takashi Iwai      2021-08-23  1018  	    sscanf(codec->modelname, "%04x:%04x", &vendor, &device) == 2) {
a235d5b8e550fa Takashi Iwai      2021-08-23  1019  		q = snd_pci_quirk_lookup_id(vendor, device, quirk);
a235d5b8e550fa Takashi Iwai      2021-08-23  1020  		if (q) {
a235d5b8e550fa Takashi Iwai      2021-08-23  1021  			type = "alias SSID";
a235d5b8e550fa Takashi Iwai      2021-08-23  1022  			goto found_device;
a235d5b8e550fa Takashi Iwai      2021-08-23  1023  		}
a235d5b8e550fa Takashi Iwai      2021-08-23  1024  	}
a235d5b8e550fa Takashi Iwai      2021-08-23  1025  
73355ddd877588 Takashi Iwai      2021-08-23  1026  	/* match with the PCI SSID */
23d30f28275ddd Takashi Iwai      2012-05-07  1027  	q = snd_pci_quirk_lookup(codec->bus->pci, quirk);
23d30f28275ddd Takashi Iwai      2012-05-07  1028  	if (q) {
73355ddd877588 Takashi Iwai      2021-08-23  1029  		type = "PCI SSID";
73355ddd877588 Takashi Iwai      2021-08-23  1030  		goto found_device;
23d30f28275ddd Takashi Iwai      2012-05-07  1031  	}
73355ddd877588 Takashi Iwai      2021-08-23  1032  
73355ddd877588 Takashi Iwai      2021-08-23  1033  	/* match with the codec SSID */
73355ddd877588 Takashi Iwai      2021-08-23  1034  	q = snd_pci_quirk_lookup_id(codec->core.subsystem_id >> 16,
73355ddd877588 Takashi Iwai      2021-08-23  1035  				    codec->core.subsystem_id & 0xffff,
73355ddd877588 Takashi Iwai      2021-08-23  1036  				    quirk);
73355ddd877588 Takashi Iwai      2021-08-23  1037  	if (q) {
73355ddd877588 Takashi Iwai      2021-08-23  1038  		type = "codec SSID";
73355ddd877588 Takashi Iwai      2021-08-23  1039  		goto found_device;
23d30f28275ddd Takashi Iwai      2012-05-07  1040  	}
73355ddd877588 Takashi Iwai      2021-08-23  1041  
73355ddd877588 Takashi Iwai      2021-08-23  1042  	return; /* no matching */
73355ddd877588 Takashi Iwai      2021-08-23  1043  
73355ddd877588 Takashi Iwai      2021-08-23  1044   found_device:
23d30f28275ddd Takashi Iwai      2012-05-07  1045  	id = q->value;
23d30f28275ddd Takashi Iwai      2012-05-07 @1046  	name = q->name;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
