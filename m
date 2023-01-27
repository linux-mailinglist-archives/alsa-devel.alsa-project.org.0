Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F85C67EBB7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:55:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7794E7F;
	Fri, 27 Jan 2023 17:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7794E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674838514;
	bh=tX6Hu2TaAusytQSjE9p1hDzaGLxbM3u1risW+gCEWhU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OF+4qDm92Z2mwqxgtJnKX1H0L5MbMJI1DH2UlLI911JpB7R2LY5UyugYAZbLsgbEv
	 ud9BWJGn/bv977HvXTxfBk/dd71m9vVDEl+iEXReIVL2hNKnKs9LS9J9m5d9/BQoCx
	 chLkZFDn60IlPfr+5N0EYCs1zDAerqt30hG7RNTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F75DF80494;
	Fri, 27 Jan 2023 17:53:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA57F80431; Fri, 27 Jan 2023 17:53:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9D2FF80074
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D2FF80074
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=swI08zdG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 844F4CE2943;
 Fri, 27 Jan 2023 16:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68950C4339B;
 Fri, 27 Jan 2023 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674838383;
 bh=tX6Hu2TaAusytQSjE9p1hDzaGLxbM3u1risW+gCEWhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=swI08zdG+0/kur7LG6CY3Rcsn79X4Nug/bqiOuig/8wcci3/ALH7I2WeO5MoyNj0Y
 9R7FrVBAgon8EHoYIbZScA1hDaFvkPNepG2mCc6599D2pTJHqTEdkI51DSV1I8pVYa
 bA8fdwZBpOy90OOytiX1RSVdMFknY1fK/HJq1o5UI4Xo/NXy63dLvzfpY9QR5V2vFc
 M6M1eYnAUt/vnAhjxtRpEaBDq1+dsGXWm/0+s3olQ6EtXu/pPUB0gPRlIPjItciYMr
 soecef+3uEFOJ0eB0ANoSZcLNoC1Gp/L2AUSZbygRu8Ti2VDDk869OaT0R4phkR7D4
 MQEhVW4+2O6AA==
Date: Fri, 27 Jan 2023 16:53:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/6] ASoC: amd: yc: Adjust the gain for PDM DMIC
Message-ID: <Y9QBbPtopFD1DGsD@sirena.org.uk>
References: <20230127160134.2658-1-mario.limonciello@amd.com>
 <20230127160134.2658-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yiJUccDQT0wf+nib"
Content-Disposition: inline
In-Reply-To: <20230127160134.2658-2-mario.limonciello@amd.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <jkysela@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>,
 Mukunda Vijendar <Vijendar.Mukunda@amd.com>,
 Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--yiJUccDQT0wf+nib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2023 at 10:01:28AM -0600, Mario Limonciello wrote:
> A number of users for Lenovo Rembrandt based laptops are
> reporting that the microphone is too quiet relative to
> Windows with a dual boot.
>=20
> Increase the PDM gain to overcome this problem.

Why not just make this a regular control that can be adjusted as
users see fit?

--yiJUccDQT0wf+nib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPUAWsACgkQJNaLcl1U
h9AMGQf/WLxAXs66o2bKsf8C/AxaOD4g6vZ+YhuhVh8hplnc4JSJfUoOtKcS8HQD
wMDx8GGGNTyIKmZJgMA64ROOyzP6s5Bu1nHv2b7Jbls8Pd0AI3tG/zinHLkGofsW
8RWrpaJHeeCycV9ODZbDylukad1sImsJE5qhkRJ1dwqqb4ies2ceSVZ76rXtzwb5
3J7+RNRedHBoZ2iYPbv2CSJRz4v7pypxG6p8Fc3AzUYapMs1zQWtG0z36tRti+i1
LZahat22UVWs2fzCh8u+6cvpdf1LtzVu15stej7Jy7Nse5JMuGrRKWhzeVOn8he0
CbrL4j2mvbRGW+NTVUSaK8QOeQX74Q==
=Uen9
-----END PGP SIGNATURE-----

--yiJUccDQT0wf+nib--
