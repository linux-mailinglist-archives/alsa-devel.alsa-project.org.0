Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3D6707E41
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFBC204;
	Thu, 18 May 2023 12:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFBC204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406384;
	bh=OEsmFwu/cpDpmVYHOlnR6kgOrF7LF45oxTg03gNqr2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GQ+XgCzWYQy9h7wwzME2t532A6ua4RGlnL7Dbb99AXv1fvFfI7RyKYp6v0KWDQZmp
	 GPIPhAhnO4cR8AcpOrWNpgeG6PW5Bl9wde3gsDfk3lAtePFSUxUkxmMuQ2c8KblA/l
	 d1X/lgIMBYCkQYZ4EH/uWiNjJ81R+jTAJiXzfH5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEBD1F8057A; Thu, 18 May 2023 12:38:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 615D0F80578;
	Thu, 18 May 2023 12:38:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03DB8F80579; Thu, 18 May 2023 12:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BDEEF8055C
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BDEEF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V8t3CvnK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406289; x=1715942289;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OEsmFwu/cpDpmVYHOlnR6kgOrF7LF45oxTg03gNqr2o=;
  b=V8t3CvnKcuEFt4/ny3UAuSWdBLvH4FlXdY56/N+/WfLLweQ7DNSQRrbt
   0in0weobJJRaEPhKf9hExmUX7M9lv4ccRHcDFXBliPPrYr+NJSMZ1/8lq
   8mEiaHISK4hIwWhiU/0Y7vhviOG5Z5SGcB0RgfTn6eTKNmAI4nmWnFss4
   yxYlbAaDoMOShToDXs+ptQyiZ/48pmyxjjjg+jO5TiKERmPa53zbtM+El
   Exi5WbYVN5g9OC2pkD0w+d8rXxDeU9IxxM3JLwi7J2m9BtRb2rqVf9XOH
   IcHaLUjc9SQzyBOyfJctKE9fmICYsRb82hxx2ei0f5zD53a2oFqnZaJM5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349544890"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="349544890"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791929570"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="791929570"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:04 -0700
Message-ID: <a85c11b8-7e53-a90d-1f38-a43bd24717e6@linux.intel.com>
Date: Thu, 18 May 2023 12:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
 error
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87y1lmp4xb.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87y1lmp4xb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N3QMY4DIEUCQACXYKHRF3EQZU2RQSYDK
X-Message-ID-Hash: N3QMY4DIEUCQACXYKHRF3EQZU2RQSYDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3QMY4DIEUCQACXYKHRF3EQZU2RQSYDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:46 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() (A) checks dai_link status, and indicate error
> if it was not matching (B).
> 
> (A)	static int soc_get_playback_capture(...)
> 	{
> 		...
>   ^		if (dai_link->dynamic && dai_link->num_cpus > 1) {
>   |			dev_err(rtd->dev,
> (B)				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
>   |			return -EINVAL;
>   v		}
> 		...
> 	}
> 
> We can use 100 char for 1 line today. This patch cleanup error code line.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

