Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80679A739
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 12:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68DA884B;
	Mon, 11 Sep 2023 12:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68DA884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694427904;
	bh=Qk8TuabgJtSCp7j499WRZJ0KpjibtjkaxhKDixdWBxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VvEAKg96jgPaptmbZ/VLzVtk6xfKXis8pKzWpmh/srgBhy+KsLegQ29TSO35zqJXg
	 Emmixfdy3UFaNWG1Y0EFCKZB5OlpZL0keG/AOKsXrigblHIqcZ0hr0itYIzIFzPpry
	 JXCXmPVxZH6ZJJKYExBAnjs5F0u+T3lWzdJJLGTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36987F80425; Mon, 11 Sep 2023 12:23:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97445F80246;
	Mon, 11 Sep 2023 12:23:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF405F80425; Mon, 11 Sep 2023 12:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD98FF800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 12:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD98FF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IdsK7NIL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694427821; x=1725963821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qk8TuabgJtSCp7j499WRZJ0KpjibtjkaxhKDixdWBxA=;
  b=IdsK7NILHtjdsnDJej+MAVXKYgHeMzJxmI+fvPgOFQvPIfItv7SrSGp9
   0YdSYTgnFMugCADwWaKu/BdspjNNOc1AqVJ5wJF8NJGQQ+4n4YKs2qFRR
   Dfsl2gPjTZrzXHwCwydVEZozhKJWxCdNwkHtbXrEEtysDKp+tzo2SnCse
   PU7vouygiN6nWiDgXXbEAveR4n/t3J3Cbin/i2ENn6FkbL6P+i7fp1j7j
   weLf8h4JeTQt/fh8XdxNtR9SapFrM4H7m3XsB9hGutsJg54ABnoIFQOEy
   UhqWZXJzI8iN3FBCLUWxqIgeY05UwSC6z6UZ3fz0hH7u0gZF4VZUB1G4t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444462275"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000";
   d="scan'208";a="444462275"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858268504"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000";
   d="scan'208";a="858268504"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:23:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qfe4n-008I1A-2f;
	Mon, 11 Sep 2023 13:23:29 +0300
Date: Mon, 11 Sep 2023 13:23:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Support ACPI_ID both TXNW2781 and
 TIAS2781
Message-ID: <ZP7qoamIicmnbsB0@smile.fi.intel.com>
References: <20230910072704.1359-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230910072704.1359-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: C7BRVYZR4ECLLEYURG4A45JNJESSLUC7
X-Message-ID-Hash: C7BRVYZR4ECLLEYURG4A45JNJESSLUC7
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7BRVYZR4ECLLEYURG4A45JNJESSLUC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 10, 2023 at 03:27:03PM +0800, Shenghao Ding wrote:
> Support ACPI_ID both TXNW2781 and TIAS2781, TXNW2781 is the only one legal
> ACPI ID, TIAS2781 is the widely-used ACPI ID named by our customers, so
> far it is not registered. We have discussed this with them, they requested
> TIAS2781 must be supported for the laptops already released to market,
> their new laptops will switch to TXNW2781.

...

> +/* TIAS2781 is the unofficial ACPI id, but widely used in current devices.
> + * TXNW2781 is the official ACPI id, and will be used in the new devices.
> + * Check TIAS2781 or TXNW2781
> + */

/*
 * This style is only for networking.
 * please use one as in this example.
 */

...

> +	const char c[][10] = { "TXNW2781", "TIAS2781" };

Can you put this to the ACPI device ID table, it will be easier to use it with
some other acpi_*() APIs?
That table might need a comment why it has no MODULE_DEVICE_TABLE() with it.

...

> +	int n = strlen(bus), i;

>  
> -	if (strncmp(d, p->bus, n))
> +	if (strncmp(d, bus, n))
>  		return 0;

It means you need to use str_has_prefix().

...

> +	for (i = 0; i < ARRAY_SIZE(c); i++) {
> +		/* the rest must be exact matching */
> +		snprintf(tmp, sizeof(tmp), "-%s:00", c[i]);
> +
> +		if (!strcmp(d + n, tmp))
> +			return 1;
> +	}

This can be done differently.
You are comparing the instance of the device to the actual id, right?
We have ACPI match APIs for that. Have you tried to look at them?

...

> +/* TIAS2781 is the unofficial ACPI id, but widely used in current devices.
> + * TXNW2781 is the official ACPI id, and will be used in the new devices.
> + */
> +static const struct acpi_device_id tas2781_acpi_hda_match[] = {
> +	{"TIAS2781", 0 },
> +	{"TXNW2781", 1 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);

So, besides the style of the comment, why do you have two different data
structures for the same? Can you find a common place and deduplicate it?

...

> -MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);

Ah, I see now, it's used for probing. Please, don't move it. The hid is
available via device pointer.

...

This patch requires much more work, and esp. be redesigned to use proper
ACPI APIs.

-- 
With Best Regards,
Andy Shevchenko


