Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D24775CE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 16:23:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44A7215E;
	Thu, 16 Dec 2021 16:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44A7215E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639668204;
	bh=fSZRg2xC5uqIf95n5IwJhjWatiK4rKAVhcOfq6vsp7k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INLvwbU2hBXSnuE6kjlke2k6MM4WEDokoa9uc4kx8O1DjoV06gH9569dFl1f5IWgx
	 Cqff2qhzA3GMk9+KD50n+5MsuwZ70XTLkqabn+ancWXgrTvNTuUptieXuBenekbib1
	 0YwMsz4YO3h4EWIZWpfcUC036FO9PkB9QdE56x+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84096F8027C;
	Thu, 16 Dec 2021 16:22:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A19D1F8025D; Thu, 16 Dec 2021 16:22:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48622F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 16:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48622F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RiN3+7h2"
Received: by mail-wr1-x42b.google.com with SMTP id c4so44827276wrd.9
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 07:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N9lKomucSEtgpalX3CqQQafa6o2fb76nBfcohaSv2i0=;
 b=RiN3+7h2+dS25INC7Gf8BPfoVCcvRFVUUth9najkqFWtZJ2s8mxTX2aUm8atU5pMez
 AbW7FHEhmPgLXQk9znLFEESxZDcVJ6XC6FDF6ra5By+L3VlxNN5HWrzvj/7oINATJVH5
 T4PF2Kiot4lISiQvsUdMBPAFGp5adygEESAiVXmYM7unQqdBh3ueVghRDHqLHcii0VCs
 g82F3adcpyxbequgS/D+baMYsQLAEbFQNUgtDLxFLem+DkU+Qm7TFR2mg/Z0yCrrrRMN
 FK7l0JsP8J9Hurf3AnTxjix62NgHc0tKl5/97nXE0yTxhvy+LGCJrG8EUUtusW5b3LhD
 OwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N9lKomucSEtgpalX3CqQQafa6o2fb76nBfcohaSv2i0=;
 b=yKlXfhsB1ogtFv/aZYgQo7/2qnO2NOPIXQt6AngHIegkTZTMvUvQDtkmzBOBjb7N/R
 cj7ew2Hab5V8MWesgj9H3dTOk5lEOV9PS0PAqdREJkfCE8/pH4QbA2xNvujnULvy5Tab
 GCz52qPRwtohq/NBts8oUpEc+ga+Mv/v4sJXuYXuF+6VgFxNhKDxz/hEML8L7aNlGLzx
 KstTVMYg0yklCW9E4KPVWRMcZ5X1ymDUHG/f/6Or1aBBe639u2nGOMuMjbwTvypXhuDM
 pIzTejUqfkYXrlqYml6L7EcL6hYDMxG48ehk3QDMxClc/SuWwtfhdGRwvXeI92h4Pp/t
 cbvQ==
X-Gm-Message-State: AOAM532WioQDhsgCBsh5PjRvT0VOK2cA2+cVrm5gmv7XuK1ZwPDa7Sq1
 G2/K98sVQVVUM9Yohxo3I/A=
X-Google-Smtp-Source: ABdhPJxx/CpIEkfJ7mExMh2hQOZZomkvt7McXghXR6da0L3qO+ST232+y0rAS8ozWZflFbx29kYq1Q==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr8352497wrn.93.1639668145306;
 Thu, 16 Dec 2021 07:22:25 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id w15sm4921670wrk.77.2021.12.16.07.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 07:22:24 -0800 (PST)
Date: Thu, 16 Dec 2021 16:22:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 10/22] ASoC: tegra20: spdif: Reset hardware
Message-ID: <YbtZrOtns+Fk5tEF@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-11-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kmzUbGK/nRGQn6lv"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-11-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--kmzUbGK/nRGQn6lv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:13PM +0300, Dmitry Osipenko wrote:
> Reset S/PDIF controller on runtime PM suspend/resume to ensure that we
> always have a consistent hardware state.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra20_spdif.c | 32 ++++++++++++++++++++++++++++++++
>  sound/soc/tegra/tegra20_spdif.h |  1 +
>  2 files changed, 33 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--kmzUbGK/nRGQn6lv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7WawACgkQ3SOs138+
s6Ef7hAAvN95siU/ogWUCn3U5jvV2xqxZXBwjimV0crLNHF0/o0HMkgZpuSC5RtK
G6Xk2Od6WsmYkIi6fr+YcyQ8dywvI29z7eRg/nbyEduda5lFZKVXCMSTUt1wZmac
8AKSgtpmXhNRECD2+rmES3sc//gh5mY4PrV/DNY67jFvo7IzDuSUeWoq9SU6bjOS
VMFyC/LD6ClzTWHxntB9LctBRk8E9L/tGF/j7vyHTa2CS2Fh/o0dD7Y8W6pnNgmN
0af4NDx5gox9CTwmCd7x61kU3Fw22v2AujNAGbQ53pjasgtlaH9Eur0zE17Bnp7r
f0l3Zp0CtVvMb+WPygM+IR1+ZmxGqL2ohc3SoZqswnNQDNljlfqoiMSzx2yEGrKe
1ZLDxDZLSzTHKCnaJEFhDUzlscGqMBMVOibheflHwWfxJk82nkzEs+ac4FA5Xmh8
a1VEfTQ0kyfJgCiDxAt3H90mGAgofnuyfcXgP9s2bm1NdYjXBE4gyZ4NzCT878kJ
ogE9/DrcbPI+K3sq/OjLEZrZAjwLOAf1OHcmF4QsFjJac7CNuJKLoTgDsN/yB1jG
OLzAqPpIVFzh4uf+k4liyoFAlDSrLpR3iAF9p6uWuCdvD+hQEgzuty128FS2AwA9
wnjLdUHoMcsbMAYI156l91YpYswWloVZHZQYbvRbhoKfsojNzs4=
=NQYq
-----END PGP SIGNATURE-----

--kmzUbGK/nRGQn6lv--
