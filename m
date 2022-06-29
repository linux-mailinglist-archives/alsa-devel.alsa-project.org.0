Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E75603CC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 17:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B5E165D;
	Wed, 29 Jun 2022 17:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B5E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656515137;
	bh=7eAnJIHWyOFB5EOuayi5Sk5n3trLR8ejcLuLMPW2Au0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kdWNXQUl3b6RdhAkuqqSwTAJzn38D1bByl9o1uIImcpNpMITrV+CWyrqX+uMZhIdP
	 MuY8H7NTOwP5w34fjA/K10zoE2i1ST6LgibkMSHHqghGX8YZBjecQ0jND+YipMB3vm
	 lXE/tP3B+SsqWT12+c50b0//JCLMjBRF4RbidGXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA6BF80245;
	Wed, 29 Jun 2022 17:04:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 405E2F8020D; Wed, 29 Jun 2022 17:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A93C8F80107
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 17:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A93C8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dv7LYsMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656515074; x=1688051074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7eAnJIHWyOFB5EOuayi5Sk5n3trLR8ejcLuLMPW2Au0=;
 b=dv7LYsMZSG06OqII4vwgopccfl4B8dduYbmmbBEYo6SfbAQvXUVWcJO/
 8uR4X+Z6bCK2ELN7J2+Ltm0iDL7ED7p1dh/Ve3skniVLleN3UOQHbB9Fr
 7xfbkqKbePNUDsAAQIYjR5Cex0Md7eJtQQmDbDz0o/cqr2z+njEjzQed8
 tbsP7Zn/cDZDOZsTzNrtwNW2c7Ry7sCzR6P5UG0MGpHZ0w16r41ugHTRY
 EncBUJmT/Pk729IHS5J77aUsRj5jCIDtDDquV/6TqOGR2iGl4Xfc8bY7P
 401g/kEW5YBpj6CynI/A5a2N4wbWDGBvvLz24zwQ/UEvYxrw2kvOKGGa3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="283147360"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="283147360"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 08:04:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="917633192"
Received: from jwacker-mobl.amr.corp.intel.com (HELO [10.213.178.109])
 ([10.213.178.109])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 08:04:29 -0700
Message-ID: <352fac7e-597c-84af-d33b-bdff0e2acdb6@linux.intel.com>
Date: Wed, 29 Jun 2022 10:03:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] ASoC: codecs: add wsa883x amplifier support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
 <20220629090644.67982-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220629090644.67982-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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


> +/* 4 ports */
> +static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
> +	{
> +		/* DAC */
> +		.num = 1,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 1,
> +		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
> +	}, {

nit-pick: it's unusual to see such opening brackets for structure
initialization, usually there are on a new line.

> +		/* COMP */
> +		.num = 2,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 1,
> +		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
> +	}, {
> +		/* BOOST */
> +		.num = 3,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 1,
> +		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
> +	}, {
> +		/* VISENSE */
> +		.num = 4,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 1,
> +		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
> +	}
> +};

> +static int wsa883x_update_status(struct sdw_slave *slave,
> +				 enum sdw_slave_status status)
> +{
> +	struct wsa883x_priv *wsa883x = dev_get_drvdata(&slave->dev);
> +
> +	if (status == SDW_SLAVE_ATTACHED && slave->dev_num > 0)

do you actually need to test if slave->dev_num is > 0?

if I look at drivers/soundwire/bus.c, update_status cannot really be
invoked with dev_num == 0.

> +		wsa883x_init(wsa883x);
> +
> +	return 0;
> +}
> +

> +static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct regmap *regmap = dev_get_regmap(dev, NULL);
> +	struct wsa883x_priv *wsa883x = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regulator_enable(wsa883x->vdd);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable vdd regulator (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_direction_output(wsa883x->sd_n, 1);
> +
> +	wait_for_completion_timeout(&slave->initialization_complete,
> +				    msecs_to_jiffies(WSA883X_PROBE_TIMEOUT));

check for success? You don't want to enable regmap sync below if the
device never successfully attached and initialized.

> +
> +	usleep_range(20000, 20010);
> +	regcache_cache_only(regmap, false);
> +	regcache_sync(regmap);
> +
> +	return 0;
> +}

