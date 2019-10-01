Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70252C3923
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 17:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CB5167E;
	Tue,  1 Oct 2019 17:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CB5167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569944035;
	bh=nfjg7yMG0TOFpcz207qjve6ZAbpn/0hVDrHhIpquEJg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XhieLAxxo2W+O8EwVqzxjx8qUlTGdAPuS4KSd57tdFao+EliD1Or/r7P8Z2Ge7Bcn
	 DY+5stWFqY/I6AraWOWjZ+93jeyoA1bYJKB9LWNnpQvQMYB7yQKXPO2etN+efQHURj
	 HLBRVS03O/uNFzPec75v43+spazTS7R5bdxKZNSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46800F80506;
	Tue,  1 Oct 2019 17:32:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BB19F80506; Tue,  1 Oct 2019 17:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19A9CF80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 17:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19A9CF80482
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 08:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; d="scan'208";a="275026881"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 01 Oct 2019 08:32:00 -0700
Received: from abapat-mobl1.amr.corp.intel.com (unknown [10.251.1.101])
 by linux.intel.com (Postfix) with ESMTP id D8A92580696;
 Tue,  1 Oct 2019 08:31:58 -0700 (PDT)
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
References: <20191001142026.1124917-1-arnd@arndb.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bb58c7cc-209d-7a2f-0e5b-95a9605ffe7b@linux.intel.com>
Date: Tue, 1 Oct 2019 10:31:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001142026.1124917-1-arnd@arndb.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Hulk Robot <hulkci@huawei.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: imx: fix reverse
 CONFIG_SND_SOC_SOF_OF dependency
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

On 10/1/19 9:20 AM, Arnd Bergmann wrote:
> CONFIG_SND_SOC_SOF_IMX depends on CONFIG_SND_SOC_SOF, but is in
> turn referenced by the sof-of-dev driver. This creates a reverse
> dependency that manifests in a link error when CONFIG_SND_SOC_SOF_OF
> is built-in but CONFIG_SND_SOC_SOF_IMX=m:
> 
> sound/soc/sof/sof-of-dev.o:(.data+0x118): undefined reference to `sof_imx8_ops'
> 
> Make the latter a 'bool' symbol and change the Makefile so the imx8
> driver is compiled the same way as the driver using it.
> 
> A nicer way would be to reverse the layering and move all
> the imx specific bits of sof-of-dev.c into the imx driver
> itself, which can then call into the common code. Doing this
> would need more testing and can be done if we add another
> driver like the first one.

Or use something like

config SND_SOC_SOF_IMX8_SUPPORT
	bool "SOF support for i.MX8"
    	depends on IMX_SCU
    	depends on IMX_DSP

config SND_SOC_SOF_IMX8
	tristate
	<i.mx selects>

config SND_SOC_SOF_OF
	depends on OF
	select SND_SOC_SOF_IMX8 if SND_SOC_SOF_IMX8_SUPPORT

That way you propagate the module/built-in information. That's how we 
fixed those issues for the Intel parts.

> 
> Fixes: f4df4e4042b0 ("ASoC: SOF: imx8: Fix COMPILE_TEST error")
> Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/soc/sof/imx/Kconfig  | 2 +-
>   sound/soc/sof/imx/Makefile | 4 +++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 5acae75f5750..a3891654a1fc 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -12,7 +12,7 @@ config SND_SOC_SOF_IMX_TOPLEVEL
>   if SND_SOC_SOF_IMX_TOPLEVEL
>   
>   config SND_SOC_SOF_IMX8
> -	tristate "SOF support for i.MX8"
> +	bool "SOF support for i.MX8"
>   	depends on IMX_SCU
>   	depends on IMX_DSP
>   	help
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index 6ef908e8c807..9e8f35df0ff2 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -1,4 +1,6 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>   snd-sof-imx8-objs := imx8.o
>   
> -obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
> +ifdef CONFIG_SND_SOC_SOF_IMX8
> +obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-imx8.o
> +endif
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
