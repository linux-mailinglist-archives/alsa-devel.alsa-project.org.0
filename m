Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCD67992C5
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 01:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FF7B83A;
	Sat,  9 Sep 2023 01:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FF7B83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694215284;
	bh=1nkvFtVYE6mG4enJsXLmgOQmQm0V3mHWO63X25P49hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ECiOaoktwKV8Tub9QA9UWzuL9976wjGXUDnKO4qTTNZqE7xisW6yMYaEshWIFqzQL
	 QO0JdBQ223B+BXsFhz9KN/0gWPW7YCQEKD/q7LlZhjKt9BNhl7SzAsiAOpiaV6zl9M
	 rrwJxHULILkQsrD8LHkg7zvJ2AeK5Lc7gLbE8MeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5C56F80558; Sat,  9 Sep 2023 01:20:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 408DEF8047D;
	Sat,  9 Sep 2023 01:20:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84DCDF80494; Sat,  9 Sep 2023 01:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C23DF800F5
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 01:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C23DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HahHIcLe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69CDDB82212;
	Fri,  8 Sep 2023 23:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E1AC433C9;
	Fri,  8 Sep 2023 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694215222;
	bh=1nkvFtVYE6mG4enJsXLmgOQmQm0V3mHWO63X25P49hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HahHIcLepJzUpvY5xRx/aiPK5t6LgCPxVAt4TxYErUyBroD+LxGK2g3EU7f1kWGN8
	 19Sg2/QgVL6TnFgLUIJm6WlKRugP/jBu/zwqUtP8jh1i95elk6b/3LT+s6rV4cGbSw
	 UoE9KiYMNJsAr5LVtW4PTJdsTFPj6bBoN3hD/wHbuFdvCY72JP+7KR0z96Ztv+6rKp
	 dtOvS8AHWsMP0cEexjw58VOoWQ3Z9uOIAucGGrw5/h7ePdi109Ty4BkWVcu/V6saSy
	 kOepkWy00kf+VBvFEyuPCiyYYSsxO7s0Wt1pno+OYfXnNCTGuGGhrlpVNh7GYzEdwM
	 sIqyaDI/uyrYg==
Date: Sat, 9 Sep 2023 00:20:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	lucas.tanure@collabora.com, pierre-louis.bossart@linux.intel.com,
	rander.wang@intel.com, kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 6.4 04/31] ASoC: amd: vangogh: Use
 dmi_first_match() for DMI quirk handling
Message-ID: <8d75077a-799a-4bf1-b259-a931c00fbc54@sirena.org.uk>
References: <20230908193201.3462957-1-sashal@kernel.org>
 <20230908193201.3462957-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HJU+WQ/4Y17Xqo4d"
Content-Disposition: inline
In-Reply-To: <20230908193201.3462957-4-sashal@kernel.org>
X-Cookie: My EARS are GONE!!
Message-ID-Hash: HHHIKBLDV3XVBIIFUQJPOUMHJI5LE4HM
X-Message-ID-Hash: HHHIKBLDV3XVBIIFUQJPOUMHJI5LE4HM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHHIKBLDV3XVBIIFUQJPOUMHJI5LE4HM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HJU+WQ/4Y17Xqo4d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 03:31:33PM -0400, Sasha Levin wrote:
> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>=20
> [ Upstream commit 3dd26e27ccb4f18b4d25c0a49e1888eca9c6a724 ]
>=20
> In preparation for supporting ACPI probing, move DMI quirk handling
> logic at the probe's top, to be able to return as quickly as possible in
> case there is no DMI matching.

As the changelog clearly says this is preparatory work for a new feature
and therefore not stable material.

--HJU+WQ/4Y17Xqo4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT7rC8ACgkQJNaLcl1U
h9ANKAf/Uh5mXAR2JkTFtWmICqsgIMotI0tYYL1EQJOl40jGGQD3LyX7eU5+CWlD
zUlN60tqi37UvIWJyh1a7n9+L6kdNTPlmBEDO2d+/z+JnQ4hl5s73WQyvXOrzkpQ
ixmuWHh2exU257IBynFuHNbjys23co5MVDw7qfKl9Sd/XZtjRUURLsqNLrUPGNM7
DIyXAQODuKM06mjHzuQj3oemcBaYuiEZUmIzK8n3MbtEw0fVqGPfhenP5WNeI2Cf
5NvlAncOQNmXZVMd8Y+5lowDh8+D+/qYWAhtKTcvONki04i94sGjeKFf/hIeRJ0O
mOs5udsejjhFwCerwfhXCtxMGyIVJg==
=9KWO
-----END PGP SIGNATURE-----

--HJU+WQ/4Y17Xqo4d--
