Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8642F7FC8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 16:39:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A119D17B3;
	Fri, 15 Jan 2021 16:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A119D17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610725187;
	bh=jmiMKqUhYgUV56CEyqWEjaONy44S8J4R6IkZiIQ8H78=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pumLtLylF0bt87CP4U4VxxR7xmH52SGiMHedEg+4w/dIU0ftLahVyGwqa0ptxBriY
	 Y46+zKAZwT+wjQndvueyebsHBjIPKhgncJnpd1OBK1QFtxgL8SjSy9F4qCjtrA00zy
	 58TZs1/NFrkAXTIn3wWc2t/wrt5n5qFhGmz2aJP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F85F80254;
	Fri, 15 Jan 2021 16:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27EEBF801ED; Fri, 15 Jan 2021 16:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 888A8F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 16:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 888A8F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EPKVdwJu"
Received: by mail-wm1-x335.google.com with SMTP id g10so7965070wmh.2
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5b7DPgSBw+PLnFB212Irl5YVoOfLu+csPTf9O74uU/M=;
 b=EPKVdwJuGj1VbFdUBazgO69B0h7687NLe68MSO6ZUmJ2AUPqvk2UvJR/8aym7qx+Xq
 QNvWPyBXd1Yr1p8sxrFBgyNoxOM+5/+b2Cr479WsrGlmTGbw5otUGgrF5OMOqFSYZvo3
 HpXjNryDtPgEqSTw4ImcUvbKzPTXYr3yyttmn2Alag5pMWJ6J1BH7RKEynSal+p0NlbY
 91wH+/7nM4mbn2CxxLBWZxtzfNBESM0oW4QfM9TEbzPzGFnRvH0X2ojoLrow021mM10V
 YQ2RQi55F4+Fhnf0efMGlxs6yk3Cchyq3O/DcwLHS6+4ohLtIQGFbQNw2+gMD16aflFv
 G66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5b7DPgSBw+PLnFB212Irl5YVoOfLu+csPTf9O74uU/M=;
 b=ndT7b3VcE0Z5D5pQMxIr+bWtVePSr+P3h9ssgA6VnZVzTbprI0A+TUg9+T+DkcK1Na
 tb+iSAO77wSOg17mrMfqoT6iraY4byAqlsoL7FDAyXlBOlql2Gfcv+5zANiogAKqTHq2
 2L7cvAYSMKkS2wc9XdEutdT35P4XqT38UCPkNsAMnCErt6RmxGhtZ9zsc/sgvRpdou2p
 W+dn0QiORI9/Z8Nz5Nd/qK9FNd2LNTI2nsSI3fpztlqoUzI0rcZewaphtB7/PUwl5VyK
 DZKjingIjghV9Me4DxkhltWzWlxRoQMY/H4HvqXzq+ITrirY40vBswWwfqY5RT5dr9JA
 V91w==
X-Gm-Message-State: AOAM533998315UvVVDI0odvRogeGIDhuz/FnitUHwX3Qo+6cw3HAx3o5
 DoP9goWmKA/76fJCa3SFulE=
X-Google-Smtp-Source: ABdhPJxWwidm1sFec4GvA6yW6u8YSo5YyUE8W3w2dV2S30E8EVsCGAfkW69GmHs8RCQNFbbiO9kx7Q==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr9502162wmh.114.1610725082263; 
 Fri, 15 Jan 2021 07:38:02 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id s24sm8499895wmh.22.2021.01.15.07.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:38:00 -0800 (PST)
Date: Fri, 15 Jan 2021 16:37:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/5] ASoC: tegra: ahub: Use
 of_reset_control_array_get_exclusive()
Message-ID: <YAG211gFXExjp7Zh@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6qgUbVpa47g3Oipy"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-4-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Cc: alsa-devel@alsa-project.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Geis <pgwipeout@gmail.com>,
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


--6qgUbVpa47g3Oipy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:32PM +0300, Dmitry Osipenko wrote:
> Some of resets are erroneously missed in the configlink_mods[], like APBIF
> for example. Use of_reset_control_array_get_exclusive() which requests all
> the resets. The problem was hidden by the clk driver which implicitly
> de-asserts the missing resets.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 66 +++++-----------------------------
>  sound/soc/tegra/tegra30_ahub.h |  1 -
>  2 files changed, 9 insertions(+), 58 deletions(-)

Doing it this way is slightly suboptimal because now we don't actually
have a way of checking that the DT has all the necessary resets listed.

Can we not just make the list complete instead to keep the checks in
place? That should be a much smaller patch, too.

Thierry

--6qgUbVpa47g3Oipy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABttcACgkQ3SOs138+
s6FOVQ/7BeBBehhdaXuUwv219Wjebbw/decMS8FGhASCSSzdze7p8hQxkCpiVr0T
MPH1HJnwZQqBZUjQciF+Kp3/hycuFo8PO2zvvITuiO1eUIGMX3RKgket4TITv4I8
EAIkPYFRxcTjj7Tzc2mzD/f06OkxeMqsInlhXP8rNkswDnpOi8rSK13Cd2reVrh3
MKnc9gtV9pj4qi6r+epzFZNKP5+hAYRtCiC/Z7EnNfCAwWPmS1ApeZEPk36cwifY
6/PxzhGtsSvWqnPcjfV+6SzlZvNtwcOg0nYC3+VvTq1bxHdfdR3dvdRmWGy8vGQc
pb2T+TdnAVwFsYovqzNaPjM9iM5s6plj4saCGat5DLJprjvxAiTnKdMeckhT57pL
Li4rAOp3ZsW09VxD59PNZHkG7ERRv3gBfOEggxtxU4B+aijVgkhPq4kAaXjXMSSu
tP+Ss/y6vSQnP40HeHfysjrGZqtPfmvnrFo3jYz3HTZE1k6p4vc3Pv1EbYQAswhC
/gReNDddh5cxPYHSYP9Q1f98e33Ix+lEUFENZgVx8hmxE4ofxNAHx16t7K7CeV5F
eDS0UOtCreFMcYp0Fb1j+LM1gS6xrGhJaIu/REIdftamhF97Ch0GTURwhJhRKVKi
ef+PQEbSzK5gUb1KccngSAENnPKKahyhnxYLJfHyBvvs9LAYuB8=
=yHt+
-----END PGP SIGNATURE-----

--6qgUbVpa47g3Oipy--
