Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7807C6830F5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 16:11:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C957D208;
	Tue, 31 Jan 2023 16:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C957D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675177868;
	bh=MEM1cwCVSTmwLqFbehqNIVjnLWUHb6/SQKKmZ3uIb3o=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I1jVFR9OIoEBSgcULzqQJYBT0ZBVuNYOSHJx6xFSDk8nzVqkpEuJITAAQSbLUs49A
	 LOYK6JMbHgnliZs9mA+9JWp71LfVuYSJPRPsqQvbq8QoMytidw+WpdOvlFjyEEORQs
	 4J6EWCIqfAx94Jjhx5gMrljWWiLaIGv08ToNeLW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 211F2F804DF;
	Tue, 31 Jan 2023 16:10:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA13EF804C2; Tue, 31 Jan 2023 16:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 013CFF80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 16:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013CFF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BrcTXZ2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675177803; x=1706713803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MEM1cwCVSTmwLqFbehqNIVjnLWUHb6/SQKKmZ3uIb3o=;
 b=BrcTXZ2L6cCO5TWPHV7M4IDoUC2hEN2dU8f6G2ygqbTbF99gSD1sAxpI
 zCcepBQTdTEtJg6j/j6NUxMUH9fEQy1NJ6dcRi609mSbAbN9Ecx9a+fIa
 gwASmRbD4h8+nmn8SjFCBCVazsJ4Q51jVK0nCFChRe2/dXKlzltZbdwUC
 jH29ZeK5aICJefc5kj9Di3ActugwaK/TvoHiTDwug7FeuYNJDPX7yN0wp
 MEQi4iy6ziE3VEKjrsZ0HJQ/wOEmVkSBpcIODNrxSSPZYvKQ1XP97AwXK
 tM7EiOu3l/Ay1csDrk6enMgnwLoCXYfGnxJLXRRq/PjngirDf546GBml1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="326524635"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="326524635"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 07:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664519803"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="664519803"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 31 Jan 2023 07:09:57 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pMsGi-0004Ug-0X;
 Tue, 31 Jan 2023 15:09:56 +0000
Date: Tue, 31 Jan 2023 23:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v2] ASoC: tas2781: Add tas2781 driver.
Message-ID: <202301312243.8wxlGhpo-lkp@intel.com>
References: <20230131131701.7097-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131131701.7097-1-13916275206@139.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, oe-kbuild-all@lists.linux.dev,
 Shenghao Ding <13916275206@139.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Shenghao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.2-rc6 next-20230131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230131-212221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230131131701.7097-1-13916275206%40139.com
