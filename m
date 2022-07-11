Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28045570435
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 15:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB40826;
	Mon, 11 Jul 2022 15:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB40826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657545913;
	bh=G70xBG379C6f8fJ4Hi2cSSohFChcI3TzIWyJTrOHcRU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kH/WDj1nAbWjb2XlgDQhacrle+vtdODAJpeh+xzVhCbV/UB1TUEu6zr7FxQa6VnZa
	 8eW6LS8/MHMf4w4SMRzYRig3Y9un1wAgNFxSkiH/UAzFWeYEOpoGS62PNfR/nlrs6/
	 UBcGoICMogE/vuZapuOhDz/5+DHhrgdUw3+1JyE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D75F80256;
	Mon, 11 Jul 2022 15:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A576F80163; Mon, 11 Jul 2022 15:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2DD3F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 15:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2DD3F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jP1Zn0WW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63F2D6143F;
 Mon, 11 Jul 2022 13:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459DFC34115;
 Mon, 11 Jul 2022 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657545845;
 bh=G70xBG379C6f8fJ4Hi2cSSohFChcI3TzIWyJTrOHcRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jP1Zn0WWw4060K6LRNqkqIVb0fNrKWYIEtemq9b7lxU2Ed4QbszNV7H9tImg57LBp
 lknP1pVJza3KXF4mLs6Zqd9J8gJ3KXmXg0RBqnwEttJVGSSzptaIp70UbREzJPAykq
 3vo1gyzOkb6msiZdQfLwQa9ENLvwiduGQF/XSY7FhWkvPU84dFjygQNP61SZf29BPp
 n/exw/dSDqizck/dAA/hmQrqfP/a8e3OvxIf8i2yutOWJnzW+zZLjZ+vBYl9H6+HER
 BhcxlUFEW7TUqPRnI0r6fLKjAFEXTexuIROV8fIZD06D4Cat84xiR1A7NToT8sWBeb
 Dn7953VK+tAVw==
Date: Mon, 11 Jul 2022 14:23:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
Message-ID: <Yswkb6mvwUywOTLg@sirena.org.uk>
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8nxuGyPlmzXFliIn"
Content-Disposition: inline
In-Reply-To: <20220711130522.401551-1-alexandru.elisei@arm.com>
X-Cookie: I am NOMAD!
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--8nxuGyPlmzXFliIn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 02:05:22PM +0100, Alexandru Elisei wrote:
> Commit a5450aba737d ("ASoC: rockchip: i2s: switch BCLK to GPIO") switched
> BCLK to GPIO functions when probing the i2s bus interface, but missed
> adding a check for when devm_pinctrl_get() returns an error.  This can le=
ad
> to the following NULL pointer dereference on a rockpro64-v2 if there are =
no
> "pinctrl" properties in the i2s device tree node:
>=20
> [    0.658381] rockchip-i2s ff880000.i2s: failed to find i2s default state
> [    0.658993] rockchip-i2s ff880000.i2s: failed to find i2s gpio state
> [    0.660072] rockchip-i2s ff890000.i2s: failed to find i2s default state
> [    0.660670] rockchip-i2s ff890000.i2s: failed to find i2s gpio state

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--8nxuGyPlmzXFliIn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLMJG4ACgkQJNaLcl1U
h9B/nAf+Kvf5A4KB+uPO75jiVyCWYLkssKsw3HPjAgF8EBe+8IPSH4bMdRcdnkQH
/pZO3j8srxvMN1ABFQcuRSwjkxGjKYw6JGKo7W0BjV20qZ8PwLWPIOb9VVEROFiP
ky6OFpD3u5KGXVx95J8syIOrgskyM+CQ+eczZQCezEVti0W/WeysP2nm96HChhQB
9CogIqhh3ta5E7G7aq74o2o9reistKq1WNh94UfjDGGmj62d8RWdCVkLTrHjqY5n
sMAZHBBjIFybtao7r1NtcwUwTsvGcUWqX1u5xFhBx8i3T8aWbC5M9a1wdNGGzAtM
dGv7Ol9LRhreIVWgVe63OzthpynCSg==
=AqBY
-----END PGP SIGNATURE-----

--8nxuGyPlmzXFliIn--
