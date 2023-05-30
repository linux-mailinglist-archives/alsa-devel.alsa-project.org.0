Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1007160B9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 14:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3BAA3E8;
	Tue, 30 May 2023 14:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3BAA3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685451412;
	bh=gB3DzdnTcOqeQ/yA5xB+mEAqSvWsE3BKi0eELAC2ZuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OEoLrcmmva2CjDCLEO3rqaUCdSINEnhf/VmFcFeakeFDORySg8+cc9BRGwAd8MkCn
	 vv841a2e5NIoMbmES1ncxHNzvJlAd5T0BNpuLeJ8RuRX2qgutgNueNpnS1VrGASSQ7
	 czKDfsV5tHQ4PKjgIGVBTbo0mNPH7z/n1NDOxpY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A490F8042F; Tue, 30 May 2023 14:55:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61AECF8026A;
	Tue, 30 May 2023 14:55:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B60F8042F; Tue, 30 May 2023 14:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10286F80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 14:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10286F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pzdYG80f
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AD4462FA9;
	Tue, 30 May 2023 12:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A34C4339B;
	Tue, 30 May 2023 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685451323;
	bh=gB3DzdnTcOqeQ/yA5xB+mEAqSvWsE3BKi0eELAC2ZuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzdYG80fmSksEi1YqUZ/UD8oa6/83PEBXNA8vWUOjnLjj6dlwM8ykT+Kg8m0SBViG
	 tiFksq2POWgCBG827I15unwmNmbyKokVztJsZu3e67tlkluMWjgL8/WFHku2stydtW
	 ASOnoJomueeMvc8Z7GwvuUbkEs3tNmYqA3wXwoFJIZhsh62axEHtg3bVpISSNPqLk4
	 dHktdeIJu0f8n07kxYk8SNWU5KbvZYR6yZ2SL76bLu7KwPKMQNV3VLhUDb5g6RiSqk
	 szaSQS3PQcwd9+8rlDcKdcx3aMal6HROoXQln7Cg5tJaRscSfGLSUMc3zNaAadZK8B
	 ykuyD3Cp99QhQ==
Date: Tue, 30 May 2023 13:55:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	David Yang <yangxiaohua@everest-semi.com>,
	Daniel Drake <drake@endlessm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, kernel@collabora.com
Subject: Re: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture
 Target Volume control
Message-ID: <d15fb475-07da-4273-8a4b-2b493f3feb4d@sirena.org.uk>
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
 <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
 <5dbcbf84-602a-44de-ad99-268d4d5b4b2f@sirena.org.uk>
 <cfa23203-1626-440b-ec27-efe56cb297d2@collabora.com>
 <01fd1a9f-56c7-4864-bb2b-8b004284c8cc@sirena.org.uk>
 <3c6b67a4-4892-0057-3dfc-65ed6c7ebc37@collabora.com>
 <4a3f54a3-2cbd-4a22-9742-9ba60e78643b@sirena.org.uk>
 <8247660d-4b95-0ed7-9444-b23da23560ac@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VwKU/hThU0aasoKT"
Content-Disposition: inline
In-Reply-To: <8247660d-4b95-0ed7-9444-b23da23560ac@collabora.com>
X-Cookie: I've read SEVEN MILLION books!!
Message-ID-Hash: 3GYKNNQ4SUPHTIVSYYFIMXPCNXHPKRWK
X-Message-ID-Hash: 3GYKNNQ4SUPHTIVSYYFIMXPCNXHPKRWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GYKNNQ4SUPHTIVSYYFIMXPCNXHPKRWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VwKU/hThU0aasoKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 30, 2023 at 03:52:52PM +0300, Cristian Ciocaltea wrote:
> On 5/30/23 14:36, Mark Brown wrote:

> > The other option would be to change the value in the register during
> > probe to one that's in range, that wouldn't stop any existing saved
> > settings from generating errors but would mean there wouldn't be any new
> > ones.  Either approach is probably fine.

> Thanks, I will prepare v2 and keep the current approach.

OK.  Remember that the TLV will need to be updated to show the two
values having identical effect.

--VwKU/hThU0aasoKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR18jMACgkQJNaLcl1U
h9AK+gf/W47UY5pQEtAzD8tOdAXdQkK+SUUtr2KaUO7DO0hgR7cNOxU/oKB0MnLB
1JPcc2WAZd/t5T9zzvE9dXc0gyWN44UcrlJjRsYv2mVkarSBRSF7121NCcxeUhfB
MpXr4LSLG4F/7jsYsfwrqmHEH/5Rm3YtqacLuQLoajf2xvC/g//JJn1k51f3kgpd
WTCV4QQJSMBq35eCjXVEPS/vOIUAyZ7iYLE6ZgErkoxXgm9VcvKPXbhWdni9XuR3
5lpJHKyx9XEh9cDwNeq1dp5CAy9Pa8enWT5FOY1G0VAWgY2RGhJPvn3ACleHS7dX
Nrl0SlmWElUBaMDXpYAUslS9x0lP9w==
=wTrZ
-----END PGP SIGNATURE-----

--VwKU/hThU0aasoKT--
