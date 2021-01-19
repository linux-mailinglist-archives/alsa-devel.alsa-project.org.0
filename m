Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B0C2FBDC8
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A7418CE;
	Tue, 19 Jan 2021 18:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A7418CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611077772;
	bh=H/THdVmSdhA3Cl0SXsGlx/ZUHg2eqhfs/DWMqOqSu/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XbsMMItLiJae3GbpQivWK6LxgFfAKdxPJSNZ18b9cdSCzNRO7AUX3a9GoOIT6nR6A
	 82DxdI3A+PmKeRJeSTNe2heJRbjZCrdcnV8ZO6iJ8d+C3SwMEZzRz0+pDUZaenWhcl
	 W70VjKXnJfWo7J1kAaKIf02MOU5IPZmMi5wV8fQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86FB1F8026A;
	Tue, 19 Jan 2021 18:34:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0031AF80257; Tue, 19 Jan 2021 18:34:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C50AF800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C50AF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UURw0+UW"
Received: by mail-qk1-x733.google.com with SMTP id k193so1517860qke.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=p8tNnzd4y2KJS/reGqJBwxz1GlmlM3VOZcIG7Ld49os=;
 b=UURw0+UWpe4aBZNtUILUdnwTTMO1z8WUJzSWZTGPjiftc+oGCvSwte9YNL490jXhJF
 ZMnFHWbUZvKenzQacEy16CV4FbJg46GhIqUCnIO0yYn9wMYUJGFlVcXLubVyORs4HKsP
 mLqAhRyj5m8cezm5qBLezA//8tM/X71+wPf+pPCQpUBxJMijzB/j9uhLLPT79r0c1QTS
 Gt3nRfyb3gZvePzLJUZYU1ZIDIsP1+lCmEYFlB69v48s30WDoXChwvgMl2R1vd22NIIy
 v7UVbFSGJenO3HurJUww+WAwho2Q23TYuIC2HUknAjJdreqZSa91bxJgEBzKIZcMgk6R
 2eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=p8tNnzd4y2KJS/reGqJBwxz1GlmlM3VOZcIG7Ld49os=;
 b=CL04gv5JaoVGh6HYCAGdSTfSuF/PBRVEAep+nzCvfh7+PthuUQRKeHeTx3Ck1oOLW8
 yj//le45cXFmkN1HgUzy5ZKjFfg5DB7pYjRGNFnZBnRXvGPwEmHjjzDDW1ClZlsM8DqY
 dDHzY6lbEm5OqTCF1suhcupGsfYey6YkcLoeL0PWMpUyFiwXN3j/j8LDs1axO4nMAiJK
 SJPx26BRdG2Apde7Y500mOnIYACEk4RVCJhj1Jn2sVdfSSQ2QUFElCAozXmumrwlqKlv
 zxv/YrOaueveeRHBkcqPyjWSxq7e3Q9l/rQZcb7DSqF+84KS9O82NotUgSMoPMWLo/7f
 7Ggw==
X-Gm-Message-State: AOAM533+KiCgORrqBepk4roLcYoikE7XgY5SKdms92HJJ2joXn2lfdVO
 0bZsTv1PA9KZHCX3PcCOqGc=
X-Google-Smtp-Source: ABdhPJxnBhaCimzZgQX62uN2ZXLlnTeBj4V52zrzuS8102pthkDV0hPys/7gF47J3dljrPwAm+Gz6Q==
X-Received: by 2002:a37:a110:: with SMTP id k16mr5462338qke.320.1611077673854; 
 Tue, 19 Jan 2021 09:34:33 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id k141sm13376514qke.38.2021.01.19.09.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:34:32 -0800 (PST)
Date: Tue, 19 Jan 2021 18:34:30 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
Message-ID: <YAcYJpb/Zf7IKZp5@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-6-digetx@gmail.com> <YAG4aFADwo7dh/oR@ulmo>
 <c2f3d149-0781-3d0a-1d68-f6820386e84d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gssaDyI1tNRHdKsC"
Content-Disposition: inline
In-Reply-To: <c2f3d149-0781-3d0a-1d68-f6820386e84d@gmail.com>
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


