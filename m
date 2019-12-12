Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD411D1FF
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 17:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7440516FC;
	Thu, 12 Dec 2019 17:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7440516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576167189;
	bh=fITvMC7ja8o9s24sJKTC5z+mNlB6B4wdiC8TuU4qk/A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cgHkCFgzaoU4K2Ddvs2NZzhdCvxajfPkvKoAQFnNVh5n4hEXBN4jvF4IlL61YJb5g
	 3mMgdli3TUgvdf0ko01i7p+mUfFZLlwUqm1v9qkJ8U+4HQ4UVq3USsieH399WlDTLV
	 du0uQI6nzUm71phLtasjPSRHw3wRXEjZNsTYpdiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39675F801D8;
	Thu, 12 Dec 2019 17:11:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6CB2F8020C; Thu, 12 Dec 2019 17:11:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D594CF80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 17:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D594CF80139
Received: from [109.168.11.45] (port=43476 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <luca@lucaceresoli.net>)
 id 1ifR3e-007CSs-Hw; Thu, 12 Dec 2019 17:11:18 +0100
To: Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-9-daniel@zonque.org>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
Date: Thu, 12 Dec 2019 17:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-9-daniel@zonque.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 07/10] i2c: Add driver for AD242x bus
	controller
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

Hi Daniel,

On 09/12/19 19:35, Daniel Mack wrote:
> This device must be instantiated as a sub-device of the AD242x MFD
> device.
> 
> In order to access remote I2C peripherals, the master node is configured
> to the slave node number and the remote I2C client address on the remote
> side, and then the payload is sent to the BUS client of the master node,
> which transparently proxies the traffic through.

This remote I2C feature in these chips is interesting. It looks somewhat
similar to remote I2C in the video serdes chip by TI and Maxim, but it's
different from both of them. So now we have 3 vendors implementing the
same feature in 3 different ways.

Cool.

> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  drivers/i2c/busses/Kconfig      |  10 ++
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-ad242x.c | 178 ++++++++++++++++++++++++++++++++
>  3 files changed, 189 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ad242x.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6a0aa76859f3..b9cf049bedb0 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -365,6 +365,16 @@ config I2C_POWERMAC
>  
>  comment "I2C system bus drivers (mostly embedded / system-on-chip)"
>  
> +config I2C_AD242X
> +	tristate "Analog Devices AD242x"
> +	depends on MFD_AD242X
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C bus controller function of AD242x slave nodes.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-ad242x.
> +
>  config I2C_ALTERA
>  	tristate "Altera Soft IP I2C"
>  	depends on (ARCH_SOCFPGA || NIOS2) && OF
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3ab8aebc39c9..57c31ea8a477 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
>  obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
>  
>  # Embedded system I2C/SMBus host controller drivers
> +obj-$(CONFIG_I2C_AD242X)	+= i2c-ad242x.o
>  obj-$(CONFIG_I2C_ALTERA)	+= i2c-altera.o
>  obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
>  obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
> diff --git a/drivers/i2c/busses/i2c-ad242x.c b/drivers/i2c/busses/i2c-ad242x.c
> new file mode 100644
> index 000000000000..b94056653898
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ad242x.c
> @@ -0,0 +1,178 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mfd/ad242x.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +struct ad242x_i2c {
> +	struct device		*dev;
> +	struct ad242x_node	*node;
> +	struct i2c_adapter	adap;
> +	u32			node_index;
> +};
> +
> +static int ad242x_set_addr(struct ad242x_node *mnode,
> +			   struct ad242x_i2c_bus *bus,
> +			   uint8_t node_id, uint8_t addr)
> +{
> +	int ret;
> +	uint8_t buf[2] = { AD242X_CHIP, addr };
> +
> +	ret = regmap_update_bits(mnode->regmap, AD242X_NODEADR,
> +				 AD242X_NODEADR_PERI | AD242X_NODEADR_MASK,
> +				 node_id);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We can't use the slave's regmap here as it holds the same
> +	 * lock we also need to guard this context.
> +	 */
> +	ret = i2c_transfer_buffer_flags(bus->client,
> +					buf, sizeof(buf), 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_update_bits(mnode->regmap, AD242X_NODEADR,
> +				  AD242X_NODEADR_PERI, AD242X_NODEADR_PERI);
> +}
> +
> +static int ad242x_i2c_xfer(struct i2c_adapter *adap,
> +			   struct i2c_msg msgs[], int num)
> +{
> +	struct ad242x_i2c *i2c = adap->algo_data;
> +	struct ad242x_i2c_bus *bus = ad242x_master_get_bus(i2c->node->master);
> +	struct ad242x_node *mnode = ad242x_master_get_node(i2c->node->master);
> +	int ret, i, current_addr = -1;
> +
> +	mutex_lock(&bus->mutex);
> +
> +	for (i = 0; i < num; i++) {
> +		struct i2c_msg *msg = msgs + i;
> +
> +		if (msg->addr != current_addr) {
> +			ret = ad242x_set_addr(mnode, bus,
> +					      i2c->node->id, msg->addr);
> +			if (ret < 0) {
> +				dev_err(i2c->node->dev,
> +					"Cannot set address: %d\n", ret);
> +				break;
> +			}
> +
> +			current_addr = msg->addr;
> +		}
> +
> +		ret = i2c_transfer_buffer_flags(bus->client,
> +						msg->buf, msg->len, msg->flags);
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	mutex_unlock(&bus->mutex);
> +
> +	return ret < 0 ? ret : num;
> +}

Your implementation here looks quite clean and simple, and simple is
good, but I think there's a problem in this function. A "normal"
master_xfer function issues a repeated start between one msg and the
next one, at least in the typical case where all msgs have the same
slave address. Your implementation breaks repeated start. At first sight
we might need more complex code here to coalesce all consecutive msgs
with the same address into a single i2c_transfer() call.

-- 
Luca
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
