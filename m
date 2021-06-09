Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B084D3A14C2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 14:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D68516CA;
	Wed,  9 Jun 2021 14:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D68516CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623242697;
	bh=3LmDIUZ1wKlG81I+AFVUAzlVq2kCXIgwekcGWmo3BKs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1rKgNxFnOnsm6eFpy26OZUnz1sCnrB1x+t3xmy1aQPKb0wPHZOlBkBhS1/0BcJXr
	 tI3lrwnsonqeZYAO8rL7j3bWjBcmgTHFAqLUPGSmCdArDu/lYqFKg8baLBlN3aHwXh
	 fHKJBCn9mHJkw8b4EKTFmXShx9ZsR/UcAh9WwHrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF818F80116;
	Wed,  9 Jun 2021 14:43:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44D30F8026C; Wed,  9 Jun 2021 14:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E305FF8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 14:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E305FF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pTrySzzH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4B1761183;
 Wed,  9 Jun 2021 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623242599;
 bh=3LmDIUZ1wKlG81I+AFVUAzlVq2kCXIgwekcGWmo3BKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTrySzzH01xRqI6y+qazicvHLm3iUahU9lnsc49IiCQ3YhpFE1MGZmItjImUulTSl
 MTRFsckWs8M5r1tfrx9B1xss2tIBYo7mP9xDz9QvZyyHwxfPhKHCu0uD0+Vm2N03KG
 efqwhhxFl9HaT+aduguKYCqVi7iEE9OxgKF6gM0OROhOMWh178CnByE4KEur/yTy9L
 z/yAapPpoQtCE+lxO14rkrnEpAPHzKFYWUwtlKyoLCarKsKopozI0ezGJdI92mgpV9
 fhAVh/cqpu7lxRpBJ3Y97QebzByy2Ff9nk+bjy8MuaBdEX6s5RC5QZRUtpeoBFkcRi
 DlTmnMxs4axQQ==
Date: Wed, 9 Jun 2021 13:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 04/12] ASoC: hdmi-codec: Add iec958 controls
Message-ID: <20210609124304.GB5052@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-5-maxime@cerno.tech>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Tim Gover <tim.gover@raspberrypi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-doc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 03:23:46PM +0200, Maxime Ripard wrote:
> The IEC958 status bits can be exposed and modified by the userspace
> through dedicated ALSA controls.
>=20
> This patch implements those controls for the hdmi-codec driver. It
> relies on a default value being setup at probe time that can later be
> overridden by the control put.

This breaks bisection:

/mnt/kernel/sound/soc/codecs/hdmi-codec.c: In function 'hdmi_codec_hw_param=
s':
/mnt/kernel/sound/soc/codecs/hdmi-codec.c:504:50: error: invalid type argum=
ent of '->' (have 'struct hdmi_codec_params')
  memcpy(hp.iec.status, hcp->iec_status, sizeof(hp->iec_status));
                                                  ^~

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDAt1cACgkQJNaLcl1U
h9AuAwf6A2ho54/TuWajEspKMKa3Y8mJqdCmq/szJ3u4iWTqPzBREw/Xyol8SXcW
adYBtoSaS/Q6yh0OoY9A33TJwzQKwX4ZYow8t0KEmz7s/snT7Jgz8TUZPDE4ZEZb
hHB/oXRVboMFrY62HeW+SnN/4A3D0ooOalNMNrV3/Abzjm9isJqafRKkj2dr8ymG
7iplj1Rip+CLrhpSUi1ZF8aFTzqO7mckdD2pt/UN6k+aZ2oac65WgHhxOWt2m0q7
Zl0ZPA2J9rTqse01tGxJ2GfVommjEFXKkcZStuzvWN2vfM4En0fdyUsU0hlghy+o
15yz8IgChSQ1PGgdfwwc5YpcBvx2pw==
=Ztwb
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--
