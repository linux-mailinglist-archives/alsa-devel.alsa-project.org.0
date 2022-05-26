Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A3534CE1
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 11:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A7016D1;
	Thu, 26 May 2022 11:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A7016D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653559126;
	bh=jyA/7RWAV9Y0Oq627zy9yw/ca5pcu7WYJ2a7t9DaETU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCHv11JyMvRQ7Y0lANosFG796rXHWkcLiWHFORr3MntdeLj137AIN1oOiRcIoY0YQ
	 LjvVb8RVqkyL08b/Um1BR89EstKmKIkUA/c/Z0+cF+4OXOQajXsr3e6QoJ57Co9EG8
	 obBQCe7PrHTQTZZQ024rmSm3+dvumybY8hXZ92gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3C2F80171;
	Thu, 26 May 2022 11:57:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16943F8007E; Thu, 26 May 2022 11:57:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A6DF8007E
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 11:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A6DF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VVCfNfTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653559064; x=1685095064;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jyA/7RWAV9Y0Oq627zy9yw/ca5pcu7WYJ2a7t9DaETU=;
 b=VVCfNfTpO7+09ExSVC9fQXbH1Hbrl+99TEbhtH9IdGl8tG27c65wggRJ
 2AzpxCfGMW0jsrsRopa43pueu/UaJjsbxgmvOfDlqMO2ZDAw5FCMwf2DE
 6tSAfLbXBREEvPP4pWZPOmWhyEpPXncAjC2HvNvBEbxStwdEnrQayUKBd
 cliw7hhDANT3TgYaet6iij249cfRdpCCMh3FQNA9tQ20VbZOR5S6tJkRm
 yfdB6/2M5BYM3nw0n1cs1SDzA7Z6FfQKnbOhEp9VaC44TnV6Bb+tC0re0
 6ubvCpNIJsn2d/k93c0733HijJ0VLRMRW9YJdPXg5pbcRjD6R20RYOnIw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="360493853"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="360493853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 02:57:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="602963984"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.251])
 ([10.99.249.251])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 02:57:39 -0700
Message-ID: <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
Date: Thu, 26 May 2022 11:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/26/2022 4:13 AM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your feedback
> 
>>> 	+-- basic board --------+
>>> 	|+--------+             |
>>> 	|| CPU ch0| <--> CodecA |
>>> 	||     ch1| <-+         |
>>> 	|+--------+   |         |
>>> 	+-------------|---------+
>>>
>>> 	+-- expansion board ----+
>>> 	|             |         |
>>> 	|             +-> CodecB|
>>> 	+-----------------------+
> (snip)
>>> I'm not sure how to count the Card, but
>>> "basic     board sound" is 1st card,
>>> "expansion board sound" is 2nd card for us in intuitively.
> (snip)
>> did you mean 'channels' or 'streams'?
> (snip)
>> If however the 'ch0' and 'ch1' can be independent content then this
>> configuration would make sense indeed, and it would be quite similar to
>> the ideas on the Intel side.
> 
> These are independent sounds.
> It is working for us if we merge these into one Cards, but...
> I'm OK and will do nothing if no one want to have multi Card connection.
> but I'm happy to work for it if someone needs it.

Well, this sounds like what we did in avs, namely we split cards 
separately based on endpoint. Main driver decides what endpoints to 
expose, based on ACPI detection and ACPI match rules, see [1]. For 
example in our model it is possible to have 2 separate i2s codecs 
connected and each having its own card. From avs driver we expose 
snd_soc_dai_driver with 2 streams (playback and capture), see [2] and 
then tell machine driver to just connect them to codec [3] - look for 
"SSP%d Pin", "ssp%d Tx" and "ssp%d Rx". Connections between "ssp%d 
Tx"/"ssp%d Rx" and userspace FE are handled by topology in our case, but 
should be easy to expose without it, if you don't use topologies.


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/board_selection.c
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/intel/avs/pcm.c#n946
[3] 
https://lore.kernel.org/alsa-devel/20220511162403.3987658-8-cezary.rojewski@intel.com/T/#u
