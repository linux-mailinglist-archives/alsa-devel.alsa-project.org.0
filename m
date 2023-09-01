Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB5A78FE5D
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 15:36:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40D20E74;
	Fri,  1 Sep 2023 15:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40D20E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693575381;
	bh=7tJjHS4ALlhltlYpeHHPA2u1cIcmNQkrQ3zNQHdRjKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WOGMOUzhqLbCPerno8ApmrSGgadDLSAtcwCJXV7S7yC2P7lqC2JQ4y4vPQdiSd3wd
	 hK9Mz7251MzJeUDEczDflsl3cEJ8GA+w7QW+eR7qrdbDEwGQICoWXTGr18tM7jzTdX
	 UivNip5sDmIJjkGS4ED7/3YUAhWJYxzQHBF2mfFc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EF5CF8032D; Fri,  1 Sep 2023 15:35:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF690F8032D;
	Fri,  1 Sep 2023 15:35:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C796BF8032D; Fri,  1 Sep 2023 15:35:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF8CF80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 15:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF8CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fIJgqZJu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92EA16252A;
	Fri,  1 Sep 2023 13:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21270C433C8;
	Fri,  1 Sep 2023 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693575312;
	bh=7tJjHS4ALlhltlYpeHHPA2u1cIcmNQkrQ3zNQHdRjKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIJgqZJuKpdqAB9WfkMmSla+o2/nu9NuLBwkgDZ5DrxdSTv76ZinLNNQE+bU2EE4i
	 hbIEhFcTMAJMMeIJWKvFVWVZgDKthrlQ1OgQG0ZdJ83bmYu0AssUu3F6RYB3ydO5ZY
	 G+k2s/OppfyvI9uPqm55sdi87zGQP6nuoGR4mRsYHhMBETjWKc9OSwKp1fHoi1PFNq
	 25nURmZFyhEoOVArnmIKTLDJyXRdBrqZBsfoNJt9ywD+3h1LHmAHCk52Kp+0yURs1u
	 Hz2jOR3KNb5UOPCci8gD7jI9OixFHx6dUgNURwypWTEOMPDOvFmrmStgSyq3JTAMX4
	 LkpqUFtLfARQw==
Date: Fri, 1 Sep 2023 14:35:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/2] ASoC: Name iov_iter argument as iterator instead of
 buffer
Message-ID: <14bef766-7d42-4a4f-9edf-3ba72bae0969@sirena.org.uk>
References: <20230831130457.8180-1-tiwai@suse.de>
 <20230831130457.8180-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DBL0C0ejqb/9/M1l"
Content-Disposition: inline
In-Reply-To: <20230831130457.8180-2-tiwai@suse.de>
X-Cookie: Dealer prices may vary.
Message-ID-Hash: Z37RJM5QDS5CJNKVIEW2HSCLFIY3WE2L
X-Message-ID-Hash: Z37RJM5QDS5CJNKVIEW2HSCLFIY3WE2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z37RJM5QDS5CJNKVIEW2HSCLFIY3WE2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DBL0C0ejqb/9/M1l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 31, 2023 at 03:04:57PM +0200, Takashi Iwai wrote:
> While transitioning ASoC code for iov_iter usages, I kept the argument
> name as "buf" as the original code.  But, iov_iter is an iterator, and
> using the name "buf" may be misleading: the crucial difference is that
> iov_iter can be proceeded after the operation, hence it can't be
> passed twice, while a simple "buffer" sounds as if reusable.

Reviewed-by: Mark Brown <broonie@kernel.org>

--DBL0C0ejqb/9/M1l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTx6IsACgkQJNaLcl1U
h9AtBQf+LlI4W9Q9UA5ThC9Epso0Uamga0wl9Fy3aUS07lpFMTgrF5f6RwpT6qha
J3sEQst929vsNlVdrnzQEgDp3/IzA+tr94Ni7C8bRyLQTuKSpx58OdVA1xzRZgls
7NhmFFJ/t+gaVyuDPjOQlsC1Puvma4Y2bXIQrs8QQrsro7NzSSzKDpqfrdrsLAKj
U5Rx23xbrWh8pdRMtQn5O8ggJxv8twoa5VV2Xjin469Bgpu+3PPxtFlooxikLqIN
OViKMMzngRX8NFqas3VWM/0bc33OCvl8aIlqXPA2EPEzR0JfetkVw9HqB1TIzT8g
QKJrtQl3CxaQIlKEH5Bt0oULCWGP3A==
=H6vU
-----END PGP SIGNATURE-----

--DBL0C0ejqb/9/M1l--
