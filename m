Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24762785FF4
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 20:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C42F83B;
	Wed, 23 Aug 2023 20:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C42F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692816044;
	bh=asxMeG59goJrKZqpcF2iRdaVp/sUaPD7C4KvDd1RyOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FoszhpMRm0nm704C4cp3FcQzhyNCSTjZlR7dXoJF+bqt0RSO/2Z6rCBBHa7ClW2w0
	 mNsEvMSbAdfOilJ+G+IVLJr/wMlnAFk2wnG86JHNnZ8v2nw18N/jNQAurDCVmcmnzC
	 WuUacOE+7MhFSq9axLDyt94U2beutd34dugEKn6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F0EEF80022; Wed, 23 Aug 2023 20:39:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1431AF804DA;
	Wed, 23 Aug 2023 20:39:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8AF9F80536; Wed, 23 Aug 2023 20:39:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1955DF804F3
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 20:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1955DF804F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WKFlXyts
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09A4065660;
	Wed, 23 Aug 2023 18:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBC4C433C7;
	Wed, 23 Aug 2023 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692815982;
	bh=asxMeG59goJrKZqpcF2iRdaVp/sUaPD7C4KvDd1RyOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKFlXytsPC4AZKRXJ+Qa3aZloUnUGFQL+LYIK0C0yNJLrYaq3eMPpbo80zLpu4qto
	 lpY+ICEHYrhqIDisEmDc8i+CTUU5M6YevwUcK+BBYB19uVE8LN3egnOYMfOK0BeJ4F
	 WHWajKhvsx+/4coIQQsTBVHEQvqI+3hnbY9PdA2ra0NgL2OMcMm2cRGzFDJtKECskO
	 uglY+LaDK2LlsoKxLflOIfuLU1v/oxQO7/zXj53GgYBIIYPaI5/qedFjKx1XEw5pTB
	 IhIylskgfH1wBcxjjaptNhyC6vUYR254sjOYfyiHND++Dd24P9E0EGw1IaBu859/sW
	 ksi0bflQh4y+g==
Date: Wed, 23 Aug 2023 19:39:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <603cf881-b423-40cc-8bbf-b09d929a8597@sirena.org.uk>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hFdtHq9Mievm7JEW"
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-Cookie: Some optional equipment shown.
Message-ID-Hash: ENULQASCHPRGLTBDVON7APW6YUHH3DOC
X-Message-ID-Hash: ENULQASCHPRGLTBDVON7APW6YUHH3DOC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENULQASCHPRGLTBDVON7APW6YUHH3DOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hFdtHq9Mievm7JEW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.

Acked-by: Mark Brown <broonie@kernel.org>

--hFdtHq9Mievm7JEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmUmEACgkQJNaLcl1U
h9C17Qf+LbbaWfPVYoNHCKOts2RLh6E9FZYojlWRsJWrOhMsIwoY8wMxMPxpOUUY
XP0Hy/LRxo4Khds4zZcNYO05Pkpx0eBSWvzrKSppmA6Pvn9Tu8NkUz7kDmjc7Kwx
7x9ZJKzezKxMkDc8yM45Kc+WC91fV84eflnTL8pAv54aLIuOXqWjh8rTfwT5no7m
59U8ovuRPz477vFNoOu3dqqxSk9mpvY4bLXFGfKZPXGVAoTiNhqt0XML2chc/qr0
tr8971bllC0KXR3Y/8NdZBPwgeHAADvHOIjIGMHVrF+ZbPLaP1b3f9Abc+yd0VBF
Z/wO8E7iZJaNTg95zGWIiXzaYmurpQ==
=kJ5/
-----END PGP SIGNATURE-----

--hFdtHq9Mievm7JEW--
