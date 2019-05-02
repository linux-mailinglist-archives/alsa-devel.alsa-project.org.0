Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33E11281
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 07:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98941175E;
	Thu,  2 May 2019 07:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98941175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556774028;
	bh=rfsQAyzUGm4DiVxDsbgulHa3URNXoe2lnlht6QVRpsg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQmQDA3SHfcx+iklBjUsbe7GtofqtEu7WEi9bPtaC7mMO6KbCac/JZ8p7cn9fjnrl
	 fDxIKnuTdeqQ55dLObSEF5ounZJu/40lWSaRIgyTDyZqRIyuAdQi0OiExe1Jvqf06u
	 Tzguv8OM/blwpxseDULRhKqGj5VGqsDNoErFYvsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2CCEF89693;
	Thu,  2 May 2019 07:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E24C7F896C7; Thu,  2 May 2019 07:04:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS, TIME_LIMIT_EXCEEDED, 
 URIBL_BLOCKED autolearn=unavailable version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 825D9F89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 06:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 825D9F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lpbZos6r"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5A012075E;
 Thu,  2 May 2019 04:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556773108;
 bh=AlJ7fhDL8zv1DFy/4ydx44JaOUdD+SCp0M+l+7To4Ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lpbZos6rpTINadMWn1nKzCfUFszahKJ0vXJP2WiXTWV353VANv3wilfr+SK8RHHsy
 fPhgeErlz9pG40sridkX9jHWEvLUBoKpyJxGn2UFRtzRUJ9mwvL6Dm4Jtc8SXCd2Bh
 SNGXr8rjqJm6mOrdIbGyBFEM8fAMhRl2MzY9qn+s=
Date: Thu, 2 May 2019 10:28:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502045817.GZ3845@vkoul-mobl.Dlink>
References: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Robert Moore <robert.moore@intel.com>, liam.r.girdwood@linux.intel.com,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01-05-19, 07:53, Pierre-Louis Bossart wrote:
> Standards such as the MIPI DisCo for SoundWire 1.0 specification
> assume the _ADR field is 64 bits.
> 
> _ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
> released in 2002. The low levels already use _ADR as 64 bits, e.g. in
> struct acpi_device_info.
> 
> This patch bumps the representation used for sysfs to 64 bits. To
> avoid any compatibility/ABI issues, the printf format is only extended
> to 16 characters when the actual _ADR value exceeds the 32 bit
> maximum.
> 
> Example with a SoundWire device, the results show the complete
> vendorID and linkID which were omitted before:
> 
> Before:
> $ more /sys/bus/acpi/devices/device\:38/adr
> 0x5d070000
> After:
> $ more /sys/bus/acpi/devices/device\:38/adr
> 0x000010025d070000
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
> v2: only use 64 bits when required to avoid compatibility issues
> (feedback from Vinod and Rafael)
> 
>  drivers/acpi/device_sysfs.c | 6 ++++--
>  include/acpi/acpi_bus.h     | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
> index 8940054d6250..7dda0ee05cd1 100644
> --- a/drivers/acpi/device_sysfs.c
> +++ b/drivers/acpi/device_sysfs.c
> @@ -428,8 +428,10 @@ static ssize_t acpi_device_adr_show(struct device *dev,
>  {
>  	struct acpi_device *acpi_dev = to_acpi_device(dev);
>  
> -	return sprintf(buf, "0x%08x\n",
> -		       (unsigned int)(acpi_dev->pnp.bus_address));
> +	if (acpi_dev->pnp.bus_address > 0xFFFFFFFF)

Would prefer to use U32_MAX instead of 0xFFFFFFFF

> +		return sprintf(buf, "0x%016llx\n", acpi_dev->pnp.bus_address);
> +	else
> +		return sprintf(buf, "0x%08llx\n", acpi_dev->pnp.bus_address);
>  }
>  static DEVICE_ATTR(adr, 0444, acpi_device_adr_show, NULL);
>  
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index f7981751ac77..9075e28ea60a 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -230,7 +230,7 @@ struct acpi_device_dir {
>  /* Plug and Play */
>  
>  typedef char acpi_bus_id[8];
> -typedef unsigned long acpi_bus_address;
> +typedef u64 acpi_bus_address;
>  typedef char acpi_device_name[40];
>  typedef char acpi_device_class[20];
>  
> -- 
> 2.17.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
