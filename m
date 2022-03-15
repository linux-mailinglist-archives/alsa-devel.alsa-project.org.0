Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48934D9C00
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759B01743;
	Tue, 15 Mar 2022 14:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759B01743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647350203;
	bh=UseLGcGOm/pva/SYnye9j1eMFLi438hMBLmXnU/SEmU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IniVkG438fWAEughPCdqD097XbmT1eLgcCFBFVGYDvOQ9pZ4vDip/y1AxLU+cZZyX
	 1PhaFwIEiJXLlaryrbkGxOxR+yJ1ZoNqZWxKTvEkFBAqnDeoD841bbpozXZnr5I4KV
	 5T2wy7S2cmhxnFB+5HdyEcizk4PQxbQ8/WjWodE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EF7F80162;
	Tue, 15 Mar 2022 14:15:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DD47F801F7; Tue, 15 Mar 2022 14:15:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 255ABF80095
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 255ABF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I/6ksWqt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38BF0615C6;
 Tue, 15 Mar 2022 13:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A97EC340E8;
 Tue, 15 Mar 2022 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647350123;
 bh=UseLGcGOm/pva/SYnye9j1eMFLi438hMBLmXnU/SEmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I/6ksWqtcBc+GFZBAsCSt7uqXHjc02cvBcR93rZ58hH1iHPxtHAy9ziZBY0wZZwkC
 LnhvnWFZLyhFxFQRXO2z4lzF1f+FfJKArX8vnTekK3m43Xk271wUamIHMB1SSHaiDJ
 7YU5b+ZLoXA9cxjph4jnSB3sYg9yKnlr0qGDUhOtbL9EctztbABkd/3keiW2QRIKCe
 TjGvcYTff3RATNurjgiocg/Wbn70SDooQjKZMbbvpXNBSwhETLKfM5Bo0drySRmlxe
 hAjl3RSbAuGM6YLbyZJGEoCeklflvLjXCb06Escm5Vi7Y0mdz9SocJgDmCJ10luQD2
 lCEmrQqHK7lxQ==
Date: Tue, 15 Mar 2022 13:15:17 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [v3 10/19] ASoC: mediatek: mt8186: support tdm in platform driver
Message-ID: <YjCRZTu8AkYI0JVR@sirena.org.uk>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-11-jiaxin.yu@mediatek.com>
 <3c7c6e67-072c-6377-05bd-1b5baa579666@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l81KvQLrUFtHOxoG"
Content-Disposition: inline
In-Reply-To: <3c7c6e67-072c-6377-05bd-1b5baa579666@collabora.com>
X-Cookie: Tax and title extra.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--l81KvQLrUFtHOxoG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 11:39:11AM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> > Add mt8186 tdm dai driver.
> >=20
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 695 +++++++++++++++++++++
> >   1 file changed, 695 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> >=20
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/med=
iatek/mt8186/mt8186-dai-tdm.c

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--l81KvQLrUFtHOxoG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIwkWQACgkQJNaLcl1U
h9Bgtwf/RH2c0IQZVoBoFn8poE9HNrcM4ygfZJzlVBNxt9YQYh0qv/JjP8SsDxX7
V7A0sxQKGv73G6memlblfku6BE/MGVExc2siRVrmGAHnGD2dAuszueDp4XS4mrA6
eeKUvgHb6a3eV6fK/ELkpGTN++EHeypOx0MmZ4QqNS4L7ZKImNq+d44g+NTGervs
3Bsuec4/q7EJOKo29k/FwCfROip7uXzbpnjMsFxw5DFxrV4rATzpT+CqrgtqDs4m
bPlk4/BaDQyEdijcsMtgkh/UqSS5pUcxWnpB3dLanBJ3i82HVLjLh184VzRi+/3k
N5Wpe8EHd91mUjff+MRKzjD57IBd2w==
=RzsX
-----END PGP SIGNATURE-----

--l81KvQLrUFtHOxoG--
