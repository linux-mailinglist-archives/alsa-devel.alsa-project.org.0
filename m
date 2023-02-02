Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B42687F03
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:43:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3635E91;
	Thu,  2 Feb 2023 14:42:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3635E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675345420;
	bh=i8BRzmo7rKq3SCWLhFnsh4JSQbcn3OLgn2i+Gc45CEY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sOQptGyCLfFc8RnMtTUaNVz2Sz7+ddqNam9x2TaQ4TUO973gXSIMY6RdjPhS53dSh
	 p5E7Ip5YH+jEnQvWfiwG926FJp2clSlsY8oG5G48fnj454qtUtBYpSiqOGa6lTuZkG
	 sO66JFNnenGEu+Sgz/zmfQmeAk4XJyiKo51k8n8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F04DF80169;
	Thu,  2 Feb 2023 14:42:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9C7CF804C2; Thu,  2 Feb 2023 14:42:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D949F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D949F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b/Bmy1HZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42519B82612;
 Thu,  2 Feb 2023 13:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC44C433D2;
 Thu,  2 Feb 2023 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675345353;
 bh=i8BRzmo7rKq3SCWLhFnsh4JSQbcn3OLgn2i+Gc45CEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/Bmy1HZJd/X2YLiPd+dgtTOA/iLWb0z8MJUjzIg81lO9/HwU8KkkyDov8KGuW+J9
 60gpI+TVBSZ3vARUhmPP4ZnN5pN//d0EYTUP+EsBKO1v4/gXbkWDTiHET+uN+ihToR
 Z7wPlMbYUAr0pM3wTDBC9DHGWrDAokZRUnvvuY3rjSOXN2MiWsWxfyCyb6TDqoct3N
 lFZsvNDGudBx3BXedGq069Cptr1OKDe8Z2VG1NAfnjfvxhRUtnNUi2JYsmCNDoHINC
 oRFDFxDk0N6cQV85WsdPZ8qIm+E9lml5i3MrZhY+zaiNuJBVuB/HJ2jkQ6fcPVoL9S
 qDlpJTtMtyChA==
Date: Thu, 2 Feb 2023 13:42:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/6] ASoC: amd: yc: Adjust the gain for PDM DMIC
Message-ID: <Y9u9xCNDd8R0Zi08@sirena.org.uk>
References: <20230131184653.10216-1-mario.limonciello@amd.com>
 <20230131184653.10216-2-mario.limonciello@amd.com>
 <Y9uhkEo9INU0IPEr@sirena.org.uk>
 <270a6bf0-8774-2f0d-9b0e-4f1eb9a986e6@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aOpaOU/CtarS4P7a"
Content-Disposition: inline
In-Reply-To: <270a6bf0-8774-2f0d-9b0e-4f1eb9a986e6@amd.com>
X-Cookie: Swim at your own risk.
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


--aOpaOU/CtarS4P7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2023 at 07:38:55AM -0600, Mario Limonciello wrote:

> Would you like me to resend the series?

No, it's fine.

--aOpaOU/CtarS4P7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPbvcMACgkQJNaLcl1U
h9CUCwf/YvVnhHeYEvCRNPh1UbuYnjux0Y11lFqAP1198xtWvbTa300lLCtTU0bS
oVLTLL8RF+azgp/HwwsKMysnfjV5a/MfXqXw9ejBIxKKrBpBb15D5VGjCOqS5jMI
gl3uPkNqWklijRHDH/5QCWEx3s8NC8xa8ZoaRvGe0KYv7rmYbAbsdTMWH9uYR1L2
KWLW4+ONnyOJoviS4y4Lf22bHtlj5kaMPbw0wabkCWd1081Ys6xAsXCFDikuBJX9
XHbpVcosCfrA602DtdbAB8JBpb+48FmJjt4Wl5wFadw8dGmOpsa/XuA+OBvY04fR
4foffdzHrTGlFlt9Q2JnMsTma+SPmw==
=JpDD
-----END PGP SIGNATURE-----

--aOpaOU/CtarS4P7a--
