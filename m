Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C876528375
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 13:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9C391682;
	Mon, 16 May 2022 13:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9C391682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652701531;
	bh=EmxLfawp5Dk6/SWKDlV1mvHcmHp8Dr2enYG7AsV29zI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DddnGN8SMJZG3vii5E+iqnuOVJW7XoBPHI2o1uZ50U/8y2cgPuShpNy9cUxr91epo
	 rSLQ16ZPS2RJoY10WY6koFA4ug3sd+Ht+uemDtfPkX32nWrK3Wmc6m3tHfErSEj9KT
	 QEvsDkw8mBI81Uv+L5Td5o6W32njR+wFWj4Ze0l8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E791F80171;
	Mon, 16 May 2022 13:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BB26F8014B; Mon, 16 May 2022 13:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33072F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 13:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33072F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ou5Z19QM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1C25B810DC;
 Mon, 16 May 2022 11:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC2AC385AA;
 Mon, 16 May 2022 11:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652701463;
 bh=EmxLfawp5Dk6/SWKDlV1mvHcmHp8Dr2enYG7AsV29zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ou5Z19QMaL128kR/T8bZXm/wLzTNxYqOdfkNiXnjEgrc2bo6IWp1OnecrFTlknVgt
 kQJFP+/VRUDKo+19pG/qpKsrqRrYWxiYanJADfhRwNY55BHgBVmVtKSm5wV+8OaZCr
 W1zfGmpFtwQa++M5oZ+AIjTP0LCQ00npV+JSoAtEMV63eBIuQaPlFOVHH/q1KNabPD
 XD8BqzYHXkVGKbCIU3VDjbbECwrqZu8gZCnMmAJsuxWjtrHWR5/EHoIInfwjvMdoA6
 IIzcR6b9yvPT9J+lLBrYXSW94MH3L3JfMWSgrurqm9dyJ2Ni6ftLdRWPr/FjPxtClL
 pxlIMvxpeMRjA==
Date: Mon, 16 May 2022 12:44:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] selftests: alsa: Better error messages
Message-ID: <YoI5EEPjOQPzB6se@sirena.org.uk>
References: <8598037d-0e24-9bc1-3f2c-a2751ec8e871@gmail.com>
 <s5h35h9c3yn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5M0Q1jZTiTZHriO1"
Content-Disposition: inline
In-Reply-To: <s5h35h9c3yn.wl-tiwai@suse.de>
X-Cookie: May be too intense for some viewers.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Siddh Raman Pant <siddhpant.gh@gmail.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
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


--5M0Q1jZTiTZHriO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 16, 2022 at 09:49:04AM +0200, Takashi Iwai wrote:
> On Fri, 13 May 2022 15:40:57 +0200,
> Siddh Raman Pant wrote:

> > This allows for potentially better machine-parsing due to an
> > expected / fixed format. Also because of eyecandy reasons.

> > Whenever possible, errors will start with the name of the
> > offending card/control, separated by the error with colons.

> > Whenever there is a description of an error given, the generated
> > error string from snd_strerror will be (mostly) enclosed in
> > parentheses at the end.

> > Clarity of error messages have been (hopefully) improved.

> But, honestly speaking, I'm not sure whether it worth.
> Although it's possibly a bit more consistent over all texts, I
> don't see significant improvement by this change.

> But I'm fine to apply it, so keep this pending and would like to
> hear from others.

Some of it is probably fine but there's a lot of different changes for a
lot of different styles in here, not all of which look great to me.

--5M0Q1jZTiTZHriO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKCORAACgkQJNaLcl1U
h9DH2wf/V+ceewah5O1Pfdjt0PzOsKcr3er5o2sR3Bn2bVPSb37LtrKyLUXz+PNR
F7JqHqiJRA2ynQUsxWpRKneSLj8rMCh1QPl9k4DJiELy5UzhRiEPoKqaF4qyDW0l
03Ts3YCLGoZ8+jUr+ke67Gz63B5kxmrzoXsHjcp8d/xPMy7mUZYtJqzDN2Vdqxqr
U6iDhB2qN+sL6dw+2TpYs1PvKjrKETlEaieH0Q4CTJSACs/WN5aYFZNoVzmOgwwC
yb+0gevUiAtTZCjgu6Ki+BveQaUa39P3HNoOU9NSdPjkqHt1H7ixIHiaJANzT1xZ
VX5E8TqorRsoIoDtvTeoxdbsF7mfWg==
=xUpY
-----END PGP SIGNATURE-----

--5M0Q1jZTiTZHriO1--
