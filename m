Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3070D2758DA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 15:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A44D172C;
	Wed, 23 Sep 2020 15:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A44D172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600868187;
	bh=TpcaZu60CJ0I+nWfzzz21rI9EkQi06SzCcz3TDlVQlQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HiuQxVH52TVsafsRvPh1bZiAusL3nulLjCBFYE+cNf8EqjGtu5s0iot102SO/1MzX
	 BiDHFxOOB3HBidCmA0Ln/3vlzafZEdpnDOKrxUX0ME1a41tU9hqZ7CrCGpfOL6ox+0
	 7P+ev50hBaU3muXBAHJahGBN/fYHVy2sh1WS+k+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4AD6F8015F;
	Wed, 23 Sep 2020 15:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F3BBF80162; Wed, 23 Sep 2020 15:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B41F800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 15:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B41F800B4
IronPort-SDR: tNaT2AuMOteLrxz5koHrD1hwhjaQhChuG9z9a7m7wnVLLSh3teXCtqTd3S/EPL+pND/AJD6BbN
 iGxMxr5dBEFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="161821188"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="161821188"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:34:35 -0700
IronPort-SDR: g5p4Rr/1Xj/jGR1c9H77bqn03OesEabwI1cqcJ8DeTVE/tZSHehG2hBh9btqwlR6P5GrQpuqhk
 zE6R89Xu5+RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="338660657"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2020 06:34:31 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kL4uh-001PAm-J8; Wed, 23 Sep 2020 16:34:27 +0300
Date: Wed, 23 Sep 2020 16:34:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v8 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200923133427.GL3956970@smile.fi.intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-10-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200923122508.3360-10-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Wed, Sep 23, 2020 at 02:25:03PM +0200, Cezary Rojewski wrote:
> Add sysfs entries for displaying version of FW currently in use as well
> as dumping full FW information including build and log-providers hashes.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
> 
> Changes in v7:
> - fixed licence header for fs.c
> - renamed fs.c to sysfs.c to better match its purpose
> - added documentation within Documentation/ABI/testing for entries
>   exposed by catpt
> - bin_attribute fw_build replaced by attribute fw_info:
>   fw_info contains full FW information and after successful handshake,
>   it's always available (stored in driver data) so no need to invoke
>   GET_FW_VERSION IPC again, just dump the stored information
> - rather than manually creating and removing sysfs files, now makes use
>   of dev_groups member of struct device_driver 
> 
> Changes in v6:
> - functions declaration and usage now part of this patch instead of
>   being separated from it
> 
> Changes in v2:
> - fixed size provided to memcpy() in fw_build_read() as reported by Mark
> 
>  .../ABI/testing/sysfs-bus-pci-devices-catpt   | 16 ++++++
>  sound/soc/intel/catpt/core.h                  |  1 +
>  sound/soc/intel/catpt/device.c                |  1 +
>  sound/soc/intel/catpt/sysfs.c                 | 57 +++++++++++++++++++
>  4 files changed, 75 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
>  create mode 100644 sound/soc/intel/catpt/sysfs.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-devices-catpt b/Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
> new file mode 100644
> index 000000000000..8a200f4eefbd
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-devices-catpt
> @@ -0,0 +1,16 @@
> +What:		/sys/devices/pci0000:00/<dev>/fw_version
> +Date:		September 2020
> +Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
> +Description:
> +		Version of AudioDSP firmware ASoC catpt driver is
> +		communicating with.
> +		Format: %d.%d.%d.%d, type:major:minor:build.
> +
> +What:		/sys/devices/pci0000:00/<dev>/fw_info
> +Date:		September 2020
> +Contact:	Cezary Rojewski <cezary.rojewski@intel.com>
> +Description:
> +		Detailed AudioDSP firmware build information including
> +		build hash and log-providers hash. This information is
> +		obtained during initial handshake with firmware.
> +		Format: %s.
> diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
> index a29b4c0232cb..19eda125ee59 100644
> --- a/sound/soc/intel/catpt/core.h
> +++ b/sound/soc/intel/catpt/core.h
> @@ -14,6 +14,7 @@
>  #include "registers.h"

>  struct catpt_dev;
> +extern const struct attribute_group *catpt_attr_groups[];

Grouping these are not okay — they are different by meaning, just put blank
line in between.

>  void catpt_sram_init(struct resource *sram, u32 start, u32 size);
>  void catpt_sram_free(struct resource *sram);
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> index c02d46e5bc81..2d53efa656b1 100644
> --- a/sound/soc/intel/catpt/device.c
> +++ b/sound/soc/intel/catpt/device.c
> @@ -338,6 +338,7 @@ static struct platform_driver catpt_acpi_driver = {
>  		.name = "intel_catpt",
>  		.acpi_match_table = catpt_ids,
>  		.pm = &catpt_dev_pm,
> +		.dev_groups = catpt_attr_groups,
>  	},
>  };
>  module_platform_driver(catpt_acpi_driver);
> diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
> new file mode 100644
> index 000000000000..f38562071a04
> --- /dev/null
> +++ b/sound/soc/intel/catpt/sysfs.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright(c) 2020 Intel Corporation. All rights reserved.
> +//
> +// Author: Cezary Rojewski <cezary.rojewski@intel.com>
> +//
> +
> +#include <linux/pm_runtime.h>
> +#include "core.h"
> +
> +static ssize_t fw_version_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct catpt_dev *cdev = dev_get_drvdata(dev);
> +	struct catpt_fw_version version;
> +	int ret;

> +	pm_runtime_get_sync(cdev->dev);
> +
> +	ret = catpt_ipc_get_fw_version(cdev, &version);
> +
> +	pm_runtime_mark_last_busy(cdev->dev);
> +	pm_runtime_put_autosuspend(cdev->dev);

Is it subject to change at run-time?

> +	if (ret)
> +		return CATPT_IPC_ERROR(ret);
> +
> +	return sprintf(buf, "%d.%d.%d.%d\n", version.type, version.major,
> +		       version.minor, version.build);
> +}

> +

This blank line is not needed.

> +static DEVICE_ATTR_RO(fw_version);
> +
> +static ssize_t fw_info_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct catpt_dev *cdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", cdev->ipc.config.fw_info);
> +}

> +

This blank line is not needed.

> +static DEVICE_ATTR_RO(fw_info);
> +
> +static struct attribute *catpt_attrs[] = {
> +	&dev_attr_fw_version.attr,
> +	&dev_attr_fw_info.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group catpt_attr_group = {
> +	.attrs = catpt_attrs,
> +};
> +
> +const struct attribute_group *catpt_attr_groups[] = {
> +	&catpt_attr_group,
> +	NULL
> +};
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


