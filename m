Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926B361213
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 20:26:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06FFC1675;
	Thu, 15 Apr 2021 20:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06FFC1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618511179;
	bh=QFc6n6mrzBW9ZGOgEGlQDBI/e9xe98PH5egOqUqFW0w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nN9AxZAbKjGMobXYjFVh+HywjgV9DsIaApCQeDmJP23IPZXWNyKjKleKjdGOlPu9h
	 huUpTtIbPWw1Zr8936csg2wnnpntUQJC1F8qeNkJ0huIMRXAk9arO/5YGqZTwNxmxT
	 QFQLLrsyY/DdLR46acs0qF8+B8A1KI+tHUlLPg34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8145EF800FF;
	Thu, 15 Apr 2021 20:24:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA727F8022B; Thu, 15 Apr 2021 20:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5AE6F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 20:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5AE6F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W+B5Kn8b"
Received: by mail-ej1-x634.google.com with SMTP id l4so38266261ejc.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 11:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5fPp08I3UlNyfyinSIhYDrffZ4XYOOztYLSyb/AqyAc=;
 b=W+B5Kn8bT1hXq8fQjIxUUJinHZr3LbUq2WUDoMixJlYwUwPCHXGNxMUa5qPRIEwRB4
 BdmpSW+DIy8vEwWUk2cOJbjdjaBXJ6fhrm9Y3mLwF6IqTjMsPRek8c2qIc8iS7/MY/uW
 j1dWf6w6/vzI0KuIMOnxBElby3nn5Ex+MQM5aPNJnBN6QIB3I97uC1DJAGlcjhmvkjL+
 tbLVE7WiazPt/GEaAYO5n0fF/UmX88zdGI28cL4HpBCUWkM8mUzb2yL+F1ZLKrISvHVY
 OFldOK3XJHaVSeGRKSlw2Rg+7SrkOfvR4ejTtNznSf5wFFhBB786/DJc6Mvep9srC38m
 xCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5fPp08I3UlNyfyinSIhYDrffZ4XYOOztYLSyb/AqyAc=;
 b=pJZ5BXlGxZBfeLPIPQjK3nrKP2Xw7fvYnfBDtpM7vYGqc8RTcX2E/B/YAl4gNLJgmD
 VxA6otnP1XJXGaoE1Tk7B0ae5PxkDve1Zj+M7hdCVwJ1k0TQplqxrfhoo8yQ0MSjj7B0
 CkGxoAquJ3N+57AZlOvLOXBp7KVZ8eX4ME4g3QlrVRjHMHBVHcnaGk5HNl4PxC/s6Tv0
 PwtR1mMsWyKufC62w+VeX7TY6ZTBFU3Tyn6PW2eYpMVviF0klxd28MSmPDl8uuEzvQES
 LJMe0dnn+IHxucCxRnZB57BLcs2YfHP6hzdBjHA4XhEXOU36o+cWKE5sJDJo2g7nd5ij
 mHnA==
X-Gm-Message-State: AOAM5315l5Kn+93v84wz/7CepPO9lNYdWGieDxOQb79UPAn80ECaadTv
 cSH+BCL7tNOiecmEfIkCe0hdmf+EqY0=
X-Google-Smtp-Source: ABdhPJyrzSbtECmicTM5U3LnlO0oFE+SdFJRbX1mrPMpYMlXvCzCKGepzuYhQB0KZQwQMF/6txWliQ==
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr4824760ejf.25.1618511079365; 
 Thu, 15 Apr 2021 11:24:39 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id br14sm2504035ejb.61.2021.04.15.11.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 11:24:38 -0700 (PDT)
Date: Thu, 15 Apr 2021 20:25:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <YHiFEUUfsn3ni/Uo@orome.fritz.box>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
 <YHh/Y5fXMxm91Ha3@orome.fritz.box>
 <20210415181450.GJ5514@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vTM7E1v7rfE0AEjm"
Content-Disposition: inline
In-Reply-To: <20210415181450.GJ5514@sirena.org.uk>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: linux-tegra@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>
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


--vTM7E1v7rfE0AEjm
Content-Type: multipart/mixed; boundary="9mA83Bn2jGPQcM5+"
Content-Disposition: inline


--9mA83Bn2jGPQcM5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 07:14:50PM +0100, Mark Brown wrote:
> On Thu, Apr 15, 2021 at 08:01:07PM +0200, Thierry Reding wrote:
>=20
> > This seems to break display support on a Jetson TX2 board for me, though
> > I admittedly don't quite understand how it would be related to display
> > at all. Reverting basically the whole series (because subsequent patches
> > depend on this on) on top of next-20210415, I get working display again.
>=20
> Given that we got an oops it's probably just memory corruption
> somewhere.
>=20
> > There's this in the log, which seems to be related:
>=20
> > [   14.671377] tegra-audio-graph-card sound: too many links
> > [   14.799645] tegra-audio-graph-card sound: too many links
>=20
> This looks like an issue?  Or perhaps it's just DPCM triggered...

