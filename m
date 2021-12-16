Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64804773BE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 14:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7282E1F3B;
	Thu, 16 Dec 2021 14:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7282E1F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639663024;
	bh=KUcpu/ar1Qug4/FEYAMKSvebZTnh12cY5cmzfFmN4sI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RcH/4yNEKzqoMrEKY5t+f3SM08keXCda5GvvI/CwJgDz2K6xP/ZQFPxR0QHZ9331d
	 8cYY+rLO9nkqJZBpgQi89gunx/RztEJoWtmjIEwUVt6jXneDEQxeWiiOakxsoOSV7k
	 gsIvUolXQCtvz1T4IfFPZOUrXKoW2RduVsPXWZuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBBBEF8015B;
	Thu, 16 Dec 2021 14:55:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C83BF8014C; Thu, 16 Dec 2021 14:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD492F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 14:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD492F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bjHYxaWs"
Received: by mail-wr1-x42f.google.com with SMTP id o13so44272255wrs.12
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 05:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aIGXePb6uuyKEdP5anINB0mi5RZTL/ymGbXYta94nJg=;
 b=bjHYxaWsg+7VcP+S4a+QdmgpyK+6giwYoL5QN0eYIcY0V3HuSWIlmByyu0OxeXBODk
 i6QahJMgbb9jvsHn4Y16iSWbXxMwWTeJerl2YSnw0DYeyAFR6Ad4zadmrPktHC+GO8Xy
 m4gPrdna4pb75f55JeaKELoI40ylmCdcis8rep/nAhZC829Mgqi2FLkn69mjeog14CmS
 YoByKy46N2g9Svw59t1GnVD7YBgujN6sc0FwP7v9DMZFooBcZ/0jlxYqmdjIVwFupwr9
 QGq+P0nwEzWlpB5Hpp66E+Imn9aTOL56Ns9n+EdFz+8hLHGUMFQoUIQ7eqq2aT8FPjGH
 7WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aIGXePb6uuyKEdP5anINB0mi5RZTL/ymGbXYta94nJg=;
 b=N8T27/X4xjO1DBKO9NDuEyK1sX8NcLL8b9FPIUcQXBZHf18VQph9XpG/06WHS40Yd1
 r6Q731wg8q2ZunrIpCN78dUWDPRtsFFmeAl9+3OzWNzVM6dOz+kE2dZStQK3v+ioNyQe
 /a9Y9AT/xcOz4xEL++0XjAYMrLqCxSQoKFT56WmS5ef6BM76M+0+MnIcMdNWw0z4SoC0
 su/871DbyV2F8HbnuM8cpkj+pDvZnsz6irRdi8XxC2N3rZcUqKrm798WdWyyA6pGDMZV
 +d3t70MPrA1kZDoK617uNNz4DTpbpxjBpBVLvBbkHS8NWNkTI+y4d7CJhm3MMzNu8nSn
 H7Jg==
X-Gm-Message-State: AOAM532l9ILuhlJkixmXwM3E+AGwqZEMoG4YAfqYsgUu+TeeG4tyzMRJ
 hpk6onxMXWd/7rPj5YIw5q4=
X-Google-Smtp-Source: ABdhPJw0BU7321M+NuHBlUDUl4qArnbnLCrw+1dI3O/QNXo8FyEsKyCBlFIpPZ72vmTMhlcW35T0jw==
X-Received: by 2002:adf:f049:: with SMTP id t9mr3324177wro.399.1639662946541; 
 Thu, 16 Dec 2021 05:55:46 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id b19sm9049101wmb.38.2021.12.16.05.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:55:45 -0800 (PST)
Date: Thu, 16 Dec 2021 14:55:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
Message-ID: <YbtFXcteESF0nLZz@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/kZ9M+KZOl3BGf8Y"
Content-Disposition: inline
In-Reply-To: <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--/kZ9M+KZOl3BGf8Y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:19:07PM +0300, Dmitry Osipenko wrote:
> 15.12.2021 21:57, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
> >=20
> >> I based S/PDIF patches on Arnd's Bergmann patch from a separate series=
 [1]
> >> that removes obsolete slave_id. This eases merging of the patches by
> >> removing the merge conflict. This is a note for Mark Brown.
> >=20
> > That's not in my tree so I'll need either a pull request with the series
> > or a resend after the merge window.
>=20
> This patch is included as a part of this series, please see the patch #6.
>=20
> I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
> but there is no stable branch there.
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?=
h=3Dnext
>=20
> >  It's also not clear what to do
> > about the DRM bits, I guess it's probably easiest to just apply them
> > along with the ASoC patches.
>=20
> I already asked Thierry Reding to take a look at this patchset. He will
> let to you know how the DRM bits should be handled. Hopefully this
> should happen tomorrow.
>=20
> We will know how to move forward if Vinod and Thierry will reply ASAP.
> Otherwise this series will have to wait for the next cycle.

I've applied the DRM patches to the drm/tegra tree and pulled in the ARM
device tree changes into the Tegra tree. I think the rest can go through
ASoC. Well, provided you can sort out the patch 6 issue with Vinod.

Thierry

--/kZ9M+KZOl3BGf8Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7RV0ACgkQ3SOs138+
s6EvjBAAt2FOUdF0TCSDCaSEKSFVQrAri9CBbbbCiohF9acoD/UG+pUtEe3MxqPD
sRbw0FT1mRbb374jZJOpJG95FQBT3+41QoAbXFB5cVbFCoJDRuyC3dzS738KZYw8
VYoWzTRt2wu247ZYsg6YSc6sAYwO9+GPkKU1CCoDJDlr/jLcof5qJVFXsIRwnjS9
5Qh8y6OiFFrPjlx3PVzPDFY1iYapzCsHTDr3WHKH6VymPo56oxZ/lRHHAnwlDqqC
K2YyGsk+4K0kzB2jokNyMqI2P2ZkDcfKVhMDIE0Zt9F5tf46WQrU3FMgaZ4bx6Rr
mglBqX6d9h8dmVYKWO0/cJLx1TTAMjemnmzM27UOK3xCyheqV+gZ9sEF06pVXP9Q
vxG3Z1ETQB4Tgp4dWLTg4eJmPyvCy/Kl9lTLckV9UQtY3VC1Ig65tZCC5qVZAeBa
627H99VkSbq6eNA6nmCQv3YI+tNuEraAMdQWvbHEmssemjDPiU5ZB7K6Le8PjfEU
wzLSUWPXXcjBQFC/SfGkKxybEQXEcvH7rfEGGOkgxsuSuHM0UR1qzFTPiS6KI+IW
q7EQKFoIE4dOnUer0rZ7fJwlZ5DequydnphOU/ao/Qd51dOaTSxHNDlRXzK92VO7
9EgsrZ/6V8DnYLrzcnF35zpN1rmA9gobNyTodowf/96tvDPF+0c=
=uSDP
-----END PGP SIGNATURE-----

--/kZ9M+KZOl3BGf8Y--
