Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39821707E45
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77517836;
	Thu, 18 May 2023 12:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77517836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406440;
	bh=3TOCDTczR6JFr1+GTXKGf9VFQvNk3v41cPOnsRAe2Tw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p/fEL3gS7gRqpxPmQuc8rXcFLA0XCkyn6ldqiYbyZAHgG0Oy2GaFC3ATUoFS/NveS
	 oMGtCINcz8lFJpg7EpTcfqpzy9KChTIC4lPoRGf5/zCxOPO7oVWWFrfKeazUjmB+sO
	 EN41frjXILU9eFBRUCf6HYs+nYR0HvFXi0sp5c/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6D05F805BB; Thu, 18 May 2023 12:38:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68803F8055B;
	Thu, 18 May 2023 12:38:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A345F805B3; Thu, 18 May 2023 12:38:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02A59F80549
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02A59F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NJRIdGng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406322; x=1715942322;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3TOCDTczR6JFr1+GTXKGf9VFQvNk3v41cPOnsRAe2Tw=;
  b=NJRIdGng59z8n0VoSjn6MwWAkWnYPm2RiMck7XCJJSzBAbdd0TQ75JPb
   FJ6PioR+y1XSaC9EwJlH6iAiI3CtkkDaorzSVw66pJNbsmYvoimAbkyGN
   J/ZAlOPriRf08uV3bo3kJZn5qGAvg48uCNjxKbu9Yqr4OF5fYsQ6HnNuC
   glIzjLnQRAdmOC0wNimDnrSohCvba7on7K9RVSISl9w2dXvjLkOqg9vqm
   xi+NeL3+NCJFJQHxkfbRifie0Vb8hvPdPLcHmQ95rQs/uMAQs6jyKxiZD
   rCEJgKR9JGWkbfHeLqFZlV4drNMszmyNxyKiGOsS/+gV/pCORyY4JKb2g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350865551"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="350865551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="735034833"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="735034833"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:37 -0700
Message-ID: <9b46f2a3-a907-ef28-c874-74b03f18b9bf@linux.intel.com>
Date: Thu, 18 May 2023 12:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/20] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part2
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87sfbup4wj.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87sfbup4wj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KQO2EEQSB5SVU3H72EQOV3FR6PPZ42V7
X-Message-ID-Hash: KQO2EEQSB5SVU3H72EQOV3FR6PPZ42V7
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQO2EEQSB5SVU3H72EQOV3FR6PPZ42V7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:47 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() (A) is handling both DPCM (X) / Normal (Y)
> connection.
> 
> (A)	static int soc_get_playback_capture(...)
> 	{
> 		...
>   ^		if (dai_link->dynamic || dai_link->no_pcm) {
> (X)			...
>   v
>   ^		} else {
>   |			...
>   |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
>   |				if (dai_link->num_cpus == 1) {
>   |(a)					cpu_dai = ...
> (Y)				} else if (dai_link->num_cpus == dai_link->num_codecs) {
>   |(b)					cpu_dai = ...
>   |				}
>   |				...
>   |			}
>   |			...
>   v		}
> 		...
> 	}
> 
> In Normal connection case (Y), it is checking number of CPU / Codec.
> 	(a) is for Single CPU case
> 	(b) is for Multi  CPU case
> 
> We can simply merge (a) and (b). Because it is doing
> same judgement, same operation.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

