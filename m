Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B784DFDA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 12:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15879826;
	Thu,  8 Feb 2024 12:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15879826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707392325;
	bh=r71RoIKN+p7IBDsZxy3keLwQy6qjvh5Oo6IsPvi4Tis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HWufVXBpL6vPfhoBenAEfUlAOIpX/OhZqW9l6E3S1xRXJwaxV1J4HgZjiuUbGxt9m
	 udkFWQjGA/Vtpqyp5nP+K5agBThwCkIKe+vPh5QTSV8CFfmoaw6+gEqyyB1zQzt1Xz
	 C0NJSkfFZVC+CVlOOupqwQ1G/5efWxKbzMV7fiMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7888F805A9; Thu,  8 Feb 2024 12:38:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10368F805A1;
	Thu,  8 Feb 2024 12:38:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F15DCF801EB; Thu,  8 Feb 2024 12:38:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE456F800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 12:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE456F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oHjFfK91
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63DC561D19;
	Thu,  8 Feb 2024 11:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A63DC433C7;
	Thu,  8 Feb 2024 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707392278;
	bh=r71RoIKN+p7IBDsZxy3keLwQy6qjvh5Oo6IsPvi4Tis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHjFfK91dIuW9AMFWub1Z+oEXlaXk57o4+Ixv+EAwjqiBeWl2rwu8ARxmArj0N6se
	 4nnZObUba5Nx2jPwxEjAwURTJL9Dr3Md/XIpb+MPZ4H5ZznpUJWR4sw/7153MAxwEX
	 qUXcO/2Vb2Edka+umtf+LQggsUB+ozia6PPiRsg/EifbG0s9R+AjsfW7dA9GugsABK
	 rbyU0iEie4+5KekGPjdbMW0wxnfGZCTK2TV8p2xtpC7CBBzE4+I7hghJBbQGbL5PYj
	 ykwfNmqWNdZWX0UuDnAlLEg81aUFt00AfVlTSeOzEQiSxF3Sv2TYKygio+1hGuU2+U
	 cL0IWzUE64oAg==
Date: Thu, 8 Feb 2024 11:37:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.7 07/44] ASoC: codecs: wcd934x: drop unneeded
 regulator include
Message-ID: <ZcS9EmcM1rtsNYy0@finisterre.sirena.org.uk>
References: <20240207212142.1399-1-sashal@kernel.org>
 <20240207212142.1399-7-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y3Ic8DwDm+OAu+TF"
Content-Disposition: inline
In-Reply-To: <20240207212142.1399-7-sashal@kernel.org>
X-Cookie: You might have mail.
Message-ID-Hash: LYJDYNHLL7SX4PZOZXZMRBVWN2RWANER
X-Message-ID-Hash: LYJDYNHLL7SX4PZOZXZMRBVWN2RWANER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYJDYNHLL7SX4PZOZXZMRBVWN2RWANER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Y3Ic8DwDm+OAu+TF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2024 at 04:20:34PM -0500, Sasha Levin wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> [ Upstream commit 35314e39dabcfb256832654ad0e856a9fba744bd ]
>=20
> Driver does not use any regulator code, so drop redundant include of
> regulator/consumer.h header.

This doesn't seem like an obvious stable candidate...

--Y3Ic8DwDm+OAu+TF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXEvREACgkQJNaLcl1U
h9BN2Af/USv2MQK7rWzBfIWGhMZ4Xk4a2piJqomP7DM4NMIIDgUMNwjDHJjGLnt6
n4IThpQeGFxDWva3CapyOTthWZcu6KvzR6AzoiT0+aEEvmJ7USKck6KGqgkDZdBG
vgY79RdHhNsVSvHMqHhl+66BkUzhA1Pz/Trn3HrxNYZbiVAIuqZWY73sgbSVXYp/
g/yzWtGih1JY+CdXGOsdPObR5pI9S40ptWERUhppeB672t+yY/TM86HXpXRqpVKA
YJ7lXThB3kZaCc2t1LhGEmBtgxdBzAfopPldgpfJrb/eAVauMV7N/M94FalJvwgQ
zPb0RfE3fKuJW/VnM1ljgNxFwL04zw==
=wjDO
-----END PGP SIGNATURE-----

--Y3Ic8DwDm+OAu+TF--
