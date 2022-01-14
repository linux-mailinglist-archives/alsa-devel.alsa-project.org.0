Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6048E720
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 10:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501891B3A;
	Fri, 14 Jan 2022 10:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501891B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642151353;
	bh=P6a7MGar2Rg8ifSaUbEYyz7wwax7DUKswFAABctDBH4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRIRTSHtoKgy2Ph+Wy/QG75eRdKZSly5FUWu39+xGPzOShUDO7p3vludkGNPbF/DX
	 O6Elirs9kVQvLBPyM+/1EO/SlbybCeW1zlnMHbkWObUL8sPaShUJh/ZwvGueDdh+86
	 4CcJRS9GNCTcIvEWrju6iGF74kUtobxu1DHx+WGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F67F80310;
	Fri, 14 Jan 2022 10:08:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E91AF8030F; Fri, 14 Jan 2022 10:07:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF13F80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 10:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF13F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jCXmVjwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642151268; x=1673687268;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P6a7MGar2Rg8ifSaUbEYyz7wwax7DUKswFAABctDBH4=;
 b=jCXmVjwVyctsAjMWsFmjOHdzjjQj/pPRJRKxoRKEilqDOSyJg3ekW8VT
 GFhbpsmLDvDVEd9LCX+sxRO1ayD5TUPcTDZt7IYkUqdUjG7qxJhrhPArq
 ygFu90xyCw9FkjThMJMj7HrD0HOWmesv+2/wzbMH087yWjJvVB6buhx5k
 SLIfW2Gqra/GcNR4TvZhlu26WsSDzHYYgnqPUv+JfC8MAnneXc0AylLni
 TbN6nOtrgaNGCVBXOaT5fGBYPBPVFNZyXkFidv1pXtrgmOPiRtfDytRgo
 fPV7Hvfx/QQrxPESeejDgIWJ1xaRbDo4SfzmOFzzGSao6/g/3vtQCC5Wx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244008912"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="244008912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 01:07:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="475710448"
Received: from rjastrzx-mobl.ger.corp.intel.com (HELO [10.237.180.117])
 ([10.237.180.117])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 01:01:45 -0800
Message-ID: <e815d582-bd7d-6ec0-05ca-97d633ef9e13@linux.intel.com>
Date: Fri, 14 Jan 2022 10:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/6] ASoC: amd: acp: Add ACP init()/deinit() callback
 for Renoir.
Content-Language: en-US
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
 <20220113163348.434108-5-AjitKumar.Pandey@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220113163348.434108-5-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

