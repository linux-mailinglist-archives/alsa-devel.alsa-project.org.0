Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27363563C20
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 23:58:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84F6686E;
	Fri,  1 Jul 2022 23:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84F6686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656712718;
	bh=yXTRT9tzO60wn8/gIBmXfmphFtH4XAS8I5HrGSJt3a4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qaVcWMiCK4OwNNzNGsEOf2C5Lz0ppqHXMavLoi9+fS+G+0VBDFN3s8C0W16uNCj39
	 xC3djl/1r/EpvxvYgK4lK9g6x8Jid+vIAOY7IgmI75qlkGKnp6RyNWHu6zszqLFQwY
	 W7YXntQIan6JmhTB/vhNP1ajbQZ3NEnC1EN/Omrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB88FF80256;
	Fri,  1 Jul 2022 23:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 189C3F80155; Fri,  1 Jul 2022 23:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5506F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 23:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5506F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EYcd/OJn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72EC4B830D9;
 Fri,  1 Jul 2022 21:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701B6C3411E;
 Fri,  1 Jul 2022 21:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656712650;
 bh=yXTRT9tzO60wn8/gIBmXfmphFtH4XAS8I5HrGSJt3a4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EYcd/OJnv47UiSCVC/BLS7UxrG0iKII8DcVyW1YMqe2LGfxfH09d1iOk1BmN8Xhyz
 SZxEhyUuLWXF3gBVdHBJc+plVKOMcRJd/vcui4FSPsZuBpPlZUMOpU5UEzq9B/OY8y
 0ZOh4VNh3m20OXE8nigK4raAvVav6Z1coa3BTlpLpbGHoc6pOq+msFEIt7XsO8IaZf
 T5A2GGUjkPwseGQo6/TlPse6YMPPwkrhjcaR8M2rgnp7x8c3yPMUosF8nxfNQv9WWa
 3NUDuywEd6OaL+QfIGRyO5+qaP2iidTBH0tEIly1TdHmlvXcWKDD7hyhAQPFPTXuLY
 vtIUa/TdR+vhQ==
Date: Fri, 1 Jul 2022 22:57:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: fix fallthrough error
Message-ID: <Yr9txnScTv4rcSUm@sirena.org.uk>
References: <20220701155930.262278-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U2vGb+yzfZJZNnUw"
Content-Disposition: inline
In-Reply-To: <20220701155930.262278-1-trix@redhat.com>
X-Cookie: All models over 18 years of age.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, ndesaulniers@google.com, tiwai@suse.com,
 lgirdwood@gmail.com, nathan@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com
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


--U2vGb+yzfZJZNnUw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 01, 2022 at 11:59:30AM -0400, Tom Rix wrote:
> clang build fails with
> sound/soc/codecs/wsa883x.c:1207:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>                 default:

Thanks but I already applied a patch for this from Srinivas.

--U2vGb+yzfZJZNnUw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK/bcAACgkQJNaLcl1U
h9A9pwf8D3nT+3EkYz7kNqdr81RfrfTfL01RSpRwy2pnhvNZgTdvgo9NpDBwkC+i
jT8J29FfGwUfe5wgNmlj/27VkhFlgW8yPXYIxQq0KpU1J5rE+nFVbbN08JYxsePj
6mS5iTQ9cXbzL8cyVPbSHtZ+brG8dtdkmwzewsYroydUPsG0VwfGrPPTFTC9bFhx
8+y2wiXB5cPfQVX28WnvQ74L1vG4W6bqOwqb8DG/eJVJGTibJ8kPl24ADnq00Eau
CxUWJcR4TcCau3m4/R7u7hiNS1DpG6IrOhT7yvZvYxUr9qC78/lC07IMim9Oe46/
HsA1tcdgESTUGEIcPZfWyyMCzav0Kg==
=2iTT
-----END PGP SIGNATURE-----

--U2vGb+yzfZJZNnUw--
