Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D407F4B39
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 16:42:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08AC3844;
	Wed, 22 Nov 2023 16:42:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08AC3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700667735;
	bh=nb+vxqjeyabcUI2vBsYP+73P7f/0NpuXBP4xRLAjd7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=es/2T+vOLkXGgdgu5M18iu8FYf2q3bkVNuPVa1SNcQwolwuRrLMarZeXcrV3pmS0m
	 nS9r9BHq07ywmt2IO8Cd1vYI0poALljlTbEe4Hts+kT8r/RvEvAYd2+KLQxIMobZHF
	 j7uemBwtt+hO8+2iaRoiuBtOG1jIT5v3n+CS5Ux0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D198F8058C; Wed, 22 Nov 2023 16:41:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CB6F80579;
	Wed, 22 Nov 2023 16:41:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BED7DF802E8; Wed, 22 Nov 2023 16:41:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12630F80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 16:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12630F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BBTuAfhe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D8BC61C5A;
	Wed, 22 Nov 2023 15:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC11C433CD;
	Wed, 22 Nov 2023 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667683;
	bh=nb+vxqjeyabcUI2vBsYP+73P7f/0NpuXBP4xRLAjd7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BBTuAfhePpAotX7sRSqIyitfMkRt+aflL8y0NeRPu/6y8rucwCNTj5e3HzqmtmchV
	 5j2g1w3B5cXxxpSGUESksw5sS32gyNtJNwxbVbq2DizpTz7JiCNfN58/UXpEiYwNi3
	 QC51V/vyzOT0+dogzVgjEfH+9QjcAzNDe8n1QVpribmvrhyQjdZeaWYQ7d2GBNMwyT
	 Kn0Pt3SS1Iv4O1OMeFxLfEDaYZ64qb1oJ4lIycwKFV0EeWXm3H9oWZIzpwZnpmG0e2
	 IHO/pvW3UcLwS1b989ZaksrlU63RrN0ZgE0eLqQKBad7csdka4mJTU/Ufz4npRWNSL
	 4B9cH0yUTP/jA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5pM9-0002ln-2i;
	Wed, 22 Nov 2023 16:41:38 +0100
Date: Wed, 22 Nov 2023 16:41:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] ASoC: soc-dai: add flag to mute and unmute
 stream during trigger.
Message-ID: <ZV4hMR8oGQBSbnMl@hovoldconsulting.com>
References: <20231027105747.32450-1-srinivas.kandagatla@linaro.org>
 <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTukaxUhgY4WLgEs@hovoldconsulting.com>
Message-ID-Hash: 5L6X2H2JXZAVWJ4YEXS5IQPYZDUV7ZZK
X-Message-ID-Hash: 5L6X2H2JXZAVWJ4YEXS5IQPYZDUV7ZZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5L6X2H2JXZAVWJ4YEXS5IQPYZDUV7ZZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg and Sasha,

On Fri, Oct 27, 2023 at 01:52:11PM +0200, Johan Hovold wrote:
> On Fri, Oct 27, 2023 at 11:57:45AM +0100, Srinivas Kandagatla wrote:
> > Click/Pop Noise was a long pending issue with WSA Codecs which are prone
> > to accumlate DC when ports are active but without any data streams.
> > There are multiple places in the current setup, where this could happen
> > in both startup as well as shutdown path.
> > 
> > This patchset adds a new flag mute_unmute_on_trigger to dai_ops to let
> > generic code do the mute/unmute on trigger.
> > 
> > This patches help fix those issues by making sure the PA is Muted/Unmuted
> > inline with the stream start/stop events.
> >
> > Srinivas Kandagatla (2):
> >   ASoC: soc-dai: add flag to mute and unmute stream during trigger
> >   ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag
> 
> I've verified that this fixes the pop sounds when starting and stopping
> a stream on the X13s, even if the click sound when killing pulseaudio
> (e.g. on reboot) is still there (as with the previous fixes).
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> If these are accepted, can we get them backported to 6.5 as well?

These fixes are now in 6.7-rc1 as

	f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")
	805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")

As these fix a loud scary crackling noise on the Lenovo ThinkPad X13s,
is it possible to get these backported at least to stable 6.6 and 6.5?

Johan
