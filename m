Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1188590B4
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Feb 2024 16:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57FA84C;
	Sat, 17 Feb 2024 16:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57FA84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708185434;
	bh=J/W77O68aesAwbF/+MNHZ67Vbe47hRGcJRILMJWoA5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OfvEeYVg3RQS4jhotuDtaI2y841UZ9yg/580We3vzWegmaQBeTcbZMFoCeebJykwB
	 CIuraPpfgcr5R9rT8H6hwY3pkzM6WgQZwuL8qhZ5jbLYSR0NkZlAs/U35p0rgbN0IM
	 VngLJOZZ59WzJ77JqlqllnZr5Zt0LaPR0LaA6tsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3B89F80588; Sat, 17 Feb 2024 16:56:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC85F8059F;
	Sat, 17 Feb 2024 16:56:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 316EBF80238; Sat, 17 Feb 2024 16:56:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21147F800EE
	for <alsa-devel@alsa-project.org>; Sat, 17 Feb 2024 16:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21147F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ac74+6eX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1370CCE0A1E;
	Sat, 17 Feb 2024 15:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A079DC433F1;
	Sat, 17 Feb 2024 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708185387;
	bh=J/W77O68aesAwbF/+MNHZ67Vbe47hRGcJRILMJWoA5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ac74+6eX8BYX+Dhc5pD9bHerYX+LucQy55Ok8Yv9288W36kEIIFwo7rOdcZ9wYXrc
	 uGyB0npROCKeS4y8eEM8xPsOIQ/kv5ICHN5cYn7082kYOnOsD+cCcCKcOcLymiDGpC
	 kAa9Uy9b9kqUJnWMafnWiHgWsL2NRxDGGGHXSrR4cZqW4F7hrwLBeIhIFRXbH+hzxF
	 DL0JPR73Dt3/zkkZ41KyLcgUEJm+3/7qo1CwwOqJL+qPOLCR6lKc9Fu3D15cQCz5jZ
	 2uGGzMihoqljFxBOdoB7Van/EqW7D+FHhSQjlV+lOhnmJDB2aiSer0QfJe1/8SwQyM
	 TcC9iKmCmLiag==
Date: Sat, 17 Feb 2024 15:56:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] Acp5x probing regression introduced between kernel
 6.7.2 -> 6.7.4
Message-ID: <ZdDXJyXiZ++KiNqW@finisterre.sirena.org.uk>
References: 
 <CAD_nV8BG0t7US=+C28kQOR==712MPfZ9m-fuKksgoZCgrEByCw@mail.gmail.com>
 <7a0cd63f-8a83-4dc5-8763-63dcdae8d68a@leemhuis.info>
 <878r3qxcyr.wl-tiwai@suse.de>
 <871q9hwz2w.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EkTQCU0JljxhlDH4"
Content-Disposition: inline
In-Reply-To: <871q9hwz2w.wl-tiwai@suse.de>
X-Cookie: You might have mail.
Message-ID-Hash: WTODPIPVTEQDGB3B5TJFSAQ7U3LNUGUZ
X-Message-ID-Hash: WTODPIPVTEQDGB3B5TJFSAQ7U3LNUGUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WTODPIPVTEQDGB3B5TJFSAQ7U3LNUGUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EkTQCU0JljxhlDH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 12, 2024 at 03:12:55PM +0100, Takashi Iwai wrote:
> Takashi Iwai wrote:

> > Interestingly, the system seems working with 6.8-rc3, so some piece
> > might be missing.  Or simply reverting this patch should fix.

> In the bugzilla entry, the reporter confirmed that the revert of the
> commit 4b6986b170f2f2 fixed the problem.

Any news on a patch for this?  Venkata?

--EkTQCU0JljxhlDH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXQ1yQACgkQJNaLcl1U
h9BUtQf/ZTV0mTlTBMNEuSC6v8A3J/2uVLXmPGUfRoOBtLanWtBDSdmXXZEDT3Uw
RGgirO7JuUNcj0tEqF2SODNkXiqEsyNBA/elDDAOxsmuQV9BeziXaVHlBcfFbGDf
yvx7CEWLCdQKucDV/nuxnD5oYsZ48MAN9B4S2L8ePY38UbTHkawnCae+6ObKoQk6
DLYcTzd96CxjCnkHJGSDZGW5xxRUk4/rBnnttKdW4isOoNbEykwyVbcr5ZWTDuao
UEUgX4WdPGWc1XqoLHCRUU+nEA7mgCoAz0QMd8FSpZ8lA8lAG8ziizYS3PY4Btsx
Y+ngUaN9Ph2VYj+hiGLzhKX3MWlbjg==
=CGP9
-----END PGP SIGNATURE-----

--EkTQCU0JljxhlDH4--
