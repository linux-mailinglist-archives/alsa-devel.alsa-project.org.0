Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67170EA75
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 20:47:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1724165D;
	Mon, 29 Apr 2019 20:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1724165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556563662;
	bh=7oXchyNLs81UNbijcptF2FobDoecc/gW0e4Ri03/Gls=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5nvBTDwgRNHP8AvLQRxlcHz90Vwi8dQ480GPoThlYNz1lqTKrFBc6aP1PZhBe0Uv
	 1kaIHWQqrf4jc1nUlMtEEJSBh9YyIjgMYxvmpZjwtZThf0HxhD/XfzBsFVyLgwr+Ro
	 ODCWrdegokHpNPA0giAxDecQQkBsXR1pVWclNxLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E608F8962A;
	Mon, 29 Apr 2019 20:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A6FFF80CAB; Mon, 29 Apr 2019 20:45:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9376BF806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 20:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9376BF806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 11:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; d="scan'208";a="153344993"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Apr 2019 11:45:49 -0700
Received: from brettjgr-mobl1.ger.corp.intel.com (unknown [10.254.180.216])
 by linux.intel.com (Postfix) with ESMTP id A1D445803C2;
 Mon, 29 Apr 2019 11:45:47 -0700 (PDT)
To: Ross Zwisler <zwisler@chromium.org>, linux-kernel@vger.kernel.org
References: <20190429182517.210909-1-zwisler@google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <951de893-e6ff-5bd0-3483-4c1d93b30cfc@linux.intel.com>
Date: Mon, 29 Apr 2019 13:45:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429182517.210909-1-zwisler@google.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: avoid Oops if DMA setup
	fails
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

On 4/29/19 1:25 PM, Ross Zwisler wrote:
> Currently in sst_dsp_new() if we get an error return from sst_dma_new()
> we just print an error message and then still complete the function
> successfully.  This means that we are trying to run without sst->dma
> properly set up, which will result in NULL pointer dereference when
> sst->dma is later used.  This was happening for me in
> sst_dsp_dma_get_channel():
> 
>          struct sst_dma *dma = dsp->dma;
> 	...
>          dma->ch = dma_request_channel(mask, dma_chan_filter, dsp);
> 
> This resulted in:
> 
>     BUG: unable to handle kernel NULL pointer dereference at 0000000000000018
>     IP: sst_dsp_dma_get_channel+0x4f/0x125 [snd_soc_sst_firmware]
> 
> Fix this by adding proper error handling for the case where we fail to
> set up DMA.
> 
> This change only affects Haswell and Broadwell systems.  Baytrail
> systems explicilty opt-out of DMA via sst->pdata->resindex_dma_base
> being set to -1.
> 
> Signed-off-by: Ross Zwisler <zwisler@google.com>
> Cc: stable@vger.kernel.org

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Ross!

FWIW we should start deprecating this driver now and transition to SOF. 
I'll double-check how the upcoming 1.3 release works on my Pixel 
2015/Samus device later this week.


> ---
> 
> Changes in v2:
>   - Upgraded the sst_dma_new() failure message from dev_warn() to dev_err()
>     (Pierre-Louis).
>   - Noted in the changelog that this change only affects Haswell and
>     Broadwell (Pierre-Louis).
> 
> ---
>   sound/soc/intel/common/sst-firmware.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
> index 1e067504b6043..f830e59f93eaa 100644
> --- a/sound/soc/intel/common/sst-firmware.c
> +++ b/sound/soc/intel/common/sst-firmware.c
> @@ -1251,11 +1251,15 @@ struct sst_dsp *sst_dsp_new(struct device *dev,
>   		goto irq_err;
>   
>   	err = sst_dma_new(sst);
> -	if (err)
> -		dev_warn(dev, "sst_dma_new failed %d\n", err);
> +	if (err)  {
> +		dev_err(dev, "sst_dma_new failed %d\n", err);
> +		goto dma_err;
> +	}
>   
>   	return sst;
>   
> +dma_err:
> +	free_irq(sst->irq, sst);
>   irq_err:
>   	if (sst->ops->free)
>   		sst->ops->free(sst);
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
