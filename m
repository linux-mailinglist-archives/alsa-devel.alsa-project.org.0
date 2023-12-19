Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4DF818D01
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5FA8E10;
	Tue, 19 Dec 2023 17:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5FA8E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703004872;
	bh=T8jB/yO9FUu/W4RhlJE5EiKrrszTT5Rev2qthCXr0eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RQEwYxM5UHww0zadoJhuJIfLWjO1qPwmyn3klULiJPkO624+mVI7OCC69yWVYQ2zj
	 zpW1yN1/8z3bmd7hi9owV35cYUi0gbHS5LPVDrPMcqWG0Jmxx13QA3FfJ/vTeib1Bf
	 vWR6LhBkqHll7TMsvdsgUTzNouA3cyVhLp2XUxz4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B87DDF80568; Tue, 19 Dec 2023 17:54:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9DC5F8057A;
	Tue, 19 Dec 2023 17:54:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06FD9F80425; Tue, 19 Dec 2023 17:54:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B535F800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B535F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xie/VrEd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9A5FCE1287;
	Tue, 19 Dec 2023 16:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DF2C433C8;
	Tue, 19 Dec 2023 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703004838;
	bh=T8jB/yO9FUu/W4RhlJE5EiKrrszTT5Rev2qthCXr0eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xie/VrEdybQkb6KXqrZ2qDnQ7l4hZlvK9ELDz0/6OyB8vx33/L61NVw9xK9I6vQIe
	 yp/r6jm17wAwFH5OmAIAtJRUPUA9xqwef+f+FMye6ZX93AlLnPfJO5ekcWeWXP+g9D
	 T8khun+8VHsAnD/DFChHniVyTNiGNpxSrIL8G+30MPfnydOKJn5D3xGDSOT/KuW04S
	 zyHwMlvweJreyB/4WIoVsAWnL43jUvJD7kxaO1DzY/3WVF/TgOVYsgoG5jLvCKyDBa
	 uvD13akTIZ2B2dhD+W+ptDBB9uKk5ewf0jMisBE8SzwmDP70yWCRK6RZH8PsZa21qq
	 ogMUsoOyVVctw==
Date: Tue, 19 Dec 2023 16:53:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OLqZmS3zSp2PK1pr"
Content-Disposition: inline
In-Reply-To: <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
X-Cookie: System restarting, wait...
Message-ID-Hash: JWFFR57CEKYYFX6SCFUKQC7GDQKGFBQB
X-Message-ID-Hash: JWFFR57CEKYYFX6SCFUKQC7GDQKGFBQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWFFR57CEKYYFX6SCFUKQC7GDQKGFBQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OLqZmS3zSp2PK1pr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:

> > grep for regmap_.*async - cs_dsp.c is the upstream example in a driver,
> > or there's the rbtree cache sync code which uses a back door to go into
> > an async mode.  Basically just variants of all the normal regmap I/O
> > calls with a _complete() call you can use to wait for everything to
> > happen.  The implementation is a bit heavyweight since it was written to
> > work with fairly slow buses.

> I spent a fair amount of time this afternoon trying to understand the
> regmap_async parts, and I am not following where in the code there is an
> ordering requirement/enforcement between async and sync usages.

The only actual async implementation is SPI which processes things in
order of submission, the sync API wraps the async API.

> Also is this just me spacing out or there is no regmap_raw_read_async()?

Right, there was never any need.

--OLqZmS3zSp2PK1pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWByp4ACgkQJNaLcl1U
h9AXugf/dPfmV0KskeKlFgS6fzM62vN5KTrHj/4XqqMTkHFV1a5FRrK3OUGWVnl9
DkP+gIrkm78rgSA+fHWLpqfAQ3glNlsqevFZ7YuTPxf6BII0IfjbhZ1ZkTwfTFkh
9IC1xQcFEiSVXzFKSlpafCOR2fX0AcauX6F4QFzzk8hKabeJy9UMkMqsrAUWtUyl
tOTd8igq8hQumSRCUGttN7Jqcls5ZntR+uBbFXIj+XnvNO54XXRYQj7tK7IHgAiv
tYrqIafZYK61FlHktmMpNIMAKEJkWe0My+7GEHauk57ryX+F13CdpyDMw8LmpDQ1
5UDeEdoYmAWjUCdFAcg9YGPOYUT36A==
=Ei3c
-----END PGP SIGNATURE-----

--OLqZmS3zSp2PK1pr--
