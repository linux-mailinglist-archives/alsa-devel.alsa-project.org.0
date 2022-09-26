Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D75EAEF3
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 20:01:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E03420B;
	Mon, 26 Sep 2022 20:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E03420B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664215305;
	bh=2P8o7fzQArNIzh8sTaJO8XJRpUqu7FFecWPaie4lruI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dn1Hazs6a77E9xl+Pbkwnk2rtAhkvrtEv3FyTN6Spu5/FcjJslHp4h+Kdgk+qxRrB
	 /MtsvI7rOdmffqIs6hlg1swuvQqDQR6Z+FWh+dMIwQAMcYf3sfpDBWKv1OwbivKN5m
	 Ylf0ZBASOmhmnsvQ57rWGgc5YH3oPrkldtAs21D4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B84F80254;
	Mon, 26 Sep 2022 20:00:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A901EF8011C; Mon, 26 Sep 2022 20:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67858F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 20:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67858F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S3EToam7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C562FB80BED;
 Mon, 26 Sep 2022 18:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8910CC433D6;
 Mon, 26 Sep 2022 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664215240;
 bh=2P8o7fzQArNIzh8sTaJO8XJRpUqu7FFecWPaie4lruI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3EToam7vquTYIXWEcI4h8mD8xcgyvReIfut1N7A9X18wgU9bOE+ZDx7FhSTV350N
 Fwc/gS5A0zcu8i3Mm8ECsA6WZNafnO04ltTZoQC5VSBJXk+5Un7V4L7KaZG826P6r/
 BBL2FvRW6EFfs/2Tp/TMPvltQlL+L2YmS5AS5jXnT8sqixkDzSnrMVxcKUdryr3eOI
 jTiyZIRw1wlbBy3BL8FZQDDHy3e22khm+reJZaPMC0ivQZZknYdIE67DRcp46xxxGx
 QtSuXzjoyLcuWCOkhHqklAcVRA0fgkTTULE2Y09VatbSuocnLAAkwWp8/7Ua8uKax+
 csgF5GzbNaHqQ==
Date: Mon, 26 Sep 2022 19:00:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 09/11] ASoC: intel: Replace runtime->status->state
 reference to runtime->state
Message-ID: <YzHows+lDZV5F0eu@sirena.org.uk>
References: <20220926135558.26580-1-tiwai@suse.de>
 <20220926135558.26580-10-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r/CdnkdVQhqamxWH"
Content-Disposition: inline
In-Reply-To: <20220926135558.26580-10-tiwai@suse.de>
X-Cookie: You may be recognized soon.  Hide.
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--r/CdnkdVQhqamxWH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 26, 2022 at 03:55:56PM +0200, Takashi Iwai wrote:
> The recent change in ALSA core allows drivers to get the current PCM
> state directly from runtime object.  Replace the calls accordingly.

Acked-by: Mark Brown <broonie@kernel.org>

--r/CdnkdVQhqamxWH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMx6MIACgkQJNaLcl1U
h9Atnwf2Pl4CC+M/jO4bZv7lvKMvv94JI/GJuZUkq0hPdpuT40Keqf9heFmx/aJg
xFdJhHm6snjROKaz1uwq03mDkAKFF7b0o/bGJez1t/cATp0xQBWRNfe6jqo1OEIV
JeiFNVFJCwqQ2p9zVpXMCUvGgLXB5CnsykwfeWpzxTFODMrW48kl58LELA6wVrbg
wnXjXVhgwEEz14BHUCzkvEVOwM7JwQhJDnLI15Qb59CVlwjB+jDsmNRN6mlWssXv
wDxaawiMwp79IH1fKPPmvEJNeOr3YL4RNDWKT4QwYlaY+SCNxf+YUjNCm0OewZOS
3RvLxAiBRxZ+UTcMe03uZzhfPt10
=1jq5
-----END PGP SIGNATURE-----

--r/CdnkdVQhqamxWH--
