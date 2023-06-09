Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 449AC7295A4
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 11:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84028822;
	Fri,  9 Jun 2023 11:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84028822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686303668;
	bh=2RqJTUusjbxWp6JJrQrKAubtiwiOkGgS0OIMXhczqdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iky00TrlxgxdXNfnq1oPxkZJXkb2mYPO3RPFI/o4EDFCvDT61IQSh8ECxl1Gq/uT8
	 JeLEtP5KCB6GnuP9wiOcrr2IDMz7RNmg1H+wjfGnUYDqoG/BtrFm+spzQO4yd2eyFy
	 1Tc0JBvU/EL3grSZ3tUjHLC9UT7yiwvCa9fr5mjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D55B6F80558; Fri,  9 Jun 2023 11:39:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A79EF80548;
	Fri,  9 Jun 2023 11:39:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3072CF80549; Fri,  9 Jun 2023 11:39:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ED04F80544
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 11:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ED04F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bioFzmia
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9F1B6562E;
	Fri,  9 Jun 2023 09:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD6C4339B;
	Fri,  9 Jun 2023 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686303571;
	bh=2RqJTUusjbxWp6JJrQrKAubtiwiOkGgS0OIMXhczqdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bioFzmiax2w20nUH5t8K3WmPTjuTEYjWc+pOmXdEKvCYBMb2G6PElrCfIJ7O/PN8N
	 I2VIQFynxR44Yr8U2Spm9r+s/vWPA8nNidCtQ1K1Y8VrUWe3doiODxwvIFEZjYCwUZ
	 pY8II5CPyyjpUGgDMxEw05A5O+Har0+CWh9ws0LLofFGfVgG6UIny/xRVZ2ECBJfwD
	 q3c8IE4pfYsv/go7Hf7OnKLelbndA30iYvDVHo7BPprfwi7cSECAunXZiVh28x9PZ4
	 6yze7jJllH+gIvLVWJL5qs9A8gsPe90o6SzdkN3LYP9u+HT15sllyeszWlJ0iExyeN
	 nJJZp73+B9/Tg==
Date: Fri, 9 Jun 2023 10:39:25 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Revert "ASoC: mediatek: mt8192-mt6359: Remove " Jack"
 from Headphone pin name"
Message-ID: <abe6e5f5-7373-44fc-90b6-2c01b1f1e96e@sirena.org.uk>
References: <20230608221050.217968-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vb2jlj/7oqDgwj74"
Content-Disposition: inline
In-Reply-To: <20230608221050.217968-1-nfraprado@collabora.com>
X-Cookie: Tom's hungry, time to eat lunch.
Message-ID-Hash: ZF2O7JNXIJDCQQ4Z2E4VT7H4V5T5D7KW
X-Message-ID-Hash: ZF2O7JNXIJDCQQ4Z2E4VT7H4V5T5D7KW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF2O7JNXIJDCQQ4Z2E4VT7H4V5T5D7KW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Vb2jlj/7oqDgwj74
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 06:10:48PM -0400, N=EDcolas F. R. A. Prado wrote:
> This reverts commit cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f. That
> commit removed the " Jack" suffix with the reasoning that it is
> automatically added to the name of the kcontrol created, which is true,

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--Vb2jlj/7oqDgwj74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSC80wACgkQJNaLcl1U
h9BJWwf/a4nq9jEGhBCy1pyCmPzoBI5oa1mVa3qi2EmesjaoCpgBYGoN2BT3fZ8m
h0nrfOqJrpjCvv0zoVX6F6rMzFyGZxhEWmNa2DiLkXWEZcOB92i3sj6QQZX0RFoD
HxqIGjNg44pfd7MkrTnqAtb09a8aOgdjVZmrNQIHS2Gq/XYrqL5je+pYKiyjs//D
mKU455/DRQpzNZfmcdKeiSAmCkxJsqPV/COcMv25yWmmnzZB967MIF7As97Rcby3
nQMMW4fJkrF2Qr6hyFlqirABm5OY/3ILTUprg5xPZHqSpShCG3sTB6j1vLHg6yYo
H35FHE1W2vBzR0u/ECy3AmPSiCr3gg==
=hy/b
-----END PGP SIGNATURE-----

--Vb2jlj/7oqDgwj74--
