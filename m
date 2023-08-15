Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EABA77CD90
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 15:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C956D1F2;
	Tue, 15 Aug 2023 15:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C956D1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692107633;
	bh=++moibaST6BWn92qlp06bZ42D2VSV7UGRef46Rs1xGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y7mbGFu1zW24hXH49PLC9nLsS56CvQ4Iv8N51ktc4H5BSATZS7F3BN75gCIl0FoOE
	 G/ww/vXRiIzBUo6j/NXWdqMZaZ8WiZoZQuqLXOUcGGmyqG0L8sUaIn6QgbUuMrMaIw
	 n9TSTudyUSb/QPsnQDem0+mw37lotoo7qP+HW8Go=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C7AFF8016D; Tue, 15 Aug 2023 15:53:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2417DF8016D;
	Tue, 15 Aug 2023 15:53:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CA0AF801EB; Tue, 15 Aug 2023 15:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70CAFF8016A
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70CAFF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j634y+Fx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692107574; x=1723643574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=++moibaST6BWn92qlp06bZ42D2VSV7UGRef46Rs1xGU=;
  b=j634y+FxV4iy8M/2wWo59poBRLtky/TIhZYPZv+ilwi8yGNniXqi/2Zi
   yUZw6W1X8chy+pL8JySFPyiN5mKQIFEHYOj/jiiXQ4zxxkd10vv1BuMWM
   A8HHj1Xli5TGfL14XO0c4uZn8PqbYL1yZA9Bx4no4NaOk0v1bn2DoOPAp
   3z0lPC1pDOiaFOPlgFAfivjDbuAPyni8G9fz9tihPoAS7XV8gT/0cV/jg
   67ylq4jxSW7r4WpUtGk/wuebA0X/0I86AzE8dITnYZV1egphagR9UM35f
   kXiXx4Zk1dvItnLRJcQCueJsFioV48ZXntJZsSZW0+KzVO5xZ/eS99uj7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436172027"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="436172027"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="877336881"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2023 06:52:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qVuTY-003zOZ-1I;
	Tue, 15 Aug 2023 16:52:48 +0300
Date: Tue, 15 Aug 2023 16:52:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/25] ALSA: dummy: Convert to generic PCM copy ops
Message-ID: <ZNuDMDOipYlOCHKj@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-5-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-5-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: JHNRNW4L7NMSDVERLKWOWPLD6V5RGSFZ
X-Message-ID-Hash: JHNRNW4L7NMSDVERLKWOWPLD6V5RGSFZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHNRNW4L7NMSDVERLKWOWPLD6V5RGSFZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 01:55:02PM +0200, Takashi Iwai wrote:
> This patch converts the dummy driver code to use the new unified PCM
> copy callback.  As dummy driver doesn't do anything in the callback,
> it's just a simple replacement.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


