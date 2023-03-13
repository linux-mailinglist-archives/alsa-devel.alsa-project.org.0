Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E876B7DC7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 17:37:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A171450;
	Mon, 13 Mar 2023 17:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A171450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678725454;
	bh=4K4OZ7QhIrlKqDV5LSZoXddk+iy3Ac1/wXw2U+H9fXs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ahWK6fxCZqOQxlj1n1raXRSKvOpC9MQroTUIDYFXekdTGrlpkssBCnh0NIfggSi4Z
	 xLPU4Urw2gqi/teL3cBixQghzWMhq8GR/A0U5TzwukDgQpupW1HpBiQ3jhmWIzpnMK
	 Dc9ESWhDWX92loyRrBKbi+4bI2CpxoqpzYkv/q68=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DF0F8032D;
	Mon, 13 Mar 2023 17:36:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A9D9F80423; Mon, 13 Mar 2023 17:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3042CF8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 17:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3042CF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EmSI3Jn+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678725393; x=1710261393;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4K4OZ7QhIrlKqDV5LSZoXddk+iy3Ac1/wXw2U+H9fXs=;
  b=EmSI3Jn+wPMsN5z7YrbUR3lpVKo1QVjeQccwS47TN0b8t5P2audDgrd8
   bOHCeCMv2FyVH3ryKQKsg1FkoQOKitJB4Ao9Hi7Sak+f6Z37QhD4JHxgy
   es+zgUSqcvdUm2+V/uYyFDlXRAcfsDzTqziu8HztgGWZWTx8igj4tuiSC
   fls3y98XVl9xLc9RHfIAZjFkT0uUo4tBteHcRSYN2Ivlw8UXih/7RxVj+
   B+gKaaUxYQpmKO09ng18VDONHmENZGLqOo9HxSiFGRHOAoysimlQUvoN5
   J3OHrUlwgE2CJBZeO0TAkKtyUG0SXg6dtP4XDC+iqSs4SJBSA31AHKZWf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339564285"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400";
   d="scan'208";a="339564285"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 09:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="822025825"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400";
   d="scan'208";a="822025825"
Received: from jlewis8x-mobl.amr.corp.intel.com (HELO [10.255.34.75])
 ([10.255.34.75])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 09:36:19 -0700
Message-ID: <d06bf4b3-9dd2-eba3-4880-6de0bfea1048@linux.intel.com>
Date: Mon, 13 Mar 2023 11:36:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: dpcm_be_connect: FE is atomic but BE is nonatomic, invalid
 configuration
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: 
 <CAEnQRZBoo+v9JRztP_on7c_C_Laei5w8XAdZ7zaHxmGYAaKSeA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAEnQRZBoo+v9JRztP_on7c_C_Laei5w8XAdZ7zaHxmGYAaKSeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZRDM3UATAJSA6HG7TCTB2IVJTMFRBNQE
X-Message-ID-Hash: ZRDM3UATAJSA6HG7TCTB2IVJTMFRBNQE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, Paul Olaru <paul.olaru@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZRDM3UATAJSA6HG7TCTB2IVJTMFRBNQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/13/23 10:10, Daniel Baluta wrote:
> Hi Morimoto-san,
> 
> I would like to know your take on the following issue.
> 
> On I.MX with SOF we use simple-card and hit the following error:
> 
>   sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE is nonatomic,
> invalid configuration
> 
> and I think it makes sense to have the BE nonatomic as set by SOF core.

The SOF core does not change the BE, does it?

The only cases where we set the BE as nonatomic in Intel board is for
the SoundWire BEs. All regular I2S/DMIC are atomic - there is no
interaction with firmware.
