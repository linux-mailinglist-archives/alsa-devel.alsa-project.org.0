Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4120F2E0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 12:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36A61612;
	Tue, 30 Jun 2020 12:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36A61612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593513758;
	bh=5qvJz6IPxW4GxH4mEunu4MaN4GfIhfcEM+grEQlyTOU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBQu/s256L5F22qVq+U4mT7twrCL/db37AyEwh9Eu3YQDJpvWA0vUKRxr55doUAnU
	 kqMQQDi/bH8zJ9hnjqY8VbI1HIO8vNY3v/KTcU6Q2SxPWF2P3cWLGj7AIIhvzqVSRH
	 JkHOlD6AH4xZs8u9LtNK3Gy6QATFB84rIgKeCVXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0424F8022D;
	Tue, 30 Jun 2020 12:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE17CF801F2; Tue, 30 Jun 2020 12:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA09EF8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 12:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA09EF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N2Uz5Fpx"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7EA82065F;
 Tue, 30 Jun 2020 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593513649;
 bh=5qvJz6IPxW4GxH4mEunu4MaN4GfIhfcEM+grEQlyTOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N2Uz5FpxOZMzl1sRgzzhtHb6mSSdB+Pa8aK8nLsqq7guqzojcCLyep/rpV8vPC0f8
 GInCDAwuI4Q3Um2eBSbZbdDVn8yzsRP2GM6roG2FasbLMiXKUaHB73QHczNQNwDpGd
 M9tT+5mcW9a/Q56/qBGo1XMddjjNrz9vFUlGz5ic=
Date: Tue, 30 Jun 2020 11:40:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: Re: [PATCH] ASoC: rockchip: add format and rate constraints on rk3399
Message-ID: <20200630104047.GD5272@sirena.org.uk>
References: <20200630091615.4020059-1-yuhsuan@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline
In-Reply-To: <20200630091615.4020059-1-yuhsuan@chromium.org>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
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


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 05:16:15PM +0800, Yu-Hsuan Hsu wrote:
> S8 and S24 formats does not work on this machine driver so force to use
> S16_LE instead.

> In addition, add constraint to limit the max value of rate because the
> rate higher than 96000(172000, 192000) is not stable either.

What is the source of these restrictions - are they due to the component
devices?  If they are then the component devices ought to be setting
suitable constraints themselves.

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77Fq4ACgkQJNaLcl1U
h9BqcQf/bBQI6UlLdBzbns/XWHMzns0NgqJqIDhyUaAV2cK/NnbvoadF7Q/Ierez
Kksy56oOcNJtiTpSuhy/Z2ubQNKNkcMYkwVSp3M3FllU/QxR59Ia7N8P4xkvbOsx
a5niu9cUSP94dygzita0jqcVvYkXXAaC9IHK/v11WwKsoM8KTgP3CWgksBGWJqVm
uTY3zisJtV1m7GIHObSu0Vr9c6XJrCi5G9qDZSxPyq+Fhcpz6nFtA3sN7Ctu5j8J
G8HdFjK69Suj6ESd13Xkd2/ELgNGzpA/W0SVpVkJzmS4Mbj6iyUegxXIk5LjVx4C
XfuoMxggN8y3ux+S5/MlmEw9AqU/TA==
=1Ldw
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--
