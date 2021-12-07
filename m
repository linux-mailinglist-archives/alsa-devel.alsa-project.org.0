Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A762B46B5A2
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 09:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43F3623CB;
	Tue,  7 Dec 2021 09:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43F3623CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638865388;
	bh=vwtNH5xbcKUNEHtd6DMe4z5F0BuWsylXwj+kGXell/M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1AaVgHUyWWhGgcSqk+dpZ0xM33DBx3tOc2D2t9B8iQ9/oI8jOknXl+/wOkd1ibcz
	 cEpTthDumGk+qJls1p9YBUAJX/Amr6tCpNSWRVYORfy3F7cSHA5woeLJnJNCoQS8a4
	 w2ENwpAGoHzKNIjf7ugA9pSVdeRaIjWnjhfZAjWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8EF3F8028D;
	Tue,  7 Dec 2021 09:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24B91F8028D; Tue,  7 Dec 2021 09:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE45F80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 09:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE45F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nbG6E4eX"
Received: by mail-wr1-x431.google.com with SMTP id d24so27913971wra.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 00:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pxADwkKJ3p5GfU561CoF9jqAVhSHXf66cNWzqYkmA6g=;
 b=nbG6E4eX8TwqYxzDoeC0rjXHXy6XkQNAynNdWfawClOCnz2jBIP4KszFlRc2tHF+By
 wup7zBBwH+AQLTDE30XtIHX+hm3/ojhCczie+Fzbc6+cMcFiEEG/zXv+cEgHwOiSEtHV
 iVvH3DYEQCzU49sZ4UQXDHVec0p4KuRTCdvwqx2rfIlShJEbDZ99JpSHvyjfsLDbXUjM
 EcnHP5dZSQYFS62/lolUfdfrrQlQlQtmbnwNg252fVuyRdRl1/AHopDNtRuKlReJaIS/
 OUt5cwR3ch4tkAXToZ90QRvdpjowQynrwoeXIP0GRAKza1ZeavES7sOL4zfiMsJvvhM8
 A1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pxADwkKJ3p5GfU561CoF9jqAVhSHXf66cNWzqYkmA6g=;
 b=tSFsCMj+p8uRjSw4mhWZ4jycxAh80x5GY2F9zTeMHNRLUBoyUjXMHLKiQ+FkBX0TtJ
 e8zvMFmyRjHwGT26QCfcFEN1R7UkDkiGqVEJR4gnXPUoej3g2tRejrLKAwxXJsa0fEHn
 UZlS7o9MaOGwsFWluQm8y8J0a8FUeVxPDqstsoeNi89HQHxjP6LDy7mI3Wpzng72DSgg
 RjlnryAm8MGDikM2EkqFIBgKu5FASU2nFew+5OG0Jl9WEMXvCFFRZUtJo8BjiSg10+DT
 O9jP6XFtNF2eZ/L1kFKJi0iAd/Ortce3Pso4S6n0YSFdjC4wLu1Xx6Uk2whQvAJRZqzq
 wfLw==
X-Gm-Message-State: AOAM530uz9KeBSlGFDkerJcyEYVpKmaNiRBkHtFiXAfNbBjF7Iqp5aTd
 JJZeWuIri7NSDKfh1yB7lQU=
X-Google-Smtp-Source: ABdhPJzPy7c5440OxS9ArVEm6sxiaVulH1S5T46C09W28YC/mpFjCBiG4XMayEp1tmMujWnfGHn6XA==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr48508726wrg.582.1638865303959; 
 Tue, 07 Dec 2021 00:21:43 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id o12sm19366929wrc.85.2021.12.07.00.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 00:21:43 -0800 (PST)
Date: Tue, 7 Dec 2021 09:21:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/3] Fix Tegra194 HDA regression
Message-ID: <Ya8Zk/9n7nAtjvSe@orome.fritz.box>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <s5hy24won6h.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="49TuLyavIf+IS4GG"
Content-Disposition: inline
In-Reply-To: <s5hy24won6h.wl-tiwai@suse.de>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, robh+dt@kernel.org,
 broonie@kernel.org, linux-tegra@vger.kernel.org, digetx@gmail.com,
 jonathanh@nvidia.com
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


--49TuLyavIf+IS4GG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 09:04:54AM +0100, Takashi Iwai wrote:
> On Tue, 07 Dec 2021 07:32:47 +0100,
> Sameer Pujar wrote:
> >=20
> > HDA probe failure is observed on Tegra194 based platforms and this
> > happens due to a reset failure. The series fixes this problem by
> > avoiding explicit resets on BPMP based devices.
> >=20
> > Sameer Pujar (3):
> >   ALSA: hda/tegra: Skip reset on BPMP devices
> >   dt-bindings: sound: tegra: Update HDA resets
> >   arm64: tegra: Remove non existent Tegra194 reset
>=20
> The change in HDA drier looks fine, and the question how to take those
> patches.  If other people can give acks, I can take those to sound.git
> tree destined for 5.16.
>=20
> Or, if anyone else prefers taking those, feel free to do: for the
> first patch,
>=20
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

My understanding is that patches 1-2 are mostly independent of patch 3,
with the latter being mostly a complementary cleanup. Patch 1 will
effectively ignore the non-existent reset on Tegra194 anyway. Patch 1
(and potentially 2) could go into v5.16 to fix the regression via
sound.git, but the cleanup in patch 3 isn't time-critical, so I could
just queue that up for v5.17 via the Tegra tree.

Sameer, any objections to that? Did I miss anything?

Thierry

--49TuLyavIf+IS4GG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvGZMACgkQ3SOs138+
s6HgkQ/+N8u8Xz+5+Ee5hefCCyEjNub0t9cEf0+Tk5v0L2TrMzxSmeHNItD0WBBi
udtQ8EZAti4dd4czN/XGVZRlM5WwLCB6OyDinnP4ORVr9AFQZnsY3ypiJmaeE8Bo
6Kz0bVYlnBCUZEizjETjYdHWz+b8dBKtAykaU7+qDG2Dp+cjx8nUWTvtbb4yMg+I
TvDsGs0tcvJ4KBb0Ryf6rgpxJ4NE/5Vi/qczIsJtqOtiRlw3ktNuvOlw9HmHLG6N
exMCoTxydM2iImudrVjobsHzVrxjMIfFCCmxXmwAAuwJuwechDb4C6eLVTbVag4B
tdv2y44xJXI9zax8PJjahOcyZKu6wuCmckQAoIPYAXgOJNSLGfqTom8iF+vn+vaF
+DbLzjsJOeokOXg47iDDsNQ3ZGRYs2pjArwmQ+A6m0oOGqjl3ucpnzjSxTMTMiaD
p/0qj/KawuoakssmZ0lwVRsy3kO299UDd4DLQ/iQ2sSOOCp20NTnVaHsxmq/3wnD
jkqELDynjSVSM8q7GB1yETfBth6mJfXBXcuMaXLRTlU3nG8tTIyi3/jL908qmZN7
C4bwgD4e7gZ97h9iaCMlihkrO+LFzI7vJyhaaBiITeuA8BC0kerIJYSc2OMJ40Zy
zn+AOY/uo5gx8rh7tVWX9CuWWz2btkKq0zp4/8w9UtAgcM3Bahc=
=Lb4G
-----END PGP SIGNATURE-----

--49TuLyavIf+IS4GG--
