Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FDDDB077
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC2E168F;
	Thu, 17 Oct 2019 16:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC2E168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571323882;
	bh=or3fYjTOVaR/P/e3EwJUdlZPealF3yAkh50QUuk8s9o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+4pRUzw/sWHs6JkBNu4+bE+R+CTAyxzDkNdjVV80piHrmAmJ9a6mjucFHfQpnwjd
	 TPSl6U+62ppIxJx8Qxc+YwRzI8uE4A75PtJekBSBUWKeaBrCwFIMbWdoIXM4DDnP21
	 rzW1+QmfzavNa+kj7G7FTIHt4r0S2B58ldFRlwus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CEA4F80528;
	Thu, 17 Oct 2019 16:49:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE2A4F80276; Thu, 17 Oct 2019 16:49:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4971FF80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4971FF80276
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 07:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="190045703"
Received: from albeaudr-mobl1.amr.corp.intel.com (HELO [10.252.136.206])
 ([10.252.136.206])
 by orsmga008.jf.intel.com with ESMTP; 17 Oct 2019 07:49:24 -0700
To: Chuhong Yuan <hslester96@gmail.com>
References: <20191017025044.31474-1-hslester96@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31fb322b-c0c2-b783-47bc-52be842f8661@linux.intel.com>
Date: Thu, 17 Oct 2019 08:16:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017025044.31474-1-hslester96@gmail.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: sof-rt5682: add a check for
 devm_clk_get
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



On 10/16/19 9:50 PM, Chuhong Yuan wrote:
> sof_audio_probe misses a check for devm_clk_get and may cause problems.
> Add a check for it to fix the bug.

Indeed this is a miss, we have this test in all machine drivers except 
this one. Thanks for the patch!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>   sound/soc/intel/boards/sof_rt5682.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index a437567b8cee..6d15c7ff66bf 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -576,6 +576,15 @@ static int sof_audio_probe(struct platform_device *pdev)
>   	/* need to get main clock from pmc */
>   	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
>   		ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> +		if (IS_ERR(ctx->mclk)) {
> +			ret = PTR_ERR(ctx->mclk);
> +
> +			dev_err(&pdev->dev,
> +				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
>   		ret = clk_prepare_enable(ctx->mclk);
>   		if (ret < 0) {
>   			dev_err(&pdev->dev,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
