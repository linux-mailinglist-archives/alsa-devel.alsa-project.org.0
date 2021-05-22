Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FED38D6AE
	for <lists+alsa-devel@lfdr.de>; Sat, 22 May 2021 19:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAB91682;
	Sat, 22 May 2021 19:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAB91682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621705299;
	bh=qbWo0cQMtLlVWiCJe6s7I6PbbWTkP4vGAclkUa/rcuc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fg/OtbnsLIZcdOF2UQBJCMomqBT1vj/fr7GcrGuJYF3GUeX/CHiy7yOPtzdxLOILl
	 p90WDRqfDdS1yG0rI20YVWhq3QqYoiWCJXuRTXlR0mrYLGYGUP90ML3Vj0GOSHGs0L
	 Lo3S6UrzCI2mjm/nvxe5suq0MqrvQk0enVkrbTiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2FEF800DF;
	Sat, 22 May 2021 19:40:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C92E7F80217; Sat, 22 May 2021 19:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBCB3F800DF
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 19:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBCB3F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="eazbXHWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621705202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6GRUfQ7toTMa5QoVTx0BLLhOXrwhuDv3dHLxh4TMh4=;
 b=eazbXHWoj0l8ri0tDd33jCWIVsQX/E3maza+lIOzwg60pmw2DGjUtUZhBqkm0D0LEMjngl
 tzn7akrjL2n+loDgJraQ5R73Be+g4yHolZMAYJkqp8sw4z7pnU1138YrERtfxLIl5ATCLP
 Ic/NboCmMUB9bDES9DepukkwFdbYT5E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-FldNNn5aMn-JG2azwtwJtQ-1; Sat, 22 May 2021 13:39:58 -0400
X-MC-Unique: FldNNn5aMn-JG2azwtwJtQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so13227266edv.12
 for <alsa-devel@alsa-project.org>; Sat, 22 May 2021 10:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q6GRUfQ7toTMa5QoVTx0BLLhOXrwhuDv3dHLxh4TMh4=;
 b=ahBNfo9snwH9j2F4QjWxokfcSMEG4K4dBeyQzQ+ikHVl2J7n1faIMByS1WpZhTVwKt
 dVgMyxOF4uStT1iOd8PeRlG2XVO5tZxSsy0zEQoVqRnO2/lCYGo/r3rXvpvuUCJSHHa0
 ML4AtOQ79NAfbMhfitpAMCCE1xWQr5xNteQWpVxdDGGVpL04CKRGVejBfuJ+CUoDMQsd
 QWGfMkBu8nGdTk+EZwtlGqxprzlGK/EGAjPirQXmXuKtXAEjZGcaHFJc1x9SVhezglFp
 Pkg1DZmz7ET+JyMx/iypNcBQhzjx9YnAVnMQBekH0bR+jcI849hryU1J8OBDirSLxdOj
 kKKw==
X-Gm-Message-State: AOAM531nI39Nh3PTSGLwWMLA+Tb8UaX63HGvNxDRVAGY3wqsrafH4RFV
 Z+WuP5qvYCoIXx+bTzAIl6nOhft5YcKJNgGc0vscEX3W0rYegP+BMsJTUlKpFGX9v2A4BlC5EvV
 oecejcmE98G4GLJbGcuiPoYug7NxOlD5Uqg0zgBsdZHUODAWrTRwWnhTfPajJWZUTKVfeeuSuAX
 g=
X-Received: by 2002:aa7:dc4a:: with SMTP id g10mr17531572edu.316.1621705196882; 
 Sat, 22 May 2021 10:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymVgzUdFnQBYxhHAhGpOdOtkG0BYLr85w0DgReMRnsGWhcVPAmfJTY7VD2m35ptvGoK+kjow==
X-Received: by 2002:aa7:dc4a:: with SMTP id g10mr17531546edu.316.1621705196673; 
 Sat, 22 May 2021 10:39:56 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id g21sm6492108edb.92.2021.05.22.10.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 May 2021 10:39:56 -0700 (PDT)
Subject: Re: [PATCH 3/8] iio: accel: bmc150: Move check for second ACPI device
 into a separate function
To: Jonathan Cameron <jic23@kernel.org>
References: <20210521171418.393871-1-hdegoede@redhat.com>
 <20210521171418.393871-4-hdegoede@redhat.com>
 <20210522183703.4328c4d8@jic23-huawei>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3e547192-928c-64dd-f2fe-7658f2f6f061@redhat.com>
Date: Sat, 22 May 2021 19:39:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210522183703.4328c4d8@jic23-huawei>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-iio@vger.kernel.org,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jeremy Cline <jeremy@jcline.org>, Mark Brown <broonie@kernel.org>
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

Hi,

On 5/22/21 7:37 PM, Jonathan Cameron wrote:
> On Fri, 21 May 2021 19:14:13 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Move the check for a second ACPI device for BOSC0200 ACPI fwnodes into
>> a new bmc150_acpi_dual_accel_probe() helper function.
>>
>> This is a preparation patch for adding support for a new "DUAL250E" ACPI
>> Hardware-ID (HID) used on some devices.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> A few places I'd like comments rewrapped on basis of still having
> a minor preference for a 80 chars limit unless there is a reason to
> do otherwise.
> 
> If this is all that turns up in the series, I can do that whilst
> applying.

Thank for the review.

If you can do the comment rewrapping while applying that would be
great, thanks. If a v2 is necessary I will take care of the 
rewrapping myself.

