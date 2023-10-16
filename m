Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566B7CA754
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 13:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7109782B;
	Mon, 16 Oct 2023 13:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7109782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697457580;
	bh=EESOofAGoz0NJ85srEifh5w8COAeKPVtpl6yq3ANTCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EEAM8rlrNOqxyBzEnft1c5gHCUITkASwk4Ee8kFYx7YwnjinCsObPHztrYxmjfg7J
	 RvuVJ7r1UfX85bqdVMgQQxLnDNKdBo6sMaTOIyNTxV+osAseJbaFBL2zdDbCpS0EsY
	 jKH7u1pJVs4a1H0ZF5rwzMXDNMTaYNhHP9/q5DBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADEDBF80536; Mon, 16 Oct 2023 13:58:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E011F8024E;
	Mon, 16 Oct 2023 13:58:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E9AF8025F; Mon, 16 Oct 2023 13:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 109AAF800C9
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 13:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109AAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y31U7l5i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8527560F0D;
	Mon, 16 Oct 2023 11:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C462C433C7;
	Mon, 16 Oct 2023 11:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697457509;
	bh=EESOofAGoz0NJ85srEifh5w8COAeKPVtpl6yq3ANTCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y31U7l5iU6fQUg3L0jXo9GwzTkJDEY+e2mdZcP5NqGiN1lrL/pVj6A2L/uNPuv0UO
	 zbTU40Kt3ftbIJLn7L2xbKjOcnMj0k0p+nkZQhwnMSIWv7V2V2NK/zcO8gJt4j3daD
	 wbpxUiMFsnD/AcQD4gszG99sEeXVRlzgE609wIHz3vo16LwRx55KJhS4gS4oJ+Mi4k
	 2el9EK0gyKARui7sUQXrl60X10sfAxFR83haLmSbZOeksFMbDQVtd3Cx/q/mVmTQV7
	 7G0u95GkvqOYaeC6oUCZCy+81zFMPF7n6i5rX82N5FRLr1TiOaPjW04mqEB3XevyIE
	 JInxUqv450MXg==
Date: Mon, 16 Oct 2023 12:58:21 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, alsa-devel@alsa-project.org, arnd@arndb.de,
	ckeepax@opensource.cirrus.com, colin.i.king@gmail.com,
	conor+dt@kernel.org, dan.carpenter@linaro.org,
	devicetree@vger.kernel.org, fido_max@inbox.ru,
	herve.codina@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org, liweilei@awinic.com, perex@perex.cz,
	rf@opensource.cirrus.com, robh+dt@kernel.org, ryans.lee@analog.com,
	sebastian.reichel@collabora.com, shumingf@realtek.com,
	tiwai@suse.com, trix@redhat.com, yijiangtao@awinic.com
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw88399 amplifier driver
Message-ID: <38cab9a5-4fdf-4b50-b4e0-6a63beacab11@sirena.org.uk>
References: <ZSlP8GvTAOe35peC@finisterre.sirena.org.uk>
 <20231016081017.46963-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I2KqOEZVLNH8WqF7"
Content-Disposition: inline
In-Reply-To: <20231016081017.46963-1-wangweidong.a@awinic.com>
X-Cookie: If you're happy, you're successful.
Message-ID-Hash: YW747T5BTUVRNZ6VRWPZCVWY2MD7DNBS
X-Message-ID-Hash: YW747T5BTUVRNZ6VRWPZCVWY2MD7DNBS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YW747T5BTUVRNZ6VRWPZCVWY2MD7DNBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--I2KqOEZVLNH8WqF7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 16, 2023 at 04:10:17PM +0800, wangweidong.a@awinic.com wrote:
> On Fri, Oct 13, 2023 at 03:10:56 PM +0100, broonie@kernel.org wrote:

> >> +static int aw_dev_dsp_update_container(struct aw_device *aw_dev,
> >> +			unsigned char *data, unsigned int len, unsigned short base)
> >> +{
> >> +	int i, ret;
> >> +
> >> +#ifdef AW88399_DSP_I2C_WRITES
> >> +	u32 tmp_len;

> > This looks like debug code which can hopefully be removed in favour of
> > the regmap implementation?

> Thank you very much, but this is not a debugging statement, This is designed
> to be compatible with different platforms that may not support continuous
> writing.

If this is needed for platform comaptibility then it needs to be
something selected at runtime, ideally regmap would be able to hide
whatever's going on but perhaps the register address loading complicates
things there.

--I2KqOEZVLNH8WqF7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUtJVwACgkQJNaLcl1U
h9DeUAf9GxJLIrDPtoBWNfziL7xDN8MMHR4vboUOGd/9/eMsg6et0MCSu+5QzwaZ
oTvhMCnN1w5fQjm182eLWMKbnZ/NeuwVfsgyqaGEuP8JW/2+Tct7ag8LEZadlpcz
fnPjeDA5YMMTeVeNplkojJmFfaJjLuggt7o6xwKp36/ZV6AJlhj29y+LK+snV8eL
77jQR75a+ZU2OYdy8GAUaN8HS4cv8ln6U0YcGxlNjrF+VLOqfy7d2abbdBYPRkis
arUpxgW+qXYLpR53CyZGQnbWGXMpWyEZBiIGWNXuxq+IFstrOTyIUp/K4FWJ5t2A
YBUyyUaSuiFQNQGYb2V3IaV2khuftg==
=tkTS
-----END PGP SIGNATURE-----

--I2KqOEZVLNH8WqF7--
