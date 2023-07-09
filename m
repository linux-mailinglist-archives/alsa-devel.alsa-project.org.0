Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39674C871
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Jul 2023 23:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE85F207;
	Sun,  9 Jul 2023 23:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE85F207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688939264;
	bh=vFN34oGZLAuyX5oAAW+A1X+ypXj6cv1/h6s7XtFQnXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JUg5oSfbYn/9UlfEqnvPUlCp03D+B6R768uh51iXjTxxMQgifrTSisbnr6wCi17Lv
	 YGBwH9fBL1C0FTMUPfUeVbFsa9F08mP4SSnK1ID4yt9Y7SF5uFQPtMMT5Zdc6YCp76
	 xFirKWOVOTBqm+O0IU+f5vjZQ4JNu88wjX+E6PXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37D0EF8024E; Sun,  9 Jul 2023 23:46:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D75F80153;
	Sun,  9 Jul 2023 23:46:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8278F80236; Sun,  9 Jul 2023 23:45:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36E41F80093
	for <alsa-devel@alsa-project.org>; Sun,  9 Jul 2023 23:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E41F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QLhXRQWv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 734DE60C75;
	Sun,  9 Jul 2023 21:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DE0C433C8;
	Sun,  9 Jul 2023 21:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688939093;
	bh=vFN34oGZLAuyX5oAAW+A1X+ypXj6cv1/h6s7XtFQnXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLhXRQWvD8qBG21MEv4lE8n32EI+n8p3n5o4qSnldQfpbBEVZ5Vn9CTxBVak4I/3p
	 K2DvGU4fgsoGgKU6fWfdpqK1YCDhLCizHjzyDW34uDjfrYril9IwIS6QmzKu2jt8Am
	 z7E8a7l6uLrD3r3RkIrIP6kPODLz0qjFW4bybL22heaeL3nA0kjyGvM+vKXGLRAQOc
	 1GasCcoN5iM6jS2Lu+Eljwkk2SHlAiodn6zbfvZ804PeTE7SmqNUR/INqCpSf6jlPr
	 ujxvJtx3OTeWGrLhYv30zNuPwFX5IGMYf72RqpsQaLZJd275mDA99dqKb3JPP5Ns0V
	 Bf4zApQbKx4Ow==
Date: Sun, 9 Jul 2023 22:44:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 03/14] ASoC: soc-dai.c: add DAI get/match functions
Message-ID: <d3cba4da-f2f9-4d93-9bd8-d94db23828fa@sirena.org.uk>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
 <87mt0tblsf.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K9zKhRW6LLXHlYmC"
Content-Disposition: inline
In-Reply-To: <87mt0tblsf.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You will outgrow your usefulness.
Message-ID-Hash: 7TEOT4N4SZM33T45NIOAUYEELR6UCSPH
X-Message-ID-Hash: 7TEOT4N4SZM33T45NIOAUYEELR6UCSPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TEOT4N4SZM33T45NIOAUYEELR6UCSPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--K9zKhRW6LLXHlYmC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 02:18:25AM +0000, Kuninori Morimoto wrote:
> Current ASoC is specifying and checking DAI name.
> But where it came from and how to check was ambiguous.
> This patch adds snd_soc_dai_name_get() / snd_soc_dlc_dai_is_match()
> and makes it clear.

This doesn't apply against current code, please check and resend.

--K9zKhRW6LLXHlYmC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSrKlEACgkQJNaLcl1U
h9DgBQf8DC9xDwsFKy6qz+37xaYKooY8vvSjQIE6+5DXqEXtp8JvolTYKFFKMBa/
6CkirLpP0bR6fxiZLC/n9/5Alx1CpYWrS/WKKRINypRbKPrlbTro6KUolMWvQ1sf
TA8F2SFK6RUlo473ulXVlLgm/EYkxyHWm6eqGbCdeguKTKXqCPkwdu/roMSj7jOY
/yLHkAEZ/OYzdaX359Pkv+A61QPDTKbZQBpDHps01IWiotpZwepwiEPjB6i1DMAY
YW2qXzckPIAwXlZax6zPEywTYlY8uVfN1YhU5bi62JsQkt2yNzG9D8m5bkYQpGVn
dstxq5/hcMsTAYewtLrJui1KnbEs0A==
=/3kd
-----END PGP SIGNATURE-----

--K9zKhRW6LLXHlYmC--
