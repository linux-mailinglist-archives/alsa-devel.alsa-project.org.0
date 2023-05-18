Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FAE707E4E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D557A3E8;
	Thu, 18 May 2023 12:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D557A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406557;
	bh=9jkZuH1iQzZRGzUWQO5MgQn9QFDTEtoza7uhAN2R29o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qu85cu0j08FXNsNkofVv/ArTXWgu2vdzAETQFCTU2cGeL8Jy8Eot5jQT3Ju98BiLM
	 LGWcgZut1UdM1m8F3ZvDRBDQtmrHW0+Lu2hDlHSlp9sDq1YECTnH39G2YJZLjGrFPt
	 Bdu4ohn6Sqa2OzY5VBxD35mdywcfAangkFA4QQOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A90D3F805B4; Thu, 18 May 2023 12:40:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 635B2F805B4;
	Thu, 18 May 2023 12:40:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB2DF805B1; Thu, 18 May 2023 12:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D3D1F80544
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D3D1F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RBEHeS2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406438; x=1715942438;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9jkZuH1iQzZRGzUWQO5MgQn9QFDTEtoza7uhAN2R29o=;
  b=RBEHeS2Ao3W9uoFh+1MeEoDgth/W8yFs7jxFJ4Kl9ALQtlarqext3fxG
   jiZsuAYJ6xyT4dI7Il+mA9AFxW63piiYsgXKE5Q/ft3k9+NHN9PaW8f3u
   rE8vvDpO2sdmiOiEa1ScxhzpgDLXjzMM+03Uv9B5mhXZP0JpzrULuGhfT
   1URIxJ7gq8tC5ZyY+6iGaCUzPN2rdZkTAnNlDjIFHFUusyGB0Rjh5z6QE
   WW2kx/X+LTb7NTxarYnqCEfbuSRgbfE3qox5KokS0ODs/SPhGw47+dyGg
   x/JlBCmTycWFzQ+/daFynaUI7tn+sUqGW1WA9TmHX9EzAMlJJEyQeqCaU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="331648899"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="331648899"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="767149505"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="767149505"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:32 -0700
Message-ID: <529f0402-02bd-29f4-b551-18af23cefbd5@linux.intel.com>
Date: Thu, 18 May 2023 12:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 20/20] ASoC: soc-pcm.c: remove dpcm_playback/capture
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87a5y2p4se.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87a5y2p4se.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P7VAPEGT7X6BFKRAZDNXZJN6XTPJX4AM
X-Message-ID-Hash: P7VAPEGT7X6BFKRAZDNXZJN6XTPJX4AM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7VAPEGT7X6BFKRAZDNXZJN6XTPJX4AM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:49 AM, Kuninori Morimoto wrote:
> No driver is using dpcm_playback/capture, let's remove these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>


