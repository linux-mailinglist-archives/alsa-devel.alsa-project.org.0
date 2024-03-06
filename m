Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C6873BF0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3387885D;
	Wed,  6 Mar 2024 17:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3387885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741938;
	bh=RVMlEsB2pN6OihFSXCIfVDCN4Q/0ngtVNwKfhyIQRas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BENOcXXRlfetTNHELO3oJDTLiujNQbKVJe1WZDbpfkl6dxpKQMGBkgoy/56nK1NKH
	 5bh35pr4icqzrWDgotlr10wam3D+nOB1/0oHhC64BK4tPi7hZDPJLRsvVR7H4SX+GP
	 jmQHGRiLqt8oRNt0pYdyrQQoh0moff+auPGLmkpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93CE3F80587; Wed,  6 Mar 2024 17:18:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA74F80580;
	Wed,  6 Mar 2024 17:18:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3C3DF80087; Wed,  6 Mar 2024 17:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4941F80087
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4941F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kw4WzDRz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 717C5CE1F43;
	Wed,  6 Mar 2024 16:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A38C433F1;
	Wed,  6 Mar 2024 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709741867;
	bh=RVMlEsB2pN6OihFSXCIfVDCN4Q/0ngtVNwKfhyIQRas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kw4WzDRzJgOTgaWFiMqFOR7PMSi9EDNdg7X4h+56sL4CI8WOzjGrR3TGYYabudwEO
	 hJw3FgoUTwlwmpm4K895rAktQDlRceWuhwxJaXljCJlo+3FSF2G1cy2pmeqduAMDHu
	 d2p/s7ZBxVWFkppkhj2O1Tuwcpsy110sGLtiSLNnE+CjOnRIHfpZacw2aEBZTNIu5l
	 anC3ux8TNyEEawLB6Z9sbwic2mEvbsARDVqMC2qFCggocPTVJVVOONoyMGji3eh2gn
	 2bhR3GDNicRCyCmNDaE6kS6pZGZtQnLwaLIvxndYmgjqL9vbIbSf89fUhJ8kYvb7ID
	 0DUmWuSP7pdRQ==
Date: Wed, 6 Mar 2024 16:17:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Shalini Manjunatha <quic_c_shalma@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Raghu Bankapur <quic_rbankapu@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Jha <quic_kkishorj@quicinc.com>
Subject: Re: [PATCH V0 0/1] ASoC: soc-compress: Fix and add missing DPCM
 locking
Message-ID: <d9d858fd-a4ae-4623-9627-4ccbb049966b@sirena.org.uk>
References: <cover.1709720380.git.quic_c_shalma@quicinc.com>
 <Zeh9HMcWxfgPJS1T@matsya>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BU4G5YQs4z51lECv"
Content-Disposition: inline
In-Reply-To: <Zeh9HMcWxfgPJS1T@matsya>
X-Cookie: Have at you!
Message-ID-Hash: PN6EHTYVOCS6ZUNAGMINQDFEYH4ZWESQ
X-Message-ID-Hash: PN6EHTYVOCS6ZUNAGMINQDFEYH4ZWESQ
X-MailFrom: broonie@kernel.org
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PN6EHTYVOCS6ZUNAGMINQDFEYH4ZWESQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BU4G5YQs4z51lECv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 07:56:36PM +0530, Vinod Koul wrote:
> On 06-03-24, 16:23, Shalini Manjunatha wrote:
> > We find mising DPCM locking inside soc_compr_set_params_fe()
> > before calling dpcm_be_dai_hw_params() and dpcm_be_dai_prepare()
> > which cause lockdep assert for DPCM lock not held in
> > __soc_pcm_hw_params() and __soc_pcm_prepare() in above flow
> > when ever we play compress offload audio playback use case.
>=20
> where is the patch ?

In reply to the cover letter:

   https://lore.kernel.org/lkml/d985beeafdd32316eb45f20811eb7926da7a796e.17=
09720380.git.quic_c_shalma@quicinc.com/

You do seem to be on CC.

--BU4G5YQs4z51lECv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXolyUACgkQJNaLcl1U
h9Cqzgf/bPmF9PKuBaGGpT5GM8QMANRh7UVzVUYTKzyoe5b7KOX6ZaW21olPQBFx
+e/IMQ17j0wlCVbGUmQrUBaunMN0tYrwa7sgbQbv8Zzs4rUK4CGF+X2hCt6aTXmN
X/MJEcwqBwQyCet5TWhqN8tmQOvKyIZhhbQxIqjQr5XVBV2jaDk33V1zgxT+To77
RTej4cW3QErcHuKndVVkdHaJEH7IXSlQpVh+gF1zdjEji8CRiLXbnIp2GvyUzKW/
6YGM0gesJcw6ZaFgqOCsNyEfGwsy3ixj4BIHuns+CaSQvTegI9uoV74jjBCcW23C
60/fvEjWk2CwwL9Kf0B9R3D+IQ/W1g==
=M7r+
-----END PGP SIGNATURE-----

--BU4G5YQs4z51lECv--