patch subject: [PATCH v2] ASoC: tas2781: Add tas2781 driver.
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301312243.8wxlGhpo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d0782b52a1274657458fa49356eacb7c56eddf6b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230131-212221
        git checkout d0782b52a1274657458fa49356eacb7c56eddf6b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-dsp.c:591:5: warning: no previous prototype for 'fw_parse_variable_header_git' [-Wmissing-prototypes]
     591 | int fw_parse_variable_header_git(struct tasdevice_priv *tas_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/tas2781-dsp.c:650:5: warning: no previous prototype for 'fw_parse_variable_header_cal' [-Wmissing-prototypes]
     650 | int fw_parse_variable_header_cal(struct tasdevice_priv *tas_dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fw_parse_variable_header_git +591 sound/soc/codecs/tas2781-dsp.c

   590	
 > 591	int fw_parse_variable_header_git(struct tasdevice_priv *tas_dev,
   592		const struct firmware *fmw, int offset)
   593	{
   594		const unsigned char *buf = fmw->data;
   595		struct tasdevice_fw *tas_fmw = tas_dev->fmw;
   596		struct tasdevice_dspfw_hdr *fw_hdr = &(tas_fmw->fw_hdr);
   597		int i = strlen((char *)&buf[offset]);
   598	
   599		i++;
   600	
   601		if (offset + i > fmw->size) {
   602			dev_err(tas_dev->dev, "%s: File Size error\n", __func__);
   603			offset = -1;
   604			goto out;
   605		}
   606	
   607		offset  += i;
   608	
   609		if (offset + 4 > fmw->size) {
   610			dev_err(tas_dev->dev, "%s: File Size error\n", __func__);
   611			offset = -1;
   612			goto out;
   613		}
   614		fw_hdr->device_family = SMS_HTONL(buf[offset], buf[offset + 1],
   615			buf[offset + 2], buf[offset + 3]);
   616		if (fw_hdr->device_family != 0) {
   617			dev_err(tas_dev->dev, "ERROR:%s: not TAS device\n", __func__);
   618			offset = -1;
   619			goto out;
   620		}
   621		offset  += 4;
   622		if (offset + 4 > fmw->size) {
   623			dev_err(tas_dev->dev, "%s: File Size error\n", __func__);
   624			offset = -1;
   625			goto out;
   626		}
   627		fw_hdr->device = SMS_HTONL(buf[offset], buf[offset + 1],
   628			buf[offset + 2], buf[offset + 3]);
   629		if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||
   630			fw_hdr->device == 6) {
   631			dev_err(tas_dev->dev, "ERROR:%s: not support device %d\n",
   632				__func__, fw_hdr->device);
   633			offset = -1;
   634			goto out;
   635		}
   636		offset  += 4;
   637		fw_hdr->ndev = deviceNumber[fw_hdr->device];
   638		if (fw_hdr->ndev != tas_dev->ndev) {
   639			dev_err(tas_dev->dev,
   640				"%s: ndev(%u) in dspbin dismatch ndev(%u) in DTS\n",
   641				__func__, fw_hdr->ndev,
   642				tas_dev->ndev);
   643			offset = -1;
   644		}
   645	
   646	out:
   647		return offset;
   648	}
   649	
 > 650	int fw_parse_variable_header_cal(struct tasdevice_priv *tas_dev,
   651		struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
   652	{
   653		const unsigned char *buf = fmw->data;
   654		struct tasdevice_dspfw_hdr *fw_hdr = &(tas_fmw->fw_hdr);
   655		int i = strlen((char *)&buf[offset]);
   656	
   657		i++;
   658	
   659		if (offset + i > fmw->size) {
   660			dev_err(tas_dev->dev, "%s: File Size error\n", __func__);
   661			offset = -1;
   662			goto out;
   663		}
   664	
   665		offset  += i;
   666	
   667		if (offset + 4 > fmw->size) {
   668			dev_err(tas_dev->dev, "%s: mnDeviceFamily error\n", __func__);
   669			offset = -1;
   670			goto out;
   671		}
   672		fw_hdr->device_family = SMS_HTONL(buf[offset], buf[offset + 1],
   673			buf[offset + 2], buf[offset + 3]);
   674		if (fw_hdr->device_family != 0) {
   675			dev_err(tas_dev->dev, "ERROR:%s: not TAS device\n", __func__);
   676			offset = -1;
   677			goto out;
   678		}
   679		offset  += 4;
   680		if (offset + 4 > fmw->size) {
   681			dev_err(tas_dev->dev, "%s: mnDevice error\n", __func__);
   682			offset = -1;
   683			goto out;
   684		}
   685		fw_hdr->device = SMS_HTONL(buf[offset], buf[offset + 1],
   686			buf[offset + 2], buf[offset + 3]);
   687		if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||
   688			fw_hdr->device == 6) {
   689			dev_err(tas_dev->dev, "ERROR:%s: not support device %d\n",
   690				__func__, fw_hdr->device);
   691			offset = -1;
   692			goto out;
   693		}
   694		offset  += 4;
   695		fw_hdr->ndev = deviceNumber[fw_hdr->device];
   696		if (fw_hdr->ndev != 1) {
   697			dev_err(tas_dev->dev,
   698				"%s: calbin must be 1, but currently ndev(%u)\n",
   699				__func__, fw_hdr->ndev);
   700			offset = -1;
   701		}
   702	
   703	out:
   704		return offset;
   705	}
   706	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
