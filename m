Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404682F7FC9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 16:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64E7180A;
	Fri, 15 Jan 2021 16:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64E7180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610725201;
	bh=ToC4sCji7STRArg9oAQ0hXV2XlnAyt/+LtTjped/oLg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+eM9WbcWI+G0RTYRrAU8GbBQKajdcGGniPUpAl9IFSl94w1XbL23JDHGjGyMcgBd
	 HbGgUUauqqjD2K+pBDwqKtTiJ5RBSoAG5MqvQTJ9wAOCqiBHHT5GnE2/wkS0hhWqre
	 lEmB7lIDPMjL0N9Og83ysFqDlA/H/sCYoKb2c8PA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AFBF8026B;
	Fri, 15 Jan 2021 16:39:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F260F8025F; Fri, 15 Jan 2021 16:39:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C93D7F80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 16:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C93D7F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pJXdW7QQ"
Received: by mail-wr1-x42c.google.com with SMTP id y17so9698284wrr.10
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/h5xi6JSFXxPDZmDPtNhEjnaFAoil7BDNGSWIjoSRoM=;
 b=pJXdW7QQ6kBYF8E6jkwXjiwlpczTZMomcQ04mL60/18nqX0w5xWqKp0y6vjSsf20Wa
 xIbJL8iFtWzN05rRIHBoqsUZ8faOtY+UUk6ef57PkuhmAmQvUBpbpa6t4sNYSM+nm6UL
 Bb0O35QKgdIRGM0sjLb1wvxX3ELDT9vR51+63asVN2h2Ojv6GrKx9OXJyh7j75DhPBoY
 2msMADcTGzf2fE0cIf8OckmCkLb+lMzG/QazjBxBNEYaJ3diYS5lTDUBesZLjUICo2X2
 SpsRbYzCEVkFIWnvecE03UmhAIVnys86m9JAcE6ZGHa5zL/uFiIlXXne/9IdRTHhTnCv
 4BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/h5xi6JSFXxPDZmDPtNhEjnaFAoil7BDNGSWIjoSRoM=;
 b=Qh+om1Hw8TBzoHF55LQc65XCzDoDx0aoAW2miVt16Pd0ZtGKcDK/ETlrNwWlfL7Z25
 5kjVzgSVG5w4pdzhO6djyGAYHBM5KTX9j2L6NTqyNyfmC2i7zpZXbDPvtDZogSpFalwh
 OSJwFdh0L55SDPRg7Hf4IIasK40vEauuH6lMU0t1zjWOiec9TocFb0Siz77jjkbUGCsU
 zLl4QpJX5sVxEoTpoGj4RfoEGwXug4KTcCdAFpXhtK95z8eIDXQip3LAdILTQcWX+fH5
 F+D99uA7pOxzic/8hawZIG6vtKwZ+juSwcWekRlVjRmUh+rl5LZePl6IglBErfP4tz5d
 +TXg==
X-Gm-Message-State: AOAM530Z6Gfn/CtFRA5BQlEr5aarSDOhRdXoBXuj9hIdLKaTQnUl49at
 Bwayf2avUCbHCzjJ33rDq6c=
X-Google-Smtp-Source: ABdhPJyr5c/xCE7surzCbS9UR0ERv60lBS3fVhlOpAAjR/c6cgAhH+Fx7zLb4Yl0IABW5O9RArCdXQ==
X-Received: by 2002:adf:e9d0:: with SMTP id l16mr13063091wrn.376.1610725131875; 
 Fri, 15 Jan 2021 07:38:51 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id a17sm15069939wrs.20.2021.01.15.07.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:38:50 -0800 (PST)
Date: Fri, 15 Jan 2021 16:38:49 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 4/5] ASoC: tegra: ahub: Use clk_bulk helpers
Message-ID: <YAG3CeBI5h5VKqQL@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pLk3yZKzSBt2opqn"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-5-digetx@gmail.com>
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


--pLk3yZKzSBt2opqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:33PM +0300, Dmitry Osipenko wrote:
> Use clk_bulk helpers to make code cleaner.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 30 +++++++-----------------------
>  sound/soc/tegra/tegra30_ahub.h |  4 ++--
>  2 files changed, 9 insertions(+), 25 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--pLk3yZKzSBt2opqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABtwkACgkQ3SOs138+
s6F3FA/9HwpxJ6Gd0bLJNkzt97n9mABHQPT74u3ZzTK3+ubXqhb2oKBavGzauqv2
TvkFVI4DevDVhC7Hx6DxSFXcqdScwUk25FPcnsQD7TztY/kHu99NnnZ2gd5xfmoh
SgdxLNi70d/9t+6p96iTsVxURF3i7YxwtISUmxKnIPdShFJSRMaYu5ci+0vnobS0
3RffcDPumaDF+kWY2ZRv8QNqAYpfXhl5z31GlWfcohS0G5QsEGmwK+leu9s62WXU
DiNxytgaVMH2wnMTUxT0rdhfRlWN+alY9Aac9EMwVlAvlSP6KZTuk8kOtHgVwQXK
ujJWO2n4UWRRyk7cm/euk+eyAtmcd1MM7CzRwWM8ezXZEi1qBsQqNH+zw7z3ZJTT
dUMWDGWUIDCyTJoNZIOg+vJt/p1FXRsA5oeTlVqx5jrSOO1FAcuDdOu68jeoiTVU
9Rtbh/gc0MpZEzQ6OUcQEfR1g3A/ojud4dkpVvpvrNTL/t09BpOxZAN5+QrmOXm3
9WO5BCGAZoEp8trnBTYO9DTrelcp0r8iDpXjyhgSlXkQNFgY4j+pEfaBglTqr6zI
LfQ0reT+3OuhxCgADYjRow9NSb0xc+a0pCYogu46O9mkk+gDsGE0IplviMqdo9LN
QsYAK4mE2LFFqArbiJA9DvcuFs89Ma8CdQ4HBonIi+zpDVzX4JY=
=MMnc
-----END PGP SIGNATURE-----

--pLk3yZKzSBt2opqn--
