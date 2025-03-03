Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBE9A4BA3F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Mar 2025 10:05:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F116024F;
	Mon,  3 Mar 2025 10:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F116024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740992742;
	bh=PNaNRxQFWDKjY8BZdQKeH+iyaP6Umk6pm1DEjJLlqXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HSwVb93Mz3FHDg9YRR18pGBLUNWqXkluJYydL/FYfBuSngI0b0gdAghvhJpM6beeg
	 r3bWIQNiRO8RJ52yeM7gETdf2dCHjMztjXVN3UH3kQHKRtcJj2lKsRKRuwChpUBbhZ
	 D1E+p6tICviU0NSAPtO97g+JRLxr95BC20zIpjXs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98A09F805B4; Mon,  3 Mar 2025 10:05:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0796CF801F7;
	Mon,  3 Mar 2025 10:05:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC1AFF80424; Mon,  3 Mar 2025 10:04:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FF46F800FA
	for <alsa-devel@alsa-project.org>; Mon,  3 Mar 2025 10:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FF46F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kBnmgRDq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740992638; x=1772528638;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PNaNRxQFWDKjY8BZdQKeH+iyaP6Umk6pm1DEjJLlqXk=;
  b=kBnmgRDqfZ4oBpVZnqpU7halGwXX9lDRtKse4iFBgQhJADOack4V3+YI
   ZSAVChKJzmO+lTk4A7INjJsyhpT9Kirvza6uyi7R7gd61fBsyPHGcZJtX
   isHwmTC0rEVYbPKofPPYb2Eu6w3ImJw/REb+2TXI5AYtkd47ufUgO715W
   54ykfpv75P7TTAAZxFJBKsqrZ2VhzlhMKfc1XsAY5Le/c8uAUVN0MnV/2
   oHfSaBFPsXh8Jh2FXbZ7fN1/Gl6j1jFVeiJuuXcczc9N3slJP2kYChjro
   QtxhMDAZOoUG5hcWZwk75+yxQrMbCrB17NLFr0gdkIfxcm1y1YUxf7VAy
   w==;
X-CSE-ConnectionGUID: arlvhnxcRg+vnygJD2yvFg==
X-CSE-MsgGUID: +r1Rm6zgSZGTHUS5ewujvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="64306541"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000";
   d="scan'208";a="64306541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:03:53 -0800
X-CSE-ConnectionGUID: +gKGUrFOQVyFdSuTFIbX6g==
X-CSE-MsgGUID: wOhqLxr5Q2q5TxL/WRLPaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000";
   d="scan'208";a="122547368"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 01:03:51 -0800
Message-ID: <b9f54209-0690-46ba-a08f-d6bacad6cf2d@linux.intel.com>
Date: Mon, 3 Mar 2025 10:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: codecs: add support for ES8389
To: Zhang Yi <zhangyi@everest-semi.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org
Cc: tiwai@suse.com
References: <20250228100245.127413-1-zhangyi@everest-semi.com>
 <20250228100245.127413-2-zhangyi@everest-semi.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250228100245.127413-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RNINP7YFD62AS6VABSZVPCX7LZAIJWDH
X-Message-ID-Hash: RNINP7YFD62AS6VABSZVPCX7LZAIJWDH
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNINP7YFD62AS6VABSZVPCX7LZAIJWDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/28/2025 11:02 AM, Zhang Yi wrote:
> +	/* clock inversion */
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		break;
> +	case SND_SOC_DAIFMT_IB_IF:
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		break;
> +	case SND_SOC_DAIFMT_NB_IF:
> +		break;
> +	default:
> +		break;
> +	}

This switch does nothing. Remove it?
