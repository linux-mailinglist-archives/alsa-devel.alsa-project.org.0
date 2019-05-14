Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEED1D167
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2019 23:39:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 462251671;
	Tue, 14 May 2019 23:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 462251671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557869951;
	bh=6v3zKIYoX27y1RnkuiZDdBQZgpHfe8i0MOOcSJjZSR8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PInGl8THtkGDkfm/xF00Wjn+vsz0Jvj+VCPHNN5PGGWUaAmEFUf+SAXdJjhu4R1mr
	 Qgbot04WeWzJgX9d+DQ0Cm+w8E0tQvtWXeW9vGZO9Ko7+Dt0SrQHR27yw+r/shUMit
	 BNxcdIr/WDyGfaFWHDBaZRg/lDUOnXsFwZ1FDXys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4936AF896B9;
	Tue, 14 May 2019 23:37:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F6F6F806E5; Tue, 14 May 2019 23:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60517F8072A
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 23:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60517F8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 14:37:15 -0700
X-ExtLoop1: 1
Received: from pavankka-mobl.amr.corp.intel.com (HELO [10.254.107.28])
 ([10.254.107.28])
 by fmsmga008.fm.intel.com with ESMTP; 14 May 2019 14:37:13 -0700
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
References: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
 <20190502045817.GZ3845@vkoul-mobl.Dlink>
 <CAJZ5v0i+M8y3ddr+Z5o5af8OatMXq3xqCF5CUg5PjnANrTOSHw@mail.gmail.com>
 <1683867.ro8ObbCUgW@kreacher>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <05820f12-de32-c5bb-0780-75c43557e677@linux.intel.com>
Date: Tue, 14 May 2019 16:37:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1683867.ro8ObbCUgW@kreacher>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Moore <robert.moore@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Joe Perches <joe@perches.com>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ACPI / device_sysfs: change _ADR
 representation to 64 bits
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>>> diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
>>>> index 8940054d6250..7dda0ee05cd1 100644
>>>> --- a/drivers/acpi/device_sysfs.c
>>>> +++ b/drivers/acpi/device_sysfs.c
>>>> @@ -428,8 +428,10 @@ static ssize_t acpi_device_adr_show(struct device *dev,
>>>>   {
>>>>        struct acpi_device *acpi_dev = to_acpi_device(dev);
>>>>
>>>> -     return sprintf(buf, "0x%08x\n",
>>>> -                    (unsigned int)(acpi_dev->pnp.bus_address));
>>>> +     if (acpi_dev->pnp.bus_address > 0xFFFFFFFF)
>>>
>>> Would prefer to use U32_MAX instead of 0xFFFFFFFF
>>
>> I would.
>>
> 
> I have made that change manually and applied the patch.
> 
> Thanks!

Thanks, much appreciated.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
