Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 918EB63784D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 13:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 391D716DC;
	Thu, 24 Nov 2022 13:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 391D716DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291342;
	bh=2dmkHmHXqGTHvc1WkI2Yi2jmXbxlKlb5qdE9VKapdGE=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8o+oCyTurGt0mtwMAvGy481QifJTIIqdn58AgddDVXMhp/8aJp6WGdvR5s52hf4W
	 fTIBPFxeFMvgLdFU4HnklyKDO00AE8DqXSqZCSJ24pPNBR+M8fBtcECz3q/7HNYDHG
	 wDjBURlY3U+XG4B9SZs6z9y9qoJtDQHM6tLsDM7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E727AF8014E;
	Thu, 24 Nov 2022 13:01:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACCC2F80149; Thu, 24 Nov 2022 13:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B876F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 13:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B876F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="bOmzpeg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669291276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7HcxW31PlGqZ7LlVewBN3n/M3SlRfqDtsg/jo2QUmA=;
 b=bOmzpeg2yvMvk3B5f3xZtyRUDItBwCdy3OdO9NJsf2pPa/zIOeLiWPeEQh11/rGrcpRhjV
 ISG/1/ScKb2aGkMeeHCaCSTVa74e2xUlnrYgIPnPhmMIAjvR7GGJVZ3PN03RidyYFwcOYH
 kKwieQo44//OYum7WwX29b9ayIQ9fcQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-NycTrKoKNqqz2-JwbryepQ-1; Thu, 24 Nov 2022 07:01:15 -0500
X-MC-Unique: NycTrKoKNqqz2-JwbryepQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c9-20020a05640227c900b00463de74bc15so853718ede.13
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 04:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7HcxW31PlGqZ7LlVewBN3n/M3SlRfqDtsg/jo2QUmA=;
 b=cZbO/5U41FrMqax8WM5OVP8oIM5ATd0ioKyb3qekWTHbkcoAEazsoNoO/zir/AV7Dz
 ZcUCMzxo8HB1HWEGlP7OkHrx/l1S/bhQWXTX3zfYDNFPKZUAEbMEzV/JTYlFSTpvzgMS
 vTrsFA5NLun9ojIp+ZlrZ187fGgtV5+WcRAjSORedaqnYhUifhTX9xyLM+hz00hy2Tk3
 j0QzqJUQDmDQo8QwVmQfBvvO+zI3saca4L6oMobVNMIQscwhkdLLozJurviiNBONg8vO
 AlZsOgvq+scbW5bc3Oa6VDnN/Ma/8bp9srA0DP6iN9hxOpaMPYjq0IaVPXgEnT+WgJtn
 hlGA==
X-Gm-Message-State: ANoB5pmHl/aJEaZxmuNcE5uzpYb9RZcDgKzKim3AtoinXBec7SWStyZT
 ZPW2NlyG12JN1IRf5v707WTFvPt5XUpgjvLlyK5K9EpRj+Ja32ZFP3BLbcQIc8opId6Pt1/4aj6
 3bN5aglN25AWupOX7wA/DJmE=
X-Received: by 2002:a17:906:d297:b0:7b8:4c22:2d6c with SMTP id
 ay23-20020a170906d29700b007b84c222d6cmr10938684ejb.144.1669291274166; 
 Thu, 24 Nov 2022 04:01:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4x9Sj81lq09gOSoHAzFPNhr4rAt+DBUjnmtvn9lIcQAf+nTTggjtPgq7oHPmWJVGJcaL1OIw==
X-Received: by 2002:a17:906:d297:b0:7b8:4c22:2d6c with SMTP id
 ay23-20020a170906d29700b007b84c222d6cmr10938668ejb.144.1669291273909; 
 Thu, 24 Nov 2022 04:01:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a1709064e4800b007a97a616f3fsm344759ejw.196.2022.11.24.04.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 04:01:13 -0800 (PST)
Message-ID: <72d5aa86-c097-d022-942a-f7299e8aa1ef@redhat.com>
Date: Thu, 24 Nov 2022 13:01:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] platform/x86: serial-multi-instantiate: Set fwnode
 for i2c
From: Hans de Goede <hdegoede@redhat.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-2-sbinding@opensource.cirrus.com>
 <1b548284-baa3-26e0-2e8f-a8d853788e5c@redhat.com>
In-Reply-To: <1b548284-baa3-26e0-2e8f-a8d853788e5c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
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

