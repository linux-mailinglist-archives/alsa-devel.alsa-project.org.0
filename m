Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7D7915BE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 12:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12969741;
	Mon,  4 Sep 2023 12:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12969741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693823700;
	bh=zu+tMGAxaM9YFrYI5l7kCZRRlpRcpVet28df0zWTJwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LAOSryoAbIDlO13WK5KogfcGwWrppPxOKbkcEBLf3GIdXArolXXlJ2RjER3WXSUIU
	 PBbj8Q7XFt1S6uSEKPvgoJh/uZtdeIHsieMcCXZBtQdbAThAHuoZ1ONVnuqWUWbkpf
	 kKMCN4VsbjGR+uh81891OR0VGlOu/2+DhUgkVP98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DA49F804F3; Mon,  4 Sep 2023 12:34:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB499F80431;
	Mon,  4 Sep 2023 12:34:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B21DF8047D; Mon,  4 Sep 2023 12:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69BE4F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 12:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BE4F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a25ZvfaW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693823545; x=1725359545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zu+tMGAxaM9YFrYI5l7kCZRRlpRcpVet28df0zWTJwc=;
  b=a25ZvfaWY22BwVD461Jk11MgOjZl9u7375T0hYHg6/u3H2OoDvvUAcJS
   nzPgkyZPeKDQmH+6QVBlCdNmSS/d7aaacT30GKjd94Ahf5eE+PelMvlXU
   StnGnGkk1DNsfQ2QkgSvWB5rwYSeixbFNEcwYo18kW+QscDKgdlMFPO+G
   3sqF5NVsCkzCPJWusxeNZMbQTDfwbhwlJJK2t6yDFfeFRaR7JPTb2Rbqg
   4phWvGWQ5RBIRhCpP1/0mz+xfOwMWcdTCBqQKLMytTTka2RrEYdCK6k6N
   RtGMQkAfSn246RjuKcIoHQE+TmXZ3Jhzzd9Ai7bL+ActiQcxXQsdEuWKx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="375461221"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000";
   d="scan'208";a="375461221"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="806220201"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000";
   d="scan'208";a="806220201"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:32:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qd6sQ-006Osv-0k;
	Mon, 04 Sep 2023 13:32:14 +0300
Date: Mon, 4 Sep 2023 13:32:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Update tas2781 HDA driver
Message-ID: <ZPWyLWsEUysyCrsl@smile.fi.intel.com>
References: <20230904090725.1388-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904090725.1388-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: XZ7A5BAOUZCWHYHG6BRP2CLCFQVRIYWD
X-Message-ID-Hash: XZ7A5BAOUZCWHYHG6BRP2CLCFQVRIYWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZ7A5BAOUZCWHYHG6BRP2CLCFQVRIYWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 04, 2023 at 05:07:24PM +0800, Shenghao Ding wrote:
> Revert structure cs35l41_dev_name and redefine tas2781_generic_fixup.

...

>  	/* check the bus name */
> -	if (strncmp(d, p->bus, n))
> +	if (strncmp(d, bus, n))
>  		return 0;
>  	/* skip the bus number */
>  	if (isdigit(d[n]))
>  		n++;
>  	/* the rest must be exact matching */
> -	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
> +	snprintf(tmp, sizeof(tmp), "-%s:00", "TIAS2781");
>  
>  	return !strcmp(d + n, tmp);

Try to use one of the respectve acpi_*_match*() APIs.

-- 
With Best Regards,
Andy Shevchenko


