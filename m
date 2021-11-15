Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3299345609B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3CB118A1;
	Thu, 18 Nov 2021 17:35:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3CB118A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253368;
	bh=74nWMRYQHu6gg7ByGecDHk/oQBAwRGY8oU4S/lnSq+8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lXKiXTSXH+30tbZAI62J1Nz+jiGZ+yD5LSeN4lLQ0LyDVGBdnkY/d2tNM5lPo+A+q
	 goCXTFLNsHZ1Jarskv7yiOI8mYRGj0aQHm0ZqOQZDt7iNIQI7Km8BT3cQuo4IXtm2v
	 WlutCN723pSix8BOMVsvbcUV4Y44Dn9PaqqrO3Hw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA1CF80506;
	Thu, 18 Nov 2021 17:33:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E78B2F8027D; Mon, 15 Nov 2021 11:14:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 367CFF800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 11:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 367CFF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="hwsQlcKA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=zKle5O4Hm0rsP20JwKxCewz8QF7Q9nSdwfLsov0N4vA=; b=hwsQlcKAS/JXya4kJAPUiPtqXb
 9UMOU27cfaU5N7Tp8fyitDY1674HxtfXStnOTcAeHYihKpPwkh4BzHNyU3L8ni0MlEqLJvF3Tru5q
 B2eTXmMb/S3sAqTnVmA3k/cGfwJUJMXtyrqmrWCjYFQvJczCRjGLBk4fscjkPc04xA/T/XuzDoZfc
 XILRH6/Bd05bjkDrhLZT2E2VeKzK0ieAQRQtDzTV4WK2WZN7kHtarwsy+N/oRQtAZ3G4YUkB/BJh8
 efgVXyOr3W5pPKLt/HNdG7cIpevglHN4SkSIlzyhRsuDMLifVtTNbhdmELMY5HB4kAhXJnGP0TpjZ
 VMZfg1mg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mmZ0A-000A8L-4d; Mon, 15 Nov 2021 11:14:14 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mmZ09-0008BB-1V; Mon, 15 Nov 2021 11:14:13 +0100
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
Date: Mon, 15 Nov 2021 11:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115085403.360194-2-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26354/Mon Nov 15 10:21:07 2021)
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:02 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

On 11/15/21 9:53 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> This field is never set, and serves no purpose, so remove it.

I agree that we should remove it. Its been legacy support code for a 
while, but the description that there is no user is not right.

The tegra20_spdif driver obviously uses it and that user is removed in 
this patch. I think it makes sense to split that out into a separate 
patch with a description why the driver will still work even with 
slave_id removed. Maybe the best is to remove the whole tegra20_spdif 
driver.

> diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
> index 9fdc82d58db3..1c3385da6f82 100644
> --- a/sound/soc/tegra/tegra20_spdif.c
> +++ b/sound/soc/tegra/tegra20_spdif.c
> @@ -284,7 +284,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
>   	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
>   	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>   	spdif->playback_dma_data.maxburst = 4;
> -	spdif->playback_dma_data.slave_id = dmareq->start;
>   
dmareq is now unused and should be removed as well.
>   	pm_runtime_enable(&pdev->dev);
>   


