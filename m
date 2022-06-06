Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A253E5A0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 18:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456BD1A22;
	Mon,  6 Jun 2022 18:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456BD1A22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654531790;
	bh=VcnSGVYbTblm760SjoQqgE9wkQ5/rRfgycH6HwRHJBc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G9VdbFc1e72GyYISpA3cn2RuupUEyC/ZsX2UJS6CfnbQ3+ydaVKdSok2Z1lso07FH
	 VaB9H5kZPkuqtbzLuy/su1zSKNibiqKkEfJBOtd4nmmHghRh1Ua3es9t6AIsXDeKai
	 +MUMVHPDwnccu2rECrv75zVLpQFcBj34gmroTK3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA9C9F80109;
	Mon,  6 Jun 2022 18:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F16DFF801D8; Mon,  6 Jun 2022 18:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5F71F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 18:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5F71F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+beBwDx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18E9F60B69;
 Mon,  6 Jun 2022 16:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B34DC385A9;
 Mon,  6 Jun 2022 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654531721;
 bh=VcnSGVYbTblm760SjoQqgE9wkQ5/rRfgycH6HwRHJBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V+beBwDxRnKh4QQe2VqHO65haLEa4SFcYqmwQ5ha8+WUYCaxluVJVO3WScGsMh7p/
 yCfF9SVghYkLIH6xbuY7EblAx0+pw2kCeFY+U8r5aYiYId7tg1gWkBet3TOBYGLIQT
 PcGrSh8CCrUG5ygkR02Frlr2vLWxWu4elm2N6km6BG/SAlnAB2hA9vt/LQe6X0dQsB
 l9+KnyRf/Tk2tZ0WgxX6uJlruPDsrpmtYtQVC3nbp0WKqm9tlPjhyXCBWfx3JGBLic
 6DN4asOH0MIrEIiwReQNoKx9++AZ6UztiGOM76QW95uzWgz6z9uoC1ZFVsS5+hc9Y0
 yB6c3lFfV6NaA==
Date: Mon, 6 Jun 2022 17:08:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v5 19/20] ASoC: mediatek: mt8186: add machine driver with
 mt6366, rt1019 and rt5682s
Message-ID: <Yp4mg3ObzfQJ3FgP@sirena.org.uk>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
 <20220523132858.22166-20-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9rL9qmwu0rrfH0q3"
Content-Disposition: inline
In-Reply-To: <20220523132858.22166-20-jiaxin.yu@mediatek.com>
X-Cookie: Zeus gave Leda the bird.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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


--9rL9qmwu0rrfH0q3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 09:28:57PM +0800, Jiaxin Yu wrote:
> Add support for mt8186 board with mt6366, rt1019 and rt5682s.
>=20
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c: In function =E2=80=98mt8186_da7219_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c:58:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_n=
ew=E2=80=99
   58 |         ret =3D snd_soc_card_jack_new(rtd->card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-da7219-max98357.c:15:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c: In function =E2=80=98mt8186_mt6366_da7219_max98357_hdmi_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.=
c:161:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_=
new=E2=80=99
  161 |         ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_J=
ACK_LINEOUT,
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-da7219-max98357.c:15:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/medi=
atek/mt8186/mt8186-mt6366-da7219-max98357.o] Error 1
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
: In function =E2=80=98mt8186_rt5682s_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
:61:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_ne=
w=E2=80=99
   61 |         ret =3D snd_soc_card_jack_new(rtd->card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-rt1019-rt5682s.c:17:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
: In function =E2=80=98mt8186_mt6366_rt1019_rt5682s_hdmi_init=E2=80=99:
/build/stage/linux/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c=
:137:15: error: too many arguments to function =E2=80=98snd_soc_card_jack_n=
ew=E2=80=99
  137 |         ret =3D snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_J=
ACK_LINEOUT,
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/mediatek/mt8186/mt8186-m=
t6366-rt1019-rt5682s.c:17:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/medi=
atek/mt8186/mt8186-mt6366-rt1019-rt5682s.o] Error 1

--9rL9qmwu0rrfH0q3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeJoIACgkQJNaLcl1U
h9CFwgf9G5LGVON0H/dhjgLQ816wyvWWAsYE0+WxJJpawHUSAJG6kzTYC82FZhmg
sKZTDn6T5jUPGtP/wzWpE+EzcUyUds+Uo6QzoZ4rqzYCEid76p5sksmT5oGdmn8R
HaQSkTKIWF6OprneORmZda8SBV+UcpqScD8irzR1x5V/ZAxo7BRqfOw3ZiTcz8Ru
RgJf+UcRdUoECGjsxBl0yA4BLMfk6Bt8SDPr/KG5J4mkdFxzRwZCz68nyWdt0CFE
FDU1KIBy/P0Oy5eyMdw1n+gT63rWT2swrBcjfanH+HML8cj4Yo63Fl7wMxA1C+WN
ZB/b3z4o7yvK/wM7PbzvknzAm0536w==
=91r5
-----END PGP SIGNATURE-----

--9rL9qmwu0rrfH0q3--
