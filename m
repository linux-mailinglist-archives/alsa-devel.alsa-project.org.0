Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8B77CD99
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 15:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BB1836;
	Tue, 15 Aug 2023 15:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BB1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692107769;
	bh=HnOf0gzbls3T+k+P19EKNMRrb0oHlrBwaXdZmkcQNV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MgkQkfRatahIV9FlrI8A99rDPETj3vUW5BScwgMP95+6cPiGNZKz9PxeRzm2iL8GS
	 wbiJH2bLhzGXs8IJfYWtwJdMdRZbxtW71eVCW4/9pS28QQS0PJX3QtFp/yfm7kN3zE
	 dRG8VuLOMYqDybtPuk2EbbAsTDiiVEOn2NSR0FAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82CF4F80290; Tue, 15 Aug 2023 15:55:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42551F8016A;
	Tue, 15 Aug 2023 15:55:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B10E0F8016D; Tue, 15 Aug 2023 15:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2BDCF80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BDCF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DfBmVgti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692107714; x=1723643714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HnOf0gzbls3T+k+P19EKNMRrb0oHlrBwaXdZmkcQNV8=;
  b=DfBmVgtinimZcxXZnA+0cgcr/29AI4G2Zy7e4A2MgHWLcyFwkaWrQaPC
   d721VYWiPE4Jo8JNnQkNr87YXB0NJ1qNg+mliNRw1qNW4x2M8RGh/OUO7
   eHuvIcAZQlk12QTlo4Ba1hbPPstMejsO9lV0y8Mx1s65JdWfX28ZqiY8k
   LSP8sVP03ppC+YGSr09NBL1MDYjFKbGB+AAp0mHeH3fVN9vtBa1Ldggx0
   K2sXN6aYtyNb6AH5DBF2JJTKKDsgRhxoCsw4UnwbKjy5qOLMdP/baglLV
   W8V/TT48a4esDAEgt5H/mXGJmW2qeE5V56O+7gulbCPuNc5JYFDRMtj0Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375050001"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="375050001"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="683660176"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200";
   d="scan'208";a="683660176"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 15 Aug 2023 06:55:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qVuVn-0044Pr-0l;
	Tue, 15 Aug 2023 16:55:07 +0300
Date: Tue, 15 Aug 2023 16:55:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/25] ALSA: korg1212: Convert to generic PCM copy ops
Message-ID: <ZNuDugkvHrh7J/fF@smile.fi.intel.com>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-9-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-9-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: O5LJCVWYITQLC23TJ6TC4G7V6ZJG7R2R
X-Message-ID-Hash: O5LJCVWYITQLC23TJ6TC4G7V6ZJG7R2R
X-MailFrom: andriy.shevchenko@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5LJCVWYITQLC23TJ6TC4G7V6ZJG7R2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 14, 2023 at 01:55:06PM +0200, Takashi Iwai wrote:
> This patch converts the korg1212 driver code to use the new unified
> PCM copy callback.  The open-coded conditional memory copies are
> replaced with simpler copy_from/to_iter() calls.
> 
> Note that copy_from/to_iter() returns the copied bytes, hence the
> error condition is inverted from copy_from/to_user().

...

> +		if (!copy_to_iter(src, size, dst))

	!= size ?


>  			return -EFAULT;

...

> +		if (!copy_from_iter(dst, size, src))
>  			return -EFAULT;

Ditto.

-- 
With Best Regards,
Andy Shevchenko


