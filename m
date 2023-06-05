Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6DE722653
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59594826;
	Mon,  5 Jun 2023 14:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59594826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685969378;
	bh=Qyu3UggzGA1YR+k6SEA+ebAB9j7ENCch/bB9WJ5W0sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dvan2eF9VTCF1TsswSZjPsMAJBdaJGqz+HimUukL5moo7DIZYlM5AZRxh4yWp6lnb
	 wNr9B7p0SWxXWWowftJR++ev6LPzJ3MsmFDasQaoSXUr9oE/LVMewHEeXopqWk0022
	 DuGCTGot9uIBVLYCEabN/ZGPulxDrn7xqmdkgMUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20FA4F80520; Mon,  5 Jun 2023 14:48:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7185F8016C;
	Mon,  5 Jun 2023 14:48:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B26F80254; Mon,  5 Jun 2023 14:48:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 25AF9F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25AF9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k9kyc8n0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00CD1623AF;
	Mon,  5 Jun 2023 12:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC40C4339E;
	Mon,  5 Jun 2023 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685969321;
	bh=Qyu3UggzGA1YR+k6SEA+ebAB9j7ENCch/bB9WJ5W0sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9kyc8n0XuRdxbMm+wyCIqE3/jmhPXRajQtviFmBwL/NsNiXdwO0eAxKVyr/Cl+dx
	 kIMsdED1jZQJHj8uKjWtMwHKe2QoBgfB1MYmoqyORu6DCMMx+Y2q90JLbwVm4l89Y2
	 sfkMhx/DGATI2/s/oe0TwcUIhcVRdJsp4ia+JDtMcjUYq9zvGWXoYJlOTMs6n5BYTa
	 TjAx5mo06sSewd7VKLk3O1BXkWmfKXuZln5hZK0nlMXXAFeO85SQigYsIu0akgUUuo
	 cjoh8ip+OoL5xr5/Mcc8Lxl9AlWGlOYBKGS9+LDu16CgalK2u1vO6yfd1KscXtVOFn
	 sdzIQqBfNKMHg==
Date: Mon, 5 Jun 2023 13:48:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
Message-ID: <3d9657dc-7180-484f-9fef-b50597571db3@sirena.org.uk>
References: <20230605085839.2157268-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X0xc3FjzGMYuJlCL"
Content-Disposition: inline
In-Reply-To: <20230605085839.2157268-1-arnd@kernel.org>
X-Cookie: Biggest security gap -- an open mouth.
Message-ID-Hash: VWXTMFD5TJDRIJVULE5EUW4M5OW4BACW
X-Message-ID-Hash: VWXTMFD5TJDRIJVULE5EUW4M5OW4BACW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWXTMFD5TJDRIJVULE5EUW4M5OW4BACW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--X0xc3FjzGMYuJlCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 10:58:29AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The vangogh driver just gained a link time dependency that now causes
> randconfig builds to fail:

Actually git copes fine with applying this on top of v1 so no problem
here.

--X0xc3FjzGMYuJlCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR92aMACgkQJNaLcl1U
h9DWDgf+P/YOsGOt5xQicO9/+srfiaQTDUojnL0mHrEPBbWUabFo5NnA64FHthnL
fAEgu7knokysnWiJfvDIMASYtGcGHKiOsnuCj8Tv7swdMf8g7Q5BnmPVZ7T7gEOz
zF/8NvIH/k6H31lVxtsjbbwL8fKNAVulgdBZFhT8NJJMpNLonpOiG/ddkqmzVbwR
0NkNoc5zS9vfzuTCYnbMIyphbhLJLNK6k4KW9MFt/v6HZA92tS7lrV9sLtzKC2wJ
f/mpybZAoo8k2auRAuTW/MmEa8dHavNCjDXipNpR6klASA+0zDbCyBPaVyqMHNT3
duVIulp+I/GndA3AQcdEfS3yLlruFw==
=HBlX
-----END PGP SIGNATURE-----

--X0xc3FjzGMYuJlCL--
