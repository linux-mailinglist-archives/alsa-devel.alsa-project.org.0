Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C259CD1C16
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Dec 2025 21:28:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B58601B1;
	Fri, 19 Dec 2025 21:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B58601B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766176136;
	bh=Byj8bUjf4UKJNHcqR/2slsG0RH9VXhkNMLILVj/YTbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YsBTwSCDQFv6cXWm1iEcLOWw3HK1ftM9ZCp2UcxYSQUCvADlrhPBzD0pUK5CwfiVz
	 vZW+5Z+ZR/jphMAZHu/Rob9y2DLnL2SZtTtys8dNXMf7+sLLeeEmKxR0rN11fdZDEh
	 tM/vrswLY/1B1R2KXiv7JOgecVVIHTpPDk6GKbuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84623F805D5; Fri, 19 Dec 2025 21:28:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FCE0F805D8;
	Fri, 19 Dec 2025 21:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CE3CF805C2; Fri, 19 Dec 2025 21:28:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 485DCF800FE
	for <alsa-devel@alsa-project.org>; Fri, 19 Dec 2025 21:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 485DCF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O1SGTvLF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F167B439AE;
	Fri, 19 Dec 2025 20:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5F6C4CEF1;
	Fri, 19 Dec 2025 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766176085;
	bh=Byj8bUjf4UKJNHcqR/2slsG0RH9VXhkNMLILVj/YTbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1SGTvLF9n2t7mr/7tN2l5SsnEFoZfVtJL7S0hhfTtUPUqtdt5EC47+EY9EQm3ntE
	 GBOfdR4mz8lz5h0pM79YFAE2CuRdehvtDRpd3NVUhWQogwm4fvv42DzZthKumHZleC
	 c6sx7QYJzJOJNNI8eNnnK8m0qAi/D7cgGPrOLnLn+x3s1QJNCaUcpQmFSEKTlPLxLd
	 lky1yMDh0zQl3Oa4Q0WztaNgW2E8h1IR6LEYcXAeId8sd1bKmuDqIGOanKJl69ktDB
	 vB/VjrQxHTOHWnhUEYMitiLfwtL00tqjtLybYqulc324y2Grcr4lQIxyZ1lhOV4brj
	 d0BNx/FKpgVVw==
Date: Fri, 19 Dec 2025 14:28:03 -0600
From: Rob Herring <robh@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: cezary.rojewski@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-spi@vger.kernel.org,
	perex@perex.cz, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	flove@realtek.com, shumingf@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH v10 1/3] spi: export of_find_spi_controller_by_node()
Message-ID: <20251219202803.GA3877108-robh@kernel.org>
References: <20251216071853.3929135-1-oder_chiou@realtek.com>
 <20251216071853.3929135-2-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216071853.3929135-2-oder_chiou@realtek.com>
Message-ID-Hash: QUYWRECLPO7YJTRBSERYAIIZH6UCM6H2
X-Message-ID-Hash: QUYWRECLPO7YJTRBSERYAIIZH6UCM6H2
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUYWRECLPO7YJTRBSERYAIIZH6UCM6H2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 16, 2025 at 03:18:51PM +0800, Oder Chiou wrote:
> Some devices are primarily described on another bus (e.g. I2C) but also
> have an additional SPI connection that serves as a transport for
> firmware loading. Export of_find_spi_controller_by_node() so drivers can
> obtain the SPI controller referenced by a DT phandle.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  drivers/spi/spi.c       |  3 ++-
>  include/linux/spi/spi.h | 11 +++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index e25df9990f82..ecb5281b04a2 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4771,7 +4771,7 @@ static struct spi_device *of_find_spi_device_by_node(struct device_node *node)
>  }
>  
>  /* The spi controllers are not using spi_bus, so we find it with another way */
> -static struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
> +struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
>  {
>  	struct device *dev;
>  
> @@ -4784,6 +4784,7 @@ static struct spi_controller *of_find_spi_controller_by_node(struct device_node
>  	/* Reference got in class_find_device */
>  	return container_of(dev, struct spi_controller, dev);
>  }
> +EXPORT_SYMBOL_GPL(of_find_spi_controller_by_node);
>  
>  static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>  			 void *arg)
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index cb2c2df31089..1eb04a96cc1c 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -882,6 +882,17 @@ extern int devm_spi_register_controller(struct device *dev,
>  					struct spi_controller *ctlr);
>  extern void spi_unregister_controller(struct spi_controller *ctlr);
>  
> +#if IS_ENABLED(CONFIG_OF_DYNAMIC)

This has nothing to do with CONFIG_OF_DYNAMIC. CONFIG_OF is what you 
want, and there's probably a section for that already.

> +extern struct spi_controller *of_find_spi_controller_by_node(
> +	struct device_node *node);
> +#else
> +static inline struct spi_controller *of_find_spi_controller_by_node(
> +	struct device_node *node)
> +{
> +	return NULL;
> +}
> +#endif
> +
>  #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SPI_MASTER)
>  extern struct spi_controller *acpi_spi_find_controller_by_adev(struct acpi_device *adev);
>  extern struct spi_device *acpi_spi_device_alloc(struct spi_controller *ctlr,
> -- 
> 2.52.0
> 
