Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849E770540
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 17:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D604F823;
	Fri,  4 Aug 2023 17:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D604F823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691164288;
	bh=l0sMLBvfFsO24nxw1az4wW28DScaLrtE7ASIYeJHCpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nkh8vqNvyzzBSKASoUYtBaBK8GhovQRvIG1GdYvyMvx7dgZEgunKzJghxnrFv7tQX
	 aEKCXatCS2/d6lx1Ze70UHSJlMnymxcKORZ1xvbt7hk7XB+mXRBg56KJmrqABc9tOf
	 EZHPvqnke9B7URZbzpBKRkkuf0vd5bSCJODweSEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0700F80548; Fri,  4 Aug 2023 17:50:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60123F801D5;
	Fri,  4 Aug 2023 17:50:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 816EAF8025A; Fri,  4 Aug 2023 17:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3929F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 17:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3929F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qHVZ/i5/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17DE26206F;
	Fri,  4 Aug 2023 15:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D95C433C8;
	Fri,  4 Aug 2023 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691164207;
	bh=l0sMLBvfFsO24nxw1az4wW28DScaLrtE7ASIYeJHCpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHVZ/i5/BDtV1RvApwD0OIR8w/FAgRqoVKUs3PAwHh2iAkpkojO8YbWVZEfr47fdb
	 LOqryoJ8BFEhZg56qmQRDQNKVB2eJCF7AeOc+i209mot5jT298N3H5r22to3b+TAj/
	 fr0gswXI9qGyQWVDKgiZDZkCQdcu58hpZw4n0VGTQlVQgJPN/+CoNimlTFbWNmnoCu
	 mgx9cQEK04B6L9+fSbss2a8clpPkBNYbUYtc7uEoFaZz5bBbN2i+2QGbsfINPhVZBd
	 GY2GX+mNdiiDdOJ0Yypc91lZrJdSnZL/40wIw3arv/8SKPTRaVTfzwa7UYZzbyIDft
	 9iIY/ZqeMfsSQ==
Date: Fri, 4 Aug 2023 16:50:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: lower "no backend DAIs enabled for ... Port" log
 severity
Message-ID: <9fdc2acf-6c33-46f2-8e2a-1c2cf506bd6c@sirena.org.uk>
References: <20230804132628.302385-1-hdegoede@redhat.com>
 <63eec3cf-ebba-a366-a66b-34daf76bc0f2@linux.intel.com>
 <878raqq36t.wl-tiwai@suse.de>
 <c320a2f8-7e53-4e51-84b9-9e7763ce1541@sirena.org.uk>
 <87y1iqoly3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NbWxA31P6T4wKGpk"
Content-Disposition: inline
In-Reply-To: <87y1iqoly3.wl-tiwai@suse.de>
X-Cookie: I'm hungry, time to eat lunch.
Message-ID-Hash: ADGKK43WWYS47PVL447T6LN3ZSNVXRIH
X-Message-ID-Hash: ADGKK43WWYS47PVL447T6LN3ZSNVXRIH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADGKK43WWYS47PVL447T6LN3ZSNVXRIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NbWxA31P6T4wKGpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 05:40:20PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Hrm, do systems typically filter out debug logs?  Most of the systems I
> > work on do still log debug logs, they just only include them in dmesg by
> > default.

> I thought flipping the dynamic debug flag needed for showing them up
> with dev_dbg() and co.

That's an optional feature, I guess perhaps distro kernels will tend to
turn it on but not the defconfigs I'm generally using so I've not been
seeing it.

> > There are ratelimited printk APIs which we could use, though
> > they're not quite ratelimited enough for this I think.

> Yes, this is printed not too frequently but just repeatedly.

> IMHO, dev_err_once() would be a good compromise.

I can imagine that being *super* frustrating when trying to actually
develop configurations since you only get told once per boot that
there's something missing.  dev_dbg() did seem like a sensible choice
here, even with dynamic debug you can at least turn it on.  Perhaps both
a dev_err_once() and a dev_dbg() so you get a hint that there's
something wrong in the logs and can still get ongoing information when
developing your configuration.

--NbWxA31P6T4wKGpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTNHioACgkQJNaLcl1U
h9CmWwf/bo6nQ6XXH+2v46YvV5BYHxS2zj2P/IX/oOcNkw84cyIivxFHhde2aO4i
eRGzCdOpfKjzSQmiOGBidPMJnUnry605uiSkqqsXa1/xAtUy+APssvsx40X7DcXS
YqomuKlzwzqepHJOiDjYSZTGc/+XPhqYAtE8up+MNvEMNm3fXGXYWKzy4Guf9kHP
oVu/YOehtDVLTFnfPuOMrhyiGRzzakCxi8ilAVPEgqNZIld1Lh+QuktyEEx+ogog
4hb6QRJ+YHBUzAw8JMPr5AnXaAKKz4msp/gOIPEQgol3oU5VMIOJPijH9lzSl6mS
UFbbM6u+CRZv6lQIJREqbaJtPSPGbg==
=mtne
-----END PGP SIGNATURE-----

--NbWxA31P6T4wKGpk--
