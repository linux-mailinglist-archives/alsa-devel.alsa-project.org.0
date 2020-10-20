Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72174293F86
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 17:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E842A16DD;
	Tue, 20 Oct 2020 17:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E842A16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603207517;
	bh=O0otWF5hQOpQgAyZOOSz2D2YTrqqjcz/Uss8q1ZITTw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MWiLXSW34Bayb6jfV0jKGHkLcKVkwARGSX6J/UeqK77kpNj7Zv9LNEZpMPTDMoGdK
	 T1DJ2QVoW2MvTufwf/C98t6DkXCLQgrHKewSkT5Ah+w9JgBkDWX5sYtUIdivHMEN0O
	 j8PvRCbZvRJ8QINWwqQQJD/SEDfxiP1CRfsGtBRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AF1CF8010F;
	Tue, 20 Oct 2020 17:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF185F801F2; Tue, 20 Oct 2020 17:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C728F800AD
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 17:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C728F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dsMKyHfi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F2DD21D6C;
 Tue, 20 Oct 2020 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603207407;
 bh=O0otWF5hQOpQgAyZOOSz2D2YTrqqjcz/Uss8q1ZITTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsMKyHfirIAjnHn1Zw3AbOdD6wIHu0Mi+qaG1spiZE+OygjSPNIdhKVxiqG0ic6Ba
 N4fvKHoS+gxv0HvnjUOJO00j5lFqVjiwYlyTR4zYiesZbZeHUk0+tlNSdDtrNislSw
 +m29i4UkwfjH86BCw7jLXhryfBSOmURCHMfbcHX0=
Date: Tue, 20 Oct 2020 16:23:17 +0100
From: Mark Brown <broonie@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] sound: remove unneeded break
Message-ID: <20201020152317.GD9448@sirena.org.uk>
References: <20201019164857.27223-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline
In-Reply-To: <20201019164857.27223-1-trix@redhat.com>
X-Cookie: The people rule.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Julia.Lawall@inria.fr,
 cezary.rojewski@intel.com, romain.perier@gmail.com,
 kuninori.morimoto.gx@renesas.com, arnd@arndb.de, baolin.wang@linaro.org,
 naoki.hayama@lineo.co.jp, linux-kernel@vger.kernel.org, tiwai@suse.com,
 yang.jie@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@ti.com,
 srinivas.kandagatla@linaro.org, ranjani.sridharan@linux.intel.com,
 allen.lkml@gmail.com
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


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 09:48:57AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>=20
> A break is not needed if it is preceded by a return, goto
> or break

Acked-by: Mark Brown <broonie@kernel.org>

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+PAOQACgkQJNaLcl1U
h9B6Wwf/WM7+AuONwToF6d5Lw39VWaxRZFC6SH0PW6rtzOUx6rKbQ5eopaTnxA6k
3vpWBmaSVcFfbu0TgoCSgQsbmPORfgesMUCmcniRPBZ3NTUzV9lM1yLs4qo5k1lq
laGIooCjfxEikOsm9QTftZXQCSYlAvqNnFx9tFv7h19wyDn9uzNEiuwZ1thBAhvO
t7U1WGr2cwFLy3kSjWPDD2y82cX+ng+yo/MzWJv68oJ2lFdpV2Gn7iRIJ/koikU8
AS3lrZKlOLufUnir4ex5FFhGCrGKcarEipopKDOdZ5sPaiyBNoAn2FJ2+RvDhPof
oSw9xG5WP2q+6Vl7GC0PqNgmGMrFQQ==
=YldY
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
