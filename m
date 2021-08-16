Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F413EE07F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 01:43:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89191839;
	Tue, 17 Aug 2021 01:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89191839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629157406;
	bh=hyRO16oAqvsXvAugZJCjDdqWaZvegixWD8lmLd5Ga7w=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEUtJpwsZ/p/aqRNsdZQS5sqo/ERoawZQUsxIz/l/ZkwkqSIteSRj9kla3bhXRYsL
	 FuK9AisTeD8TZUfAtDjErva+fwsyzziMfbp69MNsh8UHczdw01clxbHKdoZoQGK1RO
	 hAAkFEgeqihroj1v9BxLGqSg5C6Qt1v7Pqowwa9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EB3F80259;
	Tue, 17 Aug 2021 01:42:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C14F80249; Tue, 17 Aug 2021 01:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C608F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 01:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C608F80134
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="196227573"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; d="scan'208";a="196227573"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 16:41:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; d="scan'208";a="679670181"
Received: from vmartin1-mobl1.amr.corp.intel.com (HELO [10.212.120.166])
 ([10.212.120.166])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 16:41:53 -0700
Subject: Re: [PATCH v5 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: David Rhodes <drhodes@opensource.cirrus.com>, broonie@kernel.org,
 robh@kernel.org, ckeepax@opensource.cirrus.com, brian.austin@cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
References: <20210816224310.344931-1-drhodes@opensource.cirrus.com>
 <20210816224310.344931-2-drhodes@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a0be6858-0d98-7f26-9ba5-f290c9809b5c@linux.intel.com>
Date: Mon, 16 Aug 2021 18:41:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816224310.344931-2-drhodes@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


> diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id cs35l41_acpi_match[] = {
> +	{ "CSC3541", 0 }, /* Cirrus Logic PnP ID + part ID */
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
> +#endif
> +
> +static struct i2c_driver cs35l41_i2c_driver = {
> +	.driver = {
> +		.name		= "cs35l41",
> +		.of_match_table = of_match_ptr(cs35l41_of_match),
> +		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
> +	},
> +	.id_table	= cs35l41_id_i2c,
> +	.probe		= cs35l41_i2c_probe,
> +	.remove		= cs35l41_i2c_remove,
> +};
> +
> +module_i2c_driver(cs35l41_i2c_driver);

> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id cs35l41_acpi_match[] = {
> +	{ "CSC3541", 0 }, /* Cirrus Logic PnP ID + part ID */
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, cs35l41_acpi_match);
> +#endif
> +
> +static struct spi_driver cs35l41_spi_driver = {
> +	.driver = {
> +		.name		= "cs35l41",
> +		.of_match_table = of_match_ptr(cs35l41_of_match),
> +		.acpi_match_table = ACPI_PTR(cs35l41_acpi_match),
> +	},
> +	.id_table	= cs35l41_id_spi,
> +	.probe		= cs35l41_spi_probe,
> +	.remove		= cs35l41_spi_remove,
> +};
> +
> +module_spi_driver(cs35l41_spi_driver);

Is the ACPI probe smart enough to deal with two different drivers
registering for the *same* HID?

I haven't seen any precedent, e.g. the RT6777 uses a different ACPI HID
for its I2C and SPI modes.


