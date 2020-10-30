Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C72A0DC3
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 19:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490751658;
	Fri, 30 Oct 2020 19:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490751658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604083681;
	bh=XyrEe9Gcfh+0x4dtsnOlf3pZdGqIPBd2velt068peaI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHQMzFnP/fozzNrzPieVtC1rPHkaMEt1NJDJAt//MN53mWDvlDPxXPTYqplZ+VXSv
	 W21INhPxl45uDR1iONP2cuMMTJUUHtikL6IkAdVvtCVMoJjg5/e01O64YsZgMivGrw
	 hCmhOT5Fzgx/2KOxMV5jAlEG+U7LTotRprAAetsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C45DF801D5;
	Fri, 30 Oct 2020 19:46:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09A23F80212; Fri, 30 Oct 2020 19:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 102E5F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 19:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 102E5F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kjH8U21D"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF1AF206DD;
 Fri, 30 Oct 2020 18:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604083581;
 bh=XyrEe9Gcfh+0x4dtsnOlf3pZdGqIPBd2velt068peaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kjH8U21DIQtE2ViZ8Qu2Mfql194wpBkOU5B8oJZIOutyLpucYxxzBIDM/+s+T/qNW
 E1TQRViMUhDKcJzaUBoCq0M/csNLsTKG+klSKV9iyP3jjZRf+7hYpUWblIprmOeYgb
 mJj9QCCLi/dS8lbbmUh4Wa7zzVfXoouSbF48PG5I=
Date: Fri, 30 Oct 2020 18:46:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: qcom: MSM8996 depends on COMMON_CLK
Message-ID: <20201030184613.GK4405@sirena.org.uk>
References: <548bb7f8-672d-3d95-0d78-cef1c9837a42@infradead.org>
 <a55d71fd-d5b1-26f9-c3f0-7f2ff91bef07@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline
In-Reply-To: <a55d71fd-d5b1-26f9-c3f0-7f2ff91bef07@infradead.org>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>
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


--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 11:31:25AM -0700, Randy Dunlap wrote:

> Ping. I am still seeing this kconfig warning in linux-next 20201030.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cX3QACgkQJNaLcl1U
h9Bxgwf9EuOJbzQV1GpWxesW/kvtkASRPNpaKeiv1BMbxPRfx2Kb2FyVoOZU0+7d
PjeJEgQHzETyT3vHYz8AT34DZGSq/+PXygoScPiSqKkQiyIY2CeQFkoQbivA6gSl
Z8tCZCQ2voUq3trdSwxCVnxLUB45TePEQrdM7Y34azyqLRHQI7xJZkmLI7LFQQA9
04+czJ17zD4eGXQ6oSmyJxUoTZO85zB2+cw84rNykHJBTm8qBXS5ZZAsZ4d9SFGU
vOX7w9un6IZSWHgtlWfOkTn+p0FBFCowcIv1HT/EW451FFY1tmjXLCicd1R1QuUL
fE0mmHQlgvCViEy8Vaws8J8OjTDVhg==
=Z8YZ
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
