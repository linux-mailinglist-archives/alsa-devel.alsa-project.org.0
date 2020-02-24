Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B1516ACA9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 18:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0442C169F;
	Mon, 24 Feb 2020 18:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0442C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582564061;
	bh=EkBLuLn9r0JV3bvo2spu25mGYzNHZ4unn6+SegXFZbQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AnjRISdu/y6XUpPjbwSmTk4mO09+PWDPJfwowWiZ9qFaNlo0zY93ATgggUOIW7FJX
	 ikS4lXch0Ysc1GhpyAydKlRVo9fxxN6EItodHhlSYx81Ry8DrwormUOWSfQOhGj1rG
	 ZIs77kSCL1Yl9DdBnznihP3qu3JodPSt9ZnXePqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 212B4F801F2;
	Mon, 24 Feb 2020 18:06:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19A44F8014D; Mon, 24 Feb 2020 18:05:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F72DF8014D
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 18:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F72DF8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 09:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; d="scan'208";a="230713367"
Received: from rjgardn2-mobl1.amr.corp.intel.com (HELO [10.254.182.151])
 ([10.254.182.151])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2020 09:05:49 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix available clock counter
 incrementation
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ff5ef8e-8a95-14a3-b050-3dc974ffe22c@linux.intel.com>
Date: Mon, 24 Feb 2020 10:18:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224125202.13784-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "moderated list:INTEL ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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



On 2/24/20 6:52 AM, Amadeusz Sławiński wrote:
> Incrementation of avail_clk_cnt was incorrectly moved to error path. Put
> it back to success path.
> 
> Fixes: 6ee927f2f01466 ('ASoC: Intel: Skylake: Fix NULL ptr dereference when unloading clk dev')
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>   sound/soc/intel/skylake/skl-ssp-clk.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
> index 1c0e5226cb5b..bd43885f3805 100644
> --- a/sound/soc/intel/skylake/skl-ssp-clk.c
> +++ b/sound/soc/intel/skylake/skl-ssp-clk.c
> @@ -384,9 +384,11 @@ static int skl_clk_dev_probe(struct platform_device *pdev)
>   				&clks[i], clk_pdata, i);
>   
>   		if (IS_ERR(data->clk[data->avail_clk_cnt])) {
> -			ret = PTR_ERR(data->clk[data->avail_clk_cnt++]);
> +			ret = PTR_ERR(data->clk[data->avail_clk_cnt]);

Are you sure?

If you start with avail_clk_cnt set to zero, the error handling will 
decrement and access offset -1

static void unregister_src_clk(struct skl_clk_data *dclk)
{
      while (dclk->avail_clk_cnt--)
          clkdev_drop(dclk->clk[dclk->avail_clk_cnt]->lookup); <<< oob 
access with offset -1
}

>   			goto err_unreg_skl_clk;
>   		}
> +
> +		data->avail_clk_cnt++;
>   	}
>   
>   	platform_set_drvdata(pdev, data);
> 
