Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A796A370
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 17:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AFF4847;
	Tue,  3 Sep 2024 17:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AFF4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725379073;
	bh=dqTzY8p3sHUzU8UjqwSvZd4CiJ8xkwss1UPetyRjYQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=crsw18tHd2Smmd1y5YxOygRrCnGUdV+f/bNIA4gW23U2uyQfPI+LiSkYzyZCeaRUg
	 YB+2keLnAKV7PQIGK4NN1EuAi2JJ9cTQ7r2DJyCD4V0FafMQLW+PvLiXWZu+A0OhrI
	 W/M3RmlVf2c+LCFo+y2nLyyk77JVJSLCo0rxmKU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CD7DF805B2; Tue,  3 Sep 2024 17:57:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B76F8059F;
	Tue,  3 Sep 2024 17:57:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31327F80199; Tue,  3 Sep 2024 17:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B05C9F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 17:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B05C9F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cI+9nRFa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379044; x=1756915044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqTzY8p3sHUzU8UjqwSvZd4CiJ8xkwss1UPetyRjYQo=;
  b=cI+9nRFaZnJObeNhVWHADchxr4ACSgxnsZhLE+otnwugU6lQNsT25uXm
   QgUFYf8cg6+PK4EBSDkg851eHDDkqls7ZAApEdWQDaYV/J87on4ok4KKe
   MHcB6JNDPko9D8eSIqpguGlN4uOb1leoPZ1vXt/xIVs83+xHaJVkFMg8p
   TZqETQHwkVtiP45Bdk1DN3Yji9EhkQWMqbXbTfXXFwPcsc9rZAMvQMZDL
   Xx6edgJNjwMJ/jPOTZ/ihJ4BGBfO4n9hoCyx4giN4JMzek0xQJSIEsFi6
   3LHkJrMMMALplRGwjBCuxjU1MHmwH9W6kEBTtssV4Y/d5mQ2QimvaN+ZK
   A==;
X-CSE-ConnectionGUID: k2Ftu/DXSYWAX675vfJYiA==
X-CSE-MsgGUID: wlWSAClyQwSEmTQGC0c+yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="46514801"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600";
   d="scan'208";a="46514801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:57:19 -0700
X-CSE-ConnectionGUID: zX3m1XBpSGaLYYwc8K/arQ==
X-CSE-MsgGUID: 8WfA5OuMR2aagxB/eZ7EgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600";
   d="scan'208";a="64949427"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Sep 2024 08:57:16 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slVu5-0006rW-1T;
	Tue, 03 Sep 2024 15:57:13 +0000
Date: Tue, 3 Sep 2024 23:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	application@irondevice.com, Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <202409032357.hPIdG9kb-lkp@intel.com>
References: <20240903054435.2659-2-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-2-kiseok.jo@irondevice.com>
Message-ID-Hash: ARJQAPF5WAA5KUFSSEPDBBNADFUCRLRB
X-Message-ID-Hash: ARJQAPF5WAA5KUFSSEPDBBNADFUCRLRB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARJQAPF5WAA5KUFSSEPDBBNADFUCRLRB/>
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
[also build test WARNING on robh/for-next linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiseok-Jo/ASoC-sma1307-Add-driver-for-Iron-Device-SMA1307/20240903-134558
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240903054435.2659-2-kiseok.jo%40irondevice.com
patch subject: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240903/202409032357.hPIdG9kb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032357.hPIdG9kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032357.hPIdG9kb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/sma1307.c: In function 'sma1307_setting_loaded':
>> sound/soc/codecs/sma1307.c:1772:44: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1772 |         int *data, size, offset, num_mode, ret;
         |                                            ^~~


vim +/ret +1772 sound/soc/codecs/sma1307.c

  1768	
  1769	static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *file)
  1770	{
  1771		const struct firmware *fw;
> 1772		int *data, size, offset, num_mode, ret;
  1773	
  1774		ret = request_firmware(&fw, file, sma1307->dev);
  1775	
  1776		if (!fw) {
  1777			dev_err(sma1307->dev, "%s: failed to read \"%s\"\n",
  1778				__func__, setting_file);
  1779			release_firmware(fw);
  1780			sma1307->set.status = false;
  1781			return;
  1782		} else if ((fw->size) < SMA1307_SETTING_HEADER_SIZE) {
  1783			dev_err(sma1307->dev, "%s: Invalid file\n", __func__);
  1784			release_firmware(fw);
  1785			sma1307->set.status = false;
  1786			return;
  1787		}
  1788	
  1789		data = kzalloc(fw->size, GFP_KERNEL);
  1790		size = fw->size >> 2;
  1791		memcpy(data, fw->data, fw->size);
  1792	
  1793		release_firmware(fw);
  1794	
  1795		/* HEADER */
  1796		sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
  1797		sma1307->set.checksum = data[sma1307->set.header_size - 2];
  1798		sma1307->set.num_mode = data[sma1307->set.header_size - 1];
  1799		num_mode = sma1307->set.num_mode;
  1800		sma1307->set.header = devm_kzalloc(sma1307->dev,
  1801						   sma1307->set.header_size,
  1802						   GFP_KERNEL);
  1803		memcpy(sma1307->set.header, data,
  1804		       sma1307->set.header_size * sizeof(int));
  1805	
  1806		if ((sma1307->set.checksum >> 8) != SMA1307_SETTING_CHECKSUM) {
  1807			dev_err(sma1307->dev, "%s: failed by dismatch \"%s\"\n",
  1808				__func__, setting_file);
  1809			sma1307->set.status = false;
  1810			return;
  1811		}
  1812	
  1813		/* DEFAULT */
  1814		sma1307->set.def_size = SMA1307_SETTING_DEFAULT_SIZE;
  1815		sma1307->set.def
  1816		    = devm_kzalloc(sma1307->dev,
  1817				   sma1307->set.def_size * sizeof(int), GFP_KERNEL);
  1818		memcpy(sma1307->set.def,
  1819		       &data[sma1307->set.header_size],
  1820		       sma1307->set.def_size * sizeof(int));
  1821	
  1822		/* MODE */
  1823		offset = sma1307->set.header_size + sma1307->set.def_size;
  1824		sma1307->set.mode_size = DIV_ROUND_CLOSEST(size - offset, num_mode + 1);
  1825		for (int i = 0; i < num_mode; i++) {
  1826			sma1307->set.mode_set[i]
  1827			    = devm_kzalloc(sma1307->dev,
  1828					   sma1307->set.mode_size * 2 * sizeof(int),
  1829					   GFP_KERNEL);
  1830			for (int j = 0; j < sma1307->set.mode_size; j++) {
  1831				sma1307->set.mode_set[i][2 * j]
  1832				    = data[offset + ((num_mode + 1) * j)];
  1833				sma1307->set.mode_set[i][2 * j + 1]
  1834				    = data[offset + ((num_mode + 1) * j + i + 1)];
  1835			}
  1836		}
  1837	
  1838		kfree(data);
  1839		sma1307->set.status = true;
  1840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
