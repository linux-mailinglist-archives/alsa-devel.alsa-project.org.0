Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA756639465
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:08:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754BC1801;
	Sat, 26 Nov 2022 09:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754BC1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450094;
	bh=5PRsd7HrjCqRvBnMgI+VLqKx3MQdupYeelhvkIpaOto=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=verG3CU1H0x59AyQu4q5UmSCKhwJItf1GVuFdmBFP6JeM9WD99zRbq+Q5gF61uYQc
	 YOwTotXqOMDogSJfaezhYfAAlJGdq+6RfCj3sEQ/mDVgxhW5Vng1J3lvuNjr0eGm3V
	 gheqqrK9exeTfQ34jPv57J6AccL2O9K5YhPlyTbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E977F80613;
	Sat, 26 Nov 2022 08:59:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D64F8025D; Wed, 23 Nov 2022 14:14:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C870DF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 14:14:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C870DF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JrgCjNHp"
Received: by mail-ed1-x529.google.com with SMTP id z63so5756454ede.1
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sauF/j+i6mkS8I5Asm3wkjg9rAoolnMVFFABQhVn7ts=;
 b=JrgCjNHpmpS+UFD/hJxkEdxsDcmk00K9l1zgw4rjJ6QL5LFgR9cDjNY17XgiVyuKWT
 GVX3FjNvQF532OmACfplDQxa0ET6vUF3+AwWkzCoQgdvk8wm/vwi5bqEPhjgds3tvHVk
 qcn3+9bWbQ09f6O6mbQXTHtJZBCGwc8Lfjz7fIehiorZZ8oPg8dRKYCne/QKG+ZgQ3Z5
 zzGAl10ChcVHD+8+Mhy+mnFO2Ek6zUiOt22qnko9TArrSnnj1eidLr1A138vvA9aLTcz
 ZwMNfHN3QT6GpL5rAIMHY7Io5oO/gphYT8wcDC9vjb4hS9xYXmqoE4cy5//Ks0/sJomc
 X3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sauF/j+i6mkS8I5Asm3wkjg9rAoolnMVFFABQhVn7ts=;
 b=ep3aWiJRflwtWuT7Ps5mD70eWZTQQlzbp6E9rOUR0Ps4mAlbBTZRUJbpcpSNAIjVyG
 jB0lp/uaoWtM7ikEwgSYhUx8BPmT9fJrHKYOiTFx0ffoZsJ7n7xoJCgOaUPB0exNB8U4
 uF/pyS/aCKhdaxiyErT9AhDwwqatshihX6NP6skoNfIx4AvFrVBeIHi0rBn/7FefodeJ
 V/FsSy2fxBNxtzr7pTj2cWbPkgSjxAwrMSNn4HlgRel7PrgJXflnomO4KZrR/y6l/Tp0
 DS2dXKKphQwh3V8TIH6va1EcilP6bDmyynrnBAQ4zn8BVZwS3BRyvAmNet+NwJYVBQuj
 ZWGA==
X-Gm-Message-State: ANoB5pm2zS/o7/bFugQPvYkjaI9y7R8hJ1hZCciUVrYth4F9gyzMRe0u
 i//b3k4pQgE7kHD5OHQL7tY=
X-Google-Smtp-Source: AA0mqf4EMwcpsdY1UQ9nMh8FYiw8FldQtuxFrB6UO57Z4G73kQazssLgzz4HdFhaHz+MfDNKhbLKUA==
X-Received: by 2002:a05:6402:181:b0:461:ea0c:e151 with SMTP id
 r1-20020a056402018100b00461ea0ce151mr11327924edv.376.1669209274614; 
 Wed, 23 Nov 2022 05:14:34 -0800 (PST)
Received: from [10.20.0.7] ([37.120.217.162]) by smtp.gmail.com with ESMTPSA id
 oz36-20020a1709077da400b00734bfab4d59sm958602ejc.170.2022.11.23.05.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 05:14:34 -0800 (PST)
Message-ID: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
Date: Wed, 23 Nov 2022 14:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-acpi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Won Chung <wonchung@google.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Jamet <michael.jamet@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org
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

On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.

[...]

> diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
> index de539938896e..407eb55050a6 100644
> --- a/drivers/platform/surface/aggregator/bus.c
> +++ b/drivers/platform/surface/aggregator/bus.c
> @@ -35,9 +35,9 @@ static struct attribute *ssam_device_attrs[] = {
>   };
>   ATTRIBUTE_GROUPS(ssam_device);
>   
> -static int ssam_device_uevent(struct device *dev, struct kobj_uevent_env *env)
> +static int ssam_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
>   {
> -	struct ssam_device *sdev = to_ssam_device(dev);
> +	const struct ssam_device *sdev = to_ssam_device(dev);
>   
>   	return add_uevent_var(env, "MODALIAS=ssam:d%02Xc%02Xt%02Xi%02Xf%02X",
>   			      sdev->uid.domain, sdev->uid.category,

[...]

> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -229,7 +229,7 @@ static inline bool is_ssam_device(struct device *d)
>    * Return: Returns a pointer to the &struct ssam_device wrapping the given
>    * device @d.
>    */
> -static inline struct ssam_device *to_ssam_device(struct device *d)
> +static inline struct ssam_device *to_ssam_device(const struct device *d)
>   {
>   	return container_of(d, struct ssam_device, dev);
>   }

I am slightly conflicted about this change as that now more or less
implicitly drops the const. So I'm wondering if it wouldn't be better to
either create a function specifically for const pointers or to just
open-code it in the instance above.

I guess we could also convert this to a macro. Then at least there
wouldn't be an explicit and potentially misleading const-conversion
indicated in the function signature.

Regards,
Max
