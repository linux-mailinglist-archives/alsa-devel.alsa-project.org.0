Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3F752765
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 17:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7451BA4A;
	Thu, 13 Jul 2023 17:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7451BA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689262725;
	bh=fniD5gq9IKThPXei1zUIixxEE2T8eOqHNxpz+jT3xq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rn81B+vZldQ/lfw1Xqf61PbCE6Y0yMByJ7G3hXgFuiscS6O/GaTrOClhbl2UGMgwc
	 MTwf9JeaVYMThhkCfMLtVrftEZOz8mMFw8gFiXygk25vgF8kWk9+Pk7zttxFpi/jwh
	 WQ9P1XwfC4mRl03/GmFbBYKuw5ivxrkqsAm9z8fc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD4C8F80153; Thu, 13 Jul 2023 17:37:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBD7F80236;
	Thu, 13 Jul 2023 17:37:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E83F80249; Thu, 13 Jul 2023 17:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CB84F80093
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 17:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB84F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cOqAIhT2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A4ED61881;
	Thu, 13 Jul 2023 15:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075FAC433AD;
	Thu, 13 Jul 2023 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689262662;
	bh=fniD5gq9IKThPXei1zUIixxEE2T8eOqHNxpz+jT3xq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOqAIhT2SDJ7ixo16K850sfKd/gkkDVLdyKdJNogB4FgxTr3AwlUstFrcm4dIQYaU
	 iiHM0YhjDxmC4jNHQ3HVoLBoAuxLviG6O4vnE8KtNXthdhrExNiAA2o1c/uweBuppc
	 9JoQHJlNEhZrgxuqR0D/fIQTuSj9BGGEzl/Kwn/jDtkM+7zM5K8fA50jG4AkZt9gP3
	 Qn5Fa+XrXfqvYMy+m39JMpMukuWFaG65+7FvXJRm674G52eJVO5Qv0AEgikAI9S8cy
	 2xZzrRvt+Je/e18XZXBdVzrlSJev6Z/XVEedU4sV5gjNjNDvEC0qV8p8gW6B9O91nF
	 zCPzldahfbvfw==
Date: Thu, 13 Jul 2023 16:37:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
	yangxiaohua <yangxiaohua@everest-semi.com>,
	Zhu Ning <zhuning@everest-semi.com>
Subject: Re: [PATCH 2/4] ASoC: codecs: es8326: Fix power-up sequence
Message-ID: <564bc4e4-50c7-46bb-9661-3edaa2a1351a@sirena.org.uk>
References: 
 <CANPLYpCfU-8nLCFNRQ7UfaLrzCNC1Qnx+sqtNN9rf3+s+d4C9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LzdDLjzMPiWr7Htt"
Content-Disposition: inline
In-Reply-To: 
 <CANPLYpCfU-8nLCFNRQ7UfaLrzCNC1Qnx+sqtNN9rf3+s+d4C9A@mail.gmail.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
Message-ID-Hash: 4NZR4YQBLYN4UCVT3GH5BRKNUMPAQ3CN
X-Message-ID-Hash: 4NZR4YQBLYN4UCVT3GH5BRKNUMPAQ3CN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NZR4YQBLYN4UCVT3GH5BRKNUMPAQ3CN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LzdDLjzMPiWr7Htt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2023 at 10:14:23AM +0800, Zhu Ning wrote:

> > >       regcache_cache_only(es8326->regmap, false);
> > >       regcache_sync(es8326->regmap);
> > >
> > > +     /* reset register value to default */
> > > +     regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> > > +     usleep_range(1000, 3000);
> > > +     regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);

> > This looks wrong, you're resyncing the cache and then start resetting
> > registers?  It feels like the ordering is off here, and some of this
> > reset sequence might want to be done with the cache bypassed.  Are you
> > sure that there's no corruption of user visible state resulting from the
> > power up sequence, especially around the HP driver?

> Basically the chip runs through the start-up sequence every time in
> the resume function.
> Will move the reset sequence to es8326_suspend

That's not going to overwrite any user visible settings?

--LzdDLjzMPiWr7Htt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSwGkEACgkQJNaLcl1U
h9DLewf/e+rluw74aYLsEuTKtZVeFaJBj8KcfEPsrX+vyY8FyVWpaCA1z1yt86N5
7anMSNo64xaSO5PVgxWSuxVDMc9h8ozeGCOzJhH2kABkNXSahy2tXCX4YbfItruF
9PoKuhPyXWwaDWlSIqZKI6voO8u/UJeRCBuNHxCdXBSt0gcZgdteHLeUCp4dSaWo
/jC/yOeXK2Cw+bEfZY58Pd3ADqo1us8NE+9H/TGGrGS2YmKbOi66If4lIV8BE9sv
jHayuAzJeAp2Vnj9vSVU8/GQWQWweYQNyGrGN/SIZ5okZlSV6kM8cYbRAYb8Z6gg
1KyYxpNVv30Ow/ELoMD82qS0SqMpww==
=TkeR
-----END PGP SIGNATURE-----

--LzdDLjzMPiWr7Htt--
