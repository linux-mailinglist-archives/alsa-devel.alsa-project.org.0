Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123517F4D21
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 17:47:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB34A4C;
	Wed, 22 Nov 2023 17:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB34A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700671652;
	bh=Ixoj1ZvTEGh811u0GLno9LmWU1DPcMeaYdUrYC39smM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=juwU3fiC4wrW7Y+teytpyqsTqlLsaaIFxIQ5fG+6f9XNi/vCOYlfJ7a33CTPSHdLD
	 iJB+JuhyE+fgHwcYg+ETHfFLNsB6h1Fuu7ekRFh0zMHWYO9yH6IiGI12ITPlghgFBw
	 6qQOTWeYSFfeZzAG89OXwHp7TVW8ivuzl9z776Yo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B821AF80568; Wed, 22 Nov 2023 17:47:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC880F80579;
	Wed, 22 Nov 2023 17:47:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51DB3F802E8; Wed, 22 Nov 2023 17:46:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B5D0F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 17:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B5D0F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=KkQr7SMN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8A364B8277C;
	Wed, 22 Nov 2023 16:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B59C433C8;
	Wed, 22 Nov 2023 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700671611;
	bh=Ixoj1ZvTEGh811u0GLno9LmWU1DPcMeaYdUrYC39smM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkQr7SMNtfyyFwIKjw6EOSmHJbvc0I2sZal2yPuXSVOCs9VmQTOaz/e82zJ4vBzPD
	 voPmwsbHXAH2IMnbHy72vG+BHz596cjPYEadMhXNKEU9+b2ulS5yaA8FG5HMFzNVdJ
	 KaUGbuRjwUjGcMjJnI0k4D3OCh4JG7Fpu55gefeg=
Date: Wed, 22 Nov 2023 16:46:49 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <2023112230-emphases-stardom-3d3a@gregkh>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
 <ZV4hMR8oGQBSbnMl@hovoldconsulting.com>
 <2023112225-crop-uncle-9097@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023112225-crop-uncle-9097@gregkh>
Message-ID-Hash: RJS4TTP5VDKADQBUGUNQ4W26LNQLYRUM
X-Message-ID-Hash: RJS4TTP5VDKADQBUGUNQ4W26LNQLYRUM
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 22, 2023 at 04:35:17PM +0000, Greg Kroah-Hartman wrote:
> On Wed, Nov 22, 2023 at 04:41:37PM +0100, Johan Hovold wrote:
> > Hi Greg and Sasha,
> > 
> > On Fri, Oct 27, 2023 at 01:52:11PM +0200, Johan Hovold wrote:
> > > On Fri, Oct 27, 2023 at 11:57:45AM +0100, Srinivas Kandagatla wrote:
> > > > Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> > > > to accumlate DC when ports are active but without any data streams.
> > > > There are multiple places in the current setup, where this could happen
> > > > in both startup as well as shutdown path.
> > > > 
> > > > This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
> > > > generic code do the mute/unmute on trigger.
> > > > 
> > > > This patches help fix those issues by making sure the PA is Muted/Unmuted
> > > > inline with the stream start/stop events.
> > > >
> > > > Srinivas Kandagatla (2):
> > > >   ASoC: soc-dai: add flag to mute and unmute stream during trigger
> > > >   ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
> > > 
> > > I've verified that this fixes the pop sounds when starting and stopping
> > > a stream on the X13s, even if the click sound when killing pulseaudio
> > > (e.g. on reboot) is still there (as with the previous fixes).
> > > 
> > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > 
> > > If these are accepted, can we get them backported to 6.5 as well?
> > 
> > These fixes are now in 6.7-rc1 as
> > 
> > 	f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")
> 
> This doesn't backport cleanly, can you provide a working backport?
> 
> > 	805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")
> 
> Now queued up, thanks.

And that broke the build, I'll go drop that too :(

