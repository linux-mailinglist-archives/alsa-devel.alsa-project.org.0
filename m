Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE72FF3B6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:01:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12921191A;
	Thu, 21 Jan 2021 20:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12921191A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611255693;
	bh=OKnPD5whptT8nmC3xt5vR7j3GB1Wtpa700keFLLxhZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ctT3P+c+RPHkVka+gIGxjiCsKKFFTq6KhthOSl+JkpZJAY3fWZ7OwToKHE2dIhzK3
	 GwLlR7xYhPQLPuoKcVoMIPEEuv2LBxY84RsFmgiejDPauX4MgHL10TtBxI8IaBdEko
	 qt3rmtrtTlhSPWMWagoAXdIa8srYKhTfscrLcRqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2197F80272;
	Thu, 21 Jan 2021 20:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1936F804B2; Thu, 21 Jan 2021 20:00:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C227F80273
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C227F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AoVItIzE"
Received: by mail-wm1-x336.google.com with SMTP id c127so2421831wmf.5
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 11:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d/ziHaJ/3CRX+7Ak8L6tc/6XTy9kd0cfBe4hNikwO/c=;
 b=AoVItIzETjxlFlcIaNNnp30X8ff2ER7nSIMY/AvIZ2B2/uFpej8ETL7uEvOaAkfbVV
 xHuYDlnUevhdF9zBT5pXI11pKCwQoAnq5XHhIJFBtcPGf9SG0nsWuYrpmPmUFwgHya+N
 B/OTLb9xCcfViUiALg0skecxp4H+NE7uhwf5H0gtfZkp5rBj4Ts2yymTagIErt/bAGCy
 OpeQuqHj3DewMioI7mM2iRYLVWnM5TuYGRD7k8oHr67uWiR6AiohOO2/TlOZmAO9T3CD
 xbfzUrH8q82nxOMgd4fC44JltYsnjVTopVA/k/DxPWEUnY4auWMIoraSw7SyoGXlvA0i
 QvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d/ziHaJ/3CRX+7Ak8L6tc/6XTy9kd0cfBe4hNikwO/c=;
 b=sW32wtVf84eyqDl4bctOuCctPsPZZZHH5hAihsPvah4JXcmiw7IhvB2tMVHSDrtpg1
 2FsfvM/OSenrqwd0dhiOQzxVqpXDVBcjijUVZwO1gqmg8t7VEoIDbuEtBTD1oa25+J8S
 ulIyGFSGMAPdR96+oJ0ogeue1GozkW6+HCK6z726BBOgWnsJH+CzK1zH4XzRpHbcRGwx
 QODXFuFmO9erT36HPtC9AgsU6EQTfk+dF0dHMi1doqmBvth830UFA25UYcXFfa34obIC
 XQ8bnjDlEPwJWIPyBYQeQbkU6TayuI8ff0fxxezsMEbiits2hcPKofanbRuKbV98Hylm
 Mktg==
X-Gm-Message-State: AOAM532EPD5CLXRBvp+yfl/wxxhM6EguT/d64EjYVnblb9dSoS9cpdH4
 DqhySN15d3dQiiQvjqF53Yc=
X-Google-Smtp-Source: ABdhPJxgZ/IjwFq4Y/En1Jx4MO2W/E1hS4TJTyXYAdVydizAYJvZO0e/z5E1QRunLxKU368UllRi1Q==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr674158wmq.95.1611255618587; 
 Thu, 21 Jan 2021 11:00:18 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id w4sm8901051wmc.13.2021.01.21.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:00:17 -0800 (PST)
Date: Thu, 21 Jan 2021 20:00:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
Message-ID: <YAnPQO2BZKxnvnZU@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mqXVJD2aWFFDAbPm"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-6-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, linux-tegra@vger.kernel.org
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


--mqXVJD2aWFFDAbPm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
> Expose a header which describes DT bindings required to use audio-graph
> based sound card. All Tegra210 based platforms can include this header
> and add platform specific information. Currently, from SoC point of view,
> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++=
++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

Applied, thanks.

Thierry

--mqXVJD2aWFFDAbPm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJz0AACgkQ3SOs138+
s6FQ+xAAh5sFlbnqM8oTZQFjZluJrD7PLbFf2es+YGmrReDA5xAJXmlq1AhaaGiq
bjsm9rKGYbE7TYu9kfoNBpx5p4zKChGqstucZAoKuMfrcJlgyyD+s7oj0OVVIyjz
TRHfCZFcvZfjK3IaR1Ik5u8ZzkfKvPsaSOeGQuUoMnlyCoEuMJk/PhbwDF2F7f72
ZKH8qDRbXwy8AtibLAG8zqs68RLnh87WgRktXpd/DcHHmWrGM8Gy3/tdCAL/p3Fa
YX5kt/DhyzCcQAo6QH47QCXtwopLo/0tL60MuYgCYbnf0nAsov32w2x+aV2GvN7l
8FHdCfLFIDuQOuyoJgD5cpURS3ydWyWN2FdPOEqEak2kkS14DXePs9/aWr7Nmr1W
ChlUDh2aw9VgmOsp3EGQO3YzcCYu4RQnBaEUw9sGukEy6uZ853Cqa2S+euBou9rY
R9KjuQh4f6eeKuYxJ3vOdoooYi7nlphIejc94o19wnNu7riAy0XopLjcPyTVYypz
vLsHgMhnSsOcb7Zwc5W1DRxL5gGU90dOSChBnNCTsxeiIYRbmK1YXeBNy7gtbI0R
7Yhj5yvd+sSbfTzJNZvrg5rdh3QHXZpMICGJW0SQXmyovDLwTkNpy5Tc6YltOOv6
+F873C2UDSoeGnbRz2wFvpaX/lZI1mbhD5EyyZe7txKRP6eYHTo=
=74uA
-----END PGP SIGNATURE-----

--mqXVJD2aWFFDAbPm--
