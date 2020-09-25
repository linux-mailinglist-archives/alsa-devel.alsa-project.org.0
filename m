Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC8278997
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 15:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C06318B7;
	Fri, 25 Sep 2020 15:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C06318B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601040711;
	bh=H2koyWcwGAeiNuTkEFocWvMIuIN9FcH6QUenMEacbh4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGV2X4J9narBNXQYZ9VGkO1pNOWOu+TDApCocga+5Q6tGUB2/rl/nwYR9IsHm8xFa
	 C/ORUi14W0dY3mZLpW/1V/MiPXA5owTP/ipDZo2w3c7n1FIKSwyBbagBCJgeYe59Vs
	 ucfAPS/DTp74Ypf4WinkTOtma4jz8FHAoSbFc/oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC1CCF80171;
	Fri, 25 Sep 2020 15:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0C4AF801EB; Fri, 25 Sep 2020 15:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D102CF80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 15:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D102CF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WBrerB/M"
Received: by mail-wm1-x343.google.com with SMTP id b79so3304476wmb.4
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LKgAHRfN+eHECSVlw1KuISgeU4iNFfAN7rqXC9yOTKI=;
 b=WBrerB/MreAxoJ1QeOKOEEptz/xwVe+hBiEdURpBhtbhPOgTssqLMflehzZzh2OknM
 pOZBvPRMNo+lw/KcCv4VS9lB/0pza9ag0HnsEOwjJcYALJHodkSkk5Hw9wxFPVfqr7I/
 Bw2FrIUdhg6Ij8nAOiVmeqmzo6IHjlcPRRVrQvrFoWtxR7krIabZMJQbe0FOzwj4/9C5
 rmJR9TnDr0LTj9QWnwiSe2gED1K3nfDDkID35p4rX2TXr5wStq+rCrVuwfOdwv4SDjPE
 wkSt8cWJnCBc2OTXUwsVyWJZkhFv6WFQQ3KE8w/riJ6nA7ZWZkxItSG7wVvXtUzxJKEX
 i9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LKgAHRfN+eHECSVlw1KuISgeU4iNFfAN7rqXC9yOTKI=;
 b=XLOTzr6gJKGN4yiDRpDfMapnluVzoZQfhAffGaj2wvRGZD1BgWtL80h+TiQ3nggryE
 GbV2AOvlUyD0f3cC8i/xcNw/cC430c14C9nfamBFXk9S/Ov2c8i5KMuS/UnTk4dHYPqY
 rfbs0ieKs7VOAoNKfQruow5cfnLott7FAt3y3SzlNSB737AyS54WQv1Zk94g9/s3CM6Y
 k0044aWTDjSs3w6rHdBXHo1a6TxeVi+sWXptDL8nd9yoaiLYYvUNvBaKN0tS0poxn9xM
 M6t5xEzj16JapaHPe/pMsnnSO8JMGnvc/LaTATYRMmvIRAQft9my55EiapDvz1/9A/fu
 x1pw==
X-Gm-Message-State: AOAM530bqUaOzxPF1LjclUatsTKR3XYnK12+WIHrBrzHlzqpy0e/XJ0Z
 ey3XKLw4EKOBA4UFzQKobAcO+Q==
X-Google-Smtp-Source: ABdhPJwjuweijitPqDCHIBWQ+ugr+ah1WtJ/rc1QqofU+wJnhxzqbtWf4gDvVL6M/7/PUmcO+OtDdQ==
X-Received: by 2002:a7b:cb07:: with SMTP id u7mr3059602wmj.57.1601040585233;
 Fri, 25 Sep 2020 06:29:45 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id e13sm2980466wre.60.2020.09.25.06.29.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 06:29:44 -0700 (PDT)
Subject: Re: [PATCH 1/2] regmap: add support to regmap_field_bulk_alloc/free
 apis
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200925092804.23536-1-srinivas.kandagatla@linaro.org>
 <20200925092804.23536-2-srinivas.kandagatla@linaro.org>
 <eb7af426-ab00-b444-e578-cf3c4b329c95@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6c13fb62-1a45-0a28-4be7-f09e2eac2287@linaro.org>
Date: Fri, 25 Sep 2020 14:29:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb7af426-ab00-b444-e578-cf3c4b329c95@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, rafael@kernel.org,
 gregkh@linuxfoundation.org, tiwai@suse.com, lgirdwood@gmail.com,
 rohitkr@codeaurora.org, linux-kernel@vger.kernel.org
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

Thanks Pierre,

On 25/09/2020 14:12, Pierre-Louis Bossart wrote:
> 
> 
> On 9/25/20 4:28 AM, Srinivas Kandagatla wrote:
>> Usage of regmap_field_alloc becomes much overhead when number of fields
>> exceed more than 3.
>> QCOM LPASS driver has extensively converted to use regmap_fileds.
> 
> Multiple typos scattered in this patch: fileds -> fields?
> 
thanks for checking this, I will fix that in next spin!

