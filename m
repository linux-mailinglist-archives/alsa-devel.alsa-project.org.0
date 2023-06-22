Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EC373A08C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 14:09:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4BF9847;
	Thu, 22 Jun 2023 14:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4BF9847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687435766;
	bh=AhyNDGJmhhola/QmWkU/88kjnQn/z/ZY1Yo42GWMUA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qFAJ0JpCpde/1W7u1jAZWavPm16hs5u9MBDBqPZkmnVG3L+KCRgRRUjOomLwW+s65
	 BxVjU9kLDgj/J8OI1GOLL1CxMP+bLDQXA+EjVojaIZg7uOvG2YQSsAtMNhdxtboUUb
	 HYz0x2fkcAw2neNABhEFUF7Lk5KM4UD/FT7BJfKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F8A7F80141; Thu, 22 Jun 2023 14:08:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF9B9F80132;
	Thu, 22 Jun 2023 14:08:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 163FBF80141; Thu, 22 Jun 2023 14:08:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 353C3F8003A
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 14:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 353C3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=beCwEaRw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC6F2617F7;
	Thu, 22 Jun 2023 12:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01029C433C0;
	Thu, 22 Jun 2023 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687435683;
	bh=AhyNDGJmhhola/QmWkU/88kjnQn/z/ZY1Yo42GWMUA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beCwEaRwAnDmL4ncqLaEpgpdOtYbsqDnFdQIbh+XurazBXC0dhink0Ef9CAZjeaP6
	 Jx/WQogSNCVQsQxvqyPRilrxafXr7enJ8qFJVTjmdCl6FEhkOXATocRC9Z6/g+15gA
	 /CW1e3ai7tiuOwzl4dyBXKGNtQYQ+VKdG1eA9em7Q80WTH1yVZeCI2suGay03XAQag
	 PKznyOzwvaRUbr4gWQRi4dixavuMJ9/DnE1rIeU8y5mssFxjRRnYLu1C0jmXKP7IE8
	 wqYXzEJIIf5hyqh0biVRq36JEBX+i30tltZMiuMKnU9wyqGslwJAYkcnCrtDgwwNm8
	 crsoeNfRxKShA==
Date: Thu, 22 Jun 2023 13:07:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	jonathanh@nvidia.com, mkumard@nvidia.com, sheetal@nvidia.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/8] ASoC: tegra: Fix AMX byte map
Message-ID: <ad4b4dc9-7466-45a9-a008-c2301a7485dd@sirena.org.uk>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
 <1687433656-7892-3-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hvr/i48Dzsk3Qmc8"
Content-Disposition: inline
In-Reply-To: <1687433656-7892-3-git-send-email-spujar@nvidia.com>
X-Cookie: Please ignore previous fortune.
Message-ID-Hash: KOY6BSQ4SVTLVRSLRTP42OG7GAJ6TVHK
X-Message-ID-Hash: KOY6BSQ4SVTLVRSLRTP42OG7GAJ6TVHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOY6BSQ4SVTLVRSLRTP42OG7GAJ6TVHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Hvr/i48Dzsk3Qmc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 05:04:10PM +0530, Sameer Pujar wrote:
> From: Sheetal <sheetal@nvidia.com>
>=20
> Byte mask for channel-1 of stream-1 is not getting enabled and this
> causes failures during AMX use cases. The enable bit is not set during
> put() callback of byte map mixer control.
>=20
> This happens because the byte map value 0 matches the initial state
> of byte map array and put() callback returns without doing anything.
>=20
> Fix the put() callback by actually looking at the byte mask array
> to identify if any change is needed and update the fields accordingly.

I'm not quite sure I follow the logic here - I'd have expected this to
mean that there's a bootstrapping issue and that we should be doing some
more initialisation during startup such that the existing code which
checks if there is a change will be doing the right thing?

> Also update get() callback to return 256 if the byte map is disabled.

This will be a user visible change.  It's not clear to me why it's
needed - it seems like it's a hack to push users to do an update in the
case where they want to use channel 1 stream 1?

--Hvr/i48Dzsk3Qmc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSUOZsACgkQJNaLcl1U
h9DHhAf/WefGD9yvCmEhMJLKKlodJrVPiVYeL9PQs1d2i8BgdWrneVmZJdrx1hkW
4ZWCYKwK3UcuNjes6c/oKuhJswe8nHUgdyH21fnoagm/pC0Ofb9x1spklUvUkhlD
sVD1UjM7EyKX+io2TI0GcK+Gq6PF1kdejPTG0G8rDRz0xVWcQmt/ik6v7oRPCHsI
HVXMIiPYGeP3EGAps4oyD+jUeSIyc/3+7yOZdxE7sHs6+iNY6wmDKgwdQ9XrexcW
2hrfIcStW1dIcMSTqxR33p6BF51q9ao0CuAMWIKc5cPB+5+CK7fuQNz9A9iaNxUR
JjcnjMponglfk0gg0VuJ0rVMwAnYYQ==
=/vui
-----END PGP SIGNATURE-----

--Hvr/i48Dzsk3Qmc8--
