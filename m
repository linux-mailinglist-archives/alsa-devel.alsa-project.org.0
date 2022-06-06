Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85153EED6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4B91B2A;
	Mon,  6 Jun 2022 21:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4B91B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654544751;
	bh=TdyzOHBijyDDuJa2kymQDu3XUPAwTzmKg4DRuJ4dnrU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+FZYEX1srp1zou9nIh0vDEgYwCF4yHe6NGUsZX169EDWM+djFTTDvs7nW4hwChKk
	 Hf6KoJizPpZufz5IIcpRZ88iPsfpl0QN9AaILIBkSIcHnheA5JNrvbVEqw7xxwW2oB
	 4CifNRt1vNCVFhNVifCwoBmJ7Tss7JjkpIq58lgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07D7FF8012A;
	Mon,  6 Jun 2022 21:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E45FF801D8; Mon,  6 Jun 2022 21:44:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D73F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D73F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KfuwYUHQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4ED8B81B36;
 Mon,  6 Jun 2022 19:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D122BC385A9;
 Mon,  6 Jun 2022 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654544687;
 bh=TdyzOHBijyDDuJa2kymQDu3XUPAwTzmKg4DRuJ4dnrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfuwYUHQcSCTFzs4dSzoQUcCQF+ZZHaLVUn0UV2rRBcCmdFfEhGh4NnKetgvUk1kI
 O3LAEHez8RgANUrufP2o/DWqEtA6dihYZEqwTKKHZp5348tIXqvii4XljVl7dEZB+y
 DykCz2bL4OOTh3E9WAaR9B70f0zqex800F83+hTZpmET7+ZXofKcLNe2iJ/n8F686P
 ebQ9auP9Dz9pv4F6rzmNLwCGICqCU4deKMQtmn3da/jbmB6dclsKHSkje9jJUUDl9J
 otobhR/BlmJMPh2NAx0Wf5qo6D0dj5J/LEfzJ/qCkcpPSz+RBd350XJLhb9kLRql/m
 Zty0pLS61y7Pg==
Date: Mon, 6 Jun 2022 20:44:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 1/5] dt-bindings: sound: Add Apple MCA I2S
 transceiver
Message-ID: <Yp5ZKZ+MOW/75KXi@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-2-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AlCYaszFUFMsVBIw"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-2-povik+lin@cutebit.org>
X-Cookie: Have an adequate day.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--AlCYaszFUFMsVBIw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:06PM +0200, Martin Povi=C5=A1er wrote:

> +  interrupts:
> +    maxItems: 6
> +    description: |
> +      One interrupt per each cluster

Other properties are specified in a manner which implies that there's a
minimum of 4 clusters, eg:

> +  clocks:
> +    minItems: 4
> +    maxItems: 6
> +    description: |
> +      Clusters' input reference clock.

--AlCYaszFUFMsVBIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeWSgACgkQJNaLcl1U
h9Aqfwf+NBQXCTVBk663Vwcd22hz9vBXtdVIMfmgPBYszdHc/ZlYb3vSsd7l2Cb4
SvxdYa7uixpvVOi1yoFW0M7G4fBAVHT1PEt9s2sRkE0iFu4QcOaUfKDyo8pY9jdc
ak3EHjJ74hPZtcHSF4KfFkKIJm6kl7mgjpATzUfhi8D1GGDXmyaGBBncDgCvUnEl
ulVKVpRQcd12KVDLfvzZZCDMIJOiZO6WF5F3OtN0alwfekPGU9poRs+QxpjAWxHf
Q8WIk7rctnKt4HREyq7egXNJuG3V06K3jzZnwIT7P1n9ye7RrZH87PR3oLsQIVWd
zh6Ibuyl9Ia2Zh9q4RLPcaLE+mbYUA==
=TRq/
-----END PGP SIGNATURE-----

--AlCYaszFUFMsVBIw--
