Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5380621630
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 15:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6345483D;
	Tue,  8 Nov 2022 15:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6345483D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667917445;
	bh=y5waDTucr8M9senmenVxhrnzP+/dHQm62hUanvGi+9U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luskA1hP44rzLITPeTXITWAqGoCPYBzsgcRZW65BDlzN5345aie7aKkK36qLzGhXs
	 3ErfSB8mfY20dw9BA1TE7mdMnVcXSP2FP4+6f4pxMZo8DBwFl9AHayIqjgXn8lSolA
	 Bc/ghKA14Shn6W0AfdlGSRa3ErIT8JSiSharXldg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB50F800EC;
	Tue,  8 Nov 2022 15:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C33E7F801D8; Tue,  8 Nov 2022 15:23:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81EFBF800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 15:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81EFBF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="agAlO/bM"
Received: by mail-ej1-x633.google.com with SMTP id ud5so39050635ejc.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZnCIJm+9B9Ff3S7OWyd9EMrH+oJEijKOQtTrhJPK+s=;
 b=agAlO/bMjNZS419ehoNlmwo2Y3uNQo3ftrHa5OJ/v85dpmTW2ZHHGQiC/d2IInAH6Q
 bXsfqUjpx6U4PYhKzxvNAGWYqVfyxrpZmgeCp4vXJXchbebK4Z8r9eRU2Lbyh7zP+9zB
 OPgKlTmoMsW0FhFtUQX9eFr+L8Wutp/3Z6x4bOXxO41O/02ThSKw04jJZ9HxbXDgiiaw
 f9LCjvKZ+1HEX5fU9JcsPdqZ1ue6P3KqOfqU4UEb9hhiXtw98Z5puryOztK7QlP/ievA
 NQY3vq9hsbYWxf1oNyy4TwscGpGG4mOTgSH5IJnZxRGOHdRKEkValcr9dgsbQBJoH7SC
 3dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZnCIJm+9B9Ff3S7OWyd9EMrH+oJEijKOQtTrhJPK+s=;
 b=B/KRdvVjkiWYQRAa4bcsgnoZPzR8VpPplaLI5a53CbWRqTAgw8jHsIiSZBNdNCpPWF
 weOHqKV5I9CY6tUProfcIsG9TMYGraR468EAzOSk24hsQPR7zYf39wSy/C9kzCt91lAE
 fUX19f7TOTwdmt1SpnE/7vBR28XPK/ZMZQvYUXehbRmk0OrQGLqmBwq1NXJFTzzUIGd5
 FLlaCblI67Dq8bWmogbsVBAXyP9RaLVE6gxiokg75B9gyTH3cVHJrm75kuXLb4umfuqL
 RPQ/OUvLxVxCbS4VTfgGK0qHV9lKYSzWxH470uEPjSKGDLDPWE+hcgXMoDtD0mWmVpIU
 FTdw==
X-Gm-Message-State: ACrzQf0+9NuGzXgIucW+zX7wr62A63Vws5iNZ79PVHQWDHDHadzK0bKm
 eigmAggzPTHAf5EQwxREAFo=
X-Google-Smtp-Source: AMsMyM7a+rXh6egmJgCV4yYsRFUfXuNmozOuHYPfp6VM6AmrwLU5W5iyiq4aYfT7oDW/qdMpn2to/A==
X-Received: by 2002:a17:907:a46:b0:782:1c1c:8141 with SMTP id
 be6-20020a1709070a4600b007821c1c8141mr54460080ejc.549.1667917380673; 
 Tue, 08 Nov 2022 06:23:00 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a17090676cf00b007ad94422cf6sm4635674ejn.198.2022.11.08.06.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 06:22:59 -0800 (PST)
Date: Tue, 8 Nov 2022 15:22:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
Message-ID: <Y2pmQdxMIHl+vgIj@orome>
References: <20221108111340.115387-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pDY6F3p4Kn966Zak"
Content-Disposition: inline
In-Reply-To: <20221108111340.115387-1-colin.i.king@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org
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


--pDY6F3p4Kn966Zak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 11:13:40AM +0000, Colin Ian King wrote:
> There is a spelling mistake in struct member fliter_structure.
> Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  sound/soc/tegra/tegra210_mbdrc.c | 4 ++--
>  sound/soc/tegra/tegra210_mbdrc.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I sometimes wonder how these come to be since it's an obvious typo yet
people manage to make them at least twice. Auto-completion I suspect
might play a role. Anyway, good catch:

Acked-by: Thierry Reding <treding@nvidia.com>

--pDY6F3p4Kn966Zak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNqZj8ACgkQ3SOs138+
s6FbTw/+L/QE+HdaK/OuuLEzlBM6VWk+gYNy4BeBG5uOqysNd6MzrfjIEG9WS5lE
SKcmYwhnYhBHcXtfvuDM31AwDkfEFSr+p35hzIRnGbUa/MZLxj3ufZad17adgfng
xgjH0L7b3zYsX3+z29syehbF524PKApyURWbnQZNnKfLTmC1vagfOvcEvu5Zq7kz
B4rFKeDjiSkJGcf5JtDh0D1/oFCTkzOgoC03N59AFWt42lHpGHNenZMQghMnvlrw
t4mF03BhREWdSzB2LWpywH237eqtaG1+Ro2gEik9UR32bEO8V4Yb1occYpwilAxm
wKO1uVryVoSgh5DLmzcifM5sWh1IS4QrORdGBXXnC4p5CDuS85Or0NQaou+t/TEa
2Iqyovc8k7+S2CkQXjX7rGROqaG64El59mGDP38IhOuNp3nMcxXLkftOEXxJaxkl
VSdzPmXysgm4hbPvXd6pdmAI6DOmAVYjy7ZgEt6xjVaHwGbjf96vAqPwA/tZtk2h
SFTpCQfgqPt6CRQh/aEC4pdJun9RUUkAWw8GSAz+dX5OBkEG2tRKFTOBDVTxoKM9
0zdxlQfn960VhHeF7Uus6PIgE9rliiN9uPWIHc95UlMkfC8Kqzj2ymAGxbfA90sJ
BheR4Zp0zo0CNTY3baq03zxEYC5/I1hufNFmUy3HhARuRKF/IIs=
=bwz6
-----END PGP SIGNATURE-----

--pDY6F3p4Kn966Zak--
