Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F32FD952
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 20:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1512B179F;
	Wed, 20 Jan 2021 20:19:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1512B179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611170413;
	bh=YB5bLlo1/wYd3W+YSmEQq0oTqXQr24XO0AZe3O8fiRE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Me3khcs8XwInJOJdMROsVQ26l+EtQr1o0mNr83FqldtR7nEKtrHugygW5ByaHnwkP
	 TRXoPEa5x2rAEniDpnY+X10SRQPtxVykJMqEmTM656Pe0Yn6Qnz/Y+bW8KTnAkb3qE
	 +1uPndym4YJhz1ln7pBnxPeYbb/XisICy0or0SG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C96AF8019B;
	Wed, 20 Jan 2021 20:18:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A194F8016E; Wed, 20 Jan 2021 20:18:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11AADF80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 20:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AADF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PSlVbiZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611170310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsvL74Qxz17lQJ/NGZiDcF3iJD33vJCVXTJiwPyT7Mc=;
 b=PSlVbiZA0UHbe6WA5PKLdk5KOpElWiEs3RvYCoD1VgedFHLO8D6YzWOCP0N5i3UnlZGztv
 zmj99BoS9voTrFEzSWrkWLXVV6qjoyXCugLdOGtiMb1vnX76hcNKVZSRJyaLK+PJ+iBIfg
 RvXOsfda6s08aBKn3VcHc2ex0DpdL28=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-_OkOBOe4PYWyNKJA6CThBA-1; Wed, 20 Jan 2021 14:18:28 -0500
X-MC-Unique: _OkOBOe4PYWyNKJA6CThBA-1
Received: by mail-ej1-f72.google.com with SMTP id f26so7852700ejy.9
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 11:18:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rsvL74Qxz17lQJ/NGZiDcF3iJD33vJCVXTJiwPyT7Mc=;
 b=CivVjNUioniveRt5sB1EV5JPKbXcUdm8x5rpEbfVZc4SWIYvrCBP4qznhVW/oeIkDB
 w/uYplLco4xJHrJgSOhTB0PX9Uhz5SV3G6/YBNZMw4Z9rbsIyICIoPPKzpU3uJDDc45S
 n/WODWMI9xVIvLYZrXNsiq8Ey9zokqpAd0TeufSnwzKYCiyI8Zw7NfYUYpHuz8Zkaj+5
 fD3lpeZKBicN3+3hR2caDH8T4IuuTCiwZmzTRXN8zIIPcFhPO2MGqF81qsDSW+tizEuX
 gNvzruJ7NT9jTz7Bx8B4YjQo+8dFFrRPqCIrE5+Z4Zqlp4nSFAe8Oba0JhaoAcWOR/Ur
 wqlw==
X-Gm-Message-State: AOAM531TH8jgKc07EvT2OyxahmyQhuXJBN9M0Ej9pw7lmWb/BSCzBvAT
 tp8AegMpRq6MqTtnFSNDD9p/l45S6dtf5jV1trRdr+iR19Y5NQfwYZA54M7onx1crz8M6Xq8drG
 r8BXDVN5wqA9VyZV53eWyxzg=
X-Received: by 2002:a05:6402:1c0f:: with SMTP id
 ck15mr8217265edb.171.1611170307516; 
 Wed, 20 Jan 2021 11:18:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUs3bVZ7wa5D69mYTpMiyz86Ia5HOh0NKAlbuAPRTWWcXiP8JmNIqNlHEdqtmppW9EYLHlzw==
X-Received: by 2002:a05:6402:1c0f:: with SMTP id
 ck15mr8217248edb.171.1611170307336; 
 Wed, 20 Jan 2021 11:18:27 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id h16sm1606315eds.21.2021.01.20.11.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 11:18:26 -0800 (PST)
Subject: Re: [PATCH v3 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: Mark Brown <broonie@kernel.org>
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-4-hdegoede@redhat.com>
 <20210118130227.GI4455@sirena.org.uk>
 <5ccf48f4-45dc-3a30-3d6a-cce066f01270@redhat.com>
 <20210118133449.GL4455@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a1ea81b6-8aff-274c-f1b2-a06a27650b25@redhat.com>
Date: Wed, 20 Jan 2021 20:18:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118133449.GL4455@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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

On 1/18/21 2:34 PM, Mark Brown wrote:
> On Mon, Jan 18, 2021 at 02:13:50PM +0100, Hans de Goede wrote:
> 
>> More in general I'm not aware of any (recent-ish) x86 GPIO controllers
>> not being able to do active low interrupts. In theory we could hit this
>> code path on ARM devices using ACPI enumeration, but I don't think it
>> is likely we will see a combination of ARM + ACPI enumeration +
>> WM5102 + GPIO controller not capable of active-low interrupts.
> 
> I've not seen this issue on any ARM based systems.
> 
>> This overriding of the flags definitely is necessary on the Lenovo
>> devices in question. I could add a
>> "if (dmi_name_in_vendors("LENOVO"))" guard around it, but that
>> seems unnecessary.
> 
> Possibly just an update to the comment to make it clear that some
> firmwares might legitimately set the flag?

Ok, I've extended the comment above the override of the irq-flags with
the following paragraph for v4 of this patch-set:

         * Note theoretically it is possible that some boards are not capable
         * of handling active low level interrupts. In that case setting the
         * flag to IRQF_TRIGGER_FALLING would not be a bug (and we would need
         * to work around this) but sofar all known usages of IRQF_TRIGGER_FALLING
         * are a bug in the boards DSDT.

Regards,

Hans

