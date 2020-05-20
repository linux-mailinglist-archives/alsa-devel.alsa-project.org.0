Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306301DB27F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 13:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB58317E3;
	Wed, 20 May 2020 13:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB58317E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589975938;
	bh=iykMISmEA3B2cWlO05h0kvztgbh5MJtjGLS9pgY5hRs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4u2zb7suvLS4LXo6lrEwX+hrj3RuTWgNQJMeqq/cxaJhkV9qNbgGej77sVfU7AwY
	 +R5YiND7ryoJjeTyVVCUiwVjiiY6DUTPjYzQBtgB2TPjPBhDWAGqCPp/Kny5RcDM7I
	 7p/rLarcn8M5VCgT/E2yHQCzd29p+WggUMjgVbe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5544F80213;
	Wed, 20 May 2020 13:57:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9847F801F9; Wed, 20 May 2020 13:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 322D3F80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 13:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 322D3F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="alR7aWRz"
Received: from localhost (unknown [122.178.227.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5CE1206BE;
 Wed, 20 May 2020 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589975830;
 bh=iykMISmEA3B2cWlO05h0kvztgbh5MJtjGLS9pgY5hRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=alR7aWRzrS+FUgCnAxm/sAtv2qosqZMo77Ks9sqnj8L+o+zNCJoLgsuxpeH7mvBuq
 HMHacczQmUyiUYrF6//cLN8VHogYz2F87uT78h/dpMQc5pfJ0EqymqYF9T0LKUQIEQ
 EJH1lp05zfFm/aJ26v144OcgYqsGwmzqSOENwLtU=
Date: Wed, 20 May 2020 17:27:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 3/3] soundwire: add Slave sysfs support
Message-ID: <20200520115705.GV374218@vkoul-mobl.Dlink>
References: <20200518203551.2053-1-yung-chuan.liao@linux.intel.com>
 <20200518203551.2053-4-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518203551.2053-4-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 19-05-20, 04:35, Bard Liao wrote:

> +int sdw_slave_sysfs_init(struct sdw_slave *slave)
> +{
> +	int ret;
> +
> +	ret = devm_device_add_groups(&slave->dev, slave_groups);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_device_add_group(&slave->dev, &sdw_slave_dev_attr_group);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (slave->prop.dp0_prop) {
> +		ret = devm_device_add_group(&slave->dev, &dp0_group);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	if (slave->prop.source_ports || slave->prop.sink_ports) {
> +		ret = sdw_slave_sysfs_dpn_init(slave);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +

We have trailing line here

> +static int add_all_attributes(struct device *dev, int N, int dir)
> +{
> +	struct attribute **dpn_attrs;
> +	struct attribute_group *dpn_group;
> +	int i = 0;
> +	int ret;
> +
> +	/* allocate attributes, last one is NULL */
> +	dpn_attrs = devm_kcalloc(dev, SDW_DPN_ATTRIBUTES + 1,
> +				 sizeof(struct attribute *),
> +				 GFP_KERNEL);
> +	if (!dpn_attrs)
> +		return -ENOMEM;
> +
> +	ret = max_word_attribute_alloc(dev, &dpn_attrs[i++],
> +				       N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = min_word_attribute_alloc(dev, &dpn_attrs[i++],
> +				       N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = words_attribute_alloc(dev, &dpn_attrs[i++],
> +				    N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = type_attribute_alloc(dev, &dpn_attrs[i++],
> +				   N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = max_grouping_attribute_alloc(dev, &dpn_attrs[i++],
> +					   N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = simple_ch_prep_sm_attribute_alloc(dev, &dpn_attrs[i++],
> +						N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ch_prep_timeout_attribute_alloc(dev, &dpn_attrs[i++],
> +					      N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = imp_def_interrupts_attribute_alloc(dev, &dpn_attrs[i++],
> +						 N, dir, "0x%x\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = min_ch_attribute_alloc(dev, &dpn_attrs[i++],
> +				     N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = max_ch_attribute_alloc(dev, &dpn_attrs[i++],
> +				     N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = channels_attribute_alloc(dev, &dpn_attrs[i++],
> +				       N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ch_combinations_attribute_alloc(dev, &dpn_attrs[i++],
> +					      N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = max_async_buffer_attribute_alloc(dev, &dpn_attrs[i++],
> +					       N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = block_pack_mode_attribute_alloc(dev, &dpn_attrs[i++],
> +					      N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = port_encoding_attribute_alloc(dev, &dpn_attrs[i++],
> +					    N, dir, "%d\n");
> +	if (ret < 0)
> +		return ret;
> +
> +	/* paranioa check for editing mistakes */

s/paranioa/paranoia

I found only these two nitpicks so I will go ahead and apply these and
fix them up.

-- 
~Vinod
