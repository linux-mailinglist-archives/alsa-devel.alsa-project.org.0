Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388301380D
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 09:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C32BB18B5;
	Sat,  4 May 2019 09:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C32BB18B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556953612;
	bh=9ytgY+AplLwpZpf3iNHBmkElES9r10tdPQvdH84atGs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYbLN/vrWII4SqydQT+QYJzQ6Wneb7f/c0s2hoReSofQsG4xoqFcz0KUGpsEysjGU
	 02by+ix/4BCiqtzHfmsOMrUkj1T9aCVGAXsczK3NjEu6X+6j7krep/lm3bAWEvhPXJ
	 zT5zoEFWPnduLMrjICqQu8kf76uk9rz5ecfTQlkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0AA7F8971A;
	Sat,  4 May 2019 09:05:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96471F896EA; Sat,  4 May 2019 09:05:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 898A5F8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 09:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 898A5F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PZZs1eRE"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 627EF206BB;
 Sat,  4 May 2019 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556953500;
 bh=GYMXpi3hhHh/1tqU7eEVtX31z+AYgLC6wQ6uJbd1GEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZZs1eREhw6NBIq6VuDvQDiXChEU1fAUR8k089j7LxfPzqXH7j/9P/wcidcxS7/T1
 4Zyu9CNSaglckP1Paujudy8lLQv/SaKOBQP6SqOTz2w3cmU9rAondYmwBsbfIrYY/x
 x8Ipof+Kgkk0VD3SEU/2w8xV4pR5yd+kHO677tOg=
Date: Sat, 4 May 2019 09:04:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190504070458.GG9770@kroah.com>
References: <20190504010030.29233-1-pierre-louis.bossart@linux.intel.com>
 <20190504010030.29233-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504010030.29233-8-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 7/7] soundwire: intel: add debugfs
	register dump
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

On Fri, May 03, 2019 at 08:00:30PM -0500, Pierre-Louis Bossart wrote:
> Add debugfs file to dump the Intel SoundWire registers
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
> is the use of scnprintf to avoid known issues with snprintf.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 115 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 4ac141730b13..7fb2cd6d5bb5 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -16,6 +17,7 @@
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_intel.h>
>  #include "cadence_master.h"
> +#include "bus.h"
>  #include "intel.h"
>  
>  /* Intel SHIM Registers Definition */
> @@ -98,6 +100,7 @@ struct sdw_intel {
>  	struct sdw_cdns cdns;
>  	int instance;
>  	struct sdw_intel_link_res *res;
> +	struct dentry *fs;
>  };
>  
>  #define cdns_to_intel(_cdns) container_of(_cdns, struct sdw_intel, cdns)
> @@ -161,6 +164,115 @@ static int intel_set_bit(void __iomem *base, int offset, u32 value, u32 mask)
>  	return -EAGAIN;
>  }
>  
> +/*
> + * debugfs
> + */
> +
> +#define RD_BUF (2 * PAGE_SIZE)
> +
> +static ssize_t intel_sprintf(void __iomem *mem, bool l,
> +			     char *buf, size_t pos, unsigned int reg)
> +{
> +	int value;
> +
> +	if (l)
> +		value = intel_readl(mem, reg);
> +	else
> +		value = intel_readw(mem, reg);
> +
> +	return scnprintf(buf + pos, RD_BUF - pos, "%4x\t%4x\n", reg, value);
> +}
> +
> +static ssize_t intel_reg_read(struct file *file, char __user *user_buf,
> +			      size_t count, loff_t *ppos)
> +{
> +	struct sdw_intel *sdw = file->private_data;
> +	void __iomem *s = sdw->res->shim;
> +	void __iomem *a = sdw->res->alh;
> +	char *buf;
> +	ssize_t ret;
> +	int i, j;
> +	unsigned int links, reg;
> +
> +	buf = kzalloc(RD_BUF, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	links = intel_readl(s, SDW_SHIM_LCAP) & GENMASK(2, 0);
> +
> +	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nShim\n");
> +
> +	for (i = 0; i < 4; i++) {
> +		reg = SDW_SHIM_LCAP + i * 4;
> +		ret += intel_sprintf(s, true, buf, ret, reg);
> +	}
> +
> +	for (i = 0; i < links; i++) {
> +		ret += scnprintf(buf + ret, RD_BUF - ret, "\nLink%d\n", i);
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLSCAP(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS0CM(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS1CM(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS2CM(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTLS3CM(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_PCMSCAP(i));
> +
> +		for (j = 0; j < 8; j++) {
> +			ret += intel_sprintf(s, false, buf, ret,
> +					SDW_SHIM_PCMSYCHM(i, j));
> +			ret += intel_sprintf(s, false, buf, ret,
> +					SDW_SHIM_PCMSYCHC(i, j));
> +		}
> +
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_PDMSCAP(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_IOCTL(i));
> +		ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_CTMCTL(i));
> +	}
> +
> +	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_WAKEEN);
> +	ret += intel_sprintf(s, false, buf, ret, SDW_SHIM_WAKESTS);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nALH\n");
> +	for (i = 0; i < 8; i++)
> +		ret += intel_sprintf(a, true, buf, ret, SDW_ALH_STRMZCFG(i));
> +
> +	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations intel_reg_fops = {
> +	.open = simple_open,
> +	.read = intel_reg_read,
> +	.llseek = default_llseek,
> +};
> +
> +static void intel_debugfs_init(struct sdw_intel *sdw)
> +{
> +	struct dentry *root = sdw_bus_debugfs_get_root(sdw->cdns.bus.debugfs);
> +
> +	if (!root)
> +		return;
> +
> +	sdw->fs = debugfs_create_dir("intel-sdw", root);
> +	if (IS_ERR_OR_NULL(sdw->fs)) {

Again, you do not care, do not check this.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
