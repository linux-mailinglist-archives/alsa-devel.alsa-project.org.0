Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAD5755CB
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 21:23:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234611899;
	Thu, 14 Jul 2022 21:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234611899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657826597;
	bh=ApKDCy2uQ2WkGx78PRaDpliR92Gh90kOwLI3/2Ax2OM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THgNA9NZqvdogyIstmYqubUe2jMEOmc9wNFsLwCm9efkR6sRlHrLBB16VoyYan2rM
	 nZujHIy3JveOT4Rkz9/aQ0kUXrJYqIH3jUsU6h5TtyWkqpgN/PiuUepvkVtNyClDD5
	 LYENNKML7Ye+r6LQ9plLv0xGvFhC8MOjOXHSWD8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF9CF800B0;
	Thu, 14 Jul 2022 21:22:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13024F80165; Thu, 14 Jul 2022 21:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2628F8014E
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 21:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2628F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bes/uGKH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3DD48CE28E7;
 Thu, 14 Jul 2022 19:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0780C34114;
 Thu, 14 Jul 2022 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657826523;
 bh=ApKDCy2uQ2WkGx78PRaDpliR92Gh90kOwLI3/2Ax2OM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bes/uGKHSNJcXqy1rQGpdlk/nG6DzhjUZiOK4OGlYbsc6zSbCkN9iDQBMZ0IAt5kw
 KSN7C0HHkvDgi8j2uvFW5JjQ6fUVltodUjGRe91jkR7RnHcO6rQMwB4VU1+V7xMR1A
 EFuTLJahi9sSJN7c/VdtgYTPJmv6wQQDp33z5wOK8aLe4GlVys+lKawQIv1ZR8PvtZ
 u17rCzYbzfBvnnb9AribORHRh4UG/Cu04He8po5ZwctqVrMwEdDcEt/LVVVZHyB/8H
 jdYyRqKdf0bnlq2NG6aTO6xVQ7LEscxhvJQKBx7cXSxwiYCcXNxyqotj71WcnJSf9Y
 Azxb37LPbf0Wg==
Date: Thu, 14 Jul 2022 20:21:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 4/4] ASoC: codecs: show PING status on resume failures
Message-ID: <YtBs1jwgop756z6T@sirena.org.uk>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
 <20220714011043.46059-5-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UsiKUEcK7+JgvMri"
Content-Disposition: inline
In-Reply-To: <20220714011043.46059-5-yung-chuan.liao@linux.intel.com>
X-Cookie: The devil finds work for idle glands.
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
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


--UsiKUEcK7+JgvMri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 09:10:43AM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> This helper should help identify cases where devices fall off the bus
> and don't resync.

Acked-by: Mark Brown <broonie@kernel.org>

If this is applied to the Soundwire tree it might be good to get a pull
request in case of conflicts, though I guess they are relatively
unlikely here.

--UsiKUEcK7+JgvMri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLQbNUACgkQJNaLcl1U
h9BSSwf/XJSrK1HOq2K7KapWhyPic1n5KsMoLhPDDcKtScol/q1KVSACfzp+05XC
arAh5he+7Fp+gNlpSMBizJCl3D/7A/Kh3hGp3xapNWioLqOl3G3sYusgyG7qpIlY
Czz3j8BJume7aDcMKhTMFuzLwIztRjak9g43SB6ouBEMqMeeMPYtHz6Co1PA/v9y
Cy82P8zcnh7KjXAmE3Fg5/LLiYeZxJQ+s4iYNezfZbqSUAzRMXEX+4UQ3C0nI1bZ
8KC/fqQiFqvklMuubBFEE1UezhVEzoZx44J2hWgKKeinZ1Ax7GjKFFVlGCrwDmvn
JTbHjdbra2SwFMzD4yb2DBA5piMDJg==
=2j9p
-----END PGP SIGNATURE-----

--UsiKUEcK7+JgvMri--
