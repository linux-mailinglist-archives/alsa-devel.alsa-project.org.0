Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1A3BA2EF
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 17:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D598169A;
	Fri,  2 Jul 2021 17:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D598169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625241026;
	bh=UtUkyzEgQCLwYva8gHKqGdedOzqJQOJUIHzPi+qF8PE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5kC0Pz/tnceWCjtBqugfiCNUsZJDMzmLuCFyAQE0YUM6ycQgPrYmmooymoV6Z6X2
	 dau7oVScGhn5Hs5l3rQYt8AQYtYl2v6Lav8TVVMgftyGeZkpkZYWves15Hurzq9YAK
	 i27A8WIq8VZk4K4VRfQPJIEUvvF7n/uITjefnY80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6A52F80240;
	Fri,  2 Jul 2021 17:48:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 596E9F800BA; Fri,  2 Jul 2021 17:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7279F800BA
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 17:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7279F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hwpdE2/p"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3554E60E0B;
 Fri,  2 Jul 2021 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625240929;
 bh=UtUkyzEgQCLwYva8gHKqGdedOzqJQOJUIHzPi+qF8PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hwpdE2/pdPQAqzMKilpavFJAzQrISunuI2/krgwWy059JgNFmsjX9tvwVr2wh8lQ0
 GXuhcHERqMTEVONfTrpixnH9vXUTgGl+dSuYR5f9YnbbK9m7ryUQuFb6oGsNpUB6qk
 rNLnAJTfwYVnLDJF0sbeLymd8bO27djVVrKmTTTR1mNJHf7OqNsQB6on5nMv6bVBJp
 wdbMgPRqqrwepH0+DaSguOWg8kuKNfIP03dMb4fK36EOMUMfsEpKwDn3cy0Nf7OmnQ
 rsPmmE6rY50hIMmMAurJU4ABp58IKV0/XJFY1JLj2pSV+miVEmrcpm6DSTux0bx0Ua
 UuTUwt7Wxukaw==
Date: Fri, 2 Jul 2021 16:48:20 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210702154820.GC4416@sirena.org.uk>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
 <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
 <20210702120810.GA4416@sirena.org.uk>
 <2a795a56-0b3d-069b-b31d-b8cee0b89f4f@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline
In-Reply-To: <2a795a56-0b3d-069b-b31d-b8cee0b89f4f@opensource.cirrus.com>
X-Cookie: What!?  Me worry?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 david.rhodes@cirrus.com
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


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 02, 2021 at 10:23:52AM -0500, David Rhodes wrote:

> So I don't think I have an actual issue, but I am just shutting up the
> static analyzers, although I do think I fixed what they were telling me.

In that case you should get the static analyzers fixed, they clearly
have a false positives problem here in what is a relatively common
pattern.

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDfNUMACgkQJNaLcl1U
h9ArSwf+KFH4rYkv5v/DxlLdb/8bEG52XlrTA2i7MNT4snOOcaovSx/bWwWpCom4
DGbNCW//PpzBu1l6Uf2GZOS45VvxFJOUWR3HMHcCeTlMOSdCtIdQXU9RaK9LYPIT
CskGkApFcpf50RxowuQWPdj0J2dDBr3JKb3fpVNX5NL5jLwEYjo+bN2n4+S6+wJS
0h2ftbixO50F5kwcRUCqKIiEjFvSRPC2XKbzwjJQhu97WaeDsSdgyDR7afUBl2OM
gQgSNAtFfIRZFC45pqisVQA+vFjMTjKp/XQ9Yzy5A0bFo6f5C8QIB23MTqJKcyAJ
Os6ctaMoo3HbDRaLhoyomyG9UJkOMg==
=VnCu
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--
