Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E89B60FA9F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 16:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E42A72EA1;
	Thu, 27 Oct 2022 16:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E42A72EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666881740;
	bh=GDDsAQTkoe5z81yiS6K3qoBlbDSRdrFNOqNExR/hsAE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgDiNlWcDLm8wvix7AUNNTQooagFCpnKLHsGG5K7+r2sLyb9BTfT2cJB2iKmneBAZ
	 Op1W7qhPX75jq+P7QdSeXbjUfSfzNL8tVq7KEhbKYCtRmXeI12jDjTvFKAMgYSqctO
	 xJ3wJcSgxXXj2CN2e00wRWSuCgZIAvTMiW6VeVLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A85EF80095;
	Thu, 27 Oct 2022 16:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD97F8016C; Thu, 27 Oct 2022 16:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15E0F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 16:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15E0F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JcDeorEX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2757F62364;
 Thu, 27 Oct 2022 14:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459A1C433C1;
 Thu, 27 Oct 2022 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666881677;
 bh=GDDsAQTkoe5z81yiS6K3qoBlbDSRdrFNOqNExR/hsAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JcDeorEXLNLlVNkvU4Oj9yVGa2fACOMy+h9tF4pqHK1RJg6Hn3OBhejjcZD0ABekc
 A9pkZWfRHB0Tor72qigihy7/lQvlchvHx/hjwi9IDh3I2+FHytRcKi0EpykAVJN3sC
 J85EVyMJdzd8l8LE8BNxieSZCSiYhah9XuKoCOJofXcRT8egqwXhZAUWdVFnrCew2y
 4Cey4thsmq8x0tjDBXvNpYC5u63fZi12cqXX9p9iqxmkNmdeEpRL/+bx8qnPqJN5dL
 FeCp07JsuVsuexv7iUVJUNR8KxASpmAtBh26tffwtK2MV3e6hK0liMKnZvUSDpaHS6
 ziPyqYnM84bqg==
Date: Thu, 27 Oct 2022 15:41:12 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek, rt5682s: Add AVDD and
 MICVDD supplies
Message-ID: <Y1qYiMEEohapaG0F@sirena.org.uk>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
 <CAGXv+5HJo5x2ieOegmv5vkfh+rTevdR_fri-7PeK+Gd+GXVjNw@mail.gmail.com>
 <20221027143627.nbbketezqunkclxh@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1nCwZ8a5XeZnWgHr"
Content-Disposition: inline
In-Reply-To: <20221027143627.nbbketezqunkclxh@notapiano>
X-Cookie: Forgive and forget.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--1nCwZ8a5XeZnWgHr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 10:36:27AM -0400, N=EDcolas F. R. A. Prado wrote:

> Also, since you already gave the purpose of these other supplies, could y=
ou also
> tell the purpose of AVDD, MICVDD and (for rt5682) VBAT? That way I could =
add
> some description for them in the binding.

Those are all very conventional names - analog, microphone and battery
supplies.

--1nCwZ8a5XeZnWgHr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNamIcACgkQJNaLcl1U
h9BiXwf/a2LwV5EhWm7OrM48Kr5XuiVoUVNm9a4Eca+1o24Li+qLa1PHX7iFIMqR
Cr8x3LhtXDeYmwmp4IKl+OOyxdG/qMiefCB6ItiZ399ojNEdp+7zd7qCrsbnPg74
ZmPoFfjH6LLMy6j+rFWXWihU/3uFry6vaMT5g9XT/L2+7Dj49MEPQgbcIe4HlTz1
Amzamoi142yiUTNlLxKRpTtalUd30b98O3tznX+km8XbWtcvAKgy6zU0MpIXU8FZ
q2bw4F678dU8F4EdKLhDaoqwvAsosUgRow+thU8lqNJAZkjBRhyQn0gljtfvULcs
Nw2JBnoqx6U54ZT7cE6nQU2fqIVB+w==
=5WYh
-----END PGP SIGNATURE-----

--1nCwZ8a5XeZnWgHr--
