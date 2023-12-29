Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA478221EE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:23:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52C07823;
	Tue,  2 Jan 2024 20:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52C07823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704223394;
	bh=iR18+g254ESFI2PGEsdJ28hiSRFcS+DdUWGRPbpA6rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vudgcO6EqOnba8gfTPiT9T8caiX6rdGsg1oa8zvju5gB8NXbZfj9mv185mXsGs3Aa
	 fnXASPfGWbjXiaOEoZca9oN8jB9uuMjwyjTF0sNqU66qGRxvVeS1zLK6jmPGUaEu4d
	 5duTEqatyqy/yaa0e3pWPnOPJlA7G/kRbN8T0osE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF73CF80571; Tue,  2 Jan 2024 20:22:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AA9F80571;
	Tue,  2 Jan 2024 20:22:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A95BFF80424; Tue,  2 Jan 2024 20:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 301BAF80074
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 301BAF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mzKvFZ5U
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 881016113E;
	Fri, 29 Dec 2023 02:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C2FC433C7;
	Fri, 29 Dec 2023 02:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703815616;
	bh=iR18+g254ESFI2PGEsdJ28hiSRFcS+DdUWGRPbpA6rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzKvFZ5U7EE06/2aIgCkm/afanj/Urctlry59KDtT3oOPc7WLs4Hj1ce61S4dbANI
	 wYoURjnnfyBbVGItCMZ7zgB/gwMoltK6aumylM5Nr4R4iVsu7NNpj3t8RS4tNARA7x
	 OclASVlhJxb21nIkB0c70+jtoBz/2iE+L0w+5PxhvuECAxYUbapmpgc9w5cYY1xbfL
	 3K1xwhV8qEIABQIE37V02klRDTmVn6HJjk8vryU0KjdcngBvnXw36XW2bzwXhpOmJv
	 TRXGZjwzW/Rwg4o4/85VL6MqMVBzM2IB7hYkIbvRkYSpSeQMleN1hBiz98skrnhBj/
	 C6INWg3xsBllA==
Date: Fri, 29 Dec 2023 02:06:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>
Subject: Re: [PATCH] ASoC: rt5663: add cancel_delayed_work_sync when system
 suspends
Message-ID: <ZY4pvGWp1ns75v2F@finisterre.sirena.org.uk>
References: <20231226091356.3237667-1-shumingf@realtek.com>
 <ZY2whKnjs8jS6P07@finisterre.sirena.org.uk>
 <db750463a176428da1808c2d44fe8467@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NpG6EOezF7ek0Mtl"
Content-Disposition: inline
In-Reply-To: <db750463a176428da1808c2d44fe8467@realtek.com>
X-Cookie: You might have mail.
Message-ID-Hash: ECZJFNXLXFPLEACLQXGKVTN6TB7OPTHM
X-Message-ID-Hash: ECZJFNXLXFPLEACLQXGKVTN6TB7OPTHM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECZJFNXLXFPLEACLQXGKVTN6TB7OPTHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NpG6EOezF7ek0Mtl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 01:47:35AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:
> > > This patch makes sure that the workqueue is completed before the syst=
em

> > > +	cancel_delayed_work_sync(&rt5663->jack_detect_work);
> > > +	cancel_delayed_work_sync(&rt5663->jd_unplug_work);

> > Does something ensure that no more interrupts can fire after the work is
> > cancelled?

> As I knew, the JD source is not the wake-up source when the system suspen=
ds.
> This patch just makes sure the work is done to avoid the unexpected probl=
em.

The issue isn't unexpected wakes - it's if the work manages to start
running again before the system suspends.  For example if a jack detect
interrupt is triggered while processing the second cancel there then the
jack_detect_work will be rescheduled during suspend.  Interrupts will
still be active until a reasonable time later in the suspend process.

--NpG6EOezF7ek0Mtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWOKbkACgkQJNaLcl1U
h9BUaQf/URpKSIVqBXVZch1aha6GdH974LbzLCFgYiWTeuAe7XsKoYEhbBcRutYj
krrxeOGoMRbik4Z2qTxTIFc0WMx8DLUbUQN87RnwIsX3ysXYjtvLN0GFeqZoizba
5k8oedey8W2Ny+oZT42VaoMYpFuUOEccNKmEwcA9O10/x8Z8JkHisd/EHM3lWFfV
kcsQ2vNSsNF4NxK694mE68DhP3CoWtL4Uw+QNigx3ol2Js9K6aoSedQ8TtbFoGAi
mlZVZ+j5RpeHxcaZNbsaCNBxifggBwYsT+0eywuKutzA1nAFDE8vgycNToSY7TNY
TEOO7hZBmZlGEJLAHJyJ+T9GY/lmQA==
=rGQI
-----END PGP SIGNATURE-----

--NpG6EOezF7ek0Mtl--