--srini
>>
>> Using new bluk api to allocate fields makes it much more cleaner code 
>> to read!
> 
> bulk api?
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Tested-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   drivers/base/regmap/regmap.c | 100 +++++++++++++++++++++++++++++++++++
>>   include/linux/regmap.h       |  11 ++++
>>   2 files changed, 111 insertions(+)
>>
>> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
>> index aec3f26bf711..271740a163ad 100644
>> --- a/drivers/base/regmap/regmap.c
>> +++ b/drivers/base/regmap/regmap.c
>> @@ -1270,6 +1270,106 @@ struct regmap_field 
>> *devm_regmap_field_alloc(struct device *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(devm_regmap_field_alloc);
>> +
>> +/**
>> + * regmap_field_bulk_alloc() - Allocate and initialise a bulk 
>> register field.
>> + *
>> + * @regmap: regmap bank in which this register field is located.
>> + * @rm_field: regmap register fileds with in the bank.
>> + * @reg_field: Register fields with in the bank.
>> + * @num_fields: Number of register fileds.
>> + *
>> + * The return value will be an -ENOMEM on error or zero for success.
>> + * Newly allocated regmap_fields should be freed by calling
>> + * regmap_field_bulk_free()
>> + */
>> +int regmap_field_bulk_alloc(struct regmap *regmap,
>> +                struct regmap_field **rm_field,
>> +                struct reg_field *reg_field,
>> +                int num_fields)
>> +{
>> +    struct regmap_field *rf;
>> +    int i;
>> +
>> +    rf = kcalloc(num_fields, sizeof(*rf), GFP_KERNEL);
>> +    if (!rf)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < num_fields; i++) {
>> +        regmap_field_init(&rf[i], regmap, reg_field[i]);
>> +        rm_field[i] = &rf[i];
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(regmap_field_bulk_alloc);
>> +
>> +/**
>> + * devm_regmap_field_bulk_alloc() - Allocate and initialise a bulk 
>> register
>> + * fields.
>> + *
>> + * @dev: Device that will be interacted with
>> + * @regmap: regmap bank in which this register field is located.
>> + * @rm_field: regmap register fileds with in the bank.
>> + * @reg_field: Register fields with in the bank.
> 
> within?
> 
>> + * @num_fields: Number of register fileds.
>> + *
>> + * The return value will be an -ENOMEM on error or zero for success.
>> + * Newly allocated regmap_fields will be automatically freed by the
>> + * device management code.
>> + */
>> +int devm_regmap_field_bulk_alloc(struct device *dev,
>> +                 struct regmap *regmap,
>> +                 struct regmap_field **rm_field,
>> +                 struct reg_field *reg_field,
>> +                 int num_fields)
>> +{
>> +    struct regmap_field *rf;
>> +    int i;
>> +
>> +    rf = devm_kcalloc(dev, num_fields, sizeof(*rf), GFP_KERNEL);
>> +    if (!rf)
>> +        return -ENOMEM;
>> +
>> +    for (i = 0; i < num_fields; i++) {
>> +        regmap_field_init(&rf[i], regmap, reg_field[i]);
>> +        rm_field[i] = &rf[i];
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_alloc);
>> +
>> +/**
>> + * regmap_field_bulk_free() - Free register field allocated using
>> + *                       regmap_field_bulk_alloc.
>> + *
>> + * @field: regmap fields which should be freed.
>> + */
>> +void regmap_field_bulk_free(struct regmap_field *field)
>> +{
>> +    kfree(field);
>> +}
>> +EXPORT_SYMBOL_GPL(regmap_field_bulk_free);
>> +
>> +/**
>> + * devm_regmap_field_bulk_free() - Free a bulk register field 
>> allocated using
>> + *                            devm_regmap_field_bulk_alloc.
>> + *
>> + * @dev: Device that will be interacted with
>> + * @field: regmap field which should be freed.
>> + *
>> + * Free register field allocated using 
>> devm_regmap_field_bulk_alloc(). Usually
>> + * drivers need not call this function, as the memory allocated via devm
>> + * will be freed as per device-driver life-cyle.
>> + */
>> +void devm_regmap_field_bulk_free(struct device *dev,
>> +                 struct regmap_field *field)
>> +{
>> +    devm_kfree(dev, field);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_free);
>> +
>>   /**
>>    * devm_regmap_field_free() - Free a register field allocated using
>>    *                            devm_regmap_field_alloc.
>> diff --git a/include/linux/regmap.h b/include/linux/regmap.h
>> index 0c49d59168b5..a35ec0a0d6e0 100644
>> --- a/include/linux/regmap.h
>> +++ b/include/linux/regmap.h
>> @@ -1189,6 +1189,17 @@ struct regmap_field 
>> *devm_regmap_field_alloc(struct device *dev,
>>           struct regmap *regmap, struct reg_field reg_field);
>>   void devm_regmap_field_free(struct device *dev,    struct 
>> regmap_field *field);
>> +int regmap_field_bulk_alloc(struct regmap *regmap,
>> +                 struct regmap_field **rm_field,
>> +                 struct reg_field *reg_field,
>> +                 int num_fields);
>> +void regmap_field_bulk_free(struct regmap_field *field);
>> +int devm_regmap_field_bulk_alloc(struct device *dev, struct regmap 
>> *regmap,
>> +                 struct regmap_field **field,
>> +                 struct reg_field *reg_field, int num_fields);
>> +void devm_regmap_field_bulk_free(struct device *dev,
>> +                 struct regmap_field *field);
>> +
>>   int regmap_field_read(struct regmap_field *field, unsigned int *val);
>>   int regmap_field_update_bits_base(struct regmap_field *field,
>>                     unsigned int mask, unsigned int val,
>>
