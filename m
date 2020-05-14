Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 429621D2D22
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 12:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76DF1665;
	Thu, 14 May 2020 12:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76DF1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589452994;
	bh=T1deYlNKgaSUOYMDqtBvvFo+ZYr0Xih+RVAt8W+OMEE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQeOK/uLUdfzAWHiIgWd1dURlU9l3raKNAokAqD2L7XVWfq2HEE5jfcJutLiEZQDK
	 xL3A37vUeefFAzTr+utCHBsKi63i1mwllXZkXfBd0oK+JydxSeOW/AfOSI1JpLjdiZ
	 wnIIV4VVITPeV0azutbe+Nwaf1zVSdoC7uG+8SnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00B5F8014C;
	Thu, 14 May 2020 12:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6995AF80158; Thu, 14 May 2020 12:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43912F800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 12:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43912F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cOKKC0PQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C295206A5;
 Thu, 14 May 2020 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589452878;
 bh=T1deYlNKgaSUOYMDqtBvvFo+ZYr0Xih+RVAt8W+OMEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOKKC0PQag4t3F4Q2W1P/PBrtE+WjImIE4vSkU5xtJFduOJLSr4r1ONEedLKoXAkt
 4bTZ1XToNnee7pbSA+DDgQA/R8fAbdtBiXfz7aqj43MVi8uRFhI5Oj7o2dZhh7zIaN
 x/315XEnXqKgfal/cT8LJQwWlmC0+xdBnvrGHs3g=
Date: Thu, 14 May 2020 11:41:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 01/21] ASoC: soc-pcm: replace
 snd_soc_runtime_activate()/deactivate() to macro
Message-ID: <20200514104115.GE5127@sirena.org.uk>
References: <87blmq9alx.wl-kuninori.morimoto.gx@renesas.com>
 <87a72a9ak3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline
In-Reply-To: <87a72a9ak3.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 05:37:32PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> snd_soc_runtime_activate()/deactivate() are implemented by global funtion
> which are just calling snd_soc_runtime_action().
> We can replace it to macro, and this patch do it.
> This patch is prepare for xxx_active cleanup.

It'd be better to use static inline functions rather than macros -
unlike the loop iterators there's no C syntax reason not to use an
inline and inline functions provide better type safety and namespacing.

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69IEoACgkQJNaLcl1U
h9D7rAf9EptYstKYlWhh4TGxVBOY/pqru94zOBlIuVH1/iS1k0IQSs2kmk6WGGa5
ZN4TGfIAj5BIYf9SXrWGlHtfBPbPk51c3xfpFUhiFYeDC37Yd+MTEGD+wUO89JSZ
QlnVqJakP09m7t0RrN+WBP0cC89/M9IWUt3mMdBhdGhHd43TL/wRFYv2hRzS0IGS
J/ZlvkeAbZx2EAfMey8Pbw8EcK9pDsWRp0Im3Gud+wv7UWboiGRG5SwKeCme/HET
lEAxyB/PExuZULRDxSasrRwddtIwyi6/J7Db1E7ti4q/+ZxDL5VoLaCE61ph7GXB
s9kEAPi8ecJmXwGQAJES/wn8PxEgHw==
=MDM5
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
