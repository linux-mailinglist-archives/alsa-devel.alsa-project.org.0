Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948D54B74B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 19:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A04318C9;
	Tue, 14 Jun 2022 19:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A04318C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655226268;
	bh=N/a1+iOdz3lY2s/egNYoPVvzbpbW+nXFVLFsz9Tgkjw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3Gl4FIRJVdMcByAQKB/IqXc3cBePHFr9rG0q3xog6qqITKe5diYK/R+hTbl80SE6
	 9N0W4mE779e+gUr1wrNpMXRRXpvd84p1oRUe4gvG+t7vWV39pQFVEvxQzQCvm3nOQy
	 SsPx8IkLHu0fOhBS8UUh9fDRinHUgUFRlA8Bseq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89900F80165;
	Tue, 14 Jun 2022 19:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A510EF80139; Tue, 14 Jun 2022 19:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68524F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 19:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68524F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bWcHs0GD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9485B81A09;
 Tue, 14 Jun 2022 17:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC961C3411B;
 Tue, 14 Jun 2022 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655226201;
 bh=N/a1+iOdz3lY2s/egNYoPVvzbpbW+nXFVLFsz9Tgkjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWcHs0GDCcstiwXShOQTdUSjFxPyAaLPQ1GrB224k3jRqcwmXixhOLjdZDuvSjOLA
 60gj61afagLt4TWtujLVTdue1C7WDBAcPmGTVdis6F3QjQsQan0tvTsHLvAjuuMri9
 bS6gInK4e6jo9cUpu9j/izr7b22dTFwzPv2PpR2QvkeQX/XcThi+FNuSQTrf/88Udu
 NyhUSmA2tcQ6wdT1x+wOCrDO6IyuZBxYrc6turRtVsg+EbPHT+qSoV2hjfJvtNNhjg
 jczf2nMUlippzHQWOyVumRnjxodbII1nXVSZCKPfj4DrXL9uC2/fuoKh/FcpSE7x3T
 74GUs+UkjOE/Q==
Date: Tue, 14 Jun 2022 18:03:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: ACPI REV override for Dell XPS 13 9343
Message-ID: <Yqi/VGIi9kXtzRcv@sirena.org.uk>
References: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
 <47431e56-9acb-7c7d-307f-83d81956ec5c@linux.intel.com>
 <fb13198a-3d38-4304-6212-966561725d55@intel.com>
 <398e4885-736c-d9a9-a18d-34f69f2b63ca@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DwejfaIazyrqXF31"
Content-Disposition: inline
In-Reply-To: <398e4885-736c-d9a9-a18d-34f69f2b63ca@linux.intel.com>
X-Cookie: DYSLEXICS OF THE WORLD, UNTIE!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>
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


--DwejfaIazyrqXF31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 14, 2022 at 11:51:01AM -0500, Pierre-Louis Bossart wrote:

> It' very very hard to remove stuff, and in this case there is limited
> evidence that distributions use the DSP + I2S mode. You could deprecate
> the ACPI_OVERRIDE but you've got to leave time for distributions to switch.

At the time that quirk was done I don't think there was even DSP support
- it was just plain I2S AFAIR, no firmware loaded or at least only in
passthrough mode.

--DwejfaIazyrqXF31
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKov1MACgkQJNaLcl1U
h9DDJgf7BrR/3JwZblf81TG0J8XhpmACd2+W47xA/n5c8kvEbICLVjkEN9d4UgMP
DUcprrmV/dzpW1SUiG7JCj46JMLw0g4olhI4d+xbwQTIyxtUd7wFWI+V0oUyUEJY
W4sU2oi9rLpt/0iZUBXwPx+3E60/JF4Gp7byfHH52K/e4mdMqqeo3/OJlQajxWai
7mjQXMZez5ZRz1wmr49gG8rms4HIvjylcPFsIyDrSTDimnm3Wo4h7URRCrPrJVAl
DLCRj1JTFFXlR7a8NWqWeErb7xGdKRWNQHFDmpNdhIRy1eVyy/gmAq0gfis2K4d+
UR5c9j97Fj28CumuPL0Lgxr5Mbj1jQ==
=0yqe
-----END PGP SIGNATURE-----

--DwejfaIazyrqXF31--
