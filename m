Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3C83901F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 14:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863FA84D;
	Tue, 23 Jan 2024 14:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863FA84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706016758;
	bh=KibFd8MBsZByh8wCB8U6lrdmc1z1Zxybm7RMOqyABPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z0jdfKbNgFHRr9EHeVEIvwPaXbVM/qpm4ntLrwsS3mk3S5naaxWUI0/5TeZyZMjzO
	 wkWTvpVyEkURuEm15I020oR5zU4ctsikpgiXBRfflyxy6KwIGQiJTVwGJ7IhGfE4vU
	 xR8Veb/LExzvKz2geYTzgzy5NC7V0HSkljamngU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E7D8F80494; Tue, 23 Jan 2024 14:32:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0987DF80580;
	Tue, 23 Jan 2024 14:32:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBC2CF8028D; Tue, 23 Jan 2024 14:31:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78D69F80149
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 14:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78D69F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nGw5zGFA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0286CCE2F07;
	Tue, 23 Jan 2024 13:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F576C433B2;
	Tue, 23 Jan 2024 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706016642;
	bh=KibFd8MBsZByh8wCB8U6lrdmc1z1Zxybm7RMOqyABPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGw5zGFANiFKDc3iZ0ueCZ7ClysP/2NF3ZdjrnZL5coRBEPyjzsYvjlnePgGD2sCF
	 Y3Agq+tRsz24/qZtAjyo8hKEfDdaH5KOfUZnlbU9WZRyJfaXaUBt22HSx22oLXkLxq
	 UavKTCxR8hXfsvmORiTAGLn090CrSAONTB4sInp1T/41ESPCjyhvxSi8gUWtVjXHPa
	 mFBkVU+5F8ObhR+tyw9zhLS6genFhYBZjSr0A5fa5wtChksFLRJd1u7PSFbiFNeJSf
	 uFVlrxzw3hwj9sMj2JbGJGEluGW8WxlKXsbRR/H+/2dsS7KxdXfyiAZCptkh8XwhkC
	 YY7O5Gr0SHnVg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rSGre-000000005bR-4ANN;
	Tue, 23 Jan 2024 14:30:55 +0100
Date: Tue, 23 Jan 2024 14:30:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] ASoC: qcom: volume fixes and codec cleanups
Message-ID: <Za-_jrByhGnKJo66@hovoldconsulting.com>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <170596045016.161959.16318695944363636291.b4-ty@kernel.org>
 <Za9xnEXYczA5rsw3@hovoldconsulting.com>
 <93fee0e1-ce92-4aba-8e4b-0861f78c32c9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EIzISCNBNizK6IyV"
Content-Disposition: inline
In-Reply-To: <93fee0e1-ce92-4aba-8e4b-0861f78c32c9@sirena.org.uk>
Message-ID-Hash: E472RXNPUI74AGOYR7FANC23LETUTLDC
X-Message-ID-Hash: E472RXNPUI74AGOYR7FANC23LETUTLDC
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E472RXNPUI74AGOYR7FANC23LETUTLDC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EIzISCNBNizK6IyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 01:05:21PM +0000, Mark Brown wrote:
> On Tue, Jan 23, 2024 at 08:58:20AM +0100, Johan Hovold wrote:
>=20
> > Could you consider applying at least patches 1/4 and 3/4 for 6.8 as
> > well?
>=20
> Please check git and resend anything you think has been missed.  When
> you resent the whole series rather than just the problematic patch that
> most likely confused b4.

Everything appears to be in your for-6.8 branch now, thanks!

The merge commit for the series does not include the volume limit patch,
so it looks like that one got applied separately before you applied the
rest of the series:

	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?=
h=3Dfor-6.8&id=3D7c70825d1603001e09907b383ed5d1bd283d61a0

But all four patches are there now.

Johan

--EIzISCNBNizK6IyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZa+/iwAKCRALxc3C7H1l
CMtpAP98w7aVuLW19jNSfZ3BUPnjVVkkmnVwtY+jMSRIelgdhQEA7KV427bhDrQn
O88Zy32EeW/p+d9Z70o4eoCMiN5wPAw=
=OcqY
-----END PGP SIGNATURE-----

--EIzISCNBNizK6IyV--