On 1/13/2022 5:33 PM, Ajit Kumar Pandey wrote:
> ACP hardware has PGFSM control registers that can be configured to
> power On/Off the ACP IP block. Add acp init()/de_init() callbacks
> in renoir platform driver probe()/remove() respectively to power
> on and off ACP IP block on ACP3X device.
> 
> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> ---
>   sound/soc/amd/acp/acp-renoir.c       | 170 +++++++++++++++++++++++++++
>   sound/soc/amd/acp/chip_offset_byte.h |   6 +
>   2 files changed, 176 insertions(+)
> 
> diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
> index 770a57a0677b..a29f910f25d1 100644
> --- a/sound/soc/amd/acp/acp-renoir.c
> +++ b/sound/soc/amd/acp/acp-renoir.c
> @@ -25,6 +25,19 @@
>   
>   #define DRV_NAME "acp_asoc_renoir"
>   
> +#define ACP_SOFT_RST_DONE_MASK	0x00010001
> +
> +#define ACP_PWR_ON_MASK		0x01
> +#define ACP_PWR_OFF_MASK	0x00
> +#define ACP_PGFSM_STAT_MASK	0x03
> +#define ACP_POWERED_ON		0x00
> +#define ACP_PWR_ON_IN_PROGRESS	0x01
> +#define ACP_POWERED_OFF		0x02
> +
> +
> +#define ACP_ERROR_MASK 0x20000000
> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
> +
>   static struct snd_soc_acpi_codecs amp_rt1019 = {
>   	.num_codecs = 1,
>   	.codecs = {"10EC1019"}
> @@ -112,11 +125,154 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
>   },
>   };
>   
> +static int acp3x_power_on(void __iomem *base)
> +{
> +	u32 val;
> +	int timeout = 0;
> +
> +	val = readl(base + ACP_PGFSM_STATUS);
> +
> +	if (val == ACP_POWERED_ON)
> +		return 0;
> +
> +	if ((val & ACP_PGFSM_STAT_MASK) != ACP_PWR_ON_IN_PROGRESS)
> +		writel(ACP_PWR_ON_MASK, base + ACP_PGFSM_CONTROL);
> +
> +	while (++timeout < 500) {
> +		val = readl(base + ACP_PGFSM_STATUS);
> +		if (!val)
> +			return 0;
> +		udelay(1);
> +	}

Can this while loop perhaps be replaced with readl_poll_timeout?
Similarly for cases below?

> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp3x_power_off(void __iomem *base)
> +{
> +	u32 val;
> +	int timeout = 0;
> +
> +	writel(ACP_PWR_OFF_MASK, base + ACP_PGFSM_CONTROL);
> +
> +	while (++timeout < 500) {
> +		val = readl(base + ACP_PGFSM_STATUS);
> +		if ((val & ACP_PGFSM_STAT_MASK) == ACP_POWERED_OFF)
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp3x_reset(void __iomem *base)
> +{
> +	u32 val;
> +	int timeout = 0;
> +
> +	writel(1, base + ACP_SOFT_RESET);
> +
> +	while (++timeout < 500) {
> +		val = readl(base + ACP_SOFT_RESET);
> +		if (val & ACP_SOFT_RST_DONE_MASK)
> +			break;
> +		cpu_relax();
> +	}
> +
> +	writel(0, base + ACP_SOFT_RESET);
> +
> +	timeout = 0;
> +	while (++timeout < 500) {
> +		val = readl(base + ACP_SOFT_RESET);
> +		if (!val)
> +			return 0;
> +		cpu_relax();
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void acp3x_enable_interrupts(void __iomem *base)
> +{
> +	u32 ext_intr_ctrl;
> +
> +	writel(0x01, base + ACP_EXTERNAL_INTR_ENB);
> +	ext_intr_ctrl = readl(base + ACP_EXTERNAL_INTR_CNTL);
> +	ext_intr_ctrl |= ACP_ERROR_MASK;
> +	writel(ext_intr_ctrl, base + ACP_EXTERNAL_INTR_CNTL);
> +}
> +
> +static void acp3x_disable_interrupts(void __iomem *base)
> +{
> +	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, base + ACP_EXTERNAL_INTR_STAT);
> +	writel(0x00, base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static int rn_acp_init(void __iomem *base)
> +{
> +	int ret;
> +
> +	/* power on */
> +	ret = acp3x_power_on(base);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, base + ACP_CONTROL);
> +
> +	/* Reset */
> +	ret = acp3x_reset(base);
> +	if (ret)
> +		return ret;
> +
> +	acp3x_enable_interrupts(base);
> +
> +	return 0;
> +}
> +
> +static int rn_acp_deinit(void __iomem *base)
> +{
> +	int ret = 0;
> +
> +	acp3x_disable_interrupts(base);
> +
> +	/* Reset */
> +	ret = acp3x_reset(base);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x00, base + ACP_CONTROL);
> +
> +	/* power off */
> +	ret = acp3x_power_off(base);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
>   static int renoir_audio_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct acp_chip_info *chip;
>   	struct acp_dev_data *adata;
>   	struct resource *res;
> +	int ret;
> +
> +	chip = dev_get_platdata(&pdev->dev);
> +	if (!chip || !chip->base) {
> +		dev_err(&pdev->dev, "ACP chip data is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	if (chip->acp_rev != ACP3X_DEV) {
> +		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
> +		return -ENODEV;
> +	}
> +
> +	ret = rn_acp_init(chip->base);
> +	if (ret) {
> +		dev_err(&pdev->dev, "ACP Init failed\n");
> +		return -EINVAL;
> +	}
>   
>   	adata = devm_kzalloc(dev, sizeof(struct acp_dev_data), GFP_KERNEL);
>   	if (!adata)
> @@ -155,6 +311,20 @@ static int renoir_audio_probe(struct platform_device *pdev)
>   static int renoir_audio_remove(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> +	struct acp_chip_info *chip;
> +	int ret;
> +
> +	chip = dev_get_platdata(&pdev->dev);
> +	if (!chip || !chip->base) {
> +		dev_err(&pdev->dev, "ACP chip data is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = rn_acp_deinit(chip->base);
> +	if (ret) {
> +		dev_err(&pdev->dev, "ACP de-init Failed\n");
> +		return -EINVAL;
> +	}
>   
>   	acp_platform_unregister(dev);
>   	return 0;
> diff --git a/sound/soc/amd/acp/chip_offset_byte.h b/sound/soc/amd/acp/chip_offset_byte.h
> index e38589a142e9..88f6fa597cd6 100644
> --- a/sound/soc/amd/acp/chip_offset_byte.h
> +++ b/sound/soc/amd/acp/chip_offset_byte.h
> @@ -14,6 +14,12 @@
>   #define ACPAXI2AXI_ATU_CTRL                           0xC40
>   #define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5                0xC20
>   #define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5                0xC24
> +
> +#define ACP_PGFSM_CONTROL			0x141C
> +#define ACP_PGFSM_STATUS                        0x1420
> +#define ACP_SOFT_RESET                          0x1000
> +#define ACP_CONTROL                             0x1004
> +
>   #define ACP_EXTERNAL_INTR_ENB                         0x1800
>   #define ACP_EXTERNAL_INTR_CNTL                        0x1804
>   #define ACP_EXTERNAL_INTR_STAT                        0x1808

