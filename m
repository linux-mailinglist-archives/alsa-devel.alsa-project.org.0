Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3370FF36
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 22:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7501E8;
	Wed, 24 May 2023 22:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7501E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684960110;
	bh=3KEdcds8pktgrixeF2rUQnEoZP6caZdUbI+fhN+eseY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WJ0yPM3cT4eGPDxnTF0d6mS+zH75w+p9J974/bDxXqMOfK5CYOgZmv77zerDtFmZ+
	 8qwYwOBJBAYnE0vs4rgrd4FC1ctvfaMI+ChMWl76SkAkXpzBTFTNCe1FIKZ94YyLo/
	 Mtldvhdq1pZGzcrkC+6PIOqI5yvoTQYlm8Z4s0QA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5342FF8053D; Wed, 24 May 2023 22:27:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE8EDF8016A;
	Wed, 24 May 2023 22:27:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20D7BF80249; Wed, 24 May 2023 22:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A779F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 22:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A779F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V2aiUqYd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B71164085;
	Wed, 24 May 2023 20:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566BBC433D2;
	Wed, 24 May 2023 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684960044;
	bh=3KEdcds8pktgrixeF2rUQnEoZP6caZdUbI+fhN+eseY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2aiUqYd8DKFelba3RUMedUwC26vmwdlBh4gGM9/y0u+Hzn3fFoKSlrMc03cHi2XB
	 tKD9/fyUJ9Z5RapszWokWkZgUO6AaqaF1AN8ls90VnScb8N+pUcy2xdNlu73iT2yBR
	 Cz4rz1mZZtQtjPdLVTXQ1Nk02J1IxXxwR2Fu64ttmws+YaFoR8YHRe6X8C318L9YUX
	 aIWX1dXdsyEtWWGoZHulSqD2w0hAwI9DEfAPl7kT1gOVdj3ewtx2P98FDa8eIdOvi9
	 1uTmjyWp+t/SydxdPG+3ePfQiJrNxSuxabHsaguGLJZ2WuF68i+zVOU89eYlniks5K
	 n7m+x+SJxjefA==
Date: Wed, 24 May 2023 21:27:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, zyw@rock-chips.com,
	sebastian.reichel@collabora.com, andyshrk@163.com,
	jagan@amarulasolutions.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, heiko@sntech.de,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: arm: rockchip: Add Indiedroid Nova
Message-ID: <20230524-uncommon-coroner-5a4d9c339837@spud>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
 <20230523213825.120077-6-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7yud7buBms0aJE1s"
Content-Disposition: inline
In-Reply-To: <20230523213825.120077-6-macroalpha82@gmail.com>
Message-ID-Hash: OLKHG7UFXNLQPWBP4SLDSDSJILYFUYCJ
X-Message-ID-Hash: OLKHG7UFXNLQPWBP4SLDSDSJILYFUYCJ
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLKHG7UFXNLQPWBP4SLDSDSJILYFUYCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7yud7buBms0aJE1s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 04:38:24PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add Indiedroid Nova, an rk3588s based single board computer.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--7yud7buBms0aJE1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG5zJgAKCRB4tDGHoIJi
0kkAAQDSQ39pj7YaiCc3FVNbMWl5Gp5U3oOWKezpcy0eTzLgGAD+MSTxq4WlDB+B
uhJPLc3tOTyQ8Ym9YKaOgJrsHNrJgwI=
=rAUF
-----END PGP SIGNATURE-----

--7yud7buBms0aJE1s--
