Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C531233F071
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 13:36:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4879318BA;
	Wed, 17 Mar 2021 13:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4879318BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615984565;
	bh=p/0eZuyW/IBDs7DbrwA7LKUEyQKZH6BVvh29JSrTriY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WL9YKevKmGVlOzUCDrKd0e9IfV/Or0T3Z+ge5+jSGWdqhLbqG4jdTQJ44rV/dwLPz
	 JmS+/KnefIT1Z1wdMYIk4It6RLRQrry2SqNdctrNTRqrJ83W/OEJk/29Dc1cfMttHP
	 ssPhHVoi1gkSkxKjvK8GF46BcJzZy5FG7SsZsieM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A44C6F801F7;
	Wed, 17 Mar 2021 13:34:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBED9F8021C; Wed, 17 Mar 2021 13:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68C60F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 13:34:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C60F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ofo1s0d3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C1F364F67;
 Wed, 17 Mar 2021 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615984455;
 bh=p/0eZuyW/IBDs7DbrwA7LKUEyQKZH6BVvh29JSrTriY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofo1s0d3wDRux0P1nXeH2DI/iD9dguSxzxSHCYKXoKOK9NHguGKh2Fe2exlnz2hJF
 P39FrQqJjr6K4LfuCmRAFU8VjNXyp0gBDR3xss9WIy7UkwtfACuAdRRigpWjJ6kpOd
 jqHtSrChwkWQTISjPk8RQvDoe3yPu8rl29K8YJr2EPh9+4EwVH6GqpIr8ZX3mmoPwA
 ZQjOjAAX4IQhAH0SDblT/vwF+z+OnNdnF0dYIPPLtw0PWu3x9Ix2yj/R0LImWGrbhf
 k9McLi3BSdHvc68p2Ss5YngoX5/riWsPIS0FmrSHQcqFmVcotv8JinLbOCOGw55f16
 r/X2WU77MFv5A==
Date: Wed, 17 Mar 2021 12:34:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] sound: soc: ti: Fix a typo in the file ams-delta.c
Message-ID: <20210317123411.GA5559@sirena.org.uk>
References: <20210317082042.3670745-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <20210317082042.3670745-1-unixbhaskar@gmail.com>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, peter.ujfalusi@gmail.com
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


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 01:50:42PM +0530, Bhaskar Chowdhury wrote:
>=20
> s/functonality/functionality/

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBR90MACgkQJNaLcl1U
h9Cywgf+NwSumzHQekGy/UWSLcJwy82l+4wk/bEPqjc2EluNmc8Atn/8al7+1/W5
QwTdjpepmA9HQZs8KJDlwvnoPNA4dG+WyaJFUYFe8Qg9pZYzn2KZnHfDNyoA5n1Y
AIitp08hz93kjp9An54ePgLFpkZTm7elBeQ2qWn8bPedCtJtplprV1jp/K5iqqlO
8vA0xAYZopQdZTSqG+CXAiG4wwmT/cRvZrfGXebz5JO1Yfsu9QTKZ6iQZzF9gI1O
K3wcVLRk4VtX/wI7m1vOfdL0Bcqz+lvF+6WWFVhH4bQjNJ1kRbo1w71ksrynVGbI
KUgLFmOK8m0WI+OJ/7Cmd09YYR9FqA==
=l/vX
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
