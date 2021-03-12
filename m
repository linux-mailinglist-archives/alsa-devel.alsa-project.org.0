Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3FC338FF3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 15:25:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5190B173C;
	Fri, 12 Mar 2021 15:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5190B173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615559154;
	bh=4fcxO7Smoa0cv+E1nslqtIlJSCuMHvSdEw8b0mNB4U0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2WO3yKVnoheF1gNayYOYHjQsQ5CPGRmVyAkD7CjL6yW1XMKO4T3UoG7plsprlpuY
	 WGCoVZU3QJz3epZGWV4b3FQjmHS3ikm0OpkleeKI6YbZj/Cnczg40/JLpCOC9r/D6A
	 lVJcqwIna9iwNJeAN2c52W1qGwau3JyyJAP2oJlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A71C5F801ED;
	Fri, 12 Mar 2021 15:24:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA126F801D8; Fri, 12 Mar 2021 15:24:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAF85F800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 15:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF85F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tO/PBxqf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3042964FAD;
 Fri, 12 Mar 2021 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615559053;
 bh=4fcxO7Smoa0cv+E1nslqtIlJSCuMHvSdEw8b0mNB4U0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tO/PBxqflYey1RZMejEfbXJSNJjstUTyAxuftBDTRRX3JQXMVyk2pIehKsK0zfqKY
 OaeLkntuazPfukF2+hQbv2uA6vPj5imVNwLt6XsQIsTkOP1nGN6cTqAmyIivvBjzHo
 JCm0IJIJAdVTV1FypyOyTGOZKI+yOr0mvw2VWO/IO8GzV/WIud7Lcr4/6iWmpIz5vY
 Zak5js87cfi/bL3jZRII1dDN7FPBqardF1tuwn1c/ONj7mpZkwam4M7FVvLN+YigdP
 HdJ276wpNszh0vxzKhA1yey7kPI8yzjB6CKdV/O5wftcq/pOpPAKIGoMsPFZt/q87R
 u34VCvu33P3hQ==
Date: Fri, 12 Mar 2021 14:23:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
Message-ID: <20210312142300.GG5348@sirena.org.uk>
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
 <20210309153455.GB4878@sirena.org.uk>
 <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
 <20210312104931.GA5348@sirena.org.uk>
 <CAEnQRZDe_Q-N7L_7z7aVz1o3guKd6R+WFrOfT9KPbggJP8SPZw@mail.gmail.com>
 <20210312115748.GC5348@sirena.org.uk>
 <CAEnQRZAAU34YS778WJVD6uubSwQxjA-5LTG9g0CvSdSZOuO+tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline
In-Reply-To: <CAEnQRZAAU34YS778WJVD6uubSwQxjA-5LTG9g0CvSdSZOuO+tQ@mail.gmail.com>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 02:37:30PM +0200, Daniel Baluta wrote:
> On Fri, Mar 12, 2021 at 1:59 PM Mark Brown <broonie@kernel.org> wrote:

> > No, just the opposite!  If there's an explict name configured why do you
> > want to ignore it?

> Because the initial assignment:

> dai_link->platforms->name =3D component->name;

> doesn't take into consideration that dai_link->platform->of_node is
> also explicitly configured.

But why should we take that into consideration here?

> dai->link->platforms->of_node
> configured and we hit this error:
>=20
> soc_dai_link_sanity_check:
> /*
>  * Platform may be specified by either name or OF node, but it
>  * can be left unspecified, then no components will be inserted
>  * in the rtdcom list
>  */
> if (!!platform->name =3D=3D !!platform->of_node) {
>     dev_err(card->dev,
>     "ASoC: Neither/both platform name/of_node are set for %s\n", link->na=
me);
>     return -EINVAL;
> }

OK, but then does this check actually make sense?  The code has been
that way since the initial DT introduction since we disallow matching by
both name and OF node in order to avoid confusion when building the card
so I think it does but it's only with this mail that I get the
information to figure out that this is something we actually check for
then go find the reason why we check.

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLeUMACgkQJNaLcl1U
h9CxEwf9GYlTDgLnBKPQQLdh53qJmZp0mq31jrvlr0BU1jZT1bUP/jkJAufFi4fz
2YIwTI8K79Pj/AoMoQXJ1L2XOedZ7/AspZFanBhgUovzs+f36XfW00fum5QmG+A0
W7wLEhoJuoUxGOOJ0Z4EYRT07LFfvN23lYoNxKBb0gqO4FxnJEAe1E5+O9n39zTO
yCdwDl0H5JhLp8U8SuutChBnt87l474a04Tx5GdCRZ3yAvwuvvNLZ74/68We+82F
NlPAf+g2d4ojF1UqCYtgR59jPLpTmJmDtMfcgBqtskFMeCtqrM7B3Jqz8O1b8Ix9
/Pvscq3dBWICZSt7Qj9Ilh1IScjMdg==
=CF3l
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