Yeah, as I was looking into this a bit, I noticed that on Tegra186 and
later the number of links can go up to 72. I'm not sure why this is
wreaking havoc, since presumably the check is there to prevent the array
=66rom being overwritten, but apparently it's not. I suspect that the same
check might be missing somewhere else.

In any case, I came up with the attached. I don't know how good it is
because now the number of links exceeds SNDRV_MINOR_DEVICES, but perhaps
that's just irrelevant and that constant was used merely because it was
conveniently there.

The patch restores display on Jetson TX2. I can look around a bit if I
can find where the boundary checks might be missing so that we
gracefully fail rather than corrupting everything.

Thierry

--9mA83Bn2jGPQcM5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-ASoC-simple-card-utils-Increase-maximum-number-of-li.patch"
Content-Transfer-Encoding: quoted-printable

=46rom ba07d30380492661c8fc2677155c9c6230bae2fe Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Thu, 15 Apr 2021 20:16:09 +0200
Subject: [PATCH] ASoC: simple-card-utils: Increase maximum number of links =
to
 128

On Tegra186 and later, the number of links can go up to 72, so bump the
maximum number of links to the next power of two (128).

Fixes: f2138aed231c ("ASoC: simple-card-utils: enable flexible CPU/Codec/Pl=
atform")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/sound/simple_card_utils.h    | 4 +++-
 sound/soc/generic/audio-graph-card.c | 4 ++--
 sound/soc/generic/simple-card.c      | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_=
utils.h
index fac3b832d982..e318a2d4ac44 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -115,10 +115,12 @@ struct asoc_simple_priv {
 		     ((codec) =3D simple_props_to_dai_codec(props, i));	\
 	     (i)++)
=20
+#define SNDRV_MAX_LINKS 128
+
 struct link_info {
 	int link; /* number of link */
 	int cpu;  /* turn for CPU / Codec */
-	struct prop_nums num[SNDRV_MINOR_DEVICES];
+	struct prop_nums num[SNDRV_MAX_LINKS];
 };
=20
 int asoc_simple_parse_daifmt(struct device *dev,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio=
-graph-card.c
index 0582fe296471..80d065935d9a 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -613,7 +613,7 @@ static int graph_count_noml(struct asoc_simple_priv *pr=
iv,
 {
 	struct device *dev =3D simple_priv_to_dev(priv);
=20
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		dev_err(dev, "too many links\n");
 		return -EINVAL;
 	}
@@ -636,7 +636,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *pr=
iv,
 {
 	struct device *dev =3D simple_priv_to_dev(priv);
=20
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		dev_err(dev, "too many links\n");
 		return -EINVAL;
 	}
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-car=
d.c
index bf5ddf1ea65f..7ac64fef73c9 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -484,7 +484,7 @@ static int simple_count_noml(struct asoc_simple_priv *p=
riv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		struct device *dev =3D simple_priv_to_dev(priv);
=20
 		dev_err(dev, "too many links\n");
@@ -505,7 +505,7 @@ static int simple_count_dpcm(struct asoc_simple_priv *p=
riv,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
-	if (li->link >=3D SNDRV_MINOR_DEVICES) {
+	if (li->link >=3D SNDRV_MAX_LINKS) {
 		struct device *dev =3D simple_priv_to_dev(priv);
=20
 		dev_err(dev, "too many links\n");
--=20
2.30.2


--9mA83Bn2jGPQcM5+--

--vTM7E1v7rfE0AEjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB4hQ4ACgkQ3SOs138+
s6EKjxAAwK5EKxf9bunSxv7mPb4/K8JeCdF8BU72U5AmEymr3PiU1Vuh1oLYFRPq
z2pz+N/8NWFoXDQ4LG8h44u0Dj35sEoWCUCbuKLnjLPVRJPW+dK5b7mETZU9QXLS
khYwpnifmPNFuW3YOLEJQeWyQ9xbOkb2TLc85jJ2L+6u5Yuq1gdYd8uf3bnb5RcB
ms/M0G3twJ3Hoc3j+aa1V/g9zIy8UJV5F5jOFgsD7Rulb53kMfHj3WHr9wbgT9Xq
LH/nLie7U0gcdDEK2poUxLyDDXDqfq9l1Pt9OvXt6Fxto2K+9MfMcABh8jGzXD7J
WZAFcYyQStlLX6kGmjQf04cy9u4j18VCh96y1MUKdgEiLa4L2pYkToHvQdJ6elVQ
tAf3niC6rEK07xdBNpCb5AzwWvOllLTBpBucOWJd661j5oEpDWZe7r7zNqSNcXIp
ax/z45kS6rAArK9UOiteEtCnLBob8FmQppAV+BLInqqjo347+gwG1Yk+JNnBFFnI
P1h5/+mc2YL0i/Gc7Z6LAorw4cs2XHPatqWlsahDATeVADkvyQVWP0D7O+14VV2k
/JB80OPktmUNsWrKaiVjhI5Za1FStGKFbN4nZqCgcFpfWWOhwl+qJuJA7zRXEICY
OuRCjoxg+jfAqr6fUGVJu8TmYlmorlbWRUTC02SyuaV56s49ozA=
=0GRh
-----END PGP SIGNATURE-----

--vTM7E1v7rfE0AEjm--
