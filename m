Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7A467D04
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 19:12:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF3F81F1A;
	Fri,  3 Dec 2021 19:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF3F81F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638555155;
	bh=igFrEeJpF2OZf9Jo/80sQz+WH1Z+Faa3wH+gun1zpGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mzyn9/58xvmYmRYfTFw4TeAs9yiGVQNh56dpPLke5trk4N09Yf42eGJEdf71VqBWx
	 9LP2ElJS1jS3PNFm8nW4yUpSMvV0an8e3RrKXc6Xa95aGGlshHsI9P1h4caXOmkLeS
	 J3zgkzc3yt6Vz3SzQKRz41BjdxOoXApS5natAyeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C76F800A7;
	Fri,  3 Dec 2021 19:11:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3239EF80246; Fri,  3 Dec 2021 19:11:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF867F800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 19:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF867F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qw4NTfMG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E780B62C73;
 Fri,  3 Dec 2021 18:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB94CC53FAD;
 Fri,  3 Dec 2021 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638555067;
 bh=igFrEeJpF2OZf9Jo/80sQz+WH1Z+Faa3wH+gun1zpGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qw4NTfMGNzvYUWRtyWUWBWIFfJbMRl1w+tXmritIu3cq5/GhmZFF7C1Ek7BeaO+7o
 sg2mlee98y5i72D4684ISJFsfqeJWZl45+7nNvmNYrAZaP1x2k81A9hFFeCFZp8hrE
 Wt1vOsMs0G7Op+LNIER1akRdDpHd5Qa/r4czfcErcJd4wRPAoDtT7rlGSC7d2rr0+y
 2d7cuZ9RKtiYbabKfVn30ibthkO8FYNKb/ufKjAjZD9GkYBcU81qdm7VI1YeQDi33z
 cWodv7KJTcjNzWt6aXf3pwNDX2YXSGH70wE6gGJYg8xp4O22l6x2uoRTawksDCK61a
 PLAuMJN8v+GXg==
Date: Fri, 3 Dec 2021 18:11:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Message-ID: <YapdtAAbrhJ8kW0M@sirena.org.uk>
References: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lh3+hiHCqE5cETDw"
Content-Disposition: inline
In-Reply-To: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
X-Cookie: Don't get mad, get interest.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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


--lh3+hiHCqE5cETDw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 02:50:17PM -0300, Ariel D'Alessandro wrote:
> This is a follow up of patchsets:
>=20
>   [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
>   [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--lh3+hiHCqE5cETDw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGqXbMACgkQJNaLcl1U
h9D2Cgf/R5khnlu5BvBDSME0pvpG+4+PjCkPFKi3+kdhK7Onjmyln1gLD2p/pjDl
C2EP3YXQcgiUywBXBrCblKFmsu2XQjqlCco9TcYbnmBzcmtROfr+m3vGVgsVFAtY
3R0EhJtfcHTVzhtgQokgsTNeUITGdjPFmU/VozNqdDUObyBP2VLr/l4eLtDcEWF8
RteHve4FrIcJxTQjYNMpAsIBB5ztm2l+IuFI1kAnIcfG3iDgDNaNHeENbhgKIjiU
LES7XBsQbDmO7S8svN213VOLmfUowwAL5I6mnJBZlkTPATA7zMkZnvMk8L59nnsS
rgual2IJtpkc4Viaq4BYba1kKrcWXA==
=gP64
-----END PGP SIGNATURE-----

--lh3+hiHCqE5cETDw--
