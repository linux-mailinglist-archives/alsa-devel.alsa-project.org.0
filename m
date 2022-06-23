Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60D557DB4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 16:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28BCB1AAE;
	Thu, 23 Jun 2022 16:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28BCB1AAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655994310;
	bh=+bD2V2iWKvm21ox+KToP6AK4MTa29ku3ra29vsGsxVk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t45Uy4eA+LnlzN32uFIjOi6EnAbSdldeMK9lvKruqtQ+V+Wbm4maHaX2wmvqYrLJ6
	 2p9c75ox98FHWerG05/kxFQGwUvfXyWVnxu2zK/0CPKYFvUwatVTTfqJvYuuOIlMPk
	 8WmSgvycSQH1l/yNZxklWMPDIPU2aHZ+yy4CJ7yU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A42CEF804CC;
	Thu, 23 Jun 2022 16:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51378F804C1; Thu, 23 Jun 2022 16:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24C51F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 16:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C51F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rS+jPNdg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7321F61DD9;
 Thu, 23 Jun 2022 14:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4785AC3411B;
 Thu, 23 Jun 2022 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655994237;
 bh=+bD2V2iWKvm21ox+KToP6AK4MTa29ku3ra29vsGsxVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rS+jPNdgTw3Gkrqs8Zourjr6QGvxLaoT1ZHgvUrnDejhzaQDGrpD+VjE15Gf9Pxrn
 hciwZI7rtVUi4xf2kQRE7tWxer32fIE1Wmd9phObmEk96YyakbIp11zOSPdMVXlrOw
 Njfj0C7E7wub4PP+6S1ZOHK4iZdjd+kN/lUYyYcn5psyxENtm7Dyk3+cmq8iaN0tSg
 D7aVEXAZcAVQ3kio51i1gg6Dz3COO2CaVfIxXSzJrTYnKKl8oOa86rU5be03WHJvWP
 bxo5Da8wd9feJSbTW91Psd0ebcXt2ZgMkF+fWt+r5TTuSgavrafLT+KmcscRoyF3mI
 M8Lh/JAzed8Ew==
Date: Thu, 23 Jun 2022 15:23:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 07/11] ASoC: codecs: rt274: Enable irq only when needed
Message-ID: <YrR3eUVD2q/0hajv@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-8-amadeuszx.slawinski@linux.intel.com>
 <YqIBRGNAOfxPJjc+@sirena.org.uk>
 <5d453e11-4a46-bfdc-973e-8d65d891421f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="odEVId8Em7F/rAtu"
Content-Disposition: inline
In-Reply-To: <5d453e11-4a46-bfdc-973e-8d65d891421f@linux.intel.com>
X-Cookie: Honi soit la vache qui rit.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--odEVId8Em7F/rAtu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 03:53:09PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 6/9/2022 4:18 PM, Mark Brown wrote:
> > On Thu, Jun 09, 2022 at 03:35:37PM +0200, Amadeusz S=C5=82awi=C5=84ski =
wrote:

> > The driver could use some cleanup of the interrupt handler, it currently
> > unconditionally clears anything that fires and reports IRQ_HANDLED but
> > should only report IRQ_HANDLED if there was anything from the device.
> > Practically speaking it shouldn't make much difference unless there's
> > spurious interrupts or the interrupt gets shared.

> While this sounds fine, in tests I see that irq handler gets called around
> ~800 times per second even when we unload platform driver and there is no
> one caring about jack detection... in this case I would consider this to =
be
> a waste of CPU time and would prefer to just outright to disable it. Is
> there some better way to avoid unnecessary calls to irq handler?

> Main reason why I even looked at this is pr_debug() present in
> rt298_jack_detect() which kept spamming our debug logs (~800 lines per
> second fills up logs rather fast...). It should probably be removed, as
> rt286 and rt274 do fine without having this logged, but they also call irq
> handler quite a lot if you add message log for debug.

If the jack detection is firing hundreds of times a second without there
being an event that seems like a serious problem with the way the
hardware is set up which should be fixed, I'm surprised that this isn't
disrupting things normally.

--odEVId8Em7F/rAtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0d3gACgkQJNaLcl1U
h9BfHAgAhXLuUBZDEvCBzPed8OusCOp8E/tchFrVHPvZ5+1u5rnXuiwLyQYq7yPK
p/R+JQCHTalYTJBtvteEyr5ziyQIFFKrhzeOaoMHnZawbyVXe5O4+ho5i/tKbHvQ
T3lMyB+CD5pjDX7qkHVQoOYc3y1qkiTQ4Wv5xsrOCEiDxOQDys93DUv69ZdPLy+n
ZRfGJKHrDF+XaH4n9Q1qJujTVBguH9XWIrHFw7/PdOYBdAFK7NQ3Gd7INdJDoRDn
87J8jl0hO+n5gvpHdM1pzM99gWzeldwhLRDiOzrsij2IZMG3kDIlgBfRObVGoqNf
eZ+WbPVAgW0EUvU56+tTUhTWQ8X6IQ==
=zW4I
-----END PGP SIGNATURE-----

--odEVId8Em7F/rAtu--
