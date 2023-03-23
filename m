Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D20EC6C6A1A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:55:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB30E98;
	Thu, 23 Mar 2023 14:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB30E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679579742;
	bh=YN3pd5fa+PABp2NpDPUc5U8fZzNOy4moYU5bs9sls9k=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RbGV6jC9mlUYJ3fDSz81ieWyg/ZGFgg5VRhTeMNvVcUIS4yh2Kdz6Fx2deG692/H5
	 p3cXHTLlfHrJtNR4HJA5nl1fCj3Zo//TMHPShMSqAvR4adMM8Lyqv7lF+UTZM2zmOs
	 slMkBtkVtWcXbqNdwZNLBdKyh6IeSzrCmaprewco=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53BEBF8027B;
	Thu, 23 Mar 2023 14:54:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F28C1F802E8; Thu, 23 Mar 2023 14:54:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 127CEF800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 127CEF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j0ikepir
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 158EAB81E21;
	Thu, 23 Mar 2023 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC88C433D2;
	Thu, 23 Mar 2023 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679579681;
	bh=YN3pd5fa+PABp2NpDPUc5U8fZzNOy4moYU5bs9sls9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0ikepir2a4P6A5QIXaDyC5op/5TG0l/bm+uANGiOdsLVO5NCliC56Pxj7aPJ72kv
	 NVwEOhgI+HwWqSN0tnk1vEHyeREGjnq/Z/BWlgZcKjma4eEDrc6H/pO9MIQLihFaPc
	 2+h5m0JtOvmXmLkOuV8fC7Kzj1rTUeGRKTp2ctiZkz2XXdqydC5K6QYKmNv1mvLhqZ
	 efJuGJRmrNyQo9EU43ctAu61zs7SbFcJwce51llkGvZsvez78msOYTSUDwQxAI2q6O
	 bROFjq2zaMng+TMs9r6V8vf1dhaEgAuYji9QhFXcCKuuXX6Usf13rsXUHso22TJy4d
	 waC0AR3lbc2KA==
Date: Thu, 23 Mar 2023 13:54:36 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?5rKI5LiA6LaF?= <zhuning0077@gmail.com>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <42b02a34-1b96-4699-8b0d-3610c5376a7c@sirena.org.uk>
References: 
 <CANPLYpD8Ty9QjMf3vs9n8wCCFyaHiiRpYM-b3kNGiA0r3q+sEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8VlENQAJDfsfHDVY"
Content-Disposition: inline
In-Reply-To: 
 <CANPLYpD8Ty9QjMf3vs9n8wCCFyaHiiRpYM-b3kNGiA0r3q+sEg@mail.gmail.com>
X-Cookie: A lie in time saves nine.
Message-ID-Hash: GHFVRH55Y6P6IDVOCI3IF7B2JVUKFWQX
X-Message-ID-Hash: GHFVRH55Y6P6IDVOCI3IF7B2JVUKFWQX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, posteuca@mutex.one, tiwai@suse.com,
 yangxiaohua <yangxiaohua@everest-semi.com>,
 Zhu Ning <zhuning@everest-semi.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHFVRH55Y6P6IDVOCI3IF7B2JVUKFWQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8VlENQAJDfsfHDVY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 09:56:56AM +0800, =E6=B2=88=E4=B8=80=E8=B6=85 wrote:

> > Yes, for example consider a critical notification - the system
> > may wish to ensure it is audible even if the user has taken off
> > their headphones for some reason.

> In practice the speaker and the headphone are conflicting devices, see
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Intel/sof-=
essx8336/HiFi.conf

That's a particular UCM configuration that someone has created, someone
with a different set of use cases might create a different UCM setup (or
not use UCM at all).  This is a large part of the point of having use
case configuration in userspace.

> There is no such situation, and the system doesn't produce sound from spe=
aker
> when headphones are plugged in. The user may manually open speaker using
> amixer sset 'Speaker' on or pavucontrol.

Again, you're describing a specific configuration - someone might want
to do something different.

> The GPIO thing on Huawei Intel platform is too complicated, they use two =
GPIOs
> for headphone and speaker, and the headphone GPIO is inverted, which mean=
s low
> means on and high means off. Luckily there should be only one hardware co=
nfig
> for the AMD acp3x platform GPIO and you may just choose the correct one.

There being two different GPIOs sounds like it just allows the headphone
and speaker to be controlled separately - that seems more flexible, not
a problem?

--8VlENQAJDfsfHDVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQcWhsACgkQJNaLcl1U
h9AN5gf/RQqA84CKvfzCVkUU7Gd3CL1ND9/ZkZ1k/a4lEqn0Rpq99tbk1hCUuFvq
2jAhp8Sd0XtxLl8FO4WqQxpiIxWMs1Vkp5Hwz0N+Admm4yvfjnX8UUf9GULKqbNb
2dSarPGe7SASIjJl2YWa8L4H2HSgGOoAe8TNaY5o3CZafqWVRCZXEuX5QCzDm260
fVN5vgAQjqG+IJoYz2uBLSPp2snzCM+L+yB1nZeMxEsTVLgSmXyyM/KWHVEdOzvJ
FxYrFITGKsk2ejLd2p+QuYIk0t0EPEQxWL59Ti/BHk7kiQbskwQEKNJuNDO8fb6G
RhHDDOMZChSuipICfkUAOsAt/sCPiQ==
=+n6T
-----END PGP SIGNATURE-----

--8VlENQAJDfsfHDVY--
