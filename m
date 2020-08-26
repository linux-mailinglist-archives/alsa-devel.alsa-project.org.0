Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3043253652
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6611B178E;
	Wed, 26 Aug 2020 20:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6611B178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598465581;
	bh=tMMH1hSOSsX0KfQoMl82Sr7UYsFqwj7FFxrg/AFQtMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4yrpCzxU/dpkYw5DR0L8eHLhCl0dz8DqlTyGLN0Wa6OpM9QaAENhuCBOht+9wRdh
	 fkAwZCzhk/zkl9ydMW6GCGIiCPHEL3QHD8CI545yvjluD3K2BW4prDPitW1bSUfwYJ
	 rrZHGjRWTDFDWzda9gRorTgFilRdwTIj+9Gu7CTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94B00F80105;
	Wed, 26 Aug 2020 20:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37865F801D9; Wed, 26 Aug 2020 20:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96B4BF80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B4BF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OFdyV4w8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D56A72080C;
 Wed, 26 Aug 2020 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598465473;
 bh=tMMH1hSOSsX0KfQoMl82Sr7UYsFqwj7FFxrg/AFQtMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFdyV4w8NL6ZLJ+wVAbt+K5rzPXBebRU5gj/78Lkp+1uptUtx0FxXKXwKto2zyFJD
 9i9dXzwsg/EnPgxofUQzTv73l080f4ESFBtxqNLmpJXbdrClKsacmtwwFdinnhygkt
 IIfShzTh9biFMODnW/qALIvNijUs08FxtP/rUhd4=
Date: Wed, 26 Aug 2020 19:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: move snd_soc_dai_link_set_capabilities()
 to soc-core.c
Message-ID: <20200826181036.GN4965@sirena.org.uk>
References: <87tux0fujp.wl-kuninori.morimoto.gx@renesas.com>
 <875z97y448.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5FetH82qe0Z6y/zI"
Content-Disposition: inline
In-Reply-To: <875z97y448.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--5FetH82qe0Z6y/zI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 09:15:51AM +0900, Kuninori Morimoto wrote:
>=20

> This is for mark/for-5.9, but I noticed that
> your for-5.9 branch doesn't have this commit

> 	4f8721542f7b75954bfad98c51aa59d683d35b50
> 	("ASoC: core: use less strict tests for dailink capabilities")

> But, linus/master (=3D v5.9-rc2) has it.
> And I noticed that your for-5.10 branch has it.

> Which branch should I use for linus/master (=3D v5.9-rcX) ?

It doesn't apply on my for-5.9 branch which has v5.9-rc2 merged into it
(which was needed anyway) either so could you please rebase against
current for-5.9?

--5FetH82qe0Z6y/zI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9GpZsACgkQJNaLcl1U
h9Bt8gf5Ab7GEOOYekPRJVpRMxXSpJmWUb9mMkulnsWR6lWlPsai//C0mIv2kKtJ
uIHx2G6xMhsH7moc94mpmjOX24D0p7Il7o84FKYIbqGRsJP2qYrAgsKFFWe9Lcju
Way1kZ0R2pLB25n0ZdccvXgIZFlcf5r1aYt87tj2KKEo3OVxsvDJTRBd8lGbPvSy
XmHnrFuh/prWnwvGSLP1N75yJwJ4ynDzUuZOI9Qs7FLV7VKh7cP69wHxyVD8M+DM
ObB6yH+38M4a5q8qpn+Mkiqq45/cJvElq+Kl2kSQcTpTsxrco/sNrWjHO+wbZ56P
a6/f6XY+wLIbdUkOHfy34Mx548v0Mw==
=K1P9
-----END PGP SIGNATURE-----

--5FetH82qe0Z6y/zI--
