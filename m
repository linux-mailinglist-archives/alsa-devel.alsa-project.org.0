Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7714C4926
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 16:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E3B1B3D;
	Fri, 25 Feb 2022 16:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E3B1B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645803496;
	bh=DgZEyW9WGbg19T0O4IYVpLNoKWRLGkHp9DfKkfTOfl0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vEpgamf7D5d0EmC0moRbPInpUA7DfEZQZNh9x1ISa2+MOJAiJf19w57fJe6FBpeY6
	 tvAQZMGaImA/xRBwQw31p3vP8uIYMqVYGnfvDTOFiCNXIeNYhzpE8BnUwYn1rBCh4n
	 HldC+/eVgc7komNCNRnUuCguFD7xq+xrDCfrj1cY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E01F80159;
	Fri, 25 Feb 2022 16:37:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24E2CF80132; Fri, 25 Feb 2022 16:37:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6427AF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 16:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6427AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hU+AKr3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645803418; x=1677339418;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DgZEyW9WGbg19T0O4IYVpLNoKWRLGkHp9DfKkfTOfl0=;
 b=hU+AKr3smFmlt9mKI42EPUO7QOhNVQLpvqJsAg531P0p4M6R/466YzTI
 o0FRLn0Jfx4oV2JSXmK07+yHLIOyHag6bnDC/Td0/LP41AlxuaiZGznks
 HcSpGGgQfP49/vGv8ybA2151Jg3bDUtXImjw3UJLH0R1oz4bmXjf6mbnJ
 Mn2zdVaU2/P/o592hYMNJzNoWYb8kph8XPlD1kEWcmlfacfu+NC9D4EPG
 vqR5yqcvH9pKrkgoN/0Hp6GPBkqb3FQAKWXXgHkqLvXd/Q2teeU9S1qdi
 hHvnvjbHrM8NFPufjjkGcb8kGXRCmMcEYUcsLo1gz8QBOGuI8qDd6c0k4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="315732767"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="315732767"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 07:36:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="777436487"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 07:36:15 -0800
Message-ID: <b61345f0-3409-88af-fd6c-e1a69e150b33@linux.intel.com>
Date: Fri, 25 Feb 2022 09:36:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: sof-priv: Drop duplicate sof_compressed_ops
 declaration
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
References: <20220225120034.11028-1-peter.ujfalusi@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220225120034.11028-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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



On 2/25/22 06:00, Peter Ujfalusi wrote:
> Other commit added the declaration of the sof_compressed_ops, drop the
> instance which added it as Platform specific ops, which the
> sof_compressed_ops is not.
> 
> 76cdd90b27b4e ("ASoC: SOF: pcm: Add compress_ops for SOF platform component driver")

missing Fixes: tag?

> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  sound/soc/sof/sof-priv.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index 1cc6dce17582..2e19ac619ad5 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -561,11 +561,6 @@ int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
>  		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
>  		const char *name, enum sof_debugfs_access_type access_type);
>  
> -/*
> - * Platform specific ops.
> - */
> -extern struct snd_compress_ops sof_compressed_ops;
> -
>  /*
>   * DSP Architectures.
>   */
