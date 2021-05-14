Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38D380F4B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 19:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01167176D;
	Fri, 14 May 2021 19:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01167176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621014736;
	bh=jYNf28zRzJSBDffE3Tvr9JhYjPINmsR9nJFi2qdxp/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ek7FbKtUJWZE50o4wcmXn90BTtbFGa/MF7E3v9eH51jVjG4oH8BT16RpRyhmnLbJw
	 EFQ8Y31iQ9GA+FtDYEqHt7fbhJ42x59KmMkxBMysm3X2aDo8fgGEEiBEeFZNV2G45y
	 WjkVNCjvx+TSeBC7qP17cXayR7NZ4DYadeNGu6SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5223DF8026B;
	Fri, 14 May 2021 19:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25282F80240; Fri, 14 May 2021 19:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C75F800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 19:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C75F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Lidc+BbS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD93B6144C;
 Fri, 14 May 2021 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621014639;
 bh=jYNf28zRzJSBDffE3Tvr9JhYjPINmsR9nJFi2qdxp/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lidc+BbSgQEfs5TVZop8wH4OeU7ku5b/raE7xOJvFdRvX9ftlIBIeT2/cV9mKpjJI
 FwpBK++peuQO31+PYLbutyrXJki+qx0w37Db+HEhNiy9AcR7YE9jL+7l/ni9LeloCx
 Eas2CR0fp/y6Rv6CBY67TtEeir0E1VXG7YSsErrHwmHgEhljgussjCKnb+TP7wR5Cq
 pDnlROJK2qf1JxGLN8BpgSjiDZxH4+i+TQsG+EefJP2xyAx3VkMG5fiVn5qa11gcEd
 RZXNuiIvKWy7QgN1H0j0En0AlX+Mv9L7YP3gfdD6bsmAoq247Vk6ov+Ey/aorxK/Td
 VGm5jLBXWCOrA==
Date: Fri, 14 May 2021 18:49:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v10 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210514174958.GC6516@sirena.org.uk>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
 <20210514171940.20831-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
In-Reply-To: <20210514171940.20831-3-macroalpha82@gmail.com>
X-Cookie: Necessity is a mother.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 14, 2021 at 12:19:38PM -0500, Chris Morgan wrote:

> +static int rk817_codec_parse_dt_property(struct device *dev,
> +					 struct rk817_codec_priv *rk817)
> +{
> +	struct device_node *node = dev->parent->of_node;
> +
> +	if (!node) {
> +		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
> +			__func__);
> +		return -ENODEV;
> +	}

There's no need to fail the probe here, you won't be able to read any DT
properties but that shouldn't stop the driver binding.

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCeuEUACgkQJNaLcl1U
h9BxKgf/fSl9+6oIVB12S3dB4m1qbEr547nf28A1ciTOQ9Ga8SU6khBFvnTN+LX9
ibe048u1W0AQ63NahERGqZ/IBJ4a7cTfKnBM+hlDb+Tq5r3OgXbexf7kSQhpN3Gx
yqrVlrZAqs69XOJGQxcMPXZ2+FkLpjBo3CBaLjvXG4RuGZ4tijA4/aksfX2KVRlQ
qQVaNQuMJPNtPfZkNwQ+ggAPXrpOvhImxSdSmHwwvaLW3P5zvh5C0YRDNgZ1dNvo
nce7sZOxCNQlX2YYMc1Vglpx3reY+6tH5N7mAKDtVDt9nvi/jJ/oHShFBerXELwI
AKEpwYcoz7Ub+Ww9XFdEz4uGP0fF9A==
=RJAJ
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
