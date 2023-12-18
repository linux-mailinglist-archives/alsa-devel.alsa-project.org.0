Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499F816CF3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 12:52:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A283DF8;
	Mon, 18 Dec 2023 12:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A283DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702900325;
	bh=6O3Se3B93E8UTNW/7OH1GdeQwdpeUBFggJ6p3nIai14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pFUhInYFUJ8v2LKmqmQ4Xwi+H3iIss5qaOoGfFEd8vrlW1cHUWSTrUOunDEvpmrl+
	 +sq9aiGv7Zi2g1IMWiMEn1FPXirHjcz3K1yhrLjKafzu47u8anKQIQQUhNOWDqq3mo
	 odJybUqzLu++J03djJAPD+DnrtjF5vMiOjsT6uwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECD7DF80567; Mon, 18 Dec 2023 12:51:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABD0F8057C;
	Mon, 18 Dec 2023 12:51:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E02AF80425; Mon, 18 Dec 2023 12:51:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75B94F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 12:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75B94F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DJE2Jvft
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702900284; x=1734436284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6O3Se3B93E8UTNW/7OH1GdeQwdpeUBFggJ6p3nIai14=;
  b=DJE2JvftCj8o/KYVYfMxWgEPHzPh77oKs+KXyK28HQpGeSEapAcQ4osr
   UDhKTkSI5H4Tzw1OQRe2p/3iE1JurwCVuhgU9v4q1XbSYK21lk2hJRIuk
   ZZTQb2kkAJ9TG/ivSY9H0D4qUpeZHFaWphSGLlzB5zc13XUm7RwzXVuJM
   msIN6CLhvNjNr6CfXTUCDnluei5vnHK5IbltqekZjwpwatGNtd84iXkgk
   Vjt21hkaFvgLqii4IK35hBZ1CGLV2BY4cmpZRcDyJyYd2egHsgnXxdiY2
   bRZ0c6/RBOo/kZ3ypP8GDwLgkHvFIQDGnCuGDbJwleu0yEwqCbOBptpEp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="385918418"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="385918418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 03:51:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="768816570"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="768816570"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 03:51:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1rFC9S-00000006uu0-2zbc;
	Mon, 18 Dec 2023 13:51:14 +0200
Date: Mon, 18 Dec 2023 13:51:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, perex@perex.cz,
	tiwai@suse.com, sbinding@opensource.cirrus.com,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Jasper Smet <josbeir@gmail.com>
Subject: Re: [PATCH 1/1] ALSA: hda: cs35l41: Dell Fiorano add missing _DSD
 properties
Message-ID: <ZYAyMu9IuNDI69FP@smile.fi.intel.com>
References: <20231212195243.10666-1-alex.vinarskis@gmail.com>
 <87fs05qc65.wl-tiwai@suse.de>
 <d98a3157-6e58-4dd9-a35a-759bcdcbe0c9@opensource.cirrus.com>
 <87ttokpyws.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ttokpyws.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: KEPW72MFRSQBCPZMRAFYDXXSLQZBMLEB
X-Message-ID-Hash: KEPW72MFRSQBCPZMRAFYDXXSLQZBMLEB
X-MailFrom: andriy.shevchenko@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEPW72MFRSQBCPZMRAFYDXXSLQZBMLEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 14, 2023 at 04:49:23PM +0100, Takashi Iwai wrote:
> On Thu, 14 Dec 2023 16:39:58 +0100,
> Stuart Henderson wrote:
> > On 14/12/2023 11:02, Takashi Iwai wrote:
> > > On Tue, 12 Dec 2023 20:52:43 +0100,
> > > Aleksandrs Vinarskis wrote:

...

> > > Can Cirrus team review this?

> > The patch looks sensible, with some minor comments below, however
> > we're just at the tail end of testing a patch chain that genericises a
> > lot of this code and adds support for a rather large batch of other
> > laptops with incomplete DSD.  We're hoping to push this upstream on
> > Monday.
> > 
> > Can I be awkward and ask that we hold off on this patch chain until
> > then?  Then we can add this laptop using the new approach.
> > 
> > If/when the chain is accepted, we will add support for a few Dell
> > laptops as well, including this one.
> 
> It's fine to wait for a while for me.
> Hopefully we can make it in 6.7, and we can catch up in the next
> week.
> 
> (BTW, I'll be off from the next Tuesday, and the reply will be
> delayed, but I can eventually check and merge patches remotely :)

Since v6.7 is going to be an LTS, I think we are eagerly want to have
one or the other to be included. In case Cirrus is slow with their
patch, I would like to see this one being included. Let's make an
xmas/ny gift to all users of this codec!

-- 
With Best Regards,
Andy Shevchenko


