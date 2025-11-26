Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F174C8A498
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F9B60200;
	Wed, 26 Nov 2025 15:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F9B60200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166852;
	bh=Ob6QmmWDh4oiB6gP8J9QjMFjK/AEovlZGaBM6iIehtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8FfmBo0FQX72WfHxQAvao+qVRyv5YIsHYL8vYsPHGJro1ItZHwDFUS3eLBm0nRQL
	 oSYpZ1NlI2h/u1cdUGHA8gR44087XpkssjnkeaoH/U9scvopyKo/0q3mSswa+SuxoR
	 bNVRMx6eA906OdhcJcjkodkLJAUQMTWjQkAAoOlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4CD1F805B4; Wed, 26 Nov 2025 15:19:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 644A2F8067F;
	Wed, 26 Nov 2025 15:19:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45CD8F8047D; Wed, 26 Nov 2025 13:29:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0059BF800AE
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 13:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0059BF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r/HYW43V
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C57B96001D;
	Wed, 26 Nov 2025 12:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B93C113D0;
	Wed, 26 Nov 2025 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764160139;
	bh=Ob6QmmWDh4oiB6gP8J9QjMFjK/AEovlZGaBM6iIehtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r/HYW43V7mF+I82OwalGBXKAAsnW64//dqGt/1BpzVWUFDfgO+7pBsv8eCPQwA2zQ
	 o/u7y7tOv8l29xvXkz/+locaLv4m/7I4/AL++JDuSGiHPJyazLJUBqTqQ5CN/xb3gr
	 J+iSVztuF2t+I5m8i77tLnazWKpqsg/lsxKVqyXQfLaV6827TyPpI8Exz5/riOflo6
	 D26hKzwJtSy9xhapQ5sHF8/9ICfdO2a8oLvNCbw6lF75v+qZbwnCE5cXBruJWxUD7t
	 2mZrC7gUK2AYiq569njVzvzEi1DF74jmgkVJRJsYUXuRecj58NVTNVcYhFD7QgbPaP
	 JYiArrFV/E2cw==
Message-ID: <9b2dca55-1207-48a3-94b0-3efad1462d0f@kernel.org>
Date: Wed, 26 Nov 2025 13:28:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
References: <20251126121911.10980-1-baojun.xu@ti.com>
 <20251126121911.10980-2-baojun.xu@ti.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126121911.10980-2-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: hansg@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C7VDLYLDAHUH3QUFJAR4HJWG2WWMMASN
X-Message-ID-Hash: C7VDLYLDAHUH3QUFJAR4HJWG2WWMMASN
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7VDLYLDAHUH3QUFJAR4HJWG2WWMMASN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 26-Nov-25 1:19 PM, Baojun Xu wrote:
> The tas2781-hda supports multi-projects. In some projects,
> GpioInt() was dropped due to no IRQ connection.

> See the example code in the cover letter.

Please don't do this, the example code is not that big, people
should not need to go and hunt down the example code, please just
add it to the commit message.

Also please use longer lines (wrap at 75 chars) for the commit msg
and please use empty lines between paragraphs to clearly separate
the paragraphs.

Regards,

Hans



> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
> if looking for IRQ by smi_get_irq() fails, it will return an error,
> will not add new device, and cause smi_probe() to fail.
> So, we need to add an exception case for these situations.
> BTW, this patch will take effect on both I2C and SPI devices.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
> v4:
>  - Change the description for this patch.
> v3:
>  - Add IRQ_RESOURCE_OPT for IRQ missing cases.
> v2:
>  - Remove error ignore, change to AUTO compatible with NONE.
> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index db030b0f176a..1a369334f9cb 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -22,6 +22,7 @@
>  #define IRQ_RESOURCE_GPIO	1
>  #define IRQ_RESOURCE_APIC	2
>  #define IRQ_RESOURCE_AUTO   3
> +#define IRQ_RESOURCE_OPT	BIT(2)
>  
>  enum smi_bus_type {
>  	SMI_I2C,
> @@ -64,6 +65,10 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
>  			dev_dbg(&pdev->dev, "Using platform irq\n");
>  			break;
>  		}
> +		if (inst->flags & IRQ_RESOURCE_OPT) {
> +			dev_dbg(&pdev->dev, "No irq\n");
> +			return 0;
> +		}
>  		break;
>  	case IRQ_RESOURCE_GPIO:
>  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
> @@ -386,10 +391,10 @@ static const struct smi_node cs35l57_hda = {
>  
>  static const struct smi_node tas2781_hda = {
>  	.instances = {
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
>  		{}
>  	},
>  	.bus_type = SMI_AUTO_DETECT,

