Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E507508A7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 382D0207;
	Wed, 12 Jul 2023 14:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 382D0207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689166066;
	bh=tLoJFh4oywXrxNXtAmdPnSrR0ry2WPhGPC1p7CMbphM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYhKxjbqlKPPUlQs37NnZuxTTQsmo/ZqzT00OR7CRwMwFd7rJ0P/VjSNn5zqdBKTR
	 w/iYjF0MkH4nissTb+7WbF7Igx1z1L0JrPhnzF+SBmGS8OrpQ/dgM3yiuVqZo7okRq
	 8WVlNXONEFF8FUzIU+JZO3YpsBfRiHoqpyECKaKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD32FF80249; Wed, 12 Jul 2023 14:46:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E330F80236;
	Wed, 12 Jul 2023 14:46:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C37F80249; Wed, 12 Jul 2023 14:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A8A4F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 14:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A8A4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bagkg5dq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCD12617BB;
	Wed, 12 Jul 2023 12:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92875C433C7;
	Wed, 12 Jul 2023 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689166004;
	bh=tLoJFh4oywXrxNXtAmdPnSrR0ry2WPhGPC1p7CMbphM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bagkg5dqgmXwAAzDRa77IkA22lcd1wJ/uMh0mrb2TvgBkjNYxGPHIKefXSYqzmKeP
	 9XLr0qTmQvyeoqAkhcopnmvqY+yqIK5kHItD/t4jQUqsZIvSi+hIghUWIlTHZsYRCg
	 9j9ORMgJpgmafe06oCcQ1vy2n49DKnwAxv496ZRfDWzSDuxnMxb5YE1fiEvYI6U7oL
	 PLQv7hfmGBvLGJU6qocK1H0aeWERU805iG01LxWiK9ZvYKI1ZQrSmYOtG2khxgS5Iu
	 g+Ss6IdqkHmeuV5KEEUb/RYhJXpp6AYJh9PskQg/GOXd6SqoZv+gbOiswEg3aIF0oz
	 Sypgup85mp7ug==
Date: Wed, 12 Jul 2023 13:46:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com, zhuning@everest-semi.com
Subject: Re: [PATCH 2/4] ASoC: codecs: es8326: Fix power-up sequence
Message-ID: <481906d1-977b-4c19-8910-81268937d706@sirena.org.uk>
References: <20230712080830.973766-1-zhuning0077@gmail.com>
 <20230712080830.973766-2-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A5qTlZLlNmei/b37"
Content-Disposition: inline
In-Reply-To: <20230712080830.973766-2-zhuning0077@gmail.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
Message-ID-Hash: QX26KGLF3VEWSLBLVHRN35NSIUV4WVUP
X-Message-ID-Hash: QX26KGLF3VEWSLBLVHRN35NSIUV4WVUP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QX26KGLF3VEWSLBLVHRN35NSIUV4WVUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--A5qTlZLlNmei/b37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 04:08:28PM +0800, Zhu Ning wrote:
> Old power-up sequence causes large pop noise during start-up.
> Using a new sequence instead.

>  static const struct regmap_range es8326_volatile_ranges[] =3D {
> -	regmap_reg_range(ES8326_HP_DETECT, ES8326_HP_DETECT),
> +	regmap_reg_range(ES8326_HPDET_TYPE, ES8326_HPDET_TYPE),
>  };

As well as not seeming to correspond to the patch description this seems
obviously buggy - even if _HPDET_TYPE was missed from the list of
volatile registers no software change should be able to make a volatile
register non-volatile, that's a property of the hardware.  The changes
to read from HPDET_TYPE also seem unrelated to the main change here in
the resume function, this should probably be multiple commits.

> @@ -633,40 +633,80 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
>  static int es8326_resume(struct snd_soc_component *component)
>  {
>  	struct es8326_priv *es8326 =3D snd_soc_component_get_drvdata(component);
> -	unsigned int reg;
> =20
>  	regcache_cache_only(es8326->regmap, false);
>  	regcache_sync(es8326->regmap);
> =20
> +	/* reset register value to default */
> +	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> +	usleep_range(1000, 3000);
> +	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);

This looks wrong, you're resyncing the cache and then start resetting
registers?  It feels like the ordering is off here, and some of this
reset sequence might want to be done with the cache bypassed.  Are you
sure that there's no corruption of user visible state resulting from the
power up sequence, especially around the HP driver?

--A5qTlZLlNmei/b37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSuoK4ACgkQJNaLcl1U
h9DQVgf/cYBeH4e1di5Xbcdo+6h4ApUf6FpdhxdASIOdeb3nltekqUWE3OvNVdHz
PctTTtl+x4rsJcn1XE6hUZCLvhYPrYHew3Jp8SgXs6S8Z5BGodo5vAfWgfdR1MvD
EbMSqWxPC+w+Z31nb7VvTxRbObPKFJI2KO5+ljxx++fmC1CSHgUFxBV7aLjeZ+f6
YeS4/eiO+GjddVA+RikUTrBkSvKJs6fbhyTK8gKeZPcXjbOEJ3WuQmFzvAm2EVPB
2Qj9q6lDOV78UCano6vP9OLzxc/4iU14qUMhK0uOh9OIzR94kDfm1ix7ZnA20lzf
Z8Jn7A6szXv2uX4TLHQ0RDLjrSQWAw==
=oMyt
-----END PGP SIGNATURE-----

--A5qTlZLlNmei/b37--
