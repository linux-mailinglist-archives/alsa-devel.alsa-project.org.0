Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1427E81D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 14:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852E917D7;
	Wed, 30 Sep 2020 14:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852E917D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601467267;
	bh=j7TyWiQ46A8cgocAOXeM5f1+0eI0qyuI4IcopJ3Xq28=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NulXkJEV0GpL5aSUKZLrnmB7YGYdZRSpA7krHuVkwPU02ddsPjbkycRlNUuxvcG1p
	 is1BMG3Y8vtl1FLYrj+IkRWjHvSH+JvLlByek2WDAloIkwrpmGpYgkhKt51OM3T/aX
	 mp8Qt4GmKd5RYFlWBDm1gdIeUAdKyF+CfKox+M2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A486DF800DF;
	Wed, 30 Sep 2020 13:59:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A736F801ED; Wed, 30 Sep 2020 13:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8F50F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 13:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F50F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i8situxT"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3967A2075F;
 Wed, 30 Sep 2020 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601467152;
 bh=j7TyWiQ46A8cgocAOXeM5f1+0eI0qyuI4IcopJ3Xq28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8situxT7lHaqrW5D0ijbVCB0KIfk7XFB0RvE6AjJrbs5RQx3g7M6s91yj5s8zvx2
 noAxcYVL7Uks2NrVIGmIHd18W2m90leiGA2lHQHXx2cR+U9MlQs7EYqahR89rQXa6j
 dluo5/yAcjNy0jJjOzht9zpX+qLp3jcb0L87T61E=
Date: Wed, 30 Sep 2020 13:59:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] regmap: add support to
 regmap_field_bulk_alloc/free apis
Message-ID: <20200930115915.GB1611809@kroah.com>
References: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
 <20200925164856.10315-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925164856.10315-2-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 rohitkr@codeaurora.org, rafael@kernel.org
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

On Fri, Sep 25, 2020 at 05:48:55PM +0100, Srinivas Kandagatla wrote:
> Usage of regmap_field_alloc becomes much overhead when number of fields
> exceed more than 3.
> QCOM LPASS driver has extensively converted to use regmap_fields.
> 
> Using new bulk api to allocate fields makes it much more cleaner code to read!
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  drivers/base/regmap/regmap.c | 100 +++++++++++++++++++++++++++++++++++
>  include/linux/regmap.h       |  11 ++++
>  2 files changed, 111 insertions(+)
> 
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index aec3f26bf711..8d6aedce666d 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1270,6 +1270,106 @@ struct regmap_field *devm_regmap_field_alloc(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_regmap_field_alloc);
>  
> +
> +/**
> + * regmap_field_bulk_alloc() - Allocate and initialise a bulk register field.
> + *
> + * @regmap: regmap bank in which this register field is located.
> + * @rm_field: regmap register fields within the bank.
> + * @reg_field: Register fields within the bank.
> + * @num_fields: Number of register fields.
> + *
> + * The return value will be an -ENOMEM on error or zero for success.
> + * Newly allocated regmap_fields should be freed by calling
> + * regmap_field_bulk_free()
> + */
> +int regmap_field_bulk_alloc(struct regmap *regmap,
> +			    struct regmap_field **rm_field,
> +			    struct reg_field *reg_field,
> +			    int num_fields)
> +{
> +	struct regmap_field *rf;
> +	int i;
> +
> +	rf = kcalloc(num_fields, sizeof(*rf), GFP_KERNEL);
> +	if (!rf)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_fields; i++) {
> +		regmap_field_init(&rf[i], regmap, reg_field[i]);
> +		rm_field[i] = &rf[i];
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(regmap_field_bulk_alloc);
> +
> +/**
> + * devm_regmap_field_bulk_alloc() - Allocate and initialise a bulk register
> + * fields.
> + *
> + * @dev: Device that will be interacted with
> + * @regmap: regmap bank in which this register field is located.
> + * @rm_field: regmap register fields within the bank.
> + * @reg_field: Register fields within the bank.
> + * @num_fields: Number of register fields.
> + *
> + * The return value will be an -ENOMEM on error or zero for success.
> + * Newly allocated regmap_fields will be automatically freed by the
> + * device management code.
> + */
> +int devm_regmap_field_bulk_alloc(struct device *dev,
> +				 struct regmap *regmap,
> +				 struct regmap_field **rm_field,
> +				 struct reg_field *reg_field,
> +				 int num_fields)
> +{
> +	struct regmap_field *rf;
> +	int i;
> +
> +	rf = devm_kcalloc(dev, num_fields, sizeof(*rf), GFP_KERNEL);
> +	if (!rf)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_fields; i++) {
> +		regmap_field_init(&rf[i], regmap, reg_field[i]);
> +		rm_field[i] = &rf[i];
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_alloc);
> +
> +/**
> + * regmap_field_bulk_free() - Free register field allocated using
> + *                       regmap_field_bulk_alloc.
> + *
> + * @field: regmap fields which should be freed.
> + */
> +void regmap_field_bulk_free(struct regmap_field *field)
> +{
> +	kfree(field);
> +}
> +EXPORT_SYMBOL_GPL(regmap_field_bulk_free);
> +
> +/**
> + * devm_regmap_field_bulk_free() - Free a bulk register field allocated using
> + *                            devm_regmap_field_bulk_alloc.
> + *
> + * @dev: Device that will be interacted with
> + * @field: regmap field which should be freed.
> + *
> + * Free register field allocated using devm_regmap_field_bulk_alloc(). Usually
> + * drivers need not call this function, as the memory allocated via devm
> + * will be freed as per device-driver life-cycle.
> + */
> +void devm_regmap_field_bulk_free(struct device *dev,
> +				 struct regmap_field *field)
> +{
> +	devm_kfree(dev, field);
> +}
> +EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_free);
> +
>  /**
>   * devm_regmap_field_free() - Free a register field allocated using
>   *                            devm_regmap_field_alloc.
> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
> index 0c49d59168b5..a35ec0a0d6e0 100644
> --- a/include/linux/regmap.h
> +++ b/include/linux/regmap.h
> @@ -1189,6 +1189,17 @@ struct regmap_field *devm_regmap_field_alloc(struct device *dev,
>  		struct regmap *regmap, struct reg_field reg_field);
>  void devm_regmap_field_free(struct device *dev,	struct regmap_field *field);
>  
> +int regmap_field_bulk_alloc(struct regmap *regmap,
> +			     struct regmap_field **rm_field,
> +			     struct reg_field *reg_field,
> +			     int num_fields);
> +void regmap_field_bulk_free(struct regmap_field *field);
> +int devm_regmap_field_bulk_alloc(struct device *dev, struct regmap *regmap,
> +				 struct regmap_field **field,
> +				 struct reg_field *reg_field, int num_fields);
> +void devm_regmap_field_bulk_free(struct device *dev,
> +				 struct regmap_field *field);
> +

You only have a patch that uses these last two functions, so why add all
4?  We don't add infrastructure to the kernel without users.

thanks,

greg k-h
