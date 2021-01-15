Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B412F7F6F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 16:23:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2676B17ED;
	Fri, 15 Jan 2021 16:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2676B17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610724205;
	bh=+PO7Z7h5SRWORBDsI4+WSffmCJdEXkbZUApHlXk33ho=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ra4+UGpUIrD/EhXHRCE2qLF8zjiaY71VSQzqz+h1f52Z7iQ/crH7M+mNAmR1Lrc3D
	 1ouy+uL7boVDSJxKkYvRaDMiqShhSCgNJpsZYJ4SYC9Fg0eiqUVai99oQkNTMKlwSv
	 ddBLzFBhN+ImXMF1GebfmzxEwNWyhxGOYGAnI3qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2915FF80254;
	Fri, 15 Jan 2021 16:22:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 778F5F80254; Fri, 15 Jan 2021 16:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A01ADF80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 16:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01ADF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="utqjm9qz"
Received: by mail-wr1-x42f.google.com with SMTP id y17so9641922wrr.10
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tnfm7gtEx0dAkvKQ5TuqitkxF+T0R813w6cmMs8GDJo=;
 b=utqjm9qz9J3H29otHUpKGdu8lVrAt8+InF3X8ZZ/LGCQ0AV83RVue+M0xUaRGbiLXq
 u0aTdRK8SX3cLjGzLe+CVUzoON1DTM8vSFJCljdw1DDF0+yNdx4Id5OgYn8K7NI6CEsM
 64JdJkwMlsrHUrcxzrF3CvrySSprZfrw+bl3X4ZBwthSVtWFeXRhY9b3+ejEwwJcutPv
 B5udzGuwhebNP2LAawPaz0Xh5bqwOcikTQTKp12SKL/MGfHuXgjXYZUbXIu3ZH3OPCVH
 +K/m3Iw618n5JXyp8mmkum8DktQ9U9I+Y3RDY2c+oQ7iFP4cXs1t5EP3WVa/5aHRwBxJ
 d8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tnfm7gtEx0dAkvKQ5TuqitkxF+T0R813w6cmMs8GDJo=;
 b=nwyTagcTuYNmERrYgQx7dBlVUqdvEGh14UvM9bR28596vBE8EEr7WJRz82IiYym5LM
 3qlKDiS/UCvov2sH18Sy/wKhcX1t5qK9aX/RgpiVk7Snxkb4tbSFiBT/nxUwtNpb2sUI
 kUkVGs6rSEcDmRtPe6D/ZLZtG7OokaEWkeSRgyPUnJMklzm430P7UKAyr5VZxUhVm804
 1lt/wjEiZ3vUoIATJKb1hjJQOjb6eg33bgUCO0VQR9UkvnK/CjCc1sLldeg06dUk1zzd
 82ghZodFx7x2eRjZ3SAjMoYW0XAXUTThiaSPoaSmtCJ2FXGYBC9bKWJuyyAkzuNI0YYF
 ADWg==
X-Gm-Message-State: AOAM533KN226/mXhSiiB/Pa3lNakC1mAA4REKfOJ9aLrPyWbD1axV4R0
 hezDc2VCSluVyK7XhL/lZjg=
X-Google-Smtp-Source: ABdhPJypwvseEG8WGwKHgyd9YL/CM33D3wv7YiExANdkO1CSjgs9Zmr28/I0ns+6zYRhg0NAKWT7Aw==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr14168287wrt.404.1610724135173; 
 Fri, 15 Jan 2021 07:22:15 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f9sm17020621wrw.81.2021.01.15.07.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:22:14 -0800 (PST)
Date: Fri, 15 Jan 2021 16:22:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/5] ALSA: hda/tegra: Use clk_bulk helpers
Message-ID: <YAGzJM7BJqLV0xxY@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Au/hUgr6VFbvitZL"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-2-digetx@gmail.com>
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


--Au/hUgr6VFbvitZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:30PM +0300, Dmitry Osipenko wrote:
> Use clk_bulk helpers to make code cleaner.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 68 ++++++---------------------------------
>  1 file changed, 9 insertions(+), 59 deletions(-)

Heh... I have a branch samewhere with this same patch. Glad I can cross
that off my list. One thing jumped out at me, see below.

> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 70164d1428d4..4c799661c2f6 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -70,9 +70,8 @@
>  struct hda_tegra {
>  	struct azx chip;
>  	struct device *dev;
> -	struct clk *hda_clk;
> -	struct clk *hda2codec_2x_clk;
> -	struct clk *hda2hdmi_clk;
> +	struct clk_bulk_data clocks[3];
> +	unsigned int nclocks;
>  	void __iomem *regs;
>  	struct work_struct probe_work;
>  };
> @@ -113,36 +112,6 @@ static void hda_tegra_init(struct hda_tegra *hda)
>  	writel(v, hda->regs + HDA_IPFS_INTR_MASK);
>  }
> =20
> -static int hda_tegra_enable_clocks(struct hda_tegra *data)
> -{
> -	int rc;
> -
> -	rc =3D clk_prepare_enable(data->hda_clk);
> -	if (rc)
> -		return rc;
> -	rc =3D clk_prepare_enable(data->hda2codec_2x_clk);
> -	if (rc)
> -		goto disable_hda;
> -	rc =3D clk_prepare_enable(data->hda2hdmi_clk);
> -	if (rc)
> -		goto disable_codec_2x;
> -
> -	return 0;
> -
> -disable_codec_2x:
> -	clk_disable_unprepare(data->hda2codec_2x_clk);
> -disable_hda:
> -	clk_disable_unprepare(data->hda_clk);
> -	return rc;
> -}
> -
> -static void hda_tegra_disable_clocks(struct hda_tegra *data)
> -{
> -	clk_disable_unprepare(data->hda2hdmi_clk);
> -	clk_disable_unprepare(data->hda2codec_2x_clk);
> -	clk_disable_unprepare(data->hda_clk);
> -}
> -
>  /*
>   * power management
>   */
> @@ -186,7 +155,7 @@ static int __maybe_unused hda_tegra_runtime_suspend(s=
truct device *dev)
>  		azx_stop_chip(chip);
>  		azx_enter_link_reset(chip);
>  	}
> -	hda_tegra_disable_clocks(hda);
> +	clk_bulk_disable_unprepare(hda->nclocks, hda->clocks);
> =20
>  	return 0;
>  }
> @@ -198,7 +167,7 @@ static int __maybe_unused hda_tegra_runtime_resume(st=
ruct device *dev)
>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
>  	int rc;
> =20
> -	rc =3D hda_tegra_enable_clocks(hda);
> +	rc =3D clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
>  	if (rc !=3D 0)
>  		return rc;
>  	if (chip && chip->running) {
> @@ -268,29 +237,6 @@ static int hda_tegra_init_chip(struct azx *chip, str=
uct platform_device *pdev)
>  	return 0;
>  }
> =20
> -static int hda_tegra_init_clk(struct hda_tegra *hda)
> -{
> -	struct device *dev =3D hda->dev;
> -
> -	hda->hda_clk =3D devm_clk_get(dev, "hda");
> -	if (IS_ERR(hda->hda_clk)) {
> -		dev_err(dev, "failed to get hda clock\n");
> -		return PTR_ERR(hda->hda_clk);
> -	}
> -	hda->hda2codec_2x_clk =3D devm_clk_get(dev, "hda2codec_2x");
> -	if (IS_ERR(hda->hda2codec_2x_clk)) {
> -		dev_err(dev, "failed to get hda2codec_2x clock\n");
> -		return PTR_ERR(hda->hda2codec_2x_clk);
> -	}
> -	hda->hda2hdmi_clk =3D devm_clk_get(dev, "hda2hdmi");
> -	if (IS_ERR(hda->hda2hdmi_clk)) {
> -		dev_err(dev, "failed to get hda2hdmi clock\n");
> -		return PTR_ERR(hda->hda2hdmi_clk);
> -	}
> -
> -	return 0;
> -}
> -
>  static int hda_tegra_first_init(struct azx *chip, struct platform_device=
 *pdev)
>  {
>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
> @@ -495,7 +441,11 @@ static int hda_tegra_probe(struct platform_device *p=
dev)
>  		return err;
>  	}
> =20
> -	err =3D hda_tegra_init_clk(hda);
> +	hda->clocks[hda->nclocks++].id =3D "hda";
> +	hda->clocks[hda->nclocks++].id =3D "hda2hdmi";
> +	hda->clocks[hda->nclocks++].id =3D "hda2codec_2x";

Originally the code did this in this order: "hda", "hda2codec_2x" and
"hda2hdmi". I don't expect the exact order to be very relevant, but was
there any particular reason to change it?

In either case, this should be fine:

Acked-by: Thierry Reding <treding@nvidia.com>

--Au/hUgr6VFbvitZL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABsyQACgkQ3SOs138+
s6FoyRAAkCUvQ9bydbIYbQCgIODgmtk4NEpFc9gLUNSaSU1q6Rosi0xLJ73jJw2q
8w4X6TL9a1kc91y4DuIt+iMfP35eG/OY1fz5FsWfHZkGSwytqKZeiOZWq6mlOJ47
KT2LXeqiuDao04vW5USXuhvp9kNLlGOwDFZ32suVw1cOfKZYBG3gYTzMZetHfd2g
Ey+/quceJjpaOOPqCja7Fzysz0xTMfPuLZjy533q/qOwpLH1HSiiOQZXlEzruU1w
niOa7lo9z5kYplb+ubMq2JD3nP2oFMQ1BjZxPQeaZwFWtrCKUTDRa4upv3fEyDB1
l+v9loObsYuLxJrVTTIKaOh1vXr875Lv2DItLCXj+qPd1r+dvHwz3Ccf7XxlK0/n
XdWXa+CTUHY6DAGHlg3EWaaeYUcRfLP/v8Kw1Ydm6SCKIh8XapVNrfxqaEmDRSV9
yzJI0VTQw8ZHDAJ4W9Rb+vRiUcOeXiuJSbvoEW+72/5asspEiJIMyQfUtQUyibqS
eYgLmYk9Lp88dobozS9DexoP7xVwE9S66+alZ7k3+MxymWimmBoyRDwFUh2NatxB
9f3/aGwQ1+q0PZti2vpmUZfpPbB3xJxv1w1WnNAvA6Rpcef1RoRpkwXXiTt4lFVs
1OTsiV1mbKlCRos1I7DR+d7BIG8UhtBEBFw/EK2wBEA/J1uM7Ic=
=AaZO
-----END PGP SIGNATURE-----

--Au/hUgr6VFbvitZL--
