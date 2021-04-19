Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A351F364676
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 16:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EB1166F;
	Mon, 19 Apr 2021 16:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EB1166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618843952;
	bh=0UyoH+OaRAeWa63CxSbVHTbKX8i6QBHskZs+CPJy9no=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8o3YPf0SEkQQMEkT30PP6FU0/5kk+uPp5QBKoPiINCe7X63/6OFZuVeEzNbiUFVn
	 YvLwMnZZPD0UfkCnj/Efjw3HoUFjzzTnAGiu65BIc5+WUa+32+krgM9XmrQATXalrw
	 MYMbuzEEWLmIQG6e3e766JOLllXNf/DkBqewMnus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC13BF8019B;
	Mon, 19 Apr 2021 16:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A76D7F80227; Mon, 19 Apr 2021 16:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CCA4F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 16:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CCA4F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ntDHkU5k"
Received: by mail-wr1-x42a.google.com with SMTP id w4so30634107wrt.5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DIGmEW/vcq4kZMsRXR+iAqjCi+nWjUL/Ybzjfr/TH9s=;
 b=ntDHkU5k0adFuq4ulHWrLNwdV5tvw5/Bb3S41mgYueUJMEYgF8YjhEfGUQVjK1FAPv
 JNwJYpT1jOFhKiR9uEID7jn9y/iN1s/S7/3z0ru/lPW11cFQ0DbrFdCSp5oLE8teHDIq
 VSYGKCP/Fn0utDDr9sQSkwUMtFFO856kq/u4DZY3ZxC5oyqoD5vfZSiDeFUK3UENAoTF
 wpN7f5dmxQO/ymVwZ2edu1NbkIrMP5TOBEp0DyVF3cBaxgKFXjag70seEnxShbgda2Fr
 nqqjjOPAXZcKgtjGqOBCPwCZzSseqVadCJtbN7WCOoEvaTdk75K/GdIa0/bSQx61PFAC
 yUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DIGmEW/vcq4kZMsRXR+iAqjCi+nWjUL/Ybzjfr/TH9s=;
 b=Mv3nSzoBlhamVddOay04fZLs0h5k1I/LukHAq5TWVPnaurP0P4lP6+Tw7ej+tFLXNr
 HofxMRTV5meQ+4JuaqYTnXSmvTbcsCUsPahWrua8LnoeuiYubnn1b50MSyKbUblorJ+o
 yD2KGfZN9EsSReMSfNdFcXrokauhcLjM7/aeJiJkyTKTzfznzrcUukLnUsXF2e04NCLk
 8jswp2craeYLc4LN7xK62tGWGih/taoUaGdPR+vYcA9gzajtzgzOQ/boV8FpJS8bpkf/
 /S0jb4a8iMroki08SUvvp0BUCLRDN7b/VMvQfEeszPotpbyMaGGJIikDWgHYnuxc0IxX
 FV2Q==
X-Gm-Message-State: AOAM5308+BmyZG0+alIPGWVjeNoBelff3spQG/vHXbGmNKHLzNoj/AHO
 6ItgWOVqQBwcATnNxTO+qvF81vkJvZc=
X-Google-Smtp-Source: ABdhPJx4uP8qa6y0FNCUUXKNVyhVzXldoYsXPkr7jPV7lGwcVHbeGbuS4ldAvlT3+Wqv935bJOcsVQ==
X-Received: by 2002:adf:9567:: with SMTP id 94mr15033446wrs.401.1618843857154; 
 Mon, 19 Apr 2021 07:50:57 -0700 (PDT)
Received: from localhost (p2e5be10e.dip0.t-ipconnect.de. [46.91.225.14])
 by smtp.gmail.com with ESMTPSA id n9sm19406460wmo.27.2021.04.19.07.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:50:56 -0700 (PDT)
Date: Mon, 19 Apr 2021 16:51:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/2] ASoC: simple-card-utils: Increase maximum number of
 links to 128
