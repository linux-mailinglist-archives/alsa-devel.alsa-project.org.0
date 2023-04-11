Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC856DD991
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 13:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48231F14;
	Tue, 11 Apr 2023 13:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48231F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681213222;
	bh=/QdHGYeIbfo/3518TeLMyhUA4GGa9EF5z1qxX6n5wKw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V8L1vA6a9IBBWQUCdWRPtCCTikI3gP/j/djdjCQq+SqyUtRdb1nYq2ZL39cfpSQjP
	 5SwZKe15OeUPOjBlIwhqaNJN6NTz+XAVyXJ2Xd0w9J4Vw/DBgW2y/vbt1Hntw7yixl
	 7e95fm0qaXwxvO0nEsiOUWMmEhChavYIqVye0Cg8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA622F8025E;
	Tue, 11 Apr 2023 13:39:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C04D9F8032B; Tue, 11 Apr 2023 13:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7F4BF80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 13:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F4BF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=syfVKP2u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A1B1615C7;
	Tue, 11 Apr 2023 11:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4CC8C433D2;
	Tue, 11 Apr 2023 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681213159;
	bh=/QdHGYeIbfo/3518TeLMyhUA4GGa9EF5z1qxX6n5wKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syfVKP2uEXRCX27AOe2rirvMFFUzgy4SdwRhayQSMkW+S4Qk0CaOT9/xWZpd5C0Vo
	 0V0C/Vr4jD1gVXTUXtsLnVbZftk5vhYQGmSvvlOTaGxFGO2QO2S/zedAp4JyCihmT1
	 rtGE1GuCEU9OcNr6K5bwqN5/P6qFvzO1evlshXJpskNu8qyrMQvLrjq6wRws/rDpZ/
	 RO65lv0q+JIX7fu2szt/GuKMwCu3kMa6II08YC40vLCkEz+tp8ynLEoZY3t4CR3kgn
	 I3hjoYfpHELSP0gTTWxh2krFhwe9dVe0wt8hk3bSe07Lp3A24XxwhgHr7U/wlbLGwp
	 HmHfnzNSQyLwg==
Date: Tue, 11 Apr 2023 12:39:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: ep93xx: i2s: move enable call to startup
 callback
Message-ID: <110982c6-c3ad-4d47-b6c9-6531a644712d@sirena.org.uk>
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
 <20230410223902.2321834-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kOvKSPZAebBkIE2J"
Content-Disposition: inline
In-Reply-To: <20230410223902.2321834-2-alexander.sverdlin@gmail.com>
X-Cookie: Sauron is alive in Argentina!
Message-ID-Hash: 5S2CQV5N72JAO43WKV7UAD3CBKJ3PVEN
X-Message-ID-Hash: 5S2CQV5N72JAO43WKV7UAD3CBKJ3PVEN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5S2CQV5N72JAO43WKV7UAD3CBKJ3PVEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kOvKSPZAebBkIE2J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 11, 2023 at 12:39:00AM +0200, Alexander Sverdlin wrote:
> Make startup/shutdown callbacks symmetric to avoid clock subsystem warnings
> (reproduced with "aplay --dump-hw-params" + ctrl-c):

This doesn't apply against current code, please check and resend.

--kOvKSPZAebBkIE2J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ1RuAACgkQJNaLcl1U
h9DvZgf/b+Wm8jvRpiAIE66Nc6EchfS6cCr/ywxMOKkFIl5zx1/31LBBW4+FfxHb
NrDSqDFths+0HnYp0Sz7d3XNZn6P60MnwUH4EGGMQ4KbY2j7X7/V59UXxowFD9R2
K/Vd7BqSLDfqEBl8iZXhXuaawPcUiTSOKNiEiOMxpKk2N9V8hgpj5cSX8B0fyZox
i/oUzXQiIZNN/fI4QJC6NFb+bGY6Ll7JoPudMa9aihTa+/Jl/AYP5v3OC1AsMbMV
s+DWu6IfzBvziVw74R/fMJianSdlOxpbv8vQXtLTEFXay0QcbZA2U2ZQvgkvSCoL
d3WchgdhuXdnBMqYqvkn9f+SZyNjHQ==
=oVJq
-----END PGP SIGNATURE-----

--kOvKSPZAebBkIE2J--