On 11/24/22 12:47, Hans de Goede wrote:
> Hi Stefan,
> 
> On 11/24/22 12:07, Stefan Binding wrote:
>> This allows the i2c driver to obtain the ACPI_COMPANION.
>>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>> ---
>>  drivers/platform/x86/serial-multi-instantiate.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
>> index 5362f1a7b77c..15ef2f3c442e 100644
>> --- a/drivers/platform/x86/serial-multi-instantiate.c
>> +++ b/drivers/platform/x86/serial-multi-instantiate.c
>> @@ -194,6 +194,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
>>  		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
>>  		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
>>  		board_info.dev_name = name;
>> +		board_info.fwnode = acpi_fwnode_handle(adev);
>>  
>>  		ret = smi_get_irq(pdev, adev, &inst_array[i]);
>>  		if (ret < 0)
> 
> I'm afraid that making this change is not as straight forward as it looks.
> 
> I know that I have tried to do this in the past and it failed.
> 
> IIRC there were 3 problems:
> 
> 1. I was expecting this to also allow the driver for the instantiated
> i2c-client to be able to bind using an acpi_match_table but that
> unfortunately does not work. acpi_match_table matches only work for
> the first physical_node linked under
> /sys/bus/acpi/devices/xxxx:xx/physical_node and that is the platform
> device to which serial-multi-instantiate.c binds. The i2c_client becomes
> the second physical node.  Note this is not really an issue,
> just something to be aware of.
> 
> 
> 2. This causes the i2c-core to use the first IRQ resource in the ACPI
> fwnode as client->irq for any clients for which we do not set an
> IRQ when instantiating. Which may very well be wrong. Sometimes that
> IRQ is only valid for the first i2c-client which we instantiate; and
> not for the others! And sometimes it is a problem because it may
> point to an irqchip for which we never wrote a driver leading to
> all probes of the i2c-client failing with -EPROBE_DEFER, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d1d84bb95364ed604015c2b788caaf3dbca0262f
> 
> Note that patch has been reverted since that specific -EPROBE_DEFER
> issue has been solved by making the ACPI core instantiate a
> platform_device instead of an i2c_client (in this case we
> did not need the actual i2c_client at all).
> 
> The current i2c-core code has a (!client-irq) test guarding its
> code of trying to use the first ACPI fwnode IRQ resource.
> 
> So we could disable this by setting client->irq = -ENOENT in
> serial-multi-instantiate.c when (inst->flags & IRQ_RESOURCE_TYPE) ==
> IRQ_RESOURCE_NONE). But that will introduce a new problem. Many
> i2c-drivers check if there is an IRQ for them to use by doing:
> "if (client->irq) request_irq(client->irq, ...)" but then with
> error checking/so setting client->irq to -ENOENT will cause
> the request_irq to fail, leading the probe to fail.
> 
> So before you can write a patch setting client->irq = -ENOENT
> when (inst->flags & IRQ_RESOURCE_TYPE) == IRQ_RESOURCE_NONE),
> you would first need to patch all i2c-drivers for clients
> instantiated through serial-multi-instantiate.c changing:
> 
> 	if (client->irq) {
> 		...
> 	}
> 
> to:
> 
> 	if (client->irq > 0) {
> 		...
> 	}
> 
> Note this is not as bad as it sounds, since there are only
> a few drivers for clients instantiated by serial-multi-instantiate.c .

Possibly a  nicer way to fix this would be to make the i2c-core change
client->irq to 0 if it is -ENOENT before calling the i2c_driver's
probe method, thus fixing things centrally for all i2c-drivers without
needing to audit/patch them all. Specifically in:

drivers/i2c/i2c-core-base.c: i2c_device_probe() change:

	if (!client->irq) {
		...
	}

to:

	if (!client->irq) {
		...
	} else if (client->irq == -ENOENT) {
		client->irq = 0; /* Drivers expect 0 for "no-IRQ" */
	}

And maybe as Andy suggested, handle at least the IRQ in
i2c_acpi_new_device_by_fwnode() by adding something like that there:

	/* Disable the i2c-core attempting to get an IRQ from ACPI itself */
	if (!board_info->irq)
		board_info->irq= -ENOENT;

I also agree with Andy that setting board_info->fw_node would be done
there ideally too. But then you would need to extend the audit of
impacted drivers mentioned below to also include drivers for
i2c-clients instantiated through other code-paths calling
i2c_acpi_new_device_by_fwnode()  (of which there are not many,
but there are a few others).

> 3. Some drivers may check for an ACPI companion device and then
> change their behavior. So all drivers for clients instantiated
> through serial-multi-instantiate.c will need to be audited for
> this (and a summary of this audit needs to be added to the commit
> msg).

Regards,

Hans




