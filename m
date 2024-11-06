Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F69BFA2F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2024 00:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89ECB741;
	Thu,  7 Nov 2024 00:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89ECB741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730936010;
	bh=87Z6ChZTRDwcQKUGbg4OylOoY3jZ6CxKLD7unKaMEo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OH/g+VSO6nYl6o63s7oTMkfk8VsOLDSiflGx+txugDa+SspF1gm7yNPdJ2oymKJ2T
	 6BX0vJtp4rNuwm8xbvZAc5lD7AY+l5n2UkLKphXRv2tshziFp/VnDUQSEErwgc90fX
	 aTMPWIuU7rCax2NWEk6QA+/8z9Fe3GWhKROaHfjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 554D7F80603; Thu,  7 Nov 2024 00:32:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78CD5F805BF;
	Thu,  7 Nov 2024 00:32:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EFE1F805F3; Thu,  7 Nov 2024 00:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A155CF805F1
	for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2024 00:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A155CF805F1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ePV3VsEp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3878EA4030C;
	Wed,  6 Nov 2024 23:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F8CC4CED0;
	Wed,  6 Nov 2024 23:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730935934;
	bh=87Z6ChZTRDwcQKUGbg4OylOoY3jZ6CxKLD7unKaMEo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePV3VsEpc7HYjKBtU9kKj+FbpArK3+YDFH8Cb/YqSJln7HwBnSFIHKlYwz1rDmCl0
	 gjm1Vm3kI9bS+jXHm8Gl7H5oJ0Y14F3aBh/R0sg3T5Caj/kYambSfj/7/zlLa8vdgV
	 foyKSojlFuZMopnb0kcpy4EZKdlYqWVN484B4wxNwguEUoC9Rrzng7mNSQLYbZSspp
	 evQcF4nKtYPzoGtHpatd3YYPXPS85NE2XXtzwZX+dDayQUtezCxEbuhsSXX55KAh66
	 h2aYIw5L6iXo4nEZ5kv8eWuEOojEwRIcbqCVq91Fhmkau1HQhOLt3ZQf7dyb0qDMP8
	 EWuHTdPFBAZpw==
Date: Wed, 6 Nov 2024 23:32:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v4 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT
Message-ID: <921e46e0-1490-40f2-899a-f8562256d49d@sirena.org.uk>
References: <20241106005800.7520-1-kiseok.jo@irondevice.com>
 <20241106005800.7520-2-kiseok.jo@irondevice.com>
 <kspk7qajv7r5glbcawmecbup36cv4wi3hjrgyfyyejjectwwt5@u5nx5y5zirsa>
 <092cfb04-378f-4997-88e0-35c247b8c445@sirena.org.uk>
 <SL2P216MB2337334118683779C2FEABDB8C532@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2kSW8dw7hKOyK1AY"
Content-Disposition: inline
In-Reply-To: 
 <SL2P216MB2337334118683779C2FEABDB8C532@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Include me out.
Message-ID-Hash: SMYSPJV4MC76227LIBNJ7XKNXV5XKSZP
X-Message-ID-Hash: SMYSPJV4MC76227LIBNJ7XKNXV5XKSZP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMYSPJV4MC76227LIBNJ7XKNXV5XKSZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2kSW8dw7hKOyK1AY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2024 at 11:28:45PM +0000, Ki-Seok Jo wrote:

> Oh, I'm sorry, that was my mistake.
> I realized the error and send it again using a script, but I accidentally left out the changelogs.
> I'll resend it with the changelogs added this time.
> Since there are no changes, I'll simply resend it without additional modifications.

It's OK, no need for any further resends just now - just try to consider
it in future.

--2kSW8dw7hKOyK1AY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcr/HgACgkQJNaLcl1U
h9BB/gf/YksRbOGZotMGDGEoCRc1ujhaZOmYBMw0k7mzc1O3IAyX7C7vtTCY4rhj
HHRqskm3vmGw0DE56lNOK9/oABkXkTnXGW6XX3lsHRcl2whBx3oW5cnPP1vOGqds
Uop28iRhBj6tcqolAWAmlTlNZOo/fkN4ai6qTVcodHlc1KjZGjE8MQxNO/6Dyr/Q
U7eh/ouyMpFjYUaK3PjXkfAe8VDhEaoRTKSKH04MfQA8e2PuPQc4Co1k7B2lbD/e
aWZBsRilxoXcAypGo9/JwGW/uPjFVALitFpAFzTaOzWYGe13Md/GsqFF9kBxBFXZ
uaaHZtI/dAeNct1iXOix2huMwogcSA==
=eONU
-----END PGP SIGNATURE-----

--2kSW8dw7hKOyK1AY--
