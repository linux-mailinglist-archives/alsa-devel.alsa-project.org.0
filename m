Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA4601AA5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:53:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FCD12DC5;
	Mon, 17 Oct 2022 22:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FCD12DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039991;
	bh=GW/zaH3ounpbGFX57wTCamgtCMFQPqp+ioCSI7MdKT0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lwwoee9O3sx8hIiRKAF9BFWgqaPzdtqEugwCQ+0cxyJydESA8N78npYKDOcaEmGB/
	 mKDI9hRgdF9JtUe0DSrHX/8STqKlCEjP0FaJ2IHCJQB/tupctJE5uFK1mooKbZ1dY9
	 vn/n6PpgoVHoGRARL755PrKWqXtWwqB+54Xc7Zts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D379F800AA;
	Mon, 17 Oct 2022 22:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E210DF8025E; Mon, 17 Oct 2022 22:52:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C70BF8025A
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C70BF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fERWoELH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039929; x=1697575929;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GW/zaH3ounpbGFX57wTCamgtCMFQPqp+ioCSI7MdKT0=;
 b=fERWoELHVB5ci43hEKdsD8t2C3exzhea0vnrwML6yBtUPQcsHJ7tdPTS
 jYDEqNeVmHV8qJcyNJnJWeEZl0q01lBiX/fe/ngv4JYA2N/WdifCJE9s6
 t6EAe7ilnv9bmYuGPDDXCyJCQuJvjrmZWg68UbgHptyvvQHrEWhF9GVSF
 Ou3YLBzBJZpksyNVZyeiWAh1/f+UujocgZJP40YzDB3X4UA2MuZpo3usU
 2N94nfsylVZ2H1gfyD2k9/eCtabikg9/VyuodaNzIW+K7YDEmcqEZcix1
 wNnOZ6BY3KEvBSRAG3ojPTz1EzHX2muaDTpGIF6XPoJyCk1h4nJRTCG4f w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="286308262"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="286308262"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:52:04 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="697201564"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="697201564"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO [10.212.54.140])
 ([10.212.54.140])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:52:03 -0700
Message-ID: <3e0ae664-2670-4f23-3f66-4be7dd8534e0@linux.intel.com>
Date: Mon, 17 Oct 2022 15:52:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Add quirk for Rex board
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20221017204207.207608-1-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221017204207.207608-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Curtis Malainey <cujomalainey@chromium.org>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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



On 10/17/22 15:42, Pierre-Louis Bossart wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> Add mtl_mx98357_rt5682 driver data for Chrome Rex board support.
> 
> Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I forgot to run my script and add my Signed-off-by tag, please discard
this one, will send a v2. Sorry about the noise.


> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  sound/soc/intel/boards/sof_rt5682.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 1bf9455eaf935..adc964d363a29 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -225,6 +225,18 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> +	{
> +		.callback = sof_rt5682_quirk_cb,
> +		.matches = {
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
> +		},
> +		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(2) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(0) |
> +					SOF_RT5682_NUM_HDMIDEV(4)
> +					),
> +	},
>  	{}
>  };
>  
