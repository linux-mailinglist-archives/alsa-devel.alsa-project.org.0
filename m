Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF935681E05
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 23:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DCB850;
	Mon, 30 Jan 2023 23:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DCB850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675117649;
	bh=fI0VXAov/JzRv00d2YuslRkLPKjb8eVmliG6RS4C4Ww=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IXEMCRIoRNBqKclVWHm4JdnhRHQOu2O6vxxi0FSBI7v6hWpSigeQGWTYoewma+7Vw
	 Hx1vVyWvGO+hWBad+zD7IrYFquqHOuFqpUuz1TzBgNIL+D1JLD23bAiDL3jeKVd7RT
	 Jk6VdprlJI3yxJEfI5a5zdvfoypVa719iVmc8rnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3869F800A7;
	Mon, 30 Jan 2023 23:26:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84088F8032B; Mon, 30 Jan 2023 23:26:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D401BF800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 23:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D401BF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=L/K1K0E/
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C981511DA;
 Mon, 30 Jan 2023 23:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C981511DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675117585; bh=M4Gc6X96kuFeaN6aP2ubqI+ZhC4pG+m2LQpyGmQp4Uw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L/K1K0E/eziEKfW0/IosOyrHlbL86sGfNH8av5e79xqbURoYGPhE1Z04XIQXuUGuY
 QFPCBeBoutLiZUxMZjAHBFv51VrG8t1sw+ACSu5iHm5+EeZkdyeNN6HSrQhlA59KJL
 3w5xn+Z6j/7rwhRXNP/y9jxZW/iFOJFkxxrBlwuw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 30 Jan 2023 23:26:14 +0100 (CET)
Message-ID: <0670df68-ccc0-6806-cc78-15187481b973@perex.cz>
Date: Mon, 30 Jan 2023 23:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/6] ASoC: amd: yc: Add a module parameter to influence
 pdm_gain
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mukunda Vijendar <Vijendar.Mukunda@amd.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>, linux-kernel@vger.kernel.org
References: <20230130220754.8379-1-mario.limonciello@amd.com>
 <20230130220754.8379-3-mario.limonciello@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230130220754.8379-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30. 01. 23 23:07, Mario Limonciello wrote:
> In case of regressions for any users that the new pdm_gain value is
> too high and for additional debugging, introduce a module parameter
> that would let them configure it.
> 
> This parameter should be removed in the future:
>   * If it's determined that the parameter is not needed, just hardcode
>     the correct value as before
>   * If users do end up using it to debug and report different values
>     we should introduce a config knob that can have policy set by ucm.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>   * Add a guard for values > 3 to overflow the FIELD_PREP
>   * Clear ACP_WOV_GAIN_CONTROL before setting it
> ---
>   sound/soc/amd/yc/acp6x-pdm-dma.c | 10 +++++++++-
>   sound/soc/amd/yc/acp6x.h         |  2 +-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
> index acecd6a4ec4b1..2bb3ea14bae9c 100644
> --- a/sound/soc/amd/yc/acp6x-pdm-dma.c
> +++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/platform_device.h>
>   #include <linux/module.h>
> +#include <linux/bitfield.h>
>   #include <linux/err.h>
>   #include <linux/io.h>
>   #include <sound/pcm_params.h>
> @@ -18,6 +19,10 @@
>   
>   #define DRV_NAME "acp_yc_pdm_dma"
>   
> +static int pdm_gain = 3;
> +module_param(pdm_gain, int, 0644);
> +MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");
> +
>   static const struct snd_pcm_hardware acp6x_pdm_hardware_capture = {
>   	.info = SNDRV_PCM_INFO_INTERLEAVED |
>   		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> @@ -55,7 +60,10 @@ static void acp6x_enable_pdm_clock(void __iomem *acp_base)
>   
>   	acp6x_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
>   	pdm_ctrl = acp6x_readl(acp_base + ACP_WOV_MISC_CTRL);
> -	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
> +	pdm_ctrl &= FIELD_PREP(ACP_WOV_GAIN_CONTROL, 0);

It should be 'pdm_ctrl &= ~ACP_WOV_GAIN_CONTROL' see include/linux/bitfield.h 
(Modify: comment).

> +	if (pdm_gain > 3)
> +		pdm_gain = 3;

Negative values are not handled. Use clamp(pdm_gain, 0, 3) - see 
include/linux/minmax.h.

> +	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, pdm_gain);
>   	acp6x_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

