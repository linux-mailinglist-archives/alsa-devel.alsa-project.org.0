Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABE2529BB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 11:07:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB9DF172F;
	Wed, 26 Aug 2020 11:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB9DF172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598432854;
	bh=1KswoGLjtZcHXEOSpuV+YAc4MBEe5uZDB0qGI9+fjOc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4mGjkT68R6weiLX2FSt4qoyiZKVmf7daw3h6oMWRnXqfhd0qd0rzK9oBUWkL/xbf
	 iB0a1M3JwCBDvdb7y3mJd8E/osj1cAaP6ojuQh/bj4af2/zYTXBqBZDeT911uTAKMz
	 xHrp+I9i8/cFG4ABbC6qo+R7JQLNtkbPwQ1w0/IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A652F80143;
	Wed, 26 Aug 2020 11:05:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F46F801D9; Wed, 26 Aug 2020 11:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62E0BF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 11:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62E0BF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Oxj0+njY"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8138206FA;
 Wed, 26 Aug 2020 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598432746;
 bh=1KswoGLjtZcHXEOSpuV+YAc4MBEe5uZDB0qGI9+fjOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oxj0+njYe0KqxWh4WsNLSOGdytSHM4NHyUWsDwu9+fW99RphWTOjqE9pn3ma0pEJ8
 fmUNVwx2/Z4/h8MjBLPQ9glHLmsS3JW9pUnGoLo5yqiNbYQhR3+pwZS30X1I3+Fqv9
 fxn+9rZWEyVDBWXaYgtDbDMsU1goNvTeHLJsxb0o=
Date: Wed, 26 Aug 2020 14:35:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
Message-ID: <20200826090542.GZ2639@vkoul-mobl>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 25-08-20, 12:16, Pierre-Louis Bossart wrote:
> The SoundWire 1.1 specification only allowed for reads and writes of
> bytes. The SoundWire 1.2 specification adds a new capability to
> transfer "Multi-Byte Quantities" (MBQ) across the bus. The transfers
> still happens one-byte-at-a-time, but the update is atomic.
> 
> For example when writing a 16-bit volume, the first byte transferred
> is only taken into account when the second byte is successfully
> transferred.
> 
> The mechanism is symmetrical for read and writes:
> - On a read, the address of the last byte to be read is modified by
> setting the MBQ bit
> - On a write, the address of all but the last byte to be written are
> modified by setting the MBQ bit. The address for the last byte relies
> on the MBQ bit being cleared.
> 
> The current definitions for MBQ-based controls in the SDCA draft
> standard are limited to 16 bits for volumes, so for now this is the
> only supported format. An update will be provided if and when support
> for 24-bit and 32-bit values is specified by the SDCA standard.
> 
> One possible objection is that this code could have been handled with
> regmap-sdw.c. However this is a new spec addition not handled by every
> SoundWire 1.1 and non-SDCA device, so there's no reason to load code
> that will never be used.
> 
> Also in practice it's extremely unlikely that CONFIG_REGMAP would not
> be selected with CONFIG_REGMAP_MBQ selected. However there's no
> functional dependency between the two modules so they can be selected
> separately.

Is there a reason for a new module for mbq writes, cant we do this as
part of sdw module? Driver can invoke either regmap_init_sdw() or
regmap_init_sdw_mbq()?

> +++ b/drivers/base/regmap/regmap-sdw-mbq.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright(c) 2020 Intel Corporation.
> +
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/mod_devicetable.h>

Curious why do you need this header?

> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include "internal.h"
> +
> +static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct device *dev = context;
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	int ret;
> +
> +	ret = sdw_write(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sdw_write(slave, reg, val & 0xff);
> +}
> +
> +static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct device *dev = context;
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	int read0;
> +	int read1;
> +
> +	read0 = sdw_read(slave, reg);
> +	if (read0 < 0)
> +		return read0;
> +
> +	read1 = sdw_read(slave, SDW_SDCA_MBQ_CTL(reg));
> +	if (read1 < 0)
> +		return read1;
> +
> +	*val = (read1 << 8) | read0;
> +
> +	return 0;
> +}
> +
> +static struct regmap_bus regmap_sdw_mbq = {
> +	.reg_read = regmap_sdw_mbq_read,
> +	.reg_write = regmap_sdw_mbq_write,
> +	.reg_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static int regmap_sdw_mbq_config_check(const struct regmap_config *config)
> +{
> +	/* MBQ-based controls are only 16-bits for now */
> +	if (config->val_bits != 16)
> +		return -EOPNOTSUPP;
> +
> +	/* Registers are 32 bits wide */
> +	if (config->reg_bits != 32)
> +		return -EOPNOTSUPP;
> +
> +	if (config->pad_bits != 0)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +struct regmap *__regmap_init_sdw_mbq(struct sdw_slave *sdw,
> +				     const struct regmap_config *config,
> +				     struct lock_class_key *lock_key,
> +				     const char *lock_name)
> +{
> +	int ret;
> +
> +	ret = regmap_sdw_mbq_config_check(config);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return __regmap_init(&sdw->dev, &regmap_sdw_mbq,
> +			&sdw->dev, config, lock_key, lock_name);
> +}
> +EXPORT_SYMBOL_GPL(__regmap_init_sdw_mbq);
> +
> +struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
> +					  const struct regmap_config *config,
> +					  struct lock_class_key *lock_key,
> +					  const char *lock_name)
> +{
> +	int ret;
> +
> +	ret = regmap_sdw_mbq_config_check(config);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return __devm_regmap_init(&sdw->dev, &regmap_sdw_mbq,
> +			&sdw->dev, config, lock_key, lock_name);
> +}
> +EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
> +
> +MODULE_DESCRIPTION("Regmap SoundWire Module");

This is same of sdw module, pls make this one a bit different.
-- 
~Vinod
