Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F815A8EF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 13:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F67F167B;
	Wed, 12 Feb 2020 13:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F67F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581509842;
	bh=n4Zc3V4VF5MlCQmCibINmG0ZUg145pEQa9vvxvH3TP0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eq8SQtjGHFke1WRwh7LYExEwj205iCPLtUUww0D/yQBdAWOmw4tADbRiiRFOfu4HQ
	 qWun/ADvA6XplFd9DX3Yne99Ge02A+ovVDIq1m5bqGboZ5wKkHBm1NU+0CX/h+Vn13
	 5q6nPXKU9EYCst8Jqrte4jmeOIdYsjmXf1VcHT3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F11F80158;
	Wed, 12 Feb 2020 13:15:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3B97F80157; Wed, 12 Feb 2020 13:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 83299F80125
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 13:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83299F80125
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE0C30E;
 Wed, 12 Feb 2020 04:15:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF2993F6CF;
 Wed, 12 Feb 2020 04:15:33 -0800 (PST)
Date: Wed, 12 Feb 2020 12:15:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <20200212121532.GG4028@sirena.org.uk>
References: <20200127091806.11403-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200127091806.11403-1-dafna.hirschfeld@collabora.com>
X-Cookie: Violence is molding.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bleung@chromium.org, dafna3@gmail.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 enric.balletbo@collabora.com, helen.koike@collabora.com, robh+dt@kernel.org,
 groeck@chromium.org, kernel@collabora.com, ezequiel@collabora.com,
 cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH] dt-bindings: Convert the binding file
 google, cros-ec-codec.txt to yaml format.
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
Content-Type: multipart/mixed; boundary="===============3371804308503958231=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3371804308503958231==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Content-Disposition: inline


--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 27, 2020 at 10:18:06AM +0100, Dafna Hirschfeld wrote:
> This was tested and verified with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5D7GMACgkQJNaLcl1U
h9D4SAf6AjL0TX0sVgucqWJPIx7KXl9BR5SqhCtnhvVTCrO9gBGH1rDgqrceW9mr
rNnvjv/icmNV+WzKIK3YT5VCuA4zI0JfH2qKTSNIkmdwm1bWcKhN8kCHtRidRdUE
zBn1wZFT98tB9kgZy9tE/LWgy4olgLrOlMJLHJwGwLL7dSnmSpOrmmeRD10y6Sz1
9RFMa5kkyP9+dvtw9mbVlQu0gFIN2frqZQvItoEAKhhbplyvAkLhtSc1MPwcZxGS
8nKtAXcFuS0hF4di6QYp0luIzzA+c97yD/ZFWBQ0jlRs2MW97ULQSGwnbxeKczk4
tGO4KAFmg1JSGYaQ7ziiVc9xJau0LQ==
=qBkG
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--

--===============3371804308503958231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3371804308503958231==--
