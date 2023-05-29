Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2A7143B7
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 07:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF3B3E8;
	Mon, 29 May 2023 07:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF3B3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685337878;
	bh=bZrJR9eBZpEMvilsKjHNV6J5FAm7R9AgAJ1MoHFjfvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dj0mK/NGmvKyY9+94xujOVr+ybBpz54F+KO9eSEJY/O56HSuOVTngDfCApSz/HuYN
	 aFDyQL4Yv3Kjyk6NcPoQ6I71NXvqEnjLlqH458yZYKjspnGz/X6mx/G45EsN6tJaoG
	 4Mk1H7BPyTKbieSJ4I0kP2dMzdREVbU/Ss4x7XFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24277F80558; Mon, 29 May 2023 07:23:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CC1F8042F;
	Mon, 29 May 2023 07:23:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C52D0F804FC; Mon, 29 May 2023 07:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57BFCF8016B
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 07:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57BFCF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AUsn6FBy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 124FC61130;
	Mon, 29 May 2023 05:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A11C433EF;
	Mon, 29 May 2023 05:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685337303;
	bh=bZrJR9eBZpEMvilsKjHNV6J5FAm7R9AgAJ1MoHFjfvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUsn6FByhLWpN6LG0gcdV63wHkhPRbJ85V5XnNUlE2zHGYBrmtceo6aS4lMXVsWAr
	 AEZPqobHNkNk2EPhLRS5qT4P8N3UK988O0PD4Iam8LVFMyMHL05a/gQqE79aTRxAQE
	 O9A5NyfTr9eG0+Pj1jkoyWUV6KeAdLUJvXUraFni9LV3oX+WVSIMeki+Dkh8D1qqRu
	 h/Z4vyoKYWcok8F+KBKVlnPM/61NRV1ysMauY9/KrolreAvsaCaLpjE6nRHeRXir83
	 oLcgFQi/FSlgXEuwPK+/PMZvUObeR2XMYHSXA4aNLz4PWj+gF/xSIlYBKalxse20rT
	 yA/OwJ//ysOiw==
Date: Mon, 29 May 2023 10:44:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] soundwire: amd: Improve error message in remove callback
Message-ID: <ZHQ00/M3LnKCWu4O@matsya>
References: <20230518200823.249795-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230518200823.249795-1-u.kleine-koenig@pengutronix.de>
Message-ID-Hash: RKQ4KNCTVNUUVM6HYGSLDIM77YJZNGRV
X-Message-ID-Hash: RKQ4KNCTVNUUVM6HYGSLDIM77YJZNGRV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKQ4KNCTVNUUVM6HYGSLDIM77YJZNGRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18-05-23, 22:08, Uwe Kleine-König wrote:
> Returning an error code in the remove callback yields to an error
> message
> 
> 	remove callback returned a non-zero value. This will be ignored.
> 
> After that the device is removed anyhow. Improve the error message to at
> least say what the actual problem is. While touching that code, convert
> the driver to the .remove_new() callback which returns no value with the
> same effect as returning zero in a .remove() callback.
> 
> As the return value is ignored by the core the only effect of this patch
> is to improve the error message. (And the motivating effect is that
> there is one less driver using .remove().)

Applied, thanks

-- 
~Vinod
