Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA9556DBE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 23:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 673CD1AFC;
	Wed, 22 Jun 2022 23:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 673CD1AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655932335;
	bh=qETdEtCS92Y/0CHpomE0Y/TnCnDaHjp9IhR6dEaORYM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2KtkOPAQH/ao/yKPatq4nEsFnfTRwWs1qmZVaAmAsJtKLluo4WDf52LEemTdmjYO
	 vmKvQKoZ3bXqgkjxQ+f4nTc9cHrZdJBed7wIVg15cEh/cn2EnK2yiVQs6ZKypBlNm1
	 rnVzZbdQpZhp5thNogEdcKRWKvf+P1u6AXUT6AiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD32F8032D;
	Wed, 22 Jun 2022 23:11:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1764F802D2; Wed, 22 Jun 2022 23:11:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71BCF800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 23:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71BCF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eHykpkAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655932270; x=1687468270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qETdEtCS92Y/0CHpomE0Y/TnCnDaHjp9IhR6dEaORYM=;
 b=eHykpkALOfBahAXvBPIteYqtrcrAaScZaq2KrraeJd1nUFDpyj/ypTgt
 OIGncNjXp2P9Re0IYB4Zglr5zaWypDexg6buzZGPM0RVY7sp/auLIaJgE
 nAA7vwWVHFuvdcj61kHS3dZc+f/wPBuehAj2lSx/+e2Wlm+4DFLhl8uwz
 FVZzqfGFThgNVPZ/f851UXwE2xuqe7GuRVjHELoUfK61zQcTw7LoYI0gf
 p85RJTd/HQ3VlRTedVAs9p6AjkV6XzBW2nzLCOVJ6UxGWz+apLHPhjVkr
 qNDuFhNTFvZKZGFpy/iiEZYNcWix04jbdcJbzipZPN2pLgSeUzSuYLwrf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="342231949"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="342231949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 14:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644395860"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 22 Jun 2022 14:11:02 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o47cr-0001gv-Go;
 Wed, 22 Jun 2022 21:11:01 +0000
Date: Thu, 23 Jun 2022 05:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 1/2] ACPI: utils: Add api to read _SUB from ACPI
Message-ID: <202206230402.9xK6YlsY-lkp@intel.com>
References: <20220622130730.1573747-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622130730.1573747-2-sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-acpi@vger.kernel.org
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

Hi Stefan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on broonie-sound/for-next linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220622-211004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: powerpc-pasemi_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230402.9xK6YlsY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97b928a895ce3105296f0036393bb9ee04f11ae4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220622-211004
        git checkout 97b928a895ce3105296f0036393bb9ee04f11ae4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/i2c.h:13,
                    from include/uapi/linux/fb.h:6,
                    from include/linux/fb.h:7,
                    from include/linux/backlight.h:13,
                    from arch/powerpc/kernel/traps.c:32:
>> include/linux/acpi.h:1029:12: error: 'acpi_get_sub' defined but not used [-Werror=unused-function]
    1029 | static int acpi_get_sub(acpi_handle handle, char *sub, size_t size)
         |            ^~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/acpi_get_sub +1029 include/linux/acpi.h

  1028	
> 1029	static int acpi_get_sub(acpi_handle handle, char *sub, size_t size)
  1030	{
  1031		return -ENODEV;
  1032	}
  1033	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
