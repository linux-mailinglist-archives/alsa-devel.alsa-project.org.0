Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF018F36B
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 12:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5181616;
	Mon, 23 Mar 2020 12:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5181616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584961712;
	bh=aR29Wwc5NvqRIvz+Lm+JxEBx7hszqeMXrMYqIL8b9/w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ad/HwIkKRypy5iV0Z1MIAzeyF/E7+b0jXKVhcZOsCZvidhdFcPnqoPxh4gHjTMzJh
	 f+OOLkoAynsr1hfeIaLEm1FBwzYfeD5DS2ys2Bupqm+ZisJAkbXANKlndZyRKugA12
	 Z5TiBvCi0p+ufRCQV/qtParRDsy9tiV+WUd00KUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B87F80095;
	Mon, 23 Mar 2020 12:06:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340A4F80158; Mon, 23 Mar 2020 12:06:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 641D1F800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 12:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 641D1F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X0+1VVVM"
Received: by mail-wr1-x441.google.com with SMTP id p10so4059278wrt.6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Er8BkFvrkbutAIsxZ2qgsGDlEnEu7wRCnc9YCCFbbUc=;
 b=X0+1VVVMtV2hIegOag7zAPIk8/+C8rPhAgxFufcXS7+NMtf/lxcFpKfW7BZKk++De9
 gHWudTy6UFihNkvnw7wDLwuAxko0QUCwWDcoCdPbxpwMjgGCd2E764AYEIKIe5Do97s8
 9MiN2jX8BhoIqbBraxVaXoVZVYf+ejVbhv4hKeqhu7n5H7VKkIDmupwW+Q2QYAdlm1fz
 /tdGSA496wBJab+1T0+zYqtfMtbMyfcUyJmlG8gwNOCCJP/Aznhm81Avmn1YygDVjx7W
 hapU3tjsHKxRYQ6MV71L71Nd0OcFciVTLiOn+i2iIeM+KWbLjWExEx2JY2xjPoLvHDlg
 GEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Er8BkFvrkbutAIsxZ2qgsGDlEnEu7wRCnc9YCCFbbUc=;
 b=eld70AtXjCFmwrqiejM8JXINMB5VLnxyLHoeF/Jgoewf5IaVSP6BTwla492RX92+Sq
 +QVMvYDxEAobbCn+evQp7HoVpOWog1TPs4NskVhE7lQHCz6C2qXnrlTP2VXLhjpdEm//
 DO9VSOVHAgqX1/TIPY0GjnZpK2+9rK6UubAhoJ0FN1cmje5cOyInwSLG0YWtZQJtxTTN
 bi+kuCLHrbx3xSzHR06r5zUmLImk6Z++W5bpUc00N6/x60CJc40+dX2VXOjSbzBOK45l
 Kd9qBJp4RpqEkj+mgCGk7jVGlv9T8LHpCs1FOO22MjkRUpqOpyhzyfk5gc41y1EKEHkB
 oe/w==
X-Gm-Message-State: ANhLgQ36A8yx03HY97olKW1M1TJdGIYj966iwn4885Y6fESNu18SyUvU
 gmSf1/ic4mwjZ7xbZ0xnxw1mng==
X-Google-Smtp-Source: ADFU+vuyYane3dXBPxqNCHWzuraJqqQhIXW6GbtYUlNjab8YXXbUDUWBPwjYHZXpgEgCDDNc4sg6vQ==
X-Received: by 2002:adf:e650:: with SMTP id b16mr12659383wrn.328.1584961606042; 
 Mon, 23 Mar 2020 04:06:46 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h26sm19401729wmb.19.2020.03.23.04.06.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 23 Mar 2020 04:06:45 -0700 (PDT)
Subject: Re: [PATCH 1/5] soundwire: bus_type: add master_device/driver support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-2-pierre-louis.bossart@linux.intel.com>
 <5d78f0f8-7418-e50e-6f0b-dd6988224744@linaro.org>
 <626a074b-06a9-01a0-334f-3aaed1f7ed76@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <286e7ae2-6677-1d92-5ae2-9250d3ff7a9d@linaro.org>
