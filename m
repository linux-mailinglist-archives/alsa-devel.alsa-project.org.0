Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8D743A2A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 13:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF963E7;
	Fri, 30 Jun 2023 13:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF963E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688122888;
	bh=sgtH9hZqBaNjjeUXFQwQG7JJgk9ed7LANci46Hsnjv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BNY75PekUf3FoGJ60QKR5d1VnNyRPp1WkxGBsGWPLj4uDHvr2mMkX8x4GdzVUXvxz
	 4dzT7WtuDHfYydVL1Jj4iIm/dn4yoWPaVXc+sJJB9VidM94yQq8W4IxC1ZqN4OMPDM
	 asCSEz/Fqp2l7xH2+tV1x0wRmTcbQR61pnt0Ah0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16712F80124; Fri, 30 Jun 2023 13:00:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F8A6F800E3;
	Fri, 30 Jun 2023 13:00:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6AADF80246; Fri, 30 Jun 2023 13:00:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C9C02F80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 13:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C02F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BpnOTSrY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 712D9616E2;
	Fri, 30 Jun 2023 11:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FCCC433C0;
	Fri, 30 Jun 2023 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688122820;
	bh=sgtH9hZqBaNjjeUXFQwQG7JJgk9ed7LANci46Hsnjv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpnOTSrYx+DAq9f8wxupbHlc6hHlI5W/9pFyY7K3yYn+4bgqePy5/dCjlhj10PjA6
	 VfwzZ6WRubSZqZcsDSBkjK5vxksaPm9g26oU7tajQ6QBVI7XOGoj2v7B7Lc1v+Fx6Q
	 0UJCjjoz56Ktq9o4o1RhkGWcZQz77nnlJi/RhqVoH7oA5x6NhSl8qGZyGzzHUOLyHD
	 z2J8b8H3sM4l6zvt/6ac/wfu8SB1u50bWzZM55n4D7aculbKRhy+TATdiukI/e6e5t
	 hCfVz6zPXsMMeFFfZi7DNdxcdh8Un2BXql75/jkImY5tzcUrYrSXDf5hPDZGerD5KA
	 csJfXMpzXQfRQ==
Date: Fri, 30 Jun 2023 12:00:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: add constraints for PCM
Message-ID: <6cda3265-7444-46a1-8b2e-75706a839670@sirena.org.uk>
References: <20230629075910.21982-1-trevor.wu@mediatek.com>
 <5995e77b-ea8e-4e88-8ca2-f716df9c9579@sirena.org.uk>
 <0e8b5ca298a01b16da0419928a30af6371e923ca.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pXwnTTZI7oC5iMkQ"
Content-Disposition: inline
In-Reply-To: <0e8b5ca298a01b16da0419928a30af6371e923ca.camel@mediatek.com>
X-Cookie: Old mail has arrived.
Message-ID-Hash: 4LHUOFIR6T3Z65MP6MS5VHA6UIMLD545
X-Message-ID-Hash: 4LHUOFIR6T3Z65MP6MS5VHA6UIMLD545
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LHUOFIR6T3Z65MP6MS5VHA6UIMLD545/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pXwnTTZI7oC5iMkQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 05:29:23AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) wrote:
> On Thu, 2023-06-29 at 16:06 +0100, Mark Brown wrote:

> > This commit message isn't entirely clear.  The effect of the commit
> > is
> > to restrict the configurations supported when using a nau8825 but
> > it's
> > not clear what a nau8825 has to do with this or why we're doing this
> > in
> > general.  What exactly do you mean when saying that "only a limited
> > number of parameters are necessary" and what makes this the case?

> For instance, some userspace frameworks only support specific sampling
> rates such as 48kHz on Chromebook, making other parameters unnecessary.
> By restricting the configuration, unexpected usage can be prevented and
> the alsa_conformance_test process which checks all parameters provided
> by an ALSA driver can be sped up.

That's a userspace policy decision, we shouldn't be enforcing this in
the kernel - even for Chromebooks people can install other OSs on them
which may make different decisions, and it's always possible that the
ChromeOS people might change their mind later.  If they're only
interested in testing 48kHz and it's slowing things down unreasonably
to test more then they should just only test 48kHz rather than changing
the driver to work around it.

> Would it be more beneficial to establish the criteria as a general rule
> for this machine driver, while limiting the use of the machine driver
> solely to the Chromebook project? Or do you just suggest that I add
> more details in the commit messages?

I think we just shouldn't do this, it's policy for ChromeOS rather than
something that's actually needed.  If we were doing this it would need a
much clearer commit message and we should be restricting things to
Chromebooks only.

--pXwnTTZI7oC5iMkQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSetbwACgkQJNaLcl1U
h9AkJQf/ahowvDnHs1ls1VrPs0VUmHp+BdUcwvobHhunvly76Nxkzn5NlOL4bhlK
ZTJYLgJuqYRagPBQWDP1vpBU64KEKPaXaFOZ9f69/Cg8xsEtw+9B0sgJzhfD9eES
FaMo9A/kdwgIzDEl1Blr/OS34ksno/bQMSJ2PzxDZ4OZUqvCSkVdh5iey/4Gd8EI
aRRU/b1LyHjhkMC2DrjPKTlYcBtg3t84b3+Q4SGWF7RLi49nkxGl0TC/SAq56pF0
WU+u0JkSsVxucQJ0pFHSl7OX1KohuaAVDB+c4tPE7dNFnluU8LjeKBJEXPvQlpo/
OcVDr55IMaZ99d1mty+MfTgJUh6Haw==
=AxtQ
-----END PGP SIGNATURE-----

--pXwnTTZI7oC5iMkQ--
