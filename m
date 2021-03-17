Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4C33F79B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:56:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA3116DB;
	Wed, 17 Mar 2021 18:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA3116DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616003776;
	bh=XxJeuZ+cw4amQUvKU8GjVxoePa5w1uzwY9Tpr8JD79o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fhk0A+tSkILqT86Ul4zYDA0r/muXzYow/bdmz6J2N3OiYPciYi2L9gvGQUCA1Bsh2
	 464K5RkHrQ24YpcPU21kePOYnYK0uEh79Mv5renHzMza4uDTnEkJdvwLbzcyVvbUnp
	 iuNuOK7MCRY8UZI+fzvwPdxU9/Mk4sMwYjVMqxv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2976AF801F7;
	Wed, 17 Mar 2021 18:54:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D841F8021C; Wed, 17 Mar 2021 18:54:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F9AF80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F9AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YL0xzOV4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B063864F0F;
 Wed, 17 Mar 2021 17:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616003678;
 bh=XxJeuZ+cw4amQUvKU8GjVxoePa5w1uzwY9Tpr8JD79o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YL0xzOV44xFC6fmX7FY7A0vi5+ciK4IFMJeLPQmdiSHP4/xEGcIdycnzKKRpGVVy7
 Pp0ei3Mr4NETkYL1YooSg2Wt+hKumQDzPCZOxUJkoQvUpi91yGJu56p0+HT5uQXyWw
 E/c1RP+K6LXUiLPYFqVRmHOQYRB7YdXt0UkgCEXbm4JIfSqjY5ibFk5ZBU2DzgofyX
 uixko/CYHJC6cw0ADdrBlwYDY0gC3iT1svl4MhTUxbJlxWQ+FZ5ODXM01vE+/hxJbJ
 4T1kLzBGu07iIoezzhgUoNH5LDtPPskj3wdnn6E6jmx46ahbWnIjFL4zo7kcgkiIXX
 25P3a3M4mwjFA==
Date: Wed, 17 Mar 2021 17:54:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
Message-ID: <20210317175434.GD5559@sirena.org.uk>
References: <20210314154459.15375-1-digetx@gmail.com>
 <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline
In-Reply-To: <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
X-Cookie: Please ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Paul Fertser <fercerpav@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 08:20:10PM +0300, Dmitry Osipenko wrote:

> Mark / Takashi, I may try to split up this series into two or three
> smaller patchsets and then the reset/ patch from Philipp Zabel could be
> merged by Philipp himself. I primarily want to have the audio resets
> fixed and the reset API extended with reset_control_bulk in 5.13 because
> this will unblock other patches. Please let me know what you prefer more.

I've actually already got this queued for application next time I apply
things, I'm guessing Phillip was intending that the reset patch go via
ASoC?

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBSQloACgkQJNaLcl1U
h9AAsgf/egRRBL2B24oNKvQ4OlsR6yr1Z1xvvwq1T2lCBKJV6kddrTOwC2ycOGJd
hupHoKwAfdG+eMlbOIyCh2/NyRK+gPuJjqhVRi0iT6ypmWFaxFVXF+2ziLaLVwmx
LV0G0ktWt/hw4o7Sai982eQJQCMkdLAMZ1/WsGup1lkyM0Gp1s8aPk+gB9WfC+18
oVMmyQAEXBK9t4xnhT2YJOiWD3QID1O79yGfio2VMSg5UydVZcYGz5Obum0DtlUU
K4tXp0NE5dmIuUzYbKTQuz6wkPDDpv7IaygJaFw0aYImj62cmWaPcE4Jeyu5+5Jv
4PglDPb4IaWxuU6VqJbxgmXV3wUkkQ==
=74VK
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
