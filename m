Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EFE7CA69E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 13:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D9E884B;
	Mon, 16 Oct 2023 13:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D9E884B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697455305;
	bh=q+iGd/CB7mSwhLm751mIg/egIdSJ1LHlB98uwSQYkuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qu5PL3Moz3hWIqipJUXMbwmD2rPCpqg0zU5ztlw/Ep2wxi+QaKDdaXiXV2mS5n+eo
	 PMUgkVkVjAwATyGisltC8ftTmz+L4CyWeMHzVFc0wg5tEAFh68RS0bBQawVzlB50pM
	 BtFYBTiBzLht2qQ13avBBiBNP9uM0UFyMqHkCim4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26939F80552; Mon, 16 Oct 2023 13:20:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44BEDF8024E;
	Mon, 16 Oct 2023 13:20:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CC0CF8025F; Mon, 16 Oct 2023 13:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0F7CF80236
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 13:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0F7CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p2E/Lkby
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAB3160C84;
	Mon, 16 Oct 2023 11:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC72DC433C8;
	Mon, 16 Oct 2023 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697455236;
	bh=q+iGd/CB7mSwhLm751mIg/egIdSJ1LHlB98uwSQYkuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2E/LkbyJ2VLzzGVpibk0z1VRTOc7NGRMFqw2aO48OpCL10+XTOjpwF5+zq9enCiG
	 Wtkn9/4JDjkJLTbZdPPM2nBu13E2aAVJMY+ybflPXtHC7OXmE0LY17MfjFejAXj8gb
	 9cFzLHGRfoKMAzZ49QVlhAmCObiD9YEhp9cCpQXlZ5xeOKQMs6lu9q6ejjJL8NnFzj
	 Brs8urcoBZ/eBkFh/O7C5ljjG3FTK8jrjMxbknpOGpG+sMmDYL+I9xtMngl1nmePs3
	 x+ztK4s2hkVAYP12y/VPHIam4cUhaFC7xTTRej9BfvOcZV3zsAhfFTPWGAREJ+ZDY0
	 vb1y1Dysk7Wfw==
Date: Mon, 16 Oct 2023 16:50:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] soundwire: Use snd_soc_substream_to_rtd() to obtain rtd
Message-ID: <ZS0cgDqsyEW86RSZ@matsya>
References: <20230929105546.774332-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230929105546.774332-1-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: U3NJHEEPBJCQ4RXFM55XD5JJNA2FUBJA
X-Message-ID-Hash: U3NJHEEPBJCQ4RXFM55XD5JJNA2FUBJA
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3NJHEEPBJCQ4RXFM55XD5JJNA2FUBJA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-09-23, 12:55, Amadeusz Sławiński wrote:
> From: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Utilize the helper function instead of casting from ->private_data
> directly.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  drivers/soundwire/stream.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 69719b335bcb..652aae4e221d 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1717,7 +1717,7 @@ EXPORT_SYMBOL(sdw_deprepare_stream);
>  static int set_stream(struct snd_pcm_substream *substream,
>  		      struct sdw_stream_runtime *sdw_stream)
>  {
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);

This does not exist for me, so I guess you can resend it after next
cycle when this appears in rc1

-- 
~Vinod
