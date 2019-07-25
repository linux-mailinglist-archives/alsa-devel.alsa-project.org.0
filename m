Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55F75F40
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 08:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CF9F1FC4;
	Fri, 26 Jul 2019 08:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CF9F1FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564123724;
	bh=z9j5ZK0V0RahrXoo8CMQBXJFs74U/VheAJ7O6FSFg9c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+5jSURWDuUfra7hN9Cvilj1zoj/8qXTZSqLHJ68t/akHr4Iro1SmDkXK6+wBsH86
	 3HZzRdac8yCDtBVVFahM+baD133DI5hJsKwJTz7RJwcDOOhZNn2fPJPWPnUJGf6xBn
	 EPL5nJdfk9Sj7TG6k2GYYiuF/Ffs1HGnlK6P1+Qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98FA3F803D5;
	Fri, 26 Jul 2019 08:46:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E48CEF80393; Fri, 26 Jul 2019 08:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DATE_IN_PAST_06_12,
 PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121EDF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 08:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121EDF801A4
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 23:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="369956988"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.35.244])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 23:46:49 -0700
Date: Fri, 26 Jul 2019 00:15:55 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190725221554.GA16003@ubuntu>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 01/40] soundwire: add debugfs support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre,

A couple of nitpicks:

On Thu, Jul 25, 2019 at 06:39:53PM -0500, Pierre-Louis Bossart wrote:
> Add base debugfs mechanism for SoundWire bus by creating soundwire
> root and master-N and slave-x hierarchy.
> 
> Also add SDW Slave SCP, DP0 and DP-N register debug file.
> 
> Registers not implemented will print as "XX"
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
> is the use of scnprintf to avoid known issues with snprintf.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile    |   4 +-
>  drivers/soundwire/bus.c       |   6 ++
>  drivers/soundwire/bus.h       |  24 ++++++
>  drivers/soundwire/bus_type.c  |   3 +
>  drivers/soundwire/debugfs.c   | 156 ++++++++++++++++++++++++++++++++++
>  drivers/soundwire/slave.c     |   1 +
>  include/linux/soundwire/sdw.h |   4 +
>  7 files changed, 197 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soundwire/debugfs.c

[snip]

> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 3048ca153f22..06ac4adb0074 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -18,6 +18,30 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  void sdw_extract_slave_id(struct sdw_bus *bus,
>  			  u64 addr, struct sdw_slave_id *id);
>  
> +#ifdef CONFIG_DEBUG_FS
> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus);
> +void sdw_bus_debugfs_exit(struct dentry *d);
> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave);
> +void sdw_slave_debugfs_exit(struct dentry *d);
> +void sdw_debugfs_init(void);
> +void sdw_debugfs_exit(void);
> +#else
> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
> +{ return NULL; }

static?

> +
> +void sdw_bus_debugfs_exit(struct dentry *d) {}
> +
> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave)
> +{ return NULL; }
> +
> +void sdw_slave_debugfs_exit(struct dentry *d) {}
> +
> +void sdw_debugfs_init(void) {}
> +
> +void sdw_debugfs_exit(void) {}

Same for all the above. You could also declare them inline, but I really hope
the compiler will be smart enough to do that itself.

