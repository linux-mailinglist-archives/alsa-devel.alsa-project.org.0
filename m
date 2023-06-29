Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8951742474
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F13B825;
	Thu, 29 Jun 2023 12:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F13B825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688036117;
	bh=poSaV7vPCmMGIchCP8KtyYjj33uRe1tp4qJZ5FhuCR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g0tvSRhKtpeqYNEIB103ROb9asfBAKDjk+Yww3ZFKJ5YJgbwKrJR1ZaGDar9Zxta7
	 e+Dn73H7L8fhRkd8oSWz/gi7ND60wyoH2FH0jERO9oLJ1uuXuHccgW6gr2Tr69jGf9
	 wcavsmLrGRDNbO4/dICXdyMgQ/lHqmOtomkOrqBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F7FF8027B; Thu, 29 Jun 2023 12:54:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB9EF80212;
	Thu, 29 Jun 2023 12:54:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81640F80246; Thu, 29 Jun 2023 12:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C38AAF80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C38AAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XZzqE/WB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6658614B3;
	Thu, 29 Jun 2023 10:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE11C433C0;
	Thu, 29 Jun 2023 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688036035;
	bh=poSaV7vPCmMGIchCP8KtyYjj33uRe1tp4qJZ5FhuCR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZzqE/WBL7IXD6yWk1Df2Kr25ACGxHt0ko/HvPQBz2R8lxIpjag0evGKbB9BUmBTN
	 g3wFcdmD4ofzoGD1XE+mBPL7zKZ+gBfPXTHuHhDRJ/Rx+7WcTqbAf2y9yQgkqZlqe+
	 68iKkOJnRV9BayWqHhJri4gmybW/7ikFdQB1lkoOKG1/usNaJXbZLIOz2mFq8fJUfK
	 YmVeLxRa/ocv/G5TY+BdhWbHkoKc3e1Vd8svZMFlgh0yqUKFtk9MeOIl+GsIttRDzB
	 VkhZpffGMBhvfKThkEwexM1JKiV0KzOr8JgWcwT8QUctGhMjLt6adB3v6V2VBFQCjV
	 4wAYbNqcK5phw==
Date: Thu, 29 Jun 2023 11:53:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>,
	Dom Cobley <popcornmix@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdmi-codec: fix channel info for compressed formats
Message-ID: <65adc6e1-c74b-4cba-93de-172a7129228f@sirena.org.uk>
References: <20230624165232.5751-1-hias@horus.com>
 <168803481324.25247.5593448279992144349.b4-ty@kernel.org>
 <87zg4ifsz4.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BgVLAPeZ8a3Gk2s9"
Content-Disposition: inline
In-Reply-To: <87zg4ifsz4.wl-tiwai@suse.de>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: SFVN3A6QUROHDEE67OIHXPLOUHIQTIR3
X-Message-ID-Hash: SFVN3A6QUROHDEE67OIHXPLOUHIQTIR3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFVN3A6QUROHDEE67OIHXPLOUHIQTIR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BgVLAPeZ8a3Gk2s9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2023 at 12:44:31PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Applied to

> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

> Oh, I already applied this one together with another fix for HDMI,
> and it's in the ongoing PR to Linus.  I didn't notice that it was
> ASoC-only.  Sorry for confusion!

No worries, two copies won't hurt anything.  I think it was already
running through my CI by the time you applied it and didn't seem worth
it to restart everything.

--BgVLAPeZ8a3Gk2s9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdYr0ACgkQJNaLcl1U
h9CWVwf/XPtSjRfNi9gR3KLwYxvVVSCu4gSX4zsGhbswXhSD/HAWjnguykaz/98g
GwpZyNrod1racSgOeF+EKmy8jxk4POfu/lfuvNqxNL95AUCWgQFh2LIj+9iUcOlU
oIOIOhdTaTJTE8QEb4B9RnkdtrxewdpA493RYmvAY32EMs4EKYF18vm1XM8eF+by
diNPK8xlPg8Nf1L9ubJeQOKnJ/qbrDl0ZJYFQqsDGJPJEiTaAv+U95EffhBHtjzc
7vetrNIf2e1IBoSmP+ymzd/E22fGL7MML6bAf8yaYhNicxvI32or7OvhUlV2zaBy
ehR++q3VfFNJDy/EpbsRK0rUfzX7Yg==
=mgUV
-----END PGP SIGNATURE-----

--BgVLAPeZ8a3Gk2s9--