Message-ID: <YH2Y/rd2/q5qHvnz@orome.fritz.box>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
 <20210416071147.2149109-2-thierry.reding@gmail.com>
 <8735vn59sw.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iMzAVtxpDlqW14Ll"
Content-Disposition: inline
In-Reply-To: <8735vn59sw.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
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


--iMzAVtxpDlqW14Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:42:55AM +0900, Kuninori Morimoto wrote:
>=20
> Hi Thierry
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > On Tegra186 and later, the number of links can go up to 72, so bump the
> > maximum number of links to the next power of two (128).
> >=20
> > Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Code=
c/Platform")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> (snip)
> > +#define SNDRV_MAX_LINKS 128
> > +
> >  struct link_info {
> >  	int link; /* number of link */
> >  	int cpu;  /* turn for CPU / Codec */
> > -	struct prop_nums num[SNDRV_MINOR_DEVICES];
> > +	struct prop_nums num[SNDRV_MAX_LINKS];
> >  };
>=20
>=20
> How many numbers do you really need ?

As I mentioned in the commit message, the maximum I've seen is 72.
Rounding up to the next power of two seemed like a good idea to give a
bit of extra headroom.

> Because simple-card needs many parameters,
> thus I will get below warning.
> # It is not yet happen on upstream kernel, but will be
>=20
> 	warning: the frame size of 2280 bytes is larger than 2048 bytes [-Wframe=
-larger-than=3D]
>=20
> This warning doesn't appear if SNDRV_MAX_LINKS was 64.
> Can we reduce it ?

Reducing from 128 to, say, 80 should eliminate that warning, but I
wonder if perhaps a better solution for the longer term would be to
allocate this structure on the heap rather than on the stack? That
way we don't risk triggering this warning again in the future.

The data structure seems to be only used during initialization, so
something like a kzalloc()/kfree() pair doesn't seem like it would
hurt much performance-wise. Add in the devm_ variants and the code
complexity should also remain moderately low.

Thierry

--iMzAVtxpDlqW14Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB9mPwACgkQ3SOs138+
s6ENKxAAkw5sPV/Q2SbHVc3kGcucct8r8qVGXa44bJNevX3NB64616yyVavBG46U
xCcoLWoPvCJLpD8rE1EGDUBcF79qPWt4SxIOmAyveQyT5lFO3DH22vnyqh5jA3fP
XFAYK3bMgLpM6Hz32ffhmaWzpTacIDOd6Zr+l99tCEiXpq7VjB7xLioJyTCSOXMo
lVt5MNCfzySM7aOsOgxVpiNC8QjsEZSbyOfdFoM+UspoCFoe1Jg13gBqgWlhZNFh
Vqx4bvlfoqMtTBNCBjcUB3XKAsrRWDhH/QfTjb8T2r+1OHnkFT0P3B+a5dp5fF/M
idH19a0x4u7xhz9tiEzgLH1CoIGkwBEjtXe92WFuyAh3/vl4UHoNW/ffx5g3zrca
Lx49CS1llv3R3WoluShEqBxPI9tmv3rEO+HB/ps/DgFB2FPm8Xiu/l9p1yxzBFuj
YeySyq+DUy7d3E8r5Lfp5HN6QBwXLdna5hGHl13yz3pu/jeFQ4PO+7IvjIgD7vNU
mGkT2NziUxtdI5WXgmA4yFXUC4SxaATRD+81E1Zx5jz8LbKGG0GBvT+D31399QJC
/hlro1tCi5bAXeM7s57Rhqhhl41yNX/BDky4+wYG3qlOGXda3sZFa66keFcjcara
qYkdlNRYMF4IPX1BDOZqbAqucIbjwAZpO+lzLsTEvZA+MBr/VPU=
=wbaQ
-----END PGP SIGNATURE-----

--iMzAVtxpDlqW14Ll--
