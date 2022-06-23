Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B45C557158
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 06:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2EA31B24;
	Thu, 23 Jun 2022 06:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2EA31B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655957013;
	bh=iAIaqF7rha3sZC6nzOYKWGpBVTJjKr5yx5Wg7Q0/sfA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5oTI7TthRwviVdl/jzXxLJ/3x1Nls+X5Zoe5TBhWIX0DnbhTWGi5v8+QLWJCNph9
	 io0c2we2iyEa9NqEZFZnBqEjXapoCYoHSU0t8moARZDzS7/zBzxxeJIg3EYPQA7MLA
	 FZ+d/jq5qCgxwNZU1xPC+uW6c4FMes3RtpYUUheE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3FCF804CC;
	Thu, 23 Jun 2022 06:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3393F804C1; Thu, 23 Jun 2022 06:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A8FF800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 06:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A8FF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DZxTUXid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655956942; x=1687492942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iAIaqF7rha3sZC6nzOYKWGpBVTJjKr5yx5Wg7Q0/sfA=;
 b=DZxTUXidqnc5fcthy2v/w8GXSrVUmskRXlusG6Wwu7QI6IHT1qP7ClLq
 HQBBOnJ4z2X3WXqEkpegd3lhgWUd7RuYXCDgC/yM+z501sZKap8rJ14ZM
 Bvh93CqvAmDbXMepZ70fQQHLXY5jH87tLjosxxNgFcrz3nuVmsFN1MKMH
 ogN3LDEFrG6CM0fPaLNPRVxGtjNAOuS4S5CTyX+NJvhJCrY95HTL3LkWk
 uORHzk9rWBlUD5QRls8FypLWYnbn5eUgIZhQYloLjm/UJuDucBp+8B4oc
 d4vlpRqDp2qKxlIxlxnLFA/+UXMNhb5PLl0ogS1oUFshO4Fd1EqeGpND/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="366937445"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="366937445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 21:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="655991306"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2022 21:02:13 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o4E2m-0000fn-QR;
 Thu, 23 Jun 2022 04:02:12 +0000
Date: Thu, 23 Jun 2022 12:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
Message-ID: <202206231108.xPflWTbR-lkp@intel.com>
References: <20220622130730.1573747-3-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622130730.1573747-3-sbinding@opensource.cirrus.com>
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
config: sparc64-randconfig-r002-20220622 (https://download.01.org/0day-ci/archive/20220623/202206231108.xPflWTbR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/338eadc59e88d60759ea445011a6537222b233e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220622-211004
        git checkout 338eadc59e88d60759ea445011a6537222b233e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs35l41.c: In function 'cs35l41_probe_acpi':
>> sound/soc/codecs/cs35l41.c:1157:32: error: invalid use of undefined type 'struct acpi_device'
    1157 |         ret = acpi_get_sub(adev->handle, sub, sizeof(sub));
         |                                ^~


vim +1157 sound/soc/codecs/cs35l41.c

  1145	
  1146	static int cs35l41_probe_acpi(struct cs35l41_private *cs35l41)
  1147	{
  1148		struct acpi_device *adev;
  1149		int ret;
  1150		char sub[ACPI_MAX_SUB_BUF_SIZE];
  1151	
  1152		adev = ACPI_COMPANION(cs35l41->dev);
  1153		/* If there is no ACPI_COMPANION, there is no ACPI for this system, return 0 */
  1154		if (!adev)
  1155			return 0;
  1156	
> 1157		ret = acpi_get_sub(adev->handle, sub, sizeof(sub));
  1158		if (ret < 0)
  1159			return ret;
  1160	
  1161		cs35l41->dsp.system_name = devm_kstrdup(cs35l41->dev, sub, GFP_KERNEL);
  1162		if (!cs35l41->dsp.system_name)
  1163			return -ENOMEM;
  1164	
  1165		return 0;
  1166	}
  1167	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
