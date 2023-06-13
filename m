Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D109672DF05
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 12:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE4582B;
	Tue, 13 Jun 2023 12:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE4582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686651462;
	bh=euxV11e17py/oLQ07+Pz2bttIsU7QRVKaT96M+8AnCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T7K2bKKoWnxnZYTafVIensmwhY0kiyyIAyXFxNPNY5Jij/fwwPuE90x7WLlZtQbBi
	 mMciXSYlxfLFs2Gb93olsFzRXx/+FkExhmw5rpRWGiLQ8TGljOlSpmWEq5g0XfMeBY
	 KibXHbFt/CGbCtqA5+a07m1kMgBOchJ5KHkov/Wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1976F80533; Tue, 13 Jun 2023 12:16:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89111F80132;
	Tue, 13 Jun 2023 12:16:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BF5F80149; Tue, 13 Jun 2023 12:16:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C3F4F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 12:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C3F4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tgacNZrO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF2996342F;
	Tue, 13 Jun 2023 10:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA05C433EF;
	Tue, 13 Jun 2023 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686651402;
	bh=euxV11e17py/oLQ07+Pz2bttIsU7QRVKaT96M+8AnCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgacNZrOslbvX3BxFfcwtfYBYbuPyIayRyBftqc+NeamV46DiMa1a9AdygyXTrGjj
	 pul0VR3qfvxlFtp/LkfLcA4aWvq/kCq+nP2TflJEsft/bLULamjQzrm5SecqhIZRn7
	 KxSN4d/kI7L0x1t1T5A6NJMdkr64mOrmYGWrW/Q5yYv566DRQ+KT3a/GW+nL4GWzyY
	 E1D2h+RqOAR0PYDW33OfUM2kBhBkb6skiBo2VNXoqUJ4xG3/NmuynoYCg+ulE5uvw+
	 WPoR3cKt5tuTDfCC8KlPi/Buwt48mpsKGXFcjL0XkPmvcCgsHUSdIJtuTAw5K1hL7z
	 6FNKOHDbJeB6A==
Date: Tue, 13 Jun 2023 11:16:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] regmap: maple: Don't sync read-only registers
Message-ID: <b86f7b95-f116-4d06-9aca-7195b01dffab@sirena.org.uk>
References: <20230613074511.4476-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QD0bhsf6hO4NwSqe"
Content-Disposition: inline
In-Reply-To: <20230613074511.4476-1-tiwai@suse.de>
X-Cookie: Not a flying toy.
Message-ID-Hash: LPMVB5S2C2WXQNIGGRPLSO22AWAUIRNA
X-Message-ID-Hash: LPMVB5S2C2WXQNIGGRPLSO22AWAUIRNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPMVB5S2C2WXQNIGGRPLSO22AWAUIRNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QD0bhsf6hO4NwSqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 09:45:11AM +0200, Takashi Iwai wrote:
> regcache_maple_sync() tries to sync all cached values no matter
> whether it's writable or not.  OTOH, regache_sync_val() does care the
> wrtability and returns -EIO for a read-only register.  This results in
> an error message like:
>   snd_hda_codec_realtek hdaudioC0D0: Unable to sync register 0x2f0009. -5
> and the sync loop is aborted incompletely.
>=20
> This patch adds the writable register check in the loop for addressing
> the bug.

This should be in _needs_sync().

--QD0bhsf6hO4NwSqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIQgUACgkQJNaLcl1U
h9DxtQf9HJLf3oJ8TwTWUYxeYCXazxOQWwzMq+CNDgx82e66cfDywTMYwXIibUlH
1MmJy2B8YN93YY1iRHeXgRZCFSgphvo8rqvzumPoTjWLY/jHSGsHKfgrLKmYs/Nr
hHi2c+RUHdhJxTsju3cOfYbVWljxb65T5WdKLY3aVxVhUTJb4InlzMY30ALyd8Nu
scYzjGeuBp6uBGaNnNumcPKecuqIOzfI5ow+M8daretzOiqET7/HuNncG2is7q8t
QDt5oxMrJxotTSP/Qme+KJ3BOk9KWDPXwllCnAjGhVefKwvY4Bym16chNt4yjfMT
26syD4aUv8e7JfYtRsCApP4b6sGirQ==
=EFK4
-----END PGP SIGNATURE-----

--QD0bhsf6hO4NwSqe--
