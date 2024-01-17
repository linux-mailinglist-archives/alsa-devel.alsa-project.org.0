Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9428301E8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 10:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A916B857;
	Wed, 17 Jan 2024 10:08:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A916B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705482542;
	bh=/dPCBxX9NtYra0koFE41eeYgs1qT5c5J5e0WBloEftE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HxzLYpD1zYmMOHYcyI4VSSkFAr+e+D4ogi57IDdOUp7H7VxjoLQNGi5Tn0JPWVxXt
	 NpE63LHzcnlYy9V50wDm2fSd5bCdeZ0HY5r4soxJ7HQCYTeu/6PN+DCLiSAxq05Jkk
	 JjcdH77RImc1XFO3ETLiXLfqKoAaxV+Vq1lRmnl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60086F8057C; Wed, 17 Jan 2024 10:08:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B2DAF80548;
	Wed, 17 Jan 2024 10:08:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D54F801F5; Wed, 17 Jan 2024 10:08:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3721CF802BE
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 10:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3721CF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EwfFyoFP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 413C2B8108C;
	Wed, 17 Jan 2024 09:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E08C433F1;
	Wed, 17 Jan 2024 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705482498;
	bh=/dPCBxX9NtYra0koFE41eeYgs1qT5c5J5e0WBloEftE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwfFyoFPPJKIQlb/mKFQXjLoA42JHsJe7581uZAyH5PiUdNVZg9NuN7VRq6I/2yja
	 +cgOn8V40goecsaz8cSraOaKDWK5tRQO9FU1Drtxhnar24j84hA1xrNhk3OiXwN2iN
	 /a3hbEXzo8FB631BxwHPNohViqSGmghGJGieF8HIsqLl5UYEecSN2SVXvuVqvG3hW+
	 0krW5ShJR2yPOVZBoJRHKK9A/Tn2mrwrUYfoe9H+L1dRxH36ci2FyUdOOrQsBNdjkx
	 dyRAq3gbqN9DFYHH3kUBqSimdqTiV+8eAhxTsWhBN4KxnxqUQ5RM28S2Hs6mpTIgV7
	 ix+zZs5w4rX/A==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rQ1uI-0008AG-3C;
	Wed, 17 Jan 2024 10:08:23 +0100
Date: Wed, 17 Jan 2024 10:08:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: lpass-wsa-macro: fix compander volume
 hack
Message-ID: <ZaeZBjKezfdslS2L@hovoldconsulting.com>
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-3-johan+linaro@kernel.org>
 <8bb1cad6-6a85-444a-b881-c03ab0051009@linaro.org>
 <ZaaAO8SMczq7YUAE@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaaAO8SMczq7YUAE@hovoldconsulting.com>
Message-ID-Hash: DYJCEITFOUYTR7BDMQZRWTINBKAEHYGI
X-Message-ID-Hash: DYJCEITFOUYTR7BDMQZRWTINBKAEHYGI
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYJCEITFOUYTR7BDMQZRWTINBKAEHYGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 16, 2024 at 02:10:19PM +0100, Johan Hovold wrote:
> On Tue, Jan 16, 2024 at 11:10:21AM +0000, Srinivas Kandagatla wrote:

> > This is not a hack, wsa codec requires gain to be programmed after the 
> > clk is enabled for that particular interpolator.
> 
> Ok, but then it's also broken as, as I mentioned off-list, these
> registers are cached so unless companding is enabled, the write on
> enable will have no effect.

I was obviously confused here, and indeed tests reveal that those writes
are needed for any prior updates to take effect (e.g. volume changes
while the codec is runtime suspended).

I've just sent a v2 here:

	https://lore.kernel.org/lkml/20240117090331.31111-1-johan+linaro@kernel.org/

Johan
