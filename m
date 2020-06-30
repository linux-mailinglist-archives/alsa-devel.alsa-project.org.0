Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C472420F872
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 17:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631A716A4;
	Tue, 30 Jun 2020 17:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631A716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593531256;
	bh=X9DhlaL3h3M6dHLQYSpCp1s//BjVGMTXEFW1olrYlVY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HlzhENRq2CK8VV+KYcWVgJFIKWO1wFZrZyAL8reWkBc0jUc1Lv8akC2/MIOHVAAbz
	 DsnMQmyw2LALS1KMPj15AUTFbEKVdTpm5LaSAkhR6YhxqcqE4cz8Q6EjK20mFBP1vP
	 CZO/IxMEoTHS2UFZDyvkVfsDK4GEb0LEDS7FNlGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B08F80135;
	Tue, 30 Jun 2020 17:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 820D9F801D8; Tue, 30 Jun 2020 17:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67E29F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 17:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E29F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cGmgcwpj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72B5D20760;
 Tue, 30 Jun 2020 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593531143;
 bh=X9DhlaL3h3M6dHLQYSpCp1s//BjVGMTXEFW1olrYlVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGmgcwpjkbNw52cCa7kRC/GPrkFsOqVEstQkyXvVZSV5xfX3TDwLBGaCURvEU0t5J
 025muooT8Nw9JkjVoawTY13UY5CS39I1DCSxV8E++nanIFjyfYf2b5mkS5P4oQgLsh
 spZcFcj44mNzi0dHHjyA82NYyDTZtJ89hsbkAFBI=
Date: Tue, 30 Jun 2020 16:32:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link
 with multiple Codecs
Message-ID: <20200630153220.GL5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
 <20200630110100.GH5272@sirena.org.uk>
 <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9/GiYV45wF7IL3Iq"
Content-Disposition: inline
In-Reply-To: <81d106c0-e1c8-a79a-8caf-1f3be0d61f0c@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--9/GiYV45wF7IL3Iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 06:23:49PM +0530, Sameer Pujar wrote:
> On 6/30/2020 4:31 PM, Mark Brown wrote:

> > Why simple-card and not audio-graph-card?

> Frankly speaking I have not used audio-graph-card before. I had a brief look
> at the related binding. It seems it can use similar DT properties that
> simple-card uses, although the binding style appears to be different.
> However I am not sure if it offers better solutions to the problems I am
> facing. For example, the ability to connect or form a chain of components to
> realize more complicated use cases with DPCM, some of which were discussed
> in [0]. Can you please help me understand why it could be preferred?

> [0] https://lkml.org/lkml/2020/4/30/519

It's the more modern thing which covers everything simple-card does and
more, I'd expect new development to go into that rather than
simple-card.

--9/GiYV45wF7IL3Iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77WwMACgkQJNaLcl1U
h9BoOgf8CqlyK9s07Hb+/KSOYbf63ZpZ3dwuHoWv8+gtnKh+DZIH3KN07uHzVHXw
q3NUE8wJkGfYijU49aUjB5lRw4KNjXtAUMUHNAKlzmjQM+cxlEj6nZOGWAFrHyYo
0rzPMLRbmsHTp9dcKdr7c/AXqYB8vgW+aYo6j76+W7fNvgW3thQllyW9ZKkvzQmz
7TePVknBmz5ov6rTQSau7p314ZBcJEYL74ANMr0LxKKe5TSv/xHLQM9WeEDdkMUE
kELoYHwZrWvOFUfy1nCl+uPqvUr+ciJD5gW5+PQvKnV0nAaVA2jW0RE3KMWKRu/S
PZJLfFNr7vFTIsIU0YMidjDYelIA0A==
=8bSR
-----END PGP SIGNATURE-----

--9/GiYV45wF7IL3Iq--
