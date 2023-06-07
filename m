Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11084726839
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 20:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1661820;
	Wed,  7 Jun 2023 20:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1661820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686161728;
	bh=Lup3SSX0toSAffqCtJnhGGSXHzvRnzC/lPSKa+8Ez00=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u3trVRwZw/Z4zgLNJnUiJjSeIsGPkif1nDzE/FgPbM8P/lUHEPHYshn9ZisZJeCQ1
	 WBO/LlpiJ4qjalNaOtjBkOjyphiyGwi0iW4400zpCiiPKpDQpV8jo6lH7PlrMNbi5e
	 nDWm+SFffEs52uUe4Aw7xVhaXdXeUKC2hGawSdmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02602F80494; Wed,  7 Jun 2023 20:14:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20644F8016C;
	Wed,  7 Jun 2023 20:14:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2189F80199; Wed,  7 Jun 2023 20:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE2DDF80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 20:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE2DDF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FGq4pER3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686161637; x=1717697637;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Lup3SSX0toSAffqCtJnhGGSXHzvRnzC/lPSKa+8Ez00=;
  b=FGq4pER3VfZRQ266HDAtgB/6rtB0RpdrxfLgftResMiPvP/j7Crb6cbh
   /ePpkC4nXtxW4umDlz9dhLxBqEbgaJzsY1Lp99G8J8bfK18RlLyFcaO51
   FuCD7LVrIfmiqF8+B+NrgA/SA5N50tgObMx7HwMMgVXmuoSkctziBMwSv
   /kfwJybwzyGnn0CIZnCBsj17iapYOGMrT26dVhzg/L7k+D/KXGv8HRFd6
   US5TWeOEpxvZh4djbyAuOAgPW1CRYeCxPQBCz8Usl1Q2yQeS/lUuOWHEn
   9T79Zd2nTNq7vOD8iHd2zehBN9uMvgjvPnNit4fT/+G1+KT7Me4FifUt1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443436322"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="443436322"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739383499"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="739383499"
Received: from sorrin-mobl3.amr.corp.intel.com (HELO [10.209.124.63])
 ([10.209.124.63])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 11:13:50 -0700
Message-ID: <3c73b1f7-e8fd-02a1-a4c7-a0fe33423966@linux.intel.com>
Date: Wed, 7 Jun 2023 13:13:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 alsa-devel@alsa-project.org, bard.liao@intel.com,
 - <patches@opensource.cirrus.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
 <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
 <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
 <20230607170520.GM68926@ediswmail.ad.cirrus.com>
 <042775c7-0d61-441b-8684-80960d041bdc@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <042775c7-0d61-441b-8684-80960d041bdc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B2BSOQDH5C5XK424TOCNWY5XIN3RLXJI
X-Message-ID-Hash: B2BSOQDH5C5XK424TOCNWY5XIN3RLXJI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2BSOQDH5C5XK424TOCNWY5XIN3RLXJI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/7/23 12:18, Mark Brown wrote:
> On Wed, Jun 07, 2023 at 05:05:20PM +0000, Charles Keepax wrote:
>> On Wed, Jun 07, 2023 at 05:22:45PM +0100, Mark Brown wrote:
> 
>>>> This is questionable when the CPUs are connected to different links.
>>>> SoundWire is not a giant switch matrix, there's a clear parent-child
>>>> dependency and limited scope.
> 
>>>> Example topology for a 2 link/4 amplifier solution.
> 
>>> Or a system with two distinct I2S DAIs (TDM is another thing).
> 
>> I guess the bit that slightly phases me here is, historically a
>> DAI link has been the thing that specifies what is connected to
>> what. What kinda happened when we added multi-cpu is we bent
>> that assumption, at least for the N -> N case, and now even
>> more so for the N -> M case, where only a subset of the DAI link
>> is actually connected.
> 
>> If your system looks like:
> 
>> CPU A -> CODEC A
>> CPU B -> CODEC B
> 
>> What makes this a single DAI link, rather than 2 DAI links? And
>> does the information within the DAI link about what is connected
>> to what not just start looking like DAI links?
> 
> Ah, indeed.  My expectation would be that for things on the same
> physical set of wires we'd at some point be able to get to a point where
> the the SoundWire routing would be exposed to userspace for control,
> probably at the point where we get digital routing working (whenever in
> the far far future that might be, it's only been a bit more than a
> decade thus far).  I have to say Pierre's example looked like two
> separate buses.

They are separate buses indeed at the hardware level, and even on the
Linux side we have one manager device per link.

The key point is that all buses are synchronized with a common hardware
signal, typically 4kHz, on the SOC/PCH side.

The dailink .trigger is translated as a multi-link bank switch which
will start transmission exactly at the same time on all links.

That's the big difference with using multiple dailinks, if we had one
dailink per physical pair of (clock, data) wires, we would not be able
to synchronize amplifiers, leading to random phase offsets between
amplifiers. Not so good.