--gssaDyI1tNRHdKsC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 03:02:38AM +0300, Dmitry Osipenko wrote:
> 15.01.2021 18:44, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 12, 2021 at 03:58:34PM +0300, Dmitry Osipenko wrote:
> >> Assert hardware reset before clocks are enabled and then de-assert it
> >> after clocks are enabled. This brings hardware into a predictable state
> >> and removes relying on implicit de-assertion of resets which is done by
> >> the clk driver.
> >>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com>
> >> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
> >>  sound/soc/tegra/tegra30_ahub.h |  1 +
> >>  2 files changed, 17 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_=
ahub.c
> >> index 4dbb58f7ea36..246cf6a373a1 100644
> >> --- a/sound/soc/tegra/tegra30_ahub.c
> >> +++ b/sound/soc/tegra/tegra30_ahub.c
> >> @@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct devi=
ce *dev)
> >>  {
> >>  	int ret;
> >> =20
> >> +	ret =3D reset_control_assert(ahub->reset);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>  	ret =3D clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
> >>  	if (ret)
> >>  		return ret;
> >> =20
> >> +	ret =3D reset_control_reset(ahub->reset);
> >> +	if (ret) {
> >> +		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
> >> +		return ret;
> >> +	}
> >> +
> >>  	regcache_cache_only(ahub->regmap_apbif, false);
> >>  	regcache_cache_only(ahub->regmap_ahub, false);
> >> =20
> >> @@ -462,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_devi=
ce *pdev)
> >>  {
> >>  	const struct of_device_id *match;
> >>  	const struct tegra30_ahub_soc_data *soc_data;
> >> -	struct reset_control *rst;
> >>  	struct resource *res0;
> >>  	void __iomem *regs_apbif, *regs_ahub;
> >>  	int ret =3D 0;
> >> @@ -475,22 +484,6 @@ static int tegra30_ahub_probe(struct platform_dev=
ice *pdev)
> >>  		return -EINVAL;
> >>  	soc_data =3D match->data;
> >> =20
> >> -	/*
> >> -	 * The AHUB hosts a register bus: the "configlink". For this to
> >> -	 * operate correctly, all devices on this bus must be out of reset.
> >> -	 * Ensure that here.
> >> -	 */
> >> -	rst =3D of_reset_control_array_get_exclusive(pdev->dev.of_node);
> >> -	if (IS_ERR(rst)) {
> >> -		dev_err(&pdev->dev, "Can't get reset: %p\n", rst);
> >> -		return PTR_ERR(rst);
> >> -	}
> >> -
> >> -	ret =3D reset_control_deassert(rst);
> >> -	reset_control_put(rst);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >>  	ahub =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
> >>  			    GFP_KERNEL);
> >>  	if (!ahub)
> >> @@ -507,6 +500,12 @@ static int tegra30_ahub_probe(struct platform_dev=
ice *pdev)
> >>  	if (ret)
> >>  		return ret;
> >> =20
> >> +	ahub->reset =3D devm_reset_control_array_get_exclusive(&pdev->dev);
> >> +	if (IS_ERR(ahub->reset)) {
> >> +		dev_err(&pdev->dev, "Can't get reset: %p\n", ahub->reset);
> >=20
> > I didn't notice that the prior patch already introduced this, but I'd
> > prefer for this to either be %pe so that the symbolic error name is
> > printed, or %ld with PTR_ERR(ahub->reset) to format this in a more
> > standard way that can be more easily grepped for and parsed.
>=20
> This is already fixed in v2. Good catch anyways, thanks.
>=20
> > It also seems like the prior patch that converts this to use
> > of_reset_control_array_get_exclusive() is a bit pointless now. Why not
> > just move to this directly instead?
>=20
> These are two independent changes. The previous patch fixed the missing
> resets, this patch changes the hardware initialization logic.

But moving to devm_reset_control_array_get_exclusive() isn't really part
of the hardware initialization logic change, right? So it's not strictly
related to the rest of this patch.

Anyway, I don't feel strongly about it being part of this patch, so feel
free to keep it here.

Thierry

--gssaDyI1tNRHdKsC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHGCYACgkQ3SOs138+
s6E2pw//fpPwc7rRFuwtI+fpGYhR9bkSJGAsW8c13WeGUXpmIBG24DNPTMa5Dwjr
dunxgN+tl4MRPvegW2vqWIDy/Gasxcp1eCryiYSal2W3UsDSb3B8DO/6zo4l0jUF
XjLRslsDLVlXPvtiKLTeIAV6xbWmvjXvYLv0kZ6KrPj61PmSdejglDq+WqhG+mZu
qYodRgqRCByrfjVhR1pvTtARbSZl+iQLsb9RhomzsB/bJUITiIu6+/ZVi+r/i6aR
xj7mUu9YKkTmpVVi4Wv480Tuq2+u5sZc569FA6utPWAEelPdiFpDJrEjz6eq9Ouj
ImjgMqZwFsERkJaAb35BU1eXn+VlylLjn8L+pzfGj2zW3TLrQ++Be7UY3iftlhrD
qYssfr1rQmElNd1UuCWDDF5fyp1T423mxupboWmrai4iIAe+aUmgXlZZfHQaaI60
5I4niaNihm9R4ZzBlkGvS7p93/dmSHY5MMAyTDMLrGXzt076MGcWezBk6P/jAW+m
/hwWBXaRnf1E1v0BYX89P8pHUIr07LhmeYTu8IJGTna0IiLexmDrzh1U7gnw/MUk
SbRFMYKCm4x5P3DSk9AnKo7R4yWavYohy9GMFVCQA48HLKAukKWLiDc1ayalNPf/
Cb7exez/22oxAeTG+OWRH26o41R727BtXkl+SCP0tLj6X9urpQw=
=ejHG
-----END PGP SIGNATURE-----

--gssaDyI1tNRHdKsC--
