Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5987F5BBB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 10:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88BFF9F6;
	Thu, 23 Nov 2023 10:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88BFF9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700733323;
	bh=h4u+Z4PevK+HccYSFyk9MZh1m/3uRe4+K6fsxaTqZzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NIhhKup5GS63njmRlmwiQYfHkp159YGuxGJcw8ClwLbdKg32eCK65OCTF6KKgKsrB
	 WwU7cZn68mJqb8Ywh05mfbV5ZPwQ+yjAzedrrfzwYHUDqnQ4clDmRRzR7y/qzneySP
	 DEndTzRLQ1Cs4kpQj6VY0qAWVAk739wv1tthlswI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06AC7F8059F; Thu, 23 Nov 2023 10:54:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A37F8055B;
	Thu, 23 Nov 2023 10:54:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D02CF802E8; Thu, 23 Nov 2023 10:54:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3554F80166
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 10:54:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3554F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OEOul13w
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6D358B82A4F;
	Thu, 23 Nov 2023 09:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE9CC433C8;
	Thu, 23 Nov 2023 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700733265;
	bh=h4u+Z4PevK+HccYSFyk9MZh1m/3uRe4+K6fsxaTqZzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEOul13wUWM1V1seWURR8g8h66cbFpwNNVN7LH0fFQNPSjTpFQHZChPKKLDhOsuHU
	 XESZktq2bXQFoApB41k1Ru89s7tRN1HgK8OnRK3FOFkbzfDQznhseFn8iKEHeP5BQW
	 vsZiykJEYqpPwrZrIaKLPzRbAJvo3WxQwhHDqG9r5r9AhBDaB+BOyxnWDsVBsPOBdn
	 X67kHRdFPAFABq+Gr0110OtPcG0JLmWhv1MEJU+4rKs0zClbMBFzUyPese7y/h1pEw
	 QhY2rs283QA8Rc7KwrJPyVLMpfOpl8mlgnnOpR0J3SPGWjsfcIQXjDqZwasWklqHLl
	 4iSTpyCzbg55Q==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r66Py-0005N4-1e;
	Thu, 23 Nov 2023 10:54:43 +0100
Date: Thu, 23 Nov 2023 10:54:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <ZV8hYid_Gc0hE4xg@hovoldconsulting.com>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
 <ZV4hMR8oGQBSbnMl@hovoldconsulting.com>
 <2023112225-crop-uncle-9097@gregkh>
 <ZV4xH0lBhlwWYtLO@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV4xH0lBhlwWYtLO@hovoldconsulting.com>
Message-ID-Hash: X2IKJTGYJKFLIPGYSESOV6KJQ6GQ3H3U
X-Message-ID-Hash: X2IKJTGYJKFLIPGYSESOV6KJQ6GQ3H3U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2IKJTGYJKFLIPGYSESOV6KJQ6GQ3H3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 05:49:35PM +0100, Johan Hovold wrote:
> On Wed, Nov 22, 2023 at 04:35:17PM +0000, Greg Kroah-Hartman wrote:
> > On Wed, Nov 22, 2023 at 04:41:37PM +0100, Johan Hovold wrote:
> 
> > > These fixes are now in 6.7-rc1 as
> > > 
> > > 	f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")
> > 
> > This doesn't backport cleanly, can you provide a working backport?
> 
> Sure, I'll do that tomorrow.
>  
> > > 	805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")
> > 
> > Now queued up, thanks.
> 
> I don't think this one will build without the former so better to drop
> it from your queues and I'll send backports of both patches tomorrow.

I've just posted backports of these commits to 6.6.2 here:

	https://lore.kernel.org/lkml/20231123094749.20462-1-johan+linaro@kernel.org/

They should apply to 6.5.12 as well.

Turns out we had a conflict with commit 3efcb471f871 ("ASoC: soc-pcm.c:
Make sure DAI parameters cleared if the DAI becomes inactive") which was
just backported to 6.6.2 and 6.5.12.

Johan
