Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1D93D01E3
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 20:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 396A61690;
	Tue, 20 Jul 2021 20:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 396A61690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626806950;
	bh=wTzRj8ntaHPZgeMc5NyHUMUtG0LdtzjV5Pwcjik0Y58=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFkLp6TTzExU4ne/tWbSLtRqdc6lGCo44pVSi9YliyEEp4J9B6hDhM7G3FKm1C0qh
	 KLkpS8M7frCJFYCgZXcXU9rzW+r3MwR/r7xjhDm2F4WdVozlKEGODGSLv7dKyULJte
	 Mg8PdpPWQlOKy5wqZO/a9vjW5x83enTsQ8N19c1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEF77F80218;
	Tue, 20 Jul 2021 20:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7CF1F800DA; Tue, 20 Jul 2021 20:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF3EAF800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 20:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF3EAF800DA
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="198511657"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="198511657"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 11:47:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="462146668"
Received: from aremenni-mobl.amr.corp.intel.com (HELO [10.209.130.10])
 ([10.209.130.10])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 11:47:25 -0700
Subject: Re: [PATCH v4 05/12] ASoC: amd: add ACP5x PCM platform driver
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
 <20210720163732.23003-6-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <106fa9e8-1d22-dd6a-8301-20761a212e4f@linux.intel.com>
Date: Tue, 20 Jul 2021 13:12:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720163732.23003-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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


> +static int acp5x_audio_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct i2s_dev_data *adata;
> +	int status;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
> +		return -ENODEV;
> +	}
> +	irqflags = *((unsigned int *)(pdev->dev.platform_data));
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +			return -ENODEV;

indentation is off?

> +	}
> +
> +	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
> +
> +	adata->acp5x_base = devm_ioremap(&pdev->dev, res->start,
> +					 resource_size(res));
> +	if (!adata->acp5x_base)
> +		return -ENOMEM;
> +	dev_set_drvdata(&pdev->dev, adata);
> +	status = devm_snd_soc_register_component(&pdev->dev,
> +						 &acp5x_i2s_component,
> +						 NULL, 0);
> +	if (status)
> +		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
> +
> +	return status;
> +}
