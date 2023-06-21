Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34032738CBE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 19:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83C4F823;
	Wed, 21 Jun 2023 19:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83C4F823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687367397;
	bh=ZMr77jsR3SW8Dv/WoWnmFrUI+GNGUZXIyByY3L5hI6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RME7RHEPRF5OtgLSKbjhvLlOjvVWyuEacpz61wc1Nkm62hy6utLT0HTD2G5+fyZFI
	 jeix/Fopkwk4//3mEcbOG1Rqoyn4D5RwXxA3NuKmghROgV/kp/Puu0VAyrrabNoDTm
	 5ykgz1jeZ8gHbgomPPgxZXH/sr/R9QeOqYyzDtgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4C4F80141; Wed, 21 Jun 2023 19:08:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A88BDF80132;
	Wed, 21 Jun 2023 19:08:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C723EF80141; Wed, 21 Jun 2023 19:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66CB7F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 19:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CB7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NYWSoLiF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CE5F615F0;
	Wed, 21 Jun 2023 17:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503ECC433C0;
	Wed, 21 Jun 2023 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687367312;
	bh=ZMr77jsR3SW8Dv/WoWnmFrUI+GNGUZXIyByY3L5hI6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYWSoLiFIsZ1nfDhdck7LiifPmHR84QXTyuGiCMU/g7H5RBloxpx7xyQaqMUx16TU
	 YAXNuvLWUsgov3iWlwf4cgSfMHex5l4Tx5XuSZTSJ1t8GT5poh8+VqrulyReaGepWp
	 TKRc9T2718YWQQEpbuNWmEwT3gTIW9HXi7IoRmChfdv9El4sRhTobLtkFxQFIbztPv
	 sNlwnxkhpkpH4iOB1dW/Mf6M45aCQT+9HyxRKgviTqags6QGH3kz5ZvRU+X0yu/3gp
	 wN9HOzvhRr0QiOaIrWvdqQrfJgh4tfnaWO4SyQFImPV0ZaqhA+xUENh5nwXYlramQo
	 sQ3OClM7HOsmw==
Date: Wed, 21 Jun 2023 18:08:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: =?iso-8859-1?B?Ik7tY29sYXMgRi4gUi4gQS4i?= Prado <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <shuah@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
Message-ID: <f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
References: <20230620220839.2215057-1-nfraprado@collabora.com>
 <20230620220839.2215057-3-nfraprado@collabora.com>
 <33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
 <443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
 <9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
 <5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
 <87352krcz5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJ223WL4sI8q4Z0q"
Content-Disposition: inline
In-Reply-To: <87352krcz5.wl-tiwai@suse.de>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: EDW5AXJDY2BOCF46GCCLHMEOSTGEZ3DJ
X-Message-ID-Hash: EDW5AXJDY2BOCF46GCCLHMEOSTGEZ3DJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EDW5AXJDY2BOCF46GCCLHMEOSTGEZ3DJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sJ223WL4sI8q4Z0q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 06:34:22PM +0200, Takashi Iwai wrote:

> So, we're back to square...  Unless anyone has a strong objection, I'm
> inclined to take this as a workaround for 6.5 for now, as the merge
> window deadline is coming.  We can improve things at the same time for
> the future kernel, too.

It feels like it might be good to let it cook for a bit longer before
going to Linus (eg, applying after the merge window) so we've more
chance to see what the impact is on other boards?

--sJ223WL4sI8q4Z0q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSTLooACgkQJNaLcl1U
h9CHJQf7Bn6pMlneZXihhoTKXkp58Tz+OhUfB9RBtYGcHEyPCRoxwLmhZ/8CV+Av
ucrbzZmxYOaStT5mGuz7vYY3JjCPSItte03vaKR3k7vC8iNoVjthpdgW6u7qVSha
wr1sjMVkxgNhMXTNuc4HRAEOu5vXFFB14DuV9lrQYpv50VxIh5U73XQw3jNcGjYz
8S4HoDtqIzzAvBkblIcGSgLbpj/DaMrMXYmxd32TjjN/b1swYQAY1CmheqOMeUqm
BhIlwhzoWhMhmZ4ZB2BWIFgYia6cxeqnURnUbL5QkJ8KgYzsbneR8QRldGGs8Hjr
Ab/65yDMSzPzAkC+FoeJ4zU3tb0eyQ==
=4AF1
-----END PGP SIGNATURE-----

--sJ223WL4sI8q4Z0q--
