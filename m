Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44D067C566
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32350E85;
	Thu, 26 Jan 2023 09:01:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32350E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720154;
	bh=BSf4VdDu/Cipkbp8RNs0rNyAzPjqHzof5Fj9ZYA48xM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VapuciGNG+/XpgQhiAyZzDOOsGSZ+Vmo7Qx9FclBd6aIdIwKty0RsZEgaxYOYY7vE
	 9PwEVdOWE5bkIgc2V2im3GgvRspXhy+n4XisnL+N/nBpR47mStS/leNNf4CxLJ9grd
	 JDIO3InRTtS2KHtreKCFKYILst6tp4MjHDE3CLFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C81DEF805EE;
	Thu, 26 Jan 2023 08:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 709F2F80424; Wed, 25 Jan 2023 12:41:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF16F80163
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 12:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF16F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GfilqO/e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5C7B614C7;
 Wed, 25 Jan 2023 11:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E044DC433D2;
 Wed, 25 Jan 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674646887;
 bh=BSf4VdDu/Cipkbp8RNs0rNyAzPjqHzof5Fj9ZYA48xM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfilqO/eKu/QoPePHTTuTn8J1r0Gfr8WyYnJTWSK83NPY89Lt3LaqRMiaWnnxEdz1
 5GfmqGH8yJFKJlrPMbcp84JgDUzRLc2uldIX4k89jTMcPIFXHFbL6PPgMyEPoohaU3
 uAQ2xL2z2Rjhzaa8w1lCI5+i1z2YED4iJtXXyaxZ0XqaEafwrnSL76HnHSEhWrfZh2
 BSVoMTAFP3PkmPkb7Kyti1fKVYFgPbZvpPHr2csZ0HOGM4Do6P0nTDzzOAj/HPpgzU
 RU4p1z0AJO7YjLO6ciSZmTplImSf9p4ZS2V0k6wbLHUb3lAFakk5haqH41gWo/0kO1
 OKWEJLNDmmlsQ==
Date: Wed, 25 Jan 2023 11:41:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <Y9EVZQJEV8i5vdgp@sirena.org.uk>
References: <20230124230048.371144-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YLw58GmZKH9QcKuc"
Content-Disposition: inline
In-Reply-To: <20230124230048.371144-1-robh@kernel.org>
X-Cookie: Serving suggestion.
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:02 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 linux-spi@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>, openbmc@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--YLw58GmZKH9QcKuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2023 at 05:00:48PM -0600, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.

Acked-by: Mark Brown <broonie@kernel.org>

--YLw58GmZKH9QcKuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPRFWIACgkQJNaLcl1U
h9C5IQf9Gj9QI/FW6Xw+gMpDw41zL45NSAa01ZJ7G8XkRAaJNWXTMWR1sZKiK4XJ
5rjn6QJUusYQuPpRmgG2DjO115ttDY8PNNWUlbpHxdQ+0dQI/dzilsrEFOrFXH1S
PcEA3qn6o7eU3ICxhOnhcJzf1auMMUeq0hHtfjHxHLhgxeJZ13yZA61DnR9uShhF
DT2ZXj0DrflrKoX2haOnuhvLc0Rx5qV+O3LfPBcO53OdCgjkAkmW2Jll2UrtTUIc
9+G5v1R2fy/qBGUUQSzfPcTESH8bAwxpdP3i61xeoUYzaRNM/K4F/00nXADmY71w
uWdFdQq7y1nxrTCAKIbIk2i8KCJlTg==
=IpOI
-----END PGP SIGNATURE-----

--YLw58GmZKH9QcKuc--
