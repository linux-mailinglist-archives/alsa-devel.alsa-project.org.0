Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444EAA418
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 15:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F221684;
	Thu,  5 Sep 2019 15:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F221684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567689413;
	bh=5bAcasrGWn3tPQmMp1aQpl3qSsXUoUrSX2raiSqMqtc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INrCbaLRTAl5hM42pTaVf9YTOlpQcVI3h3et/+HwKbVT53gWv7hHxHEpNkQtlnDk+
	 k5lWcqCguyyODHHpSUbEOe4d9ufnrXruuihDLa3y1DnWaJTGj52QC9KwG8gsswJnqx
	 YbvI7DmXiwvKeIZVpAy81mQCvKY3Qui883Xeh6SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C054F8049B;
	Thu,  5 Sep 2019 15:15:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6500F80448; Thu,  5 Sep 2019 15:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C80CF80171
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 15:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C80CF80171
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 06:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="177298824"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 05 Sep 2019 06:15:00 -0700
Received: from ravisha1-mobl1.amr.corp.intel.com (unknown [10.255.36.89])
 by linux.intel.com (Postfix) with ESMTP id 9C73B580105;
 Thu,  5 Sep 2019 06:14:58 -0700 (PDT)
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, daniel.baluta@nxp.com
References: <20190905064400.24800-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d5a4b443-7530-75de-731f-b13cde66aea7@linux.intel.com>
Date: Thu, 5 Sep 2019 08:14:57 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905064400.24800-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix COMPILE_TEST
 error
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

On 9/5/19 1:44 AM, YueHaibing wrote:
> When do compile test, if SND_SOC_SOF_OF is not set, we get:
> 
> sound/soc/sof/imx/imx8.o: In function `imx8_dsp_handle_request':
> imx8.c:(.text+0xb0): undefined reference to `snd_sof_ipc_msgs_rx'
> sound/soc/sof/imx/imx8.o: In function `imx8_ipc_msg_data':
> imx8.c:(.text+0xf4): undefined reference to `sof_mailbox_read'
> sound/soc/sof/imx/imx8.o: In function `imx8_dsp_handle_reply':
> imx8.c:(.text+0x160): undefined reference to `sof_mailbox_read'
> 
> Make SND_SOC_SOF_IMX_TOPLEVEL always depends on SND_SOC_SOF_OF
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/imx/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index fd73d84..5acae75 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -2,7 +2,8 @@
>   
>   config SND_SOC_SOF_IMX_TOPLEVEL
>   	bool "SOF support for NXP i.MX audio DSPs"
> -	depends on ARM64 && SND_SOC_SOF_OF || COMPILE_TEST
> +	depends on ARM64|| COMPILE_TEST
> +	depends on SND_SOC_SOF_OF
>   	help
>             This adds support for Sound Open Firmware for NXP i.MX platforms.
>             Say Y if you have such a device.
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
