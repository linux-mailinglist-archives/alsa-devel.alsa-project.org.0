Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF042FBDB2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4219F18C5;
	Tue, 19 Jan 2021 18:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4219F18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611077544;
	bh=jj9nRak6dQY9I22vt/Ljetoj6wQ4+H3OidlEqdespxA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWx/Sj5RCDzvYTLOdiThyeFPWbsUVtDxWgqWZst1IaGrWOYd8v/6zMwdiPMPwU9Ft
	 gRXz1Drwwu6+rDqEuGxk4i8LlPablHIWFIHg5/cDKEfqPM84I9O2LsMWfOfjMcqqlb
	 k+HC8saTOLgzrBWJeHBe7bVqvq25ck5rqni34IQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79883F8026A;
	Tue, 19 Jan 2021 18:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FF90F80257; Tue, 19 Jan 2021 18:30:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C4DF80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C4DF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cB/cvOGR"
Received: by mail-wm1-x32f.google.com with SMTP id c124so511751wma.5
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nDyXlmZnRyCURD1JgXC1GjN+18/ZRktMLfCEGonjNiY=;
 b=cB/cvOGRB1gD5rc6vL9IgpaDCXgmftNI+tHoINdC6AkY39fyHjVEKIWETwsNn9a+K9
 2ptLMPA15AN0o/aquqG1B1u4a7ThvW2kQwhR+Rn9ByjrKDI1LuE+K+/x1i02hi2pRMmT
 e4XOZJUD18lVOOhSofGDpfYPntuY+nHbFNFE2gGK5fuxskKYrojUWzMc32eJ8gcQG3nD
 AgdXH+7YzVlhUFv+Ns3zs65pqvFht1Uuj4RZFm/iP/w7pyIt5RT0voiGYqH/ptx2ZymI
 Qg71NLESVLsIRhqxeaeoqbQN0nVKbynplj4Yuuldi3d4fn4gcglpyhL4hwVPRCyQ7Nqg
 InqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nDyXlmZnRyCURD1JgXC1GjN+18/ZRktMLfCEGonjNiY=;
 b=LzamHPzG5hPYY0dJQOjP+wdn9Uk59qL2ZIJNLHEqs68aVTPtC8+fYp7+wG0UtrppHl
 t5vTMt2JxCv8BVy2v6E9dZBb/z6kBHipeadsiwzbuLAa1xI9m9UBd8DA7g97G8j2MHv7
 kS6EjSC7PvAtP/WBk5kHyBIGaqm+JjgBdZDjKrUwWkD7qctAJ8ETzEVxOasl6UliPD8+
 UMz0hJ9XVz1IY1+eI9S7AY2suJokQJf/gUJqrXaLC0vtZE2gKeP0Gr7RmOzE6Uh6EIGZ
 jQP8GJ6MaD0NwlDBVowJmWfHlpsKHNCBW0ceUNmfx5TZwMqaNUbcLpB6ZfDlAj1U9b3K
 f5zw==
X-Gm-Message-State: AOAM532nIlRlDxvqFHNl1pkD/Ozk5dGdhl+LKn7yrh5HQjG0Gzfe722f
 Xjbjrd5dKQo/bvMIeTRyeLQ=
X-Google-Smtp-Source: ABdhPJxFo4IKI66fTtRW7gSBX2uD/raX9mtUo9KupK/7Dj8LSiAN4LhhRiY4DDdNxWwdEzmmGBaA6g==
X-Received: by 2002:a1c:e486:: with SMTP id b128mr649392wmh.136.1611077441676; 
 Tue, 19 Jan 2021 09:30:41 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 62sm5866498wmd.34.2021.01.19.09.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:30:40 -0800 (PST)
Date: Tue, 19 Jan 2021 18:30:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/5] ALSA: hda/tegra: Reset hardware
Message-ID: <YAcXP/h30ULq5OU3@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-3-digetx@gmail.com> <YAG2K4CjtCdSs6P2@ulmo>
 <e26bac65-7cde-439f-a353-3b960691096f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/klCL1aWdNUFUILq"
Content-Disposition: inline
In-Reply-To: <e26bac65-7cde-439f-a353-3b960691096f@gmail.com>
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


