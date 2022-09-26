Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D15EB45F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 00:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83B3822;
	Tue, 27 Sep 2022 00:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83B3822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664230447;
	bh=2Qt3W8FkIMIE55ctoj3YAHUay0CBFTZXAHMd7mn4hp8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qlc2aHBx+Nw0u1o+V/vpsJVRBoUbjmv5Yny4do+9MFUnoa1Z1WzIdWZF01Qp3gQyx
	 XIztZcaX5GWWn1Rml5ZZZHc2I9QyVALLOW+BIhMjjNb+Vq9NNaI2wqQCI3uQW+88rP
	 QDxRf9WJTBcZfmnhQi1nhIVlVijjWS6X1ciCQo5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65434F80134;
	Tue, 27 Sep 2022 00:13:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4141F8027D; Tue, 27 Sep 2022 00:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4A38F80134
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A38F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uSbK6VxM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3510CB80DFA;
 Mon, 26 Sep 2022 22:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6D0C433D6;
 Mon, 26 Sep 2022 22:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664230382;
 bh=2Qt3W8FkIMIE55ctoj3YAHUay0CBFTZXAHMd7mn4hp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uSbK6VxMdhw8e8KNUVvQk9DkPang+WcxCaiI8iR6i0u49/s7tfeSlA1U3qzG3PP7E
 0hLSTj7XSuBf+iaaSaVTCQnf/b8SWpXqgygr7nPZ1N0ZYsuyn5yozA0OaQ0owDr4U2
 14DUv7Cwf7I12Z49AD/pWdzVKIaa4aDGRC9lnEfIGlPhAGsnOpqAdpdDBrRn0Zatl6
 P8tbfFj01gpS7UaWt/nHhBio+KU3IwCbfigYZMlUw7B/T2VVO8ehrhwEjnfhdANoi5
 o6cSjiEIgIntgdVhhDQs5AWedaOX4MtFDDHxHcMs4D6TcyuW3DlVxZWyv2AZKPTIop
 Y8jWhLS7QmvAg==
Date: Mon, 26 Sep 2022 23:12:58 +0100
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Message-ID: <YzIj6tdtDe9YrX+I@sirena.org.uk>
References: <YzIcZ11k8RiQtS2T@work>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="34yM7OTcCN4YfrhM"
Content-Disposition: inline
In-Reply-To: <YzIcZ11k8RiQtS2T@work>
X-Cookie: You may be recognized soon.  Hide.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-hardening@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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


--34yM7OTcCN4YfrhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 04:40:55PM -0500, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
>=20
> This helper allows for flexible-array members in unions.

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--34yM7OTcCN4YfrhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMyI+kACgkQJNaLcl1U
h9Bl2Af/eq17arOKqHYbB+7ToUShw/rDWN00EYpGJ1L4MTJ0Hrt4JHoK/KoB0pVo
D4zPrWxnFc/aIvlHvf5zkwHqQvhNMsL+FfB++tS8oLWXdskaSwdZAJOHqU2t5sfb
6whvYoNoYUD/5acGyMfX2RLCQbIxIAz8q6J7bJY+QfqbXVUHxMHbNSKJ5rkHJTnN
Bsx1DpzXc10p1PwhVhepbCuJXl+shGRXw6WgjyubQtHjmSWNACm9QF+Hm7w3z3DB
2dIWI7LQ6x63u+i5vxsInZczO1qWLQmqWHlse4UKKekRIDrfBCVJdS0NEqT48Zpn
f6yov8ZJ3+TQx64+wsjISFZriatSQw==
=fi4G
-----END PGP SIGNATURE-----

--34yM7OTcCN4YfrhM--