Regards,

Hans



> 
> Thanks,
> 
> Jonathan
> 
> 
>> ---
>>  drivers/iio/accel/bmc150-accel-i2c.c | 80 +++++++++++++++++-----------
>>  1 file changed, 49 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
>> index 2afaae0294ee..e24ce28a4660 100644
>> --- a/drivers/iio/accel/bmc150-accel-i2c.c
>> +++ b/drivers/iio/accel/bmc150-accel-i2c.c
>> @@ -21,6 +21,51 @@
>>  
>>  #include "bmc150-accel.h"
>>  
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
>> +	{"BOSC0200"},
>> +	{ },
>> +};
>> +
>> +/*
>> + * Some acpi_devices describe 2 accelerometers in a single ACPI device, try instantiating
> 
> 80 char wrap still preferred when it doesn't otherwise hurt readability.
> 
>> + * a second i2c_client for an I2cSerialBusV2 ACPI resource with index 1.
>> + */
>> +static void bmc150_acpi_dual_accel_probe(struct i2c_client *client)
>> +{
>> +	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>> +	struct i2c_client *second_dev;
>> +	struct i2c_board_info board_info = {
>> +		.type = "bmc150_accel",
>> +		/*
>> +		 * The 2nd accel sits in the base of 2-in-1s. Note this
>> +		 * name is static, as there should never be more then 1
>> +		 * BOSC0200 ACPI node with 2 accelerometers in it.
> 
> Given the lesser indent after pulling this out into a new function, it would
> be good to rewrap this text as nearer to 80 chars.
> 
>> +		 */
>> +		.dev_name = "BOSC0200:base",
>> +		.fwnode = client->dev.fwnode,
>> +		.irq = -ENOENT,
>> +	};
>> +
>> +	if (acpi_match_device_ids(adev, bmc150_acpi_dual_accel_ids))
>> +		return;
>> +
>> +	second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
>> +	if (!IS_ERR(second_dev))
>> +		bmc150_set_second_device(client, second_dev);
>> +}
>> +
>> +static void bmc150_acpi_dual_accel_remove(struct i2c_client *client)
>> +{
>> +	struct i2c_client *second_dev = bmc150_get_second_device(client);
>> +
>> +	i2c_unregister_device(second_dev);
>> +}
>> +#else
>> +static void bmc150_acpi_dual_accel_probe(struct i2c_client *client) {}
>> +static void bmc150_acpi_dual_accel_remove(struct i2c_client *client) {}
>> +#endif
>> +
>>  static int bmc150_accel_probe(struct i2c_client *client,
>>  			      const struct i2c_device_id *id)
>>  {
>> @@ -30,7 +75,6 @@ static int bmc150_accel_probe(struct i2c_client *client,
>>  		i2c_check_functionality(client->adapter, I2C_FUNC_I2C) ||
>>  		i2c_check_functionality(client->adapter,
>>  					I2C_FUNC_SMBUS_READ_I2C_BLOCK);
>> -	struct acpi_device __maybe_unused *adev;
>>  	int ret;
>>  
>>  	regmap = devm_regmap_init_i2c(client, &bmc150_regmap_conf);
>> @@ -46,42 +90,16 @@ static int bmc150_accel_probe(struct i2c_client *client,
>>  	if (ret)
>>  		return ret;
>>  
>> -	/*
>> -	 * Some BOSC0200 acpi_devices describe 2 accelerometers in a single ACPI
>> -	 * device, try instantiating a second i2c_client for an I2cSerialBusV2
>> -	 * ACPI resource with index 1. The !id check avoids recursion when
>> -	 * bmc150_accel_probe() gets called for the second client.
>> -	 */
>> -#ifdef CONFIG_ACPI
>> -	adev = ACPI_COMPANION(&client->dev);
>> -	if (!id && adev && strcmp(acpi_device_hid(adev), "BOSC0200") == 0) {
>> -		struct i2c_board_info board_info = {
>> -			.type = "bmc150_accel",
>> -			/*
>> -			 * The 2nd accel sits in the base of 2-in-1s. Note this
>> -			 * name is static, as there should never be more then 1
>> -			 * BOSC0200 ACPI node with 2 accelerometers in it.
>> -			 */
>> -			.dev_name = "BOSC0200:base",
>> -			.fwnode = client->dev.fwnode,
>> -			.irq = -ENOENT,
>> -		};
>> -		struct i2c_client *second_dev;
>> -
>> -		second_dev = i2c_acpi_new_device(&client->dev, 1, &board_info);
>> -		if (!IS_ERR(second_dev))
>> -			bmc150_set_second_device(client, second_dev);
>> -	}
>> -#endif
>> +	/* The !id check avoids recursion when probe() gets called for the second client. */
> 
> Won't hurt readability to wrap this to 80 chars as a multiline comment.
> 
>> +	if (!id && has_acpi_companion(&client->dev))
>> +		bmc150_acpi_dual_accel_probe(client);
>>  
>>  	return 0;
>>  }
>>  
>>  static int bmc150_accel_remove(struct i2c_client *client)
>>  {
>> -	struct i2c_client *second_dev = bmc150_get_second_device(client);
>> -
>> -	i2c_unregister_device(second_dev);
>> +	bmc150_acpi_dual_accel_remove(client);
>>  
>>  	return bmc150_accel_core_remove(&client->dev);
>>  }
> 

