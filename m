Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C3162EF9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 19:50:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B251696;
	Tue, 18 Feb 2020 19:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B251696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582051823;
	bh=BldLJUMeLfjzF7LWWWVI8kglnk/rWLvFMyWyQafRjYs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOCjn3d96y236WgVpjH0X6Kwc7rY1xbHHRwBTJJdvMqAkcmt8pEy32S3/KKt8O49D
	 vGfHmxamsJiUltGL0pEYRiiQFo+Zrb3zc5I4fWQp/bT+2sdashOmPv8Rsd3U/BpwyN
	 +RAtfAUj20EEevNH/MPU8/Qw2jfHg5+XKLvrihlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 798E8F8014A;
	Tue, 18 Feb 2020 19:48:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FFA6F80148; Tue, 18 Feb 2020 19:48:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B03BF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 19:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B03BF80135
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CC9731B;
 Tue, 18 Feb 2020 10:48:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3DC53F703;
 Tue, 18 Feb 2020 10:48:33 -0800 (PST)
Date: Tue, 18 Feb 2020 18:48:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tas2562: Return invalid for when bitwidth is invalid
Message-ID: <20200218184832.GL4232@sirena.org.uk>
References: <20200218174706.27309-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0qVF/w3MHQqLSynd"
Content-Disposition: inline
In-Reply-To: <20200218174706.27309-1-dmurphy@ti.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--0qVF/w3MHQqLSynd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 11:47:06AM -0600, Dan Murphy wrote:
> If the bitwidth passed in to the set_bitwidth function is not supported
> then return an error.
>=20
> Fixes: 29b74236bd57 ("ASoC: tas2562: Introduce the TAS2562 amplifier")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  scripts/conmakehash        | Bin 0 -> 13120 bytes
>  scripts/sortextable        | Bin 0 -> 18040 bytes
>  sound/soc/codecs/tas2562.c |   3 ++-
>  3 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/conmakehash
>  create mode 100755 scripts/sortextable
>=20
> diff --git a/scripts/conmakehash b/scripts/conmakehash
> new file mode 100755
> index 0000000000000000000000000000000000000000..17eec37019b8ae45f42f3c820=
46d1a55a6f69cb3
> GIT binary patch
> literal 13120
> zcmeHOeQ;D&mcN}25CU`u1i`Q23C#=3Dv(j@XB0Wx-n4!le?@~!SFHl6fK(rc$X+x=3DRD

This is...  fun?  I'm guessing it's not intentional, it's certainly a
little difficult to review.  :)

--0qVF/w3MHQqLSynd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5MMX8ACgkQJNaLcl1U
h9AE1Qf/Zp6m3NI0e0rXFXTJ2XbGhyY0eb9a56oQ6NAH8Cxv75wmSpRtYY56PGpK
XgBcQN67E9zoR9G+t8WS3t60tOmLAOyAVVDNQ4llIzUsl5oq0zcN5QZhG0GeDPwF
gfKhGhyKgyZ7cNY0IJETfg9kgF+zvUq49Dh9APTHkBr4OMd0XDJxuBSc2+oCFeAb
ozO7V5pje1NZe3zcwJY7ZvrjJ+MXnwevO+V9r+1QpFXS6als6G+JC3nChaDBHT7P
3rQJVO1Wtbl9m9cN2zUj18Zbg5dYjGQLr2ak91NLBjeawlzVSCQucidm0rAaGL4H
BrBsxv18mqZb8bouvke9jMA+15ovmw==
=piVj
-----END PGP SIGNATURE-----

--0qVF/w3MHQqLSynd--
