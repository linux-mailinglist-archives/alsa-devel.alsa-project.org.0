Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6151336A
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 14:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF758836;
	Thu, 28 Apr 2022 14:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF758836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651148099;
	bh=vxjMPjiYyFGhSMcGT25wyA/WTwatpL4xQZLW21y1LrY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHw+y12OiLez3RJ72TqoAK7eGATe7uWY0Nj9EywPWAeKahehYbajsgKs8lctyKGlF
	 FmWCWEE4XobhBbsKqX24+VsySnczep4IMGiBNpnQ4+gyUQ8iMgvwBLJ02I3Oz0pqDP
	 kZ2bEOzZDagk499BiUDkW0KJHulsmdc36xOJ5+fQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09B6CF80311;
	Thu, 28 Apr 2022 14:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 494AFF800F2; Thu, 28 Apr 2022 14:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 903BCF800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 14:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 903BCF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CZ6V0X68"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9285161F2C;
 Thu, 28 Apr 2022 12:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D50C385A9;
 Thu, 28 Apr 2022 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651148034;
 bh=vxjMPjiYyFGhSMcGT25wyA/WTwatpL4xQZLW21y1LrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CZ6V0X68DhdaTkp6BMzGTX1rWbkZ1DzkL2YhYLd502WaLC5hwoO4uMqjMlVQlu898
 yTH+GdehFwnErraXDMs8PVMX4Ha7/ae6hCmg8SHgzegUoSqyvR7RBqyoEq4QZo31zL
 2PVwD+W7KLhSKfZW8BxscVA/BHixp+9TiSPUUBvcJ4PZP7u0b0z5zUHdWq+gGArmoF
 kcs73wCOduTNJz5pS2rtOBXp1/eEd0ykp1evkbcjfN8BAUC3UiiZktAJWVeIEpuC5a
 0OzZZsLv0dTEuYuSJUffm9lb6Gr1CT/f+naBJKllxKJED3w2hUgx0b4PkL2nFRArvv
 PLwyVC3QwZCnw==
Date: Thu, 28 Apr 2022 13:13:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v4 07/18] ASoC: mediatek: mt8186: support i2s in platform driver
Message-ID: <YmqE+80xyBoIJvto@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-8-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qf2Y0CXE7QOl/F3W"
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-8-jiaxin.yu@mediatek.com>
X-Cookie: Bedfellows make strange politicians.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--qf2Y0CXE7QOl/F3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 28, 2022 at 05:33:44PM +0800, Jiaxin Yu wrote:

> +/* clock source control */
> +static const char * const mt8186_i2s_src_str[] = {
> +	"Master", "Slave"
> +};
> +
> +static const struct soc_enum mt8186_i2s_src_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8186_i2s_src_str),
> +			    mt8186_i2s_src_str),
> +};

Not clear why this is user visible?  Shouldn't the machine driver be
setting this.  Also please use more modern provider/consumer terminology
for the clocking.

> +static int mt8186_i2s_hd_set(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{

> +		return -EINVAL;
> +	}
> +
> +	i2s_priv->low_jitter_en = hd_en;
> +
> +	return 0;
> +}

Same issue as on the other patch with the events - like I said there
mixer-test will find a bunch of these issues for you.

--qf2Y0CXE7QOl/F3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJqhPsACgkQJNaLcl1U
h9DxEAf7BCZnRGuhD7QVceeLK9ft/+r5G6bcDYr/AzaD0m2ib8uHS9gAD2tNCPzS
hqNii0XqfHOk8qRHngTUCf2jArvOxs/04PUbVN9osjE3US4GasV3r5A2mjdH5Xjb
YfmoJbCF/LDmP3if9QwJkJEPJ13sqaEQLbO6MKBn9H/iMDXQGzXtLT+A/7vFmnlz
5Z4kFX2c+4/M3Kkh/tL+5mAWE42SYETASHjOFnvFvK8EyRsHraxWahmN7Q1ZlcIb
O/hK/hlH53YEyBysNZ4WG7U3CHHIJdf7XUN9/akMdwFo69exz+qHy2PItw6cix2Q
B26GhDB6BEav6uk7TLEz59R0iKw+eQ==
=QnX1
-----END PGP SIGNATURE-----

--qf2Y0CXE7QOl/F3W--
