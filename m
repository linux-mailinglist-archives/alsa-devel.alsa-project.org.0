Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260CD562229
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 20:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B49E416B3;
	Thu, 30 Jun 2022 20:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B49E416B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656614168;
	bh=qfMvz34IQ1XlB/cxYb48cOD/Af4s6wGj7oK89k9bGoY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mok5M1gVWtvFKMOUKqZD6od79ft7Duy+LifJsKqFpig3KZJw+bLPCdZ4/XedcxlnD
	 7/0BILLFJUCmSqGVQqj/2wku+ifv0elaIG263/3kStYmLNYuDhKHDf/svk6v6DWgQ4
	 9THSYncwad3sHx7inkTeT2tVaMzKt3OaXdtllauA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59400F804DA;
	Thu, 30 Jun 2022 20:35:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8819DF804D8; Thu, 30 Jun 2022 20:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1905EF80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 20:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1905EF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QYSOxEvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656614115; x=1688150115;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qfMvz34IQ1XlB/cxYb48cOD/Af4s6wGj7oK89k9bGoY=;
 b=QYSOxEvfB10n987z6Q0CoB46rYKgMbTX3Q9stPa4O5KLq1VaLmZq/5V9
 xccZFydSFklJwfnB2cZ8jZKaJkqMHqN0M8ZEdQ4rLvgmyCoy8Pr/h+ANJ
 q22xc4rInvSMQ7IEsLY9FPUXOApdwEKgEOHmTKsaTzfnx5xdrYMV02QG8
 ip7FmSsYQ8LNyynrP3lV9aVBT6lsQ9B48pgoWiYEIGiP4dp0cuqfQcRbN
 uONkcfuy5ts+2puKNFqgl7kDG11Or3MHtyi2fz4qwH84NNSTXajPJQhzB
 B0H4j+tK0qPHoeyEMgNvVBQFuG+oDczeA3nmOrF71xrqksQOyrIxdyJbi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="368747480"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="368747480"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 11:35:07 -0700
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="618071253"
Received: from jhilliar-mobl.amr.corp.intel.com (HELO [10.212.10.157])
 ([10.212.10.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 11:35:05 -0700
Message-ID: <2cc37f6d-72a7-9064-cad2-c6c6d21ede61@linux.intel.com>
Date: Thu, 30 Jun 2022 13:35:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/2] ASoC: cs35l41: Read System Name from ACPI _SUB to
 identify firmware
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20220630150135.1799535-1-sbinding@opensource.cirrus.com>
 <20220630150135.1799535-3-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220630150135.1799535-3-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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



On 6/30/22 10:01, Stefan Binding wrote:
> When loading firmware, wm_adsp uses a number of parameters to
> determine the path of the firmware and tuning files to load.
> One of these parameters is system_name.
> Add support in cs35l41 to read this system name from the ACPI
> _SUB ID in order to uniquely identify the firmware and tuning
> mapped to a particular system.

It's my understanding that the _SUB method is optional, not required. It
may be wise to plan for a fallback, e.g to use DMI quirks or other
identifiers, no?

If it's used quite widely, then it may be a good thing to add to
'alsa-info'.
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs35l41.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
> index 8766e19d85f1..d70469686699 100644
> --- a/sound/soc/codecs/cs35l41.c
> +++ b/sound/soc/codecs/cs35l41.c
> @@ -6,6 +6,7 @@
>  //
>  // Author: David Rhodes <david.rhodes@cirrus.com>
>  
> +#include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -1142,6 +1143,24 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
>  	return ret;
>  }
>  
> +static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
> +{
> +	acpi_handle handle = ACPI_HANDLE(cs35l41->dev);
> +	const char *sub;
> +
> +	/* If there is no ACPI_HANDLE, there is no ACPI for this system, return 0 */
> +	if (!handle)
> +		return 0;
> +
> +	sub = acpi_get_subsystem_id(handle);
> +	if (IS_ERR(sub))
> +		return PTR_ERR(sub);
> +
> +	cs35l41->dsp.system_name = sub;
> +	dev_dbg(cs35l41->dev, "Susystem ID: %s\n", cs35l41->dsp.system_name);

Typo: Subsystem

> +	return 0;
> +}
> +
>  int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
>  {
>  	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
> @@ -1270,6 +1289,10 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
>  		goto err;
>  	}
>  
> +	ret = cs35l41_acpi_get_name(cs35l41);
> +	if (ret < 0)
> +		goto err;
> +
>  	ret = cs35l41_dsp_init(cs35l41);
>  	if (ret < 0)
>  		goto err;
> @@ -1316,6 +1339,7 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
>  	pm_runtime_disable(cs35l41->dev);
>  
>  	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
> +	kfree(cs35l41->dsp.system_name);
>  	wm_adsp2_remove(&cs35l41->dsp);
>  	cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
>  
