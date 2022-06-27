Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3455BAC4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 17:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441C3167F;
	Mon, 27 Jun 2022 17:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441C3167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656344087;
	bh=5z4e8YkrpJuqMo/WrMKsbmJ8jjBxVMfE5QCMZ7wIgIg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQGxog/TKxfBdHpBkwpC6BNL+vAD0jmoZHvVe/BPOmKYLU9yPfvwbg5GW1rYdNiOX
	 TRbCPwE3dtIyU8i7C6XtqpTmBr79EiaRr1wDAoxhs+H34UKwiE4csYP7/WI4iodXjR
	 0UV3X5l6Ubg6KjtkrMrK48hqSJ2lBPtXmOeP/D+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7D5F80107;
	Mon, 27 Jun 2022 17:33:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91FB8F8028B; Mon, 27 Jun 2022 17:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A360BF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A360BF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kb47dhpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656344020; x=1687880020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5z4e8YkrpJuqMo/WrMKsbmJ8jjBxVMfE5QCMZ7wIgIg=;
 b=kb47dhpmY5RwkWehkk1m3Ngv7mAEy90isqmlBfyAgIXMBT1JP8Fji53d
 zpPZQq9Rzw1kcc/IJ49kq1C9HwE49pAZHcrl0A/ZadZQGvJEpMr+aQ4Pk
 71LolHlt25AILQSctXtJFagXuxO5Ug59Q9Y6Z7TsF/L9fhvaQKDulKCCK
 wi87Z+apQS7ZfzHZhV+2gbWwDW1eTHYsFuVhcJuDIx5G3ICb6LAJp9746
 AMklNtDcby3wbCY5JiNaEwUROQ48ESdn2XG2GkowOlwuG+Ovp7oPua9fY
 hgvaUwQ8JxqQOmvODVXw46qbdZNrHLWybl9EVhBufqW2vBG8//7417Kj1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="270217743"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="270217743"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="616819892"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 27 Jun 2022 08:33:30 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o5qjx-0008hv-V9;
 Mon, 27 Jun 2022 15:33:29 +0000
Date: Mon, 27 Jun 2022 23:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: utils: Add api to read _SUB from ACPI
Message-ID: <202206272354.ESTdiIXg-lkp@intel.com>
References: <20220627141148.804319-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627141148.804319-2-sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 patches@opensource.cirrus.com, Stefan Binding <sbinding@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
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
[also build test ERROR on broonie-sound/for-next linus/master v5.19-rc4 next-20220627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220627-221508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20220627/202206272354.ESTdiIXg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/93ba13d4b3636b5cf2ff4d9185aa73f059cc7b2a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220627-221508
        git checkout 93ba13d4b3636b5cf2ff4d9185aa73f059cc7b2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from init/main.c:30:
>> include/linux/acpi.h:1028:1: error: expected identifier or '(' before '{' token
    1028 | {
         | ^
   init/main.c:769:20: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     769 | void __init __weak arch_post_acpi_subsys_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   init/main.c:781:20: warning: no previous prototype for 'mem_encrypt_init' [-Wmissing-prototypes]
     781 | void __init __weak mem_encrypt_init(void) { }
         |                    ^~~~~~~~~~~~~~~~
   init/main.c:783:20: warning: no previous prototype for 'poking_init' [-Wmissing-prototypes]
     783 | void __init __weak poking_init(void) { }
         |                    ^~~~~~~~~~~
   In file included from init/main.c:30:
   include/linux/acpi.h:1027:27: warning: 'acpi_get_subsystem_id' declared 'static' but never defined [-Wunused-function]
    1027 | static inline const char *acpi_get_subsystem_id(acpi_handle handle);
         |                           ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sysctl.c:55:
>> include/linux/acpi.h:1028:1: error: expected identifier or '(' before '{' token
    1028 | {
         | ^
   include/linux/acpi.h:1027:27: warning: 'acpi_get_subsystem_id' declared 'static' but never defined [-Wunused-function]
    1027 | static inline const char *acpi_get_subsystem_id(acpi_handle handle);
         |                           ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/i2c.h:13,
                    from drivers/input/mouse/synaptics.c:30:
>> include/linux/acpi.h:1028:1: error: expected identifier or '(' before '{' token
    1028 | {
         | ^
   include/linux/acpi.h:1027:27: warning: 'acpi_get_subsystem_id' declared 'static' but never defined [-Wunused-function]
    1027 | static inline const char *acpi_get_subsystem_id(acpi_handle handle);
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/synaptics.c:164:27: warning: 'smbus_pnp_ids' defined but not used [-Wunused-const-variable=]
     164 | static const char * const smbus_pnp_ids[] = {
         |                           ^~~~~~~~~~~~~


vim +1028 include/linux/acpi.h

  1026	
  1027	static inline const char *acpi_get_subsystem_id(acpi_handle handle);
> 1028	{
  1029		return ERR_PTR(-ENODEV);
  1030	}
  1031	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
