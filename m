Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704B1CE1CF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 19:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AB21615;
	Mon, 11 May 2020 19:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AB21615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589218539;
	bh=Mb6RDzi1I5+pxVNi9IB0d0jSTDxGRu/TLIydO2Q4lJE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHIh37B6ttOuporSXI1pARIDqmhHIPIOiJFvLJQeJO6vrHgDtSdhR/fqKK2Gfh9bT
	 j5H/0Z2Ftl2d07kH/Tsmae2mDRyBhpyhwG3aPits5UNmh9YYiwlqLnSgPM4WbtZ2jA
	 xDXX3KWJnT9uz0FxrXihkGUrGNRBbKlUG+8O82sQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB330F800B7;
	Mon, 11 May 2020 19:33:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6F8AF80157; Mon, 11 May 2020 19:33:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9068EF800B7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 19:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9068EF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T/2eOuH5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 161032070B;
 Mon, 11 May 2020 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589218428;
 bh=Mb6RDzi1I5+pxVNi9IB0d0jSTDxGRu/TLIydO2Q4lJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T/2eOuH5QCYOzoinKHiT/GQWdIeVf38zkWU5xBTf3KDBjnKPfklV1oUWcy30as3qf
 Pviqp0nqZrOuqtrbMPtFUUgucxqbKdgFAeG1qVlVT8dmkjDf3TVCajOZfhwqoSBKca
 9s7mID8UWsAf5Oc4BRkIiIrAu/PLyrYsmUxPWaXY=
Date: Mon, 11 May 2020 18:33:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Yongbo Zhang <giraffesnn123@gmail.com>, lgirdwood@gmail.com
Subject: Re: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Message-ID: <20200511173346.GK8216@sirena.org.uk>
References: <20200511100415.12502-1-giraffesnn123@gmail.com>
 <158921769452.22432.14661061075576126965.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline
In-Reply-To: <158921769452.22432.14661061075576126965.b4-ty@kernel.org>
X-Cookie: TANSTAAFL
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-renesas-soc@vger.kernel.org, Chen Li <licheng0822@thundersoft.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 06:21:43PM +0100, Mark Brown wrote:
> On Mon, 11 May 2020 18:04:15 +0800, Yongbo Zhang wrote:
> > SSI BUSIF buffer is possible to overflow or underflow, especially in a
> > hypervisor environment. If there is no interrupt support, it will event=
ually
> > lead to errors in pcm data.
> > This patch adds overflow and underflow interrupt support for SSI BUSIF =
buffer.

> Applied to
>=20
>    local tree spi/for-5.7

No, it wasn't - sorry for the noise here.

--mFHiwr52TKrxpkjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65jHkACgkQJNaLcl1U
h9CwNwf+N4JBwIeoNbEiscFu6yuAq4jAIXqttETDDdGngT++PzvYroU5VF0sbXwp
nzT1SgBu+h9Qe1AymyhkL0Gy5GIsH3ITIyLqx18fZYrFf07pAAQO6VxpECK55XhX
Bz0rIcm0XXRBpwQkv+3XvKM7UXGLim9Cz2JbPNcVwuaWPHhEhSjozzU0x2B9UTmB
YZM3aArzBAlepcS2IO/whPKgCNXxe67o+VK4ykGRW1bCVHvaNJUWfv1uRQgHgOaS
KyUXRpZbXdxScJLDJvKkygQEAhf3FXgz233+U2MKU0fpSTdPzDtbJre0Q+7G1lms
4grrqYsVI1Sniiq9cpf5CZ/UqtIYYg==
=PJ7/
-----END PGP SIGNATURE-----

--mFHiwr52TKrxpkjc--
