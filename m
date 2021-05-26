Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3EF39152C
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 12:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE63174C;
	Wed, 26 May 2021 12:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE63174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622025636;
	bh=TMe0IyJS6cQ+Lq2HcNsTfT78sP/9ZGYPAk05niLZNeM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+VrKlqldbI/QaUqCWdIrH8oiEVdUg19DzSaXSGkcIT5gZVSAyN/e8Cj+sA3kKquh
	 gXatB5LUqiL8YTLxlGDcaRsB3N6yvQ8AwgOhk5UjfHV0AQOp2L7evIfFgKTgut3+Tv
	 3DpgUVt8hl+Q4K3uh+tnrzEGiu0InsWPvCdfnDJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2E28F80300;
	Wed, 26 May 2021 12:38:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E39EFF80425; Wed, 26 May 2021 12:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BD1F80302
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 12:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BD1F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ueVfX9lZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMe0IyJS6cQ+Lq2HcNsTfT78sP/9ZGYPAk05niLZNeM=; b=ueVfX9lZTHGcN+dDDycF9mQOdz
 iTPADjKo7qvHBeqyQkPRQjiKTc6yInxBCdzMcVMZ5IPGCSL7M/Bu5GCY0y7NBhPOcReo4cuyktI+a
 Lr+1b3l5uwbjLFKWwUZjAVSdl+pRuKIKUO7DDHwl1NDxUoBwdo4cda5SMSnbQtSf11mw=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqw2-005xmf-VR; Wed, 26 May 2021 10:38:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 49705D05864; Wed, 26 May 2021 11:39:21 +0100 (BST)
Date: Wed, 26 May 2021 11:39:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 05/12] ASoC: hdmi-codec: Add a prepare hook
Message-ID: <YK4lWaB6Lx+SPjpF@sirena.org.uk>
References: <20210525132354.297468-1-maxime@cerno.tech>
 <20210525132354.297468-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wI7EtUudqJM9+3Oj"
Content-Disposition: inline
In-Reply-To: <20210525132354.297468-6-maxime@cerno.tech>
X-Cookie: Ahead warp factor one, Mr. Sulu.
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


--wI7EtUudqJM9+3Oj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 03:23:47PM +0200, Maxime Ripard wrote:
> The IEC958 status bit is usually set by the userspace after hw_params
> has been called, so in order to use whatever is set by the userspace, we
> need to implement the prepare hook. Let's add it to the hdmi_codec_ops,
> and mandate that either prepare or hw_params is implemented.

Acked-by: Mark Brown <broonie@kernel.org>

--wI7EtUudqJM9+3Oj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuJVgACgkQJNaLcl1U
h9CRRggAhsstIqtcqC4EquItefHkzTS9v8kbwvJytct/Q8VBhXpc7T0EkxWdaCxn
s+7PulshfFDvB24KxgJcIs+bHVkn+e0dvfDLkjSd7RO+nGcIwnccOUzCJ2CX7/qS
++Q7uUsY8Ne55NUPIfMpubv32SIHaYeCHglZjHKaHNpsM58ANdTAN2Sl2PMJs3u6
phAyak9G80MvU5cjMto9WmV9zyGZ6uobiGH4qjx8wzO+71RuSMwCKVF6EZ/mdg26
8XLOMvwo44jmHGWCduFH3mdVtsPi89Tblv3wNBrLlwMjZhJ2AiEqssq67lKCbKF5
tvl87wk9yeLVRB/BD43Vpa3DajNrrg==
=7TgH
-----END PGP SIGNATURE-----

--wI7EtUudqJM9+3Oj--
