Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDE46BC2F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 14:10:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176782446;
	Tue,  7 Dec 2021 14:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176782446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638882608;
	bh=F/fKPrZyU0Us2AwQLVOm7PVNFqhIL/DCq08fX5U079g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFr1vWnhuxDksKKvCXRBAE325bXwlt+KimVYyd+sIL8T38uhSh6+jeXRBgFqkxdWF
	 kJofW6Xd+k3xTw4lIenW+RrrAaMW0VnvcmGHUyLQRMSiF4LeHugYF+C4zyM5FO6gHQ
	 5w8IwXmjzZsw4mq/0fAW0Jcn1NtD0hUn7P7a4JMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BB7F80259;
	Tue,  7 Dec 2021 14:08:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2086F8028D; Tue,  7 Dec 2021 14:08:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8D85F80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 14:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D85F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mgyETY26"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E18D4B817A2;
 Tue,  7 Dec 2021 13:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F560C341C3;
 Tue,  7 Dec 2021 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638882519;
 bh=F/fKPrZyU0Us2AwQLVOm7PVNFqhIL/DCq08fX5U079g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgyETY26JMkK2rPd3KETqwzJtFKtha6lCdv/3XD+UUxn68MNPLNW0eSTdwqsYLWsm
 Ht/YdrHOq18UH3RrM5jpknDUONfXqE+sADTEnxBZBwU27dfWo5tU9nfFEKc8tL4He1
 exEXNWYB2/W00ospNAsc73LGuQIBdlFiije08TCQfgOFgUtsBWCb9dd6xjpCbHUGcv
 uI54WfuWEncPP49g1baY2ot0KQ+o+VKLOpJN1hWWrZtxXQ+LOuAj5tq334PdgtYEpf
 TLNGFK1ML6Yaftdp1pxbb4OyjmWlwl9ZqiKtu9O3JfqaIBnRPGlHhQKqIKJUZybZI9
 IkF3S1nm+K7CQ==
Date: Tue, 7 Dec 2021 13:08:33 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH] ASoC: soc-core: add the driver component name to the
 component struc
Message-ID: <Ya9c0d/X0z1QUVN6@sirena.org.uk>
References: <20211206095920.40552-1-kory.maincent@bootlin.com>
 <Ya5lplIoyhKsqFmZ@sirena.org.uk>
 <20211207094732.3be5befb@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5MYbYLXEWzFbrHqI"
Content-Disposition: inline
In-Reply-To: <20211207094732.3be5befb@kmaincent-XPS-13-7390>
X-Cookie: Only God can make random selections.
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
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


--5MYbYLXEWzFbrHqI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 09:47:32AM +0100, K=F6ry Maincent wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Why is one device registering multiple components in the first place?

> Because the sound components are more and more complex. Why they shouldn'=
t?

In what way are they more complex? =20

> It seems to be already the case:
> sound/soc/codecs/cros_ec_codec.c
> sound/soc/fsl/fsl_easrc.c
> sound/soc/mediatek/mt*/mt*-afe-pcm.c
> sound/soc/sunxi/sun4i-codec.c
> sound/soc/soc-utils.c

Quite a few (I think all?) of these are quite old and and are the result
of refactoring from pre-component code rather than modern drivers, it's
likely there is no concrete reason for them to behave as they do.

--5MYbYLXEWzFbrHqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGvXNAACgkQJNaLcl1U
h9D1vwf/WQeUnLt47+xN/hYRPXv4uwS7J4Sxig4UAKgRuuEvgicbcorrZGgO0ag9
fxRHkkGPKGBySIntd+S5lAjVY3WPDNa474hMJgI2rfqshgRCAQ77GG85QbW/XZ85
foGcx5vkTDGi/NW6unO2sFWkBjtYIkzdlJpPYZMOJeRlsFqeOyrGmnAsQKQQ4uzQ
i8VKky9LpEmMmbW+POVuV0jQ1Uvz3Zkk5MTwTDDauMsdCT+FzpWQu+oWjRqhePG2
RPfhWbGYhiDJmUIz07Mk+jVfUM7N6in1CNgZO7HmxfZnObR5QDfiM7mRkILkyQ5J
sO8bZoaOotmrfE13OkQQPxMonOJAww==
=arkY
-----END PGP SIGNATURE-----

--5MYbYLXEWzFbrHqI--
