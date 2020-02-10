Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06E5158488
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 22:02:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644011671;
	Mon, 10 Feb 2020 22:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644011671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581368571;
	bh=gMZMfZgx977HnR+/+cZ+RZ9WS24Op7ubt8IPr7vPrW0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMp9SVsA63oDF3d5LTrb17ATQPBOFLKZX9sBU3mArBuOA56H+QUuBizxQ80rRvybh
	 55AI56yNsJR41ExQty+V1bPvAmJrayD+1/rcfAXji8CFxBLbuFHTrQLWrkaU4EPTbl
	 oAU0L/VVeeRWV9oy0tpC6CeoFzPjoJzcyuNZghak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D28F8014F;
	Mon, 10 Feb 2020 22:01:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 464B5F80157; Mon, 10 Feb 2020 22:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DF4BF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 22:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DF4BF80118
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 13:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,426,1574150400"; d="scan'208";a="265998822"
Received: from pdmullen-mobl.amr.corp.intel.com (HELO [10.251.9.121])
 ([10.251.9.121])
 by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2020 13:00:59 -0800
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, daniel.baluta@nxp.com, krzk@kernel.org
References: <20200210061544.7600-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
Date: Mon, 10 Feb 2020 15:00:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210061544.7600-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix randbuild error
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



On 2/10/20 12:15 AM, YueHaibing wrote:
> when do randconfig like this:
> CONFIG_SND_SOC_SOF_IMX8_SUPPORT=y
> CONFIG_SND_SOC_SOF_IMX8=y
> CONFIG_SND_SOC_SOF_OF=y
> CONFIG_IMX_DSP=m
> CONFIG_IMX_SCU=y
> 
> there is a link error:
> 
> sound/soc/sof/imx/imx8.o: In function 'imx8_send_msg':
> imx8.c:(.text+0x380): undefined reference to 'imx_dsp_ring_doorbell'
> 
> Select IMX_DSP in SND_SOC_SOF_IMX8_SUPPORT to fix this
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF dependency")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for the report.

Would you mind sharing the .config and instructions to reproduce this 
case? we have an unrelated issue with allyesconfig that was reviewed here:

https://github.com/thesofproject/linux/pull/1778

and I'd probably a good thing to fix everything in one shot.

Thanks!

> ---
>   sound/soc/sof/imx/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index bae4f7b..81274906 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -14,7 +14,7 @@ if SND_SOC_SOF_IMX_TOPLEVEL
>   config SND_SOC_SOF_IMX8_SUPPORT
>   	bool "SOF support for i.MX8"
>   	depends on IMX_SCU
> -	depends on IMX_DSP
> +	select IMX_DSP
>   	help
>   	  This adds support for Sound Open Firmware for NXP i.MX8 platforms
>   	  Say Y if you have such a device.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
