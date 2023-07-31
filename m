Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F003D76A16A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 21:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A36E1E0;
	Mon, 31 Jul 2023 21:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A36E1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690832495;
	bh=cECi6X2ci0DniQ5oeatUmvY4BynKLN24yIpTW2oqPUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dOFjqkZBoinUKazxzjV1as3tnbLH5fjKCx92hLDqbq7Q2t3P+KvTLhjuVI4FN1LHI
	 0daxY+HGDw3RLj24AZ34tWaF2d2OhLOFWxW5irdAHC7ymAl4g6Xkx0QFbyNG3hybLM
	 F90phhK21P2bV9tuuNz9uQRe91IpnBlUtjcKfr+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4230F80163; Mon, 31 Jul 2023 21:40:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 154CDF80163;
	Mon, 31 Jul 2023 21:40:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C932F8016D; Mon, 31 Jul 2023 21:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE34F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 21:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE34F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pu9Dt3cS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21202612A4;
	Mon, 31 Jul 2023 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B911C433C8;
	Mon, 31 Jul 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690832427;
	bh=cECi6X2ci0DniQ5oeatUmvY4BynKLN24yIpTW2oqPUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pu9Dt3cSyPkYegGJ9c3RcGLOHMiyjYlxy/c+dwSkik3hsSr6ii0UfV6pPXMzZSw29
	 fNPgqyOvrwfliVIKt5AJGy9mdsQbq2/YtSbIgqQrylUNJRxumy+84RfsQmE4Dw5kIF
	 jE0dvSuBEn8+vMUiwPMxmECNCKPjy6HouNQ0BIEvdwkJur+8uYFtYjgVvSnIKWzQdM
	 DDHosgDyhiqhIGv4zx2nbjuiMqJIOMvgMg3B1WrnybC49P4DpFjq9Uo8HNWIZo+caz
	 wxxRfmO6DVmxgkHaE5PiQMgBuzVfh8Ofd2/8j1UG5oO7efcMiHxz3k5Js6tEMzyyfc
	 PmqH1QqxTbzQg==
Date: Mon, 31 Jul 2023 20:40:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MD/Kb6s/g3sL17i7"
Content-Disposition: inline
In-Reply-To: <87h6pjj2ui.wl-tiwai@suse.de>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: GRL5RILZS7DJY5GAJAWYV4MKM736NZYR
X-Message-ID-Hash: GRL5RILZS7DJY5GAJAWYV4MKM736NZYR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRL5RILZS7DJY5GAJAWYV4MKM736NZYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MD/Kb6s/g3sL17i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > It really feels like we ought to rename, or add an alias for, the type
> > if we're going to start using it more widely - it's not helping to make
> > the code clearer.

> That was my very first impression, too, but I changed my mind after
> seeing the already used code.  An alias might work, either typedef or
> define genptr_t or such as sockptr_t.  But we'll need to copy the
> bunch of helper functions, too...

I would predict that if the type becomes more widely used that'll happen
eventually and the longer it's left the more work it'll be.

--MD/Kb6s/g3sL17i7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTIDiMACgkQJNaLcl1U
h9AUpgf+MRJ3Ppt4G8lH1I84wnMH5JXZKHV/vI1aV9xjjvXIKtZE/+CSYf6550C7
PPTHfzwnBYOTWVgfWpHzHkq4xz7gabS1iz+uA8zxlWUAANI55/958s9gfaUZuSaT
Iepv46KwktU7+VbRzRMDAmgONLI5mwne+8NxLW50eigUKQI9f+oP9W8xpmdP2d22
oGEIbn/BHmGWoQ6RPfY3HT2g3FVmr8i63MfkUTWDuJJ28/NrYttI78uMnxTIQ6sD
iGPaAtosS7XVd0iLf5CX4pxb+YoTNLQvC1dUX7PJ6bqZ5d140yXESPgyw3Lp8Q8l
WoEQ/BSZ7E+q6JpVPksvRB7XC1vkAA==
=VfqI
-----END PGP SIGNATURE-----

--MD/Kb6s/g3sL17i7--
