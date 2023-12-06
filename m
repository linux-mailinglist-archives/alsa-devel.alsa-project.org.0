Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C500B807270
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:31:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C98E1FA;
	Wed,  6 Dec 2023 15:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C98E1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701873066;
	bh=OUT+LX4QTTAaJqsTXiXGh6P4k6FGfEMdkAHL5GUJshE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MuEhdW6Vk8X38rTXXstkATdyNZ9W4K4efB/aqPLwDsawK5ktgYGxbM4XsjoFygpv1
	 hNC7pPLU8SYQSOc86/KMrX7w4UCAyyKV5yrtPWFhlJlHWJFmwOSfJ3LHDK4IZTsLTX
	 3LRfCkZ7pRz+uOxD+wBHR3SRwuOTeN3VE4RNjTY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8705FF80568; Wed,  6 Dec 2023 15:30:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1535BF80570;
	Wed,  6 Dec 2023 15:30:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABCF5F8024E; Wed,  6 Dec 2023 15:30:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F270F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F270F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qWXjO5UC
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9f572c4c5so64178331fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Dec 2023 06:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701873013; x=1702477813;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ecDK9XgOWPDwKNtXxUXDKXSM0zmyupQJGPO18jvHP6A=;
        b=qWXjO5UCHT2ghMqC2XxL+cZINBT5YF6NLcSNvsVDp6aNMvzIgKxErKVZRvrjohXv7M
         sDaZNZq4+aZ3pMpHp5y79QdTmFIE+SGfkYREl3kt4DCHX/lBifFjZXNIti9SeA9Fx1of
         PtZdX4D8U7poXdlTOQxPG1VDmyor3nhwhAD7io95QAww0Koi2Gnz73YNCN7PS06JLeof
         N5feZXDUTxPMvqw6DVd9VjO5kuonZIgKFQLomr02Qp/eAEPUAzH70/f9LpoJVJznLeyY
         ePRbAg28fh/o45Jj87TLfgPyXUrrk1VTF/MSh2O0uU5zDKtEK1GCcNjjwqbXozWQ/FNT
         SEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873013; x=1702477813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecDK9XgOWPDwKNtXxUXDKXSM0zmyupQJGPO18jvHP6A=;
        b=ouo7TT0oIbc6LuP0RmZGcBpdr+i9rUvgVWwWAIz9Fy+XeMLikKK2g6wYRV7b14P2EC
         jt7Q8cj+q2XA4HZaUNxMQcSVC+y+KFTlBkYYrKBf8Oq7tYOCgbj8twJQSwyyYT+nCy+D
         VzOAgQAukfazopH9PoKcblvSKq7RXX8KKwxL94sLriWYvWXGtBUNJEjWwlxXh521jzZm
         p1r2H22wrS3S8vT1OanB591Ir8acipZ9CaJpYMtwsr+PzzXGaWSwVHU3ddSqH2T37kUs
         1PtEE3qI46y4fj4JdixUbdhGKD0aA1xnEZFJXFvi2gl8qh5nZ8yvcmSF6SEA2g2DjVlz
         h8qA==
X-Gm-Message-State: AOJu0Ywnp+POqtsSl/O51AqRem9M90Q+V65TpKN0PhyLIhNDvvHmgpoJ
	AC6GPXEj74WdtCP6jt29CEOqhA==
X-Google-Smtp-Source: 
 AGHT+IFFLwb6J1kg4M4UnYbam4jWK0loSvNCLNafUtgmro7h6iWF18QP/GUyGS9AQ5j9Y3MfsdsiMQ==
X-Received: by 2002:a05:6512:29a:b0:50c:d30:3a05 with SMTP id
 j26-20020a056512029a00b0050c0d303a05mr695875lfp.25.1701873013467;
        Wed, 06 Dec 2023 06:30:13 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id
 gs20-20020a170906f19400b00a18374ade6bsm8391001ejb.67.2023.12.06.06.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:30:12 -0800 (PST)
Message-ID: <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
Date: Wed, 6 Dec 2023 14:30:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com,
 amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LI5FQTXHSEBM5X3ENRN73PHLZIWLKQQ5
X-Message-ID-Hash: LI5FQTXHSEBM5X3ENRN73PHLZIWLKQQ5
X-MailFrom: tudor.ambarus@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LI5FQTXHSEBM5X3ENRN73PHLZIWLKQQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, Amit,

On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> Each flash that is connected in stacked mode should have a separate
> parameter structure. So, the flash parameter member(*params) of the spi_nor
> structure is changed to an array (*params[2]). The array is used to store
> the parameters of each flash connected in stacked configuration.
> 
> The current implementation assumes that a maximum of two flashes are
> connected in stacked mode and both the flashes are of same make but can
> differ in sizes. So, except the sizes all other flash parameters of both
> the flashes are identical.

Do you plan to add support for different flashes in stacked mode? If
not, wouldn't it be simpler to have just an array of flash sizes instead
of duplicating the entire params struct?

> 
> SPI-NOR is not aware of the chip_select values, for any incoming request
> SPI-NOR will decide the flash index with the help of individual flash size
> and the configuration type (single/stacked). SPI-NOR will pass on the flash
> index information to the SPI core & SPI driver by setting the appropriate
> bit in nor->spimem->spi->cs_index_mask. For example, if nth bit of
> nor->spimem->spi->cs_index_mask is set then the driver would
> assert/de-assert spi->chip_slect[n].
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
>  drivers/mtd/spi-nor/core.h  |   4 +
>  include/linux/mtd/spi-nor.h |  15 +-
>  3 files changed, 240 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 93ae69b7ff83..e990be7c7eb6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

cut

> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>  static int spi_nor_late_init_params(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
> -	int ret;
> +	struct device_node *np = spi_nor_get_flash_node(nor);
> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> +	u32 idx = 0;
> +	int rc, ret;
>  
>  	if (nor->manufacturer && nor->manufacturer->fixups &&
>  	    nor->manufacturer->fixups->late_init) {
> @@ -2937,6 +3042,44 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
>  	if (params->n_banks > 1)
>  		params->bank_size = div64_u64(params->size, params->n_banks);
>  
> +	nor->num_flash = 0;
> +
> +	/*
> +	 * The flashes that are connected in stacked mode should be of same make.
> +	 * Except the flash size all other properties are identical for all the
> +	 * flashes connected in stacked mode.
> +	 * The flashes that are connected in parallel mode should be identical.
> +	 */
> +	while (idx < SNOR_FLASH_CNT_MAX) {
> +		rc = of_property_read_u64_index(np, "stacked-memories", idx, &flash_size[idx]);

This is a little late in my opinion, as we don't have any sanity check
on the flashes that are stacked on top of the first. We shall at least
read and compare the ID for all.

Cheers,
ta
