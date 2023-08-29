Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F9078C80C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3FF74C;
	Tue, 29 Aug 2023 16:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3FF74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693320799;
	bh=ljeHlax3pGkTv5JkGzapctsfQAphY/2+JOvqqZd87Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXIMDc+bOAC400yE5irRXrOEGMbM+4JTdV9YXQ3SP1QpEjSUK6jcXXLWPGP3b4j38
	 4YQ3efFwKFCOVDMKOMPYlRw1wUiBKKnoqepM4PQv0VQtOqysxRcCKeLwFIlVY7fcYF
	 wAoc6qxCy5CGgUPro+vSI42gHfIMlzf0edCD+x6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC268F80155; Tue, 29 Aug 2023 16:52:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A75AF80155;
	Tue, 29 Aug 2023 16:52:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 109AFF80158; Tue, 29 Aug 2023 16:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E2BCF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2BCF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sjtr7OOr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693320741; x=1724856741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ljeHlax3pGkTv5JkGzapctsfQAphY/2+JOvqqZd87Hg=;
  b=Sjtr7OOr1OYpcQrqz8YXjEN/srTDX97/OchVjyi34HPO49kMnr4NCFZB
   xmUwZL29pUt+B5QuRxUOD5t6F89MhBID4hoIZxtTyRbS3/rbHRdDyUxOl
   sXQYRDDkPN2GmqDsLdzskAG9Vwp3cPqajolDtl86MGYw1S01OtDdxRTP0
   kF+ANiVz+DHYc1MRBgGW4SM7XNWcCTPjQBL2MdUZKbXEdZbyAjCYPTHKn
   2VLFdy6jVmh2CAGHjSlTeubMLQBPxz0/rNhX05iIeBkR4VLQOuMm8dnnS
   0Z8F179fv9Z7Ct2lTJJlNprwOr4VKLvGnaDX/whokn6yKE7/YzRLVWJ6/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355711823"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="355711823"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069487679"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="1069487679"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 07:51:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qb04J-004uHu-05;
	Tue, 29 Aug 2023 17:51:47 +0300
Date: Tue, 29 Aug 2023 17:51:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: madera-i2c: Simplify probe()
Message-ID: <ZO4GAorklByxm1si@smile.fi.intel.com>
References: <20230828154941.79780-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828154941.79780-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: Z6UQPHDLJLJBJJBYANBBIGTV7ZGDC5FO
X-Message-ID-Hash: Z6UQPHDLJLJBJJBYANBBIGTV7ZGDC5FO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6UQPHDLJLJBJJBYANBBIGTV7ZGDC5FO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 04:49:41PM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().

...

> +	type = (unsigned long)i2c_get_match_data(i2c);

uintptr_t ?


-- 
With Best Regards,
Andy Shevchenko


