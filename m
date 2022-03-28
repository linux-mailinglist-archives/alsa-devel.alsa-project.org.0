Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D74E9BFF
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 18:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 600431715;
	Mon, 28 Mar 2022 18:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 600431715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648483943;
	bh=EyFL9vehGGSWjtUPI8WwMooTYrzEzpqH7Ia4FoQJCYM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dD1bo24I0feVSqlHaITKh8g+evvCWte7SMCe2Sc1cBpa0AvEac5D7dGztlcyoQZaN
	 8HSnGvT3V7quPpktoy9B9F6iTI1gi3Brdvw/uEF7k1/zvdA1fIy/myJSeDVx/Gju5v
	 x477jGt0oC9q7s9Eq2cRr7gEDGGDo/Fwi/3RKTqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8549F800CB;
	Mon, 28 Mar 2022 18:11:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E33F8024C; Mon, 28 Mar 2022 18:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A25F3F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 18:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25F3F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UJ/kPNnX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648483869; x=1680019869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EyFL9vehGGSWjtUPI8WwMooTYrzEzpqH7Ia4FoQJCYM=;
 b=UJ/kPNnXAQPiixS18VyuDwBojQ2q3wU5HTdJR99b2x3MONwg2UN5SPku
 w9XTpjDuhNSL5hMNEPzkvJAZOD3dDuxQmo+biZmTyV3DqYC8xxVm2Ts/H
 E/sxm80MNU0hNKkJS8FuWXvE32yYj3cDxKsLI7f3Yqd2llCIZioGoyuQv
 GwTrzCZgBV2JH05N2Z1woY/wep60BYhMrHKATehsXHIdyOWY6C4cFDi6l
 y/HCoi4Ku9nc9+GBybY0wez/WiHhENhMFBbGtaPQc5IZ2l6Kqc8IJMI2I
 jkw8ScXB+GQf/oLMIb87eFpxiveLxosKfsgNvrK3PdIrwD7C6EwJLRWwW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246529381"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="246529381"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 09:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="652144977"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2022 09:10:47 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nYrx8-00028y-VM; Mon, 28 Mar 2022 16:10:46 +0000
Date: Tue, 29 Mar 2022 00:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mohan Kumar <mkumard@nvidia.com>, tiwai@suse.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, ville.syrjala@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: Avoid unsol event during RPM suspending
Message-ID: <202203290053.emhsIdTK-lkp@intel.com>
References: <20220328091411.31488-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328091411.31488-1-mkumard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 Mohan Kumar <mkumard@nvidia.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mohan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v5.17 next-20220328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohan-Kumar/ALSA-hda-Avoid-unsol-event-during-RPM-suspending/20220328-171517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: s390-randconfig-c005-20220327 (https://download.01.org/0day-ci/archive/20220329/202203290053.emhsIdTK-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/80c4e21f5e97cd4b779806fa5da5bb7392e2874f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mohan-Kumar/ALSA-hda-Avoid-unsol-event-during-RPM-suspending/20220328-171517
        git checkout 80c4e21f5e97cd4b779806fa5da5bb7392e2874f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash sound/pci/hda/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/patch_hdmi.c:21:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from sound/pci/hda/patch_hdmi.c:21:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from sound/pci/hda/patch_hdmi.c:21:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> sound/pci/hda/patch_hdmi.c:1644:15: error: no member named 'runtime_status' in 'struct dev_pm_info'
                   (dev->power.runtime_status == RPM_SUSPENDING))
                    ~~~~~~~~~~ ^
   12 warnings and 1 error generated.


vim +1644 sound/pci/hda/patch_hdmi.c

  1620	
  1621	/* update ELD and jack state via HD-audio verbs */
  1622	static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
  1623						 int repoll)
  1624	{
  1625		struct hda_codec *codec = per_pin->codec;
  1626		struct hdmi_spec *spec = codec->spec;
  1627		struct hdmi_eld *eld = &spec->temp_eld;
  1628		struct device *dev = hda_codec_dev(codec);
  1629		hda_nid_t pin_nid = per_pin->pin_nid;
  1630		int dev_id = per_pin->dev_id;
  1631		/*
  1632		 * Always execute a GetPinSense verb here, even when called from
  1633		 * hdmi_intrinsic_event; for some NVIDIA HW, the unsolicited
  1634		 * response's PD bit is not the real PD value, but indicates that
  1635		 * the real PD value changed. An older version of the HD-audio
  1636		 * specification worked this way. Hence, we just ignore the data in
  1637		 * the unsolicited response to avoid custom WARs.
  1638		 */
  1639		int present;
  1640		int ret;
  1641	
  1642		ret = snd_hda_power_up_pm(codec);
  1643		if ((ret < 0 && pm_runtime_suspended(dev)) ||
> 1644			(dev->power.runtime_status == RPM_SUSPENDING))
  1645			goto out;
  1646	
  1647		present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
  1648	
  1649		mutex_lock(&per_pin->lock);
  1650		eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
  1651		if (eld->monitor_present)
  1652			eld->eld_valid  = !!(present & AC_PINSENSE_ELDV);
  1653		else
  1654			eld->eld_valid = false;
  1655	
  1656		codec_dbg(codec,
  1657			"HDMI status: Codec=%d NID=0x%x Presence_Detect=%d ELD_Valid=%d\n",
  1658			codec->addr, pin_nid, eld->monitor_present, eld->eld_valid);
  1659	
  1660		if (eld->eld_valid) {
  1661			if (spec->ops.pin_get_eld(codec, pin_nid, dev_id,
  1662						  eld->eld_buffer, &eld->eld_size) < 0)
  1663				eld->eld_valid = false;
  1664		}
  1665	
  1666		update_eld(codec, per_pin, eld, repoll);
  1667		mutex_unlock(&per_pin->lock);
  1668	 out:
  1669		snd_hda_power_down_pm(codec);
  1670	}
  1671	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
