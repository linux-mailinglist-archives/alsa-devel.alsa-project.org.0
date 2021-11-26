Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC845EF9D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 15:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A107193B;
	Fri, 26 Nov 2021 15:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A107193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637935877;
	bh=Yp7ZWaRLZqo2+/HaAB8QKWWqg0JyRavrODFXqssH2Og=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PuX7AtEZnfbdYWcfvsOmufTcqQ9P61vTCnejGVTfh0RfLTNsDUEEoaeXjIU6LCtbl
	 u7k1eGOWTp0r9iJ6yyr7TxPFUMl8fEiv7qbT7T119+cvoYxFlGY//Z1Puq0xGylPqA
	 il0j6VXobkSpHyLPa3DE4rjHngs0aaUube8gs8ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AAB9F80245;
	Fri, 26 Nov 2021 15:09:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B34B8F80212; Fri, 26 Nov 2021 15:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46800F80166
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 15:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46800F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eQn3+544"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA1CE6227D;
 Fri, 26 Nov 2021 14:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F494C93056;
 Fri, 26 Nov 2021 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637935786;
 bh=Yp7ZWaRLZqo2+/HaAB8QKWWqg0JyRavrODFXqssH2Og=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQn3+5441B/ajChtiLu15N5k6PSLbI1xHwXrReloGCO/0G5EVPptg+xq2WvchSIlQ
 tt/DjGA9xZvlmRAzlFArOKf4rSuWkNyZWVt0/FHLhWuz968xrujX6EqboWj7wHSIXt
 4VzjdtggVANSI8x6ilLgLGSsmag5p7QzQbvun0KCAPdSojL//I+l6kanRxKQtBLd5O
 N7wfjyYNAHmOaP7WN6hTvJKg+jo0++6ycbyEZNAgb+U4lZjfZQUGXNi/8Wzii5qzuo
 kGiDnyNP6gQZ4vlSzdQ/OmR/z2OYfRk3+NmBPZqahMKWRTldeXeuPTS41n0nHDw2ak
 C194HiOZMJjBg==
Date: Fri, 26 Nov 2021 14:09:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 1/5] ASoC: soc-dai: update snd_soc_dai_delay() to
 snd_soc_pcm_dai_delay()
Message-ID: <YaDqo6MC8/zjhpoh@sirena.org.uk>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
 <875yssy25z.wl-kuninori.morimoto.gx@renesas.com>
 <2cc78158-e288-e949-594f-0ab939a35942@linux.intel.com>
 <YZ+8WbwDA9oQoRSk@sirena.org.uk>
 <TYCPR01MB5581F87D324E2499303E36EAD4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Du4t0Y5KMQdT5MbR"
Content-Disposition: inline
In-Reply-To: <TYCPR01MB5581F87D324E2499303E36EAD4629@TYCPR01MB5581.jpnprd01.prod.outlook.com>
X-Cookie: You fill a much-needed gap.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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


--Du4t0Y5KMQdT5MbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 11:41:38PM +0000, Kuninori Morimoto wrote:

> Sorry for my late response.
> (It was PC replace week)

No worries, hope the new PC is working well!

> >> I would think it's more accurate to update the delay information while=
=20
> >> dealing with the hw_ptr update, no?

> > Morimoto-san?

> I think your opinion is very correct.
> But this patch-set is for "cleanup/refactoring",
> and your opinion is for "add new feature", I think.

Hrm, right - this isn't making anything better or worse in terms of the
accuracy, it's just moving things around so Pierre's suggestion is a
separate thing.

--Du4t0Y5KMQdT5MbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGg6qIACgkQJNaLcl1U
h9B23gf/TS2f8Uhwz/3aBj7dhy2c1WyFcZPt8ykzlZ9OTzJO5yO0q221pX2VOO2+
NC+ODlQFCGpYSLTBkXp+f98XdSunkPj1EQPdRxDococSfxUaUYRCyr+JEiR7vokR
upJg3Yflizx6A9V4lpJ42dyt4L49bHwGz9mhEmRNPmoOq6NlOI7S1b1aZRc1msSF
mu6DeoC9B/6dHuScaiDYXmK/FfinWrwDZoihD71jtEAsrCsdPnnAly1fNGSr5pH1
drbh0Wh8ooGIygoWwOJBpW6uP8oJDKcOgvh7pJUxD6xjrjtTDyh8YhVVe32XejkC
IGVPaLg9Mn32Pa6Ta+DHFEbmM9SScw==
=eRAB
-----END PGP SIGNATURE-----

--Du4t0Y5KMQdT5MbR--
