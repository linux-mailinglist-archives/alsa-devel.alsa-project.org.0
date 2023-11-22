Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D87F4C94
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 17:36:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5929F6;
	Wed, 22 Nov 2023 17:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5929F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700670970;
	bh=jCiTz/EXMjTK7h50oLUFZRF0/L+XtJW869Se4hheoo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PlugPOVQ4dfxp6y3YNHDNttvJyLtassMH72NE0Js2NRMyC84Be5cQf8t2yqziYGVE
	 z6qlhdBDGrif3OjjS12VrhxP0ubED68ZF/Vgjj3ORcTpAVW3f6/xzIa3+28Wv0A2kl
	 hjFZOU/KGwJGTQXctLM2p9UEFjKKqJlO7VltQkBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51D99F80570; Wed, 22 Nov 2023 17:35:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1D8F8047D;
	Wed, 22 Nov 2023 17:35:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48FF2F802E8; Wed, 22 Nov 2023 17:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1462F80166
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 17:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1462F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=tdswrvCw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D5BCACE2122;
	Wed, 22 Nov 2023 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5419BC433C7;
	Wed, 22 Nov 2023 16:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700670920;
	bh=jCiTz/EXMjTK7h50oLUFZRF0/L+XtJW869Se4hheoo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdswrvCwTn9UiolI/R1GeO15xjfDbw9qg/vxvCO2iqQ/vIUsgl5zsytITMtjc2FTc
	 PvjMenX9wATuJT8g07U+ekyS3KfsEQ6rQ5CWZ7v7S6VshBXmBMvc5Tcs0xgGwLaeK/
	 kwzJ5iUspmITa5oJkHe8fjqHmjVo1+5Sd/GCTsSQ=
Date: Wed, 22 Nov 2023 16:35:17 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <2023112225-crop-uncle-9097@gregkh>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
 <ZV4hMR8oGQBSbnMl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV4hMR8oGQBSbnMl@hovoldconsulting.com>
Message-ID-Hash: FSO67ANYVPBJE2HEKK7IMLEQROJQ6LZS
X-Message-ID-Hash: FSO67ANYVPBJE2HEKK7IMLEQROJQ6LZS
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSO67ANYVPBJE2HEKK7IMLEQROJQ6LZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 04:41:37PM +0100, Johan Hovold wrote:
> Hi Greg and Sasha,
> 
> On Fri, Oct 27, 2023 at 01:52:11PM +0200, Johan Hovold wrote:
> > On Fri, Oct 27, 2023 at 11:57:45AM +0100, Srinivas Kandagatla wrote:
> > > Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> > > to accumlate DC when ports are active but without any data streams.
> > > There are multiple places in the current setup, where this could happen
> > > in both startup as well as shutdown path.
> > > 
> > > This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
> > > generic code do the mute/unmute on trigger.
> > > 
> > > This patches help fix those issues by making sure the PA is Muted/Unmuted
> > > inline with the stream start/stop events.
> > >
> > > Srinivas Kandagatla (2):
> > >   ASoC: soc-dai: add flag to mute and unmute stream during trigger
> > >   ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
> > 
> > I've verified that this fixes the pop sounds when starting and stopping
> > a stream on the X13s, even if the click sound when killing pulseaudio
> > (e.g. on reboot) is still there (as with the previous fixes).
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > 
> > If these are accepted, can we get them backported to 6.5 as well?
> 
> These fixes are now in 6.7-rc1 as
> 
> 	f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")

This doesn't backport cleanly, can you provide a working backport?

> 	805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")

Now queued up, thanks.

greg k-h
