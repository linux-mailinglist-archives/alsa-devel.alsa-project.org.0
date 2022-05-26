Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E392D53502F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 15:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 815691689;
	Thu, 26 May 2022 15:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 815691689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653572981;
	bh=GuoFXDiRXaXcgwQBZz/i8/dhCB+VHSPf8mwyNLB9tUo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kyfR9kdxIYtCVgOCp3v9sq8eXOig+ypErskL3bkmormy4iUdREYxGaqxYJFeEYhJX
	 M9nIX9KTjQCjC8nmHqdldm9clu+RqDOj/YqeQov9cHl1Hf+6o8Oob2BKSMiftkeFgj
	 L53GLYQmFWx9jm1RB6EhQukL21qLahmRhrmDmjMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA106F80171;
	Thu, 26 May 2022 15:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30CF2F8014B; Thu, 26 May 2022 15:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE3BF800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 15:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE3BF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FvUMWD1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653572914; x=1685108914;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GuoFXDiRXaXcgwQBZz/i8/dhCB+VHSPf8mwyNLB9tUo=;
 b=FvUMWD1m5Dnj2NE8fTQL54wBFL6659J2yv37em1+3fBu2uZq3mj73ZUb
 dOVoh+IvVC5Ckav5uUHVMAwZGB9u9dSlOtsYsJY19hznNqmBBM87tYyPZ
 gI5DrkPhD408EXHQ7jtZUdX6ImLRAbIHYC8YZwiecYrryfxoOYHIysiey
 So4IkiYHUGog9Y23511+592RvH+UXQFi3X9YxwoxRjCfrh3VMxMeBnGW9
 rlNovgMhtTccGuwWPCx1Y/frbB81VOTw8whojCfcHOyYZjNCtpqu9G0Tr
 97HTZxHN/BSebuFG34u02+3Sxc91PKMQd8V/CnwCF+Lg1sQIVx6wYiO8G Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="271733624"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="271733624"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 06:48:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="578872243"
Received: from sgourshe-mobl1.amr.corp.intel.com (HELO [10.251.3.95])
 ([10.251.3.95])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 06:48:27 -0700
Message-ID: <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
Date: Thu, 26 May 2022 08:48:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/26/22 04:57, Amadeusz Sławiński wrote:
> On 5/26/2022 4:13 AM, Kuninori Morimoto wrote:
>>
>> Hi Pierre-Louis
>>
>> Thank you for your feedback
>>
>>>>     +-- basic board --------+
>>>>     |+--------+             |
>>>>     || CPU ch0| <--> CodecA |
>>>>     ||     ch1| <-+         |
>>>>     |+--------+   |         |
>>>>     +-------------|---------+
>>>>
>>>>     +-- expansion board ----+
>>>>     |             |         |
>>>>     |             +-> CodecB|
>>>>     +-----------------------+
>> (snip)
>>>> I'm not sure how to count the Card, but
>>>> "basic     board sound" is 1st card,
>>>> "expansion board sound" is 2nd card for us in intuitively.
>> (snip)
>>> did you mean 'channels' or 'streams'?
>> (snip)
>>> If however the 'ch0' and 'ch1' can be independent content then this
>>> configuration would make sense indeed, and it would be quite similar to
>>> the ideas on the Intel side.
>>
>> These are independent sounds.
>> It is working for us if we merge these into one Cards, but...
>> I'm OK and will do nothing if no one want to have multi Card connection.
>> but I'm happy to work for it if someone needs it.
> 
> Well, this sounds like what we did in avs, namely we split cards
> separately based on endpoint. Main driver decides what endpoints to
> expose, based on ACPI detection and ACPI match rules, see [1]. For
> example in our model it is possible to have 2 separate i2s codecs
> connected and each having its own card. From avs driver we expose
> snd_soc_dai_driver with 2 streams (playback and capture), see [2] and
> then tell machine driver to just connect them to codec [3] - look for
> "SSP%d Pin", "ssp%d Tx" and "ssp%d Rx". Connections between "ssp%d
> Tx"/"ssp%d Rx" and userspace FE are handled by topology in our case, but
> should be easy to expose without it, if you don't use topologies.

It works for ACPI because the platform driver can check if specific
_HIDs are present or not, and decide to create different platform
devices for different cards, with resources split in different
components. In other words, there is no strict boundary between platform
and machine driver, the platform has all the information needed.

I don't know if it's feasible in a Device Tree environment: the DT blob
exposes the machine device, which uses *references* to resources exposed
by platform and codec drivers. If there were multiple machine devices
for different cards, how would that split of resources between different
components be done?

The current ACPI approach will also not work if we move to a generic
machine driver for SoundWire platform, with one or more devices exposed
in ACPI for the board-level composition. If the machine devices are NOT
created by the platform driver, I don't see a clear solution to support
multiple cards.

> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/board_selection.c
> 
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/pcm.c#n946
> 
> [3]
> https://lore.kernel.org/alsa-devel/20220511162403.3987658-8-cezary.rojewski@intel.com/T/#u
> 