--/klCL1aWdNUFUILq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:39:37AM +0300, Dmitry Osipenko wrote:
> 15.01.2021 18:35, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 12, 2021 at 03:58:31PM +0300, Dmitry Osipenko wrote:
> >> Reset hardware in order to bring it into a predictable state.
> >>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com>
> >> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  sound/pci/hda/hda_tegra.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> >> index 4c799661c2f6..e406b7980f31 100644
> >> --- a/sound/pci/hda/hda_tegra.c
> >> +++ b/sound/pci/hda/hda_tegra.c
> >> @@ -17,6 +17,7 @@
> >>  #include <linux/moduleparam.h>
> >>  #include <linux/mutex.h>
> >>  #include <linux/of_device.h>
> >> +#include <linux/reset.h>
> >>  #include <linux/slab.h>
> >>  #include <linux/time.h>
> >>  #include <linux/string.h>
> >> @@ -70,6 +71,7 @@
> >>  struct hda_tegra {
> >>  	struct azx chip;
> >>  	struct device *dev;
> >> +	struct reset_control *reset;
> >>  	struct clk_bulk_data clocks[3];
> >>  	unsigned int nclocks;
> >>  	void __iomem *regs;
> >> @@ -167,6 +169,12 @@ static int __maybe_unused hda_tegra_runtime_resum=
e(struct device *dev)
> >>  	struct hda_tegra *hda =3D container_of(chip, struct hda_tegra, chip);
> >>  	int rc;
> >> =20
> >> +	if (!(chip && chip->running)) {
> >=20
> > Isn't that check for !chip a bit redundant? If that pointer isn't valid,
> > we're just going to go crash when dereferencing hda later on, so I think
> > this can simply be:
> >=20
> > 	if (!chip->running)
> >=20
> > I guess you took this from the inverse check below, but I think we can
> > also drop it from there, perhaps in a separate patch.
> >=20
> >> +		rc =3D reset_control_assert(hda->reset);
> >> +		if (rc)
> >> +			return rc;
> >> +	}
> >> +
> >>  	rc =3D clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
> >>  	if (rc !=3D 0)
> >>  		return rc;
> >> @@ -176,6 +184,10 @@ static int __maybe_unused hda_tegra_runtime_resum=
e(struct device *dev)
> >>  		/* disable controller wake up event*/
> >>  		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
> >>  			   ~STATESTS_INT_MASK);
> >> +	} else {
> >> +		rc =3D reset_control_reset(hda->reset);
> >=20
> > The "if (chip)" part definitely doesn't make sense after this anymore
> > because now if chip =3D=3D NULL, then we end up in here and dereference=
 an
> > invalid "hda" pointer.
>=20
> Okay, I took a note for the v3.
>=20
> > Also, why reset_control_reset() here? We'll reach this if we ran
> > reset_control_assert() above, so this should just be
> > reset_control_deassert() to undo that, right? I suppose it wouldn't hurt
> > to put throw that standard usleep_range() in there as well that we use
> > to wait between reset assert and deassert to make sure the clocks have
> > stabilized and the reset has indeed propagated through the whole IP.
>=20
> The reset_control_reset() does the delaying before the deassert, i.e. it
> does assert -> udelay(1) -> deassert.
>=20
> https://elixir.free-electrons.com/linux/v5.11-rc3/source/drivers/clk/tegr=
a/clk.c#L133
>=20
> The reset_control_reset() usage appears to be a bit more code-tidy
> variant in comparison to delaying directly. But I don't mind to use
> delay + reset_control_deassert() directly since it may not be obvious to
> everyone what reset_control_reset() does.
> I'll change it in v3.

Thanks. I know that manually having to add the delay everywhere seems a
bit tedious, but I like the way we very explicitly only ever do reset
assert and deassert, rather than the combined reset pulse, because the
latter can give the impression that the device isn't actually in reset
when we do reset_control_reset().

Thierry

--/klCL1aWdNUFUILq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHFz8ACgkQ3SOs138+
s6Hyxw//SGrLuWocfMwUkHmxiyxq+LvXQERK6nWL9L0e+TX2eHKm68l8j3eCsY/t
gMEXlaF60LxIqyVvah+Yg3uXAhiHOGzdeFWprkstQ9XKZZKyqjOpK9fUuzLwSa5m
WXMti4whOfk3g5eQsotpK1C0pdY2cdfWzYyUFGkDRnrBUK4KZZ2+iQXtHeT1tVaV
LzgYRXvzMX8dfCQYJx0w8wnEs3PGbIa+K1XsVpK5LxpXZe91LV4aaYRJZw68PHie
APKx9lVi+gMwpYLtkPmGtkdT+stLMicaAccPHY9TBpYHzUbGFAVSTxWOM0j92efr
JXkHOkRJy8W1cs0cl3CCz+b4XM/1CKjHIJpB9Z0fwymX13iCm2zKVEKDKxJBfoLV
gQAWcJc7A0bjPftSk4cyeth3YCasQ7c/JXKDtNQVrXOYuqKmHBRq73gOZPtU/5mU
ndwpZT72SBKf1co8GWGiq0sVTlxHQy7WgfscxxVHphzeuKCyxZHN+SsEAzID154p
KIrRsSbp/L8AD0Mck/rPxPDapbH15Zlng5D4AothCnHoulVARtZLIpuxWxY0l84z
Ud84sqD8vI3HQ3HtkbkkZKEcIZ//kJ7HhfGs8qEeUcX6arb/hb4tak/VYzraturM
vSAFZ9a/joyT2zQlByjJsgunHfkyf5mTJuWWd0xIHiSZ3k9z3BU=
=eV6P
-----END PGP SIGNATURE-----

--/klCL1aWdNUFUILq--
