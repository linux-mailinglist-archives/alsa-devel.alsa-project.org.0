Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24351425B04
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 20:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8350B1657;
	Thu,  7 Oct 2021 20:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8350B1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633631930;
	bh=gGWprYn5gQ7KbkjpX2h4XDNlbjRBAtf8CLo4/ccffiI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phRpxWpGmBqPbvURUUXdOtGM1gaEGeGT+4IlWEfZ8yyJ+QWpHDXN0UAoJG/vdd1U5
	 UiPOd4MpP1I+GOwLIlMi6gAsI7Z2JTeahkZj2rdmpezqMyzNHzdgWxZXQtB/U8ot8L
	 HCJuN3wrS5Y03xXRVlyXh2Uh4He/VqaAK8eFWOe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C114F804BB;
	Thu,  7 Oct 2021 20:37:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6C41F8027D; Thu,  7 Oct 2021 20:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A78DF800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 20:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A78DF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OSjlVb8w"
Received: by mail-wr1-x42b.google.com with SMTP id i12so9332437wrb.7
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9c0I8cRx8jK0W8d7jKTwNFVW6wL8kZltQMKSstF2Znk=;
 b=OSjlVb8wT2q7EdDA+g/0wSgQgoOt5re93pmDF5glyO7HsFfOrMlncFLM+9YEX0WnJZ
 iouKTodqJ0ZS7WC9HGDbtLxLgjGx7DlmVhSOKxEfut2G4AZzBDEciiNandMHvF1LcLNE
 4wIMz+nYMfC0pvBEOP/5+wXHyxHppDobzxG9q8Ob1loNzC8bryLTj3FwoRUkfPtbYQSU
 TKvjIJXZ2vNVQqL6BBDomIV/6gL8udDv7RoB1v624IbfQzTKuPfhlQNDSfp6DkVMltLz
 AxsieB0bz1x1Bw45w8AyLBHa45xw4KBgwKlC9zSWuIzhQmcDWcL+JVUJy386t2Y7QTDH
 Rxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9c0I8cRx8jK0W8d7jKTwNFVW6wL8kZltQMKSstF2Znk=;
 b=XX2U1DJyV5qiFESeG/UdU64lg6jwL0kINAnjd3HU1udPmz2z5afGBSQDXKVFDDjtIH
 CQQT7Sr6/dodJH56QCsT+nL0c3qZm8V2AJhXj6P5WfQBaFZLhEx4donKNhy1aY95jC47
 r+PBvBNrr4Au1MJ4S0+xW00hEJZ9aQGb1YIxie+mbPCIx2uQ5vMbr4OArak90HcslJhh
 YoZqt0JPNvr9y/jyHtZrJtDMpdceNjeoyHcBH8k1W6yZdEqSyK7us5zF7XS89SVJycuu
 6HfrhEyia9V+T6QAkIxYYI8pPY3/8h2QM43M8sKpG07B/Wop1p8sqKfK2jIMURfnkDu6
 dP1Q==
X-Gm-Message-State: AOAM5318e8c/+OY9W7ScwjGsfqJQHPQn11q57FQteVLJp3kq9t+wAjLQ
 KyBQmOT3MiK4cOEGeSbQ1dE=
X-Google-Smtp-Source: ABdhPJw+3k8i+aDhy2Kyv88+w4QaP6p/hfjawdFZXl6Uwv2lSIx3xNm2xp19D+hW745LO+3phBIcDQ==
X-Received: by 2002:adf:9796:: with SMTP id s22mr7151096wrb.224.1633631864980; 
 Thu, 07 Oct 2021 11:37:44 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l12sm134044wro.14.2021.10.07.11.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 11:37:43 -0700 (PDT)
Date: Thu, 7 Oct 2021 20:37:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 12/13] arm64: tegra: Add few AHUB devices for Tegra210
 and later
Message-ID: <YV8+dWihAa2MbYlf@orome.fritz.box>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
 <1631551342-25469-13-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1/J06XLWWnwIzgIm"
Content-Disposition: inline
In-Reply-To: <1631551342-25469-13-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, catalin.marinas@arm.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, sharadg@nvidia.com, will@kernel.org,
 linux-kernel@vger.kernel.org
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


--1/J06XLWWnwIzgIm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 10:12:20PM +0530, Sameer Pujar wrote:
> Add DT nodes for following AHUB devices:
>  * SFC (Sampling Frequency Converter)
>  * MVC (Master Volume Control)
>  * AMX (Audio Multiplexer)
>  * ADX (Audio Demultiplexer)
>  * Mixer
>=20
> Above devices are added for Tegra210, Tegra186 and Tegra194 generations
> of Tegra SoC.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 120 +++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 116 +++++++++++++++++++++++++=
+++++
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |  77 ++++++++++++++++++++
>  3 files changed, 313 insertions(+)

Applied, thanks.

Thierry

--1/J06XLWWnwIzgIm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFfPnUACgkQ3SOs138+
s6HFtg//cQtQS7tW5Hkq8Mssis9LrXKdxK4iYsVCb5jl1gJmkv3eDs/1/hvt4L5h
mZIneAD2028ADaXM6DE7TAZVW+7lp/DQhwZhre3wgmM8RD4YqN4dvcMFz0+zFEYI
qUGxzkTw37x4RYyiTH508dGP5CkelyoSAbxSU3YcyK9A3P4l1T2s7dDkeXBm60Su
uiWe8GmH4ae67cgNNY19VqNL/PHDRugEZvwIxcmaa6J5DtUgbmgdFEnUYXF4S6CV
WOGxmlSCzgZrqjmYvZRa8ZHeVd2de25LeqWRBUXQpb3EXIvvOQCSPCVzaxknORCL
hAECHXrjwgXa7kdjdygapNLLGXZ0sc9fpOHQ+QpqdWb6+QG5iFTC7EX7io7rGHCl
AtYvUQJfXHiApKhLeAYgqXV7x1ZH6gKACm/Fn6nAqnWJapxYzD1HoIdJ524wEyt0
Z3zYBFh1ZTXAOAR4wX/3EmkjzUCJJI1uqvEqDD0d8JiIXtqLnbGejODFZGMCzu7q
Hy1XyaUxL1/dvHDX/3lpBOWHEnP8oe7c8XF53mxRggm4hDB2pYi/2+7VK+KDkJC1
2EQlVoZ5t+QEQzX85tknfJNVm7q+crNpj72q3+sZKnPP+B9Rz/zIDp5MLhHhkyEc
FGZBUvgim28vzruDIRDTczut1/ntkyQSlOusEKRTWfLWHfhDXlk=
=J7vV
-----END PGP SIGNATURE-----

--1/J06XLWWnwIzgIm--
