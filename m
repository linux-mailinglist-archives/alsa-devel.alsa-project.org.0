Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DA74250D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22EF47F4;
	Thu, 29 Jun 2023 13:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22EF47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688038810;
	bh=ZC+wZcsNqTKU5rNSzVYdvo0zLQKLbGqao3ypI8BdBE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YHXZZTEpqLFR1HNmirbu8WXnRDpiB5C/76qlVAnMxnXtDqupdExFotfNxo5Qdoziq
	 FoV/7RVQCleq9GMpiwnxncrK/E5gi9s4ZxJqGPIzKABpvxUCGLb/2wxsMYJAmGA1Kh
	 kIebV1797UzZJOAJ+eIBotqrvj42qJombiphrgJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB76F80535; Thu, 29 Jun 2023 13:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CFFF80169;
	Thu, 29 Jun 2023 13:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C9A7F80246; Thu, 29 Jun 2023 13:39:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A2D96F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D96F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jWkoWDbB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A3A61464;
	Thu, 29 Jun 2023 11:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD05BC433C9;
	Thu, 29 Jun 2023 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688038743;
	bh=ZC+wZcsNqTKU5rNSzVYdvo0zLQKLbGqao3ypI8BdBE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWkoWDbBBcpFOLjtTNnyd7FR1EivjbdWs6gBTaqni4KaZqF/ruLkyUVmsD7MpURYP
	 rXIN6812xuvPL8rk0LvfkXPuPpUz1hQpXTXa4FmQwwGc4RRFqK4mmMMTzeIArd67oU
	 QZcm5IUq/AQMmKyNc3fMndC2bFEoYx2awCnLw3/Ev1c/+YT6650iKtBTNj/dBdVdve
	 X+Ud11/lJBD+QtlrGrRW9J3zz5XHuwXazBHkZmMxBt9V+251CtV1rkc5Im8D16te6T
	 F05OsCRJG8fdaGAvxfw/oT3wVHmryquRfhTQ94WLRfDU/zi2YD5TLF+jkUPnjwvNgW
	 RVeTq7plHPfAw==
Date: Thu, 29 Jun 2023 12:38:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] ASoC: fsl_asrc: Add memory to memory driver
Message-ID: <f6598cb0-6773-4475-85e1-5dfacaa16de3@sirena.org.uk>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
 <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FP1aqfO0iq4vQLEp"
Content-Disposition: inline
In-Reply-To: <1688002673-28493-5-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: 7LFUJGKWYXJXJCWXEDX2EN2KAB66U34E
X-Message-ID-Hash: 7LFUJGKWYXJXJCWXEDX2EN2KAB66U34E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LFUJGKWYXJXJCWXEDX2EN2KAB66U34E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FP1aqfO0iq4vQLEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 09:37:51AM +0800, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the v4l2 framework, user can use this function with
> v4l2 ioctl interface.
>=20
> User send the output and capture buffer to driver and
> driver store the converted data to the capture buffer.
>=20
> This feature can be shared by ASRC and EASRC drivers
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig        |  13 +
>  sound/soc/fsl/Makefile       |   2 +
>  sound/soc/fsl/fsl_asrc_m2m.c | 878 +++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc_m2m.h |  48 ++

This feels like the bit where we interface v4l to ASoC should be a
separate library, there shouldn't be anything device specific about
getting an audio stream into a block of memory.  I'm thinking something
like the way we handle dmaengine here.

I've not dug into the code yet though.

--FP1aqfO0iq4vQLEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdbVEACgkQJNaLcl1U
h9DmOgf/eCvmgKO/us13curwY8vW24n389PS/2sTaVssYszEQB7BvNfQV5atoKU8
Ba6RqJPl8PRNwurpLqyF4NLOA0EOlv8h0P3cCC/XZ6ticWK2lAy80EmU5XUgR742
FCzts7URNns+y3cZAepJ7a38vxNUQLJh/tbkB5aJGXr9X30sntOepWDMnUgoW4KB
UzzayZWUilTjl2LYkvbiIEf8MfC7VcptLU2Y7DevFjMm27aRoV2yBreIhEbrexsW
ngXnBwKOoR7SCgS68ZtsyD/RzZIeVx+mZI2/I9P0EiGXjcJnBcJAVlehJp+Wrhgl
0IHUq6WGmLFkATfM0fclKq7dykS7UA==
=K8a/
-----END PGP SIGNATURE-----

--FP1aqfO0iq4vQLEp--
