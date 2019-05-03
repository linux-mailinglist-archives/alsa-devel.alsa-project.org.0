Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E109113435
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 21:56:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766301826;
	Fri,  3 May 2019 21:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766301826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556913413;
	bh=dAgswWGPNltQHERraEUzG8hr6JbDrrdb3V/hUbydtsg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCYXjxj+5iQV+8nzrRf/5ebBm/ZVo6PBWUvRFXsm1+8WzmwUyWI5ICmlz+PfNcViL
	 FKqBdSLQV/0kQ510xkdipaErX+9nceHLcxwn1scmBWXXlScZHXOVphiDeSb2mCYdrB
	 Xwm/lLtR0ApTslMflGx1TKLJydmz8J25tISCgf+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3599EF896B9;
	Fri,  3 May 2019 21:55:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 089E4F896B7; Fri,  3 May 2019 21:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 819DEF8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 21:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819DEF8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 12:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="343204990"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga005.fm.intel.com with ESMTP; 03 May 2019 12:54:58 -0700
Received: from orsmsx122.amr.corp.intel.com (10.22.225.227) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 3 May 2019 12:54:58 -0700
Received: from orsmsx110.amr.corp.intel.com ([169.254.10.28]) by
 ORSMSX122.amr.corp.intel.com ([169.254.11.68]) with mapi id 14.03.0415.000;
 Fri, 3 May 2019 12:54:58 -0700
From: "Moore, Robert" <robert.moore@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH v2] ACPI / device_sysfs: change _ADR representation to
 64 bits
Thread-Index: AQHVABzpPFu1CoIi4kGbA9d0A2PiXaZZ03bg
Date: Fri, 3 May 2019 19:54:57 +0000
Message-ID: <94F2FBAB4432B54E8AACC7DFDE6C92E3B958C7AE@ORSMSX110.amr.corp.intel.com>
References: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzI4NDBhMDUtN2FiMC00Y2Q1LTljZGItY2VmYTE0MDQ1Yjg3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTWNnRytaTnE2b3A3b2pvMEVmQWlmWUgwVWtZbVE0MzEwc3MxSEpZVWNqVTQ0eGx5U0I2Rm1BS0ZmQjBtNEtoeCJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "joe@perches.com" <joe@perches.com>,
 "open list:ACPI COMPONENT
 ARCHITECTURE \(ACPICA\)" <devel@acpica.org>, "Schmauss,
 Erik" <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
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



> -----Original Message-----
> From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
> Sent: Wednesday, May 1, 2019 5:53 AM
> To: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org; tiwai@suse.de; broonie@kernel.org;
> vkoul@kernel.org; gregkh@linuxfoundation.org;
> liam.r.girdwood@linux.intel.com; jank@cadence.com; joe@perches.com;
> srinivas.kandagatla@linaro.org; Pierre-Louis Bossart <pierre-
> louis.bossart@linux.intel.com>; Rafael J. Wysocki <rjw@rjwysocki.net>;
> Len Brown <lenb@kernel.org>; Moore, Robert <robert.moore@intel.com>;
> Schmauss, Erik <erik.schmauss@intel.com>; open list:ACPI <linux-
> acpi@vger.kernel.org>; open list:ACPI COMPONENT ARCHITECTURE (ACPICA)
> <devel@acpica.org>
> Subject: [PATCH v2] ACPI / device_sysfs: change _ADR representation to
> 64 bits
> 
> Standards such as the MIPI DisCo for SoundWire 1.0 specification assume
> the _ADR field is 64 bits.
> 
> _ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
> released in 2002. The low levels already use _ADR as 64 bits, e.g. in
> struct acpi_device_info.
> 
[Moore, Robert] 

Just to be precise: since acpi 2.0 the integer width is either 32 bits or 64 bits, depending on the version number of the DSDT (1-->32, 2 or greater --> 64).


> This patch bumps the representation used for sysfs to 64 bits. To avoid
> any compatibility/ABI issues, the printf format is only extended to 16
> characters when the actual _ADR value exceeds the 32 bit maximum.
> 
> Example with a SoundWire device, the results show the complete vendorID
> and linkID which were omitted before:
> 
> Before:
> $ more /sys/bus/acpi/devices/device\:38/adr
> 0x5d070000
> After:
> $ more /sys/bus/acpi/devices/device\:38/adr
> 0x000010025d070000
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-
> louis.bossart@linux.intel.com>
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
> @@ -428,8 +428,10 @@ static ssize_t acpi_device_adr_show(struct device
> *dev,  {
>  	struct acpi_device *acpi_dev = to_acpi_device(dev);
> 
> -	return sprintf(buf, "0x%08x\n",
> -		       (unsigned int)(acpi_dev->pnp.bus_address));
> +	if (acpi_dev->pnp.bus_address > 0xFFFFFFFF)
> +		return sprintf(buf, "0x%016llx\n", acpi_dev-
> >pnp.bus_address);
> +	else
> +		return sprintf(buf, "0x%08llx\n", acpi_dev->pnp.bus_address);
>  }
>  static DEVICE_ATTR(adr, 0444, acpi_device_adr_show, NULL);
> 
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h index
> f7981751ac77..9075e28ea60a 100644
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

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
