Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35899A26C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 13:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58153B71;
	Fri, 11 Oct 2024 13:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58153B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728644908;
	bh=W2AEd9w6vWrpcUMPLNR+VUSfGNW+x+cz3tudsyam76c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSL8rdKuzscyfonrhkc3onDCQX7CYawLvI/f6pQtmD8lb3btekxElFdw9vO5YNwG4
	 0Om05u7RuQBkGrGM4DlITKxbKv5tLXopyvJEHdQrSeAgwzl3mZ0VW44P935BWznkAE
	 GJWvKou0PtklgBn5SW9eVAvPZWfIjUxtDkqJ9vqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECDFAF80527; Fri, 11 Oct 2024 13:07:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB465F805B1;
	Fri, 11 Oct 2024 13:07:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7B32F80528; Fri, 11 Oct 2024 13:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 267E2F800ED
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 13:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 267E2F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XbQixJHO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644868; x=1760180868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2AEd9w6vWrpcUMPLNR+VUSfGNW+x+cz3tudsyam76c=;
  b=XbQixJHOmTS5T7tHg2kDfa3PKoof6zt9zkSx2mYsxt714dWJeJcaBBe1
   m1YHjYC9oYhfvhTruYK/dY61X5N2uC7ytzIJ83gk+Jlo/ZJuYkW2Pu9ml
   4Nzg+GgOGuWXcXla/Ni2EiYxq7hsio5TXUwNBlnp9fldc4Ap6TVc1h+vn
   MWl1o/cFr9AmuNRyEAKpQPCV4AHi613UNifsS9DpwTGoYtWW780VAqo2U
   SVcrWFaBX012d3Vv0qJZ41JnKlIpPuflv+hALCdpPhGMXKJZcqJldpWa/
   oW/0pPasLXEfpSSV/UgG5KX9H41/P1kvMHHWH29oyT56MSp6onl2Arx01
   A==;
X-CSE-ConnectionGUID: f4mqfERLQqKQq5SQ0eteFQ==
X-CSE-MsgGUID: OEGECAB9RgihpwbMhf0gyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38610467"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800";
   d="scan'208";a="38610467"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 04:07:45 -0700
X-CSE-ConnectionGUID: zKMc30dKQ1ii8EgMRMHeXw==
X-CSE-MsgGUID: z/K0GQ+2Ro+e8sSzq+emuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800";
   d="scan'208";a="100207487"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 04:07:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szDUd-00000001ryB-3rKQ;
	Fri, 11 Oct 2024 14:07:35 +0300
Date: Fri, 11 Oct 2024 14:07:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-hampiholi@ti.com, v-po@ti.com, niranjan.hy@ti.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add speaker id check for ASUS
 projects
Message-ID: <ZwkG98S_wxK6xMEq@smile.fi.intel.com>
References: <20241011085303.738-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011085303.738-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 5HVG746M63FNPOKBSU2AHQ7SC3RBOAJM
X-Message-ID-Hash: 5HVG746M63FNPOKBSU2AHQ7SC3RBOAJM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HVG746M63FNPOKBSU2AHQ7SC3RBOAJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 11, 2024 at 04:53:03PM +0800, Baojun Xu wrote:
> Add speaker id check by gpio in ACPI for ASUS projects.

...

> +		scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X%01d.bin",

sizeof() ?

> +			codec->core.subsystem_id & 0xffff, spk_id);

lower_16_bits() ?

...

> +		scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",

Ditto.

> +			codec->core.subsystem_id & 0xffff);

Ditto.

...

> +	tas_hda->priv->speaker_id = devm_gpiod_get(tas_hda->dev, "speakerid",
> +						   GPIOD_IN);
> +	if (IS_ERR(tas_hda->priv->speaker_id))
> +		dev_info(tas_hda->dev, "Failed to get Speaker id gpio.\n");

This is wrong. If it's okay to ignore, make it optional. Either way you have to
return an error code to the caller as you effectively ignore deferred probe,
for example.

-- 
With Best Regards,
Andy Shevchenko