> +
> +#endif
> +
>  enum {
>  	SDW_MSG_FLAG_READ = 0,
>  	SDW_MSG_FLAG_WRITE,
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 2655602f0cfb..4a465f55039f 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -6,6 +6,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include "bus.h"
>  
>  /**
>   * sdw_get_device_id - find the matching SoundWire device id
> @@ -177,11 +178,13 @@ EXPORT_SYMBOL_GPL(sdw_unregister_driver);
>  
>  static int __init sdw_bus_init(void)
>  {
> +	sdw_debugfs_init();
>  	return bus_register(&sdw_bus_type);
>  }
>  
>  static void __exit sdw_bus_exit(void)
>  {
> +	sdw_debugfs_exit();
>  	bus_unregister(&sdw_bus_type);
>  }
>  
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> new file mode 100644
> index 000000000000..8d86e100516e
> --- /dev/null
> +++ b/drivers/soundwire/debugfs.c
> @@ -0,0 +1,156 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +// Copyright(c) 2017-19 Intel Corporation.
> +
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/slab.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include "bus.h"
> +
> +#ifdef CONFIG_DEBUG_FS
> +struct dentry *sdw_debugfs_root;
> +#endif
> +
> +struct dentry *sdw_bus_debugfs_init(struct sdw_bus *bus)
> +{
> +	struct dentry *d;

I would remove the above

> +	char name[16];
> +
> +	if (!sdw_debugfs_root)
> +		return NULL;
> +
> +	/* create the debugfs master-N */
> +	snprintf(name, sizeof(name), "master-%d", bus->link_id);
> +	d = debugfs_create_dir(name, sdw_debugfs_root);
> +
> +	return d;

And just do

+	return debugfs_create_dir(name, sdw_debugfs_root);

> +}
> +
> +void sdw_bus_debugfs_exit(struct dentry *d)
> +{
> +	debugfs_remove_recursive(d);
> +}
> +
> +#define RD_BUF (3 * PAGE_SIZE)
> +
> +static ssize_t sdw_sprintf(struct sdw_slave *slave,
> +			   char *buf, size_t pos, unsigned int reg)
> +{
> +	int value;
> +
> +	value = sdw_read(slave, reg);

I personally would join the two lines above, but that's just a personal
preference.

> +
> +	if (value < 0)
> +		return scnprintf(buf + pos, RD_BUF - pos, "%3x\tXX\n", reg);
> +	else

I think it's advised to not use an else in such cases.

Thanks
Guennadi

> +		return scnprintf(buf + pos, RD_BUF - pos,
> +				"%3x\t%2x\n", reg, value);
> +}
> +
> +static ssize_t sdw_slave_reg_read(struct file *file, char __user *user_buf,
> +				  size_t count, loff_t *ppos)
> +{
> +	struct sdw_slave *slave = file->private_data;
> +	unsigned int reg;
> +	char *buf;
> +	ssize_t ret;
> +	int i, j;
> +
> +	buf = kzalloc(RD_BUF, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP0\n");
> +
> +	for (i = 0; i < 6; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
> +	ret += sdw_sprintf(slave, buf, ret, SDW_DP0_CHANNELEN);
> +	for (i = SDW_DP0_SAMPLECTRL1; i <= SDW_DP0_LANECTRL; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
> +	ret += sdw_sprintf(slave, buf, ret,
> +			SDW_DP0_CHANNELEN + SDW_BANK1_OFFSET);
> +	for (i = SDW_DP0_SAMPLECTRL1 + SDW_BANK1_OFFSET;
> +			i <= SDW_DP0_LANECTRL + SDW_BANK1_OFFSET; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nSCP\n");
> +	for (i = SDW_SCP_INT1; i <= SDW_SCP_BANKDELAY; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +	for (i = SDW_SCP_DEVID_0; i <= SDW_SCP_DEVID_5; i++)
> +		ret += sdw_sprintf(slave, buf, ret, i);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_FRAMECTRL_B0);
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_NEXTFRAME_B0);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_FRAMECTRL_B1);
> +	ret += sdw_sprintf(slave, buf, ret, SDW_SCP_NEXTFRAME_B1);
> +
> +	for (i = 1; i < 14; i++) {
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP%d\n", i);
> +		reg = SDW_DPN_INT(i);
> +		for (j = 0; j < 6; j++)
> +			ret += sdw_sprintf(slave, buf, ret, reg + j);
> +
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
> +		reg = SDW_DPN_CHANNELEN_B0(i);
> +		for (j = 0; j < 9; j++)
> +			ret += sdw_sprintf(slave, buf, ret, reg + j);
> +
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
> +		reg = SDW_DPN_CHANNELEN_B1(i);
> +		for (j = 0; j < 9; j++)
> +			ret += sdw_sprintf(slave, buf, ret, reg + j);
> +	}
> +
> +	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations sdw_slave_reg_fops = {
> +	.open = simple_open,
> +	.read = sdw_slave_reg_read,
> +	.llseek = default_llseek,
> +};
> +
> +struct dentry *sdw_slave_debugfs_init(struct sdw_slave *slave)
> +{
> +	struct dentry *master;
> +	struct dentry *d;
> +	char name[32];
> +
> +	master = slave->bus->debugfs;
> +
> +	/* create the debugfs slave-name */
> +	snprintf(name, sizeof(name), "%s", dev_name(&slave->dev));
> +	d = debugfs_create_dir(name, master);
> +
> +	debugfs_create_file("registers", 0400, d, slave, &sdw_slave_reg_fops);
> +
> +	return d;
> +}
> +
> +void sdw_slave_debugfs_exit(struct dentry *d)
> +{
> +	debugfs_remove_recursive(d);
> +}
> +
> +void sdw_debugfs_init(void)
> +{
> +	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
> +}
> +
> +void sdw_debugfs_exit(void)
> +{
> +	debugfs_remove_recursive(sdw_debugfs_root);
> +}
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index f39a5815e25d..34d8bb995f45 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -56,6 +56,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
>  		mutex_unlock(&bus->bus_lock);
>  		put_device(&slave->dev);
>  	}
> +	slave->debugfs = sdw_slave_debugfs_init(slave);
>  
>  	return ret;
>  }
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 3b231472464a..a49028e9d666 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -544,6 +544,7 @@ struct sdw_slave_ops {
>   * @bus: Bus handle
>   * @ops: Slave callback ops
>   * @prop: Slave properties
> + * @debugfs: Slave debugfs
>   * @node: node for bus list
>   * @port_ready: Port ready completion flag for each Slave port
>   * @dev_num: Device Number assigned by Bus
> @@ -555,6 +556,7 @@ struct sdw_slave {
>  	struct sdw_bus *bus;
>  	const struct sdw_slave_ops *ops;
>  	struct sdw_slave_prop prop;
> +	struct dentry *debugfs;
>  	struct list_head node;
>  	struct completion *port_ready;
>  	u16 dev_num;
> @@ -731,6 +733,7 @@ struct sdw_master_ops {
>   * @m_rt_list: List of Master instance of all stream(s) running on Bus. This
>   * is used to compute and program bus bandwidth, clock, frame shape,
>   * transport and port parameters
> + * @debugfs: Bus debugfs
>   * @defer_msg: Defer message
>   * @clk_stop_timeout: Clock stop timeout computed
>   * @bank_switch_timeout: Bank switch timeout computed
> @@ -750,6 +753,7 @@ struct sdw_bus {
>  	struct sdw_bus_params params;
>  	struct sdw_master_prop prop;
>  	struct list_head m_rt_list;
> +	struct dentry *debugfs;
>  	struct sdw_defer defer_msg;
>  	unsigned int clk_stop_timeout;
>  	u32 bank_switch_timeout;
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
