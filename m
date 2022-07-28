Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90F583F3D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 14:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94CA162F;
	Thu, 28 Jul 2022 14:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94CA162F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659012650;
	bh=RJfAOfmvK/rilfnXANYko3DXP68QgByaIWuAhbZ0yCY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dT5fA091zETUrE9r1Fmix8X14sOU65r9DjKNOyN5mWYJGDsuqVK/jlc3H/krqzng0
	 K1om7EEOruPtkcGHFPO4kAioSzjb5MQtOgeF3KP0bj16YBUCfIMlZwAWFQbZAgbIG6
	 jkT9IuS2atrsn2uxo2K7rUhUxWjjIVLUVqKn3h98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B16FF800FA;
	Thu, 28 Jul 2022 14:49:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25CF6F80430; Thu, 28 Jul 2022 14:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45F8F80430
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 14:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45F8F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wx6F4/RM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C12B961CDD;
 Thu, 28 Jul 2022 12:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A971C433C1;
 Thu, 28 Jul 2022 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659012585;
 bh=RJfAOfmvK/rilfnXANYko3DXP68QgByaIWuAhbZ0yCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wx6F4/RMbXOnmZID/zC6bsRe1t383AkdW+uRAW7m80H1h5d0ymb4emDU2qOF12crB
 OU9XxtVZ1g0ZrplTT/FP81PykTaLHx6MZBNC0cvbG6yfvWsuisu3h6OwnPmXqleqR1
 djs4cUJjDXn5zYsLLe5I0gX8NlNr3bcgBlPopXTp3+GJTyUojrrUiDY91niXyXSSZP
 3svhvyD7XS5uCZLd07fP+wCrnOm4IJ4QEFAZ8pXdv/GIOSEwUvgWPllEa597pKfE1d
 VZn8QXIux6hPfmCqK6alq398q03hmTMeX+GPg+PhQBgAGWOyfnTHwJRJFYhr3hs4H9
 fhTdg+OFA2L7Q==
Date: Thu, 28 Jul 2022 13:49:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v3] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Message-ID: <YuKF4l68sLKkjcmQ@sirena.org.uk>
References: <20220728124057.54259-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NWn5k3WLWCxoBmQv"
Content-Disposition: inline
In-Reply-To: <20220728124057.54259-1-venkataprasad.potturu@amd.com>
X-Cookie: People respond to people who respond.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Yang Yingliang <yangyingliang@huawei.com>, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
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


--NWn5k3WLWCxoBmQv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 06:10:50PM +0530, Venkata Prasad Potturu wrote:

> @@ -104,14 +105,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *d=
ata)
> =20
>  	ext_intr_stat =3D readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
> =20
> -	for (i =3D 0; i < ACP_MAX_STREAM; i++) {
> -		stream =3D adata->stream[i];
> +	spin_lock_irqsave(&adata->acp_lock, flags);
> +	list_for_each_entry(stream, &adata->stream_list, list) {

If we're already in an interrupt handler here (presumably not a threaded
one) why are we using irqsave?

--NWn5k3WLWCxoBmQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLiheIACgkQJNaLcl1U
h9BYKgf9HZUjAFMC+N+Sj6rLDvzwJdpVJEJLijic78G7hVRhGmMh16NQ5gAkJ5FJ
eC9ZzLSjESMqTM5dNSlQ+Su0xhI2kyhZHYXRqp0zlSULQoyipO+APdRI38/J6V5x
pOaRbLaLpsPViMo42CFbPYznDXszd9+VdALzaxlnYykfQktYeWSHGu9vHxLo57Gw
OsPsPLgpMcqfAohkzvb1Blj0Wpmj2RuxK1pQdDTOoQiMESp/Zal5yh4mtNMWKCiO
zJxKgZeuRDmXmbXhKCwyLZUV/Z/IObkQ+aIOV0qLTp1G5Z/9BQXYvGqZr/IHkw/o
QgCLUAX7K3HiK+pr+GB8xH6iUDusTg==
=zBfv
-----END PGP SIGNATURE-----

--NWn5k3WLWCxoBmQv--
