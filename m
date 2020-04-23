Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A71B5A02
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 13:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27A81699;
	Thu, 23 Apr 2020 13:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27A81699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587639989;
	bh=tBjsKKzMxTUfGVyJhOJtQEHqkY2vpIFIBNWq9vVPHeg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHEVk+7zNlVMS/rHojfHvwbaD/0Xsls08epq5bW2GhPkaFxAY/v3J/ml/Y+w93Fxv
	 f6ccZXIkOqX37V4pCgNy1xOCKDNg5H26QGp3QqUvO7HuzNrJp5Ph+3etcR/pUV7sis
	 sDhGcLrG3RhrMyZLq8vwraELwKJ/+qWEK+9keojE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD16F800F2;
	Thu, 23 Apr 2020 13:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18E68F801EC; Thu, 23 Apr 2020 13:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F764F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 13:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F764F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rAjuMThv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 756582076C;
 Thu, 23 Apr 2020 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587639880;
 bh=tBjsKKzMxTUfGVyJhOJtQEHqkY2vpIFIBNWq9vVPHeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAjuMThvn8W9rGGct0O77oav5ngHlQwudWONPJXoOY4J9SiZOOTpmaK1flPKg8ImJ
 omQ0KfErcp6cnkNdu0eoTSXHbkYzJuJRO3Mm9AiZrifDmdSpKK6/n4MlNkBilI3J7f
 VR7bKKXPSp6ruZiZEHsvlnPIVw6bDVyj7aOfMUXI=
Date: Thu, 23 Apr 2020 12:04:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: ASoC driver names
Message-ID: <20200423110437.GF4808@sirena.org.uk>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Content-Disposition: inline
In-Reply-To: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2020 at 07:04:36PM +0200, Jaroslav Kysela wrote:

>   I am fighting actually with the ASoC driver names. The current situation,
> where each hardware variant (card name) is mapped to the driver name is not
> very practical (and not correct). The driver name should describe the common
> part (usually the controller - like 'HDA-Intel' or bus 'USB-Audio').

With ASoC systems there is no clear controller - you've got a bunch of
different components, usually connected by separate buses, and it's not
super obvious what if anything should be the singular name that gets
picked for some grouping of devices.  The whole point of the subsystem
is to glue a bunch of independent devices together, we've generally
picked that glue as the driver name.

>   I am talking about the situation, where the ASoC card name is set via the
> device tree (snd_soc_of_parse_card_name) like in [1], but the change may be
> considered for other drivers like Intel SST:

> Card driver name: Lenovo-YOGA-C63
> Card name: Lenovo-YOGA-C630-13Q50
> Card long name: LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216

>   My question is, can we change / add the more apropriate driver names
> conditionally with a new kernel CONFIG option? Will you accept this change?

Without knowing what you're actually proposing it's hard to know, and
there is the risk of userspace breakage here when you change things
people are relying on.

>   The goal is to group the related UCM2 configurations and do the required
> split inside the UCM2 top-level configuration file based on card components
> string or other card identificators (related to the driver).

This sounds like you either want some enumeration of the card components
or perhaps you're looking for some for some indication of the reference
design that an individual board is based off so you can have a generic
configuration for that reference design and then override bits of it?

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hdkQACgkQJNaLcl1U
h9Aiwgf8DQSaA532iTxpomKwEqr/ViWQmXoUprIRF/Mrp31QmVngzTWpQzy9raCT
2VBPYa92waXVujNsy3l34NhjpiN44VuAm+p8ynT52kau1B9bVe3sVnYwh2veei5A
tz9s8d5FkyGCT8ShzdF0NR/WXGl9113Pq3LIh82exprBF3PmnpDEZMONvy8UtC2r
gTxUQRnJiGKHEHdYcSZaigBaPGyL0AcwmvsikNOxvyH7veaKC+y6IoQWy7uOQBaV
JRSbMvAzzjNm47DXm3bv9XWj1ocmntzoApySkOLAvVGumwAFBOAC3CEm9QGRgxyC
W2iBGMhY2BBtPzV38JnqNlqHDpHilw==
=1h6w
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
