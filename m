Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D54B8CA4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 16:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B72A1A4E;
	Wed, 16 Feb 2022 16:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B72A1A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645025998;
	bh=bExTtRYQe9ibN8v7T/mapxztrVsnHZhQqZGMo38Nhz4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkvr3M9r/w6AwKxSsLwD4qsxbCfCzHj3SxhUy4tpvTOzHbovnO2TTz6rKSmhQazDI
	 gh6LLGc3oyHQGHPrR7IHXePxrhAemNu/BH0w+L0XhQCyAGUNfPj2HJ+JWDii4n2rMf
	 DSUO8d4TJA6YXU+PEGWLmQuVT4Rb+kBBbSrH0VjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AD8FF80256;
	Wed, 16 Feb 2022 16:38:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652DDF800C0; Wed, 16 Feb 2022 16:38:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC05F800C0
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 16:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC05F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lhN+u6rC"
Received: by mail-lf1-x132.google.com with SMTP id j15so4504913lfe.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KEZW6e1efTcHXRh6WOqzjxq0RuH5M2wijF9L7JfBlb0=;
 b=lhN+u6rCCCWeY4ErTHiQQ6smARxvoXiYx0KnB3kfEJ3IZU3/hgmvYlLFI0Crpeuot/
 6BrnFa3COa5yYAJ4z20etbqs4O1PKRaapkD8cnnyzYIuEoatIloGsTlV1iHoHJPdQzBD
 lxnvDtGjYRzXv3vUNjrhHSV3c7PmEmFKocPXj4InLNACCszd8VosHmj7teIm8vpCkMwD
 yBYpKiF4BaUYX2eh69aJCBf1raHfbKBGZUpjLH+UWOHuA0nVFod2F+yq7ZqkmfuJRJTj
 xKKQbnC4rjbtgQTczAmKh4CvYwolLOo4AH96vGDlhRVaGZRoDJ/NwLyyS9UIAjPuYNRR
 qq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KEZW6e1efTcHXRh6WOqzjxq0RuH5M2wijF9L7JfBlb0=;
 b=FfgIGVw9qjAKwCMzZ+495y79dSzOjIBmFOid4GvZ65FSaHw0nna4z/WuB+D/ZhSqo1
 KuFHUE7sVix6pcqivZjfhEJ5JyY1aBab8X4QywQgZOrXLYwc83GxLfvSlt6e5rOfMDah
 r24dG2iBQg7PdavcvKZq28ngYFa+1pRi6Dti6j+6hJK+GkWpTJgpzzxVdezz/MJDqOZA
 KZ/vZJ4178otnmWYY9TNi7DXkO0Ct6myR09AC76F8h/qvQX13JmsLV4S1G9+2W6idEF9
 4n8lFRdJf9FHpyKs8Un/JeEtlpa/Pn1/WKC4j4KsICR/+i36zqNJK6ih2e+xXf9Q7Rh3
 n9cw==
X-Gm-Message-State: AOAM532xiDto3c6L926Wckteu+y+g8SV6xBMhGsTE9qkrLBntZKl3Z2h
 iIB2tbEPMUlvuhphwl5JN3U=
X-Google-Smtp-Source: ABdhPJy/8UaiZCs8aRsOZbhjlEMUIkuuB6Q8CB3lu4EIBCLwC41YZqHErg43fwrB4s3utLb+2nPfvg==
X-Received: by 2002:a05:6512:32c9:b0:442:4c65:57c6 with SMTP id
 f9-20020a05651232c900b004424c6557c6mr2426546lfg.78.1645025890452; 
 Wed, 16 Feb 2022 07:38:10 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id b19sm1301187lfs.223.2022.02.16.07.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:38:09 -0800 (PST)
Date: Wed, 16 Feb 2022 16:38:06 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Mohan Kumar <mkumard@nvidia.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: Add HDA support for Tegra234
Message-ID: <Yg0aXq+T5/xsBHRG@orome>
References: <20220216092240.26464-1-mkumard@nvidia.com>
 <20220216092240.26464-5-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+4Gj+4mVOCOhh+mX"
Content-Disposition: inline
In-Reply-To: <20220216092240.26464-5-mkumard@nvidia.com>
User-Agent: Mutt/2.2 (7160e05a) (2022-02-12)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, spujar@nvidia.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
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


--+4Gj+4mVOCOhh+mX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2022 at 02:52:38PM +0530, Mohan Kumar wrote:
> Add hda clocks, memory ,power and reset binding entries
> for Tegra234.
>=20
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
>  include/dt-bindings/memory/tegra234-mc.h       | 6 ++++++
>  include/dt-bindings/power/tegra234-powergate.h | 9 +++++++++
>  include/dt-bindings/reset/tegra234-reset.h     | 2 ++
>  4 files changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/power/tegra234-powergate.h

Actually it looks like I may need to pick this up as well to satisfy the
dependency from patch 6.

Takashi, any objections if I pick up patches 4 and 6 and you take the
remainder through your tree? I don't think there are any dependencies on
this patch 4 from patches 1-3 and 5.

Thierry

--+4Gj+4mVOCOhh+mX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmINGlsACgkQ3SOs138+
s6HwFQ//U3U4yJDxSV+WNOZgkjXYMfeYpULlv/UKfF7HswB9bjOLVnwZag74fYqs
zuqArJbCjA3LcGKj1b1RVfXS2KRylkpuwlhHlTww/LbIdUoHqmheUkr450inewar
Xq25pRt1Yf4TiXzR2T4dXaZ+tTlahYb3jgkQJY+6ycgFVyfzoAG7nqxF65w3OFac
lkLLWsKkMANW9pkBIIkNLQ2TJGoeFRJTri9TXxdzzT9WBhanehytDpdGJXKDWouP
UT8ClHH7KsxG+Yl50BSPi7Aqq5Dr0y1M/H58EFiHo4bmbsDtLuLsCOuDIb2tdYE8
UPOwM2zj8nk/6cL+a7Sr0WfrJFbajqVuBk6Lmo7lah8sfmyRY4dJcpE5+lZ8BQCS
Xjp6yrjfsg0Nwt6PBs9X8aZ3znYvHzhJEe/jvcEYwh7L4SmUVphJORkKwyjgQjaC
CX0Sz+9lDO/a2p1D7oSgIj189kzwKb2qpY0U3hiwlID9rDn8UOQIWjxSmjf4SuzV
RvMA/Jer8s/I4P6No5nWHW0nVaJU8n02NDKmfBMT4UoQIvMjX+6qCXlF9CP6QXxY
euBJJjl7wKnYmwET9Y7wuj56mE3pORSOHmn0Yy/m1rufU1IwXnCuKA3HPe4W72IG
PPZG+qEQSZBAadRU51bonsKhZBd9ntGU5nLz7iuIuVrgqnQZICI=
=c4FP
-----END PGP SIGNATURE-----

--+4Gj+4mVOCOhh+mX--
