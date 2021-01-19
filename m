Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4612FBD53
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:18:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC4418CE;
	Tue, 19 Jan 2021 18:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC4418CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611076705;
	bh=vH6ify53jJZxp0r9WrGZFsNLOsIkb4JC1wf2N253h2M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pW+KL7azkmTTn9hY2BKohmLLHqK8pC7Wdgl8rYlk1LY8oMXALSQ00zY40zKBaC62R
	 Du/e/3daQ62BHDSQpkp23rysJPo8+p2mCHuXfk+Cw44TTdLPPVsCcwZJ03TKP2ivdi
	 8sc0oI4dylYgqzj8UHf53l468JZdCipYW+DN4R38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16195F804CC;
	Tue, 19 Jan 2021 18:16:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C276F804CB; Tue, 19 Jan 2021 18:16:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DB6AF804BD
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:15:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB6AF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JFx2kpR6"
Received: by mail-qk1-x72a.google.com with SMTP id z11so22549965qkj.7
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/Wq4qZjE/3PIn7FnaG2ZyC5WlhiHEngk1+PS8fgItLE=;
 b=JFx2kpR6qED4GlcB1JBdL5pzb/N3debM49RiAn3r7cD6kOxykr8h2jV+oZtcfVmtDv
 bl/NyyyYuuaeH/1X5rZ+hzMOFCj1R3DC5fRote5OwHhGCh+6sXR0tLGauMdV/2ZMJLZg
 XlM1/CS1QvD/r1jDrwt/QRyvGdBkp4eXu44ypOEoLpwsKKgZyxZyDWzI/GdmzIdyvml4
 3sU6NxKqDlAJvEfceK2wGe/Tp1i+BKjl6vt2y8i+IXD0z8Se2skSl36xrWsLyr65k6Z4
 h4uVH0458HyM/qP9HCFsQJseKhbIEkeuBIILcLiE1SJGlfIjGkqHkazxbKE775/8sZZ+
 wj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Wq4qZjE/3PIn7FnaG2ZyC5WlhiHEngk1+PS8fgItLE=;
 b=dGdueNs4gvYHcJJzKuYlptJpoaJ5VjlH5IEwo8yd0/GYwdov66oYxJWWmb03IxDwU5
 omGBY/l/W0kelOzyhR4vgW/dRLNB1JKiRGMkWz4gTbLKA6QN1yTBlDPDk1mjmKdSztTo
 YUyS4exLbTiLOhZrR+4D/FCWWBeNI3AumKk28RnTPWziuoLTsF1bExh/wn4jzmwxrWWK
 Z6YlnNbRSO3PAvT6lqoVNpJ9lTLv6o0jS4BjyLXDAXNUxW4If5b4A4F1D4oq5UAt2JX0
 JEDnRzjVjp4pOOAcFTMO4PUbmZ4jbB0GYirIJEsp5wERMrxaaXoziGSN3S2qwXMzSlUY
 mLbw==
X-Gm-Message-State: AOAM532Th2QW5simA70K3l5P2f/h9DA2qfNcwIykws2ifylKkKB+V5Kq
 NeWJO3FVktynsXfKHH+Bqg0=
X-Google-Smtp-Source: ABdhPJycqx06CLHOtr8yYwKPAeyRnNsWmzo5DsVRoLEFQGnY+lx39eEbN/524ikbpYu5IHC3qNi4Kw==
X-Received: by 2002:a05:620a:12ed:: with SMTP id
 f13mr5362033qkl.497.1611076554637; 
 Tue, 19 Jan 2021 09:15:54 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k64sm13500696qkc.110.2021.01.19.09.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:15:53 -0800 (PST)
Date: Tue, 19 Jan 2021 18:15:51 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
Message-ID: <YAcTxxyogVgfN1uw@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V/me9ht3Hy4FdSi0"
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


--V/me9ht3Hy4FdSi0
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

I prefer keeping everything in tegra210.dtsi, but I can do that merge
when I apply, after the DT bindings have been acked, so no need to
resend just because of that.

Thierry

--V/me9ht3Hy4FdSi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHE8QACgkQ3SOs138+
s6HyRRAAr5aaieN+iwicZO0lllDEMbxrMSPQLW5lRPP/IsqHcVcSaInc2Xuoyeks
Q36vwKPpeHV4mWLwAPgunERnusPLI705z88oTVJnV1mXMiduyW2yfyBHdd6tpMZS
KX2rPHf1AoiBrvh170nem+ZCxjfqcMR4+YL58JjIpyXaPbfJ2qwnOuBDFKLU2uiS
yG3k6wyYsBBJWsS41rOya4dqNi+YpzGaQ7IE7r5YP3R0Or9RiEhwjE8xgXiLPVhM
YilIjWyv3Csc9yPsliO1WCriNboKL+BgClNQ4YELltr+mYbsSZwIzqXrApRwXJP3
6tuZA67Cmhmk9ghCxI2dljX+fkEks5lEIVpChT4GmF6vSbfF0kp8Sc+sIiGtkCRH
wx+30v+iqYLXN407FCL5gqiqzZPfIeAAKJ1pv7vDL+p4kqdiFHF0UTCvZoZKG4R5
FCsmesbdBCk8VjgfoHG2oFZ764r7uMdhrO1sTOryYEzqaUpEPh4dfHGye8OM9vYd
JvvEtllWM2nNLQ32sSKbvYZaRLVpqP3njGXp8qvTZ+TGkYDpTuHqYI2jpQmciq5f
gYN6k2z12Za8D82/QzEDwtgyLYayRmbFFIuaX7+eAjQBYSH6j2nEgwY4aOAUyXZF
Zmuw02HfH1lGSwdKNvQ60ynTniWrIfqxSlUVZQ9emj56wlkz8WE=
=if1e
-----END PGP SIGNATURE-----

--V/me9ht3Hy4FdSi0--
