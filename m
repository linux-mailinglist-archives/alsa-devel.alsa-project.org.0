Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17CE7D4FBA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 14:29:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883F684A;
	Tue, 24 Oct 2023 14:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883F684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698150588;
	bh=tuVRiGfQiWnM8E4jicwfik1xeBx/YMhxgZb/0MG2F4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xc4YMiCMO6AY0omS7HTz2tEhPY/UwCQrv12igm2idfk97I7MHjuwx3hZ81QGpqNmP
	 GAaA7oLtoncpWzvss7x3QXx6kHdmY/zb/Y+WwPqqg68/RmQZQhqZgLGeM+sL3bAwHN
	 nK9u81ZmKmFAIveu+te6SqvxPZiWuYFkKEroPnnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3433F8014B; Tue, 24 Oct 2023 14:28:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73279F80152;
	Tue, 24 Oct 2023 14:28:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A541F80165; Tue, 24 Oct 2023 14:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5A82F8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 14:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A82F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UWHLdykI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 221FF60AD6;
	Tue, 24 Oct 2023 12:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575E7C433C7;
	Tue, 24 Oct 2023 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698150522;
	bh=tuVRiGfQiWnM8E4jicwfik1xeBx/YMhxgZb/0MG2F4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWHLdykI0TYkRuv6Nspi+eoG1Ivf+2eKMvv2aHJ/3Jo30KcRddOiMAiVlRzG6+ygY
	 Uyr45a5l18MsV0KP9gEtiyRSdyCR9vguEzyjDILw8CvyGtsRkacg4TtQO65sjS26zC
	 kDIw5VTQEc7QZXgBVvur0LvFobYhyDuL1zjzTnW+50hp8LFUySFpztjP8SSADPx87U
	 CyY8I7gm7NiDqYChSRPsqTMY9Z1rBIq5rt2zKDUti9l6ZCxG/Bot7EloKKxUJrrivk
	 B8ycJVueAQqLCIGenpU95Cju5jNvGTBFiL+UZ/aXhpKTdOtenw/cqSRkQIBQ9XGoSr
	 lfydOIulMKjbg==
Date: Tue, 24 Oct 2023 13:28:33 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, ajye_huang@compal.corp-partner.google.com,
	alsa-devel@alsa-project.org, arnd@arndb.de,
	ckeepax@opensource.cirrus.com, colin.i.king@gmail.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	devicetree@vger.kernel.org, harshit.m.mogalapalli@oracle.com,
	herve.codina@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org, liweilei@awinic.com, perex@perex.cz,
	rf@opensource.cirrus.com, robh+dt@kernel.org, ryans.lee@analog.com,
	sebastian.reichel@collabora.com, shumingf@realtek.com,
	tiwai@suse.com, trix@redhat.com, yijiangtao@awinic.com
Subject: Re: [PATCH V2 0/4] ASoC: codecs: Add aw88399 amplifier driver
Message-ID: <7fc2d20d-935f-4721-9731-5719f27de5eb@sirena.org.uk>
References: <21bfa0bb-d936-402d-9ca9-6bcf181a0f35@sirena.org.uk>
 <20231024071419.85647-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQX9jpEgbcrPJR92"
Content-Disposition: inline
In-Reply-To: <20231024071419.85647-1-wangweidong.a@awinic.com>
X-Cookie: 1 bulls, 3 cows.
Message-ID-Hash: FXICIKY3JURW5VNQ64ETSEZ3LEPQRUC7
X-Message-ID-Hash: FXICIKY3JURW5VNQ64ETSEZ3LEPQRUC7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXICIKY3JURW5VNQ64ETSEZ3LEPQRUC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qQX9jpEgbcrPJR92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 03:14:15PM +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
>=20
> Add the awinic,aw88399 property to the awinic,aw88395.yaml file.
>=20
> Add i2c and amplifier registration for
> aw88399 and their associated operation functions.

This *still* doesn't apply against my current for-next (or for-6.7)
branch, and you've resent it as another v2.  Please send something based
against for-6.7 of my sound tree.

--qQX9jpEgbcrPJR92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU3uHEACgkQJNaLcl1U
h9A92wf8CuLMWbP/AW27kNDmBWdIufdL3rInw6tXVuVaKQDuc1WEQc438WdrNbCn
FCrOE2X0714a6ZE6I4qe+ffBJgZVsOyFqYr0glcH+/BJmhq1a4fMZ0Ox4cX8WtJL
sBRrfI8vxohBLqhmZiuHBYf1gW/idYHqwejeno+8ywrboZ26P3krM8d+bozyIQaO
tjsLl+X9JvQ+t2BBz15S8Fg7sm3tWb9Jfrsgeeiardf0gywyyM9pfolXNJ+LCINP
HOwP09yGF+/yY/z+3eyhq7R/0VZLE1UB03JbeH4tCiubtuJ6QrCFbCARXe6Eca9o
IKMUZtmzjGXZ5UFdTGva/qUCjVBH9w==
=jGdD
-----END PGP SIGNATURE-----

--qQX9jpEgbcrPJR92--
