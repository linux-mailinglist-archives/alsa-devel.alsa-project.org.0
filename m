Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6095287D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 06:24:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6BA2319;
	Thu, 15 Aug 2024 06:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6BA2319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723695868;
	bh=6Isv9TeElQrkCl2wLZdIZV0/D+zvkAUMoUvGVsAW1eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VHd2IYqVan8NNVGfjO8YyNyMWD6p8XiCtnKbakirSbYTgKeneMaOwXGfiqnJeXw9x
	 FGLCFOOjnH5Pm2cKQfhw+nGftOI/HfeRqp0kIAtiO6hqr4oOQKJtik5toefY/hwXOm
	 BACpZjzJo4Ede9AF1U8U6Fvcvq7ylbTbBk6O1egI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1944F805A0; Thu, 15 Aug 2024 06:24:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E5DF8059F;
	Thu, 15 Aug 2024 06:24:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 518A5F80423; Thu, 15 Aug 2024 06:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46C0DF80107
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 06:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C0DF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HMqFF7mo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723695604; x=1755231604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Isv9TeElQrkCl2wLZdIZV0/D+zvkAUMoUvGVsAW1eM=;
  b=HMqFF7moGczCX9rQBdATzG7mDKRw0MrUrY82kDvSUwUuC+gx1KGai1fJ
   5ZlxT+Xn5hZjizYKhBTyE+Gs5i4c9iYy4UUW5i0OD1as50pIhdNEl6t19
   9dmt01IC8leSNJZzqIxamJwxwWVzKdng/XmMh25poqi2gKMmES1Kr1XwL
   UyWi5wfkdJZV9thOdMncycmzHusPeD/qBtc6wRRCSV+mL7H7pDj+K9er+
   RzUrnOVHjAssemtH2jtnrEx057jIc1yPCEYQBDutbQ/vC/+vk6JLyN/dd
   mRePsaaxCxGgh337AtEhOI9QbcJ3YgK77ZBWTczF2sYg8cY8Ghz0xyCHZ
   w==;
X-CSE-ConnectionGUID: y6y8UTInSKK6qMe70Frw0Q==
X-CSE-MsgGUID: RnMwTaBhSom0Jo3XbJvhUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21814118"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600";
   d="scan'208";a="21814118"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 21:19:57 -0700
X-CSE-ConnectionGUID: Q+IpTbFESY+dOtxrcH/MtQ==
X-CSE-MsgGUID: AVh7NCqrThOB/s8BN1RxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600";
   d="scan'208";a="59255426"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2024 21:19:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRxo-0003BK-1s;
	Thu, 15 Aug 2024 04:19:52 +0000
Date: Thu, 15 Aug 2024 12:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <202408151223.etnjDl4b-lkp@intel.com>
References: <20240813052609.56527-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813052609.56527-2-kiseok.jo@irondevice.com>
Message-ID-Hash: PL73BHYKH4KOLY6A2N4DFGBXQK7KVUZP
X-Message-ID-Hash: PL73BHYKH4KOLY6A2N4DFGBXQK7KVUZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PL73BHYKH4KOLY6A2N4DFGBXQK7KVUZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Kiseok,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiseok-Jo/ASoC-sma1307-Add-driver-for-Iron-Device-SMA1307/20240815-001157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240813052609.56527-2-kiseok.jo%40irondevice.com
patch subject: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240815/202408151223.etnjDl4b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151223.etnjDl4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151223.etnjDl4b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/sma1307.c:2191:2: warning: switch condition has boolean value [-Wswitch-bool]
    2191 |         switch (sma1307->amp_set) {
         |         ^       ~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2191 sound/soc/codecs/sma1307.c

  2159	
  2160	static void sma1307_reset(struct snd_soc_component *component)
  2161	{
  2162		struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
  2163		int ret = 0;
  2164		unsigned int status = 0;
  2165	
  2166		dev_dbg(sma1307->dev, "%s: Reset start\n", __func__);
  2167		ret = sma1307_regmap_read(sma1307, SMA1307_FF_DEVICE_INDEX, &status);
  2168	
  2169		if (ret != 0)
  2170			dev_err(sma1307->dev,
  2171				"%s: failed to read SMA1307_FF_DEVICE_INDEX : %d\n",
  2172				__func__, ret);
  2173		else {
  2174			sma1307->rev_num = status & SMA1307_REV_NUM_STATUS;
  2175			dev_dbg(component->dev,
  2176				 "%s: SMA1307 Revision %d\n",
  2177				 __func__, sma1307->rev_num);
  2178		}
  2179	
  2180		sma1307_regmap_read(sma1307, SMA1307_99_OTP_TRM2, &sma1307->otp_trm2);
  2181		sma1307_regmap_read(sma1307, SMA1307_9A_OTP_TRM3, &sma1307->otp_trm3);
  2182	
  2183		if ((sma1307->otp_trm2 & SMA1307_OTP_STAT_MASK) == SMA1307_OTP_STAT_1)
  2184			dev_dbg(component->dev, "%s: SMA1307 OTP Status Successful\n",
  2185				 __func__);
  2186		else
  2187			dev_dbg(component->dev, "%s: SMA1307 OTP Status Fail\n",
  2188				 __func__);
  2189	
  2190		/* Register Initial Value Setting */
> 2191		switch (sma1307->amp_set) {
  2192		case SMA1307_DEFAULT_SET:
  2193			sma1307_set_default(component);
  2194			break;
  2195		case SMA1307_BINARY_FILE_SET:
  2196			sma1307_setting_loaded(sma1307, setting_file);
  2197			if (sma1307->set.status) {
  2198				sma1307_set_binary(component);
  2199			} else {
  2200				sma1307->force_mute_status = true;
  2201				sma1307_set_default(component);
  2202			}
  2203			break;
  2204		}
  2205		sma1307_regmap_update_bits(sma1307,
  2206					   SMA1307_93_INT_CTRL,
  2207					   SMA1307_DIS_INT_MASK, SMA1307_HIGH_Z_INT);
  2208		sma1307_regmap_write(sma1307, SMA1307_0A_SPK_VOL, sma1307->init_vol);
  2209	}
  2210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
