Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC94765019
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 11:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7591183B;
	Thu, 27 Jul 2023 11:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7591183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690451168;
	bh=g6SJFzfR1u7gEVgXQN74QXtzHLJDaFdmGc9pRr2lg4Q=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XbBzXgAO/rr3oDnKYtiVlsJN02O8+cF2ClCi/25QyU08Cx62n/ZM7TWNEiv4fX02t
	 evS6dEpQQoOoVjao42dnjzsSPY0pweocor5sduQ0F4HIk8zUjOXAHaGNLNoHFDa4QU
	 VIRQfviTmXMmj7KKMWIAcP3A/Ei5Hne/Vll+vwaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E99C2F80310; Thu, 27 Jul 2023 11:45:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C3A5F80163;
	Thu, 27 Jul 2023 11:45:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2730DF8019B; Thu, 27 Jul 2023 11:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AD33F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD33F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zx05V47M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690451108; x=1721987108;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=g6SJFzfR1u7gEVgXQN74QXtzHLJDaFdmGc9pRr2lg4Q=;
  b=Zx05V47MDWlNdGTRXrsQqtfN0S5LrJ+fhcfPu+9ozIXrD0tAM1nFxAMR
   EckxpmGkz0f5RufpFgza7HeVeR9m8XLpCbFe90J/i0s0AkHf2Dh7nMIj6
   0IvBLQoFf16uqAz6eN6Zqi9jT2SRTZSijc1ivX14aJuIMG9xOP38Iwv60
   o7YTW+gzwynKruOY4u2sWOngOCHXwo7jfpNicfuazNRdYeGSMH+gFUzTc
   cWDX8PRnnBME+2cOcvp53AX2KlYtHDQ0BxENWT1Iimi0FIQg4NA0zF/5V
   MphEmqq4JslNFMMbBniaeKFjhEdguZBcGsnBJemquQwXrLVkWVIc3GW8x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399200669"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200";
   d="scan'208";a="399200669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 02:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704114697"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200";
   d="scan'208";a="704114697"
Received: from rbirkl-mobl.ger.corp.intel.com (HELO [10.249.38.108])
 ([10.249.38.108])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 02:45:03 -0700
Message-ID: <c2f5a9ec-2927-f9bf-86a1-3388d0bac015@linux.intel.com>
Date: Thu, 27 Jul 2023 11:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: How do I set up multiple codecs on one I2S - without TDM?
Content-Language: en-US
To: John Watts <contact@jookia.org>, alsa-devel@alsa-project.org
References: <ZMBRMnv0GQF4wyfQ@titan>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZMBRMnv0GQF4wyfQ@titan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QJ5ZSR6QT2N2Z37HX4ZEIWMCI352E2DZ
X-Message-ID-Hash: QJ5ZSR6QT2N2Z37HX4ZEIWMCI352E2DZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJ5ZSR6QT2N2Z37HX4ZEIWMCI352E2DZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/26/23 12:48 AM, John Watts wrote:
> Hello there!
> 
> I have an interesting problem that I'm trying to solve. It will require
> writing adding driver support but right now I'm struggling to understand
> how I should go about it all.
> 
> As a background, this is with the Allwinner D1 or T113. It has a 16
> channel I2S controller and each channel can be configured to use a
> specific pin and TDM time slice. Even channels are low LRCLK, odd are
> high LRCLK.
> 
> So for my situation I want to have six channels:
> 
> - Channel 0: Timeslot 0, Pin 0, LRCLK 0 -> ADC 1
> - Channel 1: Timeslot 0, Pin 0, LRCLK 1 -> ADC 1
> - Channel 2: Timeslot 0, Pin 1, LRCLK 0 -> ADC 2
> - Channel 3: Timeslot 0, Pin 1, LRCLK 1 -> ADC 2
> - Channel 4: Timeslot 0, Pin 2, LRCLK 0 -> ADC 3
> - Channel 5: Timeslot 0, Pin 2, LRCLK 1 -> ADC 3

It would help if you described what those different 'channels' are 
supposed to transmit. Usually channels mean a group of data that is 
rendered at the same time. It looks like you plan on transmitting 
independent streams that may be enabled/disabled separately.

Also you should describe if there are independent clocks or if all those 
6 'channels' are transmitted with a single pair of bit/frame clocks? 
That completely changes the model, in the former case you could 
represent independent DAIs/dailinks but in the latter case you really 
have a single muxed stream.


