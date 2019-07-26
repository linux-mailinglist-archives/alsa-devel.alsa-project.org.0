Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BA76B2E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 16:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66270206C;
	Fri, 26 Jul 2019 16:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66270206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564150276;
	bh=o88/8lFfojegFy4NGa2HFK97GiJNh7CAw72CsXE5jHo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NypUuEIWUrK8y0yj0WwDOzzqBZKCFp4jxoYa0J0XzJUQRWS8gtYNOdU1FxZlSCGL8
	 5RD/JNXBLIdOgEiltW4k+7HraYODcE8jn7gp9FTlMwKll1Pvjbmj5DMiAJveQNl6lP
	 +v8oO8wFVWMNNYlK/j4dmhFwtmk7OShhlNm+H6r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8216F80368;
	Fri, 26 Jul 2019 16:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BBE9F80393; Fri, 26 Jul 2019 16:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6ACAF800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 16:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6ACAF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pTDmpDVZ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 334BC21850;
 Fri, 26 Jul 2019 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564150165;
 bh=0+3MSmx+qJhUrDrjQL6BneIaHl/nbDAanbN39/Pki5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTDmpDVZkpnP1M/pyDjd5YbEUz82p1pljhgmYCuRRg0pXN6eqBfxmtJ5D//H/a3vm
 /toBXPT3R52QT00OmObrGaywEZ2Sf3jkQ3lKaHT+tg/ipbzm7rT+SL939qss4PgGhO
 MkIrvgu7uG9rqR1DZA2GjDhW5QOJCsUD5lOZSOfQ=
Date: Fri, 26 Jul 2019 16:09:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190726140922.GD8767@kroah.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-3-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 02/40] soundwire: cadence_master: add
 debugfs register dump
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

On Thu, Jul 25, 2019 at 06:39:54PM -0500, Pierre-Louis Bossart wrote:
> Add debugfs file to dump the Cadence master registers
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. The main change
> is the use of scnprintf to avoid known issues with snprintf.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 98 ++++++++++++++++++++++++++++++
>  drivers/soundwire/cadence_master.h |  2 +
>  2 files changed, 100 insertions(+)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index ff4badc9b3de..91e8bacb83e3 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -8,6 +8,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -223,6 +224,103 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
>  	return -EAGAIN;
>  }
>  
> +/*
> + * debugfs
> + */
> +
> +#define RD_BUF (2 * PAGE_SIZE)
> +
> +static ssize_t cdns_sprintf(struct sdw_cdns *cdns,
> +			    char *buf, size_t pos, unsigned int reg)
> +{
> +	return scnprintf(buf + pos, RD_BUF - pos,
> +			 "%4x\t%4x\n", reg, cdns_readl(cdns, reg));
> +}
> +
> +static ssize_t cdns_reg_read(struct file *file, char __user *user_buf,
> +			     size_t count, loff_t *ppos)
> +{
> +	struct sdw_cdns *cdns = file->private_data;
> +	char *buf;
> +	ssize_t ret;
> +	int i, j;
> +
> +	buf = kzalloc(RD_BUF, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
> +	ret += scnprintf(buf + ret, RD_BUF - ret, "\nMCP Registers\n");
> +	for (i = 0; i < 8; i++) /* 8 MCP registers */
> +		ret += cdns_sprintf(cdns, buf, ret, i * 4);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret,
> +			 "\nStatus & Intr Registers\n");
> +	for (i = 0; i < 13; i++) /* 13 Status & Intr registers */
> +		ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_STAT + i * 4);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret,
> +			 "\nSSP & Clk ctrl Registers\n");
> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_SSP_CTRL0);
> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_SSP_CTRL1);
> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_CLK_CTRL0);
> +	ret += cdns_sprintf(cdns, buf, ret, CDNS_MCP_CLK_CTRL1);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret,
> +			 "\nDPn B0 Registers\n");
> +	for (i = 0; i < 7; i++) {
> +		ret += scnprintf(buf + ret, RD_BUF - ret,
> +				 "\nDP-%d\n", i);
> +		for (j = 0; j < 6; j++)
> +			ret += cdns_sprintf(cdns, buf, ret,
> +					CDNS_DPN_B0_CONFIG(i) + j * 4);
> +	}
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret,
> +			 "\nDPn B1 Registers\n");
> +	for (i = 0; i < 7; i++) {
> +		ret += scnprintf(buf + ret, RD_BUF - ret,
> +				 "\nDP-%d\n", i);
> +
> +		for (j = 0; j < 6; j++)
> +			ret += cdns_sprintf(cdns, buf, ret,
> +					CDNS_DPN_B1_CONFIG(i) + j * 4);
> +	}
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret,
> +			 "\nDPn Control Registers\n");
> +	for (i = 0; i < 7; i++)
> +		ret += cdns_sprintf(cdns, buf, ret,
> +				CDNS_PORTCTRL + i * CDNS_PORT_OFFSET);
> +
> +	ret += scnprintf(buf + ret, RD_BUF - ret,
> +			 "\nPDIn Config Registers\n");
> +	for (i = 0; i < 7; i++)
> +		ret += cdns_sprintf(cdns, buf, ret, CDNS_PDI_CONFIG(i));
> +
> +	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
> +	kfree(buf);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations cdns_reg_fops = {
> +	.open = simple_open,
> +	.read = cdns_reg_read,
> +	.llseek = default_llseek,
> +};

DEFINE_SHOW_ATTRIBUTE()?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
