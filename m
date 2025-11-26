Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174D0CB00E9
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4836020B;
	Tue,  9 Dec 2025 14:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4836020B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765286989;
	bh=MlT02GQ7CMP/AT621MdmGurXzngpl0+HfAiTojvD0xU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RIUjRXFptxJMhYC0MKzYOTnssLBnrvS1jc0SCuHYD4NHTe3mjjDAA/h/Wu3XGvbBE
	 uXmT7rt/o2PBbGQ7t2GTAwlDUSD7T6/DpASnbUB/7xR39T8g9ylXtPz6B7B7/zKs23
	 227rcJYaL8c5Az0pRHXpG58x7pn38zmSOBI62VEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3699AF805F5; Tue,  9 Dec 2025 14:29:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7187F805E7;
	Tue,  9 Dec 2025 14:29:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB4F9F80087; Wed, 26 Nov 2025 18:20:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD57FF80087
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 18:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD57FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JAd/IPow
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 005F5407C7;
	Wed, 26 Nov 2025 17:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E43C4CEF7;
	Wed, 26 Nov 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764177591;
	bh=MlT02GQ7CMP/AT621MdmGurXzngpl0+HfAiTojvD0xU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JAd/IPow1Fd0Vgk7KF9I3UzSzT0YyvuNv9p3wHuS38yi0HfAlIObXhSiZ+Ud8Bn/e
	 9VZlnnRHaRgVQcUDiGHKr4Twk0ofqV5UDUqqmS4bEnv+ozAFT7cqclsskJypZUH7d4
	 KkQdkLUJBOZytPr3gbP3YQ6/VUblazCzMnUbU9orciz3fxK2J6pEAYpJU3qBKc/28b
	 CW1H8Hv1oa70zt/BK6evRR9yfZaul8Q5UOVuAjUVD5TWzuXaFdTFR9LGBDhIgBpnHf
	 N8fNxwqzKNx4VHEPUbBJo4/pUdz2jkbtEyKTY4S8h3cDsj3IkEpE0hD91/Bl6KvUFQ
	 LxdgaIMIHLqVA==
Message-ID: <ce56da25-e8cb-4438-b75b-1dd32df10d89@kernel.org>
Date: Wed, 26 Nov 2025 18:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
References: <20251126141434.11110-1-baojun.xu@ti.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126141434.11110-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: hansg@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YAGDA6XDMB6AHG3JMQKSGUVJAYB4D6MW
X-Message-ID-Hash: YAGDA6XDMB6AHG3JMQKSGUVJAYB4D6MW
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:28:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YAGDA6XDMB6AHG3JMQKSGUVJAYB4D6MW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 26-Nov-25 3:14 PM, Baojun Xu wrote:
> The tas2781-hda supports multi-projects. In some projects, GpioInt() was
> dropped due to no IRQ connection. See the example code below:
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c), if
> looking for IRQ by smi_get_irq() fails, it will return an error, will not add
> new device, and cause smi_probe() to fail:
> 
> [    2.356546] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: IRQ index 0 not found
> [    2.356561] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: Error requesting irq at index 0
> 
> So, we need to add an exception case for these situations. BTW, this patch
> will take effect on both I2C and SPI devices.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
> v5:
>  - Change the description for this patch, remove cover letter.
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

