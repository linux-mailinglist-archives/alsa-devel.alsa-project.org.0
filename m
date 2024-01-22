Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AF836FB0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:21:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE7384A;
	Mon, 22 Jan 2024 19:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE7384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705947694;
	bh=0sJKHQG49NpDF9oXlr8dzTMmdtReYYA/3/HvI32mt3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U/qJ4tEyWgxCTKswGMLD70bt7PQqq7RlR3ldGuG9JjsFjrMPPjEr///+EYzD6P4M2
	 eiNIuDUAzVLQrwgOCvYH7zBWdmitydfKlcvQthyWHu4B/iYDyonFGYXx6jVvQyzLU2
	 tyVLAp0NwKFkkr6+GZecubMFIxNqjEuE8KnCbThM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A85F8057C; Mon, 22 Jan 2024 19:20:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CABCEF80580;
	Mon, 22 Jan 2024 19:20:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C49BF8025F; Mon, 22 Jan 2024 19:20:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DF21F80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DF21F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kCgAUbk5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1473D616F7;
	Mon, 22 Jan 2024 18:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F51C433F1;
	Mon, 22 Jan 2024 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705947648;
	bh=0sJKHQG49NpDF9oXlr8dzTMmdtReYYA/3/HvI32mt3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCgAUbk5wO9/OcyNXeGVOEeNOJx2Z0zcXXV+pcVXVq6ZC13luQfhGm1aXZWEmlicy
	 MjdrjHYGND4iwtjMVNRzlTEmq+5eJFN0iwV7khwWD2q1dl00DRGugUS/srimkX0Vmd
	 qnx1ASTi/s4Di6GfmNKC01VjPy1VX1aeqytRhc5yC/Xw2zkgD1r+DsORl1wskKTTb4
	 4R6DRmGNqVo2CNVnKM35LvAf/1oZ9BLKd5TIsojzlKHOkvbjwZPr0uIR2Ne8UiDKo1
	 X2yAJUkeZgkGkPvTpjQovXDRcHLP/ktkvLM0pGVSgGDxIif/i45B15z5JV4Zhabnr5
	 1isaAHiq35auQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rRyur-0000000014o-0z39;
	Mon, 22 Jan 2024 19:21:01 +0100
Date: Mon, 22 Jan 2024 19:21:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <Za6yDXTPp9MzC1bY@hovoldconsulting.com>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
 <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
 <Za4cR90XoAaATq8X@hovoldconsulting.com>
 <aca2b125-acf8-4791-a3eb-ea19826d3ee4@sirena.org.uk>
 <Za6l6EP7OqXPU9mj@hovoldconsulting.com>
 <8c6fc7e6-7694-4718-be47-d9fc3f893947@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SDkeIWwVz3rl8Ay6"
Content-Disposition: inline
In-Reply-To: <8c6fc7e6-7694-4718-be47-d9fc3f893947@sirena.org.uk>
Message-ID-Hash: 4YVYT6UZ53XZGPLXW3IHTQ7UAAWJDOYZ
X-Message-ID-Hash: 4YVYT6UZ53XZGPLXW3IHTQ7UAAWJDOYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YVYT6UZ53XZGPLXW3IHTQ7UAAWJDOYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SDkeIWwVz3rl8Ay6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 06:06:25PM +0000, Mark Brown wrote:
> On Mon, Jan 22, 2024 at 06:29:12PM +0100, Johan Hovold wrote:
>=20
> > Could you please try again, and tell me which patch fails to apply and
> > how it fails?
>=20
> It was the specific patch I replied to, just the standard "this patch
> doesn't apply" message.

Ok, thanks. No idea what goes wrong here. I just sent the regenerated
patches as a v5.

Johan

--SDkeIWwVz3rl8Ay6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZa6yCQAKCRALxc3C7H1l
CJxRAQCuI9Q8CVpoSadmK9bGHfSYEgp3BrhBbEZIhHjThFuJOwD7Bqj7D2tNHWON
piUIM+AN1i4Eia0yv8PbzpYWcziIwQM=
=fQyz
-----END PGP SIGNATURE-----

--SDkeIWwVz3rl8Ay6--
