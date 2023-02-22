Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F296569F353
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 12:16:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B78BE82;
	Wed, 22 Feb 2023 12:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B78BE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677064577;
	bh=L+vlKF7HhKxFmv88Coa+zjcHwjiWGvdeEhd8PDUoiRY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jPSvY1jpJlf+Q8tf98s15K2WppxMFNX1x9FS7HeZDp/NkfYaiBUze4diFqrSRSI9c
	 HIAdH2J7dyx4o6cnh9edMmp/Xc+qNHFsjHGYLzPMlj1xjUDrUSQe/vw37bRwef742H
	 qfPOyBpOIEmlXAsUS1DP6nnbbEwf4sCXouTpXonE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABADDF80125;
	Wed, 22 Feb 2023 12:15:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06559F8025A; Wed, 22 Feb 2023 12:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4441DF800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 12:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4441DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=PJbMubh3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6FE48B8125F;
	Wed, 22 Feb 2023 11:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96280C433D2;
	Wed, 22 Feb 2023 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677064513;
	bh=L+vlKF7HhKxFmv88Coa+zjcHwjiWGvdeEhd8PDUoiRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJbMubh3B2HkoSiUZH0OTHYBRvfoY+pKE03DyTYLWPzFk4IW/FgJR4CZGvFLUr9vt
	 KvZvE4DrfmDWPImH4o3NCc8jfUpCGXkXBQMPQaDem9yw8g+P/LffaSrkBI5ywVgF8d
	 90I9pFnfH6s1j3byFYsxO0IlUgTZ4uKQ7ZVChq+M=
Date: Wed, 22 Feb 2023 12:15:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?0KHQstGP0YLQvtGB0LvQsNCyINCg0LjQs9C10LvRjA==?=
 <clamor95@gmail.com>
Subject: Re: [PATCH v1 09/10] staging: dsp: add support for Fortemedia FM34NE
 DSP
Message-ID: <Y/X5Po7Ieao3svBm@kroah.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-10-clamor95@gmail.com>
 <Y/UbMH5tXDgsvSbD@kroah.com>
 <CAPVz0n2-giCF9Z9fMimTFQnGk73HAdfU4SitGn58iZapLjeuTQ@mail.gmail.com>
 <Y/Xefn/76JW1C03d@kroah.com>
 <C94BE033-EE34-40E4-96D4-1EB4C1B04A09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C94BE033-EE34-40E4-96D4-1EB4C1B04A09@gmail.com>
Message-ID-Hash: JXGCNHCJKYTUKB3E2YVB63LZRI5TYQ4M
X-Message-ID-Hash: JXGCNHCJKYTUKB3E2YVB63LZRI5TYQ4M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXGCNHCJKYTUKB3E2YVB63LZRI5TYQ4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 22, 2023 at 11:39:59AM +0200, Святослав Ригель wrote:
> 
> 
> 22 лютого 2023 р. 11:21:02 GMT+02:00, Greg Kroah-Hartman <gregkh@linuxfoundation.org> написав(-ла):
> >On Wed, Feb 22, 2023 at 10:19:47AM +0200, Svyatoslav Ryhel wrote:
> >> вт, 21 лют. 2023 р. о 21:27 Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> пише:
> >> >
> >> > On Tue, Feb 21, 2023 at 08:32:10PM +0200, Svyatoslav Ryhel wrote:
> >> > > FM34NE is digital sound processing chip used for active
> >> > > noise suppression mainly on ASUS Transformers.
> >> > >
> >> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> > > ---
> >> > >  drivers/staging/Kconfig          |   2 +
> >> > >  drivers/staging/Makefile         |   1 +
> >> > >  drivers/staging/dsp/Kconfig      |   7 +
> >> > >  drivers/staging/dsp/Makefile     |   2 +
> >> > >  drivers/staging/dsp/dsp-fm34ne.c | 364 +++++++++++++
> >> > >  drivers/staging/dsp/dsp-fm34ne.h | 845 +++++++++++++++++++++++++++++++
> >> > >  6 files changed, 1221 insertions(+)
> >> > >  create mode 100644 drivers/staging/dsp/Kconfig
> >> > >  create mode 100644 drivers/staging/dsp/Makefile
> >> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.c
> >> > >  create mode 100644 drivers/staging/dsp/dsp-fm34ne.h
> >> >
> >> >
> >> > Sorry, but why is this going into drivers/staging/ at all?  What is
> >> > needed to be done to get this out of staging?  Why not do that work
> >> > right now?  At the least, we need a TODO file in the directory that
> >> > lists what needs to be done and who is responsible for it.
> >> 
> >> Because this driver sets up fm34 and switches it to bypass mode allowing
> >> sound to work on the device. There is no dsp framework in kernel which could
> >> be called to operate dsp from the actual sound codec. (If there is, I
> >> would be glad
> >> if you show me). Fm34 must be active only on DMIC use, all other cases require
> >> it to be in bypass.
> >
> >That does not explain at all why this needs to go into drivers/staging/
> >and not the normal portion of the kernel.  Why this specific location?
> >What is wrong with it that requires it to go here?
> 
> It is not fully functional and does not perform its main function
> (noise cancellation) because it has to be called only for DMIC. Same
> time it is essential to be set so that audio could work on device.

But why does that mean it should go to drivers/staging/?  That's not
what staging is for (broken code).

> Once there is such a framework in kernel, which allows to control dsp
> from, I assume, asoc machine driver, this driver can be moved wherever
> it should be. Currently I can not tell where it should be since I
> haven't seen dsp drivers like this in kernel.

Then work to create that, don't dump stuff in drivers/staging/ for no
valid reason.

thanks,

greg k-h