Date: Mon, 23 Mar 2020 11:06:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <626a074b-06a9-01a0-334f-3aaed1f7ed76@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 20/03/2020 18:17, Pierre-Louis Bossart wrote:
> Thanks for the quick review Srinivas,
> 
>> This patch in general is missing device tree support for both matching 
>> and uevent so this will not clearly work for Qualcomm controller 
>> unless we do via platform bus, which does not sound right!
> 
> see other email, the platform bus is handled by a platform 
> device/driver. There was no intention to change that, it's by design 
> rather than an omission/error.

I understand this partly now!

This can be probably made better/clear by:
renaming sdw_master_device_add to sdw_master_alloc and do a 
device_initialize() as part of this function in subsequent call to 
sdw_add_bus_master() we can do a device_add(). Doing this way will avoid 
a bit of unnecessary call to device_unregister by the controller driver, 
tbh which is confusing.

If the intended call sequence for controller is this (by keeping the 
parent bus type intact):

sdw_master_alloc/sdw_master_device_add()
sdw_add_bus_master()

Then we should also remove sdw_unregister_master_driver() and 
module_sdw_master_driver() all together. Having them makes the reader 
think that they can use module_sdw_master_driver directly without any 
parent bus like platform bus in this case.


>>> +
>>> +/**
>>> + * sdw_master_device_startup() - startup hardware
>>> + * @md: Linux Soundwire master device
>>> + *
>>> + * This use of this function is optional. It is only needed if the
>>> + * hardware cannot be started during a driver probe, e.g. due to power
>>> + * rail dependencies. The implementation is platform-specific but the
>>> + * bus will typically go through a hardware-reset sequence and devices
>>> + * will be enumerated once they report as ATTACHED.
>>> + */
>>> +int sdw_master_device_startup(struct sdw_master_device *md)
>>> +{
>>> +    struct sdw_master_driver *mdrv;
>>> +    struct device *dev;
>>> +    int ret = 0;
>>> +
>>> +    if (IS_ERR_OR_NULL(md))
>>> +        return -EINVAL;
>>> +
>>> +    dev = &md->dev;
>>> +    mdrv = drv_to_sdw_master_driver(dev->driver);
>>> +
>>> +    if (mdrv && mdrv->startup)
>>> +        ret = mdrv->startup(md);
>>> +
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(sdw_master_device_startup);
>>
>> Who would call this function? and How would it get hold of master 
>> device instance ?
> 
> sdw_master_device_add() returns a struct_master_device *md, so the 
> parent has a handle to that device. See the device creation here:
> 
> https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/drivers/soundwire/intel_init.c#L238 
> 
> 
> This startup() would be called by the parent when all 
> requirements/dependencies are met. Put differently, it allows the probe 
> to run much earlier and check for platform firmware information (which 
> links are enabled, what devices are exposed by platform firmware), while 
> the startup is really when the bus clk/data lines will start toggling.

Why would this even need to be in the SoundWire core layer, if parent 
can call its local startup function whenever its necessary?
Unless we have some kinda state-machine in the core which can really 
deal with this, i see no point in this callback.


--srini

> 
> https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/drivers/soundwire/intel_init.c#L341 
> 
> 
> and the call from the SOF layer is here:
> 
> https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/sound/soc/sof/intel/hda-loader.c#L418 
> 
> 
> Again, if everything is ready at probe time there's no need to delay the 
> actual bus startup. This is not needed for Qualcomm platforms where the 
> Master device is part of a codec. It's actually irrelevant since there 
> is no driver, so the startup callback does not even exist :-)
> 
>> How would soundwire core also ensure that we do not actively use this 
>> master if it is not ready. Similar comment for shutdown callback.
> 
> That's a fair point, we could add a state variable and a check that the 
> probe happened before.
> 
> In practice the two cases of device creation and startup are different 
> phases so it'd more of a paranoia check.
> 
> Thanks,
> -Pierre
