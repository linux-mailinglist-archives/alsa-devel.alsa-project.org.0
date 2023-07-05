Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51E7480A4
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 11:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E41483A;
	Wed,  5 Jul 2023 11:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E41483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688548687;
	bh=h4IJVnSc3dT9a9TI+HnDZIoQ3fCjPEXWlKfBtgPfUS8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BbYOq/Kq8vWdG12+iGuoFzf2MCuwfib0gYRFcANlkikNI+eRLWlHv2qAT7nFTFcB4
	 VCXq4ozoodkwDZGk4RDrALgLcKHWSwCFwLg4paCa4ZcLULe0YooJpYXOuEst8gevNO
	 Wx89JmXyI9aYHAIX/JdbE6VV6nt5TAPW9hAScTr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A772DF8053B; Wed,  5 Jul 2023 11:17:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68412F80124;
	Wed,  5 Jul 2023 11:17:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F92F80125; Wed,  5 Jul 2023 11:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F25FCF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 11:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F25FCF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SvgGE0qF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688548622; x=1720084622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4IJVnSc3dT9a9TI+HnDZIoQ3fCjPEXWlKfBtgPfUS8=;
  b=SvgGE0qFE8Kj3tj7w5q6qjo9FmBqeVMHaXXvHlVzvVbr0RRD9q9Lp2VZ
   MenyagwZTwlfe8ytSX/IWSyzeQkdt3Arq/Yw2Znali4DW8XsecaxmFTkk
   HIyuhzUQ3Ptx7B7iSgz2P7LZQd4SHNyr0MlK9OE9VU48UYb6wN/FgHaeE
   ZApIFsiC1i/7As+2vb8YdvKAykWyNQw4Wi2aOvIgp31+Zp8ZMoUIx1SRA
   Jz5/F/MILEzoF9cwvmVDmSHyVbhIjgLLMYNMKAKk7WxSD6/ttnMXdoEgX
   y5K9xosLN1rZ1Sx/fT0+jBw+TtXMX5nLBuFnCv90WWmM2jD7f2EBXZkon
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="348079545"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200";
   d="scan'208";a="348079545"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 02:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784467617"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200";
   d="scan'208";a="784467617"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2023 02:16:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGyd4-0000Xe-05;
	Wed, 05 Jul 2023 09:16:54 +0000
Date: Wed, 5 Jul 2023 17:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 31/38]
 sound/soc/mediatek/mt8188/mt8188-mt6359.c:1000:25: error: implicit
 declaration of function 'snd_ctl_remove'; did you mean 'snd_ctl_rename'?
Message-ID: <202307051751.ewoQ5wky-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 2N44OXPVOBKKDAADUXUSI7VVLSVMFBF2
X-Message-ID-Hash: 2N44OXPVOBKKDAADUXUSI7VVLSVMFBF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2N44OXPVOBKKDAADUXUSI7VVLSVMFBF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   1daeb793bc0d3c3ad9a66718852a4be0584b700c
commit: 664c9b8fd2f9e61cbe85d8015fc1962ed10d8a2a [31/38] ALSA: control: Drop snd_ctl_remove()
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230705/202307051751.ewoQ5wky-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051751.ewoQ5wky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051751.ewoQ5wky-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/mediatek/mt8188/mt8188-mt6359.c: In function 'mt8188_fixup_controls':
>> sound/soc/mediatek/mt8188/mt8188-mt6359.c:1000:25: error: implicit declaration of function 'snd_ctl_remove'; did you mean 'snd_ctl_rename'? [-Werror=implicit-function-declaration]
    1000 |                         snd_ctl_remove(card->snd_card, kctl);
         |                         ^~~~~~~~~~~~~~
         |                         snd_ctl_rename
   cc1: some warnings being treated as errors


vim +1000 sound/soc/mediatek/mt8188/mt8188-mt6359.c

9f08dcbddeb307 Trevor Wu 2023-05-26   981  
9f08dcbddeb307 Trevor Wu 2023-05-26   982  static void mt8188_fixup_controls(struct snd_soc_card *card)
9f08dcbddeb307 Trevor Wu 2023-05-26   983  {
9f08dcbddeb307 Trevor Wu 2023-05-26   984  	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
9f08dcbddeb307 Trevor Wu 2023-05-26   985  	struct mt8188_card_data *card_data = (struct mt8188_card_data *)priv->private_data;
9f08dcbddeb307 Trevor Wu 2023-05-26   986  	struct snd_kcontrol *kctl;
9f08dcbddeb307 Trevor Wu 2023-05-26   987  
9f08dcbddeb307 Trevor Wu 2023-05-26   988  	if (card_data->quirk & NAU8825_HS_PRESENT) {
9f08dcbddeb307 Trevor Wu 2023-05-26   989  		struct snd_soc_dapm_widget *w, *next_w;
9f08dcbddeb307 Trevor Wu 2023-05-26   990  
9f08dcbddeb307 Trevor Wu 2023-05-26   991  		for_each_card_widgets_safe(card, w, next_w) {
9f08dcbddeb307 Trevor Wu 2023-05-26   992  			if (strcmp(w->name, "Headphone"))
9f08dcbddeb307 Trevor Wu 2023-05-26   993  				continue;
9f08dcbddeb307 Trevor Wu 2023-05-26   994  
9f08dcbddeb307 Trevor Wu 2023-05-26   995  			snd_soc_dapm_free_widget(w);
9f08dcbddeb307 Trevor Wu 2023-05-26   996  		}
9f08dcbddeb307 Trevor Wu 2023-05-26   997  
9f08dcbddeb307 Trevor Wu 2023-05-26   998  		kctl = ctl_find(card->snd_card, "Headphone Switch");
9f08dcbddeb307 Trevor Wu 2023-05-26   999  		if (kctl)
9f08dcbddeb307 Trevor Wu 2023-05-26 @1000  			snd_ctl_remove(card->snd_card, kctl);
9f08dcbddeb307 Trevor Wu 2023-05-26  1001  		else
9f08dcbddeb307 Trevor Wu 2023-05-26  1002  			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
9f08dcbddeb307 Trevor Wu 2023-05-26  1003  	}
9f08dcbddeb307 Trevor Wu 2023-05-26  1004  }
9f08dcbddeb307 Trevor Wu 2023-05-26  1005  

:::::: The code at line 1000 was first introduced by commit
:::::: 9f08dcbddeb307793bbfff036db213d2cdf03a50 ASoC: mediatek: mt8188-mt6359: support new board with nau88255

:::::: TO: Trevor Wu <trevor.wu@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
