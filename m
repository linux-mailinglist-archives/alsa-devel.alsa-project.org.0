Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB312360D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 20:55:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA85F950;
	Tue, 17 Dec 2019 20:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA85F950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576612556;
	bh=AFcKv4JmOXR9bFNlx73zaHfKMQj/gwhBr4co8pI2DqA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzl6HIgrh364GLUCsoRlykq5Rh/TLfcyDg3Zcw8HbwIfiALjNwYfCqNjev5NrNn2Y
	 6yfH2MUSAdlni4MmCyf9L468MXlJvcC6/1k1Ani3siPtJ17Wk1vtxq716rhXAG2YIr
	 NSnnWzUIgH5lxqP1bj1O/N3NLo0HH0qjPWuIcNds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E057F80256;
	Tue, 17 Dec 2019 20:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A304AF80088; Tue, 17 Dec 2019 20:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58FDDF80088
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 20:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58FDDF80088
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 11:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="389942445"
Received: from vramados-mobl.amr.corp.intel.com (HELO [10.254.1.250])
 ([10.254.1.250])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 11:53:59 -0800
To: Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c3885b01-e6ec-1b67-6e48-69e3fc40bb62@linux.intel.com>
Date: Tue, 17 Dec 2019 13:16:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-8-daniel@zonque.org>
Content-Language: en-US
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
 transceivers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +config MFD_AD242X
> +	bool "Analog Devices AD242x A2B support"
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	depends on I2C=y && OF

is there a specific reason why I2C needs to be built-in (as opposed to 'm')?

> +/* See Table 3-2 in the datasheet */

is the datasheet public? I thought it was only available under NDA.

> +	master->sync_clk = devm_clk_get(dev, "sync");
> +	if (IS_ERR(master->sync_clk)) {
> +		ret = PTR_ERR(master->sync_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get sync clk: %d\n", ret);
> +
> +		return ret;
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "clock-frequency",
> +				 &master->sync_clk_rate)) {
> +		ret = clk_set_rate(master->sync_clk, master->sync_clk_rate);

shouldn't you check the rate before setting it?

> +		if (ret < 0) {
> +			dev_err(dev, "Cannot set sync clock rate: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	master->sync_clk_rate = clk_get_rate(master->sync_clk);
> +	if (master->sync_clk_rate != 44100 && master->sync_clk_rate != 48000) {
> +		dev_err(dev, "SYNC clock rate %d is invalid\n",
> +			master->sync_clk_rate);
> +		return -EINVAL;
> +	}

this is a bit odd, you set the rate in case there is a property but get 
it anyways. the last block could be an else?

> +
> +	ret = clk_prepare_enable(master->sync_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable sync clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Master node setup */
> +
> +	ret = regmap_write(regmap, AD242X_CONTROL,
> +			   AD242X_CONTROL_MSTR | AD242X_CONTROL_SOFTRST);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ad242x_wait_for_irq(master, &master->run_completion, 10);

what is 10?


> +static int ad242x_master_remove(struct i2c_client *i2c)
> +{
> +	struct ad242x_master *master = i2c_get_clientdata(i2c);
> +
> +	if (master->sync_clk)
> +		clk_disable_unprepare(master->sync_clk);

earlier you tested for IS_ERR(master->sync_clk)?

> +	for (i = 0; i < 4; i++) {

what is 4? 4 hops?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
