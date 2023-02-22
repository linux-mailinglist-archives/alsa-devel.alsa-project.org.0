Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A469F148
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 10:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AB65EA2;
	Wed, 22 Feb 2023 10:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AB65EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677057756;
	bh=TgIaH9NMwPd4IhHNqQrT8ss2+K0UDdLN1lq1CLdEZCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gtrnhDZE6yKcnXuSgWHDnbUoWQSgEFTJ4sedSqiiX/27ChlgZu5BbVnIYwRRyTHOH
	 y/AvJU9sgBCGEBLFyMLKPisbgoLZjW0uFTnM6aaf50Ekv3HGAJUUpp7Vpm6/IAV8Lw
	 p9u2UJx2E9i4XgEjpbdHPx6wcI7XY+uH46hAABxY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 156A4F80496;
	Wed, 22 Feb 2023 10:21:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D837F804B0; Wed, 22 Feb 2023 10:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14F8DF8047C
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 10:21:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F8DF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=w1SvIo8T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9936A61275;
	Wed, 22 Feb 2023 09:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE8BC433EF;
	Wed, 22 Feb 2023 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677057665;
	bh=TgIaH9NMwPd4IhHNqQrT8ss2+K0UDdLN1lq1CLdEZCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w1SvIo8TA/ZkeGpPbu4v1va1H22ECi2GS/Kb6d3Y+5sxapIw0kZYFBUWTzJetBkwd
	 qXnzkkqXCQzjsCwmS+UnCzOapWwSpROaY3AUeTHvlaAurUoVyye5MREZkerH8Z06Pe
	 XxsAVLaZoKjjjgDSX6y81ebjN5UrdKXW6QZ8Oqss=
Date: Wed, 22 Feb 2023 10:21:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/Xefn/76JW1C03d@kroah.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
Message-ID-Hash: UXMPUPKVPPLJRACGHJKQICYVCA4N2XRB
X-Message-ID-Hash: UXMPUPKVPPLJRACGHJKQICYVCA4N2XRB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXMPUPKVPPLJRACGHJKQICYVCA4N2XRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:
> вт, 21 лют. 2023 р. о 21:27 Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> пише:
> >
> > On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> > > FM34NE is digital sound processing chip used for active
> > > noise suppression mainly on ASUS Transformers.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/Kconfig          |   2 +
> > >  drivers/staging/Makefile         |   1 +
> > >  drivers/staging/dsp/Kconfig      |   7 +
> > >  drivers/staging/dsp/Makefile     |   2 +
> > >  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
> > >  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
> > >  6 files changed, 1221 insertions(+)
> > >  create mode 100644 drivers/staging/dsp/Kconfig
> > >  create mode 100644 drivers/staging/dsp/Makefile
> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h
> >
> >
> > Sorry, but why is this going into drivers/staging/ at all?  What is
> > needed to be done to get this out of staging?  Why not do that work
> > right now?  At the least, we need a TODO file in the directory that
> > lists what needs to be done and who is responsible for it.
> 
> Because this driver sets up fm34 and switches it to bypass mode allowing
> sound to work on the device. There is no dsp framework in kernel which could
> be called to operate dsp from the actual sound codec. (If there is, I
> would be glad
> if you show me). Fm34 must be active only on DMIC use, all other cases require
> it to be in bypass.

That does not explain at all why this needs to go into drivers/staging/
and not the normal portion of the kernel.  Why this specific location?
What is wrong with it that requires it to go here?

In other words, you need to document _WHY_ it must go here as it is not
obvious at all.

thanks,

greg k-h
