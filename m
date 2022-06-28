Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A755BC8F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 02:14:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9783C1657;
	Tue, 28 Jun 2022 02:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9783C1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656375282;
	bh=/m//RVJUk7ReNFOJ96tIb+azW6S2LNzlgtWV99yKPtc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mM9DRXHIL0Ot6jjgjCHGpFSGfb2JH6aM6ppbFOrrkB+G38ywhzVSC9DE7SOyFxhOR
	 HdYpb3r+ZNkPJrFUDz3esyYE9nC5N5vmH0uILA3mBPeIz/6UE9hJ0ja3K4i4l/akga
	 YESqEuNMSu2+hEr9gLquGIREGP463PzvHt2XRDE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B05EF8028D;
	Tue, 28 Jun 2022 02:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60AF5F8028B; Tue, 28 Jun 2022 02:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03790F80107
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 02:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03790F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jqa302Uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656375217; x=1687911217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/m//RVJUk7ReNFOJ96tIb+azW6S2LNzlgtWV99yKPtc=;
 b=Jqa302UhKo08Fnr+R0eNhPX+Ma4So+d9R98592H4ZOrBKk2P/biRaq3R
 G2Jx7XKe2/2YzI68QBaUlKKHpOb0iqK9poB9h9n9d95EIBgYc8ZHnSYoD
 G0iR6/nwd1lYbLryna7G/5qCwcmiQbM2EC+SfpGXeHmOCXiaqSBPwOWpR
 y/Nh1QgzGH3C84E8G+efVEsYq9RxTPQv97YubDU1RHZIN6Li8bWss1wFc
 p1xWxgpNsAQqzUqP+Miu6tXdPBjetJ69RD9iilECJUsLKeQqIEmeF1u/K
 xhE6oJeZSULEm9Q7HR3OwFk0Y4MsoL3e8UqEs2Ca9FlLPqWM7kJTRnokX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="307070898"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="307070898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 17:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="590103893"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 27 Jun 2022 17:13:09 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o5yqr-0009G8-6s;
 Tue, 28 Jun 2022 00:13:09 +0000
Date: Tue, 28 Jun 2022 08:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 1/2] ACPI: utils: Add api to read _SUB from ACPI
Message-ID: <202206280813.F9ukvWAK-lkp@intel.com>
References: <20220627155138.807420-2-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627155138.807420-2-sbinding@opensource.cirrus.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on broonie-sound/for-next linus/master v5.19-rc4 next-20220627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220627-235448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: x86_64-rhel-8.3-syz (https://download.01.org/0day-ci/archive/20220628/202206280813.F9ukvWAK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/7dd124b65442fd6622e7df2949795f735d8356be
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Stefan-Binding/Read-_SUB-from-ACPI-to-be-able-to-identify-firmware/20220627-235448
        git checkout 7dd124b65442fd6622e7df2949795f735d8356be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/acpi/utils.c:17:
   drivers/acpi/utils.c: In function 'acpi_get_subsystem_id':
>> drivers/acpi/utils.c:317:49: warning: format '%d' expects argument of type 'int', but argument 4 has type '__kernel_size_t' {aka 'long unsigned int'} [-Wformat=]
     317 |                         acpi_handle_err(handle, "ACPI _SUB Length %d is Invalid\n",
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:1172:46: note: in definition of macro 'acpi_handle_err'
    1172 |         acpi_handle_printk(KERN_ERR, handle, fmt, ##__VA_ARGS__)
         |                                              ^~~
   drivers/acpi/utils.c:317:68: note: format string is defined here
     317 |                         acpi_handle_err(handle, "ACPI _SUB Length %d is Invalid\n",
         |                                                                   ~^
         |                                                                    |
         |                                                                    int
         |                                                                   %ld


vim +317 drivers/acpi/utils.c

   295	
   296	const char *acpi_get_subsystem_id(acpi_handle handle)
   297	{
   298		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
   299		union acpi_object *obj;
   300		acpi_status status;
   301		const char *sub;
   302	
   303		status = acpi_evaluate_object(handle, METHOD_NAME__SUB, NULL, &buffer);
   304		if (ACPI_FAILURE(status)) {
   305			acpi_handle_debug(handle, "Reading ACPI _SUB failed: %#x\n", status);
   306			return ERR_PTR(-ENODATA);
   307		}
   308	
   309		obj = buffer.pointer;
   310		if (obj->type == ACPI_TYPE_STRING) {
   311			if (strlen(obj->string.pointer) < ACPI_MAX_SUB_BUF_SIZE &&
   312			    strlen(obj->string.pointer) > 0) {
   313				sub = kstrdup(obj->string.pointer, GFP_KERNEL);
   314				if (!sub)
   315					sub = ERR_PTR(-ENOMEM);
   316			} else {
 > 317				acpi_handle_err(handle, "ACPI _SUB Length %d is Invalid\n",
   318						strlen(obj->string.pointer));
   319				sub = ERR_PTR(-EINVAL);
   320			}
   321		} else {
   322			acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
   323			sub = ERR_PTR(-EINVAL);
   324		}
   325	
   326		acpi_os_free(buffer.pointer);
   327	
   328		return sub;
   329	}
   330	EXPORT_SYMBOL_GPL(acpi_get_subsystem_id);
   331	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
