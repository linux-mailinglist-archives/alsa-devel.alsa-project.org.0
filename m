Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1A289D9BF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 15:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D3B32BBD;
	Tue,  9 Apr 2024 15:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D3B32BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712667845;
	bh=bxgbV2pkHGwpnIR6VtVXissqixb6J9Rx4J0av4i8oCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJ6YFMtyDtcuP9hHdRWA5ZegfUd6f2OfRVsuMKE27St/MAupjInXd41EWJEFRmj8V
	 IJXITaA+53fcjZjQrbs9WmJ3PDHv/NMOJ9eZzm999iVIQX0juObx2OAuXOHzUDORVm
	 pytgnLgJbTv71TNvarekrRshRtwRNbaIpxd5TwK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4AB2F8059F; Tue,  9 Apr 2024 15:03:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0AD4F8058C;
	Tue,  9 Apr 2024 15:03:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CFCCF8026D; Tue,  9 Apr 2024 15:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63C8CF800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 15:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C8CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HccHSArI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712667798; x=1744203798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bxgbV2pkHGwpnIR6VtVXissqixb6J9Rx4J0av4i8oCI=;
  b=HccHSArIpMwWCvMljpCEHgZi8COuqKyXJ/O7MjSsHIrG1IDIneMaaQ8A
   w6yvBYR7Dsv8MyXq/93D9LocQS97uYT1dvaCZRJ98AxFQ1NtYrfAvHG1+
   +DOpEGjlImGndOHyz+C732LvFJ9ECA0JOxvIpZH9uDbYbgPFMI61OV0oM
   FqWPS8SQWyvclddPXTVMLPDjYeb0dhnLWSpSU+tkLhYLEMRYeq3fqHADL
   BGrJFdXNQO2JTBWe7pQoEY8YK04S6jQOT5ZR2w0bX0+zA1lKQJic8b8gT
   i+6jFmUlHmM+wDOcBFChiaQkN6k6tSTF4/czWFZgPR3UnP26REKXLEN+P
   g==;
X-CSE-ConnectionGUID: R0od/xFMSHi8HFqptK/wmQ==
X-CSE-MsgGUID: VKfpZOnQRb6fvKni449osg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11773725"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000";
   d="scan'208";a="11773725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="915399305"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000";
   d="scan'208";a="915399305"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:02:56 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruB7l-00000002oHW-0QzR;
	Tue, 09 Apr 2024 16:02:53 +0300
Date: Tue, 9 Apr 2024 16:02:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v2 1/3] ALSA: hda/tas2781: Modification for add tas2781
 driver for SPI
Message-ID: <ZhU8fCOLOlu4azGL@smile.fi.intel.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409024816.1180-2-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: JDN3W2V6AOOCVPHNVMJ232VTMPKOHBWL
X-Message-ID-Hash: JDN3W2V6AOOCVPHNVMJ232VTMPKOHBWL
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDN3W2V6AOOCVPHNVMJ232VTMPKOHBWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 09, 2024 at 10:48:13AM +0800, Baojun Xu wrote:
> Integrate tas2781 configs for HP Laptops. Every tas2781 in the laptop
> will work as a single speaker on SPI bus. The code support realtek as

Realtek

> the primary codec.

...

>  		{"INT33FE", },
>  		{"INT3515", },
>  		/* Non-conforming _HID for Cirrus Logic already released */
> +		{"TXNW2781", },

This seems wrong. The ID here is correct from ACPI specification perspective.
Can you elaborate why you think it's "non-conforming _HID"?

>  		{"CLSA0100", },
>  		{"CLSA0101", },

...

>  	/* Non-conforming _HID for Cirrus Logic already released */
>  	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ "CLSA0101", (unsigned long)&cs35l41_hda },
> +	{ "TXNW2781", (unsigned long)&tas2781_hda },

Ditto.

>  	{ }

...

> @@ -39,6 +39,7 @@ snd-hda-scodec-cs35l56-spi-objs :=	cs35l56_hda_spi.o
>  snd-hda-cs-dsp-ctls-objs :=		hda_cs_dsp_ctl.o
>  snd-hda-scodec-component-objs :=	hda_component.o
>  snd-hda-scodec-tas2781-i2c-objs :=	tas2781_hda_i2c.o
> +snd-hda-scodec-tas2781-spi-objs :=	tas2781_hda_spi.o tas2781_spi_fwlib.o

Actually these 'objs' has to be 'y', can you fix it in the prerequisite patch?

Also wondering why fwlib is only a requirement for SPI. How does I²C work?

-- 
With Best Regards,
Andy Shevchenko


